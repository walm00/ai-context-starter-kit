---
name: pitch
description: Turn the project's context files into a demo-day pitch, a stakeholder update or a colleague explainer. Use when the user says "prepare the pitch", "demo day", "write an update", "explain this project to someone", or asks for a pitch script or slide outline.
---

# Pitch from context

The context files already hold the story. Write it from them, not from memory, and invent nothing.

1. **Read** `docs/wake-up.md`, `docs/current-state.md`, `docs/decisions.md`, `docs/session-log.md` and
   `docs/research/` (the conclusions at the top of each file). Run "where are we?" in your head first.
2. **Ask one question:** who is it for (judges / investors / colleagues / a customer) and how long (default 3 minutes).
3. **Write**, in this order, to `docs/pitch.md` (overwrite it each time; it's a derivative, not a source of truth):
   - **One line:** "[Product] helps [user] [do X] without [pain]."
   - **Script**, about 130 spoken words per minute: problem (with one fact from research) → who has it →
     what we built → **the demo moment** from wake-up.md → what's next → the ask.
   - **Slide outline:** 5 slides max, one idea each, the demo as its own slide.
   - **Hard questions + answers:** 5 likely questions, each answered from `decisions.md` (the "why" column).
   - **For an update instead of a pitch:** done / next / blocked / decisions since last time, from session-log.md.
4. **Mark every claim the files don't support** as `[CHECK]`. Never make up a number, a user quote or a result.
5. Show the one line and the script, and list any `[CHECK]` items. Don't commit unless asked.
