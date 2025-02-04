"! <p class="shorttext synchronized" lang="en">Create or Update documentation</p>
"! TOOD - Refactor the logic - especially handling the data passing
"! to have everything where it should be and avoid the strange workarounds
"! that are in place for now.
"! Not that the current state - while working for the first generations - is
"! more a kind of ideation PoC. I wanted to make this available early but it is
"! not really usable, however feel free to use it as ideation or wait a few weeks
"! till it is reworked based on the first learnings.
CLASS zcl_llm_adoc_runner DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "! <p class="shorttext synchronized">Create/Update documentation</p>
    "!
    "! @parameter config_class | <p class="shorttext synchronized">Configuration class</p>
    METHODS run IMPORTING config_class TYPE REF TO zif_llm_adoc_doc_conf
                          model        TYPE zllm_model.

  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: BEGIN OF dev_object,
             obj_name TYPE sobj_name,
             obj_type TYPE trobjtype,
           END OF dev_object,
           dev_objects TYPE STANDARD TABLE OF dev_object WITH EMPTY KEY.

    DATA config TYPE zif_llm_adoc_doc_conf=>config.
    DATA model  TYPE zllm_model.

    METHODS get_objects IMPORTING !package      TYPE sobj_name
                        RETURNING VALUE(result) TYPE dev_objects.

    METHODS process_package IMPORTING !package TYPE sobj_name
                                      upper    TYPE sobj_name.

    METHODS process_object IMPORTING obj_name TYPE sobj_name
                                     obj_type TYPE trobjtype
                                     package  TYPE sobj_name.

    METHODS process_fugr IMPORTING obj_name TYPE sobj_name
                                   obj_type TYPE trobjtype
                                   package  TYPE sobj_name.

    METHODS process_devc IMPORTING obj_name TYPE sobj_name
                                   obj_type TYPE trobjtype
                                   package  TYPE sobj_name.

    METHODS get_custom_content IMPORTING obj_name      TYPE sobj_name
                                         obj_type      TYPE trobjtype
                               RETURNING VALUE(result) TYPE zif_llm_adoc_doc_conf=>custom_contents.
    METHODS save IMPORTING documentations TYPE zif_llm_adoc_object=>documentations
                           obj_name       TYPE sobj_name
                           obj_type       TYPE trobjtype
                           package        TYPE sobj_name.
ENDCLASS.



CLASS zcl_llm_adoc_runner IMPLEMENTATION.


  METHOD get_custom_content.
    LOOP AT config-custom_content ASSIGNING FIELD-SYMBOL(<cust>) WHERE obj_name = obj_name AND obj_type = obj_type.
      APPEND <cust> TO result.
    ENDLOOP.
    IF sy-subrc <> 0.
      READ TABLE config-custom_content INTO DATA(cust) WITH KEY obj_name = '' obj_type = ''.
      IF sy-subrc = 0.
        APPEND cust TO result.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD get_objects.
    SELECT obj_name, object FROM tadir
      INTO TABLE @result
      WHERE pgmid = 'R3TR' AND object IN ( 'CLAS', 'INTF', 'PROG', 'FUGR' ) AND devclass = @package
      ORDER BY object.

    " Remove objects that are deleted but still in TADIR
    DATA exists TYPE sap_bool.
    DATA fm_obj_name TYPE trobj_name.
    LOOP AT result ASSIGNING FIELD-SYMBOL(<result>).
      fm_obj_name = <result>-obj_name.
      CALL FUNCTION 'TR_CHECK_EXIST'
        EXPORTING
          iv_pgmid             = 'R3TR'
          iv_object            = <result>-obj_type
          iv_obj_name          = fm_obj_name
        IMPORTING
          e_exist              = exists
        EXCEPTIONS
          tr_no_check_function = 1                " No check function exists for this object type
          OTHERS               = 2.
      IF sy-subrc <> 0 OR exists = abap_false.
        DELETE result WHERE obj_name = <result>-obj_name AND obj_type = <result>-obj_type.
      ENDIF.
    ENDLOOP.

    " Get potential sub-packages
    SELECT devclass FROM tdevc INTO TABLE @DATA(packages) WHERE parentcl = @package.
    IF sy-subrc = 0.
      LOOP AT packages INTO DATA(p).
        APPEND VALUE #( obj_name = p obj_type = 'DEVC' ) TO result.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.


  METHOD process_devc.
    process_package( package = obj_name upper = package ).
  ENDMETHOD.


  METHOD process_fugr.
    DATA(doc) = NEW zcl_llm_adoc_obj_fugr( ).

    DATA(documentations) = doc->zif_llm_adoc_object~document( custom_content = get_custom_content( obj_name = obj_name
                                                                                                   obj_type = obj_type )
                                                              model          = model
                                                              obj_name       = obj_name
                                                              obj_type       = obj_type ).
    " Function groups return multiple entries, we need to set
    " the top objects at the one without a top object (root).
    LOOP AT documentations ASSIGNING FIELD-SYMBOL(<doc>) WHERE upper_obj_name IS INITIAL.
      <doc>-upper_obj_name = package.
      <doc>-upper_obj_type = 'DEVC'.
    ENDLOOP.
    save( documentations = documentations
          obj_name       = obj_name
          obj_type       = obj_type
          package        = package ).
  ENDMETHOD.


  METHOD process_object.
    DATA doc TYPE REF TO zif_llm_adoc_object.

    CASE obj_type.
      WHEN 'CLAS'.
        doc = NEW zcl_llm_adoc_obj_clas( ).
      WHEN 'PROG'.
        doc = NEW zcl_llm_adoc_obj_prog( ).
      WHEN 'INTF'.
        doc = NEW zcl_llm_adoc_obj_intf( ).
      WHEN OTHERS.
        RETURN.
    ENDCASE.

    DATA(documentations) = doc->document( custom_content = get_custom_content( obj_name = obj_name
                                                                               obj_type = obj_type )
                                          model          = model
                                          obj_name       = obj_name
                                          obj_type       = obj_type ).
    IF lines( documentations ) <> 1.
      " Something went wrong, there should always be one result only!
      RETURN.
    ENDIF.
    DATA(documentation) = documentations[ 1 ].
    documentation-upper_obj_name = package.
    documentation-upper_obj_type = 'DEVC'.

    save( documentations = VALUE #( ( documentation ) )
          obj_name       = obj_name
          obj_type       = obj_type
          package        = package ).
  ENDMETHOD.


  METHOD process_package.
    DATA(objects) = get_objects( package ).
    LOOP AT objects ASSIGNING FIELD-SYMBOL(<object>).
      CASE <object>-obj_type.
        WHEN 'DEVC'.
          process_devc( obj_name = <object>-obj_name obj_type = <object>-obj_type package = package ).
        WHEN 'CLAS' OR 'PROG' OR 'INTF'.
          process_object( obj_name = <object>-obj_name obj_type = <object>-obj_type package = package ).
        WHEN 'FUGR'.
          process_fugr( obj_name = <object>-obj_name obj_type = <object>-obj_type package = package ).
      ENDCASE.
    ENDLOOP.

    " Now also document the package itself
    DATA(doc) = NEW zcl_llm_adoc_obj_devc( ).
    DATA(documentations) = doc->zif_llm_adoc_object~document( custom_content = get_custom_content( obj_name = package
                                                                              obj_type = 'DEVC' )
                                         model          = model
                                         obj_name       = package
                                         obj_type       = 'DEVC' ).
    IF lines( documentations ) <> 1.
      " Something went wrong, there should always be one result only!
      RETURN.
    ENDIF.
    DATA(documentation) = documentations[ 1 ].
    IF upper IS NOT INITIAL.
      documentation-upper_obj_name = upper.
      documentation-upper_obj_type = 'DEVC'.
    ENDIF.

    save( documentations = VALUE #( ( documentation ) )
          obj_name       = package
          obj_type       = 'DEVC'
          package        = package ).

  ENDMETHOD.


  METHOD run.
    me->model = model.
    config = config_class->get_config( ).
    process_package( package = CONV #( config-main_package ) upper = '' ).
  ENDMETHOD.


  METHOD save.
    " This method is for now just a huge workaround, the whole logic will be
    " reworked in future including the db structure based on the learnings
    " of this prototype.
    " Note that this whole implementation is quite inefficient and will be fixed.
    DATA header TYPE zllm_adoc_doc_h.
    DATA section TYPE zllm_adoc_doc_s.

    IF obj_type = 'FUGR'.
      LOOP AT documentations ASSIGNING FIELD-SYMBOL(<doc>).
        CLEAR header.
        CLEAR section.
        IF <doc>-upper_obj_type = 'FUGR'.
          " This is a workaround, FUNC does not really exist but we
          " use it here for function module.
          header-obj_type = 'FUNC'.
          header-obj_name = <doc>-alt_obj_name.
        ELSE.
          header-obj_type = obj_type.
          header-obj_name = obj_name.
        ENDIF.
        header-config = config-name.
        header-generated = <doc>-generated.
        header-purpose = <doc>-purpose.
        header-title = <doc>-title.
        header-upper_obj_name = <doc>-upper_obj_name.
        header-upper_obj_type = <doc>-upper_obj_type.
        header-version_hash = <doc>-version_hash.
        MODIFY zllm_adoc_doc_h FROM header.

        LOOP AT <doc>-doc_sections ASSIGNING FIELD-SYMBOL(<sec>).
          section-config = config-name.
          section-content = <sec>-content.
          section-generated = <sec>-generated.
          section-obj_name = header-obj_name.
          section-obj_type = header-obj_type.
          section-sec_number = <sec>-sec_number.
          MODIFY zllm_adoc_doc_s FROM section.
        ENDLOOP.
      ENDLOOP.

    ELSE.
      LOOP AT documentations ASSIGNING <doc>.
        CLEAR header.
        CLEAR section.
        header-config = config-name.
        header-generated = <doc>-generated.
        header-obj_name = obj_name.
        header-obj_type = obj_type.
        header-purpose = <doc>-purpose.
        header-title = <doc>-title.
        header-upper_obj_name = <doc>-upper_obj_name.
        header-upper_obj_type = <doc>-upper_obj_type.
        header-version_hash = <doc>-version_hash.
        MODIFY zllm_adoc_doc_h FROM header.

        LOOP AT <doc>-doc_sections ASSIGNING <sec>.
          section-config = config-name.
          section-content = <sec>-content.
          section-generated = <sec>-generated.
          section-obj_name = header-obj_name.
          section-obj_type = header-obj_type.
          section-sec_number = <sec>-sec_number.
          MODIFY zllm_adoc_doc_s FROM section.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
