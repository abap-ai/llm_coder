---
title: ZIF_LLM_FACTORY
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_FACTORY

AI Generated documentation.

## Overview

The `ZIF_LLM_FACTORY` interface provides a public method for obtaining a model client. This method is designed to interact with language models and handle specific exceptions related to validation and authorization.

### Public Methods

- **`GET_CLIENT`**
  - **Purpose**: Retrieves a client for a specified model.
  - **Parameters**:
    - `model` (Importing): The model for which the client is to be retrieved. This parameter is of type `ZLLM_MODEL`.
  - **Return Value**:
    - `response` (Returning): A reference to an object of type `ZIF_LLM_CLIENT` that represents the client for the specified model.
  - **Exceptions**:
    - `ZCX_LLM_VALIDATION`: Raised if there is a validation error related to the model or client.
    - `ZCX_LLM_AUTHORIZATION`: Raised if there is an authorization error related to accessing the model or client.

## Dependencies

- `ZLLM_MODEL`: The type of the model parameter.
- `ZIF_LLM_CLIENT`: The type of the client returned by the method.
- `ZCX_LLM_VALIDATION`: Exception raised for validation errors.
- `ZCX_LLM_AUTHORIZATION`: Exception raised for authorization errors.
