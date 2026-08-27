<#
.SYNOPSIS
  Re-render cv.html to cv.pdf with headless Chrome.

.DESCRIPTION
  Run this from anywhere after editing cv.html:

      powershell -ExecutionPolicy Bypass -File .\make-cv-pdf.ps1

  Layout comes from the @media print block in cv.html (A4, 14/17 mm margins).
  Three details are not optional and are the usual reason a hand-typed command
  writes nothing at all:

    * --print-to-pdf needs an ABSOLUTE path. A relative one is silently dropped.
    * --user-data-dir must point somewhere writable, or Chrome exits doing nothing.
    * Chrome returns before the file is flushed, so we poll for it afterwards.
#>

$ErrorActionPreference = 'Stop'

$root = $PSScriptRoot
$src  = Join-Path $root 'cv.html'
$out  = Join-Path $root 'cv.pdf'
$prof = Join-Path $env:TEMP 'cv-pdf-chrome-profile'

if (-not (Test-Path $src)) { throw "cv.html not found next to this script ($src)" }

$chrome = @(
  "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
  "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe",
  "$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe",
  "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe",
  "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
) | Where-Object { Test-Path $_ } | Select-Object -First 1

if (-not $chrome) { throw 'No Chrome or Edge found. Edit the $chrome list in this script.' }

if (Test-Path $out) { Remove-Item $out -Force }

$url = 'file:///' + $src.Replace([char]92, '/')
Write-Host "rendering $url"
Write-Host "  with    $chrome"

& $chrome --headless=new --disable-gpu --no-pdf-header-footer `
  --user-data-dir="$prof" --virtual-time-budget=8000 `
  --print-to-pdf="$out" $url | Out-Null

# Chrome's exit does not mean the write finished.
$deadline = 30
while ($deadline -gt 0) {
  if ((Test-Path $out) -and ((Get-Item $out).Length -gt 0)) { break }
  Start-Sleep -Milliseconds 500
  $deadline--
}

if (-not (Test-Path $out)) { throw 'Chrome produced no PDF.' }
Write-Host ("wrote cv.pdf  {0:N0} bytes" -f (Get-Item $out).Length)
Write-Host 'Open it and check the page breaks before committing.'
