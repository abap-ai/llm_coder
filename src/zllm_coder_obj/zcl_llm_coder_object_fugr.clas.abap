"! <p class="shorttext synchronized" lang="en">Source interface for function groups</p>
CLASS zcl_llm_coder_object_fugr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "! <p class="shorttext synchronized">Constructor</p>
    "!
    "! @parameter obj_name | <p class="shorttext synchronized">Object Name</p>
    "! @parameter obj_type | <p class="shorttext synchronized">Object Type</p>
    METHODS constructor IMPORTING obj_name TYPE sobj_name
                                  obj_type TYPE trobjtype
                        RAISING   zcx_llm_coder_object.

    INTERFACES zif_llm_coder_object.

    ALIASES get_version_hash FOR zif_llm_coder_object~get_version_hash.
    ALIASES get_source       FOR zif_llm_coder_object~get_source.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA object_name      TYPE sobj_name.
    DATA object_type      TYPE trobjtype.
    DATA includes         TYPE STANDARD TABLE OF include WITH EMPTY KEY.
    DATA function_modules TYPE STANDARD TABLE OF rs38l_incl WITH EMPTY KEY.

    "! <p class="shorttext synchronized">Read report includes</p>
    "!
    "! @raising zcx_llm_coder_object | <p class="shorttext synchronized">Error</p>
    METHODS read_includes RAISING zcx_llm_coder_object.

    "! <p class="shorttext synchronized">Read function modules of this function group</p>
    "!
    "! @raising zcx_llm_coder_object | <p class="shorttext synchronized">Error</p>
    METHODS read_function_modules RAISING zcx_llm_coder_object.
ENDCLASS.



CLASS zcl_llm_coder_object_fugr IMPLEMENTATION.
  METHOD constructor.
    IF obj_type <> 'FUGR'.
      RAISE EXCEPTION NEW zcx_llm_coder_object( textid = zcx_llm_coder_object=>object_type_not_supported
                                                msgv1  = CONV #( obj_type )
                                                msgv2  = 'FUGR' ).
    ENDIF.
    object_name = to_upper( obj_name ).
    object_type = to_upper( obj_type ).
    read_includes( ).
    read_function_modules( ).
  ENDMETHOD.

  METHOD zif_llm_coder_object~get_source.
    DATA part     TYPE zif_llm_coder_object=>source_code_part.
    DATA progname TYPE progname.

    LOOP AT function_modules ASSIGNING FIELD-SYMBOL(<function_module>).
      progname = <function_module>-include.
      READ REPORT progname INTO part-code.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.
      part-subobject = zif_llm_coder_object=>sub_obj-fugr_module.
      part-name      = <function_module>-funcname.
      APPEND part TO result.
    ENDLOOP.

    CLEAR part.
    LOOP AT includes ASSIGNING FIELD-SYMBOL(<include>).
      IF line_exists( function_modules[ include = <include> ] ).
        CONTINUE.
      ENDIF.
      progname = <include>.
      READ REPORT progname INTO part-code.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.
      part-subobject = zif_llm_coder_object=>sub_obj-fugr_include.
      APPEND part TO result.
    ENDLOOP.
  ENDMETHOD.

  METHOD zif_llm_coder_object~get_version_hash.
    DATA(names) = includes.
    IF lines( names ) = 0.
      RETURN.
    ENDIF.
    SELECT vern INTO TABLE @DATA(versions) FROM trdir FOR ALL ENTRIES IN @names WHERE name = @names-table_line.
    IF sy-subrc <> 0.
      " Unexpected as read_includes would have failed before
      RAISE EXCEPTION NEW zcx_llm_coder_object( textid = zcx_llm_coder_object=>object_not_found
                                                msgv1  = CONV #( object_name )
                                                msgv2  = CONV #( object_type ) ).
    ENDIF.

    result = zcl_llm_coder_utils=>calculate_hash( concat_lines_of( versions ) ).
  ENDMETHOD.

  METHOD read_includes.
    DATA main_name TYPE syrepid.

    main_name = |SAPL{ object_name }|.
    CALL FUNCTION 'RS_GET_ALL_INCLUDES'
      EXPORTING
        program      = main_name
      TABLES
        includetab   = includes
      EXCEPTIONS
        not_existent = 1
        no_program   = 2
        OTHERS       = 3.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_llm_coder_object( textid = zcx_llm_coder_object=>object_not_found
                                                msgv1  = CONV #( object_name )
                                                msgv2  = CONV #( object_type ) ).
    ENDIF.
  ENDMETHOD.

  METHOD read_function_modules.
    DATA fugr_name TYPE tlibg-area.

    fugr_name = object_name.
    CALL FUNCTION 'RS_FUNCTION_POOL_CONTENTS'
      EXPORTING
        function_pool           = fugr_name
      TABLES
        functab                 = function_modules
      EXCEPTIONS
        function_pool_not_found = 1
        OTHERS                  = 2.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_llm_coder_object( textid = zcx_llm_coder_object=>object_not_found
                                                msgv1  = CONV #( object_name )
                                                msgv2  = CONV #( object_type ) ).
    ENDIF.
    LOOP AT function_modules ASSIGNING FIELD-SYMBOL(<function_module>).
      <function_module>-include = to_upper( <function_module>-include ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
