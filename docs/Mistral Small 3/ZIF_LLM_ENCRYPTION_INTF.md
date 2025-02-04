---
title: ZIF_LLM_ENCRYPTION
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_ENCRYPTION

AI Generated documentation.

## Overview

The `zif_llm_encryption` interface provides two public methods for encrypting and decrypting secrets. These methods are designed to handle sensitive data securely, with appropriate error handling for validation and authorization issues.

### Public Methods

1. **decrypt**
   - **Purpose**: Decrypts an encrypted secret.
   - **Parameters**:
     - `encrypted` (IMPORTING): The encrypted data to be decrypted (TYPE `xstring`).
   - **Returns**:
     - `result` (RETURNING VALUE): The decrypted secret (TYPE `string`).
   - **Exceptions**:
     - `zcx_llm_validation`: Raised for validation errors.
     - `zcx_llm_authorization`: Raised for authorization errors.

2. **encrypt**
   - **Purpose**: Encrypts an unencrypted secret.
   - **Parameters**:
     - `unencrypted` (IMPORTING): The unencrypted data to be encrypted (TYPE `string`).
   - **Returns**:
     - `result` (RETURNING VALUE): The encrypted secret (TYPE `xstring`).
   - **Exceptions**:
     - `zcx_llm_validation`: Raised for validation errors.
     - `zcx_llm_authorization`: Raised for authorization errors.
