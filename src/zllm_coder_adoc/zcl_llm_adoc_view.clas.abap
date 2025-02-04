CLASS zcl_llm_adoc_view DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_document,
        title        TYPE string,
        purpose      TYPE string,
        user_content TYPE string,
        sections     TYPE string,
      END OF ty_document.

    CLASS-METHODS get_documentation
      IMPORTING
        iv_obj_name TYPE string
        iv_obj_type TYPE string
      RETURNING
        VALUE(rs_doc) TYPE ty_document.
ENDCLASS.

CLASS zcl_llm_adoc_view IMPLEMENTATION.
  METHOD get_documentation.
    SELECT SINGLE title purpose user_content
      FROM zllm_adoc_doc_h
      INTO CORRESPONDING FIELDS OF rs_doc
      WHERE obj_name = iv_obj_name
        AND obj_type = iv_obj_type.

    IF sy-subrc <> 0.
    " We just do not output anything
    return.
    ENDIF.

    SELECT content
      FROM zllm_adoc_doc_s
      INTO TABLE @DATA(lt_sections)
      WHERE obj_name = @iv_obj_name
        AND obj_type = @iv_obj_type
      ORDER BY sec_number.

    LOOP AT lt_sections ASSIGNING FIELD-SYMBOL(<section>).
      rs_doc-sections = rs_doc-sections && <section>-content && cl_abap_char_utilities=>newline.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

