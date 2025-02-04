---
title: ZIF_LLM_SO
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_SO

AI Generated documentation.

## Overview

The `zif_llm_so` interface provides a structured output support for SAP ABAP. It offers methods to set the schema for the structured output and retrieve the converted schema.

## Dependencies

- `CL_ABAP_DATADESCR` class for data type definition

### Interface Documentation

### Methods

#### set_schema

- **Description**: Sets the schema for the structured output.
- **Parameters**:
  - `data_desc`: A reference to the `CL_ABAP_DATADESCR` class based on the datatype to be used.
  - `description`: Field descriptions for more details (optional).
- **Raises**: `ZCX_LL_M_VALIDATION` exception.

#### get_schema

- **Description**: Retrieves the converted schema.
- **Returns**: The converted schema as a string.

#### get_datatype

- **Description**: Mostly used internally to get the data type definition.
- **Returns**: A reference to the `CL_ABAP_DATADESCR` class representing the data type definition.

### Types

#### def_description

- **Description**: Represents a field description with field name, description, and enum values.

#### def_descriptions

- **Description**: A table of `def_description` types with a key on the field name.
