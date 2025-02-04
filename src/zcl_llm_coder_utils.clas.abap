CLASS zcl_llm_coder_utils DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "! <p class="shorttext synchronized">Calculate Hash</p>
    "!
    "! @parameter value  | <p class="shorttext synchronized">String to hash</p>
    "! @parameter result | <p class="shorttext synchronized">Hash value</p>
    CLASS-METHODS calculate_hash IMPORTING !value        TYPE string
                                 RETURNING VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_llm_coder_utils IMPLEMENTATION.
  METHOD calculate_hash.
    TRY.
        cl_abap_message_digest=>calculate_hash_for_char( EXPORTING if_algorithm  = 'MD5'
                                                                   if_data       = value
                                                         IMPORTING ef_hashstring = result ).
      CATCH cx_abap_message_digest.
        " This is unrealistic as in that case basic features required in many places would not work.
        " As fallback we just return the input value, however it is unlikely the system was even able to generate
        " documentation if this simple hash feature does not work.
        result = value.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
