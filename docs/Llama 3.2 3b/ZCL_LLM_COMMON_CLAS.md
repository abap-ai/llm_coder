---
title: ZCL_LLM_COMMON
type: CLAS
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Class ZCL_LLM_COMMON

AI Generated documentation.

## Overview

The `zcl_llm_common` class provides a set of methods for converting between ABAP data structures and JSON strings. The class is designed to work with the `zllm_implementation` class, which is not shown in the provided code. The main public methods are:

* `to_json`: Converts an ABAP data structure to a JSON string.
* `from_json`: Converts a JSON string to an ABAP data structure.
* `get_llm_badi`: Returns a reference to the `zllm_implementation` class.

## Dependencies

The class depends on the `zllm_implementation` class, which is not shown in the provided code. Additionally, the class uses the `cl_abap_unit_assert` class for assertions.

## Details

The class uses a class diagram to visualize the relationships between its methods and data structures. The class diagram shows the following relationships:

* The `setup` and `teardown` methods are used to prepare and clean up test data.
* The `convert_struct_to_json` and `convert_json_to_struct` methods are used to convert between ABAP data structures and JSON strings.
* The `convert_empty_struct` method is used to convert an empty ABAP data structure to a JSON string.
* The `get_llm_badi` method returns a reference to the `zllm_implementation` class.

The class uses the `zcl_llm_common=>to_json` and `zcl_llm_common=>from_json` methods to perform the conversions. These methods are not shown in the provided code, but they are likely implemented in the `zcl_llm_common` class.

The class also uses the `cl_abap_unit_assert` class to perform assertions on the results of the conversions.

```mermaid
class zcl_llm_common {
  +---------------+
  |  setup      |
  +---------------+
  |  teardown    |
  +---------------+
  |  convert_struct_to_json  |
  |  convert_json_to_struct  |
  |  convert_empty_struct  |
  +---------------+
  |  test_data    |
  +---------------+
  |  to_json       |
  |  from_json     |
  |  get_llm_badi   |
  +---------------+
}
```

Note: The class diagram is a simple representation of the class structure and its methods.
