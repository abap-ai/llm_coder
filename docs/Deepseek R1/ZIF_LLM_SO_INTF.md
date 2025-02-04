---
title: ZIF_LLM_SO
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_SO

AI Generated documentation.

## Overview  

Interface `ZIF_LLM_SO` provides structured output schema management for ABAP data types.  

**Key Methods**:  

- **`SET_SCHEMA`**:  
  Defines the schema structure using a `CL_ABAP_DATADESCR` reference and optional field descriptions. Validates input and raises `ZCX_LLM_VALIDATION` on errors.  
  Parameters:  
  - `DATA_DESC`: Data type descriptor (e.g., structure/table type)  
  - `DESCRIPTION`: Optional field metadata (names, descriptions, enum values)  

- **`GET_SCHEMA`**:  
  Returns the schema in a standardized string format (e.g., JSON schema).  

- **`GET_DATATYPE`**:  
  Retrieves the internal data type reference (`CL_ABAP_DATADESCR`), primarily for internal processing.  

## Dependencies  

- **`CL_ABAP_DATADESCR`**: Core ABAP type description class for data type handling.  
- **`ZCX_LLM_VALIDATION`**: Custom exception class for schema validation errors.
