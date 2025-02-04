"! <p class="shorttext synchronized" lang="en">Documentation AI Agent focused on documenting one object</p>
CLASS zcl_llm_adoc_obj_agent DEFINITION
  PUBLIC
  INHERITING FROM zcl_llm_agent_base
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS class_constructor.

    METHODS constructor
      IMPORTING model TYPE zllm_model
                hint  TYPE string
                tools TYPE zllm_tools OPTIONAL
      RAISING   zcx_llm_agent_error.

  PROTECTED SECTION.
    METHODS: initialize REDEFINITION.
  PRIVATE SECTION.
    CLASS-DATA system_prompt TYPE string.
    DATA system_hint TYPE string.
    DATA parser TYPE REF TO zcl_llm_template_parser.

ENDCLASS.

CLASS zcl_llm_adoc_obj_agent IMPLEMENTATION.
  METHOD constructor.
    TRY.
        DATA(client) = zcl_llm_factory=>get_client( model ).
      CATCH zcx_llm_authorization INTO DATA(error). " TODO: variable is assigned but never used (ABAP cleaner)
    ENDTRY.
    super->constructor( client = client
                        tools  = tools ).
    system_hint = hint.
    initialize( ).
  ENDMETHOD.

  METHOD initialize.
    DATA prompt TYPE string.

    IF system_hint IS NOT INITIAL.
     prompt = |{ system_prompt }\n{ system_hint }|.
    ELSE.
      prompt = system_prompt.
    ENDIF.
    " Add system prompt to memory
    add_to_memory_internal( VALUE #( msg-role    = client->role_system
                                     msg-content = prompt ) ).
  ENDMETHOD.

  METHOD class_constructor.
    system_prompt =
        |Your are an experienced technical writer specialized in documenting SAP ABAP code with the reader in mind. | &&
        |Your tone is business professional, concise and precise.| &&
        |You only document the given code following further instructions. | &&
        |Focus on main aspects skipping less relevant details. | &&
        |Use markdown with mermaid diagrams where useful.\n| ##NO_TEXT.
  ENDMETHOD.

ENDCLASS.
