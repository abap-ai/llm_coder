---
title: ZIF_LLM_AUTH
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_AUTH

AI Generated documentation.

## Overview

The `ZIF_LLM_AUTH` interface provides a set of public methods for performing authorization checks related to provider maintenance, model client retrieval, and secret encryption/decryption. Below is an overview of the public methods:

- **`CHECK_PROVIDER_MAINTENANCE`**: This method performs an authorization check for the call of provider maintenance. It raises an exception of type `ZCX_LLM_AUTHORIZATION` if the check fails.

- **`CHECK_GET_CLIENT`**: This method performs an authorization check for retrieving a model client. It takes a model of type `ZLLM_MODEL` as an input parameter and raises an exception of type `ZCX_LLM_AUTHORIZATION` if the check fails.

- **`CHECK_DECRYPT`**: This method performs an authorization check to determine if the user is allowed to decrypt a secret. It raises an exception of type `ZCX_LLM_AUTHORIZATION` if the check fails.

- **`CHECK_ENCRYPT`**: This method performs an authorization check to determine if the user is allowed to encrypt a secret. It raises an exception of type `ZCX_LLM_AUTHORIZATION` if the check fails.

## Dependencies

The interface depends on the following exception class:

- `ZCX_LLM_AUTHORIZATION`: This exception is raised by the methods in the interface when an authorization check fails.
