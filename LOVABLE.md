# Using the kit in Lovable

Lovable already reads the same kind of files this kit gives you. According to Lovable's docs, a root-level
`AGENTS.md` is **always read**, and Lovable skills use the same `SKILL.md` format as Claude Code, Codex and
Cursor. So you don't need a Lovable version of the kit. Put the files where Lovable looks.

## Where each piece goes

| Kit piece | In Lovable | Notes |
|---|---|---|
| `AGENTS.md` (repo root) | Read automatically in every session | The rules and the map. One file for Lovable and every other tool |
| `docs/*.md` (wake-up, current-state, decisions, session-log) | Ordinary files in the project | Lovable reads and edits them like code. `AGENTS.md` tells it to read them first |
| Skills (`setup`, `wrap-up`, `sort-inbox`, `pitch`) | **Workspace settings → Skills → Import from GitHub** | Paste a link from the list below. Owners and admins can import them, and anyone who can edit runs them with `/setup`, `/wrap-up` … |
| Project Knowledge (10,000 characters, always in context) | **Project settings → Knowledge** | Keep it short and point it to the files (snippet below). Don't copy the facts in, or you'll have two versions |
| Workspace Knowledge (10,000 characters, every project) | **Workspace settings → Knowledge** | Team-wide habits: stack, code style, "use Plan mode for anything bigger than one screen" |
| "where are we?" | **Chat mode** | Discussion only, no code changes. The cheapest messages, drawn from a daily allowance first |
| Bigger changes | **Plan mode → approve → Build mode** | Lovable writes the plan to `.lovable/plan.md`, so plans become files too. 1 credit per Plan message |
| Small changes | **Build mode**, one change per prompt | Credits depend on how much changes. Bookmark versions that work |
| `docs/research/` | Files, or upload them to the chat | Paste the market research as markdown, not as a link to a chat |

**Skill links to import** (Workspace settings → Skills → Import from GitHub):

```
https://github.com/walm00/ai-context-starter-kit/blob/main/.agents/skills/setup/SKILL.md
https://github.com/walm00/ai-context-starter-kit/blob/main/.agents/skills/wrap-up/SKILL.md
https://github.com/walm00/ai-context-starter-kit/blob/main/.agents/skills/sort-inbox/SKILL.md
https://github.com/walm00/ai-context-starter-kit/blob/main/.agents/skills/pitch/SKILL.md
```

**Project Knowledge snippet** (paste it as it is):

```
Project context lives in the repo, not here.
Before any change, read AGENTS.md, docs/wake-up.md and docs/current-state.md.
New facts go to docs/current-state.md, decisions to docs/decisions.md (with a why).
When I say "wrap up", run the wrap-up skill.
Keep each change small. Ask before changing the database schema or anything about payments or auth.
```

## Two ways to work

### A. Lovable only (no Git, no local tools)

1. Import the four skills (links above). One teammate who is a workspace owner or admin does this once.
2. In your project, type `/setup`. It creates `AGENTS.md` and the `docs/` files, asks up to 6 questions and
   fills them in. This is a Build-mode change and costs credits like any other.
3. Paste the Project Knowledge snippet.
4. Ask "where are we?" in **Chat mode** to check it.
5. End every session with `/wrap-up`.

### B. Lovable + GitHub + Claude Code / Codex / Cursor (more control, fewer Lovable credits)

Lovable is great for the UI, the preview, the built-in backend (Cloud) and publishing. A local agent is better
for long, multi-file work you want to review in a diff.

1. In Lovable, open **Project settings → Git → GitHub → Connect**. Lovable **creates a new repository** and
   syncs both ways. It can't attach to an existing repo.
2. Clone that repo and run the installer in it: `sh install.sh .` (or `install.ps1`). Nothing gets overwritten.
3. Open your tool in the repo and say **"set up the project"**. Commit and push.
4. Lovable pulls the push, and from then on reads your `AGENTS.md` too. If a push doesn't show up, push an
   empty commit (`git commit --allow-empty -m sync && git push`).
5. Split the work: Lovable for screens, visual tweaks, Cloud (database, auth, storage) and publishing; the
   local agent for refactors, tests, data logic and anything you want to read before it lands.

Rules for two-way sync, from Lovable's docs:
- Lovable edits and syncs **one branch** at a time (usually `main`).
- Don't let both sides edit the same thing at once. If Lovable and GitHub diverge, Lovable pushes its version to
  a separate `lovable-sync` branch, and the GitHub version wins.
- Lovable can't save files over 10 MB.

**Optional:** Lovable has an MCP server (`https://mcp.lovable.dev`, OAuth, all plans) that Claude Code and Cursor
can connect to. Reading files, diffs and history is free; `send_message` and `create_project` use credits.

## Spend fewer Lovable credits

- Ask questions in **Chat mode**, not Build mode.
- Use **Plan mode** (1 credit per message) before anything big, so the build happens once.
- Make **one change per prompt**, and check it in the preview before the next.
- Stopping a build before it changes anything costs nothing. Creating a draft costs nothing.
- If a fix fails twice, switch to Plan mode and ask for the root cause instead of retrying.
- With Git sync (way B), work done by your local agent doesn't run through Lovable's agent. *Inferred: the
  docs don't say whether a synced push costs anything.*

Sources: Lovable docs on [knowledge](https://docs.lovable.dev/features/knowledge),
[skills](https://docs.lovable.dev/features/skills), [GitHub sync](https://docs.lovable.dev/integrations/github),
[Plan mode](https://docs.lovable.dev/features/plan-mode),
[credits](https://docs.lovable.dev/introduction/credits-and-usage),
[MCP server](https://docs.lovable.dev/integrations/lovable-mcp-server). Checked 2026-10-24; Lovable changes fast.
