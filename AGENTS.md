# AGENTS.md

> Read by the AI at the start of every session: Codex and Cursor directly, Claude Code through `CLAUDE.md`.
> One file, every tool. Keep it under ~100 lines. Link out, don't paste in.

**Not set up yet?** If this file still says `[Product]` below, run the `setup` skill before anything else.

## What this is
<!-- 2-3 sentences: the product, who it is for, the one problem it solves. -->
[Product] helps [specific user] to [do one thing] without [current pain].

## Read first
1. `docs/wake-up.md` - where we are right now
2. `docs/current-state.md` - what is true (user, scope, stack, decisions)
3. `docs/session-log.md` - what the last session left open

## How to run
<!-- Exact commands. The AI will guess them otherwise. -->
- Install: `npm install`
- Dev: `npm run dev`
- Test: `npm test`

## Rules
- Never read, print or commit `.env` or any key.
- Don't add a new library without saying why in `docs/decisions.md`.
- Before saying "done": run the tests and show the output.
- If something here conflicts with the code, ask - don't pick one silently.

## Where new information goes
| It's a... | Write it to |
|---|---|
| new fact (user, scope, stack) | `docs/current-state.md` - update the existing line, don't add a second one |
| decision | `docs/decisions.md` - one line, with date and why |
| research, notes, links | `docs/research/` |
| not sure | `docs/_inbox/YYYY-MM-DD-topic.md` |

## Definition of done
Works locally, tests pass, `current-state.md` still true, session-log updated.

## Phrases
| I say | You do |
|---|---|
| "set up the project" | run the `setup` skill (first time only) |
| "where are we?" | answer from `docs/wake-up.md` + `docs/session-log.md` |
| "wrap up" | run the `wrap-up` skill (end of every session) |
| "sort the inbox" | run the `sort-inbox` skill |

Skills live in `.agents/skills/` (Codex, Cursor) and `.claude/skills/` (Claude Code).
