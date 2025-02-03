---
title: ZCL_LLM_STATISTICS
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_STATISTICS

AI Generated documentation.
## Overview
The `zcl_llm_statistics` class provides a simple statistics management system, allowing for the addition of new statistics records. The class implements the `zif_llm_statistics` interface and provides a public method `add` to insert new statistics records.

## Dependencies
The class depends on the following external objects:

* `zllm_system` table, which stores the active status of the system.

## Details
### Logic Flow
The class has a simple logic flow:

1. The `constructor` method is called to initialize the object.
2. The `add` method is called to insert a new statistics record.
3. If the system is active (`stat_active` = `abap_true`), the new record is inserted into the `zllm_statistics` table.

```mermaid
graph LR
    A[Constructor] -->|SELECT stat_active|> B[Active Status]
    B -->|IF stat_active = abap_true|> C[Add Statistics Record]
    C -->|INSERT INTO zllm_statistics|> D[Statistics Table]
```

### Interaction with Foreign Objects
The class interacts with the following foreign objects:

* `zllm_system` table: used to retrieve the active status of the system.
* `zllm_statistics` table: used to insert new statistics records.

Note: The `zif_llm_statistics` interface is not shown in this documentation, but it is assumed to define the `add` method that is implemented by the `zcl_llm_statistics` class.

