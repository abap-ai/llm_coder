---
title: ZIF_LLM_ENCRYPTION
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_ENCRYPTION

AI Generated documentation.
## Overview
The `zif_llm_encryption` interface defines a contract for encryption and decryption operations with the following key methods:

1. `decrypt`
   - Purpose: Decrypts an encrypted secret
   - Input: Encrypted data as `xstring`
   - Output: Decrypted data as `string`
   - Potential Exceptions:
     - `zcx_llm_validation`
     - `zcx_llm_authorization`

2. `encrypt`
   - Purpose: Encrypts an unencrypted secret
   - Input: Unencrypted data as `string`
   - Output: Encrypted data as `xstring`
   - Potential Exceptions:
     - `zcx_llm_validation`
     - `zcx_llm_authorization`

## Dependencies
No explicit dependencies are defined in the interface signature.

