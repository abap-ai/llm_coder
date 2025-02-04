---
title: ZIF_LLM_TOOL
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_TOOL

AI Generated documentation.

## Overview

The `zif_llm_tool` interface defines a set of methods for interacting with a tool within the context of a Large Language Model (LLM). The interface includes methods for retrieving tool details, executing the tool, and obtaining the result of a tool call. Below is an overview of the public methods:

### Methods

- **get_result**: This method returns the result of a tool call. The result includes the data, tool call ID, and the name of the tool.

  ```abap
  METHODS get_result RETURNING VALUE(result) TYPE tool_result.
  ```

- **get_tool_details**: This method returns the details of the tool, which are required to parse it as a tool for the LLM. The details include the name, description, type, and parameters of the tool.

  ```abap
  METHODS get_tool_details RETURNING VALUE(result) TYPE tool_details.
  ```

- **execute**: This method executes the tool. It takes the LLM Model Tool Call response, the tool call ID, and returns the execution result, which includes the data, tool call ID, and the name of the tool.

  ```abap
  METHODS execute IMPORTING data         TYPE REF TO data
                          tool_call_id  TYPE string
                    RETURNING VALUE(result) TYPE tool_result.
  ```

## Dependencies

The interface depends on the following types and classes:

- `cl_abap_datadescr`: A standard ABAP class used for data description.
- `zif_llm_tool_parser=>def_descriptions`: A type defined within the `zif_llm_tool_parser` class, which is not explicitly documented here but is assumed to be a description type.
