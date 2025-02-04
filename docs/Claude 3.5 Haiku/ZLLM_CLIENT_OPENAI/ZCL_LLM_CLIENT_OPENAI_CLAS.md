---
title: ZCL_LLM_CLIENT_OPENAI
type: CLAS
parent_object: ZLLM_CLIENT_OPENAI
parent_type: DEVC
---

# Class ZCL_LLM_CLIENT_OPENAI

AI Generated documentation.

## Overview

The `zcl_llm_client_openai` class is a specialized implementation for interacting with OpenAI's language model API. It is a concrete implementation of a language model client, designed to handle authentication, endpoint configuration, and client creation for OpenAI's chat completion services. The class follows a singleton-like pattern with a private constructor and a class method `get_client()` for obtaining instances.

Public methods include:

- `get_client()`: Static method to create and return a new client instance
- `constructor()`: Initializes the client with configuration parameters

## Dependencies

- `zcl_llm_client_base`: Base class for language model clients
- `zcl_llm_common`: Utility class for retrieving BADIs
- `zcl_llm_http_client_wrapper`: HTTP client creation utility
- `zcl_llm_so_js_oa`: Structured output handler for OpenAI responses

## Details

The class implements several key protected methods to customize the OpenAI client behavior:

```mermaid
classDiagram
    class zcl_llm_client_openai {
        +get_client()
        -get_chat_endpoint()
        -set_auth()
        -create_structured_output()
        -get_http_client()
    }
    note "Overrides base class methods\nto provide OpenAI-specific implementation" as NoteOverride
```

Key implementation details:

- Authentication is handled by decrypting an encrypted token if provided
- Uses a Bearer token authentication method
- Hardcoded chat completion endpoint `/chat/completions`
- Utilizes a factory method pattern for client creation
- Supports configuration through `client_config` and `provider_config` parameters

The class is designed to be extensible and configurable, allowing different authentication and client setup scenarios while maintaining a consistent interface for language model interactions.
