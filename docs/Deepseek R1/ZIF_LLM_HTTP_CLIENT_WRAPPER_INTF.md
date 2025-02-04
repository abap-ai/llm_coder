---
title: ZIF_LLM_HTTP_CLIENT_WRAPPER
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_HTTP_CLIENT_WRAPPER

AI Generated documentation.

## Overview  

Interface `ZIF_LLM_HTTP_CLIENT_WRAPPER` provides a simplified abstraction for HTTP client operations in SAP systems.  

### Key Methods  

| Method             | Type       | Purpose                                                                                     | Exception Raised          |  
|--------------------|------------|---------------------------------------------------------------------------------------------|---------------------------|  
| `GET_CLIENT`       | Class      | Creates a client instance using provider and client configurations.                        | `ZCX_LLM_VALIDATION`      |  
| `SET_HEADER`       | Instance   | Sets/overwrites HTTP headers.                                                              | `ZCX_LLM_VALIDATION`      |  
| `SET_URL`          | Instance   | Defines the target URL (SM59 destination path is automatically prepended).                 | `ZCX_LLM_VALIDATION`      |  
| `COMMUNICATE`      | Instance   | Executes the HTTP request, returns response data (code, message, payload, HTTP reference).| `ZCX_LLM_HTTP_ERROR`      |  
| `CLOSE_CLIENT`     | Instance   | Releases HTTP client resources.                                                            | -                         |  

**Response Structure** (`RESPONSE` type):  

- `CODE`: HTTP status code  
- `MESSAGE`: Status message  
- `RESPONSE`: Payload as string  
- `HTTP_RESPONSE`: Reference to SAP HTTP response object  

## Dependencies  

- **Exceptions**:  
  - `ZCX_LLM_VALIDATION`: Raised during configuration/input validation errors.  
  - `ZCX_LLM_HTTP_ERROR`: Thrown for HTTP communication failures.  
- **SAP Framework**: Relies on `IF_HTTP_RESPONSE` for native HTTP handling.  
- **Data Structures**:  
  - `ZLLM_CLNT_CONFIG`: Client-specific configuration.  
  - `ZLLM_PROVIDERS`: Provider-specific settings (e.g., endpoints, credentials).
