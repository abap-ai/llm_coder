---
title: ZCX_LLM_TEMPLATE_PARSER
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCX_LLM_TEMPLATE_PARSER

AI Generated documentation.
## Overview
The `ZCX_LLM_TEMPLATE_PARSER` class is a custom exception class designed to handle errors related to template parsing in a large language model (LLM) system. It inherits from `CX_STATIC_CHECK` and provides a set of constants and methods to handle various error scenarios.

## Dependencies
The class depends on the following external objects:

* `IF_T100_MESSAGE`: an interface for message handling
* `IF_T100_DYN_MSG`: an interface for dynamic message handling
* `SYMSGV`: a global variable for message values

## Details
### Class Structure and Methods

The class has the following public methods:

* `CONSTRUCTOR`: initializes the exception object with optional parameters for text ID, previous message, and message values
* `##ADT_SUPPRESS_GENERATION`: suppresses generation of the class

The class has the following constants:

* `zcx_llm_template_parser`: a constant for the main error message
* `unclosed_token`, `unclosed_control_structure`, `invalid_variable_path`, `invalid_table_index`, `unsupported_variable_type`, `variable_resolution_error`, `condition_evaluation_error`, `unknown_filter`, `invalid_condition`, `invalid_operator`, `invalid_loop_syntax`, `invalid_loop_collection`, `unclosed_loop`, `INVALID_ESCAPE_SEQUENCE`, `MISMATCHED_TOKEN`, `LOOP_INITIALIZATION_ERROR`, `UNEXPECTED_ENDFOR`, `UNEXPECTED_ELSE`, `UNEXPECTED_ENDIF`, and `UNEXPECTED_ELIF`: constants for specific error messages

### Interaction with Foreign Objects

The class interacts with the following foreign objects:

* `IF_T100_MESSAGE`: the class uses the `IF_T100_MESSAGE` interface to handle messages
* `SYMSGV`: the class uses the `SYMSGV` global variable to store message values

### Logic Flow

The class follows a simple logic flow:

1. The `CONSTRUCTOR` method initializes the exception object with optional parameters.
2. The `##ADT_SUPPRESS_GENERATION` method suppresses generation of the class.
3. The class uses the `IF_T100_MESSAGE` interface to handle messages and the `SYMSGV` global variable to store message values.

```mermaid
graph LR
    A[CONSTRUCTOR] -->|init|> B[IF_T100_MESSAGE]
    B -->|handle message|> C[variable resolution]
    C -->|check variable type|> D[unsupported_variable_type]
    D -->|check variable path|> E[invalid_variable_path]
    E -->|check table index|> F[invalid_table_index]
    F -->|check loop syntax|> G[invalid_loop_syntax]
    G -->|check loop initialization|> H[LOOP_INITIALIZATION_ERROR]
    H -->|check endfor|> I[UNEXPECTED_ENDFOR]
    I -->|check else|> J[UNEXPECTED_ELSE]
    J -->|check endif|> K[UNEXPECTED_ENDIF]
    K -->|check elif|> L[UNEXPECTED_ELIF]
    L -->|check mismatched token|> M[MISMATCHED_TOKEN]
    M -->|check invalid escape sequence|> N[INVALID_ESCAPE_SEQUENCE]
    N -->|check unclosed loop|> O[unclosed_loop]
    O -->|check unclosed control structure|> P[unclosed_control_structure]
    P -->|check unclosed token|> Q[unclosed_token]
```

