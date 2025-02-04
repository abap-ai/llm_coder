---
title: ZIF_LLM_CHAT_REQUEST
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_CHAT_REQUEST

AI Generated documentation.

## Overview

The `zif_llm_chat_request` interface defines a comprehensive contract for managing chat requests in an LLM (Large Language Model) interaction framework. It provides methods for:

1. Message Management:

   - `add_message`: Add a single message
   - `add_messages`: Add multiple messages
   - `get_messages`: Retrieve all messages
   - `clear_messages`: Remove all messages

2. Tool Handling:

   - `add_tool`: Add a single tool
   - `add_tools`: Add multiple tools
   - `get_tools`: Retrieve all tools
   - `clear_tools`: Remove all tools
   - `set_tool_choice`: Configure tool selection strategy
   - `add_tool_result`: Add tool execution results
   - `add_tool_choices`: Add tool call details

3. Structured Output:

   - `set_structured_output`: Configure structured output parameters
   - `set_structured_output_active`: Toggle structured output

4. Additional Utilities:

   - `add_choice`: Append LLM choice to message list
   - `get_internal_request`: Retrieve full request details
   - `options`: Access request configuration options

The interface defines three tool choice constants:

- `tool_choice_none`
- `tool_choice_auto`
- `tool_choice_required`

## Dependencies

- `zllm_msg`: Message type
- `zllm_msgs`: Collection of messages
- `zllm_tools`: Collection of tools
- `zif_llm_tool`: Tool interface
- `zif_llm_options`: Options interface
- `zif_llm_so`: Structured output interface
