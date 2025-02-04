---
title: ZCL_LLM_SO_JS_OR
type: CLAS
parent_object: ZLLM_CLIENT_OPENROUTER
parent_type: DEVC
---

# Class ZCL_LLM_SO_JS_OR

AI Generated documentation.

## Overview

The `zcl_llm_so_js_or` is a specialized ABAP class that extends the base class `zcl_llm_so_js`. It is designed to handle JSON schema generation with a specific focus on creating a strict "Response" schema. The class is final and publicly creatable, indicating it's intended for direct use without further inheritance.

The class provides two key method overrides:

- `pre_schema()`: Initiates the schema generation by appending the "Response" schema definition
- `post_schema()`: Closes the schema definition by appending a closing bracket

## Dependencies

- Parent Class: `zcl_llm_so_js`

## Details

The class appears to be part of a JSON schema generation framework, with specific customization for response schema creation.

```mermaid
graph LR
    A[pre_schema] --> B{Append Response Schema Start}
    B --> |Adds| C["name":"Response","strict":true,"schema":{]
    D[post_schema] --> E{Close Schema}
    E --> |Adds| F[}]
```

Key characteristics:

- Uses method chaining via `append_to_schema()` (inherited from parent class)
- Creates a strict JSON schema for responses
- Provides a template for response schema generation with minimal configuration

The implementation suggests a flexible, extensible approach to generating JSON schemas with predefined structural elements.
