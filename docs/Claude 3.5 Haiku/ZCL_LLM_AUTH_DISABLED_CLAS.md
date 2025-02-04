---
title: ZCL_LLM_AUTH_DISABLED
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_AUTH_DISABLED

AI Generated documentation.

## Overview

The `zcl_llm_auth_disabled` class is an implementation of the `zif_llm_auth` interface that provides a permissive authorization mechanism. This class is designed to disable or bypass authorization checks for various cryptographic and client-related operations. It serves as a default or test implementation where no strict authorization restrictions are enforced.

The class implements four key authorization methods:

1. `check_decrypt()`: Authorization check for decryption operations
2. `check_encrypt()`: Authorization check for encryption operations
3. `check_get_client()`: Authorization check for client retrieval
4. `check_provider_maintenance()`: Authorization check for provider maintenance tasks

Each method is intentionally left empty, effectively allowing all operations without raising authorization exceptions.

## Dependencies

- Interface: `zif_llm_auth`
- Potential Exception: `ZCX_LLM_AUTHORIZATION` (not raised in this implementation)

## Details

The class represents a "disabled" authorization strategy, which is particularly useful in:

- Testing scenarios
- Development environments
- Situations requiring unrestricted access to cryptographic methods

```mermaid
graph TD
    A[zcl_llm_auth_disabled] -->|Implements| B[zif_llm_auth Interface]
    A --> C[check_decrypt()]
    A --> D[check_encrypt()]
    A --> E[check_get_client()]
    A --> F[check_provider_maintenance()]

    C --> G[No Authorization Restrictions]
    D --> G
    E --> G
    F --> G
```

Key characteristics:

- Provides a "pass-through" authorization mechanism
- Marked as `FINAL` and `PUBLIC`, preventing further inheritance
- Uses `#EC EMPTY_PROCEDURE` to suppress potential code inspector warnings about empty methods
- Intended to be registered in a BADI (Business Add-In) named `ZLLM_DEFAULTS`

The implementation suggests a flexible design where custom authorization logic can be easily plugged in by replacing this default implementation.
