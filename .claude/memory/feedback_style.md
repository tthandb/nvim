---
name: Feedback and style preferences
description: How the user prefers Claude to work in this repo
type: feedback
---

Prefers full cleanup over minimal fixes — when asked to review/fix, remove dead code and redundant config rather than just patching the immediate error.

**Why:** User explicitly chose "full cleanup" when given the option during the config review.

**How to apply:** When fixing a bug in a config file, also remove commented-out stubs, redundant duplicate configs, and deprecated API calls in the same file if spotted.
