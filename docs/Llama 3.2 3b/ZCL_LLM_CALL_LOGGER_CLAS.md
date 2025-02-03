---
title: ZCL_LLM_CALL_LOGGER
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_CALL_LOGGER

AI Generated documentation.
## Overview
The `zcl_llm_call_logger` class is a SAP class responsible for logging call entries in the SAP system. It provides a simple interface for logging calls based on system settings and user filters.

## Dependencies
The class depends on the following:

* `zllm_system` table to retrieve system settings
* `zllm_call_log` table to store log entries

## Details
### Class Structure

The class has a simple structure with a constructor, a method to add log entries, and a private data member to track the active state of the system.

### Constructor

The constructor initializes the class by retrieving the system settings from the `zllm_system` table. If the `save_calls` flag is set to `TRUE` and the `call_filter_uname` field is either a wildcard or the current username, the class sets its active state to `TRUE`.

### add Method

The `add` method is the main entry point for logging calls. It checks the active state of the system and only logs the call if it is active. If the system is active, it inserts a new log entry into the `zllm_call_log` table.

### Interaction Flow

The interaction flow between the class and the system can be visualized as follows:

```mermaid
graph LR
    A[Set system settings] -->|active|> B[Check active state]
    B -->|active|> C[Log call entry]
    C -->|logged|> D[Insert log entry into zllm_call_log]
```

### Logic Flow

The logic flow of the class can be broken down into the following steps:

1. Retrieve system settings from `zllm_system` table
2. Check if `save_calls` flag is set to `TRUE` and `call_filter_uname` field is either a wildcard or the current username
3. Set active state to `TRUE` if conditions are met
4. Check active state before logging call entry
5. Log call entry into `zllm_call_log` table if active state is `TRUE`

### Expert Notes

* The class uses a simple and straightforward approach to logging calls, making it easy to understand and maintain.
* The use of a private data member to track the active state of the system allows for efficient and flexible logging.
* The class can be extended to support additional features, such as logging to different tables or supporting multiple user filters.

