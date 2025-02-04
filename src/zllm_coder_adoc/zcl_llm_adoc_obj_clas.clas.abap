"! <p class="shorttext synchronized" lang="en">Class specific documentation</p>
CLASS zcl_llm_adoc_obj_clas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC INHERITING FROM zcl_llm_adoc_obj_base.

  PUBLIC SECTION.
    INTERFACES zif_llm_adoc_object.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_llm_adoc_obj_clas IMPLEMENTATION.
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

    " Generate test information first which will be used to enhance the class description.
    ASSIGN code[ subobject = zif_llm_coder_object=>sub_obj-class_testclasses ] TO FIELD-SYMBOL(<code>).
    IF sy-subrc = 0.
      DATA(prompt) = zcl_llm_adoc_prompts=>class_test
                  && |{ concat_lines_of( table = <code>-code
                                         sep   = `\n` ) }```|.

      DATA(test_summary) = run_agent( prompt = prompt
                                      clear  = abap_true ).
    ENDIF.

    DATA source_code TYPE string.
    LOOP AT code ASSIGNING <code> WHERE subobject <> zif_llm_coder_object=>sub_obj-class_testclasses.
      source_code = |{ source_code }{ concat_lines_of( table = <code>-code
                                                       sep   = `\n` ) }|.
    ENDLOOP.

    " Overview
    prompt = zcl_llm_adoc_prompts=>class_doc.

    IF test_summary IS NOT INITIAL.
      prompt = |\nSummary of test cases as additional context:\n##TEST SUMMARY BEGIN\n|
            && |{ test_summary }\n##TEST SUMMARY END\n```{ source_code }```\n|
            && |Instructions:{ prompt }| ##NO_TEXT.
    ELSE.
      prompt = |```{ source_code }```\n{ prompt }|.
    ENDIF.


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
    documentation-title = |Class { obj_name }|.
    GET TIME STAMP FIELD documentation-generated.
    documentation-version_hash = version_hash.
    APPEND documentation TO result.
  ENDMETHOD.

ENDCLASS.
