---
title: ZCX_LLM_TEMPLATE_PARSER
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCX_LLM_TEMPLATE_PARSER

AI Generated documentation.

## Overview

The `ZCX_LLM_TEMPLATE_PARSER` class is a custom exception class for handling template parsing errors. It inherits from `CX_STATIC_CHECK` and implements the message interfaces `IF_T100_DYN_MSG` and `IF_T100_MESSAGE`.

The class defines a comprehensive set of exception constants for various parsing scenarios:

- Template structure errors (unclosed tokens, control structures)
- Variable handling errors (invalid paths, types, resolution)
- Loop processing errors (syntax, collection handling)
- Conditional statement errors (evaluation, invalid operators)
- Token matching and escape sequence errors

Public methods:

- `CONSTRUCTOR`: Creates exception instance with optional text ID, previous exception and message variables

## Dependencies

- Inherits from `CX_STATIC_CHECK`
- Implements `IF_T100_DYN_MSG`
- Implements `IF_T100_MESSAGE`

## Details

The class uses message catalog `ZLLM_CLIENT` with message numbers ranging from 022-042 to provide detailed error information. The error handling is structured into main categories:

```mermaid
graph TD
    A[Template Parser Exceptions] --> B[Structure Errors]
    A --> C[Variable Errors]
    A --> D[Control Flow Errors]
    A --> E[Syntax Errors]
    
    B --> B1[Unclosed Tokens]
    B --> B2[Control Structures]
    
    C --> C1[Invalid Paths]
    C --> C2[Type Errors]
    C --> C3[Resolution Errors]
    
    D --> D1[Loop Errors]
    D --> D2[Condition Errors]
    
    E --> E1[Token Mismatches]
    E --> E2[Escape Sequences]
```

The exception handling supports message variable substitution through the `MSGV1-MSGV4` attributes, allowing for context-specific error messages. Most error constants are designed to use `MSGV1` for detailed error information, while some complex errors like `MISMATCHED_TOKEN` utilize multiple message variables.
