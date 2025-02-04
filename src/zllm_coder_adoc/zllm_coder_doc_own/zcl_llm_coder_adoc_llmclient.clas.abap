"! <p class="shorttext synchronized" lang="en">Documentation configuration for ZLLM_CLIENT Package</p>
CLASS zcl_llm_coder_adoc_llmclient DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_llm_adoc_doc_conf .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_llm_coder_adoc_llmclient IMPLEMENTATION.
  METHOD zif_llm_adoc_doc_conf~get_config.
    " Main package depends on how you import from GIT.
    result-main_package = 'ZLLM_CLIENT'.
    result-name = 'ZCL_LLM_CODER_ADOC_LLMCLIENT'.
    " Custom content without any object will be added everywhere.
    APPEND VALUE #( content = `AI Generated documentation.` ) TO result-custom_content.
  ENDMETHOD.

ENDCLASS.
