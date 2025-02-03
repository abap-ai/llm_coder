---
title: ZCL_LLM_SO_JS_AZUREOAI
type: CLAS
parent_object: ZLLM_CLIENT_AZUREOAI
parent_type: DEVC
---

# Class ZCL_LLM_SO_JS_AZUREOAI

AI Generated documentation.
## Overview
The `zcl_llm_so_js_azureoai` class is a subclass of `zcl_llm_so_js` and is designed to implement the Azure OpenAI JSON schema. It provides two main methods: `pre_schema` and `post_schema`, which are responsible for appending specific schema definitions to the overall schema.

## Dependencies
The class does not have any explicit dependencies.

## Details
### Method `pre_schema`
The `pre_schema` method appends a specific schema definition to the overall schema. The schema definition includes the following properties:
```mermaid
graph LR
    A[Schema] -->|append_to_schema|> B[Response]
    B -->|strict|> C[true]
    B -->|schema|> D[Object]
    D -->|key|> E[Response]
```
This method is likely used to configure the schema before it is used to validate or process data.

### Method `post_schema`
The `post_schema` method appends another schema definition to the overall schema. The schema definition includes a closing bracket to complete the schema:
```mermaid
graph LR
    A[Schema] -->|append_to_schema|> B[Object]
    B -->|}|> C[End of Schema]
```
This method is likely used to complete the schema after it has been partially defined by the `pre_schema` method.

### Interaction with `zcl_llm_so_js`
The `zcl_llm_so_js_azureoai` class inherits from `zcl_llm_so_js`, which suggests that it may be used in conjunction with other classes or function modules that are part of the `zcl_llm_so_js` package. The exact interaction between these classes is not explicitly documented in the provided code.

