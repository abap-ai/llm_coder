# ABAP AI LLM Coder

**Status**: Early preview, expect major changes (already planned). Focus is to show the [Documentation Showcase](https://abap-ai.github.io/llm_coder/).

This repository will in future contain coder support related topics. Note you need the llm client and llm agent package to run this.

## Showcase - Generated ABAP Documentation

[Documentation Showcase](https://abap-ai.github.io/llm_coder/):

* Generated documentation of the llm_client repo
* Differnet models used to show differences
* Focus on a simple overview and to give you an idea what to do with the llm client and agent
* Simple, not yet optimized prompts.

Early Learnings:

* Promising - high level overview usually enough. While it would be possible to generate very detailed documentations this is usually not required. ABAP developers are used to look at code and have easy access --> focus on giving a high level overview only.
* Agents are the preferred interface. Using the client directly is only relevant for special cases --> Plan is to merge the client and agent package.
* Agents should have some default retry- and error correction logic to catch simple and common fails.
* There are many simple markdown issues - not a big deal but the tool used to display the documentation takes this serious --> consider some automated corrections or do it later on github
