param (
    # debug start
     [switch]$Debug,
    # debug end
    # Quick install
    [string]$i,
    [bool]$QuickInstall
)

# Load DLLs
Add-Type -AssemblyName 'System.Windows.Forms', 'PresentationFramework', 'PresentationCore', 'WindowsBase'

# Synchronized Hashtable for shared variables
$itt = [Hashtable]::Synchronized(@{
        database       = @{}
        ProcessRunning = $false
        lastupdate     = "#{replaceme}"
        registryPath   = "HKCU:\Software\ITT@emadadel"
        icon           = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"
        Theme          = "default"
        CurretTheme    = "default"
        Date           = (Get-Date -Format "MM/dd/yyy")
        Music          = 100
        PopupWindow    = "0"
        Language       = "default"
        ittDir         = "$env:ProgramData\itt\"
})

# Ask user for administrator privileges if not already running as admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $newProcess = Start-Process -FilePath "PowerShell" -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command `"$($MyInvocation.MyCommand.Definition)`"" -Verb RunAs
    exit
}

$itt.mediaPlayer = New-Object -ComObject WMPlayer.OCX
$Host.UI.RawUI.WindowTitle = "ITT - #StandWithPalestine"

# Create directory if it doesn't exist
$ittDir = $itt.ittDir
if (-not (Test-Path -Path $ittDir)) {
    New-Item -ItemType Directory -Path $ittDir -Force | Out-Null
}

# Trace the script
$logDir = Join-Path $ittDir 'logs'
$timestamp = Get-Date -Format "yyyy-MM-dd"
Start-Transcript -Path "$logDir\log_$timestamp.log" -Append -NoClobber *> $null