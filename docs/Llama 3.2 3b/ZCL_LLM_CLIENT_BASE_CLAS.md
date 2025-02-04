---
title: ZCL_LLM_CLIENT_BASE
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_CLIENT_BASE

AI Generated documentation.

## Overview

The `zcl_llm_client_base` class is an abstract base class that provides a foundation for building LLM (Large Language Model) clients. It defines the common interface and methods for interacting with LLM providers, handling HTTP responses, and parsing structured output. The class is designed to be extended by concrete provider-specific classes.

## Dependencies

The class depends on the following external objects:

* `zif_llm_client`: The interface for the LLM client.
* `zif_llm_http_client_wrapper`: The interface for the HTTP client wrapper.
* `zif_llm_tool_parser`: The interface for the tool parser.
* `zif_llm_statistics`: The interface for the statistics collector.
* `zcl_llm_options`: The class for handling options.
* `zcl_llm_chat_request`: The class for building chat requests.

## Details

### Public Methods

The class provides the following public methods:

* `constructor`: Initializes the client with the provided configuration.
* `build_request_json`: Builds the JSON request payload.
* `handle_http_response`: Handles the HTTP response from the LLM provider.
* `parse_message`: Parses the message from the LLM provider.
* `create_structured_output`: Creates a structured output object.
* `parse_structured_output`: Parses the structured output from the LLM provider.
* `chat`: Initiates a chat session with the LLM provider.
* `new_request`: Creates a new chat request object.
* `get_client`: Retrieves the client instance from the provider.

### Main Interactions

The class interacts with the following objects:

* `zif_llm_client`: The interface for the LLM client.
* `zif_llm_http_client_wrapper`: The interface for the HTTP client wrapper.
* `zif_llm_tool_parser`: The interface for the tool parser.
* `zif_llm_statistics`: The interface for the statistics collector.
* `zcl_llm_options`: The class for handling options.
* `zcl_llm_chat_request`: The class for building chat requests.

### Logic Flow

The class follows the following logic flow:

1. The `constructor` initializes the client with the provided configuration.
2. The `build_request_json` method builds the JSON request payload.
3. The `handle_http_response` method handles the HTTP response from the LLM provider.
4. The `parse_message` method parses the message from the LLM provider.
5. The `create_structured_output` method creates a structured output object.
6. The `parse_structured_output` method parses the structured output from the LLM provider.
7. The `chat` method initiates a chat session with the LLM provider.
8. The `new_request` method creates a new chat request object.
9. The `get_client` method retrieves the client instance from the provider.

### Mermaid Diagram

```mermaid
graph LR
    A[Client Constructor] -->|init|> B[Client Configuration]
    B -->|set|> C[HTTP Client Wrapper]
    C -->|communicate|> D[HTTP Response]
    D -->|parse|> E[Message Parsing]
    E -->|create|> F[Structured Output]
    F -->|parse|> G[Structured Output Parsing]
    G -->|return|> H[Chat Response]
    H -->|send|> I[Chat Session]
```

This mermaid diagram illustrates the main interactions between the class and external objects, as well as the logic flow of the class.
