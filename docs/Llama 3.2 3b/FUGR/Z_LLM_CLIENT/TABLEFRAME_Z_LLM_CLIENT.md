---
title: TABLEFRAME_Z_LLM_CLIENT
type: FUNC
parent_object: Z_LLM_CLIENT
parent_type: FUGR
---

# Function Module TABLEFRAME_Z_LLM_CLIENT

AI Generated documentation.
### Common Includes

No includes are shown as this is a table frame function group.

### Function Module Main Include

```abap
FUNCTION TABLEFRAME_Z_LLM_CLIENT
  IMPORTING
    VALUE(X_HEADER) TYPE  STRING
    VALUE(X_NAMTAB) TYPE  STRING
    VALUE(X_CORR_NUMBER) TYPE  I
    VALUE(X_VIEW_ACTION) TYPE  C
    VALUE(X_VIEW_NAME) TYPE  C.

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
    EXCL_CUA_FUNCT
    USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.
ENDFUNCTION.
```

### Overview

The function module `TABLEFRAME_Z_LLM_CLIENT` is used to perform a table frame operation. It takes several parameters, including the header, name of the table, correlation number, view action, and view name.

### Dependencies

* None

### Details

The function module `TABLEFRAME_Z_LLM_CLIENT` performs a table frame operation using the `TABLEFRAME` function module. The `TABLEFRAME` function module is used to perform various table frame operations, such as creating, updating, and deleting tables.

The function module takes several parameters, including:

* `X_HEADER`: The header of the table frame.
* `X_NAMTAB`: The name of the table.
* `X_CORR_NUMBER`: The correlation number.
* `X_VIEW_ACTION`: The view action.
* `X_VIEW_NAME`: The view name.

The function module uses the `DBA_SELLIST` and `DPL_SELLIST` function modules to perform the table frame operation. The `EXCL_CUA_FUNCT` parameter is used to exclude certain functions.

```mermaid
graph LR
  A[ TABLEFRAME_Z_LLM_CLIENT ] -->|X_HEADER|> B[ TABLEFRAME ]
  A -->|X_NAMTAB|> C[ TABLEFRAME ]
  A -->|X_CORR_NUMBER|> D[ DBA_SELLIST ]
  A -->|X_VIEW_ACTION|> E[ DPL_SELLIST ]
  A -->|X_VIEW_NAME|> F[ DBA_SELLIST ]
  B -->|EXCL_CUA_FUNCT|> G[ Exclude certain functions ]
```

Note: The mermaid diagram is a simplified representation of the function module's logic flow and interactions with foreign objects.

