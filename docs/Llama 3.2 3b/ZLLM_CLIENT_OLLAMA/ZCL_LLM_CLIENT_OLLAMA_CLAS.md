---
title: ZCL_LLM_CLIENT_OLLAMA
type: CLAS
parent_object: ZLLM_CLIENT_OLLAMA
parent_type: DEVC
---

# Class ZCL_LLM_CLIENT_OLLAMA

AI Generated documentation.
## Overview
The `zcl_llm_client_ollama` class is a subclass of `zcl_llm_client_base` and provides a client for interacting with the Ollama API. It is designed to handle chat requests and responses, and provides methods for building requests, handling HTTP responses, and parsing messages.

## Dependencies
The class depends on the following external objects:
- `zcl_llm_http_client_wrapper`: for creating an HTTP client
- `zcl_llm_common`: for encryption and decryption
- `zif_llm_client`: for interacting with the Ollama API
- `zif_llm_tool`: for interacting with tools

## Details
### Class Structure

```mermaid
class zcl_llm_client_ollama : zcl_llm_client_base
  +-- constructor
  +-- get_client
  +-- get_http_client
  +-- set_auth
  +-- build_request_json
  +-- get_chat_endpoint
  +-- handle_http_response
  +-- parse_message
```

### Main Interactions

The class interacts with the following external objects:

- `zcl_llm_http_client_wrapper`: for creating an HTTP client
- `zcl_llm_common`: for encryption and decryption
- `zif_llm_client`: for interacting with the Ollama API
- `zif_llm_tool`: for interacting with tools

### Logic Flow

The class follows the following logic flow:

1. The `get_client` method creates a new instance of the class and returns it.
2. The `get_http_client` method creates an HTTP client using `zcl_llm_http_client_wrapper`.
3. The `set_auth` method sets the authentication headers for the HTTP client.
4. The `build_request_json` method builds the request JSON by modifying the request and adding Ollama-specific format parameters.
5. The `get_chat_endpoint` method returns the chat endpoint URL.
6. The `handle_http_response` method handles the HTTP response and parses the message.
7. The `parse_message` method parses the message and returns the parsed data.

### Expert Notes

- The class uses a combination of encryption and decryption to secure the communication with the Ollama API.
- The class supports multiple tools and can handle tool-specific requests.
- The class uses a JSON-based format for the request and response data.
- The class provides a flexible way to handle chat requests and responses.

