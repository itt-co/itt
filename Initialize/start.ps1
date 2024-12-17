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
    icon           = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"
    Theme          = "default"
    CurretTheme    = "default"
    Date           = (Get-Date -Format "MM/dd/yyy")
    Music          = "100"
    PopupWindow    = "On"
    Language       = "default"
    ittDir         = "$env:ProgramData\itt\"

})

# Ask user
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    $newProcess = Start-Process -FilePath "PowerShell" -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command `"$($MyInvocation.MyCommand.Definition)`"" -Verb RunAs
    exit
}

Write-Host "Starting..."

try {
    $itt.mediaPlayer = New-Object -ComObject WMPlayer.OCX
    $Host.UI.RawUI.WindowTitle = "ITT - #StandWithPalestine"
}
catch {
    Write-Warning "Media player not loaded because you're using Windows Lite or have disabled."
}

if (-not (Test-Path -Path $itt.ittDir)) {
    New-Item -ItemType Directory -Path $itt.ittDir -Force | Out-Null
}

# trace the script 
$logdir = $itt.ittDir
$timestamp = Get-Date -Format "yyyy-MM-dd"
Start-Transcript -Path "$logdir\logs\log_$timestamp.log" -Append -NoClobber | Out-Null
clear-host