

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

$MsbExtractor = "$UserBin\msbuild-extractor.exe"
$LuaLangServer = "$UserBin\lua-language-server"

# Fetch lua language server
if (-not $(Test-Path $LuaLangServer)) {
  Invoke-WebRequest `
    -Uri "https://github.com/LuaLS/lua-language-server/releases/download/3.19.2/lua-language-server-3.19.2-win32-x64.zip" `
    -OutFile "$UserBin\lua-language-server.zip"
  Expand-Archive -Path "$UserBin\lua-language-server.zip" -DestinationPath "$LuaLangServer"
}

# Fetch Msbuild extractor
if (-not $(Test-Path $MsbExtractor)) {
  Invoke-WebRequest `
    -Uri "https://github.com/microsoft/msbuild-extractor-sample/releases/download/v0.3.0/msbuild-extractor-sample.exe" `
    -OutFile "$UserBin\msbuild-extractor.exe"
}

# Install llvm
winget install -e --id LLVM.LLVM

# Neovim config dependencies
winget install sharkdp.fd


Pop-Location
