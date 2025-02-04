"! <p class="shorttext synchronized" lang="en">Function Group specific documentation</p>
CLASS zcl_llm_adoc_obj_fugr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC INHERITING FROM zcl_llm_adoc_obj_base.

  PUBLIC SECTION.
    INTERFACES zif_llm_adoc_object.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_llm_adoc_obj_fugr IMPLEMENTATION.
  METHOD zif_llm_adoc_object~document.
    DATA(obj) = zcl_llm_coder_object_factory=>get_object( obj_name = obj_name
                                                          obj_type = obj_type ).
    DATA(code) = obj->get_source( ).

    DATA(version_hash) = obj->get_version_hash( ).

    TRY.
        agent = NEW zcl_llm_adoc_obj_agent( hint  = ``
                                            model = model ).
      CATCH zcx_llm_agent_error INTO DATA(error).
        RAISE EXCEPTION NEW zcx_llm_adoc( textid   = zcx_llm_adoc=>agent_creation
                                          previous = error ).
    ENDTRY.

    " We need to get all the generic includes that might be used by a function module.
    " E.g. types and shared functions.
    DATA include_code TYPE string.
    LOOP AT code ASSIGNING FIELD-SYMBOL(<code>).
      IF <code>-subobject = zif_llm_coder_object=>sub_obj-fugr_include.
        include_code = include_code && concat_lines_of( table = <code>-code
                                                        sep   = `\n` ).
      ENDIF.
    ENDLOOP.

    " Remove includes in case of table frame to avoid spamming the llm with
    " irrelevant information.
    LOOP AT code TRANSPORTING NO FIELDS WHERE name CP 'TABLEFRAME_*'.
    ENDLOOP.
    IF sy-subrc = 0.
      include_code = `No includes will be shown as this is a table frame function group.`.
    ENDIF.

    " Document all function modules first, then summarize for function group
    DATA documentation TYPE zif_llm_adoc_object=>documentation.
    DATA doc_section   TYPE zif_llm_adoc_object=>doc_section.
    documentation-upper_obj_name = obj_name.
    documentation-upper_obj_type = obj_type.

    LOOP AT code ASSIGNING <code>.
      IF <code>-subobject <> zif_llm_coder_object=>sub_obj-fugr_module.
        CONTINUE.
      ENDIF.

      documentation-title = |Function Module { <code>-name }|.
      documentation-alt_obj_name = <code>-name.
      DATA(prompt) = | --- Common Includes --- \n{ include_code }\n|
                  && |--- Function Module Main Include ---\n{ concat_lines_of( table = <code>-code
                                                                               sep   = `\n` ) }|
                  && |\nInstructions: { zcl_llm_adoc_prompts=>function_module }|.
      doc_section-content    = run_agent( prompt ).
      " There should only be one at max either with full name or empty
      LOOP AT custom_content INTO DATA(cc) WHERE obj_name = <code>-name AND obj_type = 'FUNC'.
        doc_section-content = |{ cc-content }\n{ doc_section-content }|.
      ENDLOOP.
      IF sy-subrc <> 0.
        LOOP AT custom_content INTO cc WHERE obj_name = '' AND obj_type = ''.
          doc_section-content = |{ cc-content }\n{ doc_section-content }|.
        ENDLOOP.
      ENDIF.
      doc_section-sec_number = 1.
      doc_section-section    = zif_llm_adoc_object=>sec-overview.
      GET TIME STAMP FIELD doc_section-generated.
      APPEND doc_section TO documentation-doc_sections.

      prompt = zcl_llm_adoc_prompts=>purpose.
      documentation-purpose = run_agent( prompt = prompt
                                         clear  = abap_true ).
      GET TIME STAMP FIELD documentation-generated.
      documentation-version_hash = version_hash.
      APPEND documentation TO result.

    ENDLOOP.

    DATA function_modules TYPE string.
    LOOP AT result ASSIGNING FIELD-SYMBOL(<documentation>).
      function_modules = |{ function_modules }{ <documentation>-title }\n{ <documentation>-purpose }\n|.
    ENDLOOP.

    CLEAR documentation.
    CLEAR doc_section.
    prompt = |{ zcl_llm_adoc_prompts=>function_group }\n{ function_modules }|.
    doc_section-sec_number = 1.
    doc_section-content    = run_agent( prompt ).

    " There should only be one at max either with full name or empty
    LOOP AT custom_content INTO cc WHERE obj_name = obj_name AND obj_type = obj_type.
      doc_section-content = |{ cc-content }\n{ doc_section-content }|.
    ENDLOOP.
    IF sy-subrc <> 0.
      LOOP AT custom_content INTO cc WHERE obj_name = '' AND obj_type = ''.
        doc_section-content = |{ cc-content }\n{ doc_section-content }|.
      ENDLOOP.
    ENDIF.

    doc_section-section    = zif_llm_adoc_object=>sec-overview.
    GET TIME STAMP FIELD doc_section-generated.

    documentation-title = |Function Group { obj_name }|.
    prompt = zcl_llm_adoc_prompts=>purpose.
    documentation-purpose      = run_agent( prompt ).
    documentation-version_hash = version_hash.
    GET TIME STAMP FIELD documentation-generated.
    APPEND documentation TO result.
  ENDMETHOD.

ENDCLASS.
