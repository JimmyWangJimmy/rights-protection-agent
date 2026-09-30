# install.ps1 - Windows PowerShell one-liner installer for rights-protection-agent

$targetDir = "$HOME\.claude\skills\rights-protection-agent"
Write-Host "Installing rights-protection-agent to: $targetDir" -ForegroundColor Cyan

if (Test-Path $targetDir) {
    Remove-Item -Recurse -Force $targetDir
}

New-Item -ItemType Directory -Force -Path $targetDir | Out-Null

$baseUrl = "https://raw.githubusercontent.com/JimmyWangJimmy/rights-protection-agent/main"

$files = @(
    "SKILL.md",
    "references/cases.md",
    "references/channels.md",
    "references/cross-border.md",
    "references/document-templates.md",
    "references/evidence.md",
    "references/excuses.md",
    "references/laws.md",
    "references/strategies.md"
)

New-Item -ItemType Directory -Force -Path "$targetDir\references" | Out-Null

foreach ($file in $files) {
    $remoteUrl = "$baseUrl/.agents/skills/rights-protection-agent/$file"
    $localPath = "$targetDir\$file"
    Write-Host "  -> Downloading $file..." -ForegroundColor Gray
    try {
        Invoke-WebRequest -Uri $remoteUrl -OutFile $localPath -UseBasicParsing
    } catch {
        Write-Warning "Failed to download $file"
    }
}

Write-Host "`nSuccessfully installed rights-protection-agent!" -ForegroundColor Green
Write-Host "You can now use it in Claude Code or your agent environment." -ForegroundColor Green
