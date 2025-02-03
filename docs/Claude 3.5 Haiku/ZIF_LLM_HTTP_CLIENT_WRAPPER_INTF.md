---
title: ZIF_LLM_HTTP_CLIENT_WRAPPER
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_HTTP_CLIENT_WRAPPER

AI Generated documentation.
## Overview

The `zif_llm_http_client_wrapper` interface defines a standardized HTTP client wrapper with the following key methods:

1. **get_client** (Class Method):
   - Creates and returns an HTTP client instance
   - Takes client and provider configuration as input
   - Can raise a validation exception

2. **set_header**:
   - Allows setting HTTP headers
   - Supports overwriting existing headers
   - Can raise a validation exception

3. **set_url**:
   - Sets the URL for the HTTP endpoint
   - Prepends the SM59 destination path
   - Can raise a validation exception

4. **communicate**:
   - Sends a request to the endpoint
   - Supports session ID and message handling
   - Returns a structured response
   - Can raise an HTTP error exception

5. **close_client**:
   - Closes the HTTP client connection

The interface defines a `response` type with properties like HTTP code, message, response text, and HTTP response object.

## Dependencies

- Custom exception classes: 
  - `zcx_llm_validation`
  - `zcx_llm_http_error`
- Configuration types:
  - `zllm_clnt_config`
  - `zllm_providers`
- Standard SAP interfaces like `if_http_response`

