---
title: ZCL_LLM_CALL_LOGGER
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_CALL_LOGGER

AI Generated documentation.

## Overview

The class `ZCL_LLM_CALL_LOGGER` implements logging functionality for LLM (Large Language Model) interactions. It provides conditional logging controlled by system configuration and user-based filtering.

**Public Methods**:

- `ZIF_LLM_CALL_LOGGER~ADD`:  
  Inserts a log entry into `ZLLM_CALL_LOG` only if logging is enabled for the current context
- `CONSTRUCTOR`:  
  Initializes activation state by checking configuration from `ZLLM_SYSTEM`

Key features:

- Activation controlled by `ZLLM_SYSTEM` configuration
- User-specific logging using wildcard/exact match filters
- Automatic population of technical fields (timestamp/user) via database defaults

## Dependencies

**Database Tables**:

- `ZLLM_SYSTEM`: Stores activation flag (`SAVE_CALLS`) and user filter (`CALL_FILTER_UNAME`)
- `ZLLM_CALL_LOG`: Target table for log entries with technical fields `CREATED_AT`/`CREATED_BY`

## Details

```mermaid
flowchart TD
  Constructor[CONSTRUCTOR] --> A[Read ZLLM_SYSTEM]
  A --> Condition1{SAVE_CALLS = TRUE?}
  Condition1 -->|Yes| Condition2{User matches filter?}
  Condition2 -->|Yes| Activate[Set ACTIVE = TRUE]
  Condition1 -->|No| Skip[Remain inactive]
  Condition2 -->|No| Skip
  
  AddMethod[ZIF_LLM_CALL_LOGGER~ADD] --> CheckActive{ACTIVE?}
  CheckActive -->|Yes| Insert[Insert entry to ZLLM_CALL_LOG]
  CheckActive -->|No| Exit[No action]
```

**Key Implementation Notes**:

1. **Activation Logic**:
   - Combines system-level activation (`SAVE_CALLS`) with user filter (`CALL_FILTER_UNAME`)
   - Uses `SY-UNAME` for runtime user context comparison

2. **Database Integration**:
   - Technical fields (`CREATED_AT`, `CREATED_BY`) are managed through database defaults
   - No explicit field mapping in INSERT operation - relies on table structure

3. **Test Strategy**:
   - Uses `CL_OSQL_TEST_ENVIRONMENT` for in-memory test doubles
   - Complete isolation between test cases via `CLEAR_DOUBLES()`
   - Verifies parameter handling through test-specific entry structures

**Performance Considerations**:

- Single `SELECT SINGLE` during object instantiation
- No database operations when logging is inactive
- User filter evaluation occurs once per logger instance
