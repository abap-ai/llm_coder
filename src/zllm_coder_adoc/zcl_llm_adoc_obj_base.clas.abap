"! <p class="shorttext synchronized" lang="en">Base LLM Documentation Class</p>
CLASS zcl_llm_adoc_obj_base DEFINITION
  PUBLIC ABSTRACT.

  PUBLIC SECTION.
  PROTECTED SECTION.
    DATA agent TYPE REF TO zif_llm_agent.

    "! <p class="shorttext synchronized">Execute the Agent</p>
    "!
    "! @parameter prompt       | <p class="shorttext synchronized">Prompt message</p>
    "! @parameter clear        | <p class="shorttext synchronized">Reset the agent messages after execution</p>
    "! @parameter result       | <p class="shorttext synchronized">Result</p>
    "! @raising   zcx_llm_adoc | <p class="shorttext synchronized">Error</p>
    METHODS run_agent IMPORTING prompt        TYPE string
                                !clear        TYPE sap_bool DEFAULT abap_false
                      RETURNING VALUE(result) TYPE string
                      RAISING   zcx_llm_adoc.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_llm_adoc_obj_base IMPLEMENTATION.
  METHOD run_agent.
    TRY.
        DATA(response) = agent->execute( prompt ).
      CATCH zcx_llm_agent_error INTO DATA(error).
        RAISE EXCEPTION NEW zcx_llm_adoc( textid   = zcx_llm_adoc=>agent_execution
                                          previous = error ).
    ENDTRY.
    IF clear = abap_true.
      agent->set_context( messages = VALUE #( ( ) ) ).
    ENDIF.
    IF response-success = abap_true.
      result = response-choice-message-content.
    ELSE.
      IF response-error-retrieable = abap_true.
        RAISE EXCEPTION NEW zcx_llm_adoc( textid = zcx_llm_adoc=>agent_error_retriable
                                          msgv1  = CONV #( response-error-http_code )
                                          msgv2  = CONV #( response-error-error_text ) ).
      ELSE.
        RAISE EXCEPTION NEW zcx_llm_adoc( textid = zcx_llm_adoc=>agent_error_non_retriable
                                          msgv1  = CONV #( response-error-http_code )
                                          msgv2  = CONV #( response-error-error_text ) ).
      ENDIF.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
