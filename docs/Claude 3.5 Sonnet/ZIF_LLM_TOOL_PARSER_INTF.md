---
title: ZIF_LLM_TOOL_PARSER
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_TOOL_PARSER

AI Generated documentation.
## Overview
The `ZIF_LLM_TOOL_PARSER` interface provides functionality to parse tool definitions. It contains:

**Methods:**
- `PARSE`: Parses a tool definition based on a data descriptor and optional descriptions, returning a string result

**Types:**
- `DEF_DESCRIPTION`: Structure containing:
  - `fieldname`: String field name
  - `description`: String description
  - `enum_values`: Table of string values for enumerations
- `DEF_DESCRIPTIONS`: Standard table of DEF_DESCRIPTION entries with fieldname as key

```mermaid
classDiagram
    class ZIF_LLM_TOOL_PARSER {
        +parse(data_desc: REF TO cl_abap_datadescr, descriptions: def_descriptions) string
    }
```

## Dependencies
- `CL_ABAP_DATADESCR`: ABAP Runtime Type Services
- `ZCX_LLM_VALIDATION`: Custom exception class for validation errors

