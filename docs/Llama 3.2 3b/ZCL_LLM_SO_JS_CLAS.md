---
title: ZCL_LLM_SO_JS
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_SO_JS

AI Generated documentation.

## Overview

The `zcl_llm_so_js` class is a test class that implements the `zif_llm_so` interface. It provides a set of methods for creating and manipulating JSON schema definitions. The class is designed to work with the `zif_llm_so` interface, which is not shown in the provided code.

## Dependencies

The class depends on the following external objects:

* `zif_llm_so`: The interface that the class implements.
* `cl_abap_datadescr`: A class used to create data descriptors.
* `cl_abap_typedescr`: A class used to create type descriptors.
* `cl_abap_structdescr`: A class used to create structure descriptors.
* `cl_abap_tabledescr`: A class used to create table descriptors.
* `cl_abap_elemdescr`: A class used to create element descriptors.

## Details

The class provides the following public methods:

* `append_to_schema`: Appends a string to the schema definition.
* `get_field_info`: Returns a field information object.
* `get_path`: Returns the path of a field.
* `get_enum_values`: Returns the enum values for a description.
* `process_type`: Processes a type descriptor.
* `process_structure`: Processes a structure descriptor.
* `process_table`: Processes a table descriptor.
* `process_element`: Processes an element descriptor.
* `get_datatype`: Returns the data type of a field.
* `get_schema`: Returns the schema definition.
* `set_schema`: Sets the schema definition.

The class uses the following logic flow:

* The `append_to_schema` method appends a string to the schema definition.
* The `get_field_info` method returns a field information object.
* The `get_path` method returns the path of a field.
* The `get_enum_values` method returns the enum values for a description.
* The `process_type` method processes a type descriptor.
* The `process_structure` method processes a structure descriptor.
* The `process_table` method processes a table descriptor.
* The `process_element` method processes an element descriptor.
* The `get_datatype` method returns the data type of a field.
* The `get_schema` method returns the schema definition.
* The `set_schema` method sets the schema definition.

The class interacts with the following foreign objects:

* `zif_llm_so`: The interface that the class implements.
* `cl_abap_datadescr`: A class used to create data descriptors.
* `cl_abap_typedescr`: A class used to create type descriptors.
* `cl_abap_structdescr`: A class used to create structure descriptors.
* `cl_abap_tabledescr`: A class used to create table descriptors.
* `cl_abap_elemdescr`: A class used to create element descriptors.

Here is a Mermaid diagram that visualizes the logic flow of the class:

```mermaid
graph LR
    A[append_to_schema] -->|appends string to schema| B[get_field_info]
    B -->|returns field info| C[process_type]
    C -->|processes type descriptor| D[process_structure]
    D -->|processes structure descriptor| E[process_table]
    E -->|processes table descriptor| F[process_element]
    F -->|processes element descriptor| G[get_datatype]
    G -->|returns data type| H[get_schema]
    H -->|returns schema definition| I[set_schema]
    I -->|sets schema definition| J[pre_schema]
    J -->|sets schema definition| K[post_schema]
```

Note that this diagram is not exhaustive and only shows the main interactions between the methods and foreign objects.
