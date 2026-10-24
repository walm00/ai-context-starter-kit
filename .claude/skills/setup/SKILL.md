---
name: setup
description: First-time project setup for the AI context starter kit. Use when the user says "set up the project", "setup", "onboard us", or when AGENTS.md is missing or still contains the "[Product]" placeholder. Works in Claude Code, Codex, Cursor and Lovable.
---

# Set up the project

Turn the kit's templates into this project's real context. Takes 5 minutes. Ask little, infer a lot.

1. **Already done?** If `AGENTS.md` exists and no longer contains `[Product]`, say the project is set up and
   offer "where are we?" instead. Stop.
2. **Files missing?** (For example, a Lovable project where only this skill was imported.) Create them with
   these sections, then continue:
   - `AGENTS.md` (repo root): What this is · Read first (`docs/wake-up.md`, `docs/current-state.md`,
     `docs/session-log.md`) · How to run · Rules (never read or print secrets; tests or a preview check before
     "done") · Where new information goes (facts → current-state.md, decisions → decisions.md, unsure →
     `docs/_inbox/`) · Phrases ("where are we?", "wrap up").
   - `docs/wake-up.md`: Building · For · Demo moment · Status · Blocked on · Next step · Don't.
   - `docs/current-state.md`: User · Scope (in / out) · Stack · Later.
   - `docs/decisions.md`: a table with Date | Decision | Why | Who.
   - `docs/session-log.md`: newest entry on top, Done / Open / Next.
3. **Read what exists first:** README, package/dependency files (`package.json`, `pyproject.toml`, ...),
   any existing docs, `docs/research/`, the last few git commits. Note what you can already answer.
4. **Ask once, in one message, only what you couldn't infer** (at most 6 questions):
   - What are you building, in one sentence?
   - Who exactly is it for? (a specific person in a specific situation)
   - What will the judges / first users see in the 30-second demo?
   - What is in scope this weekend, and what is explicitly out?
   - Stack and how to run it, if there is no code yet.
   - Who is on the team, and who owns what?
5. **Write the answers into the files**, each fact in one place, dated where it may change:
   - `AGENTS.md`: "What this is" and "How to run" (real commands from the package files).
     Remove the "Not set up yet?" line.
   - `docs/wake-up.md`: every line, plus the timestamp.
   - `docs/current-state.md`: User, Scope (in and out), Stack.
   - `docs/decisions.md`: replace the two example rows with the choices already made, each with a why.
   - `docs/session-log.md`: first entry, "Setup".
   Delete the template's example text and placeholders. Leave a field as `TBD` rather than invent it.
6. **Show a short summary** of what you wrote, then: "Ask me *where are we?* to check it."
   Don't commit unless asked.
