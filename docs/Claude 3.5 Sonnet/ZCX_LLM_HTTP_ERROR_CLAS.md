---
title: ZCX_LLM_HTTP_ERROR
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCX_LLM_HTTP_ERROR

AI Generated documentation.
## Overview
`ZCX_LLM_HTTP_ERROR` is a custom exception class for handling HTTP-related errors. It inherits from `CX_STATIC_CHECK` and implements the `IF_T100_MESSAGE` interface for message handling. 

The class defines four main error scenarios through constants:
- `HTTP_CLIENT_NOT_INITIALIZED`: When HTTP client initialization fails
- `HTTP_COMMUNICATION_FAILURE`: For communication errors
- `HTTP_PROCESSING_FAILED`: When HTTP request processing fails
- `HTTP_OTHERS`: For handling other HTTP-related errors

Each error can store up to 4 string attributes (`MV_ATTR1` to `MV_ATTR4`) for additional error context.

Public methods:
- `CONSTRUCTOR`: Creates exception instance with optional text ID, attributes, and previous exception

## Dependencies
- Inherits from `CX_STATIC_CHECK`
- Implements `IF_T100_MESSAGE`
- Uses message class `ZLLM_CLIENT`

## Details
The class follows SAP's standard exception handling pattern with T100 messages. Each error constant defines:
- Message ID (`ZLLM_CLIENT`)
- Message number
- Attribute mappings

```mermaid
classDiagram
    CX_STATIC_CHECK <|-- ZCX_LLM_HTTP_ERROR
    ZCX_LLM_HTTP_ERROR ..|> IF_T100_MESSAGE
    
    class ZCX_LLM_HTTP_ERROR {
        +MV_ATTR1: STRING
        +MV_ATTR2: STRING
        +MV_ATTR3: STRING
        +MV_ATTR4: STRING
        +CONSTRUCTOR(TEXTID, ATTR1, ATTR2, ATTR3, ATTR4, PREVIOUS)
    }
```

The constructor implementation ensures proper message handling by:
1. Calling the parent constructor with previous exception
2. Setting attribute values
3. Setting the text ID (using default if none provided)

