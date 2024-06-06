#!/bin/pwsh

param (
    [Parameter(Mandatory = $true)]
    [string]
    $Version
)

$root = $PSScriptRoot
$jellyfinApiModulePath = "$root/src/jellyfin/jellyfin" | Resolve-Path
$jellyfinWebModulePath = "$root/src/jellyfin-web/jellyfin-web" | Resolve-Path

Write-Host "Updating sub-modules to '$Version'."

try
{
    Push-Location $jellyfinApiModulePath
    git fetch --all
    git checkout $Version
}
finally
{
    Pop-Location
}

try
{
    Push-Location $jellyfinWebModulePath
    git fetch --all
    git checkout $Version
}
finally
{
    Pop-Location
}

Write-Host "Done!"
