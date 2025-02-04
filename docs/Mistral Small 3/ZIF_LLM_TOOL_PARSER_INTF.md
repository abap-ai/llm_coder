---
title: ZIF_LLM_TOOL_PARSER
type: INTF
parent_object: ZLLM_CLIENT
parent_type: DEVC
---

# Interface ZIF_LLM_TOOL_PARSER

AI Generated documentation.

## Overview

The `ZIF_LLM_TOOL_PARSER` interface defines a public method for parsing tool definitions. The primary method, `PARSE`, is designed to process data descriptions and optional descriptions, returning a result string. This method can raise an exception of type `ZCX_LLM_VALIDATION` if validation fails.

## Dependencies

The interface depends on the following main components:

- `CL_ABAP_DATDESCR`: This class is used for data description in ABAP.
- `ZCX_LLM_VALIDATION`: This is a custom exception class used for validation errors.
