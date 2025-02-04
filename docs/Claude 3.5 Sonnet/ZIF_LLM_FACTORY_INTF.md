---
title: ZIF_LLM_FACTORY
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_FACTORY

AI Generated documentation.

## Overview

The `ZIF_LLM_FACTORY` interface provides factory functionality for LLM (Large Language Model) clients with one public class method:

- `GET_CLIENT`: Creates and returns a model-specific LLM client instance
  - Input: Model identifier (`ZLLM_MODEL`)
  - Output: Reference to client interface (`ZIF_LLM_CLIENT`)
  - Can raise validation and authorization exceptions

## Dependencies

- `ZIF_LLM_CLIENT`: Interface that client implementations must implement
- `ZLLM_MODEL`: Data type for model identification
- `ZCX_LLM_VALIDATION`: Exception class for validation errors
- `ZCX_LLM_AUTHORIZATION`: Exception class for authorization errors
