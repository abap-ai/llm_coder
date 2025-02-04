---
title: ZCL_LLM_SO_JS
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_SO_JS

AI Generated documentation.

## Overview

The `ZCL_LLM_SO_JS` class implements a JSON Schema generator for ABAP data structures. It implements the `ZIF_LLM_SO` interface and provides functionality to:

1. Convert ABAP data structures to JSON Schema format (`SET_SCHEMA`)
2. Retrieve the generated JSON Schema (`GET_SCHEMA`)
3. Access the data type descriptor (`GET_DATATYPE`)

The class handles:

- Structure to JSON Schema conversion
- Table type conversion to array definitions
- Elementary type mapping (integers, floats, strings, booleans)
- Field descriptions and enumeration values
- Nested structure hierarchies
- Required field specifications
- Property naming and title generation

## Dependencies

- `ZIF_LLM_SO` interface
- `ZCX_LLM_VALIDATION` exception class
- ABAP Type Description classes (`CL_ABAP_TYPEDESCR` and its subclasses)

## Details

The class follows a recursive processing pattern to handle nested ABAP structures. The main processing flow can be visualized as:

```mermaid
flowchart TD
    A[SET_SCHEMA] --> B{Check Type}
    B -->|Structure| C[Process Structure]
    B -->|Table| D[Process Table]
    B -->|Elementary| E[Process Element]
    B -->|Other| F[Raise Exception]
    
    C --> G[Process Components]
    G --> H{More Components?}
    H -->|Yes| G
    H -->|No| I[Generate Required Fields]
    
    D --> J[Process Table Line Type]
    E --> K[Map ABAP Type to JSON Type]
    
    K --> L[Add Descriptions]
    L --> M[Add Enumerations]
```

The class uses a protected field info structure to track:

- Field names
- Field paths for nested structures
- Field descriptions

Key implementation aspects:

- Maintains case sensitivity handling through lowercase conversion
- Implements JSON Schema validation constraints
- Handles special cases for boolean fields
- Provides extension points through pre/post processing methods
- Generates proper JSON Schema syntax including commas and brackets
- Supports description escaping for JSON compatibility
- Implements strict schema validation with `additionalProperties: false`
