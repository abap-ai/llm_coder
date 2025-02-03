---
title: ZCL_LLM_CHAT_REQUEST
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_CHAT_REQUEST

AI Generated documentation.
## Overview

The `ltcl_chat_request` class is a test class that implements the `zif_llm_chat_request` interface. It provides methods for testing chat request functionality, including adding messages, tools, and tool results, as well as clearing messages and tools. The class also provides methods for getting messages and tools, setting structured output, and setting tool choice.

## Dependencies

The `ltcl_chat_request` class depends on the following:

* `zllm_request` class
* `zcl_llm_common` class
* `zif_llm_client` interface
* `zif_llm_tool` interface

## Details

### Main Interactions

The `ltcl_chat_request` class interacts with the following objects:

* `zllm_request` object: This object is used to store the chat request data.
* `zcl_llm_common` class: This class is used to convert data to JSON format.
* `zif_llm_client` interface: This interface is used to get the role of the client.
* `zif_llm_tool` interface: This interface is used to get the tool result.

### Logic Flow

The logic flow of the class can be visualized as follows:

```
+---------------+
|  Constructor  |
+---------------+
       |
       | request
       v
+---------------+
|  add_choice   |
+---------------+
       |
       | messages
       v
+---------------+
|  add_message  |
+---------------+
       |
       | messages
       v
+---------------+
|  add_tool     |
+---------------+
       |
       | tools
       v
+---------------+
|  add_tool_result|
+---------------+
       |
       | messages
       v
+---------------+
|  clear_messages|
+---------------+
       |
       | messages
       v
+---------------+
|  clear_tools   |
+---------------+
       |
       | tools
       v
+---------------+
|  get_messages  |
+---------------+
       |
       | messages
       v
+---------------+
|  get_tools     |
+---------------+
       |
       | tools
       v
+---------------+
|  set_structured_output|
+---------------+
       |
       | structured_output
       v
+---------------+
|  set_tool_choice  |
+---------------+
       |
       | tool_choice
       v
+---------------+
|  get_internal_request|
+---------------+
```

### Interaction with Foreign Objects

The `ltcl_chat_request` class interacts with the following foreign objects:

* `zcl_llm_common` class: This class is used to convert data to JSON format.
* `zif_llm_client` interface: This interface is used to get the role of the client.
* `zif_llm_tool` interface: This interface is used to get the tool result.
* `zllm_request` object: This object is used to store the chat request data.

Note: The above diagram is a simplified representation of the interactions between the `ltcl_chat_request` class and its dependencies. It may not show all the interactions or the exact flow of data.

