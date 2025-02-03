---
title: ZIF_LLM_CHAT_REQUEST
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_CHAT_REQUEST

AI Generated documentation.
## Overview
The `ZIF_LLM_CHAT_REQUEST` interface provides functionality to manage chat interactions with a Language Learning Model (LLM). The interface handles:

1. Message Management
- `add_message()` - Adds a single message
- `add_messages()` - Adds multiple messages 
- `get_messages()` - Retrieves all messages
- `clear_messages()` - Removes all messages

2. Tool Management
- `add_tool()` - Adds a single tool with optional tool choice
- `add_tools()` - Adds multiple tools with optional tool choice
- `get_tools()` - Retrieves all tools
- `clear_tools()` - Removes all tools
- `set_tool_choice()` - Sets tool choice mode (none/auto/required)
- `add_tool_result()` - Adds tool execution results
- `add_tool_choices()` - Adds tool call information

3. Structured Output Handling
- `set_structured_output()` - Configures structured output settings
- `set_structured_output_active()` - Enables/disables structured output
- `add_choice()` - Appends LLM choice to message list

4. Internal Methods
- `get_internal_request()` - Retrieves complete request details
- `options()` - Provides access to options implementation

## Dependencies
The interface has the following key dependencies:
- `ZIF_LLM_TOOL` - Tool interface
- `ZIF_LLM_OPTIONS` - Options interface
- `ZIF_LLM_SO` - Structured output interface
- Custom data types: `ZLLM_MSG`, `ZLLM_MSGS`, `ZLLM_TOOLS`, `ZLLM_TOOL_CALLS`, `ZLLM_CHOICE`, `ZLLM_REQUEST`

