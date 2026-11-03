
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


# Automatically find and append the latest MSBuild toolchain to the PATH
$vswhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
if (Test-Path $vswhere) {
    $msBuildExe = & $vswhere -latest -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe | Select-Object -First 1
    if ($msBuildExe) {
        $msBuildDir = Split-Path $msBuildExe
        # Append only if it isn't already in the PATH to avoid duplicates
        if ($env:PATH -notlike "*$msBuildDir*") {
            $env:PATH = "$msBuildDir;$env:PATH"
        }
    }
}

