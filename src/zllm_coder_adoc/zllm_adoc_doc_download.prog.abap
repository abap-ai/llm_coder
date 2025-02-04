*&---------------------------------------------------------------------*
*& Report zllm_adoc_doc_download
*&---------------------------------------------------------------------*
REPORT zllm_adoc_doc_download.

* Selection screen
PARAMETERS: p_config TYPE sobj_name OBLIGATORY.

TYPES: BEGIN OF ty_package_tree,
         package    TYPE sobj_name,
         parent     TYPE sobj_name,
         level      TYPE i,
         full_path  TYPE string,
       END OF ty_package_tree,
       ty_package_tree_tt TYPE TABLE OF ty_package_tree,
       " Add this line:
       ty_sections_tt TYPE TABLE OF zllm_adoc_doc_s.

DATA: lt_header      TYPE TABLE OF zllm_adoc_doc_h,
      lt_sections    TYPE TABLE OF zllm_adoc_doc_s,
      lt_pkg_tree    TYPE ty_package_tree_tt,
      lo_zip         TYPE REF TO cl_abap_zip,
      lv_xstring     TYPE xstring,
      lv_main_pkg    TYPE sobj_name,
      lv_filename    TYPE string.

*&---------------------------------------------------------------------*
*& Start of Selection
*&---------------------------------------------------------------------*
START-OF-SELECTION.
  " Get all documentation headers for the config
  SELECT * FROM zllm_adoc_doc_h
    WHERE config = @p_config
    INTO TABLE @lt_header.

  IF sy-subrc <> 0.
    MESSAGE 'No documentation found for this configuration' TYPE 'E'.
  ENDIF.

  " Get all documentation sections for the config
  SELECT * FROM zllm_adoc_doc_s
    WHERE config = @p_config
    INTO TABLE @lt_sections.

  " First, identify the main package (one without parent package)
  READ TABLE lt_header INTO DATA(ls_main_pkg)
    WITH KEY obj_type = 'DEVC'
            upper_obj_name = ''
            upper_obj_type = ''.
  IF sy-subrc = 0.
    lv_main_pkg = ls_main_pkg-obj_name.
  ELSE.
    MESSAGE 'Main package not found in documentation' TYPE 'E'.
  ENDIF.

  " Build package hierarchy
  PERFORM build_package_tree USING lv_main_pkg
                            CHANGING lt_pkg_tree.

  " Create ZIP archive
  lo_zip = NEW #( ).

  " 1. First add package documentation
  LOOP AT lt_header ASSIGNING FIELD-SYMBOL(<package>)
    WHERE obj_type = 'DEVC'.

    IF <package>-obj_name = lv_main_pkg.
      lv_filename = 'index.md'.
    ELSE.
      READ TABLE lt_pkg_tree INTO DATA(ls_pkg_path)
        WITH KEY package = <package>-obj_name.
      IF sy-subrc = 0.
        lv_filename = ls_pkg_path-full_path && '/index.md'.
      ENDIF.
    ENDIF.

    PERFORM add_to_zip USING lo_zip <package> lv_filename lt_sections.
  ENDLOOP.

  " 2. Add function modules (grouped by function groups)
  LOOP AT lt_header ASSIGNING FIELD-SYMBOL(<func>)
    WHERE obj_type = 'FUNC'.

    READ TABLE lt_header INTO DATA(ls_fugr)
      WITH KEY obj_name = <func>-upper_obj_name
               obj_type = 'FUGR'.
    IF sy-subrc = 0.
      READ TABLE lt_pkg_tree INTO ls_pkg_path
        WITH KEY package = ls_fugr-upper_obj_name.
      IF sy-subrc = 0.
        IF ls_pkg_path-package = lv_main_pkg.
          lv_filename = 'FUGR/' && <func>-upper_obj_name && '/' &&
                       <func>-obj_name && '.md'.
        ELSE.
          lv_filename = ls_pkg_path-full_path && '/FUGR/' &&
                       <func>-upper_obj_name && '/' &&
                       <func>-obj_name && '.md'.
        ENDIF.
        PERFORM add_to_zip USING lo_zip <func> lv_filename lt_sections.
      ENDIF.
    ENDIF.
  ENDLOOP.

  " 3. Add remaining objects
  LOOP AT lt_header ASSIGNING FIELD-SYMBOL(<object>)
    WHERE obj_type <> 'DEVC'
      AND obj_type <> 'FUNC'.

    IF <object>-upper_obj_type = 'DEVC'.
      READ TABLE lt_pkg_tree INTO ls_pkg_path
        WITH KEY package = <object>-upper_obj_name.
      IF sy-subrc = 0.
        IF ls_pkg_path-package = lv_main_pkg.
          lv_filename = <object>-obj_name && '_' &&
                       <object>-obj_type && '.md'.
        ELSE.
          lv_filename = ls_pkg_path-full_path && '/' &&
                       <object>-obj_name && '_' &&
                       <object>-obj_type && '.md'.
        ENDIF.
        PERFORM add_to_zip USING lo_zip <object> lv_filename lt_sections.
      ENDIF.
    ENDIF.
  ENDLOOP.

  " Get ZIP file as xstring
  lv_xstring = lo_zip->save( ).

  " Prepare download
  DATA: lv_zip_filename TYPE string,
        lv_default_ext  TYPE string VALUE '.zip'.

  lv_zip_filename = |Documentation_{ p_config }{ lv_default_ext }|.

  " Download file
  DATA: lt_binary_tab    TYPE STANDARD TABLE OF raw255,
        lv_output_length TYPE i.

  CALL FUNCTION 'SCMS_XSTRING_TO_BINARY'
    EXPORTING
      buffer        = lv_xstring
    IMPORTING
      output_length = lv_output_length
    TABLES
      binary_tab    = lt_binary_tab.

  cl_gui_frontend_services=>gui_download(
    EXPORTING
      bin_filesize = lv_output_length
      filename     = lv_zip_filename
      filetype     = 'BIN'
    CHANGING
      data_tab     = lt_binary_tab
    EXCEPTIONS
      OTHERS       = 1 ).

  IF sy-subrc <> 0.
    MESSAGE 'Error downloading the file' TYPE 'E'.
  ELSE.
    MESSAGE 'File downloaded successfully' TYPE 'S'.
  ENDIF.

*&---------------------------------------------------------------------*
*& Form build_package_tree
*&---------------------------------------------------------------------*
FORM build_package_tree USING iv_main_package TYPE sobj_name
                    CHANGING ct_pkg_tree TYPE ty_package_tree_tt.
  DATA: ls_pkg_tree TYPE ty_package_tree,
        lt_sub_pkgs TYPE TABLE OF ty_package_tree.

  " Add main package
  CLEAR ls_pkg_tree.
  ls_pkg_tree-package = iv_main_package.
  ls_pkg_tree-level = 0.
  APPEND ls_pkg_tree TO ct_pkg_tree.

  " Find all sub-packages
  LOOP AT lt_header ASSIGNING FIELD-SYMBOL(<pkg>)
    WHERE obj_type = 'DEVC'
      AND upper_obj_type = 'DEVC'.

    CLEAR ls_pkg_tree.
    ls_pkg_tree-package = <pkg>-obj_name.
    ls_pkg_tree-parent = <pkg>-upper_obj_name.

    " Find parent's level
    READ TABLE ct_pkg_tree INTO DATA(ls_parent)
      WITH KEY package = ls_pkg_tree-parent.
    IF sy-subrc = 0.
      ls_pkg_tree-level = ls_parent-level + 1.
      " Build path
      IF ls_parent-full_path IS INITIAL.
        ls_pkg_tree-full_path = ls_pkg_tree-package.
      ELSE.
        ls_pkg_tree-full_path = ls_parent-full_path && '/' &&
                               ls_pkg_tree-package.
      ENDIF.
      APPEND ls_pkg_tree TO ct_pkg_tree.
    ENDIF.
  ENDLOOP.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form add_to_zip
*&---------------------------------------------------------------------*
FORM add_to_zip USING io_zip TYPE REF TO cl_abap_zip
                      is_header TYPE zllm_adoc_doc_h
                      iv_filename TYPE string
                      it_sections TYPE ty_sections_tt.
  DATA: lv_content TYPE string.

  " Create content with metadata
  lv_content = |---\n|.
  lv_content = |{ lv_content }title: { is_header-obj_name }\n|.
  lv_content = |{ lv_content }type: { is_header-obj_type }\n|.
  IF is_header-upper_obj_name IS NOT INITIAL.
    lv_content = |{ lv_content }parent_object: { is_header-upper_obj_name }\n|.
    lv_content = |{ lv_content }parent_type: { is_header-upper_obj_type }\n|.
  ENDIF.
  lv_content = |{ lv_content }---\n\n|.
  lv_content = |{ lv_content }# { is_header-title }\n\n|.

  " Add sections
  LOOP AT it_sections ASSIGNING FIELD-SYMBOL(<section>)
    WHERE obj_name = is_header-obj_name
      AND obj_type = is_header-obj_type.
    lv_content = |{ lv_content }{ <section>-content }\n\n|.
  ENDLOOP.

  " Add to ZIP
  io_zip->add( name    = iv_filename
               content = cl_abap_codepage=>convert_to( lv_content ) ).
ENDFORM.
