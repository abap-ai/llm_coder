---
title: ZCL_LLM_CLIENT_OPENROUTER
type: CLAS
parent_object: ZLLM_CLIENT_OPENROUTER
parent_type: DEVC
---

# Class ZCL_LLM_CLIENT_OPENROUTER

AI Generated documentation.

## Overview

The `zcl_llm_client_openrouter` class is a subclass of `zcl_llm_client_base` and is responsible for creating an instance of the `zif_llm_client` interface. It provides methods for getting a client instance, initializing the client, and setting authentication headers.

## Dependencies

The class depends on the following:

* `zcl_llm_client_base`: The base class that `zcl_llm_client_openrouter` inherits from.
* `zcl_llm_http_client_wrapper`: A class that provides a method for getting an HTTP client instance.
* `zcl_llm_common`: A class that provides a method for getting the LLM BADI (Business Application Interface) implementation.

## Details

### Class Flow

```mermaid
graph LR
    A[Client Config] -->|Importing|> B[Constructor]
    B -->|Calling|> C[Initialize]
    C -->|Calling|> D[Get Client]
    D -->|Creating|> E[ZCL LLM Client]
    E -->|Setting|> F[Authentication Headers]
    F -->|Returning|> G[Client Instance]
```

### Interaction with Foreign Objects

The class interacts with the following foreign objects:

* `zcl_llm_http_client_wrapper`: Used to get an HTTP client instance.
* `zcl_llm_common`: Used to get the LLM BADI implementation.
* `zcl_llm_client_base`: The base class that `zcl_llm_client_openrouter` inherits from.

### Authentication Flow

The class sets authentication headers based on the `provider_config-auth_encrypted` and `provider_config-auth_type` fields.

```mermaid
graph LR
    A[Provider Config] -->|Auth Encrypted|> B[Encryption Implementation]
    B -->|Decrypting|> C[Auth Value]
    C -->|Setting Auth Type|> D[Authorization Header]
    D -->|Setting|> E[Authentication Headers]
```

### Method Breakdown

* `get_client`: Creates a new instance of the `zcl_llm_client_openrouter` class and returns a reference to the `zif_llm_client` interface.
* `constructor`: Initializes the client instance with the provided `client_config` and `provider_config` fields.
* `get_chat_endpoint`: Returns the chat endpoint URL.
* `get_http_client`: Gets an HTTP client instance using the `zcl_llm_http_client_wrapper` class.
* `set_auth`: Sets authentication headers based on the `provider_config-auth_encrypted` and `provider_config-auth_type` fields.
