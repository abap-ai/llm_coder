---
title: ZIF_LLM_DEFAULT_IMPL
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_DEFAULT_IMPL

AI Generated documentation.

## Overview  

Interface `ZIF_LLM_DEFAULT_IMPL` provides configuration methods for customizing core components in an LLM framework. Key methods include:

| Method | Returns | Purpose |  
|--------|---------|---------|  
| `GET_JSON_IMPL` | `SEOCLSNAME` | Provides the JSON serializer/deserializer class name. Non-default implementations require adherence to specific requirements. |  
| `GET_ENCRYPTION_IMPL` | `ZIF_LLM_ENCRYPTION` | Supplies the encryption provider for secure data handling. |  
| `GET_CALL_LOGGER_IMPL` | `ZIF_LLM_CALL_LOGGER` | Delivers the call logging implementation for API interaction tracking. |  
| `GET_STATISTICS_IMPL` | `ZIF_LLM_STATISTICS` | Returns the statistics handler for usage/metrics collection. |  
| `GET_AUTHORIZATION_IMPL` | `ZIF_LLM_AUTH` | Configures authorization checks. Implementations **must** raise `ZCX_LLM_AUTHORIZATION` for access violations. |  

## Dependencies  

- **BADI Integration**: Implements `IF_BADI_INTERFACE` for enhancement spot compatibility  
- **Security**: Relies on encryption via `ZIF_LLM_ENCRYPTION`  
- **Monitoring**: Requires logger (`ZIF_LLM_CALL_LOGGER`) and statistics (`ZIF_LLM_STATISTICS`) interfaces  
- **Error Handling**: Authorization errors use exception class `ZCX_LLM_AUTHORIZATION`
