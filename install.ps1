

Push-Location "$PSScriptRoot"
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim\init.lua" -Target "nvim\init.lua"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.wezterm.lua" -Target "wezterm\.wezterm.lua"
New-Item -ItemType SymbolicLink -Path "$PROFILE" -Target "powershell\profile.ps1"
Pop-Location