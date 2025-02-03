---
title: ZIF_LLM_SO
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_SO

AI Generated documentation.
## Overview

The `ZIF_LLM_SO` interface provides support for structured output with the following key methods:

1. `SET_SCHEMA`
   - Purpose: Defines the schema for structured output
   - Imports:
     - `data_desc`: A reference to `CL_ABAP_DATADESCR` specifying the data type
     - `description`: Optional field descriptions
   - Can raise a validation exception (`ZCX_LLM_VALIDATION`)

2. `GET_SCHEMA`
   - Purpose: Retrieves the converted schema
   - Returns: Schema as a string

3. `GET_DATATYPE`
   - Purpose: Retrieves the underlying data type definition
   - Returns: Reference to `CL_ABAP_DATADESCR`

### Key Types
- `def_description`: A structure containing:
  - `fieldname`: Field name (string)
  - `description`: Field description (string)
  - `enum_values`: Possible enum values (string table)
- `def_descriptions`: Table of `def_description`

## Dependencies

- `CL_ABAP_DATADESCR`: ABAP runtime type services
- `ZCX_LLM_VALIDATION`: Custom validation exception class

