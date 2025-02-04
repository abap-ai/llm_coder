---
title: ZCL_LLM_AUTH_DISABLED
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_AUTH_DISABLED

AI Generated documentation.

## Overview  

The class `zcl_llm_auth_disabled` provides a **no-operation implementation of authorization checks** for cryptographic and provider management operations. It explicitly bypasses all authorization validations, allowing unrestricted access to sensitive functionalities.  

**Public Methods**:  

- `zif_llm_auth~check_decrypt`: No-op for decryption authorization checks.  
- `zif_llm_auth~check_encrypt`: No-op for encryption authorization checks.  
- `zif_llm_auth~check_get_client`: Skips authorization for client retrieval.  
- `zif_llm_auth~check_provider_maintenance`: Allows provider maintenance without restrictions.  

Designed for scenarios where authorization enforcement is delegated to external systems or explicitly disabled.  

## Dependencies  

- **Interface**: Implements `zif_llm_auth` to adhere to authorization contracts.  
- **BADI**: Intended for registration via `ZLLM_DEFAULTS` to override default auth behavior.  
- **Exception**: References `zcx_llm_authorization` (not raised in this implementation).  

## Details  

```mermaid  
flowchart LR  
    BADI_ZLLM_DEFAULTS[[BADI ZLLM_DEFAULTS]] -->|Registers| zcl_llm_auth_disabled  
    zcl_llm_auth_disabled -.->|Implements| zif_llm_auth  
    zif_llm_auth -->|Defines contracts| check_methods[check_decrypt, check_encrypt, etc.]  
    classDef badi fill:#d4eafc,stroke:#2a6ebb;  
    classDef interface fill:#f0f8ff,stroke:#4682b4;  
    class BADI_ZLLM_DEFAULTS badi  
    class zif_llm_auth interface  
```  

**Design Intent**:  

- Empty method implementations ensure **no authorization exceptions** are raised, as validated by test cases (e.g., `ltcl_llm_auth_disabled`).  
- Acts as a **fallback or testing stub** when authorization is managed externally or disabled.  
- Comments in methods (`#EC EMPTY_PROCEDURE`) suppress static check warnings, signaling intentional empty implementations.  

**Integration**:  

- Part of a **pluggable authorization framework** via BADI, enabling runtime substitution of auth strategies.  
- Critical for environments requiring unconditional access (e.g., automated systems, emergency maintenance).
