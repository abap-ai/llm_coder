---
title: ZCL_LLM_CLIENT_ANTHROPIC
type: CLAS
parent_object: ZLLM_CLIENT_ANTHROPIC
parent_type: DEVC
---

# Class ZCL_LLM_CLIENT_ANTHROPIC

AI Generated documentation.

## Overview

The `zcl_llm_client_anthropic` class is a subclass of `zcl_llm_client_base` and is designed to interact with the Anthropic LLM (Large Language Model) API. It provides a set of methods to create and manage requests to the Anthropic API, parse responses, and handle errors.

## Dependencies

The class depends on the following external objects:

- `zcl_llm_client_base`
- `zcl_llm_http_client_wrapper`
- `zcl_llm_common`
- `zif_llm_client`
- `zif_llm_chat_request`
- `zcl_abap_format`

## Details

### Class Structure and Methods

The class has the following public methods:

- `get_client`: Creates a new instance of the `zcl_llm_client_anthropic` class and returns a reference to it.
- `constructor`: Initializes the class with the provided client and provider configurations.
- `zif_llm_client~new_request`: Redefines the method to support Anthropic-specific requirements.
- `build_request_json`: Builds the JSON payload for the request, including structured output and tool definitions.
- `parse_message`: Parses the message content and handles tool calls.
- `handle_http_response`: Handles the HTTP response from the Anthropic API, including error handling and parsing the response structure.

### Interaction with Foreign Objects

The class interacts with the following foreign objects:

```mermaid
graph LR
    A[Client Configuration] -->|set| B[Provider Configuration]
    B -->|set| C[LLM Client Base]
    C -->|create| D[zcl_llm_client_anthropic]
    D -->|get_client| E[LLM Client]
    E -->|new_request| F[Anthropic API]
    F -->|build_request_json| G[Request Payload]
    G -->|parse_message| H[Message Content]
    H -->|handle_http_response| I[HTTP Response]
```

### Logic Flow

The class follows the following logic flow:

1. `get_client` creates a new instance of the class.
2. `constructor` initializes the class with the provided client and provider configurations.
3. `zif_llm_client~new_request` is called to create a new request to the Anthropic API.
4. `build_request_json` builds the JSON payload for the request.
5. `parse_message` parses the message content and handles tool calls.
6. `handle_http_response` handles the HTTP response from the Anthropic API.
7. The class returns the parsed response to the caller.
