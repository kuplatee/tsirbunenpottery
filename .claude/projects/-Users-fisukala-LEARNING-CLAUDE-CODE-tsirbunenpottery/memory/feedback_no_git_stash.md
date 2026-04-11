---
name: Never use git stash mid-session
description: Do not use git stash to verify pre-existing errors — it reverts all in-progress changes and confuses the user
type: feedback
---

Never use `git stash` as a diagnostic or verification tool mid-session. It reverts all uncommitted work, leaving the user with code that looks unchanged.

**Why:** Running `git stash` during active work to "check baseline state" discards the session's changes, which is disorienting and wastes the user's time restoring.

**How to apply:** To check whether an error pre-existed your changes, use `git diff` or `git stash` only if explicitly asked. For baseline checks, prefer reading the original file via `git show HEAD:path/to/file` or just note that the errors exist separately from the changed files.
