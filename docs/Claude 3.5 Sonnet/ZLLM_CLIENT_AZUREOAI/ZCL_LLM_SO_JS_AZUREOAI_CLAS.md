---
title: ZCL_LLM_SO_JS_AZUREOAI
type: CLAS
parent_object: ZLLM_CLIENT_AZUREOAI
parent_type: DEVC
---

# Class ZCL_LLM_SO_JS_AZUREOAI

AI Generated documentation.
## Overview
This class implements JSON schema handling for Azure OpenAI responses. It inherits from `zcl_llm_so_js` and provides specialized schema wrapping functionality. The class has no public methods as it only redefines protected methods from its parent class.

## Dependencies
- Inherits from `zcl_llm_so_js`

## Details
The class provides a specific JSON schema implementation for Azure OpenAI responses by wrapping the schema content with required Azure OpenAI specific elements:

- `pre_schema`: Adds the opening wrapper including name, strict mode flag and schema opening
- `post_schema`: Closes the schema structure

```mermaid
classDiagram
    zcl_llm_so_js <|-- zcl_llm_so_js_azureoai
    class zcl_llm_so_js_azureoai {
        #pre_schema()
        #post_schema()
    }
    class zcl_llm_so_js {
        #pre_schema()*
        #post_schema()*
    }
```

The schema generation follows this sequence:
```mermaid
sequenceDiagram
    participant Parent as zcl_llm_so_js
    participant Child as zcl_llm_so_js_azureoai
    
    Parent->>Child: pre_schema()
    Note over Child: Adds Azure OpenAI header
    Parent->>Parent: Schema generation
    Parent->>Child: post_schema()
    Note over Child: Closes schema structure
```

