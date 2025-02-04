---
title: ZIF_LLM_FACTORY
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_FACTORY

AI Generated documentation.

## Overview  

`ZIF_LLM_FACTORY` is an SAP ABAP interface that provides a factory method for creating clients to interact with LLM (Large Language Model) services.  

### Public Methods  

| Method       | Description                                                                 |  
|--------------|-----------------------------------------------------------------------------|  
| **GET_CLIENT** | Instantiates a client for a specified LLM model. Returns a reference to `ZIF_LLM_CLIENT` for interacting with the model. |  

**Parameters & Exceptions:**  

- `model`: Input parameter of type `ZLLM_MODEL` (specifies the target LLM configuration).  
- Raises `ZCX_LLM_VALIDATION` for invalid model configurations.  
- Raises `ZCX_LLM_AUTHORIZATION` for authentication/authorization failures.  

## Dependencies  

| Component               | Type               | Purpose                                   |  
|-------------------------|--------------------|-------------------------------------------|  
| `ZLLM_MODEL`            | Data Element       | Defines model configuration parameters.  |  
| `ZIF_LLM_CLIENT`        | Interface          | Base interface for LLM client operations. |  
| `ZCX_LLM_VALIDATION`    | Exception Class    | Validation error handling.                |  
| `ZCX_LLM_AUTHORIZATION` | Exception Class    | Authorization error handling.             |
