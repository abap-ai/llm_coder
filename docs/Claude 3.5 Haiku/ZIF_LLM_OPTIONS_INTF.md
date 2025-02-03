---
title: ZIF_LLM_OPTIONS
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_OPTIONS

AI Generated documentation.
## Overview
The `zif_llm_options` interface defines configuration methods for Large Language Model (LLM) call parameters. It provides setter methods for various model generation parameters with specific value ranges and validation:

- `set_temperature`: Controls randomness (range 0-2)
- `set_max_tokens`: Sets maximum token output (> 0)
- `set_top_p`: Nucleus sampling parameter (range 0-1)
- `set_top_k`: Top-k sampling parameter (range 1-infinity)
- `set_seed`: Enables reproducible output generation
- `set_frequency_penalty`: Reduces repetition of tokens (range -2 to 2)
- `set_presence_penalty`: Encourages topic diversity (range -2 to 2)
- `set_min_p`: Minimum probability threshold (range 0-1)
- `set_top_a`: Alternative sampling parameter (range 0-1)
- `set_custom_parameters`: Allows adding custom key-value parameters
- `get_paramters`: Retrieves all configured parameters

Each setter method raises a `zcx_llm_validation` exception for invalid input values.

## Dependencies
- Custom exception class: `zcx_llm_validation`
- Custom type: `zllm_keyvalues` (key-value list for parameters)

