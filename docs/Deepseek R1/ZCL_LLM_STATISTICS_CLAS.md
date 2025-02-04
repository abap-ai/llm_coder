---
title: ZCL_LLM_STATISTICS
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_STATISTICS

AI Generated documentation.

## Overview

Provides conditional statistics recording functionality with activation control. Main public elements:

```abap
┌───────────────────────────┐
│ PUBLIC INTERFACE          │
├──────────────────────────┤
│ ➕ add(IMPORTING record)  │
│   (from zif_llm_statistics)│
│                           │
│ 🏗 constructor()          │
└──────────────────────────┘
```

Key characteristics:

- Activation state loaded once during instantiation
- Silent operation when inactive (no errors/exceptions)
- Direct database insertion when active

## Dependencies

```mermaid
graph LR
    A[zcl_llm_statistics] --> B[zif_llm_statistics]
    A --> C[zllm_system]
    A --> D[zllm_statistics]
```

Key dependencies:

- **zllm_system**: System configuration table (single record read)
- **zllm_statistics**: Statistics storage table (direct inserts)
- **zif_llm_statistics**: Mandatory interface implementation

## Details

```mermaid
sequenceDiagram
    participant C as Consumer
    participant S as zcl_llm_statistics
    participant DB as Database
    
    C->>+S: constructor()
    S->>DB: SELECT SINGLE stat_active FROM zllm_system
    DB-->>S: active status
    S-->>-C: Instance created
    
    C->>+S: add(record)
    alt active = abap_true
        S->>DB: INSERT zllm_statistics
    else inactive
        S->>S: Immediate return
    end
    S-->>-C: Operation complete
```

Implementation notes:

1. **Activation Check**: Single database read during instantiation (performance optimized)
2. **Insert Logic**: Uses direct `INSERT` without commit (implies external transaction control)
3. **State Handling**: Protected attribute `active` allows extension in subclasses
4. **Error Handling**: Silent failure modes (no exception for inactive state or DB errors)
