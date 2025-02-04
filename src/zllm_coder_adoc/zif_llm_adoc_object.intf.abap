"! <p class="shorttext synchronized" lang="en">AI Documentation object</p>
INTERFACE zif_llm_adoc_object
  PUBLIC.

  TYPES: BEGIN OF ENUM section STRUCTURE sec,
           purpose,
           overview,
           debug,
         END OF ENUM section STRUCTURE sec.

  TYPES: BEGIN OF doc_section,
           sec_number TYPE int1,
           section    TYPE section,
           content    TYPE string,
           generated  TYPE timestamp,
           version    TYPE string,
         END OF doc_section.

  TYPES: BEGIN OF documentation,
           purpose        TYPE string,
           version_hash   TYPE string,
           doc_sections   TYPE STANDARD TABLE OF doc_section WITH EMPTY KEY,
           generated      TYPE timestamp,
           title          TYPE zllm_char255,
           upper_obj_name TYPE sobj_name,
           upper_obj_type TYPE trobjtype,
           alt_obj_name   TYPE sobj_name,
         END OF documentation,
         documentations TYPE STANDARD TABLE OF documentation WITH EMPTY KEY.

  METHODS document IMPORTING custom_content TYPE zif_llm_adoc_doc_conf=>custom_contents
                             obj_name       TYPE sobj_name
                             obj_type       TYPE trobjtype
                             model          TYPE zllm_model
                   RETURNING VALUE(result)  TYPE documentations
                   RAISING   zcx_llm_adoc.
ENDINTERFACE.
