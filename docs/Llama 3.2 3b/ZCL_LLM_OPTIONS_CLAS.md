---
title: ZCL_LLM_OPTIONS
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_OPTIONS

AI Generated documentation.
## Overview
The `zcl_llm_options` class is a custom implementation of the `zif_llm_options` interface, providing methods for setting and retrieving parameters for a language model. The class is designed to handle various parameters such as temperature, top_p, top_k, seed, frequency penalty, presence penalty, and minimum probability. The class uses a private internal table `int_parameters` to store the parameter values.

## Dependencies
The class depends on the following:

* `zif_llm_options` interface
* `zcx_llm_validation` exception class

## Details
### Method Overview

The class provides the following public methods:

* `set_parameter`: Sets a parameter value. If the parameter already exists, it replaces the existing value.
* `get_parameters`: Retrieves the current parameter values.
* `set_custom_parameters`: Sets custom parameters with a single key-value pair.
* `set_frequency_penalty`, `set_min_p`, `set_presence_penalty`, `set_seed`, `set_temperature`, `set_top_a`, `set_top_k`, and `set_top_p`: Set specific parameter values with validation.
* `set_max_tokens`: Sets the maximum number of tokens.

### Interaction Flow

The interaction flow between the methods can be visualized as follows:
```mermaid
graph LR
    A[set_parameter] -->|sets parameter value| B(get_parameters)
    B -->|returns parameter values| C(set_custom_parameters)
    C -->|sets custom parameters| D(get_parameters)
    E(set_frequency_penalty) -->|sets frequency penalty| F(get_parameters)
    F -->|returns parameter values| G(set_min_p)
    G -->|sets minimum probability| H(get_parameters)
    H -->|returns parameter values| I(set_presence_penalty)
    I -->|sets presence penalty| J(get_parameters)
    J -->|returns parameter values| K(set_seed)
    K -->|sets seed| L(get_parameters)
    L -->|returns parameter values| M(set_temperature)
    M -->|sets temperature| N(get_parameters)
    N -->|returns parameter values| O(set_top_a)
    O -->|sets top_a| P(get_parameters)
    P -->|returns parameter values| Q(set_top_k)
    Q -->|sets top_k| R(get_parameters)
    R -->|returns parameter values| S(set_top_p)
    S -->|sets top_p| T(get_parameters)
    T -->|returns parameter values| U(set_max_tokens)
    U -->|sets maximum tokens| V(get_parameters)
```
### Interaction with Foreign Objects

The class interacts with the following foreign objects:

* `zif_llm_options` interface: The class implements this interface, providing the required methods.
* `zcx_llm_validation` exception class: The class raises this exception when invalid parameter values are set.

### Internal Table

The class uses a private internal table `int_parameters` to store the parameter values. The table is used to store the parameter values and is updated by the `set_parameter` method.

