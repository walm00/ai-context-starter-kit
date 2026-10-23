# AI context starter kit

The minimum folder structure so your AI coding tool knows what you're building - every session, every teammate.
Works with **Claude Code, Codex and Cursor**.

> Your AI forgets everything. Your folder doesn't.

## Install

**New project:** click **Use this template** on GitHub (or download the zip) and start there.

**Existing project:** copy it on top. Nothing gets overwritten: existing files are skipped, and an existing
`AGENTS.md` / `CLAUDE.md` gets the kit's section appended at the end.

```bash
sh install.sh /path/to/your/project
```

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1 C:\path\to\your\project
```

## Then, in the first 15 minutes, as a team

1. Fill in `docs/wake-up.md` - 7 lines.
2. Fill in `docs/current-state.md` - user, scope, stack.
3. Fill in "What this is" and "How to run" in `AGENTS.md`.
4. End every session with **"wrap up"**.

## What's inside

```
AGENTS.md                 rules + map - read by Codex and Cursor
CLAUDE.md                 imports AGENTS.md for Claude Code
docs/
  wake-up.md              10-line briefing - read first
  current-state.md        what is TRUE now - one place per topic
  decisions.md            append-only: date, decision, why
  session-log.md          handoff between sessions and people
  research/               market research, interviews, sources
  _inbox/                 not sure where it goes? here.
.agents/skills/           wrap-up, sort-inbox (Codex + Cursor)
.claude/skills/           same skills for Claude Code
.claude/settings.json     SessionStart hook: shows wake-up.md every session
```

| Tool | Reads instructions from | Reads skills from |
|---|---|---|
| Claude Code | `CLAUDE.md` (imports `AGENTS.md`) | `.claude/skills/` |
| Codex | `AGENTS.md` | `.agents/skills/` |
| Cursor | `AGENTS.md` | `.agents/skills/` |

If you edit a skill, edit both copies (or delete the folder your tool doesn't use).

## Keep it true

1. **One owner per topic.** Each fact is written in one place. Link, don't copy.
2. **Date your facts.** The AI can then tell old from new.
3. **When unsure, inbox it.** The wrong place is worse than the inbox.
4. **Correct the AI in the file, not the chat.** Explained it twice? It belongs in a file.

Every task produces two outputs: the work, and the update to the context.

## Going further

This is the 10-file version. The full system - ownership rules, staleness checks, scheduled maintenance -
is [CLEAR Context OS](https://github.com/walm00/business-context-os), a free Claude Code plugin.

MIT licence · Guntis Coders · THEO Growth
