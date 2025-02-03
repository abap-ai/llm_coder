---
title: ZCL_LLM_AUTH_DISABLED
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_AUTH_DISABLED

AI Generated documentation.
## Overview
The `zcl_llm_auth_disabled` class is a test class designed to verify the authorization functionality of the `zcl_llm_auth` class. It provides a set of test methods to check the behavior of the `zcl_llm_auth` class without raising any exceptions.

## Dependencies
The class depends on the `zcl_llm_auth` class, which is the class being tested. It also uses the `BADI ZLLM_DEFAULTS` to implement custom versions of the `check_decrypt`, `check_encrypt`, `check_get_client`, and `check_provider_maintenance` methods.

## Details
The class has four test methods:

*   `zif_llm_auth~check_decrypt`: Verifies that the `check_decrypt` method of `zcl_llm_auth` does not raise an exception.
*   `zif_llm_auth~check_encrypt`: Verifies that the `check_encrypt` method of `zcl_llm_auth` does not raise an exception.
*   `zif_llm_auth~check_get_client`: Verifies that the `check_get_client` method of `zcl_llm_auth` does not raise an exception.
*   `zif_llm_auth~check_provider_maintenance`: Verifies that the `check_provider_maintenance` method of `zcl_llm_auth` does not raise an exception.

The class uses a custom implementation of the `check_decrypt`, `check_encrypt`, `check_get_client`, and `check_provider_maintenance` methods to avoid raising exceptions. These methods are registered in the `BADI ZLLM_DEFAULTS` to ensure that the custom implementation is used.

```mermaid
graph LR
    class zcl_llm_auth_disabled as Test Class
        setup -->|Create instance| zcl_llm_auth_disabled
        zcl_llm_auth -->|Check decrypt| zcl_llm_auth~check_decrypt
        zcl_llm_auth -->|Check encrypt| zcl_llm_auth~check_encrypt
        zcl_llm_auth -->|Check get client| zcl_llm_auth~check_get_client
        zcl_llm_auth -->|Check provider maintenance| zcl_llm_auth~check_provider_maintenance
```

The class provides a way to test the authorization functionality of the `zcl_llm_auth` class without raising exceptions, allowing for a more comprehensive test suite.

