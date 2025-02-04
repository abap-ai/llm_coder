---
title: ZIF_LLM_OPTIONS
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_OPTIONS

AI Generated documentation.

## Overview

The interface `ZIF_LLM_OPTIONS` provides methods to configure parameters for Large Language Model (LLM) calls. It offers setters for common LLM parameters with validation:

```mermaid
classDiagram
    class ZIF_LLM_OPTIONS {
        +set_temperature(temperature: decfloat16)
        +set_max_tokens(tokens: i)
        +set_top_p(top_p: decfloat16)
        +set_top_k(top_k: i)
        +set_seed(seed: i)
        +set_frequency_penalty(frequency_penalty: decfloat16)
        +set_presence_penalty(presence_penalty: decfloat16)
        +set_min_p(min_p: decfloat16)
        +set_top_a(top_a: decfloat16)
        +set_custom_parameters(parameters: zllm_keyvalues)
        +get_paramters() zllm_keyvalues
    }
```

Key methods:

- Temperature control (range 0-2)
- Token limit setting (positive integers)
- Various sampling parameters (top_p, top_k, min_p, top_a)
- Penalty controls for frequency and presence (range -2 to 2)
- Seed setting for reproducible results
- Custom parameter handling

All setter methods include validation and can raise `ZCX_LLM_VALIDATION` exceptions.

## Dependencies

- `ZCX_LLM_VALIDATION` - Exception class for parameter validation
- `ZLLM_KEYVALUES` - Type for key-value parameter storage
