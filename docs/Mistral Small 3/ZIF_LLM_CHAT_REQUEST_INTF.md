---
title: ZIF_LLM_CHAT_REQUEST
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_CHAT_REQUEST

AI Generated documentation.

## Overview

The `ZIF_LLM_CHAT_REQUEST` interface provides a structured way to manage chat requests, including adding, retrieving, and clearing messages and tools. It also supports setting tool choices, structured output details, and handling tool results and choices. Below is an overview of the public methods:

### Message Management

- **add_message**: Adds a single message to the chat request.
  - **Importing**: `message` of type `ZLLM_MSG`.

- **add_messages**: Adds multiple messages to the chat request.
  - **Importing**: `messages` of type `ZLLM_MSGS`.

- **get_messages**: Retrieves all messages from the chat request.
  - **Returning**: `result` of type `ZLLM_MSGS`.

- **clear_messages**: Clears all messages from the chat request.

### Tool Management

- **add_tool**: Adds a single tool to the chat request with an optional tool choice.
  - **Importing**: `tool` of type `REF TO ZIF_LLM_TOOL`, `tool_choice` of type `STRING` (default: `auto`).

- **add_tools**: Adds multiple tools to the chat request with an optional tool choice.
  - **Importing**: `tools` of type `ZLLM_TOOLS`, `tool_choice` of type `STRING` (default: `auto`).

- **get_tools**: Retrieves all tools from the chat request.
  - **Returning**: `result` of type `ZLLM_TOOLS`.

- **clear_tools**: Clears all tools from the chat request.

- **set_tool_choice**: Sets the tool choice for the chat request.
  - **Importing**: `tool_choice` of type `STRING`.

### Tool Result and Choice Management

- **add_tool_result**: Adds the result of a tool to the message.
  - **Importing**: `tool` of type `REF TO ZIF_LLM_TOOL`.

- **add_tool_choices**: Adds tool calls to the message list.
  - **Importing**: `choices` of type `ZLLM_TOOL_CALLS`.

### Structured Output Management

- **set_structured_output**: Sets structured output details for the chat request.
  - **Importing**: `data_desc` of type `REF TO CL_ABAP_DATADESCR`, `descriptions` of type `ZIF_LLM_SO=>DEF_DESCRIPTIONS`, `use_structured_output` of type `SAP_BOOL` (default: `ABAP_TRUE`).

- **set_structured_output_active**: Enables or disables the use of structured output.
  - **Importing**: `active` of type `SAP_BOOL`.

### Choice Management

- **add_choice**: Appends an LLM choice to the message list.
  - **Importing**: `choice` of type `ZLLM_CHOICE`.

### Internal and Options Methods

- **get_internal_request**: Retrieves the full request details internally.
  - **Returning**: `result` of type `ZLLM_REQUEST`.

- **options**: Provides options implementation to set options.
  - **Returning**: `result` of type `REF TO ZIF_LLM_OPTIONS`.

## Dependencies

The interface depends on the following types and classes:

- `ZLLM_MSG`
- `ZLLM_MSGS`
- `ZIF_LLM_TOOL`
- `ZLLM_TOOLS`
- `ZLLM_TOOL_CALLS`
- `ZLLM_CHOICE`
- `ZLLM_REQUEST`
- `ZIF_LLM_OPTIONS`
- `ZIF_LLM_SO`
- `CL_ABAP_DATADESCR`
- `SAP_BOOL`
