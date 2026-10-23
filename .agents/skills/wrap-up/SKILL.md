---
name: wrap-up
description: End-of-session context update. Use when the user says "wrap up", "end session", "save progress" or is about to close the chat.
---

# Wrap up

Keep the project folder true so the next session (or teammate) starts right. Takes 30 seconds.

1. Look at what changed this session (the conversation + `git diff`).
2. **current-state.md** - if something became true (user, scope, stack), update that line in place.
   Never add a second version of a fact. Add the date.
3. **decisions.md** - if something was decided, append one row: date, decision, why, who.
4. **session-log.md** - add on top: Done / Open / Next, 1 line each. Keep only the last ~5 entries.
5. **wake-up.md** - refresh Status, Blocked on, Next step, and the timestamp.
6. Anything you're unsure about → `docs/_inbox/` with today's date. Don't guess a location.
7. Show the user a 3-line summary of what you changed. Don't commit unless asked.
