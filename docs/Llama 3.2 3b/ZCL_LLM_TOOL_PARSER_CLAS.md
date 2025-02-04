---
title: ZCL_LLM_TOOL_PARSER
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_TOOL_PARSER

AI Generated documentation.

## Overview

The `zcl_llm_tool_parser` class is a custom implementation of the `zif_llm_tool_parser` interface, which is used to parse JSON schema data. The class provides a set of methods to process and generate JSON schema data, including parsing, validation, and generation of schema strings.

## Dependencies

The class depends on the following external objects:

* `zif_llm_tool_parser`: The interface that the class implements.
* `cl_abap_typedescr`: The class used to get the type descriptor of an object.
* `cl_abap_structdescr`: The class used to get the structure descriptor of an object.
* `cl_abap_tabledescr`: The class used to get the table descriptor of an object.
* `cl_abap_elemdescr`: The class used to get the element descriptor of an object.
* `zcx_llm_validation`: The exception class used to handle validation errors.

## Details

### Main Interactions

The class has the following main interactions:

* `parse`: The main method that takes the JSON schema data as input and returns the generated schema string.
* `process_type`: The method that processes the type of an object, including handling structs, tables, and elements.
* `process_structure`: The method that processes the structure of an object, including handling nested structures and tables.
* `process_table`: The method that processes the table of an object, including handling nested tables and elements.
* `process_element`: The method that processes the element of an object, including handling nested elements and attributes.

### Logic Flow

The logic flow of the class can be visualized as follows:

```
+---------------+
|  parse       |
+---------------+
       |
       |
       v
+---------------+
|  process_type  |
+---------------+
       |
       |
       v
+---------------+
|  process_structure  |
+---------------+
       |
       |
       v
+---------------+
|  process_table  |
+---------------+
       |
       |
       v
+---------------+
|  process_element  |
+---------------+
```

### Interaction with Foreign Objects

The class interacts with the following foreign objects:

* `zif_llm_tool_parser`: The interface that the class implements.
* `cl_abap_typedescr`, `cl_abap_structdescr`, `cl_abap_tabledescr`, `cl_abap_elemdescr`: The classes used to get the type descriptor, structure descriptor, table descriptor, and element descriptor of an object.
* `zcx_llm_validation`: The exception class used to handle validation errors.

### Expert Notes

* The class uses a recursive approach to process nested structures and tables.
* The `process_type` method handles the type of an object, including structs, tables, and elements.
* The `process_structure` method handles the structure of an object, including nested structures and tables.
* The `process_table` method handles the table of an object, including nested tables and elements.
* The `process_element` method handles the element of an object, including nested elements and attributes.
