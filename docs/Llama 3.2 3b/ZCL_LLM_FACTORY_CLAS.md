---
title: ZCL_LLM_FACTORY
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_FACTORY

AI Generated documentation.

## Overview

The `zcl_llm_factory` class is a factory class responsible for creating and managing LLM (Large Language Model) clients. It provides a public method `get_client` that takes a model and provider name as input and returns a client instance. The class also has a private method `class_constructor` that initializes the factory and sets up the authorization implementation.

## Dependencies

The `zcl_llm_factory` class depends on the following external objects:

* `zcl_llm_common`: a common class that provides a BADI (Business Application Interface Definition) for the LLM authorization implementation.
* `zif_llm_auth`: an interface for the LLM authorization implementation.
* `zif_llm_client`: an interface for the LLM client.
* `zllm_clnt_config` and `zllm_providers`: tables that store client configuration and provider information, respectively.

## Details

### Public Methods

* `get_client`: This method takes a model and provider name as input and returns a client instance. It first checks if the model and provider exist in the database, and if they do, it calls the `ZIF_LLM_CLIENT~GET_CLIENT` method of the provider class to create a new client instance.
* `class_constructor`: This method is called when the factory is created. It initializes the factory and sets up the authorization implementation by calling the `get_authorization_impl` method of the `ZCL_LLM_COMMON` class.

### Interaction with Foreign Objects

The `get_client` method interacts with the following foreign objects:

* `zllm_clnt_config` table: to check if the model exists in the database.
* `zllm_providers` table: to check if the provider exists in the database.
* `ZIF_LLM_CLIENT~GET_CLIENT` method: to create a new client instance.

### Mermaid Diagram

```mermaid
graph LR
    A[get_client] -->|checks model and provider existence|> B[Database Query]
    B -->|returns client instance|> C[Client Instance]
    C -->|calls ZIF_LLM_CLIENT~GET_CLIENT|> D[Provider Class]
    D -->|creates new client instance|> E[Client Instance]
```

### Logic Flow

The `get_client` method follows this logic flow:

1. Check if the model and provider exist in the database.
2. If they do, call the `ZIF_LLM_CLIENT~GET_CLIENT` method of the provider class to create a new client instance.
3. Return the client instance.

The `class_constructor` method follows this logic flow:

1. Initialize the factory.
2. Set up the authorization implementation by calling the `get_authorization_impl` method of the `ZCL_LLM_COMMON` class.
3. Return.
