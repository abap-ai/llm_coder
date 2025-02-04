---
title: ZCL_LLM_DEFAULT_IMPL
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_DEFAULT_IMPL

AI Generated documentation.

## Overview

The class `ZCL_LLM_DEFAULT_IMPL` serves as a default implementation provider for various LLM (Large Language Model) related functionalities. It implements the interfaces `IF_BADI_INTERFACE` and `ZIF_LLM_DEFAULT_IMPL`.

Public methods:

- `GET_ENCRYPTION_IMPL` - Returns encryption implementation
- `GET_JSON_IMPL` - Returns JSON handling class name
- `GET_CALL_LOGGER_IMPL` - Returns call logging implementation  
- `GET_STATISTICS_IMPL` - Returns statistics implementation
- `GET_AUTHORIZATION_IMPL` - Returns authorization implementation

## Dependencies

The class depends on the following implementations:

- `ZCL_LLM_ENCRYPTION`
- `ZCL_LLM_CALL_LOGGER`
- `ZCL_LLM_STATISTICS`
- `ZCL_LLM_AUTH_DISABLED`
- `/UI2/CL_JSON`

## Details

The class follows a singleton pattern for its dependencies, storing instances as static references. Each getter method checks if the corresponding instance exists and creates it if needed.

```mermaid
classDiagram
    class ZCL_LLM_DEFAULT_IMPL {
        +get_encryption_impl()
        +get_json_impl()
        +get_call_logger_impl() 
        +get_statistics_impl()
        +get_authorization_impl()
    }
    ZCL_LLM_DEFAULT_IMPL ..> ZCL_LLM_ENCRYPTION
    ZCL_LLM_DEFAULT_IMPL ..> ZCL_LLM_CALL_LOGGER
    ZCL_LLM_DEFAULT_IMPL ..> ZCL_LLM_STATISTICS  
    ZCL_LLM_DEFAULT_IMPL ..> ZCL_LLM_AUTH_DISABLED
    ZCL_LLM_DEFAULT_IMPL ..> /UI2/CL_JSON
```

The class acts as a central factory for LLM-related functionality implementations. All getter methods except `GET_JSON_IMPL` follow the same pattern of lazy initialization, creating instances only when first requested.
