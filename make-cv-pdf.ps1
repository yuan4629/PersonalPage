<#
.SYNOPSIS
  Re-render <name>.html to <name>.pdf with headless Chrome.

.PARAMETER Name
  Basename of the CV to render, without extension. Defaults to 'cv'.
  Pass another basename to render a local variant instead.

.DESCRIPTION
  Run this from anywhere after editing the HTML:

      powershell -ExecutionPolicy Bypass -File .\make-cv-pdf.ps1

  Layout comes from the @media print block in that file (A4, 14/17 mm margins).
  Three details are not optional and are the usual reason a hand-typed command
  writes nothing at all:

    * --print-to-pdf needs an ABSOLUTE path. A relative one is silently dropped.
    * --user-data-dir must point somewhere writable AND unlocked. A headless
      Chrome left over from an earlier run keeps the lock, and the next run then
      exits having done nothing -- so each run gets its own profile directory.
    * Chrome returns before the file is flushed, so we poll for it afterwards.
    * --do-not-de-elevate: from an elevated (admin) shell, Chrome relaunches
      itself de-elevated, and the relaunched copy never prints -- the run
      "succeeds" with no PDF and leaves a headless browser behind.

  The PDF is written to a temp file first and only replaces <name>.pdf on
  success, so a failed run keeps the old PDF.
#>

param([string]$Name = 'cv')

$ErrorActionPreference = 'Stop'

$root = $PSScriptRoot
$src  = Join-Path $root "$Name.html"
$out  = Join-Path $root "$Name.pdf"
$tmp  = Join-Path $env:TEMP ("cv-pdf-{0}.pdf" -f [guid]::NewGuid().ToString('N'))
$prof = Join-Path $env:TEMP ("cv-pdf-chrome-profile-{0}" -f [guid]::NewGuid().ToString('N'))

if (-not (Test-Path $src)) { throw "$Name.html not found next to this script ($src)" }

$chrome = @(
  "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
  "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe",
  "$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe",
  "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe",
  "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
) | Where-Object { Test-Path $_ } | Select-Object -First 1

if (-not $chrome) { throw 'No Chrome or Edge found. Edit the $chrome list in this script.' }

$url = 'file:///' + $src.Replace([char]92, '/')
Write-Host "rendering $url"
Write-Host "  with    $chrome"

& $chrome --headless=new --disable-gpu --no-pdf-header-footer --do-not-de-elevate `
  --user-data-dir="$prof" --virtual-time-budget=8000 `
  --print-to-pdf="$tmp" $url | Out-Null

# Chrome's exit does not mean the write finished.
$deadline = 30
while ($deadline -gt 0) {
  if ((Test-Path $tmp) -and ((Get-Item $tmp).Length -gt 0)) { break }
  Start-Sleep -Milliseconds 500
  $deadline--
}

try { Remove-Item $prof -Recurse -Force -ErrorAction Stop } catch {}

if (-not ((Test-Path $tmp) -and ((Get-Item $tmp).Length -gt 0))) {
  throw "Chrome produced no PDF; $Name.pdf left unchanged."
}
Move-Item $tmp $out -Force
Write-Host ("wrote $Name.pdf  {0:N0} bytes" -f (Get-Item $out).Length)
Write-Host 'Open it and check the page breaks before committing.'
