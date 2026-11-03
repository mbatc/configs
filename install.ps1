

Push-Location "$PSScriptRoot"

Write-Host "Install nvim config"
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim\init.lua" -Target "nvim\init.lua"

Write-Host "Install wezterm config"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.wezterm.lua" -Target "wezterm\.wezterm.lua"

Write-Host "Install powershell profile"

$ProfileDirectory = Split-Path -Path $PROFILE -Parent
New-Item -Path $ProfileDirectory -ItemType Directory -Force | Out-Null
New-Item -ItemType SymbolicLink -Path "$PROFILE" -Target "powershell\profile.ps1"

Pop-Location
