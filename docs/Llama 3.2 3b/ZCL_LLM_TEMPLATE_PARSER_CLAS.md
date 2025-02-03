---
title: ZCL_LLM_TEMPLATE_PARSER
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_TEMPLATE_PARSER

AI Generated documentation.
## Overview

The `zcl_llm_template_parser` class is a template parser that uses a limited Jinja2-like syntax to render templates with given contexts. The class provides methods to add templates, render templates, and process tokens in the template string. It also handles various control structures, such as if-else conditions, for loops, and nested loops.

## Dependencies

The class depends on the following:

* `cl_abap_typedescr` for type description
* `cl_abap_structdescr` for structure description
* `cl_abap_tabledescr` for table description
* `cl_abap_char_utilities` for character utilities
* `zcx_llm_template_parser` for exception handling

## Details

### Main Interactions

The class interacts with the following objects:

* `template_type`: represents a template with a name, content, and tokens
* `tokens_type`: represents a token with a type and content
* `control_stack_type`: represents a control stack with a type, condition met, any condition met, tokens, loop variable, collection, loop index, and loop tokens
* `data`: represents a data object with a reference to a table or structure

### Logic Flow

The class uses a top-down approach to parse the template string. It starts by tokenizing the string into a sequence of tokens, which are then processed in the following order:

1. For loops
2. If-else conditions
3. Nested loops
4. Control structures (endif, endfor)
5. Text and variable tokens

The class uses a control stack to keep track of the current control structure and its conditions. It also uses a data object to store the current context and its values.

### Interaction with Foreign Objects

The class interacts with the following foreign objects:

* `cl_abap_typedescr`: used to describe types and structures
* `cl_abap_structdescr`: used to describe structures
* `cl_abap_tabledescr`: used to describe tables
* `cl_abap_char_utilities`: used for character utilities
* `zcx_llm_template_parser`: used for exception handling

### Diagrams

Here is a mermaid diagram showing the main interactions between the class and its dependencies:
```mermaid
graph LR
    A[template_type] -->|add_template|> B[template]
    B -->|render|> C[data]
    C -->|resolve_variable|> D[variable_path]
    D -->|resolve_variable_ref|> E[data]
    E -->|format_table|> F[table]
    F -->|process_loop_content|> G[loop_var]
    G -->|process_token|> H[token]
    H -->|check_control_stack_conditions|> I[control_stack]
    I -->|handle_nested_for_loop|> J[control_stack]
    J -->|handle_conditional|> K[control_stack]
    K -->|handle_endif|> L[control_stack]
    L -->|handle_for_loop|> M[control_stack]
    M -->|handle_endfor|> N[control_stack]
    N -->|output_buffer|> O[output_buffer]
    O -->|result|> P[result]
```
Note: This diagram is a simplified representation of the main interactions between the class and its dependencies. It does not show all the details and edge cases.

