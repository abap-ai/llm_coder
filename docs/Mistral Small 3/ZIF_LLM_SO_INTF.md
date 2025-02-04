---
title: ZIF_LLM_SO
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_SO

AI Generated documentation.

## Overview

The `ZIF_LLM_SO` interface provides methods to manage and retrieve structured output schemas. It includes the following public methods:

- **`SET_SCHEMA`**: Sets the schema for the structured output. This method takes a reference to a data description object and an optional table of field descriptions. It raises an exception if validation fails.

- **`GET_SCHEMA`**: Retrieves the converted schema as a string. This method is used to get the schema that has been set using the `SET_SCHEMA` method.

- **`GET_DATATYPE`**: Retrieves the data type definition. This method is primarily used internally to get the data type definition based on the schema.

## Dependencies

The interface depends on the following main components:

- **`CL_ABAP_DATDESCR`**: A reference to the data description object used to define the data type for the structured output.
- **`ZCX_LLM_VALIDATION`**: An exception class raised by the `SET_SCHEMA` method if validation fails.
