"! <p class="shorttext synchronized" lang="en">Factory for object reader</p>
CLASS zcl_llm_coder_object_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "! <p class="shorttext synchronized">Get the matching object instance</p>
    "!
    CLASS-METHODS get_object IMPORTING obj_name      TYPE sobj_name
                                       obj_type      TYPE trobjtype
                             RETURNING VALUE(result) TYPE REF TO zif_llm_coder_object
                             RAISING   zcx_llm_coder_object.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_llm_coder_object_factory IMPLEMENTATION.
  METHOD get_object.
    CASE obj_type.
      WHEN 'CLAS'.
        result = NEW zcl_llm_coder_object_clas( obj_name = obj_name
                                                obj_type = obj_type ).
      WHEN 'PROG'.
        result = NEW zcl_llm_coder_object_prog( obj_name = obj_name
                                                obj_type = obj_type ).
      WHEN 'FUGR'.
        result = NEW zcl_llm_coder_object_fugr( obj_name = obj_name
                                                obj_type = obj_type ).
      WHEN 'INTF'.
        result = NEW zcl_llm_coder_object_intf( obj_name = obj_name
                                                obj_type = obj_type ).
    ENDCASE.
  ENDMETHOD.

ENDCLASS.
