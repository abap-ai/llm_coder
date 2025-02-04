"! <p class="shorttext synchronized" lang="en">Central prompts class</p>
"! We do it this was as prompts are often too long to be fixed values.
"! Nevertheless it is helpful to have prompts in a central place
"! for easy maintenance and to keep them consistent.
CLASS zcl_llm_adoc_prompts DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS class_constructor.

    CLASS-DATA class_doc       TYPE string.
    CLASS-DATA class_test      TYPE string.
    CLASS-DATA purpose         TYPE string.
    CLASS-DATA debug           TYPE string.
    CLASS-DATA report_doc      TYPE string.
    CLASS-DATA interface_doc   TYPE string.
    CLASS-DATA function_module TYPE string.
    CLASS-DATA function_group  TYPE string.
    CLASS-DATA package         TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_llm_adoc_prompts IMPLEMENTATION.
  METHOD class_constructor.
    class_doc = |Create an overview documentation of the whole class. |
            && |Focus on public methods, main interactions and the important aspects. |
            && |Create the following sections directly starting with the first, do not add any content before the first heading:\n|
            && |## Overview\n|
            && |Overview of the functionality and public methods.\n|
            && |## Dependencies\n|
            && |List main dependencies if applicable. If there are none ignore this section.\n|
            && |## Details\n|
            && |Additional details giving the expert a more in-depth overview of the class. |
            && |If applicable make use of mermaid diagrams to visualize aspects like logic flow |
            && |or interaction with foreign objects like classes, function modules and tables. Do not repeat anything from the upper sections.\n| ##NO_TEXT.

    class_test = |Analyze the following ABAP test class and summarize the tests for each used class method.\n|
              && |Use the following format:\n<Class method>\n* <test>\n* <test>\n```| ##NO_TEXT.

    interface_doc = |Create an overview documentation of the give interface. |
            && |Create the following sections directly starting with the first, do not add any content before the first heading:\n|
            && |## Overview\n|
            && |Overview of the public methods.\n|
            && |## Dependencies\n|
            && |List main dependencies if applicable. If there are none ignore this section.\n| ##NO_TEXT.

    purpose = |Output a short summary focused on the puprose of this development object. One sentence preferred, maximum two. |
           && |Do not start with a header, just give the summary.| ##NO_TEXT.

    report_doc = |Create an overview documentation of the report. |
            && |Focus on main functionality, performs, etc. Dynpros may exist but are not part of the current source code. |
            && |Create the following sections directly starting with the first, do not add any content before the first heading:\n|
            && |## Overview\n|
            && |Overview of the functionality and main code objects.\n|
            && |## Dependencies\n|
            && |List main dependencies if applicable. If there are none ignore this section.\n|
            && |## Details\n|
            && |Additional details giving the expert a more in-depth overview of the report. |
            && |If applicable make use of mermaid diagrams to visualize aspects like logic flow |
            && |or interaction with foreign objects like classes, function modules and tables. Do not repeat anything from the upper sections.\n| ##NO_TEXT.

    function_module = |Create an overview documentation of this Function Module. |
            && |Focus on main functionality, performs, etc. You will first get the source code of common includes and then |
            && |the function module main include. Focus on the function module, the common includes are just to give you more details. \n|
            && |Create the following sections directly starting with the first, do not add any content before the first heading:\n|
            && |## Overview\n|
            && |Overview of the functionality and main code objects.\n|
            && |## Dependencies\n|
            && |List main dependencies if applicable. If there are none ignore this section.\n|
            && |## Details\n|
            && |Additional details giving the expert a more in-depth overview of the function module. |
            && |If applicable make use of mermaid diagrams to visualize aspects like logic flow |
            && |or interaction with foreign objects like classes, function modules and tables. Do not repeat anything from the upper sections.\n| ##NO_TEXT.

     function_group = |Create an overview documentation of the Function Group. You get a short overview of all included function modules. |
            && |Create the following sections directly starting with the first, do not add any content before the first heading:\n|
            && |## Overview\n|
            && |Overview of the main features of the whole function group. \n| ##NO_TEXT.

     package = |Summarize the whole abap development package that is given below after the overview instructions. |
            && |Do not list the elements, really focus on the overall features in a concise format.\n|
            && |Create the following sections directly starting with the first, do not add any content before the first heading:\n|
            && |## Overview\n|
            && |Package overview\n| ##NO_TEXT.

    " Useful to get further insights into required tools to better document the code objects.
    " Mostly used during development.
    debug = |Any IMPORTANT information from other objects that would have been required or waas all relevant information available? |
         && |Do NOT call any tool now, just respond to this question! | ##NO_TEXT.
  ENDMETHOD.

ENDCLASS.
