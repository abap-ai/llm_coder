"! <p class="shorttext synchronized" lang="en">Source interface for interfaces</p>
CLASS zcl_llm_coder_object_intf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    "! <p class="shorttext synchronized" lang="en">Constructor</p>
    "!
    "! @parameter obj_name | <p class="shorttext synchronized" lang="en">Object Name</p>
    "! @parameter obj_type | <p class="shorttext synchronized" lang="en">Object Type</p>
    METHODS constructor IMPORTING obj_name TYPE sobj_name
                                  obj_type TYPE trobjtype
                        RAISING   zcx_llm_coder_object.

    INTERFACES zif_llm_coder_object.
    ALIASES get_version_hash  FOR zif_llm_coder_object~get_version_hash.
    ALIASES get_source FOR zif_llm_coder_object~get_source.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA object_name TYPE sobj_name.
    DATA object_type TYPE trobjtype.
    DATA int_classname(30) TYPE c.

    "! <p class="shorttext synchronized" lang="en">Check if it is a default empty component</p>
    "!
    "! @parameter code | <p class="shorttext synchronized" lang="en">Source code</p>
    "! @parameter result | <p class="shorttext synchronized" lang="en">Default?</p>
    METHODS is_default IMPORTING code TYPE rswsourcet RETURNING VALUE(result) TYPE sap_bool.
ENDCLASS.



CLASS zcl_llm_coder_object_intf IMPLEMENTATION.

  METHOD zif_llm_coder_object~get_version_hash.
    DATA prognames TYPE STANDARD TABLE OF progname WITH EMPTY KEY.

    APPEND int_classname && seop_inctype_interface && seop_inccode_typeref TO prognames.
    APPEND int_classname && seop_inctype_interface && seop_inccode_public TO prognames.

    SELECT vern FROM reposrc
      FOR ALL ENTRIES IN @prognames
      WHERE progname = @prognames-table_line
      INTO TABLE @DATA(versions).

    result = zcl_llm_coder_utils=>calculate_hash( concat_lines_of( versions ) ).
  ENDMETHOD.

  METHOD constructor.
    IF obj_type <> 'INTF'.
      RAISE EXCEPTION NEW zcx_llm_coder_object( textid = zcx_llm_coder_object=>object_type_not_supported
                                                msgv1  = CONV #( obj_type )
                                                msgv2  = 'INTF' ).
    ENDIF.
    object_name = to_upper( obj_name ).
    object_type = to_upper( obj_type ).
    int_classname = obj_name.
    TRANSLATE int_classname USING ' ='.
  ENDMETHOD.

  METHOD zif_llm_coder_object~get_source.
    DATA part     TYPE zif_llm_coder_object=>source_code_part.
    DATA progname TYPE progname.

    progname = int_classname && seop_inctype_interface && seop_inccode_typeref.
    READ REPORT progname INTO part-code.
    part-subobject = zif_llm_coder_object=>sub_obj-intf_types.
    IF is_default( part-code ) = abap_false.
      APPEND part TO result.
    ENDIF.

    progname = int_classname && seop_inctype_interface && seop_inccode_public.
    READ REPORT progname INTO part-code.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_llm_coder_object( textid = zcx_llm_coder_object=>object_not_found
                                                msgv1  = CONV #( object_name )
                                                msgv2  = CONV #( object_type ) ).
    ENDIF.
    part-subobject = zif_llm_coder_object=>sub_obj-intf_public.
    IF is_default( part-code ) = abap_false.
      APPEND part TO result.
    ENDIF.
  ENDMETHOD.

  METHOD is_default.
    result = abap_true.
    IF lines( code ) > 4.
      result = abap_false.
      RETURN.
    ENDIF.

    LOOP AT code ASSIGNING FIELD-SYMBOL(<code>).
      IF strlen( <code> ) > 0 AND <code>(3) <> '*"*'.
        result = abap_false.
        RETURN.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
