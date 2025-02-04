---
title: ZIF_LLM_TOOL_PARSER
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_TOOL_PARSER

AI Generated documentation.

## Overview

The `zif_llm_tool_parser` interface defines a contract for parsing tool definitions with the following key characteristics:

- Defines a custom type `def_description` to represent field descriptions with:

  - `fieldname`: Name of the field
  - `description`: Textual description of the field
  - `enum_values`: Optional list of enumeration values

- Provides a single method `parse()` which:

  - Takes a data descriptor and optional descriptions
  - Returns a string representation of the parsed tool
  - Can raise a validation exception if parsing fails

### Method Signature

```abap
METHODS parse
  IMPORTING
    data_desc      TYPE REF TO cl_abap_datadescr
    descriptions   TYPE def_descriptions OPTIONAL
  RETURNING VALUE(result) TYPE string
  RAISING
    zcx_llm_validation
```

## Dependencies

- `cl_abap_datadescr`: ABAP runtime type services for data description
- `zcx_llm_validation`: Custom validation exception class
