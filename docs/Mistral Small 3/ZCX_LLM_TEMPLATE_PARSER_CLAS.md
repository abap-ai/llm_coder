---
title: ZCX_LLM_TEMPLATE_PARSER
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCX_LLM_TEMPLATE_PARSER

AI Generated documentation.

## Overview

The `ZCX_LLM_TEMPLATE_PARSER` class is a final, public class that inherits from `CX_STATIC_CHECK`. It implements the interfaces `IF_T100_DYN_MSG` and `IF_T100_MESSAGE`. The class is designed to handle template parsing and validation, providing a structured way to manage and report errors during the parsing process. The main public method is the constructor, which initializes the object with optional parameters.

## Dependencies

The class depends on the following interfaces:

- `IF_T100_DYN_MSG`
- `IF_T100_MESSAGE`

## Details

The class defines a set of constants that represent various error messages, each with a unique message ID and number. These constants are used to standardize error reporting within the class. The class also defines several data attributes (`MSGV1`, `MSGV2`, `MSGV3`, `MSGV4`) of type `SYMSGV`, which are likely used to store error messages or related information.

The constructor method initializes the object and sets up the error message handling. It takes several optional parameters, including `TEXTID`, `PREVIOUS`, `MSGV1`, and `MSGV2`. The constructor calls the superclass constructor and then sets the `TEXTID` and message variables accordingly.

```mermaid
classDiagram
    class ZCX_LLM_TEMPLATE_PARSER {
        +CONSTRUCTOR(TEXTID: like IF_T100_MESSAGE=>T100KEY, PREVIOUS: like PREVIOUS, MSGV1: type SYMSGV, MSGV2: type SYMSGV)
        -MSGV1: SYMSGV
        -MSGV2: SYMSGV
        -MSGV3: SYMSGV
        -MSGV4: SYMSGV
        -zcx_llm_template_parser: CONSTANT
        -unclosed_token: CONSTANT
        -unclosed_control_structure: CONSTANT
        -invalid_variable_path: CONSTANT
        -invalid_table_index: CONSTANT
        -unsupported_variable_type: CONSTANT
        -variable_resolution_error: CONSTANT
        -condition_evaluation_error: CONSTANT
        -unknown_filter: CONSTANT
        -invalid_condition: CONSTANT
        -invalid_operator: CONSTANT
        -invalid_loop_syntax: CONSTANT
        -invalid_loop_collection: CONSTANT
        -unclosed_loop: CONSTANT
        -INVALID_ESCAPE_SEQUENCE: CONSTANT
        -MISMATCHED_TOKEN: CONSTANT
        -LOOP_INITIALIZATION_ERROR: CONSTANT
        -UNEXPECTED_ENDFOR: CONSTANT
        -UNEXPECTED_ELSE: CONSTANT
        -UNEXPECTED_ENDIF: CONSTANT
        -UNEXPECTED_ELIF: CONSTANT
    }

    ZCX_LLM_TEMPLATE_PARSER --|> CX_STATIC_CHECK
    ZCX_LLM_TEMPLATE_PARSER ..|> IF_T100_DYN_MSG
    ZCX_LLM_TEMPLATE_PARSER ..|> IF_T100_MESSAGE
```

The constructor logic can be visualized as follows:

```mermaid
graph TD
    A[Start] --> B[Call Superclass Constructor]
    B --> C{Check if TEXTID is Initial}
    C -- Yes --> D[Set Default TEXTID]
    C -- No --> E[Set Provided TEXTID]
    D --> F[Set MSGV1 and MSGV2]
    E --> F
    F --> G[End]
```

This diagram illustrates the flow of the constructor method, showing how it initializes the object and sets the necessary attributes based on the provided parameters.
