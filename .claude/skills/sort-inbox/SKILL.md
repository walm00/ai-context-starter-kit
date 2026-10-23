---
name: sort-inbox
description: Route files in docs/_inbox/ to where they belong. Use when the user says "sort the inbox", "clean up the inbox" or the inbox has more than a few files.
---

# Sort the inbox

1. List every file in `docs/_inbox/` except `README.md`.
2. For each, decide one of:
   - **Fact** → update the matching line in `docs/current-state.md` (replace, don't duplicate; add the date).
   - **Decision** → append a row to `docs/decisions.md`.
   - **Research / source** → move to `docs/research/` with a 3-line conclusion at the top.
   - **Junk / outdated** → propose deleting it.
3. Show the user the plan as a short table before changing anything. Apply after they say yes.
4. Never delete without asking. Don't commit unless asked.
