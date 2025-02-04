class ZCX_LLM_ADOC definition
  public
  inheriting from CX_STATIC_CHECK
  final
  create public .

public section.

  interfaces IF_T100_DYN_MSG .
  interfaces IF_T100_MESSAGE .

  constants:
    BEGIN OF zcx_llm_adoc_errors,
        msgid TYPE symsgid      VALUE 'ZLLM_ADOC',
        msgno TYPE symsgno      VALUE '000',
        attr1 TYPE scx_attrname VALUE 'MSGV1',
        attr2 TYPE scx_attrname VALUE 'MSGV2',
        attr3 TYPE scx_attrname VALUE 'MSGV3',
        attr4 TYPE scx_attrname VALUE 'MSGV4',
      END OF zcx_llm_adoc_errors .
  constants:
    BEGIN OF agent_creation,
        msgid TYPE symsgid      VALUE 'ZLLM_ADOC',
        msgno TYPE symsgno      VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MSGV1',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF agent_creation .
  constants:
    begin of AGENT_EXECUTION,
      msgid type symsgid value 'ZLLM_ADOC',
      msgno type symsgno value '002',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of AGENT_EXECUTION .
  constants:
    begin of AGENT_ERROR_RETRIABLE,
      msgid type symsgid value 'ZLLM_ADOC',
      msgno type symsgno value '003',
      attr1 type scx_attrname value 'MSGV1',
      attr2 type scx_attrname value 'MSGV2',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of AGENT_ERROR_RETRIABLE .
  constants:
    begin of AGENT_ERROR_NON_RETRIABLE,
      msgid type symsgid value 'ZLLM_ADOC',
      msgno type symsgno value '004',
      attr1 type scx_attrname value 'MSGV1',
      attr2 type scx_attrname value 'MSGV2',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of AGENT_ERROR_NON_RETRIABLE .
  data MSGV1 type SYMSGV .
  data MSGV2 type SYMSGV .
  data MSGV3 type SYMSGV .
  data MSGV4 type SYMSGV .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !MSGV1 type SYMSGV optional
      !MSGV2 type SYMSGV optional
      !MSGV3 type SYMSGV optional
      !MSGV4 type SYMSGV optional .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCX_LLM_ADOC IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
      me->msgv1 = msgv1.
      me->msgv2 = msgv2.
      me->msgv3 = msgv3.
      me->msgv4 = msgv4.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
