---
title: ZIF_LLM_AUTH
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_AUTH

AI Generated documentation.

## Overview  

Interface `ZIF_LLM_AUTH` provides authorization checks for operations related to LLM (Large Language Model) client management and secret handling.  

**Public Methods**:  

| Method | Parameters | Purpose | Exception |  
|--------|------------|---------|-----------|  
| `CHECK_PROVIDER_MAINTENANCE` | - | Validates access to provider maintenance functions | `ZCX_LLM_AUTHORIZATION` |  
| `CHECK_GET_CLIENT` | `IMPORTING model TYPE ZLLM_MODEL` | Checks authorization to retrieve a model client | `ZCX_LLM_AUTHORIZATION` |  
| `CHECK_DECRYPT` | - | Verifies permission to decrypt secrets | `ZCX_LLM_AUTHORIZATION` |  
| `CHECK_ENCRYPT` | - | Verifies permission to encrypt secrets | `ZCX_LLM_AUTHORIZATION` |  

## Dependencies  

- **Exceptions**: `ZCX_LLM_AUTHORIZATION` (common exception for all authorization failures)  
- **Data Types**: `ZLLM_MODEL` (used in `CHECK_GET_CLIENT` parameter)
