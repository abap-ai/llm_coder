---
title: ZCL_LLM_CLIENT_OPENAI
type: CLAS
parent_object: ZLLM_CLIENT_OPENAI
parent_type: DEVC
---

# Class ZCL_LLM_CLIENT_OPENAI

AI Generated documentation.

## Overview

The `zcl_llm_client_openai` class is a subclass of `zcl_llm_client_base` and provides a client for interacting with the OpenAI API. The class has two main public methods: `get_client` and `constructor`. The `get_client` method creates a new instance of the `zcl_llm_client_openai` class and returns it, while the `constructor` method initializes the class with client and provider configurations.

## Dependencies

The class depends on the following external objects:

- `zcl_llm_client_base`
- `zcl_llm_common`
- `zcl_llm_http_client_wrapper`
- `zcl_llm_providers`
- `zcl_llm_so_js_oa`

## Details

### Class Flow Diagram

```mermaid
graph LR
    A[Client Config] -->|set|> B[Constructor]
    B -->|create|> C[Get Client]
    C -->|create|> D[Get Chat Endpoint]
    D -->|set|> E[Set Auth]
    E -->|create|> F[Create Structured Output]
    F -->|create|> G[Get HTTP Client]
```

### Interaction with Foreign Objects

The class interacts with the following foreign objects:

- `zcl_llm_client_base`: The superclass provides a basic implementation for client interactions.
- `zcl_llm_common`: The class uses the `get_llm_badi` function to retrieve the encryption implementation.
- `zcl_llm_http_client_wrapper`: The class uses this object to create an HTTP client.
- `zcl_llm_providers`: The class uses the provider configuration to set authentication headers.
- `zcl_llm_so_js_oa`: The class uses this object to create a structured output.

### Authentication

The class sets authentication headers using the `provider_config-auth_encrypted` and `provider_config-auth_type` fields. If `provider_config-auth_type` is set to 'A', the class sets the `Authorization` header with the decrypted authentication value.

### Structured Output

The class creates a structured output using the `zcl_llm_so_js_oa` object.

### HTTP Client

The class creates an HTTP client using the `zcl_llm_http_client_wrapper` object.
