---
title: ZCL_LLM_SO_JS_AZUREOAI
type: CLAS
parent_object: ZLLM_CLIENT_AZUREOAI
parent_type: DEVC
---

# Class ZCL_LLM_SO_JS_AZUREOAI

AI Generated documentation.

## Overview

The `zcl_llm_so_js_azureoai` class is a final class that extends the `zcl_llm_so_js` class. It is designed to implement a JSON schema for Azure OpenAI. The class redefines two protected methods, `pre_schema` and `post_schema`, to append specific JSON schema components before and after the base schema.

### Public Methods

The class does not define any public methods. All methods are either inherited from the base class or are protected and redefined.

## Dependencies

The class inherits from `zcl_llm_so_js`.

## Details

The `zcl_llm_so_js_azureoai` class extends the functionality of `zcl_llm_so_js` by redefining the `pre_schema` and `post_schema` methods. These methods are used to modify the JSON schema by appending specific components.

### Method Flow

The following diagram illustrates the flow of the `pre_schema` and `post_schema` methods and their interaction with the base class:

```mermaid
graph TD
    A[zcl_llm_so_js_azureoai] --> B[zcl_llm_so_js]
    A --> C[pre_schema]
    A --> D[post_schema]
    C --> E[append_to_schema( |"name":"Response","strict":true,"schema":\{| )]
    D --> F[append_to_schema( |\}| )]
```

### Method Details

- **pre_schema**: This method is called before the base schema is processed. It appends the following JSON schema component to the schema:

  ```json
  {
    "name": "Response",
    "strict": true,
    "schema": {
  ```

- **post_schema**: This method is called after the base schema is processed. It appends the closing brace to the schema:

  ```json
  }
  ```

These methods ensure that the JSON schema for Azure OpenAI is correctly formatted and includes the necessary components.
