param (
    [switch]$Debug
)


# Load DLLs
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

# Synchronized Hashtable for shared variables
$itt = [Hashtable]::Synchronized(@{
    database       = @{}
    ProcessRunning = $false
    developer      = "Emad Adel"
    lastupdate     = "#{replaceme}"
    github         = "https://github.com/emadadel4/itt"
    telegram       = "https://t.me/emadadel4"
    blog           = "https://emadadel4.github.io"
    youtube        = "https://youtube.com/@emadadel4"
    buymeacoffee   = "https://buymeacoffee.com/emadadel"
    registryPath   = "HKCU:\Software\ITT@emadadel"
    firebaseUrl    = "https://ittools-7d9fe-default-rtdb.firebaseio.com/Users"
    icon           = "https://raw.githubusercontent.com/emadadel4/ITT/main/Resourcesces/Icons/icon.ico"
    Theme          = "default"
    CurretTheme    = "default"
    Date           = (Get-Date -Format "MM/dd/yyy")
    Music          = "100"
    PopupWindow    = "On"
    Language       = "default"
    ittDir         = "$env:localappdata\itt\"

})

$currentPid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$principal = [System.Security.Principal.WindowsPrincipal]$currentPid
$administrator = [System.Security.Principal.WindowsBuiltInRole]::Administrator

if (-not $principal.IsInRole($administrator))
{
    $newProcess = Start-Process -FilePath "PowerShell" -ArgumentList $myInvocation.MyCommand.Definition -Verb "runas"
    exit
}

try {
    $itt.mediaPlayer = New-Object -ComObject WMPlayer.OCX
    $Host.UI.RawUI.WindowTitle = "ITT - #StandWithPalestine"
}
catch {
    Write-Warning "Media player not loaded because you're using Windows Lite or have disabled it."
}

if (-not (Test-Path -Path $itt.ittDir)) {
    New-Item -ItemType Directory -Path $itt.ittDir -Force | Out-Null
}

# trace the script 
$logdir = $itt.ittDir
$timestamp = Get-Date -Format "yyyy-MM-dd"
Start-Transcript -Path "$logdir\logs\log_$timestamp.log" -Append -NoClobber | Out-Null