---
title: ZIF_LLM_TOOL
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_TOOL

AI Generated documentation.
## Overview
The `zif_llm_tool` interface defines a standardized contract for tool (function) calls in an SAP ABAP context, specifically designed for interaction with Large Language Models (LLMs). It provides methods for managing and executing tool-based operations with a structured approach.

Key methods include:
- `get_result()`: Retrieves the result of a tool call
- `get_tool_details()`: Returns metadata about the tool, including name, description, and parameter information
- `execute()`: Executes a tool with given data and returns the result

The interface defines several complex types:
- `tool_parameters`: Describes tool parameters with data description and descriptions
- `tool_details`: Captures comprehensive tool metadata
- `tool_result`: Represents the outcome of a tool execution, including data, tool call ID, and name

## Dependencies
- `zif_llm_tool_parser`: Used for parsing tool-related descriptions
- `cl_abap_datadescr`: Used for describing data types of tool parameters

