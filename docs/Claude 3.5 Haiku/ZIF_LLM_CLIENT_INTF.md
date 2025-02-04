---
title: ZIF_LLM_CLIENT
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_CLIENT

AI Generated documentation.

## Overview

The `zif_llm_client` interface defines a standardized contract for interacting with Large Language Model (LLM) clients. It provides methods for creating and executing chat requests with different role types.

Key features:

- Defines constants for message roles: `user`, `system`, `assistant`, and `tool`
- Supports client creation with configuration
- Enables chat request generation and execution

Main methods:

1. `get_client()`:

   - Static method to create a new LLM client
   - Requires client and provider configurations
   - Can raise validation or authorization exceptions

2. `chat()`:

   - Executes a chat request
   - Takes a chat request object
   - Returns a response

3. `new_request()`:

   - Creates a new chat request object

## Dependencies

- Custom exception classes:

  - `zcx_llm_validation`
  - `zcx_llm_authorization`
- Custom types:

  - `zllm_clnt_config`
  - `zllm_providers`
  - `zllm_response`
  - `zllm_role`
