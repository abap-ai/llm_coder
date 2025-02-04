---
title: ZCL_LLM_SO_JS_OR
type: CLAS
parent_object: ZLLM_CLIENT_OPENROUTER
parent_type: DEVC
---

# Class ZCL_LLM_SO_JS_OR

AI Generated documentation.

## Overview

The `zcl_llm_so_js_or` class is a subclass of `zcl_llm_so_js` and is designed to extend the functionality of the parent class. It provides two public methods: `pre_schema` and `post_schema`, which are used to modify the schema of the class.

## Dependencies

The class depends on the parent class `zcl_llm_so_js`.

## Details

### Method `pre_schema`

The `pre_schema` method is used to append a schema definition to the class. It takes no parameters and appends the following schema definition:

```mermaid
graph LR
    A[|name":"Response|] --> B[|strict":true|]
    B --> C[|schema":{|
    C --> D[|}|]
```

This schema definition is appended to the class schema before any other schema definitions.

### Method `post_schema`

The `post_schema` method is used to append a schema definition to the class. It takes no parameters and appends the following schema definition:

```mermaid
graph LR
    A[|}|]
```

This schema definition is appended to the class schema after all other schema definitions.

### Interaction with Parent Class

The `pre_schema` and `post_schema` methods are called by the parent class `zcl_llm_so_js` to modify the class schema. The `pre_schema` method is called before any other schema definitions are appended, while the `post_schema` method is called after all other schema definitions have been appended.

### Interaction with Foreign Objects

The class does not interact with any foreign objects, such as classes, function modules, or tables.
