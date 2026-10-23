# Copy the kit into an existing project without overwriting anything.
# Usage: powershell -ExecutionPolicy Bypass -File install.ps1 C:\path\to\your\project
param([string]$Dst = ".")
$Src = $PSScriptRoot
$Dst = (Resolve-Path $Dst).Path
foreach ($dir in "docs", ".agents", ".claude") {
  Get-ChildItem -Path (Join-Path $Src $dir) -Recurse -File -Force | ForEach-Object {
    $rel = $_.FullName.Substring($Src.Length + 1)
    $target = Join-Path $Dst $rel
    if (Test-Path $target) { Write-Host "skip   $rel (exists)" }
    else {
      New-Item -ItemType Directory -Force (Split-Path $target) | Out-Null
      Copy-Item $_.FullName $target
      Write-Host "add    $rel"
    }
  }
}
foreach ($f in "AGENTS.md", "CLAUDE.md") {
  $target = Join-Path $Dst $f
  if (Test-Path $target) {
    if (Select-String -Path $target -Pattern "docs/wake-up.md|@AGENTS.md" -Quiet) {
      Write-Host "skip   $f (already has the kit)"
    } else {
      Add-Content $target "`n`n<!-- added by ai-context-starter-kit -->"
      if ($f -eq "CLAUDE.md") { Add-Content $target "@AGENTS.md" }
      else {
        $lines = Get-Content (Join-Path $Src $f)
        $i = [array]::IndexOf($lines, "## What this is")
        Add-Content $target $lines[$i..($lines.Length - 1)]
      }
      Write-Host "append $f"
    }
  } else {
    Copy-Item (Join-Path $Src $f) $target
    Write-Host "add    $f"
  }
}
$gi = Join-Path $Dst ".gitignore"
if (-not (Test-Path $gi)) { New-Item $gi | Out-Null }
$have = @(Get-Content $gi)
Get-Content (Join-Path $Src ".gitignore.kit") | Where-Object { $have -notcontains $_ } | Add-Content $gi
Write-Host "`nDone. Next: fill in docs/wake-up.md and docs/current-state.md, then the top of AGENTS.md."
