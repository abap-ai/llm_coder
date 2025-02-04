---
title: ZCL_LLM_DEFAULT_IMPL
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_DEFAULT_IMPL

AI Generated documentation.

## Overview

Provides default implementations for core LLM utility components through factory methods. Acts as central access point for encryption, statistics, logging, authorization and JSON handling services.

**Key Public Methods**:

- `GET_ENCRYPTION_IMPL`: Provides initialized encryption handler
- `GET_JSON_IMPL`: Returns standard JSON processor class
- `GET_CALL_LOGGER_IMPL`: Delivers configured API call logger
- `GET_STATISTICS_IMPL`: Supplies statistics tracking instance
- `GET_AUTHORIZATION_IMPL`: Offers authorization checker (disabled by default)

## Dependencies

- `zcl_llm_encryption`: Encryption implementation
- `zcl_llm_call_logger`: Call logging facility
- `zcl_llm_statistics`: Usage statistics tracker
- `zcl_llm_auth_disabled`: No-op authorization implementation
- `/UI2/CL_JSON`: Standard SAP JSON processor

## Details

```mermaid
classDiagram
    class zcl_llm_default_impl {
        +get_encryption_impl()
        +get_json_impl()
        +get_call_logger_impl()
        +get_statistics_impl()
        +get_authorization_impl()
        -enc_class
        -stat_class
        -log_class
        -auth_class
    }
    zcl_llm_default_impl --> zcl_llm_encryption : creates
    zcl_llm_default_impl --> zcl_llm_call_logger : creates
    zcl_llm_default_impl --> zcl_llm_statistics : creates
    zcl_llm_default_impl --> zcl_llm_auth_disabled : creates
    zcl_llm_default_impl --> /UI2/CL_JSON : returns class
```

**Implementation Notes**:

1. Uses lazy initialization pattern for all service objects
2. Singleton-like instance management through CLASS-DATA
3. Authorization defaults to disabled implementation (`zcl_llm_auth_disabled`)
4. JSON processor returns class reference instead of instance
5. All getter methods follow identical null-check/binding pattern except JSON method

**Security Consideration**: Default authorization implementation is intentionally
