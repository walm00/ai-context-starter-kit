#!/usr/bin/env sh
# Copy the kit into an existing project without overwriting anything.
# Usage: sh install.sh /path/to/your/project
set -e
SRC="$(cd "$(dirname "$0")" && pwd)"
DST="$(cd "${1:-.}" && pwd)"
cd "$SRC"
find docs .agents .claude -type f | while read -r f; do
  if [ -e "$DST/$f" ]; then
    echo "skip   $f (exists)"
  else
    mkdir -p "$DST/$(dirname "$f")"; cp "$f" "$DST/$f"; echo "add    $f"
  fi
done
for f in AGENTS.md CLAUDE.md; do
  if [ -e "$DST/$f" ]; then
    if grep -q "docs/wake-up.md\|@AGENTS.md" "$DST/$f"; then
      echo "skip   $f (already has the kit)"
    else
      printf '\n\n<!-- added by ai-context-starter-kit -->\n' >> "$DST/$f"
      if [ "$f" = "CLAUDE.md" ]; then
        echo "@AGENTS.md" >> "$DST/$f"
      else
        sed -n '/^## What this is/,$p' AGENTS.md >> "$DST/$f"
      fi
      echo "append $f"
    fi
  else
    cp "$f" "$DST/$f"; echo "add    $f"
  fi
done
touch "$DST/.gitignore"
while read -r line; do
  grep -qxF "$line" "$DST/.gitignore" || echo "$line" >> "$DST/.gitignore"
done < .gitignore.kit
echo
echo "Done. Next: fill in docs/wake-up.md and docs/current-state.md, then the top of AGENTS.md."
