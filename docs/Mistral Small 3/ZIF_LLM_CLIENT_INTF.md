---
title: ZIF_LLM_CLIENT
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_CLIENT

AI Generated documentation.

## Overview

The `zif_llm_client` interface provides a structured way to interact with a Language Learning Model (LLM) client. It includes public constants defining various roles and public methods for obtaining a new client instance and executing chat requests.

### Public Constants

The interface defines four public constants to represent different roles:

- `role_user`: Represents a user role.
- `role_system`: Represents a system role.
- `role_assistant`: Represents an assistant role.
- `role_tool`: Represents a tool role.

### Public Methods

#### Class Methods

- **get_client**
  - **Purpose**: Obtains a new client instance based on the provided configuration.
  - **Parameters**:
    - `client_config`: Configuration for the client.
    - `provider_config`: Configuration for the provider.
  - **Returns**: A reference to an instance of `zif_llm_client`.
  - **Exceptions**:
    - `zcx_llm_validation`: Raised for validation errors.
    - `zcx_llm_authorization`: Raised for authorization errors.

#### Instance Methods

- **chat**
  - **Purpose**: Executes a chat request.
  - **Parameters**:
    - `request`: A reference to a `zif_llm_chat_request` object containing the chat request details.
  - **Returns**: A `zllm_response` object containing the response from the chat execution.

- **new_request**
  - **Purpose**: Creates a new chat request.
  - **Returns**: A reference to a new `zif_llm_chat_request` object.

## Dependencies

The interface depends on the following types and exceptions:

- `zllm_role`: Type used for role constants.
- `zllm_clnt_config`: Type for client configuration.
- `zllm_providers`: Type for provider configuration.
- `zif_llm_client`: The interface itself, used for returning client instances.
- `zif_llm_chat_request`: Type for chat request objects.
- `zllm_response`: Type for chat response objects.
- `zcx_llm_validation`: Exception for validation errors.
- `zcx_llm_authorization`: Exception for authorization errors.
