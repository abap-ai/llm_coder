"! <p class="shorttext synchronized" lang="en">Source interface for reports</p>
CLASS zcl_llm_coder_object_prog DEFINITION
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
    DATA object_name TYPE sobj_name.
    DATA object_type TYPE trobjtype.
    DATA includes    TYPE STANDARD TABLE OF include WITH EMPTY KEY.

    "! <p class="shorttext synchronized" lang="en">Read report includes</p>
    "!
    "! @raising zcx_llm_coder_object | <p class="shorttext synchronized" lang="en">Error</p>
    METHODS read_includes RAISING zcx_llm_coder_object.
ENDCLASS.



CLASS zcl_llm_coder_object_prog IMPLEMENTATION.
  METHOD constructor.
    IF obj_type <> 'PROG'.
      RAISE EXCEPTION NEW zcx_llm_coder_object( textid = zcx_llm_coder_object=>object_type_not_supported
                                                msgv1  = CONV #( obj_type )
                                                msgv2  = 'PROG' ).
    ENDIF.
    object_name = to_upper( obj_name ).
    object_type = to_upper( obj_type ).
    read_includes( ).
  ENDMETHOD.

  METHOD zif_llm_coder_object~get_source.
    DATA part     TYPE zif_llm_coder_object=>source_code_part.
    DATA progname TYPE progname.

    progname = object_name.
    READ REPORT progname INTO part-code.
    part-subobject = zif_llm_coder_object=>sub_obj-report_main.
    APPEND part TO result.

    LOOP AT includes ASSIGNING FIELD-SYMBOL(<include>).
      progname = <include>.
      READ REPORT progname INTO part-code.
      " We do not raise an exception as inconsistencies might lead to this
      " but what we can't read usually doesn't exist, so we get anyhow everything.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.
      part-subobject = zif_llm_coder_object=>sub_obj-report_include.
      APPEND part TO result.
    ENDLOOP.
  ENDMETHOD.

  METHOD zif_llm_coder_object~get_version_hash.
    DATA(names) = includes.
    APPEND object_name TO names.
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
    CALL FUNCTION 'RS_GET_ALL_INCLUDES'
      EXPORTING
        program      = object_name
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

ENDCLASS.
