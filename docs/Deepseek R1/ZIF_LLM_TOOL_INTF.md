---
title: ZIF_LLM_TOOL
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_TOOL

AI Generated documentation.

## Overview  

Interface `ZIF_LLM_TOOL` defines a structure for integrating tools (e.g., function calls) with LLM models. It standardizes how tools are described, executed, and their results retrieved.  

### Public Methods  

| Method | Purpose |  
|--------|---------|  
| `GET_RESULT` | Returns the execution result (data, tool call ID, and name). |  
| `GET_TOOL_DETAILS` | Provides metadata (name, description, parameters) required for LLM integration. |  
| `EXECUTE` | Executes the tool using input data and a tool call ID; returns the result. |  

### Key Data Types  

- **`TOOL_DETAILS`**: Contains tool metadata (name, description, type, parameters).  
- **`TOOL_PARAMETERS`**: Defines parameter schema (`DATA_DESC` for data type, `DESCRIPTIONS` for parameter metadata).  
- **`TOOL_RESULT`**: Holds execution output, including a reference to result data.  
- Constant **`TYPE_FUNCTION`**: Indicates the tool type (`function`).  

## Dependencies  

1. **`CL_ABAP_DATADESCR`**: Standard ABAP class for runtime type information.  
2. **`ZIF_LLM_TOOL_PARSER=>DEF_DESCRIPTIONS`**: Custom type for parameter descriptions (likely used for LLM schema definitions).
