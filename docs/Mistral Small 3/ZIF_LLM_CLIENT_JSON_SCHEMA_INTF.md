---
title: ZIF_LLM_CLIENT_JSON_SCHEMA
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_CLIENT_JSON_SCHEMA

AI Generated documentation.

## Overview

The `ZIF_LLM_CLIENT_JSON_SCHEMA` interface defines a structured approach to creating and managing JSON schemas. It includes public methods for creating a new schema instance, adding properties, arrays, and objects, and generating the final schema. The interface supports only one level of nesting for properties, arrays, and objects.

### Public Methods

- **`new_format`**: Creates a new instance of the JSON schema.
  - **Parameters**:
    - `title` (TYPE `string`): The title of the JSON schema.
  - **Returns**:
    - `result` (TYPE `REF TO zif_llm_client_json_schema`): A reference to the newly created JSON schema instance.

- **`add_property`**: Adds a property to the JSON schema. Only one level of nesting is supported.
  - **Parameters**:
    - `property` (TYPE `property_def`): The property to add.
  - **Exceptions**:
    - `zcx_llm_validation`: Raised if the property addition fails validation.

- **`add_array`**: Adds an array of a specific object to the JSON schema. Only one level of nesting is supported.
  - **Parameters**:
    - `array` (TYPE `array_def`): The array to add.
  - **Exceptions**:
    - `zcx_llm_validation`: Raised if the array addition fails validation.

- **`add_object`**: Adds an object with parameters to the JSON schema. Only one level of nesting is supported.
  - **Parameters**:
    - `object` (TYPE `object_def`): The object with parameters to add.
  - **Exceptions**:
    - `zcx_llm_validation`: Raised if the object addition fails validation.

- **`generate_schema`**: Generates the final JSON schema.
  - **Returns**:
    - `result` (TYPE `string`): The generated JSON schema as a string.

## Dependencies

None.
