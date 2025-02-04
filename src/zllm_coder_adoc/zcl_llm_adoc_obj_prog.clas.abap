"! <p class="shorttext synchronized" lang="en">Report specific documentation</p>
CLASS zcl_llm_adoc_obj_prog DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC INHERITING FROM zcl_llm_adoc_obj_base.

  PUBLIC SECTION.
    INTERFACES zif_llm_adoc_object.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_llm_adoc_obj_prog IMPLEMENTATION.
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

    " Combine all source code obejcts.
    " Note that we currently do not include dynpros - unsure how useful this would be anyhow.
    DATA source_code TYPE string.
    LOOP AT code ASSIGNING FIELD-SYMBOL(<code>).
      source_code = source_code && concat_lines_of( table = <code>-code
                                                    sep   = `\n` ).
    ENDLOOP.

    " Overview
    DATA(prompt) = zcl_llm_adoc_prompts=>report_doc.
    prompt = |{ source_code }\nInstructions:\n{ prompt  }|.

    DATA documentation TYPE zif_llm_adoc_object=>documentation.
    DATA doc_section TYPE zif_llm_adoc_object=>doc_section.

    doc_section-sec_number = 1.
    doc_section-section    = zif_llm_adoc_object=>sec-overview.
    doc_section-content    = run_agent( prompt ).
    " There may only be one
    IF lines( custom_content ) = 1.
      doc_section-content = |{ custom_content[ 1 ]-content }\n{ doc_section-content }|.
    ENDIF.
    GET TIME STAMP FIELD doc_section-generated.
    APPEND doc_section TO documentation-doc_sections.

    " Purpose
    prompt = zcl_llm_adoc_prompts=>purpose.
    documentation-purpose = run_agent( prompt ).
    documentation-title = |Report { obj_name }|.
    GET TIME STAMP FIELD documentation-generated.
    documentation-version_hash = version_hash.
    APPEND documentation TO result.
  ENDMETHOD.

ENDCLASS.
