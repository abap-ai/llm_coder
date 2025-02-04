---
title: ZIF_LLM_DEFAULT_IMPL
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_DEFAULT_IMPL

AI Generated documentation.

## Overview

The `zif_llm_default_impl` interface defines a set of methods for retrieving default implementations of various components related to a Large Language Model (LLM) system. The interface provides methods to get implementations for:

1. JSON handling
2. Encryption
3. Call logging
4. Statistics tracking
5. Authorization

Each method returns a specific interface reference that can be used to interact with the corresponding component.

### Key Methods

- `get_json_impl()`: Retrieves the name of the JSON implementation class
- `get_encryption_impl()`: Returns an encryption provider implementation
- `get_call_logger_impl()`: Returns a call logging implementation
- `get_statistics_impl()`: Returns a statistics tracking implementation
- `get_authorization_impl()`: Returns an authorization implementation, with a note that authorization errors should raise `zcx_llm_authorization`

## Dependencies

- `if_badi_interface`: Suggests the interface might be used in a Business Add-In (BAdI) context
- `zif_llm_encryption`: Interface for encryption provider
- `zif_llm_call_logger`: Interface for call logging
- `zif_llm_statistics`: Interface for statistics tracking
- `zif_llm_auth`: Interface for authorization
- `zcx_llm_authorization`: Exception class for authorization errors
