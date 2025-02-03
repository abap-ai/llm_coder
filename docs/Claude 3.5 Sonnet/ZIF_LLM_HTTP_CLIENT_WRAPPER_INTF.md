---
title: ZIF_LLM_HTTP_CLIENT_WRAPPER
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_HTTP_CLIENT_WRAPPER

AI Generated documentation.
## Overview
The `ZIF_LLM_HTTP_CLIENT_WRAPPER` interface provides a wrapper for HTTP client functionality with the following key methods:

- `GET_CLIENT` (static) - Creates a new HTTP client instance based on client and provider configuration
- `SET_HEADER` - Sets or updates HTTP header values 
- `SET_URL` - Sets the target URL, automatically prepending the SM59 destination path
- `COMMUNICATE` - Executes the HTTP request with given payload and session information
- `CLOSE_CLIENT` - Closes the HTTP client connection

The interface defines a `RESPONSE` type structure containing:
```abap
TYPES: BEGIN OF response,
  code          TYPE sysubrc,        "Return code
  message       TYPE string,         "Response message
  response      TYPE string,         "Response body
  http_response TYPE REF TO if_http_response,
END OF response.
```

## Dependencies
- `IF_HTTP_RESPONSE` - SAP standard HTTP response interface
- `ZCX_LLM_VALIDATION` - Custom validation exception class
- `ZCX_LLM_HTTP_ERROR` - Custom HTTP error exception class
- `ZLLM_CLNT_CONFIG` - Client configuration type
- `ZLLM_PROVIDERS` - Provider configuration type
- `ZLLM_SESSION_ID` - Session ID type

