---
title: ZCL_LLM_TOOL_CALCULATOR
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_TOOL_CALCULATOR

AI Generated documentation.

## Overview

The `zcl_llm_tool_calculator` class is a comprehensive calculator class that provides a wide range of mathematical operations, including addition, subtraction, multiplication, division, power, modulo, and complex expressions. The class is designed to evaluate mathematical expressions and return the result.

## Dependencies

The class depends on the `zif_llm_tool` interface, which provides the `get_tool_details` method. It also uses various internal data structures such as `tokens`, `operator_stack`, and `value_stack` to store and process the input expressions.

## Details

### Class Structure

The class is structured into several methods, each with a specific purpose:

* `evaluate_expression`: Evaluates a mathematical expression and returns the result.
* `tokenize`: Breaks down the input expression into individual tokens (operators and operands).
* `parse_number`: Converts a string to a decimal number.
* `get_operator_precedence`: Returns the precedence of an operator.
* `evaluate_tokens`: Evaluates the tokens in the correct order using the Shunting-yard algorithm.
* `apply_operator`: Applies an operator to two operands and returns the result.
* `process_operator`: Processes an operator and adds it to the operator stack.
* `pop_from_stack`: Removes an element from the operator stack.
* `peek_stack`: Returns the top element of the operator stack without removing it.

### Logic Flow

The class uses a combination of Shunting-yard algorithm and recursive descent parsing to evaluate mathematical expressions. The logic flow can be visualized as follows:

```
+---------------+
|  Input Expression  |
+---------------+
       |
       |
       v
+---------------+
|  Tokenize     |
|  (break down  |
|   input into   |
|   tokens)     |
+---------------+
       |
       |
       v
+---------------+
|  Parse Number  |
|  (convert   |
|   string to   |
|   decimal)   |
+---------------+
       |
       |
       v
+---------------+
|  Evaluate    |
|  Tokens     |
|  (Shunting-  |
|   yard algorithm)|
+---------------+
       |
       |
       v
+---------------+
|  Apply Operator|
|  (apply     |
|   operator to  |
|   operands)   |
+---------------+
       |
       |
       v
+---------------+
|  Process     |
|  Operator    |
|  (add to    |
|   operator  |
|   stack)     |
+---------------+
       |
       |
       v
+---------------+
|  Pop from    |
|  Stack      |
|  (remove    |
|   operator)  |
+---------------+
       |
       |
       v
+---------------+
|  Evaluate    |
|  Result     |
|  (return    |
|   result)   |
+---------------+
```

### Interaction with Foreign Objects

The class interacts with foreign objects such as classes, function modules, and tables as follows:

* `zif_llm_tool`: The class depends on the `zif_llm_tool` interface, which provides the `get_tool_details` method.
* `cl_abap_typedescr`: The class uses the `cl_abap_typedescr` class to describe the `CALCULATION_INPUT` type.
* `STANDARD TABLES`: The class uses standard tables such as `tokens`, `operator_stack`, and `value_stack` to store and process the input expressions.
