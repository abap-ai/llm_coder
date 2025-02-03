---
title: ZCL_LLM_CLIENT_AZUREOAI
type: CLAS
parent_object: ZLLM_CLIENT_AZUREOAI
parent_type: DEVC
---

# Class ZCL_LLM_CLIENT_AZUREOAI

AI Generated documentation.
## Overview
The `zcl_llm_client_azureoai` is a specialized ABAP class for interacting with Azure OpenAI services. It is a concrete implementation of an LLM (Large Language Model) client, inheriting from a base client class and implementing specific Azure OpenAI authentication and communication methods. 

Key public methods:
- `get_client()`: A factory method to create a new Azure OpenAI client instance
- `constructor()`: Initializes the client with configuration parameters

The class is designed with a private constructor, enforcing controlled instantiation through the `get_client()` method.

## Dependencies
- `zcl_llm_http_client_wrapper`: For HTTP client creation
- `zcl_llm_common`: For accessing LLM Business Add-In (BADI)
- `zcx_llm_validation` and `zcx_llm_authorization`: Custom exception classes
- Encryption implementation for handling encrypted authentication

## Details
The class implements several key methods to customize Azure OpenAI interaction:

```mermaid
classDiagram
    class zcl_llm_client_azureoai {
        +get_client()
        -get_http_client()
        -set_auth()
        -create_structured_output()
        -get_chat_endpoint()
    }
    note "Inherits from base LLM client\nImplements Azure-specific methods" as NoteA
```

Authentication mechanism highlights:
- Supports encrypted and non-encrypted authentication
- Uses BADI for decryption of sensitive credentials
- Sets API key in HTTP headers for authentication

Endpoint configuration:
- Dynamic endpoint generation based on provider model
- Fixed API version (currently '2024-10-21')
- Constructs chat completion endpoint dynamically

The class follows a strategy of dependency injection and configuration, allowing flexible setup of Azure OpenAI client instances with different configurations and authentication methods.

