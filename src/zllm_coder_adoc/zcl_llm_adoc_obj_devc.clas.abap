"! <p class="shorttext synchronized" lang="en">DEVC specific documentation</p>
"! Note the documentation of DEVC is based on previously generated documentation.
"! This must therefore run LAST!
CLASS zcl_llm_adoc_obj_devc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC INHERITING FROM zcl_llm_adoc_obj_base.

  PUBLIC SECTION.
    INTERFACES zif_llm_adoc_object.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_llm_adoc_obj_devc IMPLEMENTATION.
  METHOD zif_llm_adoc_object~document.
    " We read all short docs of all objects belonging to this package
    " This is not perfect for function groups as we only work on function group level
    " but fine for now, should be optimized with the overall refactoring.
    select obj_name, obj_type, title, purpose from zllm_adoc_doc_h into table @data(docs)
        where upper_obj_name = @obj_name and upper_obj_type = @obj_type.

    TRY.
        agent = NEW zcl_llm_adoc_obj_agent( hint  = ``
                                            model = model ).
      CATCH zcx_llm_agent_error INTO DATA(error).
        RAISE EXCEPTION NEW zcx_llm_adoc( textid   = zcx_llm_adoc=>agent_creation
                                          previous = error ).
    ENDTRY.

    data objects type string.
    LOOP AT docs ASSIGNING FIELD-SYMBOL(<doc>).
      objects = |{ objects }{ <doc>-title }\n{ <doc>-purpose }\n|.
    ENDLOOP.

    " Overview
    DATA(prompt) = zcl_llm_adoc_prompts=>package.
    prompt = |Current package content as reference\n{ objects }\nInstructions: { prompt }|.

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
    documentation-title = |Package { obj_name }|.
    GET TIME STAMP FIELD documentation-generated.
    APPEND documentation TO result.
  ENDMETHOD.

ENDCLASS.
