---
title: ZIF_LLM_CLIENT
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_CLIENT

AI Generated documentation.

## Overview  

`ZIF_LLM_CLIENT` is an interface for interacting with Large Language Models (LLMs), providing standardized methods for client creation and chat operations.  

**Key Components**:  

- **Predefined Roles**: Constants for LLM interaction roles:  
  `ROLE_USER`, `ROLE_SYSTEM`, `ROLE_ASSISTANT`, `ROLE_TOOL`  

**Public Methods**:  

| Method | Purpose |  
|--------|---------|  
| `GET_CLIENT` | Factory method to create a client instance using configurations (`client_config`, `provider_config`). Raises validation/authorization errors. |  
| `CHAT` | Executes a chat request (via `ZIF_LLM_CHAT_REQUEST`) and returns a structured response (`ZLLM_RESPONSE`). |  
| `NEW_REQUEST` | Creates a new chat request instance (`ZIF_LLM_CHAT_REQUEST`). |  

## Dependencies  

**Key Dependencies**:  

- Exceptions:  
  - `ZCX_LLM_VALIDATION`: Validation errors during client creation.  
  - `ZCX_LLM_AUTHORIZATION`: Authorization failures.  
- Interfaces/Types:  
  - `ZIF_LLM_CHAT_REQUEST`: Chat request interface.  
  - `ZLLM_RESPONSE`: Response structure.  
  - `ZLLM_CLNT_CONFIG`/`ZLLM_PROVIDERS`: Configuration data types.
