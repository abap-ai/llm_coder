---
title: ZCL_LLM_DEFAULT_IMPL
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_DEFAULT_IMPL

AI Generated documentation.
## Overview
The `zcl_llm_default_impl` class is a default implementation provider for various system components related to Large Language Model (LLM) interactions. It implements the `zif_llm_default_impl` interface and provides singleton-like access to key implementation classes for encryption, logging, statistics, and authorization.

Public methods include:
- `get_encryption_impl()`: Returns an encryption implementation
- `get_json_impl()`: Returns a JSON handling class
- `get_call_logger_impl()`: Returns a call logging implementation
- `get_statistics_impl()`: Returns a statistics tracking implementation
- `get_authorization_impl()`: Returns an authorization implementation

## Dependencies
- `zif_llm_encryption`
- `zif_llm_statistics`
- `zif_llm_call_logger`
- `zif_llm_auth`

## Details
The class uses a lazy initialization pattern for its implementation classes, creating instances only when first requested. 

```mermaid
classDiagram
    class zcl_llm_default_impl {
        -enc_class
        -stat_class
        -log_class
        -auth_class
        +get_encryption_impl()
        +get_json_impl()
        +get_call_logger_impl()
        +get_statistics_impl()
        +get_authorization_impl()
    }
    note "Lazy Initialization\nSingleton-like Access" as Note
```

Key implementation details:
- Uses class-level static references to cache implementation instances
- Provides a centralized point for retrieving default implementations
- Default authorization implementation uses a disabled authorization class
- JSON implementation directly returns the standard SAP JSON class path

The design allows for easy extension and replacement of core LLM interaction components through a centralized interface.

