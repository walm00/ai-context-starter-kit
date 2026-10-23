---
name: setup
description: First-time project setup for the AI context starter kit. Use when the user says "set up the project", "setup", "onboard us", or when AGENTS.md still contains the "[Product]" placeholder.
---

# Set up the project

Turn the kit's templates into this project's real context. Takes 5 minutes. Ask little, infer a lot.

1. **Already done?** If `AGENTS.md` no longer contains `[Product]`, say the project is set up and offer
   "where are we?" instead. Stop.
2. **Read what exists first:** README, package/dependency files (`package.json`, `pyproject.toml`, ...),
   any existing docs, `docs/research/`, the last few git commits. Note what you can already answer.
3. **Ask once, in one message, only what you couldn't infer** (at most 6 questions):
   - What are you building, in one sentence?
   - Who exactly is it for? (a specific person in a specific situation)
   - What will the judges / first users see in the 30-second demo?
   - What is in scope this weekend, and what is explicitly out?
   - Stack and how to run it, if there is no code yet.
   - Who is on the team, and who owns what?
4. **Write the answers into the files**, each fact in one place, dated where it may change:
   - `AGENTS.md`: "What this is" and "How to run" (real commands from the package files).
     Remove the "Not set up yet?" line.
   - `docs/wake-up.md`: every line, plus the timestamp.
   - `docs/current-state.md`: User, Scope (in and out), Stack.
   - `docs/decisions.md`: replace the two example rows with the choices already made, each with a why.
   - `docs/session-log.md`: first entry, "Setup".
   Delete the template's example text and placeholders. Leave a field as `TBD` rather than invent it.
5. **Show a short summary** of what you wrote, then: "Ask me *where are we?* to check it."
   Don't commit unless asked.
