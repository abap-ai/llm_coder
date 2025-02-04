---
title: ZIF_LLM_HTTP_CLIENT_WRAPPER
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_HTTP_CLIENT_WRAPPER

AI Generated documentation.

## Overview

The `zif_llm_http_client_wrapper` interface provides a structured way to interact with HTTP clients, encapsulating the configuration, header management, URL setting, and communication processes. Below is an overview of the public methods:

### Class Methods

- **get_client**
  - **Purpose**: Retrieves an instance of the HTTP client wrapper.
  - **Parameters**:
    - `client_config` (TYPE `zllm_clnt_config`): Configuration settings for the client.
    - `provider_config` (TYPE `zllm_providers`): Configuration settings for the provider.
  - **Returns**: A reference to an instance of `zif_llm_http_client_wrapper`.
  - **Exceptions**: Raises `zcx_llm_validation` if validation fails.

### Instance Methods

- **set_header**
  - **Purpose**: Sets a header value. If the same header is set multiple times, the previous value is overwritten.
  - **Parameters**:
    - `name` (TYPE `string`): The name of the header.
    - `value` (TYPE `string`): The value of the header.
  - **Exceptions**: Raises `zcx_llm_validation` if validation fails.

- **set_url**
  - **Purpose**: Sets the URL to be called. The SM59 destination path will be prepended to the URL.
  - **Parameters**:
    - `url` (TYPE `string`): The URL to be set.
  - **Exceptions**: Raises `zcx_llm_validation` if validation fails.

- **communicate**
  - **Purpose**: Calls the endpoint with the specified request and session ID.
  - **Parameters**:
    - `request` (TYPE `string`): The request payload.
    - `session_id` (TYPE `zllm_session_id`): The session ID for the request.
    - `msg` (TYPE `i`): A message indicator.
  - **Returns**: A `response` structure containing the HTTP response details.
  - **Exceptions**: Raises `zcx_llm_http_error` if an HTTP error occurs.

- **close_client**
  - **Purpose**: Closes the HTTP client.

## Dependencies

- `zllm_clnt_config`: Configuration settings for the client.
- `zllm_providers`: Configuration settings for the provider.
- `zllm_session_id`: Session ID for the request.
- `zcx_llm_validation`: Exception raised for validation errors.
- `zcx_llm_http_error`: Exception raised for HTTP errors.
- `if_http_response`: Interface for HTTP response handling.
