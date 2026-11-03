
function prompt {
    $p = $executionContext.SessionState.Path.CurrentLocation
    $osc7 = ""
    if ($p.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $p.ProviderPath -Replace "\\", "/"
        $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
    }
    "${osc7}PS $p$('>' * ($nestedPromptLevel + 1)) ";
}


function try-add-to-path {
  param(
    [string]$dir,
    [boolean]$IfExists = $True
  )

  if ($null -eq $dir) {
    return
  }

  if ($IfExists -and -not $(Test-Path $dir)) {
    Write-Verbose "Skipping path. Doesn't exist: $dir"
    return
  }

  Write-Verbose "Try add to path: $dir"

  if ($env:PATH -notlike "*$dir*;" -and -not ([string]$env:PATH).EndsWith($dir)) {
    Write-Verbose "Adding to path: $dir"
    $env:PATH = "$dir;$env:PATH"
  }
}

# Automatically find and append the latest MSBuild toolchain to the PATH
$vswhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
if (Test-Path $vswhere) {
  $msBuildExe = & $vswhere -latest -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe | Select-Object -First 1
  if ($msBuildExe) {
    try-add-to-path $(Split-Path $msBuildExe)
  }
}

try-add-to-path "$env:USERPROFILE\bin"
try-add-to-path "$env:PROGRAMFILES\LLVM\bin"

