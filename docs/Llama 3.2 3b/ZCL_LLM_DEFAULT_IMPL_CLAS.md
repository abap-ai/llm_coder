---
title: ZCL_LLM_DEFAULT_IMPL
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_DEFAULT_IMPL

AI Generated documentation.
## Overview
The `zcl_llm_default_impl` class provides a default implementation for the `zif_llm_default_impl` interface. It offers methods for getting encryption, JSON, call logger, statistics, and authorization implementations. The class is designed to be used as a base class for other implementations.

## Dependencies
The class depends on the following interfaces and classes:
- `if_badi_interface`
- `zif_llm_encryption`
- `zif_llm_statistics`
- `zif_llm_call_logger`
- `zif_llm_auth`

## Details
### Method Overview

#### `zif_llm_default_impl~get_encryption_impl`
Gets the encryption implementation. If the encryption class is not bound, it creates a new instance of `zcl_llm_encryption`.

#### `zif_llm_default_impl~get_json_impl`
Gets the JSON implementation. This method always returns '/UI2/CL_JSON'.

#### `zif_llm_default_impl~get_call_logger_impl`
Gets the call logger implementation. If the call logger class is not bound, it creates a new instance of `zcl_llm_call_logger`.

#### `zif_llm_default_impl~get_statistics_impl`
Gets the statistics implementation. If the statistics class is not bound, it creates a new instance of `zif_llm_statistics`.

#### `zif_llm_default_impl~get_authorization_impl`
Gets the authorization implementation. If the authorization class is not bound, it creates a new instance of `zif_llm_auth_disabled`.

### Interaction Diagram
```mermaid
graph LR
    A[Get Encryption] -->|enc_class|> B[Create New Encryption Class]
    B -->|enc_class|> C[Return Encryption Class]
    A -->|enc_class|> D[Get JSON]
    D -->|JSON|> E[Return '/UI2/CL_JSON']
    A -->|enc_class|> F[Get Call Logger]
    F -->|log_class|> G[Create New Call Logger Class]
    G -->|log_class|> H[Return Call Logger Class]
    A -->|enc_class|> I[Get Statistics]
    I -->|stat_class|> J[Create New Statistics Class]
    J -->|stat_class|> K[Return Statistics Class]
    A -->|enc_class|> L[Get Authorization]
    L -->|auth_class|> M[Create New Authorization Class]
    M -->|auth_class|> N[Return Authorization Class]
```
This diagram illustrates the flow of the methods and how they interact with the class fields and other classes.

