---
title: ZIF_LLM_AUTH
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_AUTH

AI Generated documentation.
## Overview
The `zif_llm_auth` interface defines authorization check methods for various operations related to Large Language Model (LLM) interactions. The interface provides four key authorization verification methods:

1. `check_provider_maintenance()`: 
   - Validates authorization for performing provider maintenance
   - Raises `zcx_llm_authorization` exception if unauthorized

2. `check_get_client(model)`: 
   - Checks authorization to retrieve a model client
   - Takes a model type as input
   - Raises `zcx_llm_authorization` exception if unauthorized

3. `check_decrypt()`: 
   - Verifies authorization to decrypt secrets
   - Raises `zcx_llm_authorization` exception if unauthorized

4. `check_encrypt()`: 
   - Validates authorization to encrypt secrets
   - Raises `zcx_llm_authorization` exception if unauthorized

## Dependencies
- Custom exception class: `zcx_llm_authorization`
- Custom type: `zllm_model`

