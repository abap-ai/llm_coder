---
title: ZIF_LLM_DEFAULT_IMPL
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_DEFAULT_IMPL

AI Generated documentation.

## Overview

The `zif_llm_default_impl` interface provides a set of public methods to retrieve various implementations and configurations for the LLM (Language Learning Model) system. The interface extends the `if_badi_interface` and includes the following methods:

- `get_json_impl`: Retrieves the name of the JSON class. If not default, refer to the documentation on requirements.
- `get_encryption_impl`: Retrieves the encryption provider.
- `get_call_logger_impl`: Retrieves the call logger implementation.
- `get_statistics_impl`: Retrieves the statistics implementation.
- `get_authorization_impl`: Retrieves the authorization implementation. Authorization errors should raise `zcx_llm_authorization`.

## Dependencies

The `zif_llm_default_impl` interface depends on the following interfaces and classes:

- `if_badi_interface`: The base interface that `zif_llm_default_impl` extends.
- `zif_llm_encryption`: The interface for the encryption provider.
- `zif_llm_call_logger`: The interface for the call logger implementation.
- `zif_llm_statistics`: The interface for the statistics implementation.
- `zif_llm_auth`: The interface for the authorization implementation.
- `zcx_llm_authorization`: The exception class for authorization errors.
