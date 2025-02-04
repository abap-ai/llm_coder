"! <p class="shorttext synchronized" lang="en">Documentation Configuration</p>
INTERFACE zif_llm_adoc_doc_conf
  PUBLIC.

  TYPES: BEGIN OF doc_object,
           obj_name TYPE sobj_name,
           obj_type TYPE trobjtype,
         END OF doc_object,
         doc_objects TYPE STANDARD TABLE OF doc_object WITH EMPTY KEY.

  TYPES: BEGIN OF custom_content,
           obj_name type sobj_name,
           obj_type type trobjtype,
           sub_object TYPE sobj_name,
           content    TYPE string,
         END OF custom_content,
         custom_contents TYPE STANDARD TABLE OF custom_content WITH EMPTY KEY.
  TYPES: BEGIN OF config,
           name type sobj_name,
           exclude            TYPE doc_objects,
           custom_content     TYPE custom_contents,
           main_package       TYPE devclass,
           exclude_subpackges TYPE sap_bool,
         END OF config.

  "! <p class="shorttext synchronized">Return the documentation configuration</p>
  "! Define package and default configuration for documentation.
  "! Will be interpreted by the documentation runner.
  "! @parameter result | <p class="shorttext synchronized"></p>
  CLASS-METHODS get_config RETURNING VALUE(result) TYPE config.


ENDINTERFACE.
