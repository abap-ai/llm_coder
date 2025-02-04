"! <p class="shorttext synchronized" lang="en">Object specific code information implementation</p>
INTERFACE zif_llm_coder_object
  PUBLIC.

  TYPES: BEGIN OF ENUM subobject STRUCTURE sub_obj,
           class_local_imps,
           class_macros,
           class_local_def,
           class_testclasses,
           class_source,
           report_main,
           report_include,
           fugr_module,
           fugr_include,
           intf_pool,
           intf_public,
           intf_types,
         END OF ENUM subobject STRUCTURE sub_obj.

  TYPES: BEGIN OF source_code_part,
           subobject TYPE subobject,
           code      TYPE rswsourcet,
           name type string,
         END OF source_code_part,
         source_code TYPE STANDARD TABLE OF source_code_part WITH EMPTY KEY.

  "! <p class="shorttext synchronized">Hash of the object versions</p>
  "! Can be used to determine if there is a version difference.
  "! @parameter result | <p class="shorttext synchronized"></p>
  METHODS get_version_hash RETURNING VALUE(result) TYPE string
                           RAISING   zcx_llm_coder_object.

  "! <p class="shorttext synchronized">Read the source code of the object</p>
  "! Source code of a object may consist of many sub objects.
  "! @parameter result | <p class="shorttext synchronized">Source code table</p>
  METHODS get_source RETURNING VALUE(result) TYPE source_code
                     RAISING   zcx_llm_coder_object.

ENDINTERFACE.
