######################################################################################
#      ___ _____ _____   _____ __  __    _    ____       _    ____  _____ _          #
#     |_ _|_   _|_   _| | ____|  \/  |  / \  |  _ \     / \  |  _ \| ____| |         #
#      | |  | |   | |   |  _| | |\/| | / _ \ | | | |   / _ \ | | | |  _| | |         #
#      | |  | |   | |   | |___| |  | |/ ___ \| |_| |  / ___ \| |_| | |___| |___      #
#     |___| |_|   |_|   |_____|_|  |_/_/   \_\____/  /_/   \_\____/|_____|_____|     #
#                Automatically generated from build don't play here :)               # 
#                              #StandWithPalestine                                   #
# https://github.com/emadadel4                                                       #
# https://t.me/emadadel4                                                             #
# https://emadadel4.github.io/posts/itt                                              #
######################################################################################
#===========================================================================
#region Begin Start
#===========================================================================
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
    lastupdate     = "12/09/2024"
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
#===========================================================================
#endregion End Start
#===========================================================================
#===========================================================================
#region Begin Database /APPS/TWEEAKS/Quotes/OST/Settings
#===========================================================================
$itt.database.Applications = @'
[
  {
    "Name": "Mozilla Firefox",
    "Description": "A widely-used open-source web browser known for its speed, privacy features, and customization options",
    "winget": "Mozilla.Firefox",
    "choco": "firefox",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Mozilla Firefox ESR",
    "Description": "A widely-used open-source web browser known for its speed, privacy features, and customization options",
    "winget": "Mozilla.Firefox.ESR",
    "choco": "firefoxesr",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Thorium SSE3",
    "Description": "A web browser designed for smooth and secure browsing experiences",
    "winget": "Alex313031.Thorium",
    "choco": "thorium --params /SSE3",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Thorium AVX",
    "Description": "A web browser designed for smooth and secure browsing experiences",
    "winget": "Alex313031.Thorium.AVX2",
    "choco": "thorium --params /AVX",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Microsoft Edge",
    "Description": "Microsoft's web browser built for fast and secure internet surfing, integrating seamlessly with Windows ecosystem",
    "winget": "Microsoft.Edge",
    "choco": "microsoft-edge",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Google Chrome",
    "Description": "A popular web browser known for its speed, simplicity, and vast ecosystem of extensions",
    "winget": "Google.Chrome",
    "choco": "googlechrome",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Chromium",
    "Description": "An open-source web browser project that serves as the foundation for many browsers, including Google Chrome",
    "winget": "eloston.ungoogled-chromium",
    "choco": "chromium",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Brave",
    "Description": "A privacy-focused web browser that blocks ads and trackers, offering faster and safer browsing experiences",
    "winget": "Brave.Brave",
    "choco": "brave",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Tor Browser",
    "Description": "A web browser that prioritizes user privacy by routing internet traffic through a global network of servers, enabling anonymous browsing",
    "winget": "TorProject.TorBrowser",
    "choco": "tor-browser",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Opera",
    "Description": "The Opera web browser makes the Web fast and fun, giving you a better web browser experience on any computer",
    "winget": "Opera.Opera",
    "choco": "opera",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Internet Download Manager",
    "Description": "A popular download manager tool that accelerates downloads and allows users to organize and schedule downloads efficiently",
    "winget": "Tonec.InternetDownloadManager",
    "choco": "internet-download-manager",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "JDownloader",
    "Description": "JDownloader is an internet download manager",
    "winget": "AppWork.JDownloader",
    "choco": "jdownloader",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "KLite Mega Codec Full Pack",
    "Description": "Comprehensive collection of audio and video codecs, filters, and tools, enabling playback of various media formats",
    "winget": "none",
    "choco": "k-litecodecpackfull",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "PotPlayer",
    "Description": "A multimedia player with a sleek interface and advanced features, supporting a wide range of audio and video formats",
    "winget": "Daum.PotPlayer",
    "choco": "potplayer",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "VLC",
    "Description": "A versatile media player capable of playing almost any multimedia file format, with support for various streaming protocols",
    "winget": "VideoLAN.VLC",
    "choco": "vlc.install",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Kodi",
    "Description": "A powerful open-source media center software that allows users to organize and stream their media collections",
    "winget": "9NBLGGH4T892",
    "choco": "kodi",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Jellyfin Server",
    "Description": "An open-source media server software that enables users to stream their media libraries across devices, providing a self-hosted alternative to commercial services",
    "winget": "Jellyfin.Server",
    "choco": "jellyfin",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Winamp",
    "Description": "A classic media player known for its customizable interface and extensive plugin support, providing a nostalgic music playback experience",
    "winget": "Winamp.Winamp",
    "choco": "winamp",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Aimp",
    "Description": "A lightweight and feature-rich audio player with support for various audio formats and customizable interface themes",
    "winget": "AIMP.AIMP",
    "choco": "aimp",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Spotify",
    "Description": "Spotify is a new way to listen to music",
    "winget": "Spotify.Spotify",
    "choco": "spotify",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "FastStone Image Viewer",
    "Description": "FastStone Image Viewer is a fast, stable, user-friendly image browser, converter and editor",
    "winget": "FastStone.Viewer",
    "choco": "fsviewer",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "OpenOffice",
    "Description": "An open-source office productivity suite offering word processing, spreadsheet, presentation, and other office tools, compatible with Microsoft Office formats",
    "winget": "Apache.OpenOffice",
    "choco": "openoffice",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "FoxitReader",
    "Description": "A lightweight and feature-rich PDF reader with annotation, form filling, and document signing capabilities",
    "winget": "Foxit.FoxitReader",
    "choco": "foxitreader",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "LibreOffice",
    "Description": "A powerful open-source office suite providing word processing, spreadsheet, presentation, and other office tools, compatible with Microsoft Office formats",
    "winget": "Foxit.FoxitReader",
    "choco": "libreoffice-fresh",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "SumatraPDF",
    "Description": "A lightweight and fast PDF reader with minimalistic design and focus on simplicity and speed",
    "winget": "SumatraPDF.SumatraPDF",
    "choco": "sumatrapdf.install",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "WinRAR",
    "Description": "A popular file compression and archiving utility that supports various archive formats and offers advanced features such as encryption and self-extracting archives",
    "winget": "RARLab.WinRAR",
    "choco": "winrar",
    "default": [],
    "category": "Compression",
    "check": "false"
  },
  {
    "Name": "7Zip",
    "Description": "An open-source file archiver with a high compression ratio, supporting various archive formats and providing a powerful command-line interface",
    "winget": "7zip.7zip",
    "choco": "7zip",
    "default": [],
    "category": "Compression",
    "check": "false"
  },
  {
    "Name": "PeaZip",
    "Description": " PeaZip is a free cross-platform file archiver",
    "winget": "Giorgiotani.Peazip",
    "choco": "peazip",
    "default": [],
    "category": "Compression",
    "check": "false"
  },
  {
    "Name": "Telegram Desktop",
    "Description": "A cross-platform messaging app with a focus on speed and security, offering end-to-end encryption and a wide range of features such as group chats, file sharing, and stickers",
    "winget": "Telegram.TelegramDesktop",
    "choco": "telegram",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Signal",
    "Description": "Fast, simple, secure. Privacy that fits in your pocket",
    "winget": "OpenWhisperSystems.Signal",
    "choco": "signal",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Meta Messenger",
    "Description": "A messaging app that allows users to connect with friends and family through text messages, voice calls, and video calls, offering various multimedia sharing features",
    "winget": "9WZDNCRF0083",
    "choco": "messenger",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Zoom",
    "Description": "A video conferencing app that facilitates online meetings, webinars, and virtual events, allowing participants to interact through video, audio, and chat",
    "winget": "Zoom.ZoomRooms",
    "choco": "zoom",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Microsoft Teams",
    "Description": "A collaboration platform that combines workplace chat, video meetings, file storage, and application integration, enhancing teamwork and productivity within organizations",
    "winget": "Microsoft.Teams",
    "choco": "microsoft-teams.install",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Discord",
    "Description": "A VoIP application and digital distribution platform designed for creating communities and connecting gamers, providing text, voice, and video communication features",
    "winget": "Discord.Discord",
    "choco": "discord.install",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "TeamViewer",
    "Description": "A remote access and support software that enables users to remotely control computers, transfer files, and collaborate online, facilitating remote work and IT support",
    "winget": "TeamViewer.TeamViewer",
    "choco": "teamviewer",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "GIMP",
    "Description": "A free and open-source raster graphics editor used for image retouching and editing, drawing and painting, and converting between different image formats",
    "winget": "GIMP.GIMP",
    "choco": "gimp",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ Runtime - all versions",
    "Description": "Microsoft Visual C++ Redistributable installs run-time components of Visual C++ libraries. These components are required to run C++ applications that are developed using Visual Studio and link dynamically to Visual C++ libraries",
    "winget": "none",
    "choco": "vcredist-all",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "DirectX",
    "Description": "DirectX is a collection of APIs for handling tasks related to games and videos.",
    "winget": "Microsoft.DirectX",
    "choco": "directx",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2005 (x86) Redistributable",
    "Description": "A set of runtime components required to run applications developed with Microsoft Visual C++ 2005, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2005",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2005 (x64) Redistributable",
    "Description": "A set of runtime components required to run 64-bit applications developed with Microsoft Visual C++ 2005, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2005",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2008 (x86) Redistributable",
    "Description": "A set of runtime components required to run applications developed with Microsoft Visual C++ 2008, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2008",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2008 (x64) Redistributable",
    "Description": "A set of runtime components required to run 64-bit applications developed with Microsoft Visual C++ 2008, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2008",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2010 (x86) Redistributable",
    "Description": "A set of runtime components required to run applications developed with Microsoft Visual C++ 2010, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2010",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2010 (x64) Redistributable",
    "Description": "A set of runtime components required to run 64-bit applications developed with Microsoft Visual C++ 2010, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2010",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2012 (x86) Redistributable",
    "Description": "A set of runtime components required to run applications developed with Microsoft Visual C++ 2012, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2012",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2012 (x64) Redistributable",
    "Description": "A set of runtime components required to run 64-bit applications developed with Microsoft Visual C++ 2012, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2012",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2013 (x86) Redistributable",
    "Description": "A set of runtime components required to run applications developed with Microsoft Visual C++ 2013, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2013",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2013 (x64) Redistributable",
    "Description": "A set of runtime components required to run 64-bit applications developed with Microsoft Visual C++ 2013, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2013",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2015-2022 (x64) Redistributable",
    "Description": "A set of runtime components required to run 64-bit applications developed with Microsoft Visual C++ 2015-2022, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2015",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2015-2022  (x86) Redistributable",
    "Description": "A set of runtime components required to run applications developed with Microsoft Visual C++ 2015-2022, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2015",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "NET Framework All Versions",
    "Description": "A comprehensive and consistent programming model for building applications that have visually stunning user experiences, seamless and secure communication, and the ability to model a range of business processes",
    "winget": "none",
    "choco": "dotnet-all",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "AMD Ryzen Chipset Drivers",
    "Description": "Supports: AMD Ryzen Threadripper PRO Processor, AMD Ryzen 8000/7040/7000 Series Desktop & Mobile Processors, AMD Ryzen 5000/3rd Gen/2nd Gen Desktop & Threadripper Processors, AMD Ryzen Desktop Processor with Radeon Graphics & Mobile Processor with Radeon Graphics, 7th-Gen AMD A-Series Processors, AMD X670E/X670/B650E/B650/B350/A320/X370/X399/B450/X470/X570/B550/A520/A620/TRX40/TRX50/WRX80/WRX90 Chipsets",
    "winget": "none",
    "choco": "amd-ryzen-chipset",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "NVidia Display Driver",
    "Description": "The software component that allows the operating system and installed software to communicate with and control the NVIDIA graphics processing unit (GPU)",
    "winget": "none",
    "choco": "nvidia-display-driver",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "NVIDIA GeForce Experience",
    "Description": "A cloud-based gaming service provided by NVIDIA that allows users to play video games on supported devices via a remote gaming PC hosted on NVIDIA's servers",
    "winget": "Nvidia.GeForceExperience",
    "choco": "geforce-experience",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Msi Afterburner",
    "Description": "MSI Afterburner is the ultimate graphics card utility, co-developed by MSI and RivaTuner teams",
    "winget": "Guru3D.Afterburner",
    "choco": "msiafterburner",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "NVIDIA PhysX",
    "Description": "A physics processing unit (PPU) software development kit (SDK) offered by NVIDIA for real-time physics simulations in video games",
    "winget": "Nvidia.PhysXLegacy",
    "choco": "physx.legacy",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Steam",
    "Description": "A digital distribution platform developed by Valve Corporation for purchasing and playing video games",
    "winget": "Valve.Steam",
    "choco": "steam",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Ubisoft Connect",
    "Description": "A digital distribution, digital rights management, multiplayer, and communications service developed by Ubisoft, providing access to Ubisoft's games, rewards, and social features",
    "winget": "Ubisoft.Connect",
    "choco": "ubisoft-connect",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Origin",
    "Description": " Game store launcher",
    "winget": "ElectronicArts.Origin",
    "choco": "origin",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Rockstar Games Launcher",
    "Description": "Download and play the latest Rockstar Games PC titles",
    "winget": "none",
    "choco": "rockstar-launcher",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "GameSave Manager",
    "Description": "A utility tool that allows users to backup, restore, and transfer their game saves between different gaming platforms and directories",
    "winget": "InsaneMatt.GameSaveManager",
    "choco": "gamesavemanager",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "StreamlabsOBS",
    "Description": "A free and open-source streaming software built on top of OBS Studio with additional features tailored for streamers, such as built-in alerts, overlays, and chat integration",
    "winget": "Streamlabs.StreamlabsOBS",
    "choco": "streamlabs-obs",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "OBS Studio",
    "Description": "A free and open-source software for video recording and live streaming. It offers high performance real-time video/audio capturing and mixing",
    "winget": "OBSProject.OBSStudio",
    "choco": "obs-studio.install",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Logitech Gaming Software",
    "Description": "Logitech Gaming Software lets you customize Logitech G gaming mice, keyboards, headsets and select wheels",
    "winget": "Logitech.LGS",
    "choco": "logitechgaming",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Lively Wallpaper",
    "Description": "A software that allows users to set animated and interactive wallpapers on their Windows desktop, providing various customization options",
    "winget": "rocksdanister.LivelyWallpaper",
    "choco": "lively",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Playnite",
    "Description": "Open source video game library manager and launcher with support for 3rd party libraries like Steam, GOG, Origin, Battle.net and Uplay",
    "winget": "Playnite.Playnite",
    "choco": "playnite",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Driver Easy",
    "Description": "A driver update tool that automatically detects, downloads, and installs device drivers for the user's computer hardware",
    "winget": "Easeware.DriverEasy",
    "choco": "drivereasyfree",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Intel Graphics Windows DCH",
    "Description": "Intel Graphics Driver for Windows 10",
    "winget": "none",
    "choco": "intel-graphics-driver",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Intel Driver Support Assistant",
    "Description": "Intel Driver & Support Assistant enables you to scan computing devices for the latest drivers available from Intel",
    "winget": "Intel.IntelDriverAndSupportAssistant",
    "choco": "intel-dsa",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Intel Network Adapter",
    "Description": "Intel Network Adapter Drivers for Windows 10",
    "winget": "Intel.WiFiDrivers",
    "choco": "intel-network-drivers-win10",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Snappy Driver Installer",
    "Description": "A free and open-source tool for updating and installing device drivers on Windows, offering offline driver updates and wide hardware support",
    "winget": "samlab-ws.SnappyDriverInstaller",
    "choco": "sdio",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Driver booster",
    "Description": "Scans and identifies outdated drivers automatically, and downloads and installs the right update for you with just ONE click",
    "winget": "IObit.DriverBooster",
    "choco": "driverbooster",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Driver Genius",
    "Description": "Professional driver management tool and hardware diagnostics",
    "winget": "none",
    "choco": "drivergenius",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Display Driver Uninstaller",
    "Description": "Utility to completely remove system drivers",
    "winget": "Wagnardsoft.DisplayDriverUninstaller",
    "choco": "ddu",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Driver Store Explorer",
    "Description": " Windows driver store utility",
    "winget": "none",
    "choco": "rapr",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "1Password",
    "Description": "A password manager that securely stores login credentials, credit card information, and other sensitive data in an encrypted vault, accessible with a single master password",
    "winget": "AgileBits.1Password",
    "choco": "1password",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "AOMEI Partition Assistant Standard",
    "Description": "AOMEI Partition Assistant Standard allows you to realize disk upgrade/replacement, partition style conversion, OS migration and other disk managements without any difficulties",
    "winget": "AOMEI.PartitionAssistant",
    "choco": "partition-assistant-standard",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "AOMEI Backupper Standard",
    "Description": "A backup and recovery software that enables users to create system backups, disk backups, partition backups, and file backups to protect data against system failures and data loss",
    "winget": "AOMEI.Backupper.Standard",
    "choco": "backupper-standard",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "Recuva recover",
    "Description": "A data recovery software that helps users retrieve accidentally deleted files, including photos, documents, videos, and more, from various storage devices such as hard drives, USB drives, and memory cards",
    "winget": "Piriform.Recuva",
    "choco": "recuva",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "CCleaner",
    "Description": "A system optimization, privacy, and cleaning tool that helps users remove unused files, clean up temporary files, and optimize their Windows PCs for better performance",
    "winget": "SingularLabs.CCEnhancer",
    "choco": "ccleaner",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "BCUninstaller",
    "Description": "A powerful uninstaller tool for Windows that allows users to remove unwanted programs, plugins, and Windows Store apps, along with leftover files and registry entries",
    "winget": "Klocman.BulkCrapUninstaller",
    "choco": "bulk-crap-uninstaller",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Easy Context Menu",
    "Description": "To install Easy Context Menu, run the following command from the command line or from PowerShell:",
    "winget": "none",
    "choco": "ecm",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "HWiNFO",
    "Description": "A hardware information and diagnostic tool that provides detailed information about the hardware components of a computer system, including sensors, temperature, voltage, and more",
    "winget": "REALiX.HWiNFO",
    "choco": "hwinfo.install",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Speccy",
    "Description": "A system information tool that provides detailed information about the hardware and operating system of a computer, including CPU, RAM, motherboard, graphics card, and storage devices",
    "winget": "Piriform.Speccy",
    "choco": "speccy",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "FurMark",
    "Description": "A graphics card stress testing and benchmarking utility that helps users test the stability, cooling, and performance of their GPU by rendering a highly intensive 3D graphics scene",
    "winget": "Geeks3D.FurMark",
    "choco": "furmark",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Hard Disk Sentinel",
    "Description": "A hard disk monitoring and analysis software that helps users monitor the health, performance, and temperature of their hard drives, SSDs, and other storage devices",
    "winget": "JanosMathe.HardDiskSentinelPro",
    "choco": "hdsentinel",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "CPU-Z",
    "Description": "A system monitoring utility that provides detailed information about the CPU, motherboard, memory, and other hardware components of a computer system",
    "winget": "CPUID.CPU-Z",
    "choco": "cpu-z",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Mem Reduct",
    "Description": "Lightweight real-time memory management application to monitor and clean system memory on your computer",
    "winget": "Henry++.MemReduct",
    "choco": "memreduct",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "HandBrake",
    "Description": "A free and open-source video transcoder tool that converts video files from one format to another, supporting a wide range of input and output formats",
    "winget": "HandBrake.HandBrake",
    "choco": "handbrake.install",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Rufus Portable",
    "Description": "A utility tool for creating bootable USB drives from ISO images, helping users to install or run operating systems, such as Windows, Linux, or other utilities",
    "winget": "Rufus.Rufus",
    "choco": "rufus",
    "default": [],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "ImgBurn",
    "Description": "Lightweight CD / DVD burning application",
    "winget": "LIGHTNINGUK.ImgBurn",
    "choco": "imgburn",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Virtual CloneDrive",
    "Description": "A free software that allows users to mount disc images as virtual drives, enabling them to access the content of ISO, BIN, and CCD files without the need for physical discs",
    "winget": "none",
    "choco": "virtualclonedrive",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Ultra ISO",
    "Description": "A powerful ISO image management tool that enables users to create, edit, extract, and burn ISO files, providing a comprehensive solution for managing disk image files",
    "winget": "EZBSystems.UltraISO",
    "choco": "ultraiso",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Ventoy",
    "Description": "An open-source tool for creating bootable USB drives with multiple ISO files, allowing users to boot various operating systems or utilities directly from a single USB drive",
    "winget": "Ventoy.Ventoy",
    "choco": "ventoy",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "iVentoy",
    "Description": "With iVentoy you can boot and install OS on multiple machines at the same time through the network",
    "winget": "none",
    "choco": "iventoy",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "AutoHotkey",
    "Description": "A scripting language for automating repetitive tasks and creating macros on Windows, allowing users to customize keyboard shortcuts, remap keys, and automate mouse actions",
    "winget": "AutoHotkey.AutoHotkey",
    "choco": "autohotkey",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Rainmeter",
    "Description": "A customizable desktop customization tool that displays customizable skins, widgets, and applets on the Windows desktop, providing users with real-time system monitoring and information",
    "winget": "Rainmeter.Rainmeter",
    "choco": "rainmeter",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "FxSound",
    "Description": "An audio enhancer software that improves the sound quality of music, videos, and games on Windows PCs by providing advanced audio processing and customization options",
    "winget": "FxSoundLLC.FxSound",
    "choco": "fxsound",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Vysor",
    "Description": "A screen mirroring and remote control software that enables users to view and control Android devices from Windows PCs, allowing for easy screen sharing, app testing, and troubleshooting",
    "winget": "Vysor.Vysor",
    "choco": "vysor",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Unified Remote",
    "Description": "A remote control app that turns smartphones into universal remote controls for Windows, macOS, and Linux computers, allowing users to control media playback, presentations, and more",
    "winget": "UnifiedIntents.UnifiedRemote",
    "choco": "unifiedremote",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "AnyDesk",
    "Description": "A remote desktop software that allows users to access and control Windows, macOS, Linux, Android, and iOS devices from anywhere, providing secure and reliable remote access",
    "winget": "AnyDeskSoftwareGmbH.AnyDesk",
    "choco": "anydesk",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Airdroid",
    "Description": "AirDroid is a free and fast Android device manager app that allows you to access Android phone/tablet from computer remotely and securely. Manage SMS, files, photos and videos, WhatsApp, Line, WeChat and more on computer",
    "winget": "AirDroid.AirDroid",
    "choco": "airdroid",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "UltraViewer",
    "Description": "Remote control to support your clients / partners from everywhere",
    "winget": "DucFabulous.UltraViewer",
    "choco": "ultraviewer",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Wireless Network Watcher Portable",
    "Description": "Wireless Network Watcher is a small utility that scans your wireless network and displays the list of all computers and devices that are currently connected to your network",
    "winget": "NirSoft.WirelessNetworkWatcher",
    "choco": "wnetwatcher.portable",
    "default": [],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "WifiInfoView",
    "Description": "Wireless Network Watcher is a small utility that scans your wireless network and displays the list of all computers and devices that are currently connected to your network",
    "winget": "NirSoft.WifiInfoView",
    "choco": "wifiinfoview",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "qBittorrent",
    "Description": "A free and open-source BitTorrent client for downloading and uploading files via the BitTorrent protocol, providing users with a lightweight and feature-rich torrenting experience",
    "winget": "qBittorrent.qBittorrent",
    "choco": "qbittorrent",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Google Earth Pro",
    "Description": "Google Earth Pro on desktop is free for users with advanced feature needs. Import and export GIS data, and go back in time with historical imagery",
    "winget": "Google.EarthPro",
    "choco": "googleearthpro",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "XAMPP",
    "Description": "XAMPP is a free and open-source cross-platform web server solution stack package developed by Apache Friends, consisting mainly of the Apache HTTP Server, MariaDB database, and interpreters for scripts written in the PHP and Perl programming languages",
    "winget": "ApacheFriends.Xampp.8.2",
    "choco": "xampp-81",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Visual Studio Professional 2022",
    "Description": "Visual Studio Professional 2022 is an integrated development environment (IDE) from Microsoft. It is used to develop computer programs, websites, web apps, web services, and mobile apps",
    "winget": "Microsoft.VisualStudio.2022.Professional",
    "choco": "visualstudio2022professional",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Visual Studio Community 2022",
    "Description": "Visual Studio Community 2022 is a free, fully-featured, and extensible IDE for individual developers, open source projects, academic research, education, and small professional teams",
    "winget": "Microsoft.VisualStudio.2022.Community",
    "choco": "visualstudio2022community",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Unity Hub",
    "Description": "Unity is a cross-platform game creation system developed by Unity Technologies and used to develop video games for PC, consoles, mobile",
    "winget": "Unity.UnityHub",
    "choco": "unity-hub",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Godot Engine",
    "Description": "Godot is a feature-packed, cross-platform game engine for creating 2D and 3D games. It provides a comprehensive set of tools and features to develop games efficiently and quickly",
    "winget": "GodotEngine.GodotEngine",
    "choco": "godot",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Unity3D Engine",
    "Description": "Unity is a cross-platform game creation system developed by Unity Technologies and used to develop video games for PC, consoles, mobile",
    "winget": "Unity.Unity.2020",
    "choco": "unity",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Blender",
    "Description": "Blender is a free and open-source professional-grade 3D computer graphics and video compositing program",
    "winget": "BlenderFoundation.Blender",
    "choco": "blender",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "VSCode",
    "Description": "Visual Studio Code is a free source-code editor developed by Microsoft for Windows, Linux, and macOS. It includes support for debugging, embedded Git control, syntax highlighting, intelligent code completion, snippets, and code refactoring",
    "winget": "Microsoft.VisualStudioCode",
    "choco": "vscode",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Vim",
    "Description": "Vim is an advanced text editor that seeks to provide the power of the de-facto Unix editor 'Vi', with a more complete feature set. It's us... Keep Reading",
    "winget": "vim.vim",
    "choco": "vim",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Sublime Text 4",
    "Description": "Sublime Text 4 - The sophisticated text editor for code, markup and prose",
    "winget": "SublimeHQ.SublimeText.4",
    "choco": "sublimetext4",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Atom",
    "Description": "Atom is a text editor that's modern, approachable, yet hackable to the core—a tool you can customize to do anything but also use productively without ever touching a config file",
    "winget": "GitHub.Atom",
    "choco": "atom",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "InnoSetup",
    "Description": "Inno Setup is a free installer for Windows programs. First introduced in 1997, Inno Setup today rivals and even surpasses many commercial installers in feature set and stability",
    "winget": "JRSoftware.InnoSetup",
    "choco": "innosetup",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "PyCharm Community Edition",
    "Description": "PyCharm Community Edition is a free and open-source IDE for Python development. It provides smart code completion, code inspections, on-the-fly error highlighting, and quick-fixes",
    "winget": "JetBrains.PyCharm.Community",
    "choco": "pycharm-community",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "PyCharm Professional Edition",
    "Description": "PyCharm Professional Edition is a powerful IDE for professional Python development. It includes advanced features such as database tools, web development support, and scientific tools integration",
    "winget": "JetBrains.PyCharm.Professional",
    "choco": "pycharm",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Jetbrains Rider",
    "Description": "Rider is a cross-platform .NET IDE developed by JetBrains. It supports C#, VB.NET, F#, ASP.NET, JavaScript, TypeScript, HTML, CSS, and SQL languages and frameworks",
    "winget": "JetBrains.Rider",
    "choco": "jetbrains-rider",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Node.js LTS",
    "Description": "Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine. LTS (Long Term Support) releases are supported for an extended period and provide stability for production environments",
    "winget": "OpenJS.NodeJS.LTS",
    "choco": "nodejs-lts",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Electrum-LTS",
    "Description": "Electrum is a lightweight Bitcoin wallet focused on speed and simplicity, with support for hardware wallets and multisig functionality. LTS (Long Term Support) releases provide stability and security updates for an extended period",
    "winget": "Electrum.Electrum",
    "choco": "electronim",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Hugo",
    "Description": "Hugo is one of the most popular open-source static site generators. With its amazing speed and flexibility, Hugo makes building websites f... Keep Reading",
    "winget": "Hugo.Hugo",
    "choco": "hugo",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Hugo Extended",
    "Description": "Hugo is one of the most popular open-source static site generators. With its amazing speed and flexibility, Hugo makes building websites f... Keep Reading",
    "winget": "Hugo.Hugo.Extended",
    "choco": "hugo-extended",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Notepad++",
    "Description": "Notepad++ is a free source code editor and Notepad replacement that supports several languages. It offers syntax highlighting, code folding, auto-completion, and other features for efficient code editing",
    "winget": "Notepad++.Notepad++",
    "choco": "notepadplusplus",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Windows Terminal",
    "Description": "Windows Terminal is a modern terminal application for users of command-line tools and shells like Command Prompt, PowerShell, and Windows Subsystem for Linux (WSL). It provides multiple tabs, custom themes, and GPU-accelerated text rendering",
    "winget": "Microsoft.WindowsTerminal",
    "choco": "microsoft-windows-terminal",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Powershell 7",
    "Description": "PowerShell Core is a cross-platform (Windows, Linux, and macOS) automation and configuration tool/framework that works well with your existing tools and is optimized for dealing with structured data (e.g., JSON, CSV, XML, etc.), REST APIs, and object models",
    "winget": "Microsoft.PowerShell",
    "choco": "powershell-core",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "x64dbg Portable",
    "Description": "An open-source x64/x32 debugger for windows",
    "winget": "none",
    "choco": "x64dbg.portable",
    "default": [],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "dnSpy",
    "Description": "dnSpy is a tool to reverse engineer .NET assemblies. It includes a decompiler, a debugger and an assembly editor (and more) and can be easily extended by writing your own extension. It uses dnlib to read and write assemblies so it can handle obfuscated assemblies (eg. malware) without crashing",
    "winget": "dnSpyEx.dnSpy",
    "choco": "dnspy",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Cheat Engine",
    "Description": "Cheat Engine is an open source tool designed to help you modify single player games",
    "winget": "none",
    "choco": "cheatengine",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Python 3.12.6",
    "Description": "Python is a popular high-level programming language known for its simplicity and versatility. It is used in various fields such as web development, data science, machine learning, and automation",
    "winget": "Python.Python.3.9",
    "choco": "python",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Git",
    "Description": "Git is a free and open-source distributed version control system designed to handle everything from small to very large projects with speed and efficiency",
    "winget": "Git.Git",
    "choco": "git",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "GitHub Desktop",
    "Description": "GitHub Desktop is a seamless way to contribute to projects on GitHub and GitHub Enterprise. It provides an intuitive interface for managing repositories, branching, committing, and merging code changes",
    "winget": "GitHub.GitHubDesktop",
    "choco": "github-desktop",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Docker Desktop",
    "Description": "Docker Desktop is an easy-to-install application for Windows and macOS that enables developers to build, share, and run containerized applications and microservices locally",
    "winget": "Docker.DockerDesktop",
    "choco": "docker-desktop",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Docker Compose",
    "Description": "Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to use a YAML file to configure your application's services, networks, and volumes",
    "winget": "Docker.DockerCompose",
    "choco": "docker-compose",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "PowerToys",
    "Description": "PowerToys is a set of utilities for power users to tune and streamline their Windows experience for greater productivity. It includes tools like FancyZones for window management, PowerRename for batch renaming files, and more",
    "winget": "Microsoft.PowerToys",
    "choco": "powertoys",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Notion",
    "Description": "The all-in-one workspace for your notes, tasks, wikis, and databases",
    "winget": "Notion.Notion",
    "choco": "notion",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "FL Studio",
    "Description": "FL Studio is a digital audio workstation (DAW) developed by Image-Line. It allows you to compose, arrange, record, edit, mix, and master professional-quality music",
    "winget": "ImageLine.FLStudio",
    "choco": "ImageLine.FLStudio",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Android Debug Bridge",
    "Description": "Android Debug Bridge (ADB) is a command-line tool that allows you to communicate with an Android device. It is used for various debugging tasks such as installing and debugging apps",
    "winget": "none",
    "choco": "adb",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Universal ADB Drivers",
    "Description": "Universal ADB Drivers are drivers that provide compatibility with a wide range of Android devices for debugging purposes. They allow you to connect your Android device to a computer and use ADB commands",
    "winget": "none",
    "choco": "universal-adb-drivers",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Scrcpy",
    "Description": "Scrcpy is a free and open-source tool that allows you to display and control your Android device from a computer. It provides high-performance screen mirroring and supports various input methods",
    "winget": "Genymobile.scrcpy",
    "choco": "scrcpy",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "VirtualBox",
    "Description": "VirtualBox is a cross-platform virtualization application. It installs on existing Intel or AMD-based computers, whether they are running Windows, Mac, Linux or Solaris operating systems. It extends the capabilities of your existing computer so that it can run multiple operating systems (inside multiple virtual machines) at the same time",
    "winget": "Oracle.VirtualBox",
    "choco": "virtualbox",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Oh My Posh",
    "Description": " Oh my Posh is a custom prompt engine for any shell that has the ability to adjust the prompt string with a function or variable",
    "winget": "JanDeDobbeleer.OhMyPosh",
    "choco": "oh-my-posh",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Malwarebytes",
    "Description": "Multiple layers of malware-crushing tech, including virus protection. Thorough malware and spyware removal. Specialized ransomware protection",
    "winget": "Malwarebytes.Malwarebytes",
    "choco": "malwarebytes",
    "default": [],
    "category": "Security",
    "check": "false"
  },
  {
    "Name": "Avast Free Antivirus",
    "Description": "Avast Free Antivirus",
    "winget": "XPDNZJFNCR1B07",
    "choco": "avastfreeantivirus",
    "default": [],
    "category": "Security",
    "check": "false"
  },
  {
    "Name": "Nerd Fonts - CascadiaCode",
    "Description": "Nerd Fonts is a project that patches developer targeted fonts with a high number of glyphs (icons)",
    "winget": "none",
    "choco": "nerd-fonts-cascadiacode",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Java SE Runtime Environment 8.0.411",
    "Description": "Java allows you to play online games, chat with people around the world, calculate your mortgage interest, and view images in 3D, just to name a few. It's also integral to the intranet applications and other e-business solutions that are the foundation of corporate computing. Please note you now need a Java License from Oracle to use unless installed for Personal Use and Development Use",
    "winget": "none",
    "choco": "jre8",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Audacity",
    "Description": "Audacity is free, open source, cross-platform software for recording and editing sounds",
    "winget": "Audacity.Audacity",
    "choco": "audacity",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "MusicBee",
    "Description": "MusicBee makes it easy to organize, find and play music files on your computer, on portable devices and on the web",
    "winget": "MusicBee.MusicBee",
    "choco": "musicbee",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Format Factory",
    "Description": "multifunctional media processing tools",
    "winget": "none",
    "choco": "formatfactory",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Winaero Tweaker",
    "Description": "Customize the appearance and behavior of the Windows operating system",
    "winget": "none",
    "choco": "winaero-tweaker",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Windows Subsystem for Linux WSL2",
    "Description": "To install Windows Subsystem for Linux 2, run the following command from the command line or from PowerShell",
    "winget": "Microsoft.WSL",
    "choco": "wsl2",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Wamp Server 3.3.5",
    "Description": "WampServer is a Windows web development environment. It allows you to create web applications",
    "winget": "none",
    "choco": "wamp-server",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MongoDB",
    "Description": "MongoDB stores data using a flexible document data model that is similar to JSON. Documents contain one or more fields, including arrays, binary data and sub-documents. Fields can vary from document to document. This flexibility allows development teams to evolve the data model rapidly as their application requirements change",
    "winget": "MongoDB.Server",
    "choco": "mongodb",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MPC-BE",
    "Description": "Media Player Classic - BE is a free and open source audio and video player for Windows",
    "winget": " MPC-BE.MPC-BE",
    "choco": "mpc-be",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Kdenlive",
    "Description": "A powerful non-linear video editor",
    "winget": "KDE.Kdenlive",
    "choco": "kdenlive",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "TablePlus",
    "Description": "Modern, native, and friendly GUI tool for relational databases: MySQL, PostgreSQL, SQLite, MongoDB, Redis, and more",
    "winget": "TablePlus.TablePlus",
    "choco": "tableplus",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Hosts File Editor",
    "Description": "Hosts File Editor makes it easy to change your hosts file as well as archive multiple versions for easy retrieval",
    "winget": "scottlerch.hosts-file-editor",
    "choco": "hosts.editor",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Subtitle Edit",
    "Description": "With SE you can easily adjust a subtitle if it is out of sync with the video in several different ways. You can also use SE for making new subtitles from scratch (do use the time-line/waveform/spectrogram) or translating subtitles",
    "winget": "9NWH51GWJTKN",
    "choco": "subtitleedit",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Skype",
    "Description": "Skype - Install Skype, add your friends as contacts, then call, video call and instant message with them for free. Call people who aren't on Skype too, at really low rates",
    "winget": "Microsoft.Skype",
    "choco": "skype",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "FileZilla",
    "Description": "FileZilla Client is a fast and reliable cross-platform FTP, FTPS and SFTP client with lots of useful features and an intuitive graphical user interface",
    "winget": "none",
    "choco": "filezilla",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Everything",
    "Description": "Everything Search Engine - locate files and folders by name instantly",
    "winget": "voidtools.Everything",
    "choco": "everything",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Yarn",
    "Description": "Yarn is a package manager for the npm and bower registries with a few specific focuses",
    "winget": "Yarn.Yarn",
    "choco": "yarn",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "VMware Workstation Player",
    "Description": "VMware Workstation Player™ is a streamlined desktop virtualization application that runs another operating system on the same computer without rebooting. VMware Workstation Player provides a simple user interface, unmatched operating system support, and portability across the VMware ecosystem",
    "winget": "none",
    "choco": "vmware-workstation-player",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "HDD Low Level Format Tool",
    "Description": "Will erase, Low-Level Format and re-certify a SATA, IDE or SCSI hard disk drive with any size of up to 281 474 976 710 655 bytes",
    "winget": "none",
    "choco": "llftool",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "BlueStacks",
    "Description": "Play Android Games on PC",
    "winget": "BlueStack.BlueStacks",
    "choco": "bluestacks",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Intel Wireless Bluetooth for Windows 10 and Windows 11",
    "Description": "Bluetooth for Windows 10 and Windows",
    "winget": "none",
    "choco": "intel-bluetooth-drivers",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Office 365 Business",
    "Description": "Microsoft 365 (formerly Office 365) is a line of subscription services offered by Microsoft as part of the Microsoft Office product line. The brand encompasses plans that allow use of the Microsoft Office software suite over the life of the subscription, as well as cloud-based software as a service products for business environments, such as hosted Exchange Server, Skype for Business Server, and SharePoint, among others. All Microsoft 365 plans include automatic updates to their respective software at no additional charge, as opposed to conventional licenses for these programs—where new versions require purchase of a new license",
    "winget": "Microsoft.Office",
    "choco": "office365business",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Bandicam",
    "Description": "Bandicam is a closed-source screen capture and screen recording software originally developed by Bandisoft and later by Bandicam Company that can take screenshots or record screen changes. Bandicam consists of three main modes. One is the Screen Recording mode, which can be used for recording a certain area on the PC screen",
    "winget": "BandicamCompany.Bandicam",
    "choco": "none",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "QQPlayer",
    "Description": "QQPlayer media player",
    "winget": "Tencent.QQPlayer",
    "choco": "none",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "4K Video Downloader",
    "Description": "4K Video Downloader allows downloading videos, playlists, channels and subtitles from YouTube, Facebook, Vimeo and other video sites in high quality",
    "winget": "OpenMedia.4KVideoDownloader",
    "choco": "4k-video-downloader",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Active@ Partition Recovery",
    "Description": "Active@ Partition Recovery is a freeware toolkit that helps to recover deleted and damaged logical drives and partitions within Windows, WinPE (recovery boot disk) and Linux (recovery LiveCD) environments",
    "winget": "LSoftTechnologies.ActivePartitionRecovery",
    "choco": "none",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "HiSuite",
    "Description": "HUAWEI HiSuite is the official Android Smart Device Manager tool,HiSuite helps users to connect their HUAWEI smartphones and tablets to PC",
    "winget": "Huawei.HiSuite",
    "choco": "none",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Android Studio",
    "Description": "Android Studio is the official integrated development environment for Google's Android operating system, built on JetBrains IntelliJ IDEA software and designed specifically for Android development",
    "winget": "Google.AndroidStudio",
    "choco": "androidstudio",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "LibreWolf",
    "Description": "LibreWolf is designed to increase protection against tracking and fingerprinting techniques, while also including a few security improvements. This is achieved through our privacy and security oriented settings and patches. LibreWolf also aims to remove all the telemetry, data collection and annoyances, as well as disabling anti-freedom features like DRM",
    "winget": "LibreWolf.LibreWolf",
    "choco": "librewolf",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Flow Launcher",
    "Description": "Dedicated to making your workflow flow more seamless. Search everything from applications, files, bookmarks, YouTube, Twitter and more. Flow will continue to evolve, designed to be open and built with the community at heart",
    "winget": "Flow-Launcher.Flow-Launcher",
    "choco": "flow-launcher",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "IconsExtract",
    "Description": "The IconsExtract utility scans the files and folders on your computer, and extract the icons and cursors stored in EXE, DLL, OCX, CPL, and in other file types",
    "winget": "none",
    "choco": "iconsext",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "AdGuard Home",
    "Description": "AdGuard Home is a network-wide software for blocking ads and tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that",
    "winget": "AdGuard.AdGuardHome",
    "choco": "adguardhome",
    "default": [],
    "category": "Security",
    "check": "false"
  },
  {
    "Name": "Burp Suite Community Edition",
    "Description": "Burp Suite is an integrated platform for performing security testing of web applications. Its various tools work seamlessly together to support the entire testing process, from initial mapping and analysis of an application's attack surface, through to finding and exploiting security vulnerabilities.",
    "winget": "PortSwigger.BurpSuite.Community",
    "choco": "burp-suite-free-edition",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "CoreTemp",
    "Description": "Core Temp is a compact, no fuss, small footprint, yet powerful program to monitor processor temperature and other vital information",
    "winget": "ALCPU.CoreTemp",
    "choco": "coretemp",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "ShareX",
    "Description": "Screen capture, file sharing and productivity tool",
    "winget": "ShareX.ShareX",
    "choco": "sharex",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "ONLY OFFICE",
    "Description": "ONLYOFFICE is a project developed by experienced IT experts from Ascensio System SIA, leading IT company with headquarters in Riga, Latvia. Originally ONLYOFFICE was designed for internal team collaboration. An attempt to introduce it to a wider audience proved to be successful: ONLYOFFICE received very positive feedback from the Internet community. As a result, its functionality was considerably revised and expanded that brought about a high and stable growth of users from different countries",
    "winget": "ONLYOFFICE.DesktopEditors",
    "choco": "onlyoffice",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "ESET Internet Security",
    "Description": "Ideal for modern users concerned about their privacy, who actively use internet for shopping, banking, work and communication",
    "winget": "ESET.EndpointSecurity",
    "choco": "eset-internet-security",
    "default": [],
    "category": "Security",
    "check": "false"
  },
  {
    "Name": "WinDirStat",
    "Description": "WinDirStat is a disk usage statistics viewer and cleanup tool for Microsoft Windows",
    "winget": "WinDirStat.WinDirStat",
    "choco": "windirstat",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "Winmerge",
    "Description": "WinMerge is an Open Source differencing and merging tool for Windows. WinMerge can compare both  folders and files, presenting differences in a visual text format that is easy to understand and handle",
    "winget": "WinMerge.WinMerge",
    "choco": "winmerge",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Wireshark",
    "Description": "Wireshark is the worlds foremost and widely-used network protocol analyzer. It lets you see whats happening on your network at a microscopic level and is the de facto (and often de jure) standard across many commercial and non-profit enterprises, government agencies, and educational institutions. Wireshark development thrives thanks to the volunteer contributions of networking experts around the globe and is the continuation of a project started by Gerald Combs in 1998",
    "winget": "WiresharkFoundation.Wireshark",
    "choco": "wireshark",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "TeraCopy",
    "Description": "TeraCopy is designed to copy and move files at the maximum possible speed. It skips bad files during the copying process, and then displays them at the end of the transfer so that you can see which ones need attention. TeraCopy can automatically check the copied files for errors by calculating their CRC checksum values. It also provides a lot more information about the files being copied than its Windows counterpart. TeraCopy integrates with Windows Explorer's right-click menu and can be set as the default copy handler",
    "winget": "CodeSector.TeraCopy",
    "choco": "teracopy",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "QuickLook",
    "Description": "Quick Look is among the few features I missed from Mac OS X It enables very quick preview of file by pressing Space key while highlighting it without opening its associated application Then I decide to add this feature to Windows by myself which results this QuickLook project",
    "winget": "QL-Win.QuickLook",
    "choco": "quicklook",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "RepoZ",
    "Description": "RepoZ provides a quick overview of the git repositories on your development machine including their current branch and a short status information It uses the repositories on your machine to create an efficient navigation widget and makes sure youll never loose track of your work along the way",
    "winget": "AndreasWascher.RepoZ",
    "choco": "repoz",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Intel Graphics Command Center",
    "Description": "Dont have time to mess around with settings The Intel Graphics Command Center easily finds and tunes your games complete with recommended settings for your computer Use oneclick optimization for many popular titles and instantly get the most out of your system. (Windows 10 version 1709 or higher,6th Gen Intel Core Platforms or newer)",
    "winget": "9PLFNLNT3G5G",
    "choco": "none",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Go Programming Language",
    "Description": "Go is expressive concise clean and efficient Its concurrency mechanisms make it easy to write programs that get the most out of multicore and networked machines while its novel type system enables flexible and modular program construction Go compiles quickly to machine code yet has the convenience of garbage collection and the power of runtime reflection Its a fast statically typed compiled language that feels like a dynamically typed interpreted language",
    "winget": "Language GoLang.Go",
    "choco": "golang",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Rust",
    "Description": "Rust is a curlybrace blockstructured expression language It visually resembles the C language family but differs significantly in syntactic and semantic details Its design is oriented toward concerns of programming in the large that is of creating and maintaining boundaries  both abstract and operational  that preserve largesystem integrity availability and concurrency",
    "winget": "Rustlang.Rust.GNU",
    "choco": "rust",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Inkscape",
    "Description": "Inkscape is an opensource vector graphics editor similar to Adobe Illustrator Corel Draw Freehand or Xara X What sets Inkscape apart is its use of Scalable Vector Graphics SVG an open XMLbased W3C standard as the native format",
    "winget": "Inkscape.Inkscape",
    "choco": "inkscape",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "Youtube Dl",
    "Description": "youtubedl is a small commandline program to download videos from YouTubecom and a few more sites It is written in Python and its not platform specific It should work in your Unix box in Windows or in Mac OS X It is released to the public domain which means you can modify it redistribute it or use it however you like",
    "winget": "youtube-dl.youtube-dl",
    "choco": "yt-dlp",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Postman",
    "Description": "Postman helps you be more efficient while working with APIs Using Postman you can construct complex HTTP requests quickly organize them in collections and share them with your coworkers",
    "winget": "Postman.Postman",
    "choco": "postman",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Azure CLI",
    "Description": "The Azure CLI is available across Azure services and is designed to get you working quickly with Azure with an emphasis on automation",
    "winget": "Microsoft.AzureCLI",
    "choco": "azure-cli",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "GameMaker Studio",
    "Description": "GameMaker Studio has everything you need for games development no matter what your level or expertise",
    "winget": "YoYoGames.GameMaker.Studio.2",
    "choco": "none",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Charles",
    "Description": "Charles is an HTTP proxy  HTTP monitor  Reverse Proxy that enables a developer to view all of the HTTP and SSL  HTTPS traffic between their machine and the Internet This includes requests responses and the HTTP headers which contain the cookies and caching information",
    "winget": "XK72.Charles",
    "choco": "charles",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Windows Media Player",
    "Description": "Media Player is designed to make listening to and watching your multimedia content more enjoyable At the heart of Media Player is a fullfeatured music library that allows you to quickly browse and play music as well as create and manage playlists All your content in the music and video folders on your PC will appear automatically in your library",
    "winget": "9WZDNCRFJ3PT",
    "choco": "none",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "espanso",
    "Description": "A crossplatform Text Expander written in Rust",
    "winget": "Espanso.Espanso",
    "choco": "espanso",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Ability Office",
    "Description": "Ability Office Standard offers 3 core applications essential for home and business Word Processor Spreadsheet and Presentation in one affordable office suite It also includes a Photoalbum and quick application Launcher Just perfect for working from home allowing files to be edited and exchanged with those back in the office and absolutely ideal for students and school children",
    "winget": "Ability.AbilityOffice.8.Standard",
    "choco": "abilityoffice",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Winbox",
    "Description": "Small utility that allows administration of MikroTik RouterOS using a fast and simple GUI",
    "winget": "Mikrotik.Winbox",
    "choco": "none",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "SearchMyFiles",
    "Description": "SearchMyFiles allows you to make a very accurate search that cannot be done with Windows search For Example You can search all files created in the last 10 minutes with size between 500 and 700 bytes",
    "winget": "NirSoft.SearchMyFiles",
    "choco": "searchmyfiles",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "iTunes",
    "Description": "iTunes is the best way to organize and enjoy the music movies and TV shows you already have and shop for the ones you want to get Its home to Apple Music which gives you unlimited access to millions of songs curated playlists1 and Beats 1 radio hosted by Zane Lowe and a team of acclaimed DJs Enjoy all the entertainment iTunes has to offer on your Mac and PC",
    "winget": "Apple.iTunes",
    "choco": "itunes",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "StartIsBack++",
    "Description": "StartIsBack returns Windows 10 and Windows 8 a real fully featured start menu and start button behaving exactly like the ones in Windows 7",
    "winget": "StartIsBack.StartIsBack",
    "choco": "startisback",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Advanced SystemCare Free",
    "Description": "Over time your computer may accumulate with large quantities of useless temporary and duplicate files Advanced SystemCare 12 will help clean up these junk files and free up your disk space Also you can use our advanced tools to make registry clean for better use",
    "winget": "XPFFGSS4Z9M2TX",
    "choco": "afedteated",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Send Anywhere",
    "Description": "Send Anywhere is a multiplatform file sharing service where users can directly share digital content in real time",
    "winget": "Estmob.SendAnywhere",
    "choco": "none",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "YUMI Legacy",
    "Description": "YUMI Your Universal Multiboot Installer is the successor to MultibootISOs It can be used to create a Multiboot USB Flash Drive containing multiple operating systems antivirus utilities disc cloning diagnostic tools and more Contrary to MultiBootISOs which used grub to boot ISO files directly from USB YUMI uses syslinux to boot extracted distributions stored on the USB device and reverts to using grub to Boot Multiple ISO files from USB if necessary",
    "winget": "YumiUsb.Legacy",
    "choco": "yumi",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "YUMI UEFI",
    "Description": "YUMI Your Universal Multiboot Installer is the successor to MultibootISOs It can be used to create a Multiboot USB Flash Drive containing multiple operating systems antivirus utilities disc cloning diagnostic tools and more Contrary to MultiBootISOs which used grub to boot ISO files directly from USB YUMI uses syslinux to boot extracted distributions stored on the USB device and reverts to using grub to Boot Multiple ISO files from USB if necessary",
    "winget": "YumiUsb.UEFI",
    "choco": "yumi-uefi",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "OP Auto Clicker",
    "Description": "A fullfledged autoclicker with two modes of autoclicking at your dynamic cursor location or at a prespecified location The maximum amounts of clicked can also be set or left as infinite Hotkeys work in the background for convenience",
    "winget": "OPAutoClicker.OPAutoClicker",
    "choco": "autoclicker",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Spotube",
    "Description": "Spotube is a Flutter based lightweight spotify client It utilizes the power of Spotify  Youtubes public API  creates a hazardless performant  resource friendly User Experience",
    "winget": "KRTirtho.Spotube",
    "choco": "spotube",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Audio Switcher",
    "Description": "Easily switch the default audio device input or output on any Windows PC Vista and above Using this application you can switch output OR input sound devices at the click of a button or the press of a key I designed this application to be incredibly small and lightweight There is no bloat it does exactly what it should nothing more nothing less",
    "winget": "FortyOneLtd.AudioSwitcher",
    "choco": "audioswitcher",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Microsoft Teams Classic Desktop",
    "Description": "Microsoft Teams is a messaging app for teams where all conversations meetings files and notes can be accessed by everyone all in one place Its a place for collaboration and work to happen in the open",
    "winget": "none",
    "choco": "microsoft-teams.install",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Microsoft Windows SDK",
    "Description": "The Windows 10 SDK for Windows 10 version 1809 provides the latest headers libraries metadata and tools for building Windows 10 apps NoteWindows 10 development targeting Windows 10 version 1903 or later requires Visual Studio 2017 or later This SDK will not be discovered by previous versions of Visual Studio",
    "winget": "none",
    "choco": "windows-sdk-10.1",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "RunAsDate Portable",
    "Description": "RunAsDate is a small utility that allows you to run a program in the date and time that you specify This utility doesnt change the current system date and time of your computer but it only injects the datetime that you specify into the desired application",
    "winget": "none",
    "choco": "runasdate",
    "default": [],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "Visual Studio 2017 Build ",
    "Description": "These Build Tools allow you to build native and managed MSBuildbased applications without requiring the Visual Studio IDE There are options to install the Visual C compilers and libraries MFC ATL and CCLI support",
    "winget": "none",
    "choco": "visualstudio2017buildtools",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MSEdgeRedirect",
    "Description": "This tool filters and passes the command line arguments of Microsoft Edge processes into your default browser instead of hooking into the microsoftedge handler this should provide resiliency against future changes Additionally an Image File Execution Options mode is available to operate similarly to the Old EdgeDeflector Additional modes are planned for future versions",
    "winget": "rcmaehl.MSEdgeRedirect",
    "choco": "msedgeredirect",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "NET Desktop Runtime 5",
    "Description": "NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime",
    "winget": "Microsoft.DotNet.HostingBundle.5",
    "choco": "dotnet-5.0-desktopruntime",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "NET Desktop Runtime 3",
    "Description": "NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime.",
    "winget": "dotnetcore-3.0-desktopruntime",
    "choco": "Microsoft.DotNet.HostingBundle.3_1",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "NET Desktop Runtime 6",
    "Description": "NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime.",
    "winget": "Microsoft.DotNet.HostingBundle.6",
    "choco": "dotnet-6.0-desktopruntime",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "NET Desktop Runtime 7",
    "Description": "NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime.",
    "winget": "Microsoft.DotNet.AspNetCore.7",
    "choco": "dotnet-7.0-desktopruntime",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "NET Desktop Runtime 8",
    "Description": "NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the NET Runtime",
    "winget": "Microsoft.DotNet.DesktopRuntime.8",
    "choco": "dotnet-desktopruntime",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Viber",
    "Description": "Viber is a mobile application that lets you make free phone calls and send text messages to anyone who also has the application installed You can call or text any Viber user anywhere in the world for free",
    "winget": "XPFM5P5KDWF0JP",
    "choco": "viber",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "StartAllBack",
    "Description": "Introducing  StartAllBack Windows 11 from a better timeline Embrace enhance unsweep classic UI from under the rug",
    "winget": "StartIsBack.StartAllBack",
    "choco": "startallback",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "DiskGenius Free",
    "Description": "With powerful capabilities and userfriendly interface DiskGenius Free Edition provides a robust solution for individuals and organizations to seek efficient disk management",
    "winget": "Eassos.DiskGenius",
    "choco": "diskgenius",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "UNFORMAT",
    "Description": "UNFORMAT is a software utility created to solve almost all data loss scenarios due to logical failure It can recover deleted files on a disk or restore deleted or damaged partitions and volumes As well as recovers data after using the FORMAT command",
    "winget": "LSoftTechnologies.UNFORMAT",
    "choco": "none",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "Active@ UNDELETE",
    "Description": "Active UNDELETE helps you to recover deleted files and restore deleted partitions from a variety of file systems such as FAT NTFS NTFS  EFS MacOS HFS ApFS Linux ext2 ext3 ext4 ZFS Unix UFS Advanced scan algorithms help to restore files even from severely damaged disks Sophisticated userfriendly UI makes navigation through your data a breeze",
    "winget": "LSoftTechnologies.ActiveUNDELETE",
    "choco": "none",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "HxD Hex Editor",
    "Description": "HxD is a carefully designed and fast hex editor which additionally to raw disk editing and modifying of main memory RAM handles files of any size",
    "winget": "MHNexus.HxD",
    "choco": "hxd",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "Epic Games Launcher",
    "Description": "The Epic Games Launcher is how you obtain the Unreal Game Engine modding tools and other Epic Games like Fortnite and the new Epic Games Store",
    "winget": "EpicGames.EpicGamesLauncher",
    "choco": "epicgameslauncher",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Vivaldi",
    "Description": "The new Vivaldi browser protects you from trackers blocks unwanted ads and puts you in control with unique builtin features Get Vivaldi and browse fast",
    "winget": "VivaldiTechnologies.Vivaldi",
    "choco": "vivaldi",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Microsoft PC Manager",
    "Description": "Microsoft PC manager a good way to protect your personal computer and optimize performance provides PC cleanup antivirus and Windows update making your computer safe and secure",
    "winget": "9PM860492SZD",
    "choco": "none",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Openshot",
    "Description": "OpenShot Video Editor is an awardwinning opensource video editor available on Linux Mac and Windows OpenShot can create stunning videos films and animations with an easytouse interface and rich set of features",
    "winget": "OpenShot.OpenShot",
    "choco": "openshot",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "WhatsApp",
    "Description": "WhatsApp Messenger or simply WhatsApp is an American freeware crossplatform centralized messaging and voiceoverIP VoIP service owned by Facebook Inc It allows users to send text messages and voice messages make voice and video calls and share images documents user locations and other content",
    "winget": "9NKSQGP7F2NH",
    "choco": "none",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Paint.NET",
    "Description": "PaintNET is image and photo editing software for PCs that run Windows",
    "winget": "dotPDNLLC.paintdotnet",
    "choco": "paint.net",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "Stretchly",
    "Description": "stretchly is a crossplatform electron app that reminds you to take breaks when working on your computer By default it runs in your tray and displays a reminder window containing an idea for a microbreak for 20 seconds every 10 minutes",
    "winget": "Stretchly.Stretchly",
    "choco": "stretchly",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Microsoft Silverlight",
    "Description": "Silverlight is a powerful development tool for creating engaging interactive user experiences for Web and mobile applications",
    "winget": "none",
    "choco": "silverlight",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "TreeSize",
    "Description": "Every hard disk is too small if you just wait long enough TreeSize Free tells you where precious disk space has gone",
    "winget": "JAMSoftware.TreeSize.Free",
    "choco": "treesizefree",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Dot Net 3.5",
    "Description": "NET is a free crossplatform opensource developer platform for building many different types of applications",
    "winget": "Microsoft.DotNet.DesktopRuntime.3_1",
    "choco": "dotnet3.5",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Flash Player ActiveX",
    "Description": "The Adobe Flash Player is freeware software for viewing multimedia executing Rich Internet Applications and streaming video and audio content created on the Adobe Flash platform",
    "winget": "none",
    "choco": "flashplayeractivex",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Google Drive",
    "Description": "Google Drive  All your files  everywhere Safely store your files and access them from any device Choose folders on your computer to sync with Google Drive or backup to Google Photos and access all of your content directly from your PC or Mac",
    "winget": "none",
    "choco": "googledrive",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Dot Net 4.5.2",
    "Description": "The Microsoft NET Framework 452 is a highly compatible inplace update to the Microsoft NET Framework 4 Microsoft NET Framework 45 and Microsoft NET Framework 451",
    "winget": "none",
    "choco": "dotnet4.5.2",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Dropbox",
    "Description": "Organize all your team's content, tune out distractions, and get everyone coordinated with the world's first smart workspace",
    "winget": "Dropbox.Dropbox",
    "choco": "dropbox",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "cURL",
    "Description": "Command line tool and library for transferring data with URLs",
    "winget": "cURL.cURL",
    "choco": "curl",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "PDF Creator",
    "Description": "PDFCreator lets you convert any printable document to PDF",
    "winget": "pdfforge.PDFCreator",
    "choco": "pdfcreator",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Autoruns",
    "Description": "This utility shows you what programs are configured to run during system bootup or login",
    "winget": "Microsoft.Sysinternals.Autoruns",
    "choco": "autoruns",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Microsoft OneDrive",
    "Description": "Save your files and photos to OneDrive and access them from any device anywhere",
    "winget": "Microsoft.OneDrive",
    "choco": "onedrive",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Process Explorer",
    "Description": "Process Explorer shows you information about which handles and DLLs processes have opened or loaded",
    "winget": "Microsoft.Sysinternals.ProcessExplorer",
    "choco": "procexp",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "FFmpeg",
    "Description": "FFmpeg is a widelyused crossplatform multimedia framework which can process almost all common and many uncommon media formats It has over 1000 internal components to capture decode encode modify combine stream media and it can make use of dozens of external libraries to provide more capabilities",
    "winget": "Gyan.FFmpeg",
    "choco": "ffmpeg",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "OpenVPN Connect",
    "Description": "The official OpenVPN Connect client software developed and maintained by OpenVPN Inc",
    "winget": "OpenVPNTechnologies.OpenVPNConnect",
    "choco": "openvpn-connect",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Git Large File Storage",
    "Description": "Git Large File Storage LFS replaces large files such as audio samples videos datasets and graphics with text pointers inside Git while storing the file contents on a remote server like GitHubcom or GitHub Enterprise",
    "winget": "none",
    "choco": "git-lfs",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Nmap",
    "Description": "Nmap Network Mapper is a free and open source utility for network discovery and security auditing",
    "winget": "Insecure.Nmap",
    "choco": "nmap",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "UltraVNC",
    "Description": "UltraVNC is an open source application that uses the VNC protocol to control another computer remotely over a network connection UltraVNC allows the use of a remote computer",
    "winget": "uvncbvba.UltraVnc",
    "choco": "ultravnc",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Plex",
    "Description": "Plex is a global streaming media service and a clientserver media player platform made by Plex Inc",
    "winget": "Plex.Plex",
    "choco": "plex",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Plex Media Server",
    "Description": "Plex Media Server helps you organise your media and stream it to your devices",
    "winget": "Plex.PlexMediaServer",
    "choco": "plexmediaserver",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Microsoft Visio Viewer",
    "Description": "By using Microsoft Visio 2016 Viewer Visio users can freely distribute Visio drawings files with a vsdx vsdm vsd vdx vdw vstx vstm vst or vtx extension to team members partners customers or others even if the recipients do not have Visio installed on their computer",
    "winget": "Microsoft.VisioViewer",
    "choco": "visioviewer",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Keyn Stroke",
    "Description": "KeynStroke makes it easy for your audience to follow your actions on the screen",
    "winget": "none",
    "choco": "key-n-stroke",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Ability Office",
    "Description": "Ability Office 8 Standard complete office suite",
    "winget": "Ability.AbilityOffice.8.Standard",
    "choco": "abilityoffice",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Fing",
    "Description": "Fing App is a free network scanner that makes you discover all connected devices run internet speed tests and help troubleshoot network and device issues Get Fingbox for more advanced security and protection for your network",
    "winget": "none",
    "choco": "fing",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Ryujinx",
    "Description": "Ryujinx is an opensource Nintendo Switch emulator created by gdkchan and written in C This emulator aims at providing excellent accuracy and performance a userfriendly interface and consistent builds",
    "winget": "none",
    "choco": "ryujinx --params '/DesktopShortcut'",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Omnify Hotspot",
    "Description": "The best virtual router to turn your PC into a WiFi hotspot  repeater WiFi hotspot allows you to create a wireless access point and share your internet Its easy to use and quick to start as you only need to give it a name and password and then connect your smartphone tablet media player ereader printer laptop and other wireless devices The network name can also include Unicode characters and Emojis",
    "winget": "none",
    "choco": "omnifyhotspot",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "MKVToolNix",
    "Description": "MKVToolNix is a set of tools to create alter and inspect Matroska files under Linux other Unices and Windows",
    "winget": "MoritzBunkus.MKVToolNix",
    "choco": "mkvtoolnix",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Neat Download Manager",
    "Description": "Neat Download Manager is a free Internet Download Manager for Windows",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://www.neatdownloadmanager.com/file/NeatDM_setup.exe",
        "args": "/verysilent /tasks=addcontextmenufiles,addcontextmenufolders,addtopath",
        "portable": "false",
        "launcher": "NeatDM_setup.exe"
      }
    ],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "x630ce for all games",
    "Description": "Xbox 360 Controller Emulator” allows your controller (gamepad, joystick, steering wheel, pedals, etc.) to function on your PC as an Xbox 360 controller. It allows you to remap buttons and axes and to drive cars with steering wheel and pedals or to fly planes with joystick and throttle in games like “Grand Theft Auto” or “Saints Row” • Digitally Signed",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://www.x360ce.com/files/x360ce_x86.zip",
        "args": "none",
        "portable": "true",
        "launcher": "x360ce_x86.exe"
      }
    ],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "x630ce x86",
    "Description": "Xbox 360 Controller Emulator” allows your controller (gamepad, joystick, steering wheel, pedals, etc.) to function on your PC as an Xbox 360 controller. It allows you to remap buttons and axes and to drive cars with steering wheel and pedals or to fly planes with joystick and throttle in games like “Grand Theft Auto” or “Saints Row” • Digitally Signed",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://www.x360ce.com/files/x360ce_x86.zip",
        "args": "none",
        "portable": "true",
        "launcher": "x360ce_x86.exe"
      }
    ],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "x630ce x64",
    "Description": "Xbox 360 Controller Emulator” allows your controller (gamepad, joystick, steering wheel, pedals, etc.) to function on your PC as an Xbox 360 controller. It allows you to remap buttons and axes and to drive cars with steering wheel and pedals or to fly planes with joystick and throttle in games like “Grand Theft Auto” or “Saints Row” • Digitally Signed",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://www.x360ce.com/files/x360ce_x64.zip",
        "args": "none",
        "portable": "true",
        "launcher": "x360ce_x64.exe"
      }
    ],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Microsoft .NET SDK 7",
    "Description": "NET is a free crossplatform opensource developer platform for building many different types of applications",
    "winget": "Microsoft.DotNet.SDK.7",
    "choco": "dotnet-7.0-sdk",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft .NET SDK 8",
    "Description": "NET is a free crossplatform opensource developer platform for building many different types of applications",
    "winget": "Microsoft.DotNet.SDK.Preview",
    "choco": "dotnet-sdk",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft ASP.NET Core Runtime 7.0",
    "Description": "NET is a free crossplatform opensource developer platform for building many different types of applications",
    "winget": "Microsoft.DotNet.AspNetCore.7",
    "choco": "dotnet-aspnetruntime",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "HFS HTTP File Server",
    "Description": "You can use HFS HTTP File Server to send and receive files Its different from classic file sharing because it uses web technology to be more compatible with todays Internet It also differs from classic web servers because its very easy to use and runs right outofthe box",
    "winget": "none",
    "choco": "hfs",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Cemu",
    "Description": "Cemu is a highly experimental software to emulate Wii U applications on PC",
    "winget": "Cemu.Cemu",
    "choco": "cemu",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Chatterino",
    "Description": "Chatterino is a chat client for Twitch chat that offers a clean and customizable interface for a better streaming experience",
    "winget": "ChatterinoTeam.Chatterino",
    "choco": "chatterino",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Clementine",
    "Description": "Clementine is a modern music player and library organizer supporting various audio formats and online radio services",
    "winget": "Clementine.Clementine",
    "choco": "clementine",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Clink",
    "Description": "Clink is a powerful Bashcompatible commandline interface CLIenhancement for Windows adding features like syntax highlighting and improved history",
    "winget": "chrisant996.Clink",
    "choco": "clink",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "CMake",
    "Description": "CMake is an opensource crossplatform family of tools designed to build test and package software",
    "winget": "Kitware.CMake",
    "choco": "cmake",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "CopyQ Clipboard Manager",
    "Description": "CopyQ is a clipboard manager with advanced features allowing you to store edit and retrieve clipboard history",
    "winget": "hluk.CopyQ",
    "choco": "copyq",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Crystal Disk Info",
    "Description": "Crystal Disk Info is a disk health monitoring tool that provides information about the status and performance of hard drives It helps users anticipate potential issues and monitor drive health",
    "winget": "CrystalDewWorld.CrystalDiskInfo",
    "choco": "crystaldiskinfo",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Crystal Disk Mark",
    "Description": "Crystal Disk Mark is a disk benchmarking tool that measures the read and write speeds of storage devices It helps users assess the performance of their hard drives and SSDs",
    "winget": "CrystalDewWorld.CrystalDiskMark",
    "choco": "crystaldiskmark",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Darktable",
    "Description": "Opensource photo editing tool offering an intuitive interface advanced editing capabilities and a nondestructive workflow for seamless image enhancement",
    "winget": "darktable.darktable",
    "choco": "darktable",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "EA App",
    "Description": "EA App is a platform for accessing and playing Electronic Arts games",
    "winget": "ElectronicArts.EADesktop",
    "choco": "ea-app",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Falkon",
    "Description": "Falkon is a lightweight and fast web browser with a focus on user privacy and efficiency",
    "winget": "KDE.Falkon",
    "choco": "falkon",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "File Converter",
    "Description": "File Converter is a very simple tool which allows you to convert and compress one or several files using the context menu in windows explorer",
    "winget": "AdrienAllard.FileConverter",
    "choco": "file-converter",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Files",
    "Description": "Alternative file explorer",
    "winget": "none",
    "choco": "files",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Flameshot",
    "Description": "Flameshot is a powerful yet simple to use screenshot software offering annotation and editing features",
    "winget": "Flameshot.Flameshot",
    "choco": "flameshot",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Lightshot",
    "Description": "Ligthshot is an Easytouse lightweight screenshot software tool where you can optionally edit your screenshots using different tools share them via Internet andor save to disk and customize the available options",
    "winget": "Skillbrains.Lightshot",
    "choco": "lightshot",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "F.lux",
    "Description": "flux adjusts the color temperature of your screen to reduce eye strain during nighttime use",
    "winget": "flux.flux",
    "choco": "flux",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "GitHub CLI",
    "Description": "GitHub CLI is a commandline tool that simplifies working with GitHub directly from the terminal",
    "winget": "GitHub.cli",
    "choco": "gh",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "GOG Galaxy",
    "Description": "GOG Galaxy is a gaming client that offers DRMfree games additional content and more",
    "winget": "GOG.Galaxy",
    "choco": "goggalaxy",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Greenshot",
    "Description": "Greenshot is a lightweight screenshot software tool with builtin image editor and customizable capture options",
    "winget": "Greenshot.Greenshot",
    "choco": "greenshot",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Hexchat",
    "Description": "HexChat is a free opensource IRC Internet Relay Chat client with a graphical interface for easy communication",
    "winget": "HexChat.HexChat",
    "choco": "hexchat",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "HWMonitor",
    "Description": "HWMonitor is a hardware monitoring program that reads PC systems main health sensors",
    "winget": "CPUID.HWMonitor",
    "choco": "hwmonitor",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "ImageGlass",
    "Description": "ImageGlass is a versatile image viewer with support for various image formats and a focus on simplicity and speed",
    "winget": "DuongDieuPhap.ImageGlass",
    "choco": "imageglass",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Itch.io",
    "Description": "Itchio is a digital distribution platform for indie games and creative projects",
    "winget": "ItchIo.Itch",
    "choco": "itch",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "KDE Connect",
    "Description": "KDE Connect allows seamless integration between your KDE desktop and mobile devices",
    "winget": "KDE.KDEConnect",
    "choco": "kdeconnect-kde",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "KeePassXC",
    "Description": "KeePassXC is a crossplatform opensource password manager with strong encryption features",
    "winget": "KeePassXCTeam.KeePassXC",
    "choco": "keepassxc",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Lazygit",
    "Description": "Simple terminal UI for git commands",
    "winget": "JesseDuffield.lazygit",
    "choco": "lazygit",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "LocalSend",
    "Description": "An open source crossplatform alternative to AirDrop",
    "winget": "LocalSend.LocalSend",
    "choco": "localsend.install",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Fork",
    "Description": "Fork  a fast and friendly git client",
    "winget": "Fork.Fork",
    "choco": "git-fork",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "PulsarEdit",
    "Description": "A Communityled HyperHackable Text Editor",
    "winget": "Pulsar-Edit.Pulsar",
    "choco": "pulsar",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Shotcut",
    "Description": "Shotcut is a free open source crossplatform video editor",
    "winget": "Meltytech.Shotcut",
    "choco": "Shotcut",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "PaleMoon",
    "Description": "Pale Moon is an Open Source Goannabased web browser available for Microsoft Windows and Linux with other operating systems in development focusing on efficiency and ease of use",
    "winget": "MoonchildProductions.PaleMoon",
    "choco": "paleMoon",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "JoyToKey",
    "Description": "enables PC game controllers to emulate the keyboard and mouse input",
    "winget": "JTKsoftware.JoyToKey",
    "choco": "joytokey",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Windows Auto Dark Mode",
    "Description": "Automatically switches between the dark and light theme of Windows 10 and Windows 11",
    "winget": "Armin2208.WindowsAutoNightMode",
    "choco": "auto-dark-mode",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Windows Firewall Control",
    "Description": "Windows Firewall Control is a powerful tool which extends the functionality of Windows Firewall and provides new extra features which makes Windows Firewall better",
    "winget": "BiniSoft.WindowsFirewallControl",
    "choco": "windowsfirewallcontrol",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "TightVNC",
    "Description": "TightVNC is a free and Open Source remote desktop software that lets you access and control a computer over the network With its intuitive interface you can interact with the remote screen as if you were sitting in front of it You can open files launch applications and perform other actions on the remote desktop almost as if you were physically there",
    "winget": "GlavSoft.TightVNC",
    "choco": "TightVNC",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Python Version Manager",
    "Description": "pyenv for Windows is a simple python version management tool It lets you easily switch between multiple versions of Python",
    "winget": "none",
    "choco": "pyenv-win",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Pixi",
    "Description": "Pixi is a fast software package manager built on top of the existing conda ecosystem Spins up development environments quickly on Windows macOS and Linux Pixi supports Python R CC Rust Ruby and many other languages",
    "winget": "prefix-dev.pixi",
    "choco": "pixi",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "VSCodium",
    "Description": "VSCodium is a communitydriven freelylicensed binary distribution of Microsofts VS Code",
    "winget": "VSCodium.VSCodium",
    "choco": "vscodium",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Thonny Python IDE",
    "Description": "Python IDE for beginners",
    "winget": "AivarAnnamaa.Thonny",
    "choco": "thonny",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Poedit",
    "Description": "Poedit translations editor The best way to translate apps and sites",
    "winget": "none",
    "choco": "none",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Adobe Acrobat Reader",
    "Description": "Adobe Acrobat Reader DC software is the free trusted global standard for viewing printing signing sharing and annotating PDFs Its the only PDF viewer that can open and interact",
    "winget": "Adobe.Acrobat.Reader.32-bit",
    "choco": "adobereader",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Flash Player Plugin",
    "Description": "The Adobe Flash Player is freeware software for viewing multimedia executing Rich Internet Applications and streaming video and audio content created on the Adobe Flash platform",
    "winget": "none",
    "choco": "flashplayerplugin",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Sysinternals",
    "Description": "The Sysinternals Troubleshooting Utilities have been rolled up into a single suite of tools",
    "winget": "none",
    "choco": "sysinternals",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "SelfishNet",
    "Description": "Control your internet bandwidth with SelfishNet V3, ARP Spoofing application.",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://github.com/nov0caina/SelfishNetV3/releases/download/SelfishNetV3.0.0/SelfishNetV3.0.0_Installer.zip",
        "args": "/quiet",
        "portable": "false",
        "launcher": "SelfishNetV3_Installer.msi"
      }
    ],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "NTLite",
    "Description": "Integrate updates drivers automate Windows and application setup speedup Windows deployment process and have it all set for the next time",
    "winget": "Nlitesoft.NTLite",
    "choco": "ntlite-free",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Olive Video Editor",
    "Description": "Olive is a free nonlinear video editor for Windows",
    "winget": "OliveTeam.OliveVideoEditor",
    "choco": "olive",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Mark Text",
    "Description": "A simple and elegant opensource markdown editor that focused on speed and usability",
    "winget": "MarkText.MarkText",
    "choco": "marktext.portable",
    "default": [],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "pCloud Drive",
    "Description": "pCloud is a file hosting service also called cloud storage or online storage founded in Switzerland in 2013",
    "winget": "pCloudAG.pCloudDrive",
    "choco": "pcloud",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Hurl",
    "Description": "Hurl is a command line tool that runs HTTP requests defined in a simple plain text format",
    "winget": "Orange-OpenSource.Hurl",
    "choco": "hurl",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "File Hash Generator",
    "Description": "Compute and save MD5 SHA1 SHA2 RIPEMD hashes and CRC1632 checksums for multiple files Calculate hashes and checksums for the whole file or just specified bytes",
    "winget": "BinaryMark.FileHashGenerator",
    "choco": "file-hash-generator",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Multimark down",
    "Description": "MultiMarkdown or MMD, is a tool to help turn minimally marked-up plain text into well formatted documents, including HTML, PDF",
    "winget": "none",
    "choco": "multimarkdown",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "PCSX2 Emulator",
    "Description": "PCSX2 is a free and opensource PlayStation 2 PS2 emulator Its purpose is to emulate the PS2s hardware",
    "winget": "none",
    "choco": "pcsx2.portable",
    "default": [],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "RetroArch",
    "Description": "RetroArch is a frontend for emulators game engines and media players It enables you to run classic games on a wide range of computers and consoles through its slick graphical interface",
    "winget": "Libretro.RetroArch",
    "choco": "retroarch",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Free Virtual Keyboard",
    "Description": "Free Virtual Keyboard works on any Windows based UMPC with a passive touchscreen Ultramobile PC Tablet PC and Panel PC",
    "winget": "none",
    "choco": "free-virtual-keyboard",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "TypeScript for Visual Studio 2017 and 2019",
    "Description": "This is a standalone power tool release of TypeScript for Visual Studio 2017 and 2019 It includes both the TypeScript experience for Visual Studio and a standalone compiler that can be used from the command line",
    "winget": "none",
    "choco": "typescript-vs2017-vs2019",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Caret",
    "Description": "Beautiful  Clever Markdown Editor Download trial",
    "winget": "Caret.Caret",
    "choco": "caret",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "iSpy",
    "Description": "iSpy is the worlds most popular open source video surveillance application Its compatible with the the vast majority of consumer webcams and IP cameras With more than 2 million users worldwide iSpy works with more cameras and devices than anything else on the market",
    "winget": "none",
    "choco": "ispy",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "WavPack",
    "Description": "WavPack is a completely open audio compression format providing lossless highquality lossy and a unique hybrid compression mode Although the technology is loosely based on previous versions of WavPack the new version 4 format has been designed from the ground up to offer unparalleled performance and functionality",
    "winget": "none",
    "choco": "wavpack",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "ProcessThreadsView",
    "Description": "ProcessThreadsView is a small utility that displays extensive information about all threads of the process that you choose",
    "winget": "none",
    "choco": "processthreadsview",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Zulu",
    "Description": "Zulu is a certified build of OpenJDK that is fully compliant with the Java SE standard Zulu is 100 open source and freely downloadable Now Java developers system administrators and end users can enjoy the full benefits of open source Java with deployment flexibility and control over upgrade timing",
    "winget": "Azul.Zulu.11.JRE",
    "choco": "zulu12",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "GitHubReleaseNotesv1",
    "Description": "Generate Release Notes in MarkDown format from a GitHub project",
    "winget": "StefHeyenrath.GitHubReleaseNotes",
    "choco": "githubreleasenotes",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Tome",
    "Description": "Developing games is all about data With game systems for modifying data and user interfaces for presenting it finding a sophisticated data model is key to creating successful games Even more being able to change this data and iterate on a daytoday basis is mandatory in todays production cycles",
    "winget": "none",
    "choco": "tome-editor",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Win32 OpenSSH",
    "Description": "OpenSSH is a complete implementation of the SSH protocol version 2 for secure remote login command execution and file transfer",
    "winget": "Microsoft.OpenSSH.Beta",
    "choco": "openssh",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Komodo Edit",
    "Description": "Komodo Edit is a free and open source text editor for dynamic programming languages",
    "winget": "ActiveState.KomodoEdit",
    "choco": "komodo-edit",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "FreeCAD",
    "Description": "A free and opensource multiplatform 3D parametric modeler",
    "winget": "FreeCAD.FreeCAD",
    "choco": "freecad",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "SQLite",
    "Description": "SQLite is an inprocess library that implements a selfcontained serverless zeroconfiguration transactional SQL database engine SQLite is an embedded SQL database engine Unlike most other SQL databases SQLite does not have a separate server process SQLite reads and writes directly to ordinary disk files A complete SQL database with multiple tables indices triggers and views is contained in a single disk file",
    "winget": "SQLite.SQLite",
    "choco": "sqlite",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MkDocs",
    "Description": "MkDocs is a fast simple and downright gorgeous static site generator thats geared towards building project documentation Documentation source files are written in Markdown and configured with a single YAML configuration file",
    "winget": "none",
    "choco": "mkdocs",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MkDocs Material Theme",
    "Description": "MkDocs is a fast simple and downright gorgeous static site generator thats geared towards building project documentation Documentation source files are written in Markdown and configured with a single YAML configuration file",
    "winget": "none",
    "choco": "mkdocs-material",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "PuTTY",
    "Description": "A free implementation of SSH and Telnet along with an xterm terminal emulator",
    "winget": "PuTTY.PuTTY",
    "choco": "putty",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "WinSCP",
    "Description": "WinSCP is an open source free SFTP client FTP client WebDAV client S3 client and SCP client for Windows Its main function is file transfer between a local and a remote computer Beyond this WinSCP offers scripting and basic file manager functionality",
    "winget": "WinSCP.WinSCP",
    "choco": "winscp",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "LibreOffice Still",
    "Description": "LibreOffice is the free powerpacked Open Source personal productivity suite for Windows macOS and Linux that gives you six featurerich applications for all your document production and data processing needs",
    "winget": "none",
    "choco": "libreoffice-still",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Aio Runtimes",
    "Description": "All in One Runtimes also known as AIO Runtimes is a program that integrates essential runtime packages ensuring the seamless functionality of all programs by installing them automatically",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://allinoneruntimes.org/files/aio-runtimes_v2.5.0.exe",
        "args": "none",
        "portable": "false",
        "launcher": "aio-runtimes_v2.5.0.exe"
      }
    ],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Visual-C-Runtimes All in One Oct 2024",
    "Description": "This archive contains the latest version (Oct 2024) of all VCRedist Visual Studio C++ runtimes, installable with a single click by running the included batch file installer",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://uk1-dl.techpowerup.com/files/ueTG1ZUGfNLEEZoDA7FORw/1731410753/Visual-C-Runtimes-All-in-One-Oct-2024.zip",
        "args": "none",
        "portable": "false",
        "launcher": "install_all.bat"
      }
    ],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "GPU-Z",
    "Description": "GPUZ is a lightweight system utility designed to provide vital information about your video card and graphics processor",
    "winget": "TechPowerUp.GPU-Z",
    "choco": "gpu-z",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "MemTest86",
    "Description": "MemTest86 boots from a USB flash drive and tests the RAM in your computer for faults using a series of comprehensive algorithms and test patterns",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://www.memtest86.com/downloads/memtest86-usb.zip",
        "launcher": "imageUSB.exe",
        "args": "/silent",
        "portable": "ture"
      }
    ],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Memtest86+",
    "Description": "Memtest86+ v6 is a unified, free, open-source memory testing tool, released under GNU GPL v2.0. The new v6 code base (originally called PCMemTest) was provided by Martin Whitaker, based on Memtest86+ v5, developed by Sam Demeulemeester. Both are now working on Memtest86+",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://www.memtest.org/download/v7.20/mt86plus_7.20_USB_Installer.exe",
        "launcher": "mt86plus_7.20_USB_Installer.exe",
        "args": "/verysilent /tasks=addcontextmenufiles,addcontextmenufolders,addtopath",
        "portable": "ture"
      }
    ],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "VLC Skins",
    "Description": "Put the downloaded VLT files in the following folder: On Windows: the skins folder in the VLC installation directory (e.g. C:\\Program Files\\VideoLAN\\VLC\\skins) On Linux/Unix: ~/.local/share/vlc/skins2",
    "winget": "none",
    "choco": "vlc-skins",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "GrepWin",
    "Description": "Regular expression search and replace for Windows",
    "winget": "StefansTools.grepWin",
    "choco": "grepwin",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "NICE DCV Server",
    "Description": "NICE DCV is a remote display protocol that securely streams desktops and apps from cloud or data centers to any device, enabling graphics-intensive applications on Amazon EC2. It's used for HPC workloads and by services like Appstream 2.0 and AWS RoboMaker",
    "winget": "none",
    "choco": "nice-dcv-server",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "NTag",
    "Description": "NTag is a cross platform-graphical tag editor focused on everyday life use cases",
    "winget": "nrittsti.NTag",
    "choco": "ntag",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Radeon™ RX 570 Adrenalin Edition Windows 10",
    "Description": "RX 570 Driver Adrenalin 24.3.1 (WHQL Recommended)",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://drivers.amd.com/drivers/whql-amd-software-adrenalin-edition-24.3.1-win10-win11-mar20-vega-polaris.exe",
        "args": "/SILENT",
        "launcher": "whql-amd-software-adrenalin-edition-24.3.1-win10-win11-mar20-vega-polaris.exe",
        "portable": "false"
      }
    ],
    "category": "GPU Drivers",
    "check": "false"
  },
  {
    "Name": "Radeon™ RX 580 Adrenalin Edition Windows 10",
    "Description": "RX 580 Adrenalin 24.9.1 (WHQL Recommended)",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://drivers.amd.com/drivers/whql-amd-software-adrenalin-edition-24.9.1-win10-win11-vega-polaris.exe",
        "args": "/SILENT",
        "launcher": "whql-amd-software-adrenalin-edition-24.9.1-win10-win11-vega-polaris.exe",
        "portable": "false"
      }
    ],
    "category": "GPU Drivers",
    "check": "false"
  },
  {
    "Name": "Visual C++ Redistributable Runtimes AIO Repack",
    "Description": "Visual C++ Redistributable Runtimes AIO Repack is all the latest Microsoft Visual C++ Redistributable Runtimes, without the original setup bloat payload",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "portable": "false",
        "launcher": "VisualCppRedist_AIO_x86_x64.exe",
        "url": "https://www.majorgeeks.com/index.php?ct=files&action=download&",
        "args": "/SILENT"
      }
    ],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Volume2",
    "Description": "Advanced Windows volume control",
    "winget": "irzyxa.Volume2Portable",
    "choco": "volume2",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "qBittorrent Enhanced Edition",
    "Description": "[Unofficial] qBittorrent Enhanced, based on qBittorrent",
    "winget": "wingetinstallc0re100.qBittorrent-Enhanced-Edition",
    "choco": "qbittorrent-enhanced",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Aspia",
    "Description": "Remote desktop and file transfer tool",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://github.com/dchapyshev/aspia/releases/download/v2.7.0/aspia-host-2.7.0-x86_64.msi",
        "launcher": "aspia-host-2.7.0-x86_64.msi",
        "args": "/silent",
        "portable": "false"
      }
    ],
    "category": "File Sharing",
    "check": "false"
  }
]

'@ | ConvertFrom-Json
$itt.database.locales = @'
{"Controls":{"ar":{"name":"عربي","Welcome":"توفر هذه الأداة تسهيلات كبيرة في عملية تثبيت البرامج وتحسين الاداء. انضم إلينا لتساهم في تطويرها وجعلها أكثر اكتمالًا","System_Info":"معلومات النظام","Power_Options":"خيارات الطاقة","Device_Manager":"إدارة الأجهزة","Services":"خدمات","Networks":"شبكات","Apps_features":"التطبيقات و الميزات","Task_Manager":"مدير المهام","Disk_Managment":"إدارة القرص","Install":"تثبيت","Apply":"تطبيق","Downloading":"...جارٍ التحميل","About":"عن الاداة","Third_party":"روابط خارجية","Preferences":"التفضيلات","Management":"إدارة الجهاز","Apps":"تطبيقات","Tweaks":"تحسينات","Settings":"إعدادات","Save":"حفظ البرامج","Restore":"أسترجاع البرامج","Music":"الموسيقى","On":"تشغيل ","Off":"كتم","Dark":"ليلا","Light":"نهارا","Use_system_setting":"استخدم إعدادات النظام","Create_desktop_shortcut":"أنشاء أختصار على سطح المكتب","Reset_preferences":" إعادة التفضيلات إلى الوضع الافتراضي","reopen_itt_again.":"يرجى اعادة فتح الاداة مرة اخرى","Theme":"المظهر","Language":"اللغة","MAS":"تفعيل الويندوز","Win_Office":"تحميل ويندوز / أوفيس","IDM":"تفعيل الدونلود مانجر","Browsers_extensions":"أضافات المتصفحات","All":"الكل","Search":"بحث","Create_restore_point":"إنشاء نقطة الاستعادة","Portable_Downloads_Folder":"مجلد التنزيلات المحمولة","Install_msg":"هل تريد تثبيت البرامج التالية","Apply_msg":"هل تريد تطبيق التحسينات التالية","Applying":"جارٍي التطبيق","Please_wait":"يرجى الانتظار، يوجد عملية في الخلفية","App_empty_select":"اختر على الأقل تطبيقًا لتثبيته","Tweak_empty_select":"اختار على الاقل تحسين واحد لتطبيقه","Last_update":"آخر تحديث","Exit_msg":"هل أنت متأكد من رغبتك في إغلاق البرنامج؟ إذا كان هناك أي تثبيتات، فسيتم إيقافها.","Happy_birthday":"!عيد ميلاد سعيد عماد","My_playlist":"انه عيد ميلادي و قائمة الموسيقى الخاصة بي","Empty_save_msg":"يرجى اختيار تطبيق واحد على الاقل لحفظه"},"de":{"name":"Deutsch","Welcome":"Sparen Sie Zeit indem Sie mehrere Programme gleichzeitig instAllieren und die Leistung Ihres Windows steigern. Schließen Sie sich uns an um dieses Tool zu verbessern und noch besser zu machen. Sie können auch Ihre Lieblings-Musik-Apps und Anpassungen hinzufügen.","Install":"InstAllieren","Apply":"Anwenden","Downloading":"Herunterladen...","About":"Über","Third_party":"Drittanbieter","Preferences":"Einstellungen","Management":"Verwaltung","Apps":"Apps","Tweaks":"Optimierungen","Settings":"Einstellungen","Save":"Speichern","Restore":"Wiederherstellen","Music":"Musik","On":"Ein ","Off":"Aus","Disk_Managment":"Datenträgerverwaltung","Task_Manager":"Task-Manager","Apps_features":"Apps-FunktiOnen","Networks":"Netzwerke","Services":"Dienste","Device_Manager":"Geräte-Manager","Power_Options":"EnergieoptiOnen","System_Info":"Systeminfo","Use_system_setting":"Systemeinstellungen verwenden","Create_desktop_shortcut":"Desktop-Verknüpfung erstellen","Reset_preferences":"Einstellungen zurücksetzen","Reopen_itt_again.":"Bitte ITT erneut öffnen.","Theme":"Thema","Language":"Sprache","MAS":"Microsoft Aktivierungsskripte (MAS)","Win_Office":"Windows / Office ISO herunterladen","IDM":"IDM-Aktivierung","Browsers_extensions":"Browser-Erweiterungen","All":"Alle","Search":"Suchen","Create_restore_point":"Wiederherstellungspunkt erstellen","Portable_Downloads_Folder":"Ordner für tragbare Downloads","Install_msg":"Sind Sie sicher  dass Sie die folgenden Anwendungen instAllieren möchten?","Apply_msg":"Sind Sie sicher dass Sie die folgenden Anpassungen anwenden möchten?","Applying":"Anwenden...","App_empty_select":"Wählen Sie mindestens eine App zur InstAllatiOn aus.","Tweak_empty_select":"Wählen Sie mindestens eine Optimierung zur Anwendung aus.","Please_wait":"Bitte warten ein Prozess läuft im Hintergrund.","Last_update":"Letztes Update","Exit_msg":"Sind Sie sicher dass Sie das Programm schließen möchten? Alle InstAllatiOnen werden abgebrochen.","Happy_birthday":"Alles Gute zum Geburtstag mir!","My_playlist":"Es ist mein Geburtstag und meine Playlist ♪","Empty_save_msg":"Wählen Sie mindestens eine App zum Speichern aus."},"en":{"name":"English","Welcome":"Save time by instAlling multiple programs at Once and boost your Windows performance. Join us in improving this tool and making it better. You can also add your favorite Music  Apps  and Tweaks.","Install":"Install","Apply":"Apply","Downloading":"Downloading...","About":"About","Third_party":"Third-party","Preferences":"Preferences","Management":"Management","Apps":"Apps","Tweaks":"Tweaks","Settings":"Settings","Save":"Save","Restore":"Restore","Music":"Music","On":"On ","Off":"Off","Disk_Managment":"Disk Managment","Task_Manager":"Task Manager","Apps_features":"Apps-Features","Networks":"Networks","Services":"Services","Device_Manager":"Device Manager","Power_Options":"Power OptiOns","System_Info":"System Info","Use_system_setting":"Use system setting","Create_desktop_shortcut":"Create desktop shortcut","Reset_preferences":"Reset_preferences Preferences","Reopen_itt_again":"Please reopen itt again.","Theme":"Theme","Language":"Language","MAS":"Microsoft Activation Scripts (MAS)","Win_Office":"Download Windows / Office ISO","IDM":"IDM ActivatiOn","Browsers_extensions":"Browsers Browsers_extensions","All":"All","Search":"Search","Create_restore_point":"Create a restore point","Portable_Downloads_Folder":"Portable Downloads Folder","Install_msg":"Are you sure you want to install the following App(s)","Apply_msg":"Are you sure you want to apply the following Tweak(s)","Applying":"Applying...","App_empty_select":"Please select at least One app to install.","Tweak_empty_select":"Please select at least One tweak to apply.","Please_wait":"Please wait  a process is running in the background","Last_update":"Last update","Exit_msg":"Are you sure you want to close the program? If there are any instAllatiOns they will be terminated.","Happy_birthday":"Happy Birthday to me!","My_playlist":"It's my Birthday and My Playlist ♪","Empty_save_msg":"Choose at least One app to save it"},"es":{"name":"Español","Welcome":"Ahorra tiempo instalando varios prograMAS a la vez y mejora el rendimiento de tu Windows. Únete a nosotros para mejorar esta herramienta y hacerla aún mejor. También puedes agregar tus aplicaciOnes Musicales y ajustes favoritos.","Install":"Instalar","Apply":"Aplicar","Downloading":"Descargando...","About":"Acerca de","Third_party":"Terceros","Preferences":"Preferencias","Management":"Gestión","Apps":"AplicaciOnes","Tweaks":"Ajustes","Settings":"COnfiguración","Save":"Guardar","Restore":"Restaurar","Music":"Música","On":"Encendido ","Off":"Apagado","Disk_Managment":"Administración de discos","Task_Manager":"Administrador de tareas","Apps_features":"AplicaciOnes-FunciOnes","Networks":"Redes","Services":"Servicios","Device_Manager":"Administrador de dispositivos","Power_Options":"OpciOnes de energía","System_Info":"Información del sistema","Use_system_setting":"Usar la cOnfiguración del sistema","Create_desktop_shortcut":"Crear acceso directo en el escritorio","Reset_preferences":"Restablecer preferencias","Reopen_itt_again.":"Vuelve a abrir ITT.","Theme":"Tema","Language":"Idioma","MAS":"Scripts de activación de Microsoft (MAS)","Win_Office":"Descargar ISO de Windows / Office","IDM":"Activación IDM","Browsers_extensions":"ExtensiOnes del navegador","All":"Todos","Search":"Buscar","Create_restore_point":"Crear un punto de restauración","Portable_Downloads_Folder":"Carpeta de descargas portátiles","Install_msg":"¿Estás seguro de que deseas instalar las siguientes aplicaciOnes?","Apply_msg":"¿Estás seguro de que deseas aplicar los siguientes ajustes?","Applying":"Aplicando...","App_empty_select":"SelecciOna al menos una aplicación para instalar.","Tweak_empty_select":"SelecciOna al menos un ajuste para aplicar.","Please_wait":"Por favorespera un proceso se está ejecutando en segundo plano.","Last_update":"Última actualización","Exit_msg":"¿Estás seguro de que deseas cerrar el programa? Si hay instalaciOnes se interrumpirán.","Happy_birthday":"¡Feliz cumpleaños a mí!","My_playlist":"Es mi cumpleaños y mi lista de reproducción ♪","Empty_save_msg":"Elige al menos una aplicación para guardarla."},"fr":{"name":"Français","Welcome":"Gagnez du temps en instAllant plusieurs programmes à la fois et améliorez les performances de votre Windows. Rejoignez-nous pour améliorer cet outil et le rendre encore meilleur. Vous pouvez également ajouter vos applicatiOns Musicales et vos Tweaks préférés.","Install":"InstAller","Apply":"Appliquer","Downloading":"Téléchargement...","About":"À propos","Third_party":"Tiers","Preferences":"Préférences","Management":"GestiOn","Apps":"ApplicatiOns","Tweaks":"OptimisatiOns","Settings":"Paramètres","Save":"Sauvegarder","Restore":"Restaurer","Music":"Musique","On":"Activé ","Off":"Désactivé","Disk_Managment":"GestiOn des disques","Task_Manager":"GestiOnnaire des tâches","Apps_features":"ApplicatiOns-FOnctiOnnalités","Networks":"Réseaux","Services":"Services","Device_Manager":"GestiOnnaire de périphériques","Power_Options":"OptiOns d'alimentatiOn","System_Info":"Infos système","Use_system_setting":"Utiliser les paramètres système","Create_desktop_shortcut":"Créer un raccourci sur le bureau","Reset_preferences":"Réinitialiser les préférences","Reopen_itt_again.":"Veuillez rouvrir ITT.","Theme":"Thème","Language":"Langue","MAS":"Scripts d'activatiOn Microsoft (MAS)","Win_Office":"Télécharger l'ISO Windows / Office","IDM":"ActivatiOn IDM","Browsers_extensions":"Browsers_extensions de navigateurs","All":"Tout","Search":"Rechercher","Create_restore_point":"Créer un point de restauratiOn","Portable_Downloads_Folder":"Dossier de téléchargements portables","Install_msg":"Êtes-vous sûr de vouloir instAller les applicatiOns suivantes ?","Apply_msg":"Êtes-vous sûr de vouloir appliquer les Tweaks suivants ?","Applying":"ApplicatiOn...","App_empty_select":"Veuillez sélectiOnner au moins une applicatiOn à instAller.","Tweak_empty_select":"Veuillez sélectiOnner au moins un tweak à appliquer.","Please_wait":"Veuillez patienter","Last_update":"Dernière mise à jour  un processus est en cours d'exécutiOn en arrière-plan.","Exit_msg":"Êtes-vous sûr de vouloir fermer le programme ? Si des instAllatiOns sOnt en cours  elles serOnt interrompues.","Happy_birthday":"Joyeux anniversaire à moi !","My_playlist":"C'est mOn anniversaire et ma playlist ♪","Empty_save_msg":"Choisissez au moins une applicatiOn à sauvegarder."},"ga":{"name":"Gaeilge","Welcome":"Sábháil am trí níos mó ná clár amháin a shuiteáil ag an am céanna agus feabhsaigh feidhmíocht do Windows. Bí linn ag feabhsú an uirlis seo agus ag déanamh é níos fearr. Is féidir leat do chuid Apps ceoil agus feabhsúcháin is fearr leat a chur leis freisin.","Install":"Suiteáil","Apply":"Cuir i bhfeidhm","Downloading":"Ag suiteáil...","About":"Faoi","Third_party":"Tríú páirtí","Preferences":"Roghanna","Management":"Bainistíocht","Apps":"Aplaicí","Tweaks":"Feabhsúcháin","Settings":"Socruithe","Save":"Sábháil","Restore":"Athchóirigh","Music":"Ceol","On":"Ar ","Off":"Múchta","Disk_Managment":"Bainistíocht Diosca","Task_Manager":"Bainisteoir Tascanna","Apps_features":"Gnéithe Aipeanna","Networks":"LíOnraí","Services":"Seirbhísí","Device_Manager":"Bainisteoir Gléasanna","Power_Options":"Roghanna Cumhachta","System_Info":"Eolas Córas","Use_system_setting":"Úsáid socrú an chórais","Create_desktop_shortcut":"Cruthaigh gearrthagairt deisce","Reset_preferences":"Athshocraigh Roghanna","Reopen_itt_again.":"Oscail ITT arís le do thoil.","Theme":"Téama","Language":"Teanga","MAS":"Scripteanna Gníomhachtaithe Microsoft (MAS)","Win_Office":"Íoslódáil ISO Windows / Office","IDM":"Gníomhachtú IDM","Browsers_extensions":"Síntí Brabhsálaí","All":"Uile","Search":"Cuardaigh","Create_restore_point":"Cruthaigh pointe athchóirithe","Portable_Downloads_Folder":"Fillteán Íoslódálacha Inaistrithe","Install_msg":"An bhfuil tú cinnte gur mhaith leat na feidhmchláir seo a shuiteáil","Apply_msg":"An bhfuil tú cinnte gur mhaith leat na feabhsúcháin seo a chur i bhfeidhm","Applying":"Cur i bhfeidhm...","App_empty_select":"Roghnaigh ar a laghad aip amháin le suiteáil.","Tweak_empty_select":"Roghnaigh ar a laghad feabhsúchán amháin le cur i bhfeidhm.","Please_wait":"Fan le do thoil tá próiseas ag rith sa chúlra","Last_update":"An nuashOnrú deireanach","Exit_msg":"An bhfuil tú cinnte gur mhaith leat an clár a dhúnadh? Má tá suiteálacha ar siúl beidh siad curtha ar ceal.","Happy_birthday":"Breithlá ShOna domsa!","My_playlist":"Is é mo Bhreithlá é agus Mo Phléaráca ♪","Empty_save_msg":"Roghnaigh ar a laghad aip amháin chun é a shábháil"},"ko":{"name":"한국어","Welcome":"여러 프로그램을 한 번에 설치하여 시간을 절약하고 Windows 성능을 향상시킵니다. 도구를 개선하고 우리와 함께 훌륭하게 만들어 보세요.","System_Info":"시스템 정보","Power_Options":"전원 옵션","Device_Manager":"장치 관리자","Services":"서비스","Networks":"네트워크","Apps_features":"앱 기능","Task_Manager":"작업 관리자","Disk_Managment":"디스크 관리","Install":"설치","Apply":"적용","Downloading":"다운로드 중","About":"정보","Third_party":"외부","Preferences":"환경 설정","Management":"관리","Apps":"앱","Tweaks":"설정","Settings":"설정","Save":"선택한 앱 저장","Restore":"선택한 앱 복원","Music":"음악","On":"켜기","Reset_preferences":"환경 설정 초기화","Off":"끄기","Dark":"다크","Light":"라이트","Use_system_setting":"시스템","Create_desktop_shortcut":"바탕화면 바로 가기 만들기","Reopen_itt_again.":"ITT를 다시 열어주세요.","Theme":"테마","Language":"언어","MAS":"Microsoft 활성화 스크립트 (MAS)","Win_Office":"Windows / Office ISO 다운로드","IDM":"IDM 활성화","Browsers_extensions":"브라우저 확장 프로그램","All":"모두","Create_restore_point":"복원 지점 생성","Portable_Downloads_Folder":"휴대용 다운로드 폴더","Install_msg":"선택한 앱을 설치하시겠습니까","Apply_msg":"선택한 조정 사항을 적용하시겠습니까","instAlling":"설치 중..","Applying":"적용 중..","App_empty_select":"설치할 적어도 하나의 앱을 선택하십시오","Tweak_empty_select":"조정 사항 적용 대기 중","Please_wait":"배경에서 프로세스가 진행 중입니다. 잠시 기다려주세요.","Last_update":"마지막 업데이트","Exit_msg":"프로그램을 종료하시겠습니까? 진행 중인 설치가 있으면 중단됩니다.","Happy_birthday":"생일 축하합니다 Emad!","My_playlist":"제 생일과 제 플레이리스트 ♪"},"ru":{"name":"Русский","Welcome":"Сэкономьте время устанавливая несколько программ одновременно и улучшите производительность Windows. Присоединяйтесь к нам для улучшения этого инструмента и его совершенствования. Вы также можете добавить свои любимые музыкальные приложения и настройки.","Install":"Установить","Apply":"Применить","Downloading":"Загрузка...","About":"О нас","Third_party":"Сторонние","Preferences":"Настройки","Management":"Управление","Apps":"Приложения","Tweaks":"Настройки","Settings":"Параметры","Save":"Сохранить","Restore":"Восстановить","Music":"Музыка","On":"Вкл ","Off":"Выкл","Disk_Managment":"Управление дисками","Task_Manager":"Диспетчер задач","Apps_features":"Приложения-Функции","Networks":"Сети","Services":"Сервисы","Device_Manager":"Диспетчер устройств","Power_Options":"Энергопитание","System_Info":"Информация о системе","Use_system_setting":"Использовать системные настройки","Create_desktop_shortcut":"Создать ярлык на рабочем столе","Reset_preferences":"Сбросить настройки","Reopen_itt_again.":"Пожалуйста перезапустите ITT.","Theme":"Тема","Language":"Язык","MAS":"Microsoft ActivatiOn Scripts (MAS)","Win_Office":"Скачать ISO Windows / Office","IDM":"Активация IDM","Browsers_extensions":"Расширения для браузеров","All":"Все","Search":"Поиск","Create_restore_point":"Создать точку восстановления","Portable_Downloads_Folder":"Папка для портативных загрузок","Install_msg":"Вы уверены что хотите установить следующие приложения?","Apply_msg":"Вы уверены что хотите применить следующие настройки?","Applying":"Применение...","App_empty_select":"Выберите хотя бы одно приложение для установки.","Tweak_empty_select":"Выберите хотя бы одну настройку для применения.","Please_wait":"Подождите выполняется фоновый процесс.","Last_update":"Последнее обновление","Exit_msg":"Вы уверены что хотите закрыть программу? Все установки будут прерваны.","Happy_birthday":"С Днем Рождения меня!","My_playlist":"Это мой день рождения и мой плейлист ♪","Empty_save_msg":"Выберите хотя бы одно приложение для сохранения."},"tr":{"name":"Türkçe","Welcome":"Birden fazla programı aynı anda yükleyerek zaman kazanın ve Windows performansınızı artırın. Bu aracı geliştirmek ve daha da iyileştirmek için bize katılın. Ayrıca favori müzik uygulamalarınızı ve ayarlarınızı da ekleyebilirsiniz.","Install":"Yükle","Apply":"Uygula","Downloading":"İndiriliyor...","About":"Hakkında","Third_party":"Üçüncü Taraf","Preferences":"Tercihler","Management":"Yönetim","Apps":"Uygulamalar","Tweaks":"İnce Ayarlar","Settings":"Ayarlar","Save":"Kayıt Et","Restore":"Geri Yükle","Music":"Müzik","On":"Açık ","Off":"Kapalı","Disk_Managment":"Disk Yönetimi","Task_Manager":"Görev Yöneticisi","Apps_features":"Uygulamalar-Özellikler","Networks":"Ağlar","Services":"Hizmetler","Device_Manager":"Aygıt Yöneticisi","Power_Options":"Güç Seçenekleri","System_Info":"Sistem Bilgisi","Use_system_setting":"Sistem ayarlarını kullan","Create_desktop_shortcut":"MASaüstü kısayolu oluştur","Reset_preferences":"Tercihleri sıfırla","Reopen_itt_again.":"Lütfen ITT'yi tekrar açın.","Theme":"Tema","Language":"Dil","MAS":"Microsoft Etkinleştirme Betikleri (MAS)","Win_Office":"Windows / Office ISO İndir","IDM":"IDM Etkinleştirme","Browsers_extensions":"Tarayıcı Eklentileri","All":"Tümü","Search":"Ara","Create_restore_point":"Geri yükleme noktası oluştur","Portable_Downloads_Folder":"Taşınabilir İndirilenler Klasörü","Install_msg":"Aşağıdaki uygulamaları yüklemek istediğinizden emin misiniz?","Apply_msg":"Aşağıdaki ayarları uygulamak istediğinizden emin misiniz?","Applying":"Uygulanıyor...","App_empty_select":"Lütfen yüklemek için en az bir uygulama seçin.","Tweak_empty_select":"Lütfen uygulamak için en az bir ince ayar seçin.","Please_wait":"Lütfen bekleyin arka planda bir işlem çalışıyor.","Last_update":"SOn güncelleme","Exit_msg":"Programı kapatmak istediğinizden emin misiniz? Herhangi bir kurulum varsa durdurulacak.","Happy_birthday":"Kendime Mutlu Yıllar!","My_playlist":"Benim Doğum Günüm ve Benim Çalma Listem ♪","Empty_save_msg":"Kaydetmek için en az bir uygulama seçin."},"zh":{"name":"中文","Welcome":"通过一次安装多个程序节省时间并提升您的Windows性能。加入我们，改进工具，使其更加优秀。","System_Info":"系统信息","Power_Options":"电源选项","Device_Manager":"设备管理器","Services":"服务","Networks":"网络","Apps_features":"应用特性","Task_Manager":"任务管理器","Disk_Managment":"磁盘管理","Install":"安装","Apply":"应用","Downloading":"下载中","About":"关于","Third_party":"第三方","Preferences":"偏好","Management":"管理","Apps":"应用","Tweaks":"调整","Settings":"设置","Save":"保存选定应用","Restore":"恢复选定应用","Music":"音乐","On":"开启","Off":"关闭","Reset_preferences":"重置偏好设置","Dark":"深色","Light":"浅色","Use_system_setting":"系统","Create_desktop_shortcut":"创建桌面快捷方式","Reopen_itt_again.":"请重新打开ITT。","Theme":"主题","Language":"语言","MAS":"Microsoft 激活脚本 (MAS)","Win_Office":"下载 Windows / Office ISO","IDM":"IDM 激活","Browsers_extensions":"浏览器扩展","All":"都","Create_restore_point":"创建还原点","Portable_Downloads_Folder":"便携下载文件夹","Install_msg":"是否要安装选定的应用","Apply_msg":"是否要应用选定的调整","instAlling":"安装中..","Applying":"应用中..","App_empty_select":"请选择至少一款要安装的应用","Tweak_empty_select":"请等待调整应用完成","Please_wait":"请等待，后台有进程在进行中。","Last_update":"最后更新","Exit_msg":"您确定要关闭程序吗？如果有任何安装正在进行，它们将被终止。","Happy_birthday":"生日快乐 Emad!","My_playlist":"这是我的生日和我的播放列表 ♪"}}}

'@ | ConvertFrom-Json
$itt.database.OST = @'
{
  "Tracks": [
    {
      "name": "Further - Far cry-3",
      "url": "https://eta.vgmtreasurechest.com/soundtracks/far-cry-3/iqgdbfrhtw/17.%20Further%20%28feat.%20Serena%20McKinney%29.mp3"
    },
    {
      "name": "Grand Theft Auto 4 Theme Song",
      "url": "https://emadadel4.github.io/sounds/Michael Hunter - Soviet Connection — the Theme from Grand Theft Auto IV.mp3"
    },
    {
      "name": "Mass Effect-3 - End of Cycle",
      "url": "https://vgmsite.com/soundtracks/mass-effect-3-extended-cut/eyophevp/02.%20An%20End%2C%20Once%20And%20For%20All%20%28Extended%20Cut%29.mp3"
    },
    {
      "name": "Intro (Somerville Original Soundtrack)",
      "url": "https://kappa.vgmsite.com/soundtracks/somerville-2022/naszqoqnhr/01.%20Intro%20%28Somerville%20Original%20Soundtrack%29%20%28feat.%20Dominique%20Charpentier%29.mp3"
    },
    {
      "name": "Kate Chruscicka - Requiem For A Dream",
      "url": "https://emadadel4.github.io/sounds/Kate Chruscicka - Requiem for a Dream.mp3"
    },
    {
      "name": "Hans Zimmer - Time",
      "url": "https://emadadel4.github.io/sounds/Hans Zimmer - Time.mp3"
    },
    {
      "name": "Westworld - Exit Music (For a Film)",
      "url": "https://emadadel4.github.io/sounds/Ramin Djawadi - Exit Music (For a Film).mp3"
    },
    {
      "name": "Homelander in Hallway",
      "url": "https://emadadel4.github.io/sounds/Homelander in Hallway.mp3"
    },
    {
      "name": "Grand Theft Auto San Andreas Official Theme",
      "url": "https://emadadel4.github.io/sounds/Grand Theft Auto_ San Andreas Official Theme Song.mp3"
    },
    {
      "name": "1.0_8-whatsyourask.m4p",
      "url": "https://emadadel4.github.io/sounds/1.0_8-whatsyourask.m4p.mp3"
    },
    {
      "name": "Ludovico Einaudi - Experience",
      "url": "https://emadadel4.github.io/sounds/Ludovico Einaudi, Daniel Hope, I Virtuosi Italiani - Experience.mp3"
    },
    {
      "name": "Hans Zimmer - No Time for Caution ",
      "url": "https://emadadel4.github.io/sounds/Hans Zimmer - No Time for Caution.mp3"
    },
    {
      "name": "Cyberpunk - Rebel Path",
      "url": "https://eta.vgmtreasurechest.com/soundtracks/cyberpunk-2077-original-game-score/zalnnwrhwh/1-03%20The%20Rebel%20Path.mp3"
    },
    {
      "name": "Assassin Creed II - Ezio's Family",
      "url": "https://emadadel4.github.io/sounds/Jesper Kyd, Assassin's Creed - Ezio's Family.mp3"
    },
    {
      "name": "Little Nightmares II (Main Theme)",
      "url": "https://emadadel4.github.io/sounds/Little Nightmares II (Main Theme).mp3"
    },
    {
      "name": "Imagine Music - Doom",
      "url": "https://emadadel4.github.io/sounds/Imagine Music - Doom.mp3"
    },
    {
      "name": "The Leftovers  The Departure Suite",
      "url": "https://emadadel4.github.io/sounds/The Leftovers  The Departure Suite.mp3"
    },
    {
      "name": "Hollow Knight",
      "url": "https://emadadel4.github.io/sounds/Hollow Knight.mp3"
    },
    {
      "name": "تلك قضية - كايروكي",
      "url": "https://emadadel4.github.io/sounds/Telk Qadeya.mp3"
     }
  ],
  "Favorite": [
    {
      "name": "Radiohead -  Exit Music (For a Film)",
      "url": "https://archive.org/download/06-everything-in-its-right-place-live-in-france/OK%20Computer/04%20Exit%20Music%20%28For%20a%20Film%29.mp3"
    },
    {
      "name": "Billie Eilish - No Time To Die",
      "url": "https://archive.org/download/06-everything-in-its-right-place-live-in-france/OK%20Computer/04%20Exit%20Music%20%28For%20a%20Film%29.mp3"
    },
    {
      "name": "Imagine Dragons - Roots",
      "url": "https://archive.org/download/ImagineDragons_20190510_0456/Imagine%20Dragons%20-%20Roots.mp3"
    },
    {
      "name": "Imagine Dragons - Believer",
      "url": "https://archive.org/download/bunchofimaginedragons/14%20Imagine%20Dragons%20-%20Believer.mp3"
    },
    {
      "name": "Imagine Dragons - Thunder",
      "url": "https://archive.org/download/imaginedragonsmusicalbum/Imagine%20Dragons%20-%20Thunder.mp3"
    },
    {
      "name": "Imagine Dragons - Birds",
      "url": "https://archive.org/download/bunchofimaginedragons/14%20Imagine%20Dragons%20-%20Birds.mp3"
    },
    {
      "name": "Kxllswxtch - WASTE",
      "url": "https://archive.org/download/rock-playlist_202305/WASTE.mp3"
    },
    {
      "name": "Imagine Dragons - Lonely",
      "url": "https://archive.org/download/discography-imagine-dragons/discography%20Imagine%20Dragons/MP3%20320%20Kbps/05Imagine%20Dragons%20-%20Mercury%20-%20Act%201/03%20Lonely.mp3"
    },
    {
      "name": "Sharks - Imagine Dragons",
      "url": "https://archive.org/download/discography-imagine-dragons/discography%20Imagine%20Dragons/MP3%20320%20Kbps/06Imagine%20Dragons%20-%20Mercury%20-%20Act%202/03%20Sharks.mp3"
    },
    {
      "name": "Roma - Cairokee",
      "url": "https://archive.org/download/Cairokee-Roma/07%20-%20Roma.mp3"
    },
    {
      "name": "Sigrid - Everybody Knows",
      "url": "https://archive.org/download/justiceleagueflac/Danny%20Elfman%20-%20Justice%20League%20%28Original%20Motion%20Picture%20Soundtrack%29/01%20-%20Everybody%20Knows.mp3"
    }
  ],
  "Otobers":[
   {
    "name": "محمد عساف - انا دمي فلسطيني",
    "url": "https://emadadel4.github.io/sounds/Falstiny.mp3"
   },
   {
    "name": "تلك قضية - كايروكي",
    "url": "https://emadadel4.github.io/sounds/Telk Qadeya.mp3"
   },
   {
    "name": "Rajieen",
    "url": "https://emadadel4.github.io/sounds/Rajieen.mp3"
   }
  ]
}

'@ | ConvertFrom-Json
$itt.database.Quotes = @'
{
  "Quotes": [
    {
      "name": "Rajeen ",
      "type": "music",
      "text": "صوتي حياة وانا واقف وحدي، العالم ضدي وانا ما اخشاه"
    },
    {
      "type": "quote",
      "text": "إما تموت بطلا، أو تعيش طويلاً حتى ترى نفسك اصبحت الشرير"
    },
    {
      "type": "quote",
      "text": "بعض الرجال يريدون فقط مشاهدة العالم يحترق"
    },
    {
      "type": "quote",
      "text": "أنت دائما تخشى ما لا تفهمه"
    },
    {
      "type": "quote",
      "text": "التعاون مع الشر لا يجعلك تفوز. إنه يجعلك مثله"
    },
    {
      "type": "quote",
      "text": "القتال الحقيقي هو دائمًا ضد الذات"
    },
    {
      "type": "quote",
      "text": "الوحدة هي أسوأ أشكال العقوبة"
    },
    {
      "type": "quote",
      "text": "الجمال الحقيقي لا يكمن في المظهر الخارجي، بل في النية والروح"
    },
    {
      "type": "quote",
      "text": "ليس كل ما نخاف منه سيئًا، وليس كل ما نحبه جيدًا"
    },
    {
      "type": "quote",
      "text": "ظننت أنه يمكننا أن نكون رجالاً شرفاء في زمن غير شريف"
    },
    {
      "type": "quote",
      "text": "يمكنك أن تعطي رجلاً مسدسًا ليسرق بنكًا، لكن أعطه بنكًا يمكنه سرقة العالم"
    },
    {
      "type": "quote",
      "text": "أنت تعتقد أن الظلام هو حليفك لكنك تبنيت الظلام , انا لقد ولدت فيه"
    },
    {
      "type": "quote",
      "text": "لا يغرنك من تكلم حسناً عنك ولا يؤذيك من تكلم سيئاً عليك"
    },
    {
      "type": "quote",
      "text": "اختر أن تكون شمعة تضيء دروب الآخرين، ولا تكن ظلامًا يعكر جوهر الحياة"
    },
    {
      "type": "quote",
      "text": "النية خير معيار للأفعال"
    },
    {
      "type": "quote",
      "text": "الإيمان هو أن ترى الشيء الذي لا يمكن رؤيته بالعين"
    },
    {
      "type": "quote",
      "text": "الحقيقة تجعلك حرًا"
    },
    {
      "type": "quote",
      "text": "العدالة شيئ و القانون شيئ"
    },
    {
      "type": "quote",
      "text": "الحرية لا تُعطى بل تأخذ"
    },
    {
      "type": "quote",
      "text": "ما أخذ بالقوة لا يٌسترد إلا بالقوة"
    },
    {
      "type": "quote",
      "text": "الجهل سيئ و من صناعة الانظمة"
    },
    {
      "type": "quote",
      "text": "كل ما احلم به جرفته الامواج بعيدا"
    },
    {
      "type": "quote",
      "text": "من جاءني رحيما بادلته احتراما"
    },
    {
      "type": "quote",
      "text": "ولدت من جديد حينما رأيت ذالك"
    },
    {
      "type": "quote",
      "text": "الوطنية للفقراء و الوطن للاغنياء"
    },
    {
      "type": "quote",
      "text": "حين انتهيت من بناء قاربي جف البحر"
    },
    {
      "type": "quote",
      "text": "المشاكل لن تنتهي هكذا الدنيا"
    },
    {
      "type": "quote",
      "text": "البطولة لا تأتي من القوة البدنية، بل من الإرادة والعزم"
    },
    {
      "type": "quote",
      "text": "القوة ليست في القدرة على تحمل الصعاب، بل في القدرة على التغلب عليها"
    },
    {
      "type": "quote",
      "text": "عليك أن تتحطم قبل أن تتعلم كيف تقوم مرة أخرى"
    },
    {
      "type": "quote",
      "text": "الإيمان بالمستحيل هو البداية لتحقيق المعجزات"
    },
    {
      "type": "quote",
      "text": "الكون يحتفظ بأسرار لا يمكن للعقل البشري فهمها بأكملها"
    },
    {
      "type": "quote",
      "text": "البقاء لا يعني شيئًا إذا كانت الحياة بلا معنى"
    },
    {
      "type": "quote",
      "text": "عندما ننظر إلى السماء، نرى ليس فقط النجوم بل أيضًا أحلامنا وآمالنا"
    },
    {
      "type": "quote",
      "text": "العالم ينقسم إلى طرفين: أولئك الذين لديهم القوة، وأولئك الذين يسعون للقوة"
    },
    {
      "type": "quote",
      "text": "لقد قالوا إن الحقيقة تضر، ولكنهم لم يذكروا أن الكذب يؤلم أكثر"
    },
    {
      "type": "quote",
      "text": "الموت ليس الأسوأ في الحياة. الأسوأ هو ما يموت به الإنسان دون أن يعيش"
    },
    {
      "type": "quote",
      "text": "عندما نقف معًا، نحن قوة لا يمكن أن تُقهر"
    },
    {
      "type": "quote",
      "text": "كل شيء في الحياة يتم الدفع ثمنه، لكن بعض الأشياء لا يمكن شراؤها بالمال"
    },
    {
      "type": "quote",
      "text": "الحقيقة ليست دائماً واضحة، لكنها دائماً موجودة"
    },
    {
      "type": "quote",
      "text": "الجشع هو موتك السريع، والغباء هو رصاصتك الخاصة"
    },
    {
      "type": "quote",
      "text": "الحياة ليست سهلة، ولكن الصعوبات تجعلنا أقوى"
    },
    {
      "type": "quote",
      "text": "تموت البراءة وتحيا الكلاب"
    },
    {
      "type": "quote",
      "text": "رجال الحق قالو الصابرون نالوا والذهن حامل لما لا تحمل الجبال"
    },
    {
      "type": "quote",
      "text": "أردتم السلام , فأشعلنا حربا في الخفاء"
    },
    {
      "type": "quote",
      "text": "أنت لأ تخاف الموت أنت ترحب به"
    },
    {
      "type": "quote",
      "text": "لاستغلال خوف الآخرين، عليك أن تسيطر على خوفك"
    },
    {
      "type": "quote",
      "text": "حرية كذابة، عالم إستبدادي"
    },
    {
      "type": "quote",
      "text": "رَحْمَتِي وَسِعَتْ كُلَّ شَيْءٍ"
    },
    {
      "type": "quote",
      "text": "عندما تتبول الأنظمة علي الشعوب تتسارع الصحافة لإقناعهم بانها مطر و رجال الدين بانها طاهرة"
    },
    {
      "type": "quote",
      "text": "عايش في أكبر سجن بس من جوايا حر"
    },
    {
      "type": "quote",
      "text": "قلبي نطق بالحقيقة بالخيانة إتوصف"
    },
    {
      "type": "quote",
      "text": "الحقيقة هي، أن الأشياء نادراً ما تسير كما نريدها"
    },
    {
      "type": "quote",
      "text": "الحظ ليس عادلاً، ولكن العالم ليس كذلك أيضًا"
    },
    {
      "type": "quote",
      "text": "الحرية تأتي بثمن. وأحياناً، تكون الكلفة مرتفعة للغاية"
    },
    {
      "type": "quote",
      "text": "الأشياء التي نحبها أكثر، هي الأشياء التي نفقدها"
    },
    {
      "type": "quote",
      "text": "أصغر الاصوات بإمكانها أن تصبح عظيمة"
    },
    {
      "type": "quote",
      "text": "هل انت واحد ام صفر؟"
    },
    {
      "type": "quote",
      "text": "حياتي جعلتني كالميت الحي لكن انعكاسي اظهر لي مازلت على قيد الحياة"
    },
    {
      "type": "quote",
      "text": "المقاومه ما هي الا نتاج للقهر والظلم والاستبداد"
    },
    {
      "type": "quote",
      "text": "لقد خلقنا الله أحراراً، ولم يخلقنا تراثاً أو عقاراً"
    },
    {
      "type": "quote",
      "text": "الرأسمالية هي آلة تعمل على سحق الأمل لصالح الجشع"
    },
    {
      "type": "quote",
      "text": "الرأسمالية تجعل من المال هدفا وليس وسيلة"
    },
    {
      "type": "quote",
      "text": "الظلم يولد الطغيان والمقاومة"
    },
    {
      "type": "quote",
      "text": "لا يمكن لأي قوة على وجه الأرض أن تقهر روحاً متمسكة بالإيمان في الحق"
    },
    {
      "type": "quote",
      "text": "إذا صَرَختَ فأَسمِع وإذا ضَرَبتَ فأوجِع، فإن العَاقِبة واحِدة"
    },
    {
      "type": "quote",
      "text": "!لا يتعلق الأمر بما أريده، بل بما هو مُنصف"
    },
    {
      "type": "quote",
      "text": "الشيء الوحيد الذي يخشونه هو أنت"
    },
    {
      "type": "quote",
      "text": "أبحث عن الوسائل لمحاربة الظلم، لأحول الخوف ضد أولئك الذين يفترسون الضعفاء"
    },
    {
      "type": "quote",
      "text": "أعتقد ألشيئ الذي لا يقتلك يجعلك ببساطة... أكثر غرابة"
    },
    {
      "type": "quote",
      "text": "إنهم يحتاجون إليك الآن، لكن عندما لا يعودون بحاجة إليك، سيتركونك وحيد"
    },
    {
      "type": "quote",
      "text": "الرجل المناسب في المكان الخطأ يمكن أن يحدث فرقاً كبيراً في العالم"
    },
    {
      "type": "quote",
      "text": "The right man in the wrong place can make all the difference in the world",
      "name": "Half-Life 2"
    },
    {
      "type": "quote",
      "text": "We're Thieves In A World That Don't Want Us No More",
      "name": "Arthur Morgan"
    },
    {
      "type": "quote",
      "text": "I Have A Plan",
      "name": "Dutch"
    },
    {
      "type": "quote",
      "text": "In A World Without Gold, We Might Have Been Heroes!",
      "name": "Blackbeard"
    },
    {
      "type": "quote",
      "text": "We Are Free To Follow Our Own Path. There Are Those Who Will Take That Freedom From Us",
      "name": "Ezio Auditore"
    },
    {
      "type": "quote",
      "text": "Learning is knowledge, and knowledge is freedom and power",
      "name": "Altaïr"
    },
    {
      "type": "quote",
      "text": "They need you right now, but when they don't, they'll cast you out",
      "name": "The dark knight"
    },
    {
      "type": "quote",
      "text": "I Believe That Whatever Doesn't Kill You, Simply Makes You Stranger",
      "name": "The dark knight"
    },
    {
      "type": "quote",
      "text": "Some men just want to watch the world burn",
      "name": "Alfred"
    },
    {
      "type": "quote",
      "text": "You either die a hero or live long enough to see yourself become the villain",
      "name": "Harvey dent"
    },
    {
      "type": "quote",
      "text": "Give a man a gun and he can rob a Bank. Give a man a Bank and he can rob the world",
      "name": "Mr. Robot"
    },
    {
      "type": "quote",
      "text": "If you can't lift the injustice, at least tell everyone about it"
    },
    {
      "type": "quote",
      "text": "Live together, die alone",
      "name": "Lost"
    },
    {
      "type": "quote",
      "text": "No one cared who I was, until I put on the mask",
      "name": "Bane"
    },
    {
      "type": "quote",
      "text": "Peace has cost you your strength. Victory has defeated you",
      "name": "Bane"
    },
    {
      "type": "quote",
      "text": "Why Do We Fall? So That We Can Learn To Pick Ourselves Up",
      "name": "Alfred"
    },
    {
      "type": "quote",
      "text": "نعيش معًا، او الموت وحيدا"
    },
    {
      "type": "quote",
      "text": "لم يهتم أحد بمن أكون، حتى ارتديت القناع"
    },
    {
      "type": "quote",
      "text": "اذا كنت لا تستطيع رفع الظلم ، على الأقل أخبر الجميع عنه"
    },
    {
      "type": "quote",
      "text": "تم تخدير الشعوب بعد أن سرقوا أموالهم, بتوظيف الدين لإقناع الفقراء بإنهم سيدخلون الجنة قبل الاغنياء"
    },
    {
      "type": "quote",
      "text": "كل خطأ في الكود هو فرصة للتعلم والنمو، وليس مجرد فشل"
    },
    {
      "type": "quote",
      "text": "The devil is sitting on the throne with his assistants (USA)"
    },
    {
      "type": "quote",
      "text": "!جميع حدود الدول تحت قدمي"
    },
    {
      "type": "quote",
      "text": "حدود الدول هي فكرة استعمارية لتفريق الامم و جلعها في مواجهة بعضها البعض"
    },
    {
      "type": "quote",
      "text": "أكثر الحدود تحدياً هي تلك التي نضعها لأنفسنا. حدود الأفكار والخوف من الآخر"
    },
    {
      "type": "music",
      "text": "مت حر وما تعيشٌ مسلّم",
      "name": "Telk Qadeya"
    },
    {
      "type": "music",
      "text": "كيف أصدق هذا العالم لما بيحكي عن الإنسان؟ شايف أم بتبكي ضناها علشان مات في الغارة جعان",
      "name": "Telk Qadeya"
    },
    {
      "text": "بدأت اتغير وانا في نص الرحلة فهمت نفسي وانا في قلب الوحدة",
      "name": "البوصلة ضاعت",
      "type": "music"
    }
  ]
}

'@ | ConvertFrom-Json
$itt.database.Settings = @'
[
  {
      "Content": "Show file extensions",
      "Name":"ToggleShowExt",
      "description": "Show file extensions in Windows displays the suffix at the end of file names (like .txt, .jpg, .exe), indicating file types and helping users identify which programs can open them, simplifying file management and differentiation",
      "category": "Protection"
  },
  {
    "Content": "Show Super Hidden",
    "Name":"ToggleShowHidden",
    "description": "Show Super Hidden displays files and folders in Windows that are hidden beyond standard hidden files, often system files to prevent accidental changes",
    "category": "Protection"
  },
  {
    "Content": "Dark Mode",
    "Name":"ToggleDarkMode",
    "description": "Dark Mode is a setting that changes the screen to darker colors, reducing eye strain and saving battery life on OLED screens",
    "category": "Personalize"
  },
  {
    "Content": "NumLook",
    "Name":"ToggleNumLook",
    "description": "Toggle the Num Lock key state when your computer starts",
    "category": "Protection"
  },
  {
    "Content": "Sticky Keys",
    "Name":"ToggleStickyKeys",
    "description": "Sticky keys is an accessibility feature of some graphical user interfaces which assists users who have physical disabilities or help users reduce repetitive strain injury",
    "category": "Accessibility"
  },
  {
    "Content": "Mouse Acceleration",
    "Name":"MouseAcceleration",
    "description": "Cursor movement is affected by the speed of your physical mouse movements",
    "category": "Accessibility"
  },
  {
    "Content": "End Task On Taskbar Windows 11",
    "Name":"EndTaskOnTaskbar",
    "description": "Option to end task when right clicking a program in the taskbar",
    "category": "Accessibility"
  },
  {
    "Content": "Clear Page File At Shutdown",
    "Name":"ClearPageFileAtShutdown",
    "description": "Page file in Windows removes sensitive data stored in virtual memory when the system shuts down. This enhances security by ensuring that the data in the page file (which may contain passwords, encryption keys, or other sensitive information) is wiped out and cannot be accessed after rebooting. However, it can increase shutdown time",
    "category": "Storage "
  },
  {
    "Content": "Auto End Tasks",
    "Name":"AutoEndTasks",
    "description": "Automatically end tasks that are not responding",
    "category": "Performance"
  },
  {
    "Content": "Performance Options",
    "Name":"VisualFXSetting",
    "description": "Adjust for best performance",
    "category": "Performance"
  },
  {
    "Content": "Launch To This PC",
    "Name":"LaunchTo",
    "description": "Changing the default opening location of File Explorer in Windows allows it to open directly to This PC instead of Quick Access, making it easier to quickly access main drives and system folders",
    "category": "Accessibility"
  }
]
'@ | ConvertFrom-Json
$itt.database.Tweaks = @'
[
  {
    "Name": "Disk cleanup",
    "Description": "Clean temporary files that are not necessary",
    "Category": "Storage",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "\r\n Remove-Item -Path \"$env:LOCALAPPDATA\\Temp\\*\" -Recurse -Force -ErrorAction SilentlyContinue\r\n        Remove-Item -Path \"C:\\Windows\\Prefetch\\*\" -Recurse -Force -ErrorAction SilentlyContinue\r\n        Stop-Service -Name wuauserv -Force\r\n        takeown /f C:\\Windows\\SoftwareDistribution\\Download /r /d y\r\n        icacls C:\\Windows\\SoftwareDistribution\\Download /grant administrators:F /t\r\n        Remove-Item -Path \"C:\\Windows\\SoftwareDistribution\\Download\\*\" -Recurse -Force -ErrorAction SilentlyContinue\r\n        cleanmgr.exe /d C: /VERYLOWDISK /sagerun:1 Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase\r\n        cleanmgr.exe /d C: /sagerun:1\r\n        cleanmgr.exe /sagerun:1\r\n        Dism.exe /online /Cleanup-Image /StartComponentCleanup\r\n        cleanmgr.exe /d C: /VERYLOWDISK\r\n        Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase\r\n        Start-Service -Name wuauserv\r\n      "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "System File Checker",
    "Description": "sfc /scannow Use the System File Checker tool to repair missing or corrupted system files",
    "Category": "Fixer",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "\r\n        Chkdsk /scan\r\n        sfc /scannow\r\n        DISM /Online /Cleanup-Image /Restorehealth\r\n        sfc /scannow\r\n      "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Clean Taskbar",
    "Description": "Disable the (News and interests) and (People icon) Show Search icon only for Windows 10/11",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Feeds",
        "Name": "ShellFeedsTaskbarViewMode",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "SearchboxTaskbarMode",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "2"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People",
        "Name": "PeopleBand",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "HideSCAMeetNow",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "NoNewsAndInterests",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Remove Windows 10/11 Bloatware",
    "Description": "A selection of pre-installed apps, including productivity tools, games, communication apps, and entertainment software like Xbox, Microsoft News, TikTok, and more, will be removed.",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [
      "Microsoft.Copilot",
      "Microsoft.BingNews",
      "Microsoft.WindowsCamera",
      "Microsoft.Getstarted",
      "Microsoft.BingWeather_1.0.6.0_x64__8wekyb3d8bbwe",
      "MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy",
      "Microsoft.GetHelp",
      "Microsoft.AppConnector",
      "Microsoft.BingFinance",
      "Microsoft.XboxGamingOverlay",
      "Microsoft.BingTranslator",
      "Microsoft.BingHealthAndFitness",
      "Microsoft.BingTravel",
      "Microsoft.MinecraftUWP",
      "Microsoft.GamingServices",
      "Microsoft.BingFoodAndDrink",
      "Microsoft.BingWeather",
      "Microsoft.Messaging",
      "Microsoft.Microsoft3DViewer",
      "Microsoft.MicrosoftOfficeHub",
      "Microsoft.MicrosoftSolitaireCollection",
      "Microsoft.NetworkSpeedTest",
      "Microsoft.News",
      "Microsoft.549981C3F5F10",
      "Microsoft.Office.Lens",
      "Microsoft.Office.OneNote",
      "Microsoft.Office.Sway",
      "Microsoft.OneConnect",
      "Microsoft.People",
      "Microsoft.Print3D",
      "Microsoft.RemoteDesktop",
      "Microsoft.SkypeApp",
      "Microsoft.StorePurchaseApp",
      "Microsoft.Office.Todo.List",
      "Microsoft.Whiteboard",
      "Microsoft.WindowsAlarms",
      "Microsoft.WindowsCamera",
      "Microsoft.windowscommunicationsapps",
      "Microsoft.WindowsFeedbackHub",
      "Microsoft.Wallet",
      "Microsoft.WindowsMaps",
      "Microsoft.YourPhone",
      "Microsoft.WindowsSoundRecorder",
      "Microsoft.Xbox.TCUI",
      "Microsoft.XboxApp",
      "Microsoft.XboxGameOverlay",
      "Microsoft.GamingApp",
      "Microsoft.XboxIdentityProvider",
      "Microsoft.XboxSpeechToTextOverlay",
      "Microsoft.Windows.Cortana",
      "Microsoft.ScreenSketch",
      "Microsoft.Windows.DevHome",
      "Microsoft.MixedReality.Portal",
      "Microsoft.MSPaint",
      "Microsoft.Getstarted",
      "Microsoft.ZuneVideo",
      "Microsoft.ZuneMusic",
      "EclipseManager",
      "ActiproSoftwareLLC",
      "AdobeSystemsIncorporated.AdobePhotoshopExpress",
      "Duolingo-LearnLanguagesforFree",
      "PandoraMediaInc",
      "CandyCrush",
      "BubbleWitch3Saga",
      "Wunderlist",
      "Flipboard",
      "Twitter",
      "Facebook",
      "Minecraft",
      "Royal Revolt",
      "Sway",
      "Microsoft.549981",
      "Microsoft.MicrosoftStickyNotes",
      "TikTok.TikTok_8wekyb3d8bbwe",
      "TikTok",
      "Microsoft.NetworkSpeedTest"
    ],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Fix Stutter in games",
    "Description": "Fix Stutter in Games (Disable GameBarPresenceWriter). Windows 10/11",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "irm https://raw.githubusercontent.com/emadadel4/Fix-Stutter-in-Games/main/fix.ps1 | iex "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Enable the Ultimate Performance Power Plan",
    "Description": "Enable the Ultimate Performance Power Plan",
    "Category": "Power",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61; Start-Process powercfg.cpl"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Reset the TCP/IP Stack",
    "Description": "If you have an internet problem, Reset network configuration",
    "Category": "Fixer",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "netsh int ip reset"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Setup Auto login",
    "Description": "Setup auto login Windows username",
    "Category": "Other",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "curl.exe -ss \"https://live.sysinternals.com/Autologon.exe\" -o $env:temp\\autologin.exe ; cmd /c $env:temp\\autologin.exe /accepteula"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Disable  Xbox Services",
    "Description": "Disables all Xbox Services Game Mode and Optimizations for Windowed Games and fix stutter playing smooth",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Disable-MMAgent -MemoryCompression | Out-Null",
      "\r\n        takeown /f C:\\Windows\\System32\\GameBarPresenceWriter.exe\r\n\r\n        takeown /f C:\\Windows\\System32\\GameBarPresenceWriter.proxy.dll\r\n\r\n        takeown /f C:\\Windows\\System32\\Windows.Gaming.UI.GameBar.dll\r\n\r\n        Start-Sleep -Seconds 1\r\n\r\n\r\n        icacls C:\\Windows\\System32\\GameBarPresenceWriter.exe /grant administrators:F\r\n\r\n        icacls C:\\Windows\\System32\\GameBarPresenceWriter.proxy.dll /grant administrators:F\r\n\r\n        icacls C:\\Windows\\System32\\Windows.Gaming.UI.GameBar.dll /grant administrators:F\r\n\r\n        Start-Sleep -Seconds 1\r\n\r\n\r\n        Rename-Item C:\\Windows\\System32\\GameBarPresenceWriter.exe -NewName GameBarPresenceWriter.exe_backup\r\n\r\n        Rename-Item C:\\Windows\\System32\\GameBarPresenceWriter.proxy.dll -NewName GameBarPresenceWriter.proxy.dll_backup\r\n\r\n        Rename-Item C:\\Windows\\System32\\Windows.Gaming.UI.GameBar.dll -NewName Windows.Gaming.UI.GameBar.dll_backup\r\n\r\n      "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\GameBar",
        "Name": "AutoGameModeEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\GameBar",
        "Name": "AllowAutoGameMode",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\GameBar",
        "Name": "ShowStartupPanel",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_Enabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
        "Name": "AppCaptureEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
        "Name": "UseNexusForGameBarEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
        "Name": "AudioCaptureEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
        "Name": "CursorCaptureEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows\\GameDVR",
        "Name": "AllowgameDVR",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Services\\xbgm",
        "Name": "Start",
        "Type": "DWord",
        "Value": "4",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_FSEBehaviorMode",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_HonorUserFSEBehaviorMode",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_FSEBehavior",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_DXGIHonorFSEWindowsCompatible",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_EFSEFeatureFlags",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_DSEBehavior",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\DirectX\\UserGpuPreferences",
        "Name": "DirectXUserGlobalSettings",
        "Type": "String",
        "Value": "SwapEffectUpgradeEnable=1;",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\DirectX\\GraphicsSettings",
        "Name": "",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\DirectX\\GraphicsSettings",
        "Name": "SwapEffectUpgradeCache",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\SoftwareProtectionPlatform",
        "Name": "InactivityShutdownDelay",
        "Type": "DWord",
        "Value": "4294967295",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Dwm",
        "Name": "OverlayTestMode",
        "Type": "DWord",
        "Value": "5",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile\\Tasks\\Games",
        "Name": "GPU Priority",
        "Type": "DWord",
        "Value": "8",
        "defaultValue": "8"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile\\Tasks\\Games",
        "Name": "Scheduling Category",
        "Type": "String",
        "Value": "High",
        "defaultValue": "High"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile\\Tasks\\Games",
        "Name": "SFIO Priority",
        "Type": "String",
        "Value": "High",
        "defaultValue": "High"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\PriorityControl",
        "Name": "IRQ8Priority",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
        "Name": "DisableWindowsConsumerFeatures",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Disable Start Menu Ads",
    "Description": "Disable Start menu Ads and Settings",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\AdvertisingInfo",
        "Name": "Enabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SystemPaneSuggestionsEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SoftLandingEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "ShowSyncProviderNotifications",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable Windows Web Search",
    "Description": "Disable web search in Windows by Modify the registry settings related to Windows Search for Windows 10 and 11",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "BingSearchEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Turn off background Apps",
    "Description": "Turn off background apps for Windows 10 and 11",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\BackgroundAccessApplications",
        "Name": "GlobalUserDisabled",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "BackgroundAppGlobalToggle",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable suggestions on Start Menu",
    "Description": "Disables suggestions on start menu for Windows 10 and 11",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
        "Name": "DisableWindowsConsumerFeatures",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Remove Folder Shortcuts From File Explorer",
    "Description": "Remove Documents, Videos, Pictures, Desktop. Shortcuts from File Explorer",
    "Category": "Other",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{088e3905-0323-4b02-9826-5d99428e115f}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{088e3905-0323-4b02-9826-5d99428e115f}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{d3162b92-9365-467a-956b-92703aca08af}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{d3162b92-9365-467a-956b-92703aca08af}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer",
        "Name": "HubMode",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCR:\\CLSID\\{018D5C66-4533-4307-9B53-224DE2ED1FE6}",
        "Name": "System.IsPinnedToNameSpaceTree",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCR:\\Wow6432Node\\CLSID\\{018D5C66-4533-4307-9B53-224DE2ED1FE6}",
        "Name": "System.IsPinnedToNameSpaceTree",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Classes\\CLSID\\{031E4825-7B94-4dc3-B131-E946B44C8DD5}",
        "Name": "System.IsPinnedToNameSpaceTree",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Optimize Windows Services",
    "Description": "Disable (Print Spooler), (Fax), (Diagnostic Policy), (Downloaded Maps Manager), (Windows Error Reporting Service), (Remote Registry) , (Internet Connection Sharing), (Disables Telemetry and Data)",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [
      {
        "Name": "Spooler",
        "StartupType": "Disabled",
        "DefaultType": "Automatic"
      },
      {
        "Name": "Fax",
        "StartupType": "Disabled",
        "DefaultType": "Automatic"
      },
      {
        "Name": "DPS",
        "StartupType": "Disabled",
        "DefaultType": "Automatic"
      },
      {
        "Name": "MapsBroker",
        "StartupType": "Disabled",
        "DefaultType": "Automatic"
      },
      {
        "Name": "WerSvc",
        "StartupType": "Disabled",
        "DefaultType": "Manual"
      },
      {
        "Name": "RemoteRegistry",
        "StartupType": "Disabled",
        "DefaultType": "Disabled"
      },
      {
        "Name": "lmhosts",
        "StartupType": "Disabled",
        "DefaultType": "Manual"
      },
      {
        "Name": "SharedAccess",
        "StartupType": "Disabled",
        "DefaultType": "Manual"
      },
      {
        "Name": "DiagTrack",
        "StartupType": "Disabled",
        "DefaultType": "Manual"
      }
    ],
    "Registry": []
  },
  {
    "Name": "Disable Hibernate",
    "Description": "Hibernate is a power-saving mode in Microsoft Windows operating systems that allows the system to save the current state of your computer to the hard disk and then power down completely",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "powercfg.exe /hibernate off"
    ],
    "UndoScript": [
      "powercfg.exe /hibernate on"
    ],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Power",
        "Name": "HibernateEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\FlyoutMenuSettings",
        "Name": "ShowHibernateOption",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable OneDrive",
    "Description": "Disabling OneDrive for Windows 10 and 11",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [
      "OneDrive",
      "MicrosoftEdge"
    ],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\OneDrive",
        "Name": "DisableFileSyncNGSC",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Run",
        "Name": "OneDrive",
        "Value": "Remove"
      }
    ]
  },
  {
    "Name": "Activate Windows Old Photo Viewer",
    "Description": "Enables the classic Windows Photo Viewer for Windows 10",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".jpg",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".jpeg",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".png",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".bmp",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".gif",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": "ApplicationIcon",
        "Type": "String",
        "Value": "C:\\Program Files (x86)\\Windows Photo Viewer\\photoviewer.dll",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": "ApplicationName",
        "Type": "String",
        "Value": "Windows Photo Viewer",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Restore Classic Context Menu Windows 11",
    "Description": "Restore the old context menu for Windows 11",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Classes\\CLSID\\",
        "Name": "{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}",
        "Type": "String",
        "Value": "",
        "defaultValue": ""
      },
      {
        "Path": "HKCU:\\Software\\Classes\\CLSID\\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\\InprocServer32",
        "Name": "",
        "Type": "String",
        "Value": "",
        "defaultValue": "default"
      }
    ]
  },
  {
    "Name": "Remove Copilot in Windows 11",
    "Description": "Copilot in Windows provides centralized generative AI assistance to your users right from the Windows desktop Copilot in Windows appears as a side bar docked on the Windows desktop and is designed to help users get things done in Windows Copilot in Windows can perform common tasks in Windows like changing Windows settings which makes it different from the browserbased Copilot in Edge",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\WindowsCopilot",
        "Name": "TurnOffWindowsCopilot",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsCopilot",
        "Name": "TurnOffWindowsCopilot",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "HubsSidebarEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\Explorer",
        "Name": "DisableSearchBoxSuggestions",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Explorer",
        "Name": "DisableSearchBoxSuggestions",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Disable Recall Snapshots in Windows 11 24H",
    "Description": "Recall is an upcoming preview experience exclusive to Copilot+ PCs that will help you easily find and remember things you've seen using natural language",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\WindowsAI",
        "Name": "DisableAIDataAnalysis",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsAI",
        "Name": "DisableAIDataAnalysis",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Delete Thumbnail Cache",
    "Description": "removing the stored image thumbnails on your computer These thumbnails are small versions of images used by the operating system to display image previews quickly Over time the cache can become large or corrupted causing slowdowns or display issues Deleting it can free up space.",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Remove-Item \"$env:LocalAppData\\Microsoft\\Windows\\Explorer\\thumbcache*\" -Force -Recurse"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Old Volume Control in Windows 10",
    "Description": "The old volume control in Windows 10 refers to the classic audio mixer interface that was used in earlier versions of Windows, before the modern volume control system was introduced.",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\MTCUVC",
        "Name": "EnableMtcUvc",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable Toggle Key Sounds",
    "Description": "Toggle key sounds in Windows are audio cues that play when you press the Caps Lock, Num Lock, or Scroll Lock keys. These sounds help users identify when these keys are activated or deactivated",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Control Panel\\Accessibility\\ToggleKeys",
        "Name": "Flags",
        "Type": "String",
        "Value": "58",
        "defaultValue": "62"
      }
    ]
  },
  {
    "Name": "Disable Homegroup",
    "Description": "Disables HomeGroup  HomeGroup is a passwordprotected home networking service that lets you share your stuff with other PCs that are currently running and connected to your network",
    "Category": "",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [
      {
        "Name": "HomeGroupListener",
        "StartupType": "Manual ",
        "DefaultType": "Automatic"
      },
      {
        "Name": "HomeGroupProvider",
        "StartupType": "Manual ",
        "DefaultType": "Automatic"
      }
    ],
    "Registry": []
  },
  {
    "Name": "Remove Home and Gallery from explorer in Windows 11",
    "Description": "Removes the Home and Gallery from explorer and sets This PC as default",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "1",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "1"
      },
      {
        "Path": "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Desktop\\NameSpace\\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}",
        "Value": "Remove"
      },
      {
        "Path": "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Desktop\\NameSpace\\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}",
        "Value": "Remove"
      }
    ]
  },
  {
    "Name": "Disable all Privacy Settings",
    "Description": "Disable Wifi-Sense & Activity History & ActivityFeed Telemetry & DataCollection",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [
      "Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Application Experience\\Microsoft Compatibility Appraiser' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Application Experience\\ProgramDataUpdater' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Autochk\\Proxy' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Customer Experience Improvement Program\\Consolidator' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Customer Experience Improvement Program\\UsbCeip' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\DiskDiagnostic\\Microsoft-Windows-DiskDiagnosticDataCollector' | Out-Null"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\location",
        "Name": "Value",
        "Type": "String",
        "Value": "Deny",
        "defaultValue": "Deny"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Sensor\\Overrides\\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}",
        "Name": "SensorPermissionState",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\lfsvc\\Service\\Configuration",
        "Name": "Status",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\Maps",
        "Name": "AutoUpdateEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System",
        "Name": "EnableActivityFeed",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\Microsoft\\PolicyManager\\default\\WiFi\\AllowAutoConnectToWiFiSenseHotspots",
        "Name": "Value",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "Disabled",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "Disabled",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "AllowTelemetry",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "ContentDeliveryAllowed",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "OemPreInstalledAppsEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "PreInstalledAppsEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "PreInstalledAppsEverEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SilentInstalledAppsEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SubscribedContent-338387Enabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SubscribedContent-338388Enabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SubscribedContent-338389Enabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SubscribedContent-353698Enabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SystemPaneSuggestionsEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Siuf\\Rules",
        "Name": "NumberOfSIUFInPeriod",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "DoNotShowFeedbackNotifications",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
        "Name": "DisableTailoredExperiencesWithDiagnosticData",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AdvertisingInfo",
        "Name": "DisabledByGroupPolicy",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "Disabled",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DeliveryOptimization\\Config",
        "Name": "DODownloadMode",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Remote Assistance",
        "Name": "fAllowToGetHelp",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\OperationStatusManager",
        "Name": "EnthusiastMode",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "ShowTaskViewButton",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People",
        "Name": "PeopleBand",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "LaunchTo",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\FileSystem",
        "Name": "LongPathsEnabled",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DriverSearching",
        "Name": "SearchOrderConfig",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile",
        "Name": "SystemResponsiveness",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile",
        "Name": "NetworkThrottlingIndex",
        "Value": "4294967295",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Name": "MenuShowDelay",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Name": "AutoEndTasks",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management",
        "Name": "ClearPageFileAtShutdown",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SYSTEM\\ControlSet001\\Services\\Ndu",
        "Name": "Start",
        "Value": "2",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Control Panel\\Mouse",
        "Name": "MouseHoverTime",
        "Value": "400",
        "Type": "String",
        "defaultValue": "400"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\LanmanServer\\Parameters",
        "Name": "IRPStackSize",
        "Value": "30",
        "Type": "DWord",
        "defaultValue": "20"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Feeds",
        "Name": "EnableFeeds",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Feeds",
        "Name": "ShellFeedsTaskbarViewMode",
        "Value": "2",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "HideSCAMeetNow",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\UserProfileEngagement",
        "Name": "ScoobeSystemSettingEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Feeds",
        "Name": "EnableFeeds",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable Autoplay and Autorun",
    "Description": "Disabling autoplay in Windows prevents the automatic launch of media or applications when a removable device, such as a USB drive or CD, is connected to the computer",
    "Category": "Protection",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\AutoplayHandlers",
        "Name": "DisableAutoplay",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "NoDriveTypeAutoRun",
        "Type": "DWord",
        "Value": "255",
        "defaultValue": "255"
      }
    ]
  },
  {
    "Name": "Disable SMB Server",
    "Description": "SMB Server enables file and printer sharing over a network, allowing access to resources on remote computers as if they were local",
    "Category": "Protection",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force; Set-SmbServerConfiguration -EnableSMB2Protocol $false -Force"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Set current network profile to public",
    "Description": "Deny file sharing, device discovery, etc",
    "Category": "",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Set-NetConnectionProfile -NetworkCategory Public"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Enable F8 boot menu options",
    "Description": "Enable F8 boot menu options",
    "Category": "BIOS",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "bcdedit /set bootmenupolicy Standard | Out-Null"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Disable display and sleep mode timeouts",
    "Description": "If you frequently use your device, disable this",
    "Category": "Power",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "\r\n        powercfg /X monitor-timeout-ac 0\r\n        powercfg /X monitor-timeout-dc 0\r\n        powercfg /X standby-timeout-ac 0\r\n        powercfg /X standby-timeout-dc 0\r\n      "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Set Wallpaper desktop Quality to 100%",
    "Description": "It's Microsoft, what should I say!",
    "Category": "Personalization",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Control\\CrashControl",
        "Name": "DisplayParameters",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Disable Windows Transparency",
    "Description": "It's Microsoft, what should I say!",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize",
        "Name": "EnableTransparency",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable scheduled defragmentation task",
    "Description": "Defragmentation in Windows optimizes disk performance by reorganizing fragmented data, improving access times and system efficiency",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Defrag\\ScheduledDefrag' | Out-Null"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Enable NET 3.5",
    "Description": "Some old games and applications require .NET Framework 3.5",
    "Category": "",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "DISM /Online /Enable-Feature /FeatureName:NetFx3 /All"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Super Performance",
    "Description": "All Windows effects disabled and optimized for windowed games. You may need to log out and back in for changes to take effect. You can reset to default settings in Settings Tab",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "defaultValue": "1",
        "Type": "String",
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Value": "0",
        "Name": "DragFullWindows"
      },
      {
        "defaultValue": "1",
        "Type": "String",
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Value": "200",
        "Name": "MenuShowDelay"
      },
      {
        "defaultValue": "1",
        "Type": "String",
        "Path": "HKCU:\\Control Panel\\Desktop\\WindowMetrics",
        "Value": "0",
        "Name": "MinAnimate"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Control Panel\\Keyboard",
        "Value": "0",
        "Name": "KeyboardDelay"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "ListviewAlphaSelect"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "ListviewShadow"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "TaskbarAnimations"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\VisualEffects",
        "Value": "2",
        "Name": "VisualFXSetting"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\DWM",
        "Value": "0",
        "Name": "EnableAeroPeek"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "TaskbarMn"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "TaskbarDa"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "ShowTaskViewButton"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Value": "0",
        "Name": "SearchboxTaskbarMode"
      }
    ]
  },
  {
    "Name": "Remove Widgets from Taskbar in Windows 11",
    "Description": "Widgets are one of the new user interface elements in Windows 11 They are used to display dynamic information on the desktop including weather news and other information from various sources",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [
      "winget uninstall 'windows web experience pack' --silent"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Name": "TaskbarDa",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\TaskbarDeveloperSettings",
        "defaultValue": "1",
        "Value": "0",
        "Type": "DWord"
      }
    ]
  },
  {
    "Name": "Unknown",
    "Description": "Rename Computer name and Username to Unknown. The changes will take effect after you restart the computer",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Rename-Computer -NewName 'Unknown'",
      "$currentUsername = $env:USERNAME; Rename-LocalUser -Name $currentUsername -NewName 'Unknown'"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Fix Arabic encoding",
    "Description": "Fix issues related to strange symbols appearing in Arabic text",
    "Category": "Fixer",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Set-WinSystemLocale -SystemLocale 'ar-EG'"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  }
]

'@ | ConvertFrom-Json
#===========================================================================
#endregion End Database /APPS/TWEEAKS/Quotes/OST/Settings
#===========================================================================
#===========================================================================
#region Begin Main Functions
#===========================================================================
function Invoke-Button {

    <#
        .SYNOPSIS
        Handles various button actions and commands based on the specified action parameter.

        .DESCRIPTION
        The `Invoke-Button` function executes different actions depending on the input parameter. It manages operations such as installing apps, applying tweaks, changing themes, opening system utilities, and managing language settings. This function is designed to be used with UI elements where each button triggers a specific action.

        .PARAMETER action
        A string specifying the action to perform. The action can be one of several predefined values representing different operations, such as installing apps, applying tweaks, opening system utilities, changing themes, or managing language settings.

        .EXAMPLE
        Invoke-Button -action "installBtn"

        .EXAMPLE
        Invoke-Button -action "Dark"

        .EXAMPLE
        Invoke-Button -action "sysinfo"

        .NOTES
        - The function uses a `Switch` statement to handle different actions based on the `$action` parameter.
        - For UI-related actions, such as installing apps or applying tweaks, it calls `Invoke-Install` or `Invoke-Apply`.
        - For system utilities and settings, it uses `Start-Process` to open tools like Device Manager, Task Manager, or disk management utilities.
        - For language settings, it invokes the `Set-Language` function with the specified language code.
        - For theme changes, it calls functions like `Switch-ToDarkMode` or `Switch-ToLightMode`.
        - For managing audio settings, it calls `MuteMusic` or `UnmuteMusic`.
        - For opening URLs related to tools or scripts, it uses `Start-Process` with the URL as an argument.
        - The `Debug-Message` function is used for internal debugging and can be uncommented for logging purposes.
    #>

    Param ([string]$action,[string]$Content)

    # Helper function for debugging
    function Debug-Message {
        if($Debug) {  Add-Log "Name:$action Content:$Content" -Level "debug"  }
    }

    # Switch block to handle different actions
    Switch -Wildcard ($action) {

        "installBtn" {
            $itt.SearchInput.Text = $null
            Invoke-Install
            Debug-Message
        }
        "applyBtn" {
            Invoke-Apply
            Debug-Message 
        }
        "taps" {
            ChangeTap
        }
        "$($itt.CurrentCategory)" {
            FilterByCat($itt["window"].FindName($itt.CurrentCategory).SelectedItem.Content)
            Debug-Message $action
        }
        "searchInput" {
            Search
            Debug-Message
        }

        # Menu items

        "systemlang" {
            Set-Language -lang "default"
            Debug-Message
        }
        
                    "ar" {
                Set-Language -lang "ar"
                Debug-Message
            }
            "de" {
                Set-Language -lang "de"
                Debug-Message
            }
            "en" {
                Set-Language -lang "en"
                Debug-Message
            }
            "es" {
                Set-Language -lang "es"
                Debug-Message
            }
            "fr" {
                Set-Language -lang "fr"
                Debug-Message
            }
            "ga" {
                Set-Language -lang "ga"
                Debug-Message
            }
            "ko" {
                Set-Language -lang "ko"
                Debug-Message
            }
            "ru" {
                Set-Language -lang "ru"
                Debug-Message
            }
            "tr" {
                Set-Language -lang "tr"
                Debug-Message
            }
            "zh" {
                Set-Language -lang "zh"
                Debug-Message
            }

        "save" {
            SaveItemsToJson
            Debug-Message
        }
        "load" {
            LoadJson
            Debug-Message
        }

        # Device Management
        "deviceManager" {
            Start-Process devmgmt.msc 
            Debug-Message
        }
        "appsfeatures" {
            Start-Process appwiz.cpl 
            Debug-Message
        }
        "sysinfo" {
            Start-Process msinfo32.exe
            Start-Process dxdiag.exe 
            Debug-Message
        }
        "poweroption" {
            Start-Process powercfg.cpl 
            Debug-Message $action
        }
        "services" {
            Start-Process services.msc 
            Debug-Message $action
        }
        "network" {
            Start-Process ncpa.cpl
            Debug-Message $action
        }
        "taskmgr" {
            Start-Process taskmgr.exe 
            Debug-Message $action
        }
        "diskmgmt" {
            Start-Process diskmgmt.msc
            Debug-Message $action
        }

        "systheme" {
            SwitchToSystem 
            Debug-Message
        }

                    "Dark" {
                Set-Theme -Theme $action # Call the Set-Theme function with the selected theme
                Debug-Message # debug
            }
            "Light" {
                Set-Theme -Theme $action # Call the Set-Theme function with the selected theme
                Debug-Message # debug
            }
            "Palestine" {
                Set-Theme -Theme $action # Call the Set-Theme function with the selected theme
                Debug-Message # debug
            }



        # chocoloc
         "chocoloc" {
            Start-Process explorer.exe "C:\ProgramData\chocolatey\lib"
            Debug-Message $action
        }

        # restore point
        "restorepoint" {
            RestorePoint
            Debug-Message $action
        }

        # Music
        "moff" {
            MuteMusic -Value 0
            Debug-Message $action
        }
        "mon" {
            UnmuteMusic -Value 100
            Debug-Message $action
        }

        # Mirror Links
        "unhook" {
            Start-Process "https://unhook.app/" 
            Debug-Message $action
        }
        "uBlock" {
            Start-Process "https://ublockorigin.com/" 
            Debug-Message $action
        }
        "mas" {
            Start-Process "https://github.com/massgravel/Microsoft-Activation-Scripts"
            Debug-Message $action
        }
        "idm" {
            Start-Process "https://github.com/WindowsAddict/IDM-Activation-Script"
            Debug-Message $action
        }
        "neat" {
            Start-Process "https://addons.mozilla.org/en-US/firefox/addon/neatdownloadmanager-extension/" 
            Debug-Message $action
        }

        "winoffice" {
            Start-Process "https://massgrave.dev/genuine-installation-media" 
            Debug-Message $action
        }
        "sordum" {
            Start-Process "https://www.sordum.org/" 
            Debug-Message $action
        }
        "majorgeeks" {
            Start-Process "https://www.majorgeeks.com/" 
            Debug-Message $action
        }

        "techpowerup" {
            Start-Process "https://www.techpowerup.com/download/" 
            Debug-Message $action
        }

        # Other actions
        "ittshortcut" {
            ITTShortcut $action
            Debug-Message $action
        }
        "dev" {
            About
            Debug-Message $action
        }
        # Reset-Preferences

        "reset"{
            Reset-Preferences
            Debug-Message $action
        }

        "shelltube"{
            Start-Process -FilePath "powershell" -ArgumentList "irm https://github.com/emadadel4/shelltube/releases/latest/download/st.ps1 | iex"
            Debug-Message $action
        }

        "fmhy"{

            Start-Process ("https://fmhy.net/")
            Debug-Message $action
        }

        Default {
            Write-Host "Unknown action: $action"
        }
    }
}
function Invoke-ScriptBlock {
    <#
        .SYNOPSIS
        Executes a given script block asynchronously within a specified runspace.

        .DESCRIPTION
        This function creates a new PowerShell instance to execute a provided script block asynchronously. It accepts an optional array of arguments to pass to the script block and manages the runspace and PowerShell instance resources. The function ensures that resources are properly disposed of after the script block completes execution.

        .PARAMETER ScriptBlock
        The script block to be executed. This parameter is mandatory and must be of type `[scriptblock]`.

        .PARAMETER ArgumentList
        An optional array of arguments to be passed to the script block. This parameter allows for dynamic input to the script block.

        .EXAMPLE
        Invoke-ScriptBlock -ScriptBlock { param($arg1) Write-Output $arg1 } -ArgumentList @("Hello, World!")
        Executes the script block that outputs the provided argument "Hello, World!" asynchronously.

        .NOTES
        - The function uses a custom runspace (`$itt.runspace`) for execution. Ensure that this runspace is correctly configured and available in the script's context.
        - Proper disposal of the PowerShell instance and runspace is handled to prevent resource leaks.
        - Garbage collection is explicitly invoked to free up memory after execution.
    #>

    param(
        [scriptblock]$ScriptBlock,  # The script block to invoke
        [array]$ArgumentList,
        $Debug   
    )

    $script:powershell = [powershell]::Create()  # Create a new PowerShell instance

    # Add the script block and arguments to the runspace
    $script:powershell.AddScript($ScriptBlock)
    $script:powershell.AddArgument($ArgumentList)
    $script:powershell.AddArgument($Debug)
    $script:powershell.RunspacePool = $itt.runspace  # Set the runspace pool

    # Begin running the script block asynchronously
    $script:handle = $script:powershell.BeginInvoke()

    # If the script has completed, clean up resources
    if ($script:handle.IsCompleted) {
        $script:powershell.EndInvoke($script:handle)  # End the invocation
        $script:powershell.Dispose()                  # Dispose of the PowerShell instance
        $itt.runspace.Dispose()                      # Dispose of the runspace
        $itt.runspace.Close()                        # Close the runspace
        [System.GC]::Collect()                        # Force garbage collection to free memory
    }
}

function RestorePoint {

    <#
        .SYNOPSIS
        Creates a system restore point on the local computer.

        .DESCRIPTION
        This function creates a system restore point using the Checkpoint-Computer cmdlet. It logs the process of creating the restore point and handles any errors that occur during the creation. If the restore point creation fails, an error message is displayed.

        .EXAMPLE
        RestorePoint
        Creates a restore point and logs the success or failure of the operation.
    #>

    Invoke-ScriptBlock -ScriptBlock {

        Try {
            Add-Log -Message "Creating Restore point..." -Level "INFO"
            Start-Process powershell.exe -ArgumentList "-NoExit", "-Command `"Enable-ComputerRestore -Drive '$env:SystemDrive'; Checkpoint-Computer -Description 'ITT' -RestorePointType 'MODIFY_SETTINGS'; exit`"" -Wait -Verb RunAs
            Add-Log -Message "Created successfully" -Level "INFO"
        } Catch {
            Add-Log -Message "An error occurred while enabling System Restore: $_" -Level "ERROR"
        }
    }
}

function Add-Log {

    param (
        [string]$Message, # Content of Message
        [string]$Level = "INFO" # Message Level [INFO] [ERROR] [WARNING],
    )

    # Determine the color based on the log level
    switch ($Level.ToUpper()) {
        "INFO" { $color = "White" }
        "WARNING" { $color = "Yellow" }
        "ERROR" { $color = "Red" }
        "Installed" { $color = "White" }
        "Apply" { $color = "White" }
        "debug" { $color = "Yello" }
        default { $color = "White" }
    }

    switch ($Level.ToUpper()) {
        "INFO" { $icon = "i" }
        "WARNING" { $icon = "!" }
        "ERROR" { $icon = "X" }
        "Installed" { $icon = "√" }
        "Apply" { $icon = "√" }
        "Disabled" { $icon = "X" }
        "Enabled" { $icon = "√" }
        "debug" { $icon = "debug" }
        default { $icon = "i" }
    }

    # Construct the log message
    $logMessage =  "[$icon] $Message"

    # Write the log message to the console with the specified color
    Write-Host " $logMessage" -ForegroundColor $color

}
function Disable-Service {
    
    <#
        .SYNOPSIS
        Disables a specified service by changing its startup type and stopping it.

        .DESCRIPTION
        This function disables a Windows service by first changing its startup type to the specified value, then stopping the service if it is running. The function logs the outcome of the operation, including whether the service was found and successfully disabled or if an error occurred.

        .PARAMETER ServiceName
        The name of the service to be disabled. This is a required parameter.

        .PARAMETER StartupType
        The desired startup type for the service. Common values include 'Disabled', 'Manual', and 'Automatic'. This is a required parameter.

        .EXAMPLE
        Disable-Service -ServiceName "wuauserv" -StartupType "Disabled"
    #>

    param(
        [array]$tweak
    )


    foreach ($serv in $tweak) {
        
        try {
            Add-Log  -Message "Setting Service $($serv.Name)" -Level "info"
            $service = Get-Service -Name $serv.Name -ErrorAction Stop
            Stop-Service -Name $serv.Name -ErrorAction Stop
            $service | Set-Service -StartupType $serv.StartupType -ErrorAction Stop
        }
        catch {
            Add-Log -Message "Service $Name was not found" -Level "info"
        }
    }
}
function ExecuteCommand {
    
    <#
    .SYNOPSIS
    Executes a PowerShell command in a new process.

    .DESCRIPTION
    This function starts a new PowerShell process to execute the specified command. It waits for the command to complete before returning control to the caller. The function handles any errors that occur during the execution of the command and outputs an error message if needed.

    .PARAMETER Name
    An optional name or identifier for the command being executed. This parameter is currently not used in the function but could be used for logging or tracking purposes.

    .PARAMETER Command
    The PowerShell command to be executed. This parameter is required.

    .EXAMPLE
    ExecuteCommand -Name "Greeting" -Command "Write-Output 'Welcome to ITT'"
    Executes the PowerShell command `Write-Output 'Welcome to ITT'` in a new PowerShell process.
    #>

    param (
        [array]$tweak
    )

    try {

        foreach ($cmd in $tweak) {
            Add-Log -Message "Executing script in the background; please wait..."
            $script = [scriptblock]::Create($cmd)
            Invoke-Command  $script -ErrorAction Stop
        }

    } catch  {
        Add-Log -Message "The specified command was not found." -Level "WARNING"
    }
}
function Finish {

    <#
        .SYNOPSIS
        Clears checkboxes in a specified ListView and displays a notification.

        .DESCRIPTION
        This function iterates through the items in a specified ListView, unchecks any CheckBox controls within it, and clears the ListView. After clearing the ListView, it uses the `Notify` function to display a notification with a given title, message, and icon.

        .PARAMETER ListView
        The name of the ListView control within the `$itt` object that needs to be processed. This parameter is required.

        .PARAMETER title
        The title for the notification message. Defaults to "ITT Emad Adel" if not specified.

        .PARAMETER msg
        The message content for the notification. Defaults to "Installed successfully" if not specified.

        .PARAMETER icon
        The icon to be used in the notification. Defaults to "Info" if not specified.

        .EXAMPLE
        Finish -ListView "myListView" -title "Process Completed" -msg "All items have been processed" -icon "Success"
        Clears all checkboxes in the ListView named "myListView" and displays a notification with the title "Process Completed", message "All items have been processed", and icon "Success".

        .NOTES
        - Ensure that the `Notify` function is implemented and available in your script to handle notification display.
        - The function assumes the `$itt` object and its `ListView` are properly initialized and accessible.
        - The notification duration is set to 30 seconds (`30000` milliseconds).
    #>

    param (
       [string]$ListView,
       [string]$title = "ITT Emad Adel",
       [string]$icon = "Info"
    )

    
    switch($ListView)
    {
        "AppsListView" {
            UpdateUI -Button "InstallBtn" -ButtonText "installText" -Content "Install" -TextIcon "installIcon" -Icon "  " -Width "140"
            Notify -title "$title" -msg "ALL INSTALLATIONS COMPLETED SUCCESSFULLY." -icon "Info" -time 30000
            Add-Log -Message "ALL INSTALLATIONS COMPLETED SUCCESSFULLY." -Level "INFO"
        }

        "TweaksListView" {
            UpdateUI -Button "ApplyBtn" -ButtonText "applyText" -Content "Apply" -TextIcon "applyIcon" -Icon "  " -Width "140"
            Add-Log -Message "ALL TWEAKS HAVE BEEN APPLIED SUCCESSFULLY. PLEASE NOTE: SOME CHANGES WILL TAKE EFFECT AFTER A RESTART." -Level "INFO"
            Notify -title "$title" -msg "ALL TWEAKS HAVE BEEN APPLIED SUCCESSFULLY." -icon "Info" -time 30000
        }
    }

    $itt["window"].Dispatcher.Invoke([action]{ Set-Taskbar -progress "None" -value 0.01 -icon "done" })

    # Clear 
    $itt.$ListView.Dispatcher.Invoke([Action]{
        foreach ($item in $itt.$ListView.Items)
        {
            foreach ($child in $item.Children) {
                if ($child -is [System.Windows.Controls.StackPanel]) {
                    foreach ($innerChild in $child.Children) {
                        if ($innerChild -is [System.Windows.Controls.CheckBox]) {

                            $innerChild.IsChecked = $false
                            $itt.$ListView.Clear()
                            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)
                            $collectionView.Filter = $null
                        }
                    }
                }
            }
        }
    })
}
function Show-Selected {

    param (
        [string]$ListView,
        [string]$mode
     )

    switch ($mode) {

        "Filter"{

            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)

            $filterPredicate = {
                param($item)
        
                if ($item -is [System.Windows.Controls.StackPanel]) {
                    foreach ($child in $item.Children) {
                        if ($child -is [System.Windows.Controls.StackPanel]) {
                            foreach ($innerChild in $child.Children) {
                                if ($innerChild -is [System.Windows.Controls.CheckBox]) {
                                    # Check if the CheckBox is checked
                                    $itemTag = $innerChild.IsChecked
                                    return $itemTag
                                }
                            }
                        }
                    }
                }
        
                # Return $true if no CheckBox found (to include all items)
                return $true
            }
        
            $collectionView.Filter = $filterPredicate

        }
        Default {
            $itt.$ListView.Clear()
            [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items).Filter = $null
            $itt['window'].FindName($itt.CurrentList).SelectedIndex = 0
        }
    }
}
function Clear-Item {

    <#
        .SYNOPSIS
        Unchecks all checkboxes in a specified ListView and clears the ListView.

        .DESCRIPTION
        This function iterates through all items in a specified ListView, unchecking any CheckBox controls within those items. After unchecking the checkboxes, it clears the ListView and removes any applied filters. It also resets the category selection to the first item.

        .PARAMETER ListView
        The name of the ListView control within the `$itt` object that needs to be processed. This parameter is required.

        .EXAMPLE
        Clear-Item -ListView "AppsListView"
        Unchecks all checkboxes in the "AppsListView", clears the ListView, and resets the category selection.

        .NOTES
        - The function assumes that the `$itt` object and its `ListView` are properly initialized and accessible.
        - The `Dispatcher.Invoke` method is used to ensure that UI changes are made on the UI thread, which is necessary for interacting with WPF controls.
        - The `category.SelectedIndex` is set to 0, which resets the category dropdown or selection to its initial state.
    #>

    param (
        $ListView
    )

     # Uncheck all checkboxes in $list if user chose [NO]
     $itt.$ListView.Dispatcher.Invoke({
        foreach ($item in $itt.$ListView.Items) {
            $item.Children | ForEach-Object {
                if ($_ -is [System.Windows.Controls.StackPanel]) {
                    $_.Children | ForEach-Object {
                        if ($_ -is [System.Windows.Controls.CheckBox]) {
                            $_.IsChecked = $false
                        }
                    }
                }
            }
        }
        $itt.$ListView.Clear()
        [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items).Filter = $null
    })

    $itt['window'].FindName($itt.CurrentList).SelectedIndex = 0
    
}
function Get-SelectedItems {

    <#
        .SYNOPSIS
        Retrieves selected items from the ListView based on the specified mode.

        .DESCRIPTION
        This function collects information about selected items from a ListView, depending on the mode specified. It extracts data from the ListView items that have checkboxes that are checked and returns this information in a structured format.

        .PARAMETER Mode
        Specifies the mode for item retrieval. Options include:
        - `Apps`: Retrieves information about selected applications from the `AppsListView`.
        - `Tweaks`: Retrieves information about selected tweaks from the `TweaksListView`.

        .EXAMPLE
        Get-SelectedItems -Mode "Apps"
        Retrieves and returns a list of selected applications from the `AppsListView`.

        .EXAMPLE
        Get-SelectedItems -Mode "Tweaks"
        Retrieves and returns a list of selected tweaks from the `TweaksListView`.

        .NOTES
        - The function relies on the `$itt` object, which must be initialized and accessible within the scope of the function.
        - The function processes items from the ListView by iterating through nested StackPanel controls and their child CheckBox controls.
        - The resulting items are returned as an array of hashtables, with each hashtable containing details about the selected item based on the mode.
    #>

    param (
        [string]$Mode
    )

    $items = @()

    switch ($Mode) {
        "Apps" {
            $itt.AppsListView.Items |
                Where-Object { $_ -is [System.Windows.Controls.StackPanel] } |
                ForEach-Object {
                    $_.Children |
                        Where-Object { $_ -is [System.Windows.Controls.StackPanel] } |
                        ForEach-Object {
                            $_.Children |
                                Where-Object { $_ -is [System.Windows.Controls.CheckBox] -and $_.IsChecked } |
                                ForEach-Object {
                                    $checkbox = $_
                                    $app = $itt.database.Applications | Where-Object { $_.Name -eq $checkbox.Content }

                                    if ($app) {
                                        $items += @{
                                            Name    = $app.name
                                            Choco   = $app.choco
                                            Winget  = $app.winget
                                            Default = $app.default
                                            # Add a new method downloader here
                                        }
                                    }
                                }
                        }
                }
        }
        "Tweaks" {
            $itt.TweaksListView.Items |
                Where-Object { $_ -is [System.Windows.Controls.StackPanel] } |
                ForEach-Object {
                    $_.Children |
                        Where-Object { $_ -is [System.Windows.Controls.StackPanel] } |
                        ForEach-Object {
                            $_.Children |
                                Where-Object { $_ -is [System.Windows.Controls.CheckBox] -and $_.IsChecked } |
                                ForEach-Object {
                                    $checkbox = $_
                                    $tweak = $itt.database.Tweaks | Where-Object { $_.Name -eq $checkbox.Content }

                                    if ($tweak) {
                                        $items += @{
                                            Name                = $tweak.Name
                                            Registry            = $tweak.Registry
                                            Services            = $tweak.Services
                                            ScheduledTask       = $tweak.ScheduledTask
                                            AppxPackage         = $tweak.AppxPackage
                                            Script              = $tweak.Script
                                            UndoScript          = $tweak.UndoScript
                                            Refresh             = $tweak.Refresh
                                            # Add a new method tweak here
                                        }
                                    }
                                }
                        }
                }
        }
        default {
            Write-Error "Invalid Mode specified. Please choose 'Apps' or 'Tweaks'."
        }
    }

    return $items
}
Function Get-ToggleStatus {

    <#
        .SYNOPSIS
        Checks the status of various system toggle switches based on the provided parameter.

        .DESCRIPTION
        This function retrieves and returns the status of specific system toggle switches, such as Dark Mode, file extension visibility, hidden files visibility, Num Lock, and Sticky Keys. The status is determined by querying the Windows Registry for relevant settings.

        .PARAMETER ToggleSwitch
        Specifies which toggle switch status to check. The following values are supported:
        - `ToggleDarkMode`: Checks if Dark Mode is enabled.
        - `ToggleShowExt`: Checks if file extensions are set to be shown.
        - `ToggleShowHidden`: Checks if hidden files are set to be shown.
        - `ToggleNumLock`: Checks if Num Lock is enabled.
        - `ToggleStickyKeys`: Checks if Sticky Keys is enabled.

        .RETURN
        - Returns `$true` if the specified toggle switch is enabled according to the criteria.
        - Returns `$false` if the toggle switch is disabled or if the check does not match the criteria.

        .EXAMPLE
        Get-ToggleStatus -ToggleSwitch "ToggleDarkMode"
        Checks if Dark Mode is enabled on the system and returns `$true` if it is.

        .EXAMPLE
        Get-ToggleStatus -ToggleSwitch "ToggleShowExt"
        Checks if file extensions are shown in the File Explorer and returns `$true` if they are.

        .NOTES
        - The function relies on querying specific registry paths to determine the status of the toggle switches.
        - The function uses registry values to determine the state of settings related to the specified toggle switches.
        - Ensure that you have appropriate permissions to access the registry paths used by this function.
        - The function includes error handling to return `$false` if the registry values do not match the expected criteria for the toggle switches.
    #>

    Param($ToggleSwitch) # Parameter to specify which toggle switch status to check

    # Check status of "ToggleDarkMode"
    if($ToggleSwitch -eq "ToggleDarkMode"){
        $app = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').AppsUseLightTheme
        $system = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').SystemUsesLightTheme
        if($app -eq 0 -and $system -eq 0){
            return $true
        }
        else{
            # Return true if Sticky Keys are enabled
            return $false
        }
    }
  
    # Check status of "ToggleShowExt" (Show File Extensions)
    if($ToggleSwitch -eq "ToggleShowExt"){
        $hideextvalue = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced').HideFileExt
        if($hideextvalue -eq 0){
            return $true
        }
        else{
            # Return true if Sticky Keys are enabled
            return $false
        }
    }

    # Check status of "ToggleShowHidden" (Show Hidden Files)
    if($ToggleSwitch -eq "ToggleShowHidden"){
        $hideextvalue = (Get-ItemPropertyValue -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSuperHidden")
        if($hideextvalue -eq 1){
            return $true
        }
        else{
            # Return true if Sticky Keys are enabled
            return $false
        }
    }

    # Check status of "ToggleNumLock"
    if($ToggleSwitch -eq "ToggleNumLook"){
        $numlockvalue = (Get-ItemProperty -path 'HKCU:\Control Panel\Keyboard').InitialKeyboardIndicators
        if($numlockvalue -eq 2){
            return $true
        }
        else{
            # Return true if Sticky Keys are enabled
            return $false
        }
    } 
    
    # Check status of "ToggleStickyKeys"    
    if ($ToggleSwitch -eq "ToggleStickyKeys") {
        $StickyKeys = (Get-ItemProperty -path 'HKCU:\Control Panel\Accessibility\StickyKeys').Flags
        if($StickyKeys -eq 58){
            return $false
        }
        else{
            # Return true if Sticky Keys are enabled
            return $true
        }
    }

    # Check status of "MouseAcceleration"    
    if($ToggleSwitch -eq "MouseAcceleration") {
        $Speed = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseSpeed
        $Threshold1 = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseThreshold1
        $Threshold2 = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseThreshold2

        if($Speed -eq 1 -and $Threshold1 -eq 6 -and $Threshold2 -eq 10) {
            return $true
        } else {
            return $false
        }
    }

    # EndTaskOnTaskbar     
    if($ToggleSwitch -eq "EndTaskOnTaskbar") 
    {

        $path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings"

        if (-not (Test-Path $path))
        {
            return $false
        }
        else 
        {
            $TaskBar = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings').TaskbarEndTask
            
            if($TaskBar -eq 1) 
            {
                return $true
            } 
            else 
            {
                return $false
            }
        }
    }

    # Remove Page file     
    if($ToggleSwitch -eq "ClearPageFileAtShutdown") 
    {
        $PageFile = (Get-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\\Memory Management').ClearPageFileAtShutdown
        
        if($PageFile -eq 1) 
        {
            return $true
        } 
        else 
        {
            return $false
        }
    }

     # Auto end tasks     
    if($ToggleSwitch -eq "AutoEndTasks") 
    {
         $PageFile = (Get-ItemProperty -path 'HKCU:\Control Panel\Desktop').AutoEndTasks
         
         if($PageFile -eq 1) 
         {
             return $true
         } 
         else 
         {
             return $false
         }
    }

    # Auto end tasks     
    if($ToggleSwitch -eq "VisualFXSetting") 
    {
        $VisualFXSetting = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects').VisualFXSetting
        
        if($VisualFXSetting -eq 2) 
        {
            return $true
        } 
        else 
        {
            return $false
        }
    }

    # Quick Access   
    if($ToggleSwitch -eq "LaunchTo") 
    {
        $LaunchTo = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced').LaunchTo
        
        if($LaunchTo -eq 1) 
        {
            return $true
        } 
        else 
        {
            return $false
        }
    }
}

function Install-App {
    
    <#
        .SYNOPSIS
        Installs an application using Chocolatey or Winget based on availability and installation status.

        .DESCRIPTION
        This function attempts to install a specified application using Chocolatey. If the Chocolatey installation fails, it falls back to using Winget to install the application. The function also handles some cleanup tasks related to Chocolatey and logs the results of the installation process.

        .PARAMETER appName
        The name of the application to be installed. This parameter is used for logging and status messages.

        .PARAMETER appChoco
        The package name of the application as recognized by Chocolatey. This parameter is used to perform the installation via Chocolatey.

        .PARAMETER appWinget
        The package identifier for the application as recognized by Winget. This parameter is used to perform the installation via Winget if Chocolatey fails.

        .EXAMPLE
        Install-App -appName "Google Chrome" -appChoco "googlechrome" -appWinget "Google.Chrome"
        Attempts to install Google Chrome using Chocolatey. If the installation fails, it attempts to install it using Winget.
    #>

    param (
        [string]$appName,
        [string]$appChoco,
        [string]$appWinget
    )

    Install-Choco
            
    UpdateUI -Button "ApplyBtn" -ButtonText "applyText" -Content "Applying" -TextIcon "applyIcon" -Icon "  " -Width "auto"
    $chocoResult = $(Start-Process -FilePath "choco" -ArgumentList "install $appChoco --confirm --acceptlicense -q -r --ignore-http-cache --allowemptychecksumsecure --allowemptychecksum --usepackagecodes --ignoredetectedreboot --ignore-checksums --ignore-reboot-requests --limitoutput" -Wait -NoNewWindow -PassThru).ExitCode

    if ($chocoResult -ne 0) {

        Add-Log -Message "Chocolatey installation failed for $appName." -Level "ERROR"
        Add-Log -Message "Attempting to install $appName using Winget." -Level "INFO"

        #Install Winget if not install on Device
        Install-Winget

        Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
        $wingetResult = $(Start-Process -FilePath "winget" -ArgumentList "install --id $appWinget --silent --accept-source-agreements --accept-package-agreements --force" -Wait -NoNewWindow -PassThru).ExitCode

        # Check winget
        if ($wingetResult -ne 0) {
            Add-Log -Message "Winget Installation Failed for ($appName). report the issue in the ITT repository to resolve this problem." -Level "ERROR"
            $itt["window"].Dispatcher.Invoke([action]{ Set-Taskbar -progress "Error" -value 0.01 -icon "Error" })
        } 
        else
        {
            Add-Log -Message "($appName) Successfully Installed Using Winget." -Level "Installed"
        }
    }
    else
    {
        Add-Log -Message "($appName) Successfully Installed Using Chocolatey." -Level "Installed"
        UpdateUI -Button "ApplyBtn" -ButtonText "applyText" -Content "Apply" -TextIcon "applyIcon" -Icon "  " -Width "140"
    }
}
function Install-Choco {
    
    <#
    .SYNOPSIS
    Installs Chocolatey if it is not already installed on the system.

    .DESCRIPTION
    This function checks if Chocolatey is installed on the system by attempting to retrieve the `choco` command. If Chocolatey is not found, it proceeds to install Chocolatey using a web-based installation script. The function also logs the process of installing Chocolatey.

    .EXAMPLE
    Install-Choco
    Checks if Chocolatey is installed, and if not, installs it.
    #>

    if (-not (Get-Command choco -ErrorAction SilentlyContinue))
    {
        Add-Log -Message "Installing Chocolatey for the first time, It won't take minutes :)" -Level "INFO"
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) *> $null
        Add-Log -Message "Attempting to install $appName using Chocolatey..." -Level "INFO"
    }
}

function Install-Winget {

    <#
        .SYNOPSIS
        Installs the Windows Package Manager (`winget`) and its dependencies.

        .DESCRIPTION
        This function installs `winget` by first checking if it is already installed on the system. If not, it downloads and installs the necessary dependencies:
        1. `Microsoft.VCLibs` package.
        2. `Microsoft.UI.Xaml` package.
        3. The `Microsoft Store App Installer` which includes `winget`.

        It also ensures that the `winget` path is added to the system environment variables if it is not already present.

        .PARAMETER None
        This function does not require any parameters.

        .EXAMPLE
        Install-Winget

        .EXAMPLE
        If you want to run this function in a PowerShell script, just call `Install-Winget`. This will download and install `winget` and its prerequisites if they are not already installed on the system.

        .NOTES
        - The function determines the OS architecture (32-bit or 64-bit) and selects the appropriate package URLs for `Microsoft.VCLibs` and `Microsoft.UI.Xaml`.
        - It checks for the existence of `winget` using `Get-Command`. If `winget` is found, the function exits without making changes.
        - It downloads the necessary `.appx` packages and installs them using `Add-AppxPackage`.
        - It downloads and installs the `Microsoft Store App Installer` which includes `winget`.
        - The function attempts to add the `winget` path to the system environment variables if it is not already included.
        - The function includes error handling to throw a custom exception if the installation of prerequisites fails.
    #>


    $versionVCLibs = "14.00"
    $versionUIXamlMinor = "2.8"
    $versionUIXamlPatch = "2.8.6"

    function Get-OSArchitecture {
    $is64Bit = $env:PROCESSOR_ARCHITEW6432 -eq "AMD64"
    $architecture = if ($is64Bit) { "64-bit" } else { "32-bit" }
    return $architecture
    }

    if (Get-OSArchitecture -eq "64-bit") {
    $fileVCLibs = "https://aka.ms/Microsoft.VCLibs.x64.${versionVCLibs}.Desktop.appx"
    $fileUIXaml = "https://github.com/microsoft/microsoft-ui-xaml/releases/download/v${versionUIXamlPatch}/Microsoft.UI.Xaml.${versionUIXamlMinor}.x64.appx"
    } 
    else
    {
    $fileVCLibs = "https://aka.ms/Microsoft.VCLibs.x86.${versionVCLibs}.Desktop.appx"
    $fileUIXaml = "https://github.com/microsoft/microsoft-ui-xaml/releases/download/v${versionUIXamlPatch}/Microsoft.UI.Xaml.${versionUIXamlMinor}.x86.appx"
    }

    Try {
    
        if (Get-Command winget -ErrorAction SilentlyContinue) {
            Write-Host "winget is installed on this system."
            return
        } 
    
        Write-Host "Downloading Microsoft.VCLibs Dependency..."
        Invoke-WebRequest -Uri $fileVCLibs -OutFile $ENV:TEMP\Microsoft.VCLibs.x64.Desktop.appx
        Write-Host "Downloading Microsoft.UI.Xaml Dependency...`n"
        Invoke-WebRequest -Uri $fileUIXaml -OutFile $ENV:TEMP\Microsoft.UI.Xaml.x64.appx
    
        # Install Microsoft.VCLibs
        Add-AppxPackage -Path "$ENV:TEMP\Microsoft.VCLibs.x64.Desktop.appx"
    
        # Install Microsoft.UI.Xaml
        Add-AppxPackage -Path "$ENV:TEMP\Microsoft.UI.Xaml.x64.appx"
    
        $msiPath = "$env:TEMP\winget.msixbundle"
        $url = "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
        Invoke-WebRequest -Uri $url -OutFile $msiPath
    
        # Install the Microsoft Store App Installer silently
        Add-AppxPackage -Path $msiPath -ErrorAction Stop
    
        # Wait for the installation to complete
        Start-Sleep -Seconds 2
    
        # Add winget to the system environment variable 'Path' if not already present
        $wingetPath = "$env:ProgramFiles\WindowsApps\Microsoft.DesktopAppInstaller_1.11.12371.0_x64__8wekyb3d8bbwe"
        $pathVariable = [Environment]::GetEnvironmentVariable("Path", "Machine")
        if (-not ($pathVariable -split ";" | Where-Object {$_ -eq $wingetPath})) {
            $newPath = "$pathVariable;$wingetPath"
            [Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")
        }
    
        $ENV:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
    
    }
    Catch {
        throw [WingetFailedInstall]::new('Failed to install prerequisites')
    }
}
function Native-Downloader {
    param (
        [string]$url,
        [string]$name,
        [string]$launcher,
        [string]$portable,
        [string]$installArgs
    )

        # Define the destination directory
        $Destination_Directory = Join-Path -Path "$env:ProgramData\ITT\Downloads" -ChildPath $name

        # Ensure destination directory exists
        if (-not (Test-Path -Path $Destination_Directory)) {
            New-Item -ItemType Directory -Path $Destination_Directory -Force | Out-Null
        }

        # Extract file name and ensure we have the file with extension
        $File = [System.IO.Path]::GetFileName($url)
        $DownloadPath = Join-Path -Path $Destination_Directory -ChildPath $File
        $targetPath = Join-Path -Path $Destination_Directory -ChildPath $launcher

        try {
            # Start downloading the file
            Add-Log -Message "Downloading $name using Invoke-WebRequest" -Level "INFO"
            Invoke-WebRequest -Uri $url -OutFile $DownloadPath -ErrorAction Stop
            Expand-Archive -Path $DownloadPath -DestinationPath $Destination_Directory -Force -ErrorAction Stop
        }
        catch {
            Write-Error "An error occurred during the download or extraction process: $_"
        }

        if($portable -eq "true")
        {
            # Check if the target file exists
            if (-not (Test-Path -Path $targetPath)) {
                Add-Log -Message  "Target file '$targetPath' does not exist after extraction." -Level "error"
                return
            }

            # Define the path to the desktop shortcut
            $desktopPath = [System.Environment]::GetFolderPath('Desktop')
            $shortcutPath = Join-Path -Path $desktopPath -ChildPath "$name.lnk"  # Set the shortcut name

            try {
                # Create the shortcut
                $shell = New-Object -ComObject WScript.Shell
                $shortcut = $shell.CreateShortcut($shortcutPath)
                $shortcut.TargetPath = $targetPath
                $shortcut.Save()
                Add-Log -Message "Shortcut created on Destkop" -Level "info"
            } catch {
                Write-Error "Failed to create shortcut. Error: $_"
            }

        }
        else
        {
            Start-Process -FilePath $targetPath -ArgumentList $installArgs -Wait
            if($debug) {Write-Host $targetPath}
        }

}
function Refresh-Explorer {
    # Check if explorer is not running and start it if needed
    Add-Log -Message "Restarting explorer..." -Level "info"
    Stop-Process -Name explorer -Force
    Start-Sleep -Seconds 1
    if (-not (Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
        Start-Process explorer.exe -Verb RunAs
    }
}
function Remove-ScheduledTasks {
    param (
        [Parameter(Mandatory = $true)]
        [array]$tweak
    )


    foreach ($task in $tweak) {

        Add-Log -Message "Removing $task ScheduledTask..." -Level "info"

        $tasks = Get-ScheduledTask -TaskName "*$task*" -ErrorAction SilentlyContinue

        if ($tasks) 
        {
            foreach ($task in $tasks) 
            {
                Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false
                Add-Log -Message "$($task.TaskName) Removed" -Level "INFO"
            }
        } 
        else
        {
            if ($Debug) 
            {
                Add-Log -Message "No tasks matching '$task' found" -Level "debug"
            }
        }
    }
}

function Reset-Preferences {

    <#
        .SYNOPSIS
        Resets user preferences for music volume and popup window settings.

        .DESCRIPTION
        This function resets the preferences by updating the registry values for the music volume and popup window settings. 
        It writes the provided values to the specified registry path and switches to the system's default settings.

        .PARAMETER music
        Sets the music volume preference. Default is "100".

        .PARAMETER PopupWindow
        Sets the popup window visibility. Default is "on".
    #>

    param (
        [string]$music = "100",
        [string]$PopupWindow = "on",
        [string]$UserTheme = "none"
    )

    Set-ItemProperty -Path $itt.registryPath  -Name "PopupWindow" -Value $PopupWindow -Force
    Set-ItemProperty -Path $itt.registryPath  -Name "Music" -Value $music -Force
    Set-ItemProperty -Path $itt.registryPath  -Name "UserTheme" -Value $UserTheme -Force

    SwitchToSystem

    Message -key "Reopen_itt_again" -icon "Information" -action "OK"
}
# Function to get all CheckBoxes from a StackPanel
function Get-CheckBoxesFromStackPanel {
    param (
        [System.Windows.Controls.StackPanel]$item  # The StackPanel to search
    )

    $checkBoxes = @()  # Initialize an empty array to store CheckBoxes
    
    if ($item -is [System.Windows.Controls.StackPanel]) {
        foreach ($child in $item.Children) {
            if ($child -is [System.Windows.Controls.StackPanel]) {
                foreach ($innerChild in $child.Children) {
                    if ($innerChild -is [System.Windows.Controls.CheckBox]) {
                        $checkBoxes += $innerChild  # Add each CheckBox to the array
                    }
                }
            }
        }
    }
    return $checkBoxes  # Return the array of CheckBoxes
}

# Function to load JSON data and update the UI
function LoadJson {
    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }

    # Open file dialog to select JSON file
    $openFileDialog = New-Object "Microsoft.Win32.OpenFileDialog"
    $openFileDialog.Filter = "JSON files (*.itt)|*.itt"
    $openFileDialog.Title = "Open JSON File"
    $dialogResult = $openFileDialog.ShowDialog()

    if ($dialogResult -eq "OK") {
        $jsonData = Get-Content -Path $openFileDialog.FileName -Raw | ConvertFrom-Json
        $filteredNames = $jsonData.Name

        # Filter predicate to match CheckBoxes with JSON data
        $filterPredicate = {
            param($item)

            $checkBoxes = Get-CheckBoxesFromStackPanel -item $item

            foreach ($currentItemName in $filteredNames) {
                if ($currentItemName -eq $checkBoxes.Content) {
                    $checkBoxes.IsChecked = $true
                    break
                }
            }
            return $filteredNames -contains $checkBoxes.Content
        }

        # Update UI based on the loaded JSON data
        $itt['window'].FindName('apps').IsSelected = $true
        $itt['window'].FindName('appslist').Clear()
        $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName('appslist').Items)
        $collectionView.Filter = $filterPredicate
        Message -NoneKey "Restored successfully" -icon "info" -action "OK"
    }
}

# Function to save selected items to a JSON file
function SaveItemsToJson {
    if ($itt.ProcessRunning) {
        $msg = $itt.database.locales.Controls.$($itt.Language).Pleasewait
        Message -key "Please_wait" -icon "warning" -action "OK"
        return
    }

    ClearFilter

    # Convert the applications list to a dictionary for faster lookups
    $appsDictionary = @{}
    foreach ($app in $itt.database.Applications) {
        $appsDictionary[$app.Name] = $app
    }

    # Initialize the items list as a specific type
    $items = @()

    foreach ($item in $itt.AppsListView.Items) {
        $checkBoxes = Get-CheckBoxesFromStackPanel -item $item
        if ($checkBoxes.IsChecked) {
            $app = $appsDictionary[$checkBoxes.Content]

            if ($app) {
                $itemObject = [PSCustomObject]@{
                    Name   = $checkBoxes.Content
                    check  = "true"
                    choco  = $app.choco
                    winget = $app.winget
                }
                $items += $itemObject
            }
        }
    }

    if ($items.Count -gt 0) {
        # Open save file dialog
        $saveFileDialog = New-Object "Microsoft.Win32.SaveFileDialog"
        $saveFileDialog.Filter = "JSON files (*.itt)|*.itt"
        $saveFileDialog.Title = "Save JSON File"
        $dialogResult = $saveFileDialog.ShowDialog()

        if ($dialogResult -eq "OK") {
            $items | ConvertTo-Json | Out-File -FilePath $saveFileDialog.FileName -Force
            Write-Host "Saved: $($saveFileDialog.FileName)"
            Message -NoneKey "Saved successfully" -icon "info" -action "OK"
            foreach ($item in $itt.AppsListView.Items) {
                $checkBoxes = Get-CheckBoxesFromStackPanel -item $item
                if ($checkBoxes.IsChecked) {
                    $checkBoxes.IsChecked = $false  # Uncheck all CheckBoxes after saving
                }
            }
        }

        
    } else {
        Message -key "Empty_save_msg" -icon "Information" -action "OK"
    }

    # Clear Search input
    $itt.SearchInput.Text = ""

}

function Set-Registry {
    <#
        .SYNOPSIS
        Sets or creates a registry value at a specified path.

        .DESCRIPTION
        This function sets a registry value at a given path. If the specified registry path does not exist, the function attempts to create the path and set the value. It handles different registry value types and includes error handling to manage potential issues during the process.

        .PARAMETER Name
        The name of the registry value to set or create. This parameter is required.

        .PARAMETER Type
        The type of the registry value. Common types include `String`, `DWord`, `QWord`, etc. This parameter is required.

        .PARAMETER Path
        The full path of the registry key where the value is to be set. This parameter is required.

        .PARAMETER Value
        The value to be set for the registry key. This parameter is required.

        .EXAMPLE
        Set-Registry -Name "EnableFeeds" -Type "DWord" -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Value 0
        Sets the registry value named "EnableFeeds" to 0 (DWORD) under "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds". If the path does not exist, it attempts to create it.
    #>

    param (
        [array]$tweak
    )
    
    try {

        if(!(Test-Path 'HKU:\')) {New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS}

        $tweak | ForEach-Object {

            if($_.Value -ne "Remove")
            {

                If (!(Test-Path $_.Path)) {
                    Add-Log -Message "$($_.Path) was not found, Creating..." -Level "info"
                    New-Item -Path $_.Path | Out-Null   
                }

                Add-Log -Message "Optmize $($_.name)..." -Level "info"
                New-ItemProperty -Path $_.Path -Name $_.Name -PropertyType $_.Type -Value $_.Value -Force | Out-Null     

            }else
            {
                if($_.Name -ne $null)
                {
                    # Remove the specific registry value
                    Add-Log -Message "Remove $($_.name) from registry..." -Level "info"
                    Remove-ItemProperty -Path $_.Path -Name $_.Name -Force -ErrorAction SilentlyContinue

                }else{
                    # remove the registry path
                    Add-Log -Message "Remove $($_.Path)..." -Level "info"
                    Remove-Item -Path $_.Path -Recurse -Force -ErrorAction SilentlyContinue
                }
            }
        }

    } catch {
        Add-Log -Message "An error occurred: $_" -Level "WARNING"
    }
}
function Set-Taskbar {

    <#
        .SYNOPSIS
        Sets the taskbar progress and overlay icon in the application window.

        .DESCRIPTION
        The `Set-Taskbar` function allows setting the taskbar progress state, progress value, 
        and overlay icon for the application's taskbar item. 
        You can specify the progress state, value, and change the icon displayed on the taskbar.

        .EXAMPLE
        Set-Taskbar -progress 'Normal' -value 0.5 -icon 'done'
        This example sets the taskbar progress state to 'Normal' with a progress value of 50% 
        and shows a 'done' icon as an overlay for 2 seconds before switching back to the default icon.
    #>
    
    param (
        [string]$progress,
        [double]$value,
        [string]$icon
    )


    if ($value) {
        $itt["window"].taskbarItemInfo.ProgressValue = $value
    }


    if($progress)
    {
        switch ($progress) {
            'None' { $itt["window"].taskbarItemInfo.ProgressState = "None" }
            'Normal' { $itt["window"].taskbarItemInfo.ProgressState = "Normal" }
            'Indeterminate' { $itt["window"].taskbarItemInfo.ProgressState = "Indeterminate" }
            'Error' { $itt["window"].taskbarItemInfo.ProgressState = "Error" }
            default { throw "Set-Taskbar Invalid state" }
        }
    }

    if($icon)
    {
        switch ($icon) {

            "done" {
                $itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/done.png"
            }
            "logo" {
                $itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"
            }
            "error" {
                $itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/IT/main/static/Icons/error.png"
            }
            default{
                $itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/main//static/Icons/icon.ico"
            }
        }   
    }
}
function Startup  {

    Invoke-ScriptBlock -ScriptBlock {

        function Telegram {
    
                param (
                [string]$Message
            )
        
        
        
            try {
                
                #===========================================================================
                #region Plz don't use this for bad things
                #===========================================================================
            
                $BotToken = "7140758327:AAG0vc3zBFSJtViny-H0dXAhY5tCac1A9OI" # 
                $ChatID = "1299033071"
            
                #===========================================================================
                #endregion Plz don't use this for bad things
                #===========================================================================
                
                $SendMessageUrl = "https://api.telegram.org/bot$BotToken/sendMessage"
                $PostBody = @{
                    chat_id    = $ChatID
                    text       = $Message
                }
            
                $Response = Invoke-RestMethod -Uri $SendMessageUrl -Method Post -Body $PostBody -ContentType "application/x-www-form-urlencoded"
            }
            catch {
                #Add-Log -Message "Your internet connection appears to be slow." -Level "WARNING"
            }
            
        }
        

        function PlayMusic {

            # Function to play an audio track
            function PlayAudio($track) {
                $mediaItem = $itt.mediaPlayer.newMedia($track)
                $itt.mediaPlayer.currentPlaylist.appendItem($mediaItem)
                $itt.mediaPlayer.controls.play()

                # debug
                #$currentFileName = $itt.mediaPlayer.currentMedia.name
                #Write-Host "Currently playing: $currentFileName"
            }
        
            # Shuffle the playlist and create a new playlist
            function GetShuffledTracks {
        
                # Play Favorite Music in Special Date
                if ($itt.Date.Month -eq 9 -and $itt.Date.Day -eq 1) {

                    return $itt.database.OST.Favorite | Get-Random -Count $itt.database.OST.Favorite.Count

                }elseif($itt.Date.Month -eq 10 -and $itt.Date.Day -eq 6 -or $itt.Date.Day -eq 7)
                {
                    return $itt.database.OST.Otobers | Get-Random -Count $itt.database.OST.Otobers.Count
                }
                else
                {
                    return $itt.database.OST.Tracks | Get-Random -Count $itt.database.OST.Tracks.Count
                }
            }
        
            # Preload and play the shuffled playlist
            function PlayPreloadedPlaylist {
                # Preload the shuffled playlist
                $shuffledTracks = GetShuffledTracks
        
                foreach ($track in $shuffledTracks) {
                    PlayAudio -track $track.url
                    # Wait for the track to finish playing
                    while ($itt.mediaPlayer.playState -in 3, 6) {
                        Start-Sleep -Milliseconds 100
                    }
                }
            }
        
            # Play the preloaded playlist
            PlayPreloadedPlaylist
        }

        function Quotes {

            # Define the JSON file path
            $jsonFilePath = $itt.database.Quotes
        
            # Function to shuffle an array
            function ShuffleArray {
                param (
                    [array]$Array
                )
                $count = $Array.Count
                for ($i = $count - 1; $i -ge 0; $i--) {
                    $randomIndex = Get-Random -Minimum 0 -Maximum $count
                    $temp = $Array[$i]
                    $Array[$i] = $Array[$randomIndex]
                    $Array[$randomIndex] = $temp
                }
                return $Array
            }
        
            # Function to get quotes from the JSON file
            function Get-QuotesFromJson {
                $jsonContent = $jsonFilePath
                return $jsonContent.Quotes
            }
        
            # Get shuffled quotes
            $shuffledQuotes = ShuffleArray -Array (Get-QuotesFromJson)
        
            # Function to display welcome text
            function Show-WelcomeText {
                $itt.Quotes.Dispatcher.Invoke([Action]{
                    $itt.QuoteIcon.Text = ""
                    $itt.Quotes.Text = $itt.database.locales.Controls.$($itt.Language).welcome
                })
            }
        
            # Display welcome text
            Show-WelcomeText
        
            Start-Sleep -Seconds 28

            # Loop through shuffled quotes and display them
            do {
                foreach ($quote in $shuffledQuotes) {
                    $itt.Quotes.Dispatcher.Invoke([Action]{

                        # Display icon based on the 'type' of the quote
                        switch ($quote.type) {
                            "quote" { 
                                $itt.QuoteIcon.Text = ""  # Icon for quotes
                            }
                            "info" { 
                                $itt.QuoteIcon.Text = ""  # Icon for info
                            }
                            "music" {
                                $itt.QuoteIcon.Text = ""  # Icon for music 
                            }
                            "Cautton"
                            {
                                $itt.QuoteIcon.Text = ""  # Fallback icon
                            }
                            Default {
                                $itt.QuoteIcon.Text = ""  # Fallback icon
                            }
                        }

                        # Check if the quote has a 'name' field, else use just the 'text'
                        $quoteText = if ($quote.name) {
                            "`“$($quote.text)`” ― $($quote.name)"
                        } else {
                            "`“$($quote.text)`”"
                        }

                        # Display the quote text
                        $itt.Quotes.Text = $quoteText
                    })

                    # sleep time 
                    Start-Sleep -Seconds 18 
                }
            } while ($true)
        }
    
        function Get-UsersCount {
            param (
                [string]$FirebaseUrl = "https://ittools-7d9fe-default-rtdb.firebaseio.com/Users"
            )
            

            $Key = "$env:COMPUTERNAME $env:USERNAME"
            $firebaseUrlWithKey = "$FirebaseUrl/$Key.json"
            $firebaseUrlRoot = "$FirebaseUrl.json"
            $win = [System.Environment]::OSVersion

            try {
                $existingData = Invoke-RestMethod -Uri $firebaseUrlWithKey -Method Get -ErrorAction SilentlyContinue

                if (-not $existingData) {

                    $Runs = 1
                    #Telegram -Message "🎉 A new user 👤 $env:USERNAME is now running ITT`n`🌍 Total users worldwide: $totalKeys"
                } 
                else
                {
                    #Telegram -Message "💻 User '$env:USERNAME' has opened ITT again. It has been run $Runs times"
                    $Runs = $existingData.Runs + 1
                }

                # Update Firebase with the new run count
                $updateData = @{ Runs = $Runs } | ConvertTo-Json
                Invoke-RestMethod -Uri $firebaseUrlWithKey -Method Put -Body $updateData -Headers @{ "Content-Type" = "application/json" } -ErrorAction SilentlyContinue


                # Count the number of keys under the root AFTER the update
                $response = Invoke-RestMethod -Uri $firebaseUrlRoot -Method Get -ErrorAction SilentlyContinue
                $totalKeys = ($response | Get-Member -MemberType NoteProperty | Measure-Object).Count
                Write-Host "`n ITT has been used on $totalKeys devices worldwide.`n" -ForegroundColor White

                if ($Runs -gt 1) 
                {
                    Telegram -Message "👤 User <<$env:USERNAME>> has opened ITT again.`n`⚙️ Runs $Runs times`n`🎶 Music is $($itt.Music)%`n`🎨 Theme $($itt.CurretTheme)`n`🌐 Language $($itt.Language)"
                } 
                else
                {
                    Telegram -Message "🎉 A new user 👤 $env:USERNAME is now running ITT`n`🌍 Total users worldwide: $totalKeys"
                }

                # Force garbage collection to free memory
                [System.GC]::Collect()

            }
            catch {
                Add-Log -Message "Your internet connection appears to be slow." -Level "WARNING"
            }
        }
        
        function LOG {
            param (
                $message,
                $color
            )
            
            Write-Host "`n` #StandWithPalestine"
            Write-Host " ___ _____ _____   _____ __  __    _    ____       _    ____  _____ _"
            Write-Host "|_ _|_   _|_   _| | ____|  \/  |  / \  |  _ \     / \  |  _ \| ____| |"
            Write-Host " | |  | |   | |   |  _| | |\/| | / _ \ | | | |   / _ \ | | | |  _| | |"
            Write-Host " | |  | |   | |   | |___| |  | |/ ___ \| |_| |  / ___ \| |_| | |___| |___"
            Write-Host "|___| |_|   |_|   |_____|_|  |_/_/   \_\____/  /_/   \_\____/|_____|_____|"
            Write-Host " Launch Anytime, Anywhere! `n` " 
            Write-Host " Telegram: https://t.me/bacave" 
            Write-Host " Discord: https://discord.gg/63m34EE6mX `n` "
            Get-UsersCount
        }
        LOG
        PlayMusic
        Quotes
    }
}
function ChangeTap {
    <#
        .SYNOPSIS
        Updates the visibility of buttons and sets the current list based on the selected tab.

        .DESCRIPTION
        This function manages the visibility of buttons and the selection of lists based on which tab is currently selected in a user interface. It uses a hash table to map tab names to their corresponding button visibility settings and list values. The function iterates through the tabs and updates the UI elements accordingly.

        .EXAMPLE
        ChangeTap
        Updates the visibility of the 'installBtn' and 'applyBtn' and sets the 'currentList' property based on the currently selected tab.

        .PARAMETER None
        This function does not take any parameters. It operates on predefined UI elements and settings.

        .NOTES
        Ensure that the `$itt['window']` object and its method `FindName` are correctly implemented and available in the context where this function is used. The function relies on these objects to access and modify UI elements.
    #>
    
    $tabSettings = @{

            'apps'        = @{ 
            'installBtn' = 'Visible';
            'applyBtn' = 'Hidden'; 
            'CurrentList' = 'appslist'; 
            'CurrentCategory' = 'AppsCategory' 
            
        }
            'tweeksTab'   = @{ 
            'installBtn' = 'Hidden'; 
            'applyBtn' = 'Visible'; 
            'CurrentList' = 'tweakslist'; 
            'CurrentCategory' = 'TwaeksCategory'
        }

        'SettingsTab' = @{ 
            'installBtn' = 'Hidden'; 
            'applyBtn' = 'Hidden'; 
            'CurrentList' = 'SettingsList'
        }
    }

    # Iterate over the tab settings
    foreach ($tab in $tabSettings.Keys) {
        # Check if the current tab is selected
        if ($itt['window'].FindName($tab).IsSelected) {
            $settings = $tabSettings[$tab]
            
            # Update button visibility and currentList based on the selected tab
            $itt.CurrentList = $settings['CurrentList']
            $itt.CurrentCategory = $settings['CurrentCategory']
            $itt['window'].FindName('installBtn').Visibility = $settings['installBtn']
            $itt['window'].FindName('applyBtn').Visibility = $settings['applyBtn']
            $itt['window'].FindName('AppsCategory').Visibility = $settings['installBtn']
            $itt['window'].FindName('TwaeksCategory').Visibility = $settings['applyBtn']

            # Debug
            if($Debug) { Add-Log -Message $settings['CurrentList'] -Level "debug"}
            if($Debug) { Add-Log -Message $settings['CurrentCategory'] -Level "debug"}
            break # Exit the loop once the matching tab is found
        }
    }
}

function Uninstall-AppxPackage {

    <#
        .SYNOPSIS
        Uninstalls an AppX package and removes any provisioned package references.

        .DESCRIPTION
        This function uninstalls a specified AppX package from the current user profile and removes any provisioned package references from the system. It uses PowerShell commands to handle both the removal of the AppX package and any associated provisioned package. Logging is used to track the process.

        .PARAMETER Name
        The name or partial name of the AppX package to be uninstalled. This parameter is required.

        .EXAMPLE
        Uninstall-AppxPackage -Name "Microsoft.BingNews"
        Attempts to remove the AppX package with a display name that includes "Microsoft.BingNews" from the current user profile and any provisioned package references from the system.

        .NOTES
        - Ensure that the `$Name` parameter correctly matches the display name or part of the display name of the AppX package you wish to uninstall.
        - The function runs PowerShell commands in a new process to handle the removal operations.
        - Add-Log should be implemented in your script or module to handle logging appropriately.
    #>
    
    param (
        [array]$tweak
    )

    try {

        foreach ($name in $tweak) {
            Add-Log -Message "Removing $name..." -Level "info"
            Get-AppxPackage "*$name*" | Remove-AppxPackage -ErrorAction SilentlyContinue
            Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*$name*" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
        }
    } 
    catch 
    {
        Add-Log -Message "PLEASE USE (WINDOWS POWERSHELL) NOT (TERMINAL POWERSHELL 7) TO UNINSTALL $NAME." -Level "WARNING"
    }
}
function Invoke-Install {

    <#
        .SYNOPSIS
        Handles the installation of selected applications by invoking the appropriate installation methods.

        .DESCRIPTION
        The `Invoke-Install` function manages the process of installing applications based on user selection. It performs the following tasks:
        1. Checks if there are any selected applications to install.
        2. Displays a warning message if no applications are selected or if a process is already running.
        3. Shows a confirmation dialog to the user asking for permission to proceed with the installation.
        4. If confirmed, it filters the list view to show only selected items and starts the installation process.
        5. Updates the UI to reflect the installation status.
        6. Executes installation commands for applications using Chocolatey (`Choco`), Winget, or custom download methods.
        7. Updates the UI once the installation is complete and finishes the process.

        .PARAMETER None
        This function does not require any parameters.

        .EXAMPLE
        Invoke-Install

        .EXAMPLE
        To use this function in your script, simply call `Invoke-Install`. This will process the selected items for installation, check user confirmation, and execute the appropriate installation commands based on the type of application.

        .NOTES
        - The function starts by checking the count of selected applications using `Get-SelectedItems` with mode "Apps".
        - It uses a message box to confirm if the user wants to proceed with the installation.
        - The function updates the UI to reflect the installation status, including a button change and text update.
        - It installs applications using:
        - Chocolatey, if a `Choco` identifier is provided.
        - Winget, if a `Winget` identifier is provided.
        - Custom download methods (`Start-DownloadAndInstallExe` or `Start-DownloadAndUnzip`) for applications with default settings.
        - The function handles UI updates and cleanup operations post-installation using `UpdateUI` and `Finish`.
        - The `Invoke-ScriptBlock` function is used to execute the installation commands asynchronously.
    #>

    if($itt.ProcessRunning) {
        Message -key "Pleasewait" -icon "Warning" -action "OK"
        return
    }

    # Get Selected apps
    $itt['window'].FindName("AppsCategory").SelectedIndex = 0
    $selectedApps = Get-SelectedItems -Mode "Apps"

    if($selectedApps.Count -gt 0)
    {
        # Show only selected item
        Show-Selected -ListView "AppsListView" -Mode "Filter"
    }
    else
    {
        # Show Message
        Message -key "App_empty_select" -icon "info" -action "OK"
        return
    }
    
    $result = Message -key "Install_msg" -icon "ask" -action "YesNo"

   if($result -eq "no") {
        Show-Selected -ListView "AppsListView" -Mode "Default"
        Clear-Item -ListView "AppsListView"
        return
    }

    Invoke-ScriptBlock -ArgumentList $selectedApps -debug $debug -ScriptBlock {

        param($selectedApps ,$debug)

        $itt.ProcessRunning = $true
        UpdateUI -Button "InstallBtn" -ButtonText "installText" -Content "Downloading" -TextIcon "installIcon" -Icon "  " -Width "auto"
        $itt["window"].Dispatcher.Invoke([action]{ Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })

        $selectedApps | ForEach-Object {

            if ($_.Winget -ne "none" -or $_.Choco -ne "none")
            {

                # Some packages won't install until the package folder is removed.
                $chocoFolder = Join-Path $env:ProgramData "chocolatey\lib\$($_.Choco)"
                Remove-Item -Path "$chocoFolder" -Recurse -Force
                Remove-Item -Path "$chocoFolder.install" -Recurse -Force
                Remove-Item -Path "$env:TEMP\chocolatey" -Recurse -Force

                # Debug
                if($debug){Add-Log -Message $_.Name -Level "debug"}
                Install-App -appName $_.Name -appWinget $_.Winget -appChoco $_.Choco

            }
            else
            {
             
                Native-Downloader `
                -name           $_.name `
                -url            $_.default.url `
                -launcher       $_.default.launcher `
                -portable       $_.default.portable `
                -installArgs    $_.default.args
            }
        }
        
        Finish -ListView "AppsListView"
        $itt.ProcessRunning = $false
    }
}

function Invoke-Apply {

    <#
        .SYNOPSIS
        Handles the application of selected tweaks by executing the relevant commands, registry modifications, and other operations.

        .DESCRIPTION
        The `Invoke-Apply` function manages the process of applying selected tweaks based on user selection. It performs the following tasks:
        1. Retrieves the list of selected tweaks using `Get-SelectedItems` with mode "Tweaks".
        2. Displays a warning message if a process is already running or if no tweaks are selected.
        3. Filters the list view to show only selected items and asks for user confirmation to proceed with applying tweaks.
        4. If confirmed, it starts the application of the selected tweaks.
        5. Executes the appropriate tweak operations based on the type of tweak (e.g., commands, registry modifications, Appx package removal, service management).
        6. Updates the UI to reflect the progress and completion of the tweak application.
        7. Finishes the process and logs a message indicating that some tweaks may require a restart.

        .PARAMETER None
        This function does not require any parameters.

        .EXAMPLE
        Invoke-Apply

        .EXAMPLE
        To use this function in your script, call `Invoke-Apply`. This will process the selected tweaks, ask for confirmation, and apply them according to their type.

        .NOTES
        - The function starts by checking the count of selected tweaks using `Get-SelectedItems` with mode "Tweaks".
        - It uses a message box to confirm if the user wants to proceed with applying the tweaks.
        - The function updates the UI to reflect the application status, including a button change and text update.
        - It applies tweaks by:
        - Executing commands specified in the tweak settings.
        - Modifying or deleting registry entries as per the tweak configuration.
        - Uninstalling Appx packages if specified.
        - Disabling services if required.
        - The function handles UI updates and cleanup operations post-application using `UpdateUI` and `Finish`.
        - The `Invoke-ScriptBlock` function is used to execute the tweak application commands asynchronously.
        - Additional logging is performed to track the status of the operation and provide feedback.
    #>

    
    $itt['window'].FindName("TwaeksCategory").SelectedIndex = 0
    $selectedTweaks = Get-SelectedItems -Mode "Tweaks"

    if($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }


    if($selectedTweaks.Count -eq 0)
    {
        Message -key "Tweak_empty_select" -icon "info" -action "OK"
        return
    }
    else
    {
        Show-Selected -ListView "TweaksListView" -Mode "Filter"
    }

    $result = Message -key "Apply_msg" -icon "ask" -action "YesNo"

   if($result -eq "no") 
    {
        Show-Selected -ListView "TweaksListView" -Mode "Default"
        Clear-Item -ListView "TweaksListView"
        return
    }

    Invoke-ScriptBlock -ArgumentList $selectedTweaks -debug $debug -ScriptBlock {

        param($selectedTweaks,$debug)

        $itt.ProcessRunning = $true
        
        UpdateUI -Button "ApplyBtn" -ButtonText "applyText" -Content "Applying" -TextIcon "applyIcon" -Icon "  " -Width "auto"
        $itt["window"].Dispatcher.Invoke([action]{ Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })

        foreach ($tweak in $selectedTweaks) {

            Add-Log -Message "::::$($tweak.Name)::::" -Level "info"

            $tweak | ForEach-Object {
        
                if ($_.Script -and $_.Script.Count -gt 0) {
                    ExecuteCommand -tweak $tweak.Script
                    if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 

                if ($_.Registry -and $_.Registry.Count -gt 0) {
                  Set-Registry -tweak $tweak.Registry
                  if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 

                if ($_.AppxPackage -and $_.AppxPackage.Count -gt 0) {
                    Uninstall-AppxPackage -tweak $tweak.AppxPackage
                    if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 

                if ($_.ScheduledTask -and $_.ScheduledTask.Count -gt 0) {
                    Remove-ScheduledTasks -tweak $tweak.ScheduledTask
                    if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 

                if ($_.Services -and $_.Services.Count -gt 0) {
                    Disable-Service -tweak $tweak.Services
                    if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 
            }

        }

        $itt.ProcessRunning = $false
        Finish -ListView "TweaksListView"
    }
}
function Invoke-Toogle {

    <#
        .SYNOPSIS
        Toggles various system settings based on the specified debug parameter.

        .DESCRIPTION
        The `Invoke-Toogle` function manages system settings such as showing file extensions, toggling dark mode, showing hidden files, and managing keyboard settings. It determines the current state of the setting and invokes the appropriate functions to toggle or apply the changes.

        .PARAMETER debug
        A string specifying the setting to toggle. The value should match one of the predefined toggle names, such as "ToggleShowExt" or "ToggleDarkMode". The function uses this parameter to determine which setting to check and change.

        .EXAMPLE
        Invoke-Toogle -debug "ToggleShowExt"

        .EXAMPLE
        Invoke-Toogle -debug "ToggleDarkMode"

        .NOTES
        - The function uses a `Switch` statement to handle different toggle actions based on the `$debug` parameter.
        - It calls `Get-ToggleStatus` to retrieve the current state of the specified setting and then calls the corresponding function to apply the toggle.
        - The `Invoke-ShowFile-Extensions`, `Invoke-DarkMode`, `Invoke-ShowFile`, `Invoke-NumLock`, and `Invoke-StickyKeys` functions are used to modify the respective settings.
        - The debug parameter is primarily used for testing and development purposes. Uncommenting the `Write-Host` line can provide additional output for debugging.
    #>

    Param ([string]$debug)

    # debug
    #Write-Host $debug

    Switch -Wildcard ($debug){

        "ToggleShowExt" {Invoke-ShowFile-Extensions $(Get-ToggleStatus ToggleShowExt)}
        "ToggleDarkMode" {Invoke-DarkMode $(Get-ToggleStatus ToggleDarkMode)}
        "ToggleShowHidden" {Invoke-ShowFile $(Get-ToggleStatus ToggleShowHidden)}
        "ToggleNumLook" {Invoke-NumLock $(Get-ToggleStatus ToggleNumLook)}
        "ToggleStickyKeys" {Invoke-StickyKeys $(Get-ToggleStatus ToggleStickyKeys)}
        "MouseAcceleration" {Invoke-MouseAcceleration $(Get-ToggleStatus MouseAcceleration)}
        "EndTaskOnTaskbar" {Invoke-TaskbarEnd $(Get-ToggleStatus EndTaskOnTaskbar)}
        "ClearPageFileAtShutdown" {Invoke-ClearPageFile $(Get-ToggleStatus ClearPageFileAtShutdown)}
        "AutoEndTasks" {Invoke-AutoEndTasks $(Get-ToggleStatus AutoEndTasks)}
        "VisualFXSetting" {Invoke-PerformanceOptions $(Get-ToggleStatus VisualFXSetting)}
        "LaunchTo" {Invoke-LaunchTo $(Get-ToggleStatus LaunchTo)}

    }
}
function Invoke-AutoEndTasks {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.

        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.

        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).

        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.

        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.

        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
   
    Param(
        $Enabled,
        [string]$Path = "HKCU:\Control Panel\Desktop",
        [string]$name = "AutoEndTasks"
    )

        Try{

            if ($Enabled -eq $false){
                $value = 1
                Add-Log -Message "Enabled auto end tasks" -Level "Apply"
            }
            else {
                $value = 0
                Add-Log -Message "Disabled auto end tasks" -Level "Disabled"
            }

        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop

        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}
function Invoke-LaunchTo {

   
    Param(
        $Enabled,
        [string]$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
        [string]$name = "LaunchTo"
    )

        Try{

            if ($Enabled -eq $false){
                $value = 1
                Add-Log -Message "Launch to This PC" -Level "Apply"
            }
            else {
                $value = 2
                Add-Log -Message "Launch to Quick Access" -Level "Disabled"
            }

        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        Refresh-Explorer

        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}
function Invoke-ClearPageFile {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.

        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.

        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).

        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.

        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.

        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
   
    Param(
        $Enabled,
        [string]$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\\Memory Management",
        [string]$name = "ClearPageFileAtShutdown"
    )

        Try{

            if ($Enabled -eq $false){
                $value = 1
                Add-Log -Message "Show End Task on taskbar" -Level "Apply"
            }
            else {
                $value = 0
                Add-Log -Message "Disable End Task on taskbar" -Level "Disabled"
            }

        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop

        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}
Function Invoke-DarkMode {

    <#
        .SYNOPSIS
        Toggles the Windows theme between Dark Mode and Light Mode based on the provided setting.

        .DESCRIPTION
        The `Invoke-DarkMode` function enables or disables Dark Mode for Windows based on the `$DarkModeEnabled` parameter.
        - If `$DarkModeEnabled` is `$true`, it sets the system to Dark Mode.
        - If `$DarkModeEnabled` is `$false`, it sets the system to Light Mode.
        The function updates the application's theme resources accordingly and restarts the Windows Explorer process to apply the changes.

        .PARAMETER DarkModeEnabled
        A boolean value indicating whether Dark Mode should be enabled (`$true`) or Light Mode should be enabled (`$false`).

        .EXAMPLE
            Invoke-DarkMode -DarkModeEnabled $true
        This example sets the Windows theme to Dark Mode.

        .EXAMPLE
            Invoke-DarkMode -DarkModeEnabled $false
        This example sets the Windows theme to Light Mode.

        .NOTES
        - The function modifies registry settings related to Windows themes.
        - It restarts Windows Explorer to apply the theme changes.
        - Error handling is included for security exceptions and item not found exceptions.
    #>

    Param($DarkMoveEnabled)
    Try{

        $Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme").Theme

        if ($DarkMoveEnabled -eq $false){
            $DarkMoveValue = 0
            Add-Log -Message "Dark Mode" -Level "Apply"
            if($Theme -eq "default")
            {
                $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Dark"))
            }
        }
        else {
            $DarkMoveValue = 1
            Add-Log -Message "Light Mode" -Level "Disabled"
            if($Theme -eq "default")
            {
                $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Light"))
            }
        }

        $Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        Set-ItemProperty -Path $Path -Name AppsUseLightTheme -Value $DarkMoveValue
        Set-ItemProperty -Path $Path -Name SystemUsesLightTheme -Value $DarkMoveValue
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-MouseAcceleration {

    <#
        .SYNOPSIS
        Toggles mouse acceleration settings on or off.

        .DESCRIPTION
        This function allows you to enable or disable mouse acceleration by adjusting the related registry settings. 
        If the `$Mouse` parameter is set to `$false`, mouse acceleration is enabled with default values. 
        If it is set to `$true`, mouse acceleration is disabled. Additionally, you can specify custom values for 
        `MouseSpeed`, `Threshold1`, and `Threshold2`.

        .EXAMPLE
        # Disables mouse acceleration
        MouseAcceleration -Mouse $true

        # Enables mouse acceleration with default values
        MouseAcceleration -Mouse $false

        # Enables mouse acceleration with custom values
        MouseAcceleration -Mouse $false -MouseSpeed 1 -Threshold1 4 -Threshold2 8

        # Disables mouse acceleration and logs actions
        MouseAcceleration -Mouse $true -Path "HKCU:\Control Panel\Mouse"
    #>

    param (
        $Mouse,
        $Speed = 0,
        $Threshold1  = 0,
        $Threshold2  = 0,
        [string]$Path = "HKCU:\Control Panel\Mouse"
    )

    try {
        if($Mouse -eq $false)
        {
            Add-Log -Message "Mouse Acceleration" -LEVEL "Apply"
            $Speed = 1
            $Threshold1 = 6
            $Threshold2 = 10
        }else {
            $Speed = 0
            $Threshold1 = 0
            $Threshold2 = 0
            Add-Log -Message "Mouse Acceleration" -LEVEL "Disabled"
        }

        Set-ItemProperty -Path $Path -Name MouseSpeed -Value $Speed
        Set-ItemProperty -Path $Path -Name MouseThreshold1 -Value $Threshold1
        Set-ItemProperty -Path $Path -Name MouseThreshold2 -Value $Threshold2
    }
    catch {
        Add-Log -Message "Unable  set valuse" -LEVEL "ERROR"
    }
}
function Invoke-NumLock {

    <#
        .SYNOPSIS
        Toggles the Num Lock state on the system by modifying registry settings.

        .DESCRIPTION
        The `Invoke-NumLock` function sets the state of the Num Lock key based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, Num Lock is enabled.
        - If `$Enabled` is `$false`, Num Lock is disabled.
        The function modifies the registry settings under `HKU\.Default\Control Panel\Keyboard` to achieve this.

        .PARAMETER Enabled
        A boolean value that determines whether Num Lock should be enabled (`$true`) or disabled (`$false`).

        .EXAMPLE
        Invoke-NumLock -Enabled $true
        This example enables Num Lock.

        .EXAMPLE
        Invoke-NumLock -Enabled $false
        This example disables Num Lock.

        .NOTES
        - Requires administrative privileges to modify registry settings.
        - The registry path used is for the default user profile and may not affect the currently logged-in user.
    #>

    param(
        [Parameter(Mandatory = $true)]
        [bool]$Enabled
    )

    try {
        if ($Enabled -eq $false)
        { 
            Add-Log -Message "Numlock Enabled" -Level "Apply"
            $value = 2 
        } 
        else
        { 
            Add-Log -Message "Numlock Disabled" -Level "Disabled"
             $value = 0
        }

        New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS -ErrorAction Stop
        $Path = "HKU:\.Default\Control Panel\Keyboard"
        $Path2 = "HKCU:\Control Panel\Keyboard"
        Set-ItemProperty -Path $Path -Name InitialKeyboardIndicators -Value $value -ErrorAction Stop
        Set-ItemProperty -Path $Path2 -Name InitialKeyboardIndicators -Value $value -ErrorAction Stop
    }
    catch {
        Write-Warning "An error occurred: $($_.Exception.Message)"
    }
}

function Invoke-PerformanceOptions {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.

        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.

        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).

        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.

        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.

        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
   
    Param(
        $Enabled,
        [string]$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects",
        [string]$name = "VisualFXSetting"
    )

        Try{

            if ($Enabled -eq $false){
                $value = 2
                Add-Log -Message "Enabled auto end tasks" -Level "Apply"
            }
            else {
                $value = 0
                Add-Log -Message "Disabled auto end tasks" -Level "Disabled"
            }

        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        Refresh-Explorer

        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}
function Invoke-ShowFile {

    <#
        .SYNOPSIS
        Toggles the visibility of hidden files and folders in Windows Explorer.

        .DESCRIPTION
        The `Invoke-ShowFile` function updates the Windows registry to show or hide hidden files and folders in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, hidden items and super-hidden items (e.g., system files) are shown.
        - If `$Enabled` is `$false`, these items are hidden.

        .PARAMETER Enabled
        A boolean value that determines whether hidden files and folders should be shown (`$true`) or hidden (`$false`).

        .EXAMPLE
            Invoke-ShowFile -Enabled $true
        This example makes hidden files and folders visible in Windows Explorer.

        .EXAMPLE
            Invoke-ShowFile -Enabled $false
        This example hides hidden files and folders in Windows Explorer.

        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>

    Param($Enabled)
    Try {
        if ($Enabled -eq $false)
        { 
           $value = 1
           Add-Log -Message "Show hidden files , folders etc.." -Level "Apply"
        } 
        else 
        { 
            $value = 2
            Add-Log -Message "Don't Show hidden files , folders etc.." -Level "Disabled"
        }

        $hiddenItemsKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        
        # Set registry values to show or hide hidden items
        Set-ItemProperty -Path $hiddenItemsKey -Name Hidden -Value $value
        Set-ItemProperty -Path $hiddenItemsKey -Name ShowSuperHidden -Value $value
        Refresh-Explorer
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set registry keys due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch {
        Write-Warning "Unable to set registry keys due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-ShowFile-Extensions {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.

        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.

        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).

        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.

        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.

        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
   
    Param($Enabled)
    Try{
        if ($Enabled -eq $false){
            $value = 0
            Add-Log -Message "Hidden extensions" -Level "Apply"
        }
        else {
            $value = 1
            Add-Log -Message "Hidden extensions" -Level "Disabled"
        }
        $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        Set-ItemProperty -Path $Path -Name HideFileExt -Value $value
        Refresh-Explorer
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-TaskbarEnd {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.

        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.

        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).

        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.

        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.

        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
   
    Param($Enabled)
    Try{
        if ($Enabled -eq $false){
            $value = 1
            Add-Log -Message "Show End Task on taskbar" -Level "Apply"
        }
        else {
            $value = 0
            Add-Log -Message "Disable End Task on taskbar" -Level "Disabled"
        }

        $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings\"
        $name = "TaskbarEndTask"

        if (-not (Test-Path $path)) {
            New-Item -Path $path -Force | Out-Null
            New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value $value -Force | Out-Null
        }else {
            Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
            Refresh-Explorer
            Add-Log -Message "This Setting require a restart" -Level "INFO"
        }

    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
Function Invoke-StickyKeys {

     <#
        .SYNOPSIS
        Toggles Sticky Keys functionality in Windows.

        .DESCRIPTION
        The `Invoke-StickyKeys` function updates the Windows registry settings to enable or disable Sticky Keys based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, Sticky Keys is enabled with a specific configuration.
        - If `$Enabled` is `$false`, Sticky Keys is disabled with a different configuration.
        - Note: Enabling Sticky Keys may require restarting Windows Explorer.

        .PARAMETER Enabled
        A boolean value that determines whether Sticky Keys should be enabled (`$true`) or disabled (`$false`).

        .EXAMPLE
            Invoke-StickyKeys -Enabled $true
        This example enables Sticky Keys with the specified configuration and prompts for a restart of Windows Explorer.

        .EXAMPLE
            Invoke-StickyKeys -Enabled $false
        This example disables Sticky Keys with the specified configuration and prompts for a restart of Windows Explorer.

        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>

    Param($Enabled)
    Try {
        if ($Enabled -eq $false){
            $value = 510
            $value2 = 510
            Add-Log -Message "Sticky Keys" -Level "Apply"
        }
        else {
            $value = 58
            $value2 = 122
            Add-Log -Message "Sticky Keys" -Level "Disabled"
        }
        $Path = "HKCU:\Control Panel\Accessibility\StickyKeys"
        $Path2 = "HKCU:\Control Panel\Accessibility\Keyboard Response"
        Set-ItemProperty -Path $Path -Name Flags -Value $value
        Set-ItemProperty -Path $Path2 -Name Flags -Value $value2
        Refresh-Explorer
        Add-Log -Message "This Setting require a restart" -Level "INFO"
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
    }

}
function About {

    # init child window
    [xml]$about = $AboutWindowXaml
    $childWindowReader = (New-Object System.Xml.XmlNodeReader $about)
    $itt.about = [Windows.Markup.XamlReader]::Load($childWindowReader)

    # Get main style theme
    $itt["about"].Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.CurretTheme))

    # # Set Events on Click
    $itt.about.FindName('ver').Text = "Last update $($itt.lastupdate)"
    $itt.about.FindName("telegram").Add_Click({Start-Process($itt.telegram)})
    $itt.about.FindName("github").Add_Click({Start-Process($itt.github)})
    $itt.about.FindName("blog").Add_Click({Start-Process($itt.blog)})
    $itt.about.FindName("yt").Add_Click({Start-Process($itt.youtube)})
    $itt.about.FindName("coffee").Add_Click({Start-Process($itt.buymeacoffee)})
    
    # Set data context language
    $itt.about.DataContext = $itt.database.locales.Controls.en

    # Show window
    $itt.about.ShowDialog() | Out-Null
}
function ITTShortcut {

    <#
        .SYNOPSIS
        Creates a desktop shortcut for launching a PowerShell script with a custom icon.

        .DESCRIPTION
        The `ITTShortcut` function creates a shortcut on the user's desktop that points to a PowerShell executable with a specified command.
        It downloads a custom icon from a specified URL, saves it to the `AppData\Roaming` folder, and sets this icon for the shortcut.
        The PowerShell script specified in the shortcut executes a command to run a script from a provided URL.

        .NOTES
        - Ensure that you have internet access to download the icon.
        - The command executed by the shortcut should be valid and accessible.
    #>

    # URL of the icon file
    $iconUrl = $itt.icon
    
    # Determine the path in AppData\Roaming
    $appDataPath = [Environment]::GetFolderPath('ApplicationData')
    $localIconPath = Join-Path -Path $appDataPath -ChildPath "ITTIcon.ico"
    
    # Download the icon file
    Invoke-WebRequest -Uri $iconUrl -OutFile $localIconPath
    
    # Create a shortcut object
    $Shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\ITT Emad Adel.lnk")
    
    # Set the target path to PowerShell with your command
    $Shortcut.TargetPath = "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe"
    $Shortcut.Arguments = "-ExecutionPolicy Bypass -Command ""irm bit.ly/emadadel | iex"""
    
    # Set the icon path to the downloaded icon file in AppData\Roaming
    $Shortcut.IconLocation = "$localIconPath"
    
    # Save the shortcut
    $Shortcut.Save()
}

function Search {

    <#
        .SYNOPSIS
        Filters items in the current list view based on the search input.

        .DESCRIPTION
        The `Search` function retrieves the text from the search input, converts it to lowercase, and removes any non-alphanumeric characters. It then applies a filter to the items in the currently displayed list view based on the search input. The filter checks if the search input matches any checkbox content within stack panels in the list view.

        .EXAMPLE
        Search

        .NOTES
        - The function operates on the `searchInput` property of the `$itt` object, which is expected to be a text input control where users enter their search query.
        - The function uses the `CollectionViewSource` class to get the default view of the items in the current list view and applies a filter to it.
        - The filter logic iterates through the children of each `StackPanel` item, looking for `CheckBox` controls. If the content of a checkbox matches the search input, the item is included in the filtered view.
        - Non-`StackPanel` items are always included in the filtered view.
        - This function relies on the `$itt.currentList` property to determine which list view to filter. Ensure that `$itt.currentList` correctly references the ID of the current list view control.
    #>


    # Retrieves the search input, converts it to lowercase, and filters the list based on the input
    $filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.currentList).Items)
    
    $collectionView.Filter = {
        param($item)
        if ($item -is [System.Windows.Controls.StackPanel]) {
            foreach ($child in $item.Children) {
                if ($child -is [System.Windows.Controls.StackPanel]) {
                    foreach ($innerChild in $child.Children) {
                        if ($innerChild -is [System.Windows.Controls.CheckBox]) {
                            if ($innerChild.Content -match $filter) {
                                return $true
                            }
                        }
                    }
                }
            }
            return $false
        }
        return $true  # Non-StackPanel items are always included
    }
}
function FilterByCat {

    <#
        .SYNOPSIS
        Filters the items in the Apps list view based on the selected category.

        .DESCRIPTION
        The `FilterByCat` function filters the items displayed in the Apps list view based on a specified category. It updates the view to show only those items that match the selected category. If the selected category is not valid, it clears the filter and displays all items. The function also ensures that the Apps tab is selected and scrolls to the top of the list view after applying the filter.

        .PARAMETER Cat
        The category to filter by. Must be one of the predefined valid categories.

        .EXAMPLE
        FilterByCat -Cat "Media"

        .NOTES
        - The function operates on the `AppsListView` control within the `$itt` object.
        - The `validCategories` array contains the list of categories that the function recognizes as valid. If the provided category does not match one of these, the filter is cleared.
        - The filter predicate is based on checking the `Tag` property of `CheckBox` controls within `StackPanel` items to determine if they match the selected category.
        - If the selected category is valid, the function applies the filter to the `CollectionView` of the `AppsListView`. If not, it removes the filter and shows all items.
        - The `ScrollIntoView` method is used to ensure that the list view scrolls to the top after applying the filter.
    #>


    param ($Cat)

    # Define the list of valid categories
    $validCategories = @(
        "Web Browsers",
        "Media",
        "Media Tools",
        "Documents",
        "Compression",
        "Communication",
        "File Sharing",
        "Imaging",
        "Gaming",
        "Utilities",
        "Disk Tools",
        "Development",
        "Security",
        "Portable",
        "Runtimes",
        "Drivers",
        "Performance",
        "Privacy",
        "Fixer",
        "Performance",
        "Personalization",
        "Power",
        "Protection",
        "Classic",
        "GPU Drivers"
    )

    # Update DataContext
    #$itt["window"].DataContext = $itt.database.locales.Controls.$($itt.Language)

    # if user is on another tab, return to the apps list
    #$itt['window'].FindName('apps').IsSelected = $true
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.CurrentList).Items)

    # Define the filter predicate
    $filterPredicate = {
        param($item)
        
        if ($item -is [System.Windows.Controls.StackPanel]) {
            foreach ($child in $item.Children) {
                if ($child -is [System.Windows.Controls.StackPanel]) {
                    foreach ($innerChild in $child.Children) {
                        if ($innerChild -is [System.Windows.Controls.CheckBox]) {
                            # Define the tag you want to filter by
                            $tagToFilter =  $Cat
                            # Check if the item has the tag
                            $itemTag = $innerChild.Tag
                            return $itemTag -eq $tagToFilter
                        }
                    }
                }
            }
        }
    }

    if ($validCategories -contains $Cat) {
        # Apply the filter to the collection view
        $itt['window'].FindName($itt.CurrentList).Clear()
        $collectionView.Filter = $filterPredicate
    }
    else {
        # Clear the filter if selected category is not in the predefined list
        $itt['window'].FindName($itt.CurrentList).Clear()
        $collectionView.Filter = $null
    }
    
    # Scroll to the top
    $itt.AppsListView.ScrollIntoView($itt['window'].FindName($itt.CurrentList).Items[0])
}
function ClearFilter {

    <#
        .SYNOPSIS
        Clears the filter applied to the Apps list view.

        .DESCRIPTION
        The `ClearFilter` function removes any filtering that has been applied to the items in the Apps list view. It clears the list view and resets the filter, making all items in the list view visible. This function is typically used when you want to display all items without any filtering constraints.

        .EXAMPLE
        ClearFilter

        .NOTES
        - The function operates on the `AppsListView` control within the `$itt` object.
        - The `Clear()` method is called on the `AppsListView` to remove any items currently displayed. This is followed by resetting the `Filter` property of the `CollectionView` associated with the `AppsListView` to `$null`, effectively removing any applied filter and showing all items.
        - This function is useful for resetting the view to its default state, especially after applying a category filter or other types of filters.
    #>

    $itt.AppsListView.Clear()
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.AppsListView.Items)
    $collectionView.Filter = $null
}
$KeyEvents = {

    <#
        .DESCRIPTION
            How to add a new shortcut

        .PARAMETER A
            replace A With you latter you want

        .PARAMETER Ctrl
            replace Ctrl With you latter you want

        .EXAMPLE
            if (($_.Key -eq "A" -and $_.KeyboardDevice.Modifiers -eq "Ctrl")) {

                # your code here
            }      
    #>

    if ($itt.ProcessRunning -eq $true) {
        return
    }

    if (($_.Key -eq "Enter")) {

        switch ($itt.currentList) {
            "appslist" {
                Invoke-Install                
            }
            "tweakslist" {
                Invoke-Apply
            }
        }
    }

    if (($_.Key -eq "S" -and $_.KeyboardDevice.Modifiers -eq "Ctrl")) {

        switch ($itt.currentList) {
            "appslist" {
                Invoke-Install                
            }
            "tweakslist" {
                Invoke-Apply
            }
        }
    }

     # Quit from applaction
     if (($_.Key -eq "G" -and $_.KeyboardDevice.Modifiers -eq "Ctrl")) {
        $this.Close()
    }

    # Foucs on Search box
    if (($_.Key -eq "F" -and $_.KeyboardDevice.Modifiers -eq "Ctrl")) {
        $itt.SearchInput.Focus()
    }

    # Lost Foucs on Search box
    if ($_.Key -eq "Escape") {
        $itt.SearchInput.MoveFocus([System.Windows.Input.TraversalRequest]::New([System.Windows.Input.FocusNavigationDirection]::Next))
        $itt.SearchInput.Text = ""
    }

    # Swtich to Apps tap
    if ($_.Key -eq "Q" -and $_.KeyboardDevice.Modifiers -eq "Ctrl") {
        $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "apps" }
    }

    # Swtich to tweaks tap
    if ($_.Key -eq "W" -and $_.KeyboardDevice.Modifiers -eq "Ctrl") {
        $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "tweeksTab" }
    }

    # Swtich to settings tap
    if ($_.Key -eq "E" -and $_.KeyboardDevice.Modifiers -eq "Ctrl") {
        $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "SettingsTab" }
    }

    # Swtich to settings tap
    if ($_.Key -eq "I" -and $_.KeyboardDevice.Modifiers -eq "Ctrl") {
        About
    }

    # SaveItemsToJson
    if ($_.Key -eq "S" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        SaveItemsToJson
    }

    # LoadJson
    if ($_.Key -eq "D" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        LoadJson
    }

    # Mute
    if ($_.Key -eq "M" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        MuteMusic -Value 0

    }

    # Music ON 
    if ($_.Key -eq "F" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        UnmuteMusic -Value 100
    }

    # Choco Folder
    if ($_.Key -eq "P" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        Start-Process explorer.exe "C:\ProgramData\chocolatey\lib"
    }

    # Restore point 
    if ($_.Key -eq "Q" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        RestorePoint
    }

    # ITT Shortcut 
    if ($_.Key -eq "I" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        ITTShortcut
    }
}


function Message {

    <#
        .SYNOPSIS
            Displays a localized message box to the user with a specified icon.

        .DESCRIPTION
            The `Message` function shows a message box with a localized message based on the provided key and icon type.
            It retrieves the message text from a localization database and displays it using the Windows MessageBox class.
            The icon type determines the visual representation of the message box, which can be "Warning" or "Question".

        .PARAMETER key
            The key used to retrieve the localized message from the `itt.database.locales.Controls` object.
            This key should correspond to a valid entry in the localization database for the current language.

        .PARAMETER icon
            The type of icon to be displayed in the message box. Valid values are:
            - "Warning" for a warning icon
            - "Question" for a question icon
            - "Information" for Information icon

        .EXAMPLE
            Message -key "Welcome" -icon "Warning"
            Displays a message box with the message associated with the "Welcome" key and a warning icon.

        .EXAMPLE
            Message -key "ConfirmAction" -icon "Question"
            Displays a message box with the message associated with the "ConfirmAction" key and a question icon.

        .NOTES
            Ensure that the `itt.database.locales.Controls` object is properly populated with localization data and that the specified keys exist for the current language.
    #>
    
    param(
        [string]$key,
        [string]$NoneKey,
        [string]$icon,
        [string]$action
    )
    
    # Use switch to determine the correct MessageBoxImage
    switch ($icon.ToLower()) {
        "info" { $icon = [System.Windows.MessageBoxImage]::Information }
        "ask" { $icon = [System.Windows.MessageBoxImage]::Question }
        "warning" { $icon = [System.Windows.MessageBoxImage]::Warning }
        Default { $icon = [System.Windows.MessageBoxImage]::Question }
    }

    switch ($action.ToLower()) {
        "YesNo" 
        { 
            $action = [System.Windows.MessageBoxButton]::YesNo 
        }
        "OK" 
        {
            $action =  [System.Windows.MessageBoxButton]::OK 
        }
        Default { 
            $icon = [System.Windows.MessageBoxButton]::OK 
        }
    }
    
    if ([string]::IsNullOrWhiteSpace($key)) {
        # Show message with NoneKey if key is empty or null
        [System.Windows.MessageBox]::Show($NoneKey, "ITT", [System.Windows.MessageBoxButton]::$action, $icon)
    } else {
        # Retrieve localized message template and display message
        $localizedMessageTemplate = $itt.database.locales.Controls.$($itt.Language).$($key)
        $msg = "$localizedMessageTemplate"
        [System.Windows.MessageBox]::Show($msg, "ITT", [System.Windows.MessageBoxButton]::$action, $icon)
    }
}    
function Notify {

    <#
        .SYNOPSIS
        Displays a balloon tip notification in the system tray with a customizable title, message, icon, and duration.

        .DESCRIPTION
        The `Notify` function creates a balloon tip notification using the system tray's notification area. 
        This function is useful for displaying temporary alerts or messages to the user. 
        It allows you to specify the notification's title, message, icon type, and how long the balloon tip should be displayed.

        .PARAMETER title
        The title of the notification balloon. This appears as the header of the balloon tip.

        .PARAMETER msg
        The main message text of the notification balloon.

        .PARAMETER icon
        The icon to be displayed in the notification balloon. Should be one of the standard `System.Windows.Forms.NotifyIcon` icon types such as "Information", "Warning", or "Error".

        .PARAMETER time
        The duration (in milliseconds) for which the balloon tip will be displayed.

        .EXAMPLE
        Notify -title "ITT" -msg "Hello world!" -icon "Information" -time 3000
        Displays a notification balloon with the title "ITT" and the message "Hello world!" with an informational icon for 3 seconds.

        .EXAMPLE
        Notify -title "Warning" -msg "Please check your settings." -icon "Warning" -time 5000
        Displays a notification balloon with the title "Warning" and the message "Please check your settings." with a warning icon for 5 seconds.

        .NOTES
        - The `icon` parameter should match one of the standard `System.Windows.Forms.NotifyIcon` types.
        - The `notification` object is disposed of after showing the balloon tip to free up system resources.
    #>

    param(
        [string]$title,
        [string]$msg,
        [string]$icon,
        [Int32]$time
    )

    $notification = New-Object System.Windows.Forms.NotifyIcon
    $notification.Icon = [System.Drawing.SystemIcons]::Information
    $notification.BalloonTipIcon = $icon
    $notification.BalloonTipText = $msg
    $notification.BalloonTipTitle = $title
    $notification.Visible = $true

    $notification.ShowBalloonTip($time)  # Display for specified time

    # Clean up resources
    $notification.Dispose()
}
# Mute the music by setting the volume to the specified value
function MuteMusic {

    <#
        .SYNOPSIS
        Adjusts the volume of the media player and saves the setting for persistence.

        .DESCRIPTION
        The `MuteMusic` function sets the volume of the media player to a specified level and saves this volume setting to the registry. 
        This ensures that the volume level is persisted even after restarting the application or the system. 
        The function also updates the window's title to indicate the current state.

        .PARAMETER value
        The volume level to set. It should be an integer value between 0 (muted) and 100 (full volume). The function uses this value to adjust the media player's volume and to store the setting in the registry.

        .EXAMPLE
        MuteMusic -value 0
        Sets the media player's volume to 0 (muted) and updates the window title to indicate the volume level.

        .EXAMPLE
        MuteMusic -value 50
        Sets the media player's volume to 50% and updates the window title to indicate the current volume level.

        .NOTES
        - The volume value should be an integer between 0 and 100.
        - The volume setting is saved to the registry at the path specified by `$itt.registryPath` under the "Music" key.
        - Ensure that `$itt.mediaPlayer.settings.volume` and `$itt.registryPath` are properly initialized in your environment.
    #>

    param($value)
    $itt.mediaPlayer.settings.volume = $value
    # Save the volume setting to the registry for persistence
    Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value "$value" -Force
    $itt["window"].title = "Install Tweaks Tool #StandWithPalestine 🔈"

}

# Unmute the music by setting the volume to the specified value
function UnmuteMusic {
    param($value)
    $itt.mediaPlayer.settings.volume = $value
    # Save the volume setting to the registry for persistence
    Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value "$value" -Force
    $itt["window"].title = "Install Tweaks Tool #StandWithPalestine 🔊"

}

# Stop the music and clean up resources
function StopMusic {
    $itt.mediaPlayer.controls.stop()    # Stop the media player
    $itt.mediaPlayer = $null            # Clear the media player object
    $script:powershell.Dispose()         # Dispose of the PowerShell object
    $itt.runspace.Dispose()             # Dispose of the runspace
    $itt.runspace.Close()               # Close the runspace
}

# Stop all runspaces, stop the music, and exit the process
function StopAllRunspace {
    $script:powershell.Dispose()         # Dispose of the PowerShell object
    $itt.runspace.Dispose()             # Dispose of the runspace
    $itt.runspace.Close()               # Close the runspace
    $script:powershell.Stop()            # Stop the PowerShell script
    StopMusic                            # Stop the music and clean up resources
    $newProcess.exit                     # Exit the process
}
function System-Default {
    
    $fullCulture = Get-ItemPropertyValue -Path "HKCU:\Control Panel\International" -Name "LocaleName"
    $shortCulture = $fullCulture.Split('-')[0]

    switch($shortCulture)
    {
        
        "ar" { $locale = "ar" }
        "en" { $locale = "en" }
        "fr" { $locale = "fr" }
        "tr" { $locale = "tr" }
        "zh" { $locale = "zh" }
        "ko" { $locale = "ko" }
        "de" { $locale = "de" }
        "ru" { $locale = "ru" }
        "es" { $locale = "es" }
        "ga" { $locale = "ga" }
        default { $locale = "en" }
    }

    Set-ItemProperty -Path $itt.registryPath  -Name "locales" -Value "default" -Force
    $itt["window"].DataContext = $itt.database.locales.Controls.$locale
    $itt.Language = $locale

}

function Set-Language {

    param (
        [string]$lang
    )

    if($lang -eq "default")
    {
        System-Default
    }
    else
    {
        # Set registry value for the language
        $itt.Language = $lang
        Set-ItemProperty -Path $itt.registryPath  -Name "locales" -Value "$lang" -Force
        $itt["window"].DataContext = $itt.database.locales.Controls.$($itt.Language)
    }

}
function ToggleTheme {

    <#
        .SYNOPSIS
        Toggles the application's theme between dark and light modes based on the state of the `themeText` checkbox control.

        .DESCRIPTION
        The `ToggleTheme` function checks the state of a UI checkbox named `themeText` to determine whether the application should be switched to dark or light mode. 
        If the checkbox is checked, the function activates dark mode; if unchecked, it activates light mode. 
        The checkbox state is then updated to reflect the new theme setting. Error handling is included to manage and report any issues that occur during the theme switching process.
    #>
    
    try {

        if ($itt.searchInput = $itt['window'].FindName('themeText').IsChecked -eq $true)
        {
            Switch-ToDarkMode
        } 
        else
        {
            Switch-ToLightMode
        }
        
    }
    catch {
        Write-Host "Error toggling theme: $_"
    }

    $itt['window'].FindName('themeText').IsChecked = -not $itt['window'].FindName('themeText').IsChecked

}
function Switch-ToDarkMode {
    try {

        $theme = $itt['window'].FindResource("Dark")
        Update-Theme $theme "true"
    } catch {
        Write-Host "Error switching to dark mode: $_"
    }
}
function Switch-ToLightMode {
    try {
        $theme = $itt['window'].FindResource("Light")
        Update-Theme $theme "Light"
    } catch {
        Write-Host "Error switching to light mode: $_"
    }
}
function Update-Theme ($theme) {
    $itt['window'].Resources.MergedDictionaries.Clear()
    $itt['window'].Resources.MergedDictionaries.Add($theme)
    Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "$theme" -Force

}
function SwitchToSystem {

    try {

        Set-ItemProperty -Path $itt.registryPath  -Name "Theme" -Value "default" -Force

        $AppsTheme = (Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme")

        switch ($AppsTheme) {
            "0" {
                $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Dark"))
            }
            "1" {
                $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Light"))
            }
            Default {
                Write-Host "Unknown theme value: $AppsTheme"
            }
        }
    }
    catch {
        Write-Host "Error occurred: $_"
    }
}

function Set-Theme {
    param (
        [string]$Theme
    )

    Switch($Theme)
    {
        "Light"{
            $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Light"))
            Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "Light" -Force
        }
        "Dark"{
            $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Dark"))
            Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "Dark" -Force
        }
        default{
            $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("$Theme"))
            Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "Custom" -Force
            Set-ItemProperty -Path $itt.registryPath -Name "UserTheme" -Value "$Theme" -Force
        }
    }
}
function UpdateUI {

    <#
        .SYNOPSIS
        Updates the user interface elements, including a button's width, text, and associated icons.

        .DESCRIPTION
        The `UpdateUI` function is designed to modify various UI components within the application. 
        It updates the width and text of a specified button, changes the text of a related text block, and sets the icon for another text block. 
        This function is typically used to reflect different states of the application, such as during installations or other processes.

        .PARAMETER Button
        Specifies the name of the button element to be updated.

        .PARAMETER ButtonText
        Specifies the name of the text block associated with the button whose text will be updated.

        .PARAMETER Icon
        Specifies the icon to be set in the text block.

        .PARAMETER Content
        Specifies the content to be displayed as button text. This content is localized based on the application's current language setting.

        .PARAMETER TextIcon
        Specifies the name of the text block where the icon will be displayed.

        .PARAMETER Width
        Specifies the width to set for the button. The default value is "100".

        .EXAMPLE
            UpdateUI -Button "InstallBtn" -ButtonText "installText" -Content "downloading" -TextIcon "installIcon" -Icon "  " -Width "150"
        This example updates the UI by setting the width of the "InstallBtn" button to 150, changing the text of the "installText" text block to "downloading", 
        and setting the icon for the "installIcon" text block to "  ".
    #>


    param(
        [string]$Button,
        [string]$ButtonText,
        [string]$Icon,
        [string]$Content,
        [string]$TextIcon,
        [string]$Width = "100"
    )

    $applyBtn = $itt.database.locales.Controls.$($itt.Language).$Content

    $itt['window'].Dispatcher.Invoke([Action]{

        # Button and Button Text
        $itt.$Button.Width = $Width
        $itt.$ButtonText.Text = "$applyBtn"

        # Textblock as Icon
        $itt.$TextIcon.Text = "$icon"
    })
}
#===========================================================================
#endregion End Main Functions
#===========================================================================
#===========================================================================
#region Begin WPF Main Window
#===========================================================================
$MainWindowXaml = '
<!--Main Window-->
<Window
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
x:Name="Window" Title="Install Tweak Tool #StandWithPalestine" WindowStartupLocation = "CenterScreen" 
Background="{DynamicResource PrimaryBackgroundColor}"
Height="700" Width="1000" 
MinHeight="600" 
MinWidth="800" 
Topmost="False"  
ShowInTaskbar = "True" 
Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico">

<Window.Resources>
    <!--Listview Fade in-->
    <Storyboard x:Key="FadeOutStoryboard">
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="0" To="1" Duration="0:0:0.1" />
    </Storyboard>
<!--Listview Fade in-->

<!--Logo Fade in-->
    <Storyboard x:Key="Logo" RepeatBehavior="Forever">
        <!-- Fade Out -->
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="0.0" To="1.0"
            Duration="0:0:01" /> <!-- Fade out duration -->
        
        <!-- Fade In -->
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="1.0" To="0.0"
            Duration="0:0:0.9"
            BeginTime="0:0:05" /> <!-- Start fade in after 21 seconds -->
    </Storyboard>
<!--Logo Fade in-->

<!-- Define the FadeOut and FadeIn animations with looping -->
    <Storyboard x:Key="FadeOutInLoopStoryboard">
        <!-- Fade Out Animation -->
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="1.0"
            To="0.0"
            Duration="0:0:1" />
        <!-- Fade In Animation -->
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="0.0"
            To="1.0"
            Duration="0:0:1"
            BeginTime="0:0:1" />
    </Storyboard>
<!-- Define the FadeOut and FadeIn animations with looping -->

<!--Image Style-->
    <Style TargetType="Image">
        <Style.Triggers>
            <EventTrigger RoutedEvent="FrameworkElement.Loaded">
                <BeginStoryboard Storyboard="{StaticResource Logo}" />
            </EventTrigger>
        </Style.Triggers>
    </Style>
<!--End Image Style-->

<!--Button Style-->
      <Style TargetType="Button">
        <Setter Property="Background" Value="{DynamicResource PrimaryButtonForeground}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor2}"/>
        <Setter Property="BorderBrush" Value="Transparent"/>
        <Setter Property="BorderThickness" Value="1"/>
        
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="Button">
                    <Border CornerRadius="20" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}">
                        <ContentPresenter HorizontalAlignment="Center"
                                            VerticalAlignment="Center"/>
                        
                    </Border>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
        <Style.Triggers>
            <Trigger Property="IsMouseOver" Value="True">
                <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                <Setter Property="Foreground" Value="{DynamicResource PrimaryButtonHighlight}"/>
            </Trigger>
        </Style.Triggers>
    </Style>
<!--End Button Style-->

<!--ListViewItem Style-->
    <Style TargetType="ListViewItem">
        <Setter Property="Margin" Value="3"/>
        <Setter Property="BorderThickness" Value="0"/>
        <Setter Property="BorderBrush" Value="WhiteSmoke"/>
        <Setter Property="Padding" Value="0"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="ListViewItem">
                    <Border CornerRadius="8"
                            Padding="{TemplateBinding Padding}" 
                            BorderBrush="{TemplateBinding BorderBrush}"
                            BorderThickness="{TemplateBinding BorderThickness}">
                        <Border.Background>
                            <LinearGradientBrush StartPoint="1,5" EndPoint="5,5">
                                <GradientStop Color="{DynamicResource ListViewCardLeftColor}" Offset="1"/>
                                <GradientStop Color="{DynamicResource CardRight}" Offset="1"/>
                            </LinearGradientBrush>
                        </Border.Background>
                        <ContentPresenter HorizontalAlignment="Left"
                                        VerticalAlignment="Center"
                                        ContentSource="Content"/>
                    </Border>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
        <Style.Triggers>
            <EventTrigger RoutedEvent="FrameworkElement.Loaded">
                <BeginStoryboard Storyboard="{StaticResource FadeOutStoryboard}" />
            </EventTrigger>
        </Style.Triggers>
    </Style>
<!--End ListViewItem Style-->

<!--CheckBox Style-->
    <Style TargetType="CheckBox">
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="Margin" Value="0"/>
        <Setter Property="Padding" Value="6"/>
        <Setter Property="BorderThickness" Value="1.5"/>
        <Setter Property="BorderBrush" Value="{DynamicResource PrimaryButtonForeground}"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="CheckBox">
                    <StackPanel Orientation="Horizontal">
                        <!-- Checkbox box -->
                        <Border Name="CheckRadius" Width="18" Height="18" BorderBrush="{TemplateBinding BorderBrush}" CornerRadius="20" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}">
                            <!-- Checkmark arrow inside the box -->
                            <Path x:Name="CheckMark" Width="13" Height="13" Stretch="Uniform" Stroke="WhiteSmoke" StrokeThickness="3" Data="M 0 5 L 4 8 L 10 0" Visibility="Collapsed"/>
                        </Border>
                        <!-- Content beside the checkbox -->
                        <ContentPresenter Margin="4,0,0,0" VerticalAlignment="Center"/>
                    </StackPanel>
                    <ControlTemplate.Triggers>
                        <Trigger Property="IsChecked" Value="True">
                            <Setter TargetName="CheckMark" Property="Visibility" Value="Visible"/>
                            <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                            <Setter Property="BorderBrush" Value="{DynamicResource HighlightColor}"/>

                        </Trigger>
                        <Trigger Property="IsChecked" Value="False">
                            <Setter Property="Background" Value="White"/>
                        </Trigger>
                        <Trigger Property="IsMouseOver" Value="True">
                            <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                            <Setter Property="BorderBrush" Value="{DynamicResource HighlightColor}"/>
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End CheckBox Style-->

<!--SearchBox Style-->
    <Style x:Key="SearchBox" TargetType="TextBox">
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorPrimary}"/>
        <Setter Property="BorderBrush" Value="{DynamicResource BorderBrush}"/>
        <Setter Property="BorderThickness" Value="0"/>
        <Setter Property="Padding" Value="8"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="TextBox">
                    <Border Margin="0" 
                            Background="{TemplateBinding Background}" 
                            BorderBrush="{TemplateBinding BorderBrush}" 
                            BorderThickness="{TemplateBinding BorderThickness}" 
                            CornerRadius="15">
                        <ScrollViewer x:Name="PART_ContentHost" 
                                    Background="Transparent"/>
                    </Border>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End SearchBox Style-->

<!--Label Style-->
  <Style TargetType="Label">
    <Setter Property="Background" Value="Transparent"/>
    <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
    <Setter Property="Padding" Value="7.5"/>
    <Setter Property="Template">
        <Setter.Value>
            <ControlTemplate TargetType="Label">
                <Border Padding="{TemplateBinding Padding}" Background="{TemplateBinding Background}"
                        BorderBrush="{TemplateBinding BorderBrush}"
                        BorderThickness="{TemplateBinding BorderThickness}"
                        CornerRadius="0">
                    <ContentPresenter HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}"
                                      VerticalAlignment="{TemplateBinding VerticalContentAlignment}"/>
                </Border>
            </ControlTemplate>
        </Setter.Value>
    </Setter>
  </Style>
<!--End Label Style-->

<!--TextBlock Style-->
    <Style TargetType="TextBlock">
        <Setter Property="Foreground" Value="{DynamicResource TextColorPrimary}"/>
    </Style>
<!--End TextBlock Style-->

<!-- Menu Style -->
    <Style TargetType="Menu">
        <Setter Property="Background" Value="#FFFFFF"/>
        <Setter Property="Foreground" Value="#000000"/>
        <Setter Property="Margin" Value="5"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="Menu">
                    <Border Background="{TemplateBinding Background}" 
                            BorderBrush="{TemplateBinding BorderBrush}" 
                            BorderThickness="0" 
                            CornerRadius="8">
                        <ItemsPresenter />
                    </Border>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
        <Style.Triggers>
            <EventTrigger RoutedEvent="FrameworkElement.Loaded">
                <!-- <BeginStoryboard Storyboard="{StaticResource FadeIn}" /> -->
            </EventTrigger>
        </Style.Triggers>
    </Style>

    <Style TargetType="MenuItem">
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="Margin" Value="1"/>
        <Setter Property="Padding" Value="0"/>
        <Setter Property="BorderBrush" Value="{DynamicResource BorderBrush}"/>
        <Setter Property="BorderThickness" Value="0.5"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="MenuItem">
                    <Border x:Name="Border"

                            BorderBrush="{TemplateBinding BorderBrush}"
                            BorderThickness="{TemplateBinding BorderThickness}"
                            Padding="8"
                            CornerRadius="0">
                        <Grid>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="Auto"/>
                                <ColumnDefinition Width="*"/>
                                <ColumnDefinition Width="Auto"/>
                            </Grid.ColumnDefinitions>
    
                            <!-- Icon -->
                            <ContentPresenter Grid.Column="0" 
                                              ContentSource="Icon"
                                              HorizontalAlignment="Left"
                                              VerticalAlignment="Center"
                                              Margin="0,0,4,0"/>
    
                            <!-- Text (MenuItem Header) -->
                            <TextBlock x:Name="TextBlock"
                                       Grid.Column="1"
                                       Text="{TemplateBinding Header}"
                                       Foreground="{TemplateBinding BorderThickness}"
                                       VerticalAlignment="Center"
                                       Margin="0"/>
    
                            <!-- Shortcut Key (InputGestureText) -->
                            <TextBlock x:Name="ShortcutText"
                                       Grid.Column="2"
                                       Text="{TemplateBinding InputGestureText}"
                                       Foreground="{DynamicResource TextColorSecondaryColor}"
                                       VerticalAlignment="Center"
                                       HorizontalAlignment="Right"
                                       Margin="5,0"/>
    
                            <!-- Arrow Down Indicator for Submenus -->
                            <Path x:Name="Arrow"
                                  Grid.Column="2"
                                  Data="M0,0 L4,4 L8,0 Z"
                                  Fill="{DynamicResource TextColorSecondaryColor}"
                                  HorizontalAlignment="Center"
                                  VerticalAlignment="Center"
                                  Visibility="Collapsed"
                                  Margin="4,0,0,0"/>
    
                            <!-- Popup for Submenu -->
                            <Popup Name="PART_Popup" 
                                   Placement="Right" 
                                   IsOpen="{Binding IsSubmenuOpen, RelativeSource={RelativeSource TemplatedParent}}"                                   AllowsTransparency="True" 
                                   Focusable="False"
                                   PopupAnimation="None">
                                <Border Background="{TemplateBinding Background}" 
                                        BorderBrush="{DynamicResource BorderBrush}"     
                                        BorderThickness="2"
                                        CornerRadius="0">
                                    <StackPanel IsItemsHost="True" 
                                                KeyboardNavigation.DirectionalNavigation="Continue"/>
                                </Border>
                            </Popup>
                        </Grid>
                    </Border>
                    <ControlTemplate.Triggers>
                        <Trigger Property="IsMouseOver" Value="True">
                            <Setter TargetName="Border" Property="Background" Value="{DynamicResource HighlightColor}"/>
                            <Setter TargetName="TextBlock" Property="Foreground" Value="White"/>
                            <Setter TargetName="ShortcutText" Property="Foreground" Value="White"/>
                            <Setter TargetName="Arrow" Property="Fill" Value="White"/>
                        </Trigger>
                        <Trigger Property="HasItems" Value="True">
                            <Setter TargetName="Arrow" Property="Visibility" Value="Visible"/>
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!-- End Menu Style -->

<!--Scrollbar Thumbs-->
    <Style x:Key="ScrollThumbs" TargetType="{x:Type Thumb}">
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="{x:Type Thumb}">
                    <Grid x:Name="Grid">
                        <Rectangle HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Fill="Transparent" />
                        <Border x:Name="Rectangle1" CornerRadius="5" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Background="{TemplateBinding Background}" />
                    </Grid>
                    <ControlTemplate.Triggers>
                        <Trigger Property="Tag" Value="Horizontal">
                            <Setter TargetName="Rectangle1" Property="Width" Value="Auto" />
                            <Setter TargetName="Rectangle1" Property="Height" Value="7" />
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
    <Style x:Key="{x:Type ScrollBar}" TargetType="{x:Type ScrollBar}">
        <Setter Property="Stylus.IsFlicksEnabled" Value="false" />
        <Setter Property="Foreground" Value="{DynamicResource PrimaryButtonForeground}" />
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
        <Setter Property="Width" Value="8" />
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="{x:Type ScrollBar}">
                    <Grid x:Name="GridRoot" Width="8" Background="{TemplateBinding Background}">
                        <Grid.RowDefinitions>
                            <RowDefinition Height="0.00001*" />
                        </Grid.RowDefinitions>
                        <Track x:Name="PART_Track" Grid.Row="0" IsDirectionReversed="true" Focusable="false">
                            <Track.Thumb>
                                <Thumb x:Name="Thumb" Background="{TemplateBinding Foreground}" Style="{DynamicResource ScrollThumbs}" />
                            </Track.Thumb>
                            <Track.IncreaseRepeatButton>
                                <RepeatButton x:Name="PageUp" Command="ScrollBar.PageDownCommand" Opacity="0" Focusable="false" />
                            </Track.IncreaseRepeatButton>
                            <Track.DecreaseRepeatButton>
                                <RepeatButton x:Name="PageDown" Command="ScrollBar.PageUpCommand" Opacity="0" Focusable="false" />
                            </Track.DecreaseRepeatButton>
                        </Track>
                    </Grid>
                    <ControlTemplate.Triggers>
                        <Trigger SourceName="Thumb" Property="IsMouseOver" Value="true">
                            <Setter Value="{DynamicResource ButtonSelectBrush}" TargetName="Thumb" Property="Background" />
                        </Trigger>
                        <Trigger SourceName="Thumb" Property="IsDragging" Value="true">
                            <Setter Value="{DynamicResource DarkBrush}" TargetName="Thumb" Property="Background" />
                        </Trigger>
                        <Trigger Property="IsEnabled" Value="false">
                            <Setter TargetName="Thumb" Property="Visibility" Value="Collapsed" />
                        </Trigger>
                        <Trigger Property="Orientation" Value="Horizontal">
                            <Setter TargetName="GridRoot" Property="LayoutTransform">
                                <Setter.Value>
                                    <RotateTransform Angle="-90" />
                                </Setter.Value>
                            </Setter>
                            <Setter TargetName="PART_Track" Property="LayoutTransform">
                                <Setter.Value>
                                    <RotateTransform Angle="-90" />
                                </Setter.Value>
                            </Setter>
                            <Setter Property="Width" Value="Auto" />
                            <Setter Property="Height" Value="8" />
                            <Setter TargetName="Thumb" Property="Tag" Value="Horizontal" />
                            <Setter TargetName="PageDown" Property="Command" Value="ScrollBar.PageLeftCommand" />
                            <Setter TargetName="PageUp" Property="Command" Value="ScrollBar.PageRightCommand" />
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>

    <Style TargetType="ScrollViewer">
        <Setter Property="CanContentScroll" Value="False"/>
        <Setter Property="IsDeferredScrollingEnabled" Value="False"/>
        <Setter Property="VerticalScrollBarVisibility" Value="Auto"/>
        <Setter Property="HorizontalScrollBarVisibility" Value="Hidden"/>
    </Style>

<!--End Scrollbar Thumbs-->

<!--TabControl Style-->
    <Style TargetType="TabItem">
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="TabItem">
                    <Border Name="Border" CornerRadius="5" BorderThickness="0,0,0,0" Padding="8" BorderBrush="Transparent"  Margin="5,5">
                        <ContentPresenter x:Name="ContentSite"
                        VerticalAlignment="Center"
                        HorizontalAlignment="Center"
                        ContentSource="Header"
                        />
                    </Border>
                    <ControlTemplate.Triggers>
                        <Trigger Property="IsSelected" Value="True">
                            <Setter TargetName="Border" Property="Background" Value="{DynamicResource PrimaryButtonForeground}" />
                            <Setter Property="Foreground" Value="white" />
                        </Trigger>
                        <Trigger Property="IsSelected" Value="False">
                            <Setter TargetName="Border" Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
                            <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}" />
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End TabControl Style-->

<!--ComboBox Style-->
    <Style TargetType="ComboBox">
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="BorderBrush" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="BorderThickness" Value="1"/>
        <Setter Property="Padding" Value="6,3"/>
        <Setter Property="HorizontalContentAlignment" Value="Left"/>
        <Setter Property="VerticalContentAlignment" Value="Center"/>
        <Setter Property="ScrollViewer.HorizontalScrollBarVisibility" Value="Disabled"/>
        <Setter Property="ScrollViewer.VerticalScrollBarVisibility" Value="Auto"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="ComboBox">
                    <Grid>
                        <ToggleButton 
                            Name="ToggleButton"
                            Grid.Column="2" 
                            Focusable="false"
                            IsChecked="{Binding Path=IsDropDownOpen, Mode=TwoWay, RelativeSource={RelativeSource TemplatedParent}}"
                            ClickMode="Press"
                            Background="Transparent"
                            BorderBrush="Transparent">
                            <ToggleButton.Template>
                                <ControlTemplate TargetType="ToggleButton">
                                    <Border Name="Border" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}">
                                        <Grid>
                                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                                            <Path x:Name="Arrow" Data="M 0 0 L 4 4 L 8 0 Z" Fill="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Right" Margin="5" VerticalAlignment="Center"/>
                                        </Grid>
                                    </Border>
                                </ControlTemplate>
                            </ToggleButton.Template>
                        </ToggleButton>
                        <ContentPresenter
                            Name="ContentSite"
                            IsHitTestVisible="False"
                            Content="{TemplateBinding SelectionBoxItem}"
                            ContentTemplate="{TemplateBinding SelectionBoxItemTemplate}"
                            ContentTemplateSelector="{TemplateBinding ItemTemplateSelector}"
                            Margin="3,3,23,3"
                            VerticalAlignment="Center"
                            HorizontalAlignment="Left"/>
                        <TextBox 
                            x:Name="PART_EditableTextBox"
                            Style="{x:Null}" 
                            HorizontalAlignment="Left" 
                            VerticalAlignment="Center"
                            Margin="3,3,23,3"
                            Focusable="True"
                            Background="Transparent"
                            Visibility="Hidden"
                            IsReadOnly="{TemplateBinding IsReadOnly}"/>
                        <Popup 
                            Name="Popup"
                            Placement="Bottom"
                            IsOpen="{TemplateBinding IsDropDownOpen}"
                            AllowsTransparency="True" 
                            Focusable="False"
                            PopupAnimation="Slide">
                            <Grid 
                                Name="DropDown"
                                SnapsToDevicePixels="True"
                                MinWidth="{TemplateBinding ActualWidth}"
                                MaxHeight="{TemplateBinding MaxDropDownHeight}">
                                <Border 
                                    x:Name="DropDownBorder"
                                    Background="{DynamicResource SecondaryPrimaryBackgroundColor}" 
                                    BorderBrush="Gray" 
                                    BorderThickness="1"/>
                                <ScrollViewer Margin="4,6,4,6" SnapsToDevicePixels="True">
                                    <StackPanel IsItemsHost="True" KeyboardNavigation.DirectionalNavigation="Contained"/>
                                </ScrollViewer>
                            </Grid>
                        </Popup>
                    </Grid>
                    <ControlTemplate.Triggers>
                        <Trigger Property="HasItems" Value="false">
                            <Setter TargetName="DropDownBorder" Property="MinHeight" Value="95"/>
                        </Trigger>
                        <Trigger Property="IsEnabled" Value="false">
                            <Setter Property="Foreground" Value="Gray"/>
                        </Trigger>
                        <Trigger Property="IsGrouping" Value="true">
                            <Setter Property="ScrollViewer.CanContentScroll" Value="false"/>
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End ComboBox Style-->

<!--ToggleSwitchStyle Style-->
    <Style x:Key="ToggleSwitchStyle" TargetType="CheckBox">
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="CheckBox">
                    <StackPanel Orientation="Horizontal">
                        <TextBlock Text="{TemplateBinding Content}" VerticalAlignment="Center" Margin="8"/>
                        <Grid>
                            <Border Name="emad" Width="40"
                                    Height="20"
                                    Background="{DynamicResource Label}"
                                    CornerRadius="10"
                                    Margin="1"
                            />
                            <Border Name="ToggleSwitchButton"
                                    Width="12"
                                    Height="12"
                                    Background="Black"
                                    CornerRadius="50"
                                    Margin="5"
                                    HorizontalAlignment="Left"
                            />
                        </Grid>
                        <TextBlock>
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="Text" Value="Off"/>
                                    <Setter Property="Margin" Value="7"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding RelativeSource={RelativeSource TemplatedParent}, Path=IsChecked}" Value="True">
                                            <Setter Property="Text" Value="On"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                    <ControlTemplate.Triggers>
                        <Trigger Property="IsChecked" Value="false">
                            <Trigger.ExitActions>
                                <RemoveStoryboard BeginStoryboardName="WPFToggleSwitchLeft" />
                                <BeginStoryboard x:Name="WPFToggleSwitchRight">
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetProperty="Margin"
                                                Storyboard.TargetName="ToggleSwitchButton"
                                                Duration="0:0:0:0.10"
                                                From="0,0,0,0"
                                                To="22,0,0,0">
                                        </ThicknessAnimation>
                                    </Storyboard>
                                </BeginStoryboard>
                            </Trigger.ExitActions>
                            <Setter TargetName="ToggleSwitchButton" Property="Background" Value="{DynamicResource ToggleSwitchDisableColor}"/>
                            <Setter TargetName="emad" Property="BorderBrush" Value="{DynamicResource ToggleSwitchBorderBrush}"/>
                            <Setter TargetName="emad" Property="BorderThickness" Value="1"/>
                        </Trigger>
                        <Trigger Property="IsChecked" Value="true">
                            <Trigger.ExitActions>
                                <RemoveStoryboard BeginStoryboardName="WPFToggleSwitchRight" />
                                <BeginStoryboard x:Name="WPFToggleSwitchLeft">
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetProperty="Margin"
                                                Storyboard.TargetName="ToggleSwitchButton"
                                                Duration="0:0:0:0.10"
                                                From="22,0,0,0"
                                                To="5,0,0,0">
                                        </ThicknessAnimation>
                                    </Storyboard>
                                </BeginStoryboard>
                            </Trigger.ExitActions>
                            <Setter TargetName="ToggleSwitchButton" Property="Background" Value="{DynamicResource ToggleSwitchEnableColor}"/>
                            <Setter TargetName="emad" Property="Background" Value="{DynamicResource HighlightColor}"/>

                        </Trigger>
                        <Trigger Property="IsMouseOver" Value="True">
                            <Setter TargetName="ToggleSwitchButton" Property="Width" Value="13"/>
                            <Setter TargetName="ToggleSwitchButton" Property="Height" Value="13"/>
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>

    </Style>
<!--End ToggleSwitchStyle Style-->
    <!-- Generated from build dont play here -->

        <!-- {Dark} -->
<!-- by {emadadel} -->
        <ResourceDictionary x:Key="Dark">
                <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#2b2d31"/>
                <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#3c3f44"/>
                <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#098fd4" />
                <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
                <SolidColorBrush x:Key="TextColorPrimary" Color="WhiteSmoke" />
                <SolidColorBrush x:Key="TextColorSecondaryColor" Color="White"/>
                <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#bbbbbb"/>
                <SolidColorBrush x:Key="BorderBrush" Color="#2b2d31" />
                <SolidColorBrush x:Key="ButtonBorderColor" Color="#1DB954"/>
                <SolidColorBrush x:Key="Label" Color="#3f3f3f"/>
                <SolidColorBrush x:Key="HighlightColor" Color="#066ca1"/>
                <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
                <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
                <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
                <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#c9c9c7"/>
                <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#c9c9c7"/>
                <Color x:Key="ListViewCardLeftColor">#3c3f44</Color> 
                <Color x:Key="ListViewCardRightColor">#2b2d31</Color>
        </ResourceDictionary>
<!--{Dark}-->
<!-- {Light} -->
<!-- by {emadadel} -->
        <ResourceDictionary x:Key="Light">
                <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="White"/>
                <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="WhiteSmoke"/>
                <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#1976d2" />
                <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
                <SolidColorBrush x:Key="TextColorPrimary" Color="Black" />
                <SolidColorBrush x:Key="TextColorSecondaryColor" Color="Black"/>
                <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#4B5361"/>
                <SolidColorBrush x:Key="BorderBrush" Color="#FFB3B3B3"/>
                <SolidColorBrush x:Key="ButtonBorderColor" Color="#525FE1"/>
                <SolidColorBrush x:Key="Label" Color="LightBlue"/>
                <SolidColorBrush x:Key="HighlightColor" Color="#098fd4"/>
                <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
                <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
                <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
                <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="black"/>
                <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="black"/>
                <Color x:Key="ListViewCardLeftColor">#f0f0f0</Color>
                <Color x:Key="ListViewCardRightColor">#ffffff</Color>
        </ResourceDictionary>
<!-- {Light} -->
<!-- {Palestine} -->
<!-- by {emadadel} -->
<ResourceDictionary x:Key="palestine">
  <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="Black"/>
  <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#FF111111"/>
  <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#FFB80000" />
  <SolidColorBrush x:Key="TextColorPrimary" Color="WhiteSmoke" />
  <SolidColorBrush x:Key="TextColorSecondaryColor" Color="White"/>
  <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#bbbbbb"/>
  <SolidColorBrush x:Key="BorderBrush" Color="#2b2d31" />
  <SolidColorBrush x:Key="ButtonBorderColor" Color="#1DB954"/>
  <SolidColorBrush x:Key="Label" Color="#3f3f3f"/>
  <SolidColorBrush x:Key="HighlightColor" Color="#FFD10D0D"/>
  <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
  <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
  <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
  <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#c9c9c7"/>
  <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#c9c9c7"/>
  <Color x:Key="ListViewCardLeftColor">#FF1B1B1B</Color> 
  <Color x:Key="ListViewCardRightColor">#FF1B1B1B</Color>
</ResourceDictionary>
<!-- Name {Palestine} -->


<!-- Generated from build dont play here -->


</Window.Resources>

<Grid>
    <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
    </Grid.RowDefinitions>

    <!--Header Section-->
        <Grid>
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="Auto"/>
                <ColumnDefinition Width="*"/>
            </Grid.ColumnDefinitions>

                 <!--Menu-->
    <Menu Grid.Row="0" Grid.Column="0" Background="Transparent" BorderBrush="Transparent" HorizontalAlignment="Left" BorderThickness="0">
                                    
        <MenuItem Background="Transparent" BorderBrush="Transparent" BorderThickness="0" IsEnabled="False" ToolTip="Emad Adel">
            <MenuItem.Icon>
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Images/logo.png" Width="70" Height="Auto" Margin="5,5,0,0"></Image>
            </MenuItem.Icon>
        </MenuItem>

        <MenuItem Header="{Binding Management}" FontFamily="arial" FontSize="13"  Margin="10,0,0,0" BorderBrush="Transparent" BorderThickness="0" VerticalAlignment="Center" HorizontalAlignment="Left">
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>
            <MenuItem Name="sysinfo" Header="{Binding System_Info}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="poweroption" Header="{Binding Power_Options}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="deviceManager" Header="{Binding Device_Manager}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            <MenuItem Name="services" Header="{Binding Services}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            <MenuItem Name="network" Header="{Binding Networks}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            <MenuItem Name="appsfeatures" Header="{Binding Apps_features}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            <MenuItem Name="taskmgr" Header="{Binding Task_Manager}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            <MenuItem Name="diskmgmt" Header="{Binding Disk_Managment}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
        </MenuItem>

        <MenuItem Header="{Binding Preferences}" FontFamily="arial" FontSize="13"  BorderBrush="Transparent" BorderThickness="0" VerticalAlignment="Center" HorizontalAlignment="Left">
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" HorizontalAlignment="Center" VerticalAlignment="Center" Text=""/>
            </MenuItem.Icon>

            <MenuItem Name="restorepoint" InputGestureText="Shift+Q" Header="{Binding Create_restore_point}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="chocoloc" Header="{Binding Portable_Downloads_Folder}" InputGestureText="Shift+P">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="save" ToolTip="Save selected apps" InputGestureText="Shift+S" Header="{Binding Save}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            <MenuItem Name="load" ToolTip="Restore selected apps" InputGestureText="Shift+D" Header="{Binding Restore}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Header="{Binding Theme}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
                <MenuItem Name="systheme" Header="{Binding Use_system_setting}"/>
                <MenuItem Name="Dark" Header="Dark"/>
<MenuItem Name="Light" Header="Light"/>
<MenuItem Name="palestine" Header="Palestine"/>
            </MenuItem>

            <MenuItem Header="{Binding Music}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
                <MenuItem Name="moff" Header="{Binding off}" InputGestureText="Shift+N">
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                </MenuItem>
                <MenuItem Name="mon" Header="{Binding on}" InputGestureText="Shift+F">
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                </MenuItem>
            </MenuItem>

            <MenuItem Header="{Binding Language}">
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                    <MenuItem Name="systemlang" Header="{Binding Use_system_setting}"/>
                       <MenuItem Name="ar" Header="عربي"/>
<MenuItem Name="de" Header="Deutsch"/>
<MenuItem Name="en" Header="English"/>
<MenuItem Name="es" Header="Español"/>
<MenuItem Name="fr" Header="Français"/>
<MenuItem Name="ga" Header="Gaeilge"/>
<MenuItem Name="ko" Header="한국어"/>
<MenuItem Name="ru" Header="Русский"/>
<MenuItem Name="tr" Header="Türkçe"/>
<MenuItem Name="zh" Header="中文"/>
            </MenuItem>


            <MenuItem Name="ittshortcut" Header="{Binding Create_desktop_shortcut}" InputGestureText="Shift+I">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

             <MenuItem Name="reset" Header="{Binding Reset_preferences}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
                </MenuItem.Icon>
            </MenuItem>



        </MenuItem>


        <MenuItem Header="{Binding Third_party}" FontFamily="arial" FontSize="13"  BorderThickness="0" VerticalAlignment="Center" HorizontalAlignment="Center">
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>


            <MenuItem Name="mas" ToolTip="Windows activation " Header="{Binding MAS}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            <MenuItem Name="idm" ToolTip="Get rid of IDM Active message" Header="{Binding IDM}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="winoffice" ToolTip="Windows and Office Orginal ISO" Header="{Binding Win_Office}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>


            <MenuItem Header="{Binding Browsers_extensions}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
                
                <MenuItem Name="uBlock" Header="uBlock Origin"/>
                <MenuItem Name="unhook" Header="Unhook: Customize youtube."/>
                <MenuItem Name="neat" Header="Neat Download Manager"/>
            </MenuItem>

            <MenuItem Name="sordum" ToolTip="Collection of free utilities designed to enhance or control various aspects of the Windows operating system" Header="Sordum tools">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="techpowerup" Header="TechPowerUp" ToolTip="Collection of free TechPowerUp utilities.">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="majorgeeks" ToolTip="website that provides trusted, safe, and curated software downloads for Windows users. It focuses on high-quality tools." Header="Major Geeks">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="webtor" ToolTip="Web-based platform that allows users to stream torrent files directly in their browser without needing to download them." Header="Webtor">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            
            <MenuItem Name="fmhy" ToolTip="The largest collection of free stuff on the internet!" Header="fmhy">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="shelltube" ToolTip="Download youtube video easily" Header="ShellTube">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
        </MenuItem>


        <MenuItem Name="dev" Header="{Binding About}" FontFamily="arial" FontSize="13"  BorderBrush="Transparent" BorderThickness="1" VerticalAlignment="Center" HorizontalAlignment="Center">
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>
        </MenuItem>


    </Menu>
<!--End Menu-->

            <Grid Grid.Column="1"  HorizontalAlignment="Right" Margin="0,0,20,0">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="Auto"/>
                    <ColumnDefinition Width="Auto"/>
            </Grid.ColumnDefinitions>
                    
                <!--AppsCategory-->
  <ComboBox 
    SelectedIndex="0" 
    Name="AppsCategory" 
    Grid.Column="0" 
    VerticalAlignment="Center" 
    HorizontalAlignment="Center" 
    Width="auto">

      <ComboBoxItem Content="{Binding all}"/>
      <ComboBoxItem Content="GPU Drivers"/>
      <ComboBoxItem Content="Web Browsers"/>
      <ComboBoxItem Content="Media"/>
      <ComboBoxItem Content="Media Tools"/>
      <ComboBoxItem Content="Documents"/>
      <ComboBoxItem Content="Compression"/>
      <ComboBoxItem Content="Communication"/>
      <ComboBoxItem Content="File Sharing"/>
      <ComboBoxItem Content="Imaging"/>
      <ComboBoxItem Content="Gaming"/>
      <ComboBoxItem Content="Utilities"/>
      <ComboBoxItem Content="Disk Tools"/>
      <ComboBoxItem Content="Development"/>
      <ComboBoxItem Content="Security"/>
      <ComboBoxItem Content="Portable"/>
      <ComboBoxItem Content="Runtimes"/>
      <ComboBoxItem Content="Drivers"/>
    </ComboBox>
<!--End AppsCategory-->

<!--TwaeksCategory-->
  <ComboBox 

      SelectedIndex="0" 
      Name="TwaeksCategory" 
      Grid.Column="0" 
      VerticalAlignment="Center" 
      HorizontalAlignment="Center" 
      Visibility="Hidden"
      Width="auto">

      <ComboBoxItem Content="{Binding all}"/>
      <ComboBoxItem Content="Privacy"/>
      <ComboBoxItem Content="Fixer"/>
      <ComboBoxItem Content="Performance"/>
      <ComboBoxItem Content="Personalization"/>
      <ComboBoxItem Content="Power"/>
      <ComboBoxItem Content="Protection"/>
      <ComboBoxItem Content="Classic"/>

  </ComboBox>
<!--End TwaeksCategory-->

                <!--Search -->
<Grid HorizontalAlignment="Right" Grid.Column="1" VerticalAlignment="Center">
    <TextBox Padding="8"
            Width="100"
            VerticalAlignment="Center"
            HorizontalAlignment="Left"
            Style="{StaticResource SearchBox}"
            Name="searchInput" />

            <TextBlock x:Name="SearchIcon" Text="" 
                FontSize="15" 
                Foreground="Gray" 
                VerticalAlignment="Center" 
                FontFamily="Segoe MDL2 Assets"
                Background="Transparent"
                HorizontalAlignment="Left" 
                Margin="9,0,0,0" />

</Grid>
<!--End Search-->


            </Grid>
        </Grid>
    <!--Header Section-->

        <!--TabControl-->
    <TabControl Name="taps" TabStripPlacement="Left" Grid.Row="1"  BorderBrush="Transparent" Height="Auto" Width="Auto" Foreground="White" Background="Transparent">
            <TabItem Name="apps" Header="{Binding apps}" BorderBrush="{x:Null}" >
                <TabItem.HeaderTemplate>
                    <DataTemplate>
                        <StackPanel Orientation="Horizontal">
                            <TextBlock Text="" FontFamily="Segoe MDL2 Assets" FontSize="18" Margin="0,0,2,0"/>
                            <TextBlock Text="{Binding}"  FontSize="15" TextWrapping="Wrap"  Margin="0,0,2,0"/>
                        </StackPanel>
                    </DataTemplate>
            </TabItem.HeaderTemplate>
                <TabItem.Content>
                    <ListView Name="appslist" Margin="0" Width="Auto" Height="Auto" BorderBrush="{x:Null}" Background="{x:Null}" >
                                <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Mozilla Firefox" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A widelyused opensource web browser known for its speed privacy features and customization options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Mozilla Firefox ESR" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A widelyused opensource web browser known for its speed privacy features and customization options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Thorium SSE3" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A web browser designed for smooth and secure browsing experiences."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Thorium AVX" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A web browser designed for smooth and secure browsing experiences."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Edge" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Microsofts web browser built for fast and secure internet surfing integrating seamlessly with Windows ecosystem."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Google Chrome" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A popular web browser known for its speed simplicity and vast ecosystem of extensions."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Chromium" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource web browser project that serves as the foundation for many browsers including Google Chrome."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Brave" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A privacyfocused web browser that blocks ads and trackers offering faster and safer browsing experiences."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Tor Browser" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A web browser that prioritizes user privacy by routing internet traffic through a global network of servers enabling anonymous browsing."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Opera" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Opera web browser makes the Web fast and fun giving you a better web browser experience on any computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Internet Download Manager" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A popular download manager tool that accelerates downloads and allows users to organize and schedule downloads efficiently."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="JDownloader" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="JDownloader is an internet download manager."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="KLite Mega Codec Full Pack" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Comprehensive collection of audio and video codecs filters and tools enabling playback of various media formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PotPlayer" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A multimedia player with a sleek interface and advanced features supporting a wide range of audio and video formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="VLC" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A versatile media player capable of playing almost any multimedia file format with support for various streaming protocols."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Kodi" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A powerful opensource media center software that allows users to organize and stream their media collections."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Jellyfin Server" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource media server software that enables users to stream their media libraries across devices providing a selfhosted alternative to commercial services."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Winamp" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A classic media player known for its customizable interface and extensive plugin support providing a nostalgic music playback experience."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Aimp" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A lightweight and featurerich audio player with support for various audio formats and customizable interface themes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Spotify" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Spotify is a new way to listen to music."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FastStone Image Viewer" Tag="Imaging" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="FastStone Image Viewer is a fast stable userfriendly image browser converter and editor."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="OpenOffice" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource office productivity suite offering word processing spreadsheet presentation and other office tools compatible with Microsoft Office formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FoxitReader" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A lightweight and featurerich PDF reader with annotation form filling and document signing capabilities."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="LibreOffice" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A powerful opensource office suite providing word processing spreadsheet presentation and other office tools compatible with Microsoft Office formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="SumatraPDF" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A lightweight and fast PDF reader with minimalistic design and focus on simplicity and speed."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WinRAR" Tag="Compression" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Compression"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A popular file compression and archiving utility that supports various archive formats and offers advanced features such as encryption and selfextracting archives."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="7Zip" Tag="Compression" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Compression"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource file archiver with a high compression ratio supporting various archive formats and providing a powerful commandline interface."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PeaZip" Tag="Compression" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Compression"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text=" PeaZip is a free crossplatform file archiver."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Telegram Desktop" Tag="Communication" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A crossplatform messaging app with a focus on speed and security offering endtoend encryption and a wide range of features such as group chats file sharing and stickers."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Signal" Tag="Communication" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Fast simple secure. Privacy that fits in your pocket."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Meta Messenger" Tag="Communication" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A messaging app that allows users to connect with friends and family through text messages voice calls and video calls offering various multimedia sharing features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Zoom" Tag="Communication" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A video conferencing app that facilitates online meetings webinars and virtual events allowing participants to interact through video audio and chat."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Teams" Tag="Communication" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A collaboration platform that combines workplace chat video meetings file storage and application integration enhancing teamwork and productivity within organizations."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Discord" Tag="Communication" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A VoIP application and digital distribution platform designed for creating communities and connecting gamers providing text voice and video communication features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TeamViewer" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A remote access and support software that enables users to remotely control computers transfer files and collaborate online facilitating remote work and IT support."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GIMP" Tag="Imaging" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource raster graphics editor used for image retouching and editing drawing and painting and converting between different image formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ Runtime - all versions" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Microsoft Visual C Redistributable installs runtime components of Visual C libraries. These components are required to run C applications that are developed using Visual Studio and link dynamically to Visual C libraries."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="DirectX" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="DirectX is a collection of APIs for handling tasks related to games and videos.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2005 (x86) Redistributable" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run applications developed with Microsoft Visual C 2005 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2005 (x64) Redistributable" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run 64bit applications developed with Microsoft Visual C 2005 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2008 (x86) Redistributable" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run applications developed with Microsoft Visual C 2008 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2008 (x64) Redistributable" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run 64bit applications developed with Microsoft Visual C 2008 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2010 (x86) Redistributable" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run applications developed with Microsoft Visual C 2010 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2010 (x64) Redistributable" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run 64bit applications developed with Microsoft Visual C 2010 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2012 (x86) Redistributable" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run applications developed with Microsoft Visual C 2012 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2012 (x64) Redistributable" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run 64bit applications developed with Microsoft Visual C 2012 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2013 (x86) Redistributable" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run applications developed with Microsoft Visual C 2013 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2013 (x64) Redistributable" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run 64bit applications developed with Microsoft Visual C 2013 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2015-2022 (x64) Redistributable" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run 64bit applications developed with Microsoft Visual C 20152022 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2015-2022  (x86) Redistributable" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run applications developed with Microsoft Visual C 20152022 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NET Framework All Versions" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A comprehensive and consistent programming model for building applications that have visually stunning user experiences seamless and secure communication and the ability to model a range of business processes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AMD Ryzen Chipset Drivers" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Supports AMD Ryzen Threadripper PRO Processor AMD Ryzen 8000/7040/7000 Series Desktop  Mobile Processors AMD Ryzen 5000/3rd Gen/2nd Gen Desktop  Threadripper Processors AMD Ryzen Desktop Processor with Radeon Graphics  Mobile Processor with Radeon Graphics 7thGen AMD ASeries Processors AMD X670E/X670/B650E/B650/B350/A320/X370/X399/B450/X470/X570/B550/A520/A620/TRX40/TRX50/WRX80/WRX90 Chipsets."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NVidia Display Driver" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The software component that allows the operating system and installed software to communicate with and control the NVIDIA graphics processing unit GPU."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NVIDIA GeForce Experience" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A cloudbased gaming service provided by NVIDIA that allows users to play video games on supported devices via a remote gaming PC hosted on NVIDIAs servers."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Msi Afterburner" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MSI Afterburner is the ultimate graphics card utility codeveloped by MSI and RivaTuner teams."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NVIDIA PhysX" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A physics processing unit PPU software development kit SDK offered by NVIDIA for realtime physics simulations in video games."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Steam" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A digital distribution platform developed by Valve Corporation for purchasing and playing video games."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Ubisoft Connect" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A digital distribution digital rights management multiplayer and communications service developed by Ubisoft providing access to Ubisofts games rewards and social features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Origin" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text=" Game store launcher."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Rockstar Games Launcher" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Download and play the latest Rockstar Games PC titles."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GameSave Manager" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A utility tool that allows users to backup restore and transfer their game saves between different gaming platforms and directories."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="StreamlabsOBS" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource streaming software built on top of OBS Studio with additional features tailored for streamers such as builtin alerts overlays and chat integration."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="OBS Studio" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource software for video recording and live streaming. It offers high performance realtime video/audio capturing and mixing."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Logitech Gaming Software" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Logitech Gaming Software lets you customize Logitech G gaming mice keyboards headsets and select wheels."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Lively Wallpaper" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A software that allows users to set animated and interactive wallpapers on their Windows desktop providing various customization options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Playnite" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Open source video game library manager and launcher with support for 3rd party libraries like Steam GOG Origin Battle.net and Uplay."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Driver Easy" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A driver update tool that automatically detects downloads and installs device drivers for the users computer hardware."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Intel Graphics Windows DCH" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Intel Graphics Driver for Windows 10."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Intel Driver Support Assistant" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Intel Driver  Support Assistant enables you to scan computing devices for the latest drivers available from Intel."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Intel Network Adapter" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Intel Network Adapter Drivers for Windows 10."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Snappy Driver Installer" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource tool for updating and installing device drivers on Windows offering offline driver updates and wide hardware support."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Driver booster" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Scans and identifies outdated drivers automatically and downloads and installs the right update for you with just ONE click."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Driver Genius" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Professional driver management tool and hardware diagnostics."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Display Driver Uninstaller" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Utility to completely remove system drivers."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Driver Store Explorer" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text=" Windows driver store utility."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="1Password" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A password manager that securely stores login credentials credit card information and other sensitive data in an encrypted vault accessible with a single master password."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AOMEI Partition Assistant Standard" Tag="Disk Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="AOMEI Partition Assistant Standard allows you to realize disk upgrade/replacement partition style conversion OS migration and other disk managements without any difficulties."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AOMEI Backupper Standard" Tag="Disk Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A backup and recovery software that enables users to create system backups disk backups partition backups and file backups to protect data against system failures and data loss."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Recuva recover" Tag="Disk Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A data recovery software that helps users retrieve accidentally deleted files including photos documents videos and more from various storage devices such as hard drives USB drives and memory cards."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="CCleaner" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A system optimization privacy and cleaning tool that helps users remove unused files clean up temporary files and optimize their Windows PCs for better performance."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="BCUninstaller" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A powerful uninstaller tool for Windows that allows users to remove unwanted programs plugins and Windows Store apps along with leftover files and registry entries."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Easy Context Menu" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="To install Easy Context Menu run the following command from the command line or from PowerShell."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HWiNFO" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A hardware information and diagnostic tool that provides detailed information about the hardware components of a computer system including sensors temperature voltage and more."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Speccy" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A system information tool that provides detailed information about the hardware and operating system of a computer including CPU RAM motherboard graphics card and storage devices."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FurMark" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A graphics card stress testing and benchmarking utility that helps users test the stability cooling and performance of their GPU by rendering a highly intensive 3D graphics scene."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Hard Disk Sentinel" Tag="Disk Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A hard disk monitoring and analysis software that helps users monitor the health performance and temperature of their hard drives SSDs and other storage devices."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="CPU-Z" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A system monitoring utility that provides detailed information about the CPU motherboard memory and other hardware components of a computer system."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Mem Reduct" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Lightweight realtime memory management application to monitor and clean system memory on your computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HandBrake" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource video transcoder tool that converts video files from one format to another supporting a wide range of input and output formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Rufus Portable" Tag="Portable" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A utility tool for creating bootable USB drives from ISO images helping users to install or run operating systems such as Windows Linux or other utilities."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ImgBurn" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Lightweight CD / DVD burning application."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Virtual CloneDrive" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free software that allows users to mount disc images as virtual drives enabling them to access the content of ISO BIN and CCD files without the need for physical discs."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Ultra ISO" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A powerful ISO image management tool that enables users to create edit extract and burn ISO files providing a comprehensive solution for managing disk image files."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Ventoy" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource tool for creating bootable USB drives with multiple ISO files allowing users to boot various operating systems or utilities directly from a single USB drive."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="iVentoy" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="With iVentoy you can boot and install OS on multiple machines at the same time through the network."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AutoHotkey" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A scripting language for automating repetitive tasks and creating macros on Windows allowing users to customize keyboard shortcuts remap keys and automate mouse actions."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Rainmeter" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A customizable desktop customization tool that displays customizable skins widgets and applets on the Windows desktop providing users with realtime system monitoring and information."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FxSound" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An audio enhancer software that improves the sound quality of music videos and games on Windows PCs by providing advanced audio processing and customization options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Vysor" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A screen mirroring and remote control software that enables users to view and control Android devices from Windows PCs allowing for easy screen sharing app testing and troubleshooting."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Unified Remote" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A remote control app that turns smartphones into universal remote controls for Windows macOS and Linux computers allowing users to control media playback presentations and more."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AnyDesk" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A remote desktop software that allows users to access and control Windows macOS Linux Android and iOS devices from anywhere providing secure and reliable remote access."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Airdroid" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="AirDroid is a free and fast Android device manager app that allows you to access Android phone/tablet from computer remotely and securely. Manage SMS files photos and videos WhatsApp Line WeChat and more on computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="UltraViewer" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Remote control to support your clients / partners from everywhere."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Wireless Network Watcher Portable" Tag="Portable" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Wireless Network Watcher is a small utility that scans your wireless network and displays the list of all computers and devices that are currently connected to your network."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WifiInfoView" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Wireless Network Watcher is a small utility that scans your wireless network and displays the list of all computers and devices that are currently connected to your network."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="qBittorrent" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource BitTorrent client for downloading and uploading files via the BitTorrent protocol providing users with a lightweight and featurerich torrenting experience."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Google Earth Pro" Tag="Imaging" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Google Earth Pro on desktop is free for users with advanced feature needs. Import and export GIS data and go back in time with historical imagery."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="XAMPP" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="XAMPP is a free and opensource crossplatform web server solution stack package developed by Apache Friends consisting mainly of the Apache HTTP Server MariaDB database and interpreters for scripts written in the PHP and Perl programming languages."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Visual Studio Professional 2022" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Visual Studio Professional 2022 is an integrated development environment IDE from Microsoft. It is used to develop computer programs websites web apps web services and mobile apps."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Visual Studio Community 2022" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Visual Studio Community 2022 is a free fullyfeatured and extensible IDE for individual developers open source projects academic research education and small professional teams."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Unity Hub" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Unity is a crossplatform game creation system developed by Unity Technologies and used to develop video games for PC consoles mobile."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Godot Engine" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Godot is a featurepacked crossplatform game engine for creating 2D and 3D games. It provides a comprehensive set of tools and features to develop games efficiently and quickly."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Unity3D Engine" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Unity is a crossplatform game creation system developed by Unity Technologies and used to develop video games for PC consoles mobile."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Blender" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Blender is a free and opensource professionalgrade 3D computer graphics and video compositing program."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="VSCode" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Visual Studio Code is a free sourcecode editor developed by Microsoft for Windows Linux and macOS. It includes support for debugging embedded Git control syntax highlighting intelligent code completion snippets and code refactoring."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Vim" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Vim is an advanced text editor that seeks to provide the power of the defacto Unix editor Vi with a more complete feature set. Its us... Keep Reading."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Sublime Text 4" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Sublime Text 4  The sophisticated text editor for code markup and prose."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Atom" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Atom is a text editor thats modern approachable yet hackable to the corea tool you can customize to do anything but also use productively without ever touching a config file."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="InnoSetup" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Inno Setup is a free installer for Windows programs. First introduced in 1997 Inno Setup today rivals and even surpasses many commercial installers in feature set and stability."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PyCharm Community Edition" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PyCharm Community Edition is a free and opensource IDE for Python development. It provides smart code completion code inspections onthefly error highlighting and quickfixes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PyCharm Professional Edition" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PyCharm Professional Edition is a powerful IDE for professional Python development. It includes advanced features such as database tools web development support and scientific tools integration."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Jetbrains Rider" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Rider is a crossplatform .NET IDE developed by JetBrains. It supports C VB.NET F ASP.NET JavaScript TypeScript HTML CSS and SQL languages and frameworks."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Node.js LTS" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Node.js is a JavaScript runtime built on Chromes V8 JavaScript engine. LTS Long Term Support releases are supported for an extended period and provide stability for production environments."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Electrum-LTS" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Electrum is a lightweight Bitcoin wallet focused on speed and simplicity with support for hardware wallets and multisig functionality. LTS Long Term Support releases provide stability and security updates for an extended period."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Hugo" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Hugo is one of the most popular opensource static site generators. With its amazing speed and flexibility Hugo makes building websites f... Keep Reading."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Hugo Extended" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Hugo is one of the most popular opensource static site generators. With its amazing speed and flexibility Hugo makes building websites f... Keep Reading."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Notepad++" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Notepad is a free source code editor and Notepad replacement that supports several languages. It offers syntax highlighting code folding autocompletion and other features for efficient code editing."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Windows Terminal" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Windows Terminal is a modern terminal application for users of commandline tools and shells like Command Prompt PowerShell and Windows Subsystem for Linux WSL. It provides multiple tabs custom themes and GPUaccelerated text rendering."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Powershell 7" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PowerShell Core is a crossplatform Windows Linux and macOS automation and configuration tool/framework that works well with your existing tools and is optimized for dealing with structured data e.g. JSON CSV XML etc. REST APIs and object models."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="x64dbg Portable" Tag="Portable" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource x64/x32 debugger for windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="dnSpy" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="dnSpy is a tool to reverse engineer .NET assemblies. It includes a decompiler a debugger and an assembly editor and more and can be easily extended by writing your own extension. It uses dnlib to read and write assemblies so it can handle obfuscated assemblies eg. malware without crashing."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Cheat Engine" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Cheat Engine is an open source tool designed to help you modify single player games."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Python 3.12.6" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Python is a popular highlevel programming language known for its simplicity and versatility. It is used in various fields such as web development data science machine learning and automation."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Git" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Git is a free and opensource distributed version control system designed to handle everything from small to very large projects with speed and efficiency."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GitHub Desktop" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="GitHub Desktop is a seamless way to contribute to projects on GitHub and GitHub Enterprise. It provides an intuitive interface for managing repositories branching committing and merging code changes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Docker Desktop" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Docker Desktop is an easytoinstall application for Windows and macOS that enables developers to build share and run containerized applications and microservices locally."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Docker Compose" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Docker Compose is a tool for defining and running multicontainer Docker applications. It allows you to use a YAML file to configure your applications services networks and volumes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PowerToys" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PowerToys is a set of utilities for power users to tune and streamline their Windows experience for greater productivity. It includes tools like FancyZones for window management PowerRename for batch renaming files and more."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Notion" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The allinone workspace for your notes tasks wikis and databases."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FL Studio" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="FL Studio is a digital audio workstation DAW developed by ImageLine. It allows you to compose arrange record edit mix and master professionalquality music."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Android Debug Bridge" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Android Debug Bridge ADB is a commandline tool that allows you to communicate with an Android device. It is used for various debugging tasks such as installing and debugging apps."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Universal ADB Drivers" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Universal ADB Drivers are drivers that provide compatibility with a wide range of Android devices for debugging purposes. They allow you to connect your Android device to a computer and use ADB commands."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Scrcpy" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Scrcpy is a free and opensource tool that allows you to display and control your Android device from a computer. It provides highperformance screen mirroring and supports various input methods."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="VirtualBox" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="VirtualBox is a crossplatform virtualization application. It installs on existing Intel or AMDbased computers whether they are running Windows Mac Linux or Solaris operating systems. It extends the capabilities of your existing computer so that it can run multiple operating systems inside multiple virtual machines at the same time."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Oh My Posh" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text=" Oh my Posh is a custom prompt engine for any shell that has the ability to adjust the prompt string with a function or variable."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Malwarebytes" Tag="Security" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Security"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Multiple layers of malwarecrushing tech including virus protection. Thorough malware and spyware removal. Specialized ransomware protection."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Avast Free Antivirus" Tag="Security" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Security"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Avast Free Antivirus."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Nerd Fonts - CascadiaCode" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Nerd Fonts is a project that patches developer targeted fonts with a high number of glyphs icons."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Java SE Runtime Environment 8.0.411" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Java allows you to play online games chat with people around the world calculate your mortgage interest and view images in 3D just to name a few. Its also integral to the intranet applications and other ebusiness solutions that are the foundation of corporate computing. Please note you now need a Java License from Oracle to use unless installed for Personal Use and Development Use."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Audacity" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Audacity is free open source crossplatform software for recording and editing sounds."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MusicBee" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MusicBee makes it easy to organize find and play music files on your computer on portable devices and on the web."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Format Factory" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="multifunctional media processing tools."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Winaero Tweaker" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Customize the appearance and behavior of the Windows operating system."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Windows Subsystem for Linux WSL2" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="To install Windows Subsystem for Linux 2 run the following command from the command line or from PowerShell."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Wamp Server 3.3.5" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="WampServer is a Windows web development environment. It allows you to create web applications."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MongoDB" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MongoDB stores data using a flexible document data model that is similar to JSON. Documents contain one or more fields including arrays binary data and subdocuments. Fields can vary from document to document. This flexibility allows development teams to evolve the data model rapidly as their application requirements change."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MPC-BE" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Media Player Classic  BE is a free and open source audio and video player for Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Kdenlive" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A powerful nonlinear video editor."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TablePlus" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Modern native and friendly GUI tool for relational databases MySQL PostgreSQL SQLite MongoDB Redis and more."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Hosts File Editor" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Hosts File Editor makes it easy to change your hosts file as well as archive multiple versions for easy retrieval."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Subtitle Edit" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="With SE you can easily adjust a subtitle if it is out of sync with the video in several different ways. You can also use SE for making new subtitles from scratch do use the timeline/waveform/spectrogram or translating subtitles."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Skype" Tag="Communication" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Skype  Install Skype add your friends as contacts then call video call and instant message with them for free. Call people who arent on Skype too at really low rates."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FileZilla" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="FileZilla Client is a fast and reliable crossplatform FTP FTPS and SFTP client with lots of useful features and an intuitive graphical user interface."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Everything" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Everything Search Engine  locate files and folders by name instantly."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Yarn" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Yarn is a package manager for the npm and bower registries with a few specific focuses."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="VMware Workstation Player" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="VMware Workstation Player is a streamlined desktop virtualization application that runs another operating system on the same computer without rebooting. VMware Workstation Player provides a simple user interface unmatched operating system support and portability across the VMware ecosystem."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HDD Low Level Format Tool" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Will erase LowLevel Format and recertify a SATA IDE or SCSI hard disk drive with any size of up to 281 474 976 710 655 bytes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="BlueStacks" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Play Android Games on PC."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Intel Wireless Bluetooth for Windows 10 and Windows 11" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Bluetooth for Windows 10 and Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Office 365 Business" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Microsoft 365 formerly Office 365 is a line of subscription services offered by Microsoft as part of the Microsoft Office product line. The brand encompasses plans that allow use of the Microsoft Office software suite over the life of the subscription as well as cloudbased software as a service products for business environments such as hosted Exchange Server Skype for Business Server and SharePoint among others. All Microsoft 365 plans include automatic updates to their respective software at no additional charge as opposed to conventional licenses for these programswhere new versions require purchase of a new license."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Bandicam" Tag="Imaging" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Bandicam is a closedsource screen capture and screen recording software originally developed by Bandisoft and later by Bandicam Company that can take screenshots or record screen changes. Bandicam consists of three main modes. One is the Screen Recording mode which can be used for recording a certain area on the PC screen."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="QQPlayer" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="QQPlayer media player."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="4K Video Downloader" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="4K Video Downloader allows downloading videos playlists channels and subtitles from YouTube Facebook Vimeo and other video sites in high quality."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Active@ Partition Recovery" Tag="Disk Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Active Partition Recovery is a freeware toolkit that helps to recover deleted and damaged logical drives and partitions within Windows WinPE recovery boot disk and Linux recovery LiveCD environments."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HiSuite" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="HUAWEI HiSuite is the official Android Smart Device Manager toolHiSuite helps users to connect their HUAWEI smartphones and tablets to PC."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Android Studio" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Android Studio is the official integrated development environment for Googles Android operating system built on JetBrains IntelliJ IDEA software and designed specifically for Android development."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="LibreWolf" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="LibreWolf is designed to increase protection against tracking and fingerprinting techniques while also including a few security improvements. This is achieved through our privacy and security oriented settings and patches. LibreWolf also aims to remove all the telemetry data collection and annoyances as well as disabling antifreedom features like DRM."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Flow Launcher" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Dedicated to making your workflow flow more seamless. Search everything from applications files bookmarks YouTube Twitter and more. Flow will continue to evolve designed to be open and built with the community at heart."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="IconsExtract" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The IconsExtract utility scans the files and folders on your computer and extract the icons and cursors stored in EXE DLL OCX CPL and in other file types."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AdGuard Home" Tag="Security" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Security"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="AdGuard Home is a networkwide software for blocking ads and tracking. After you set it up itll cover ALL your home devices and you dont need any clientside software for that."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Burp Suite Community Edition" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Burp Suite is an integrated platform for performing security testing of web applications. Its various tools work seamlessly together to support the entire testing process from initial mapping and analysis of an applications attack surface through to finding and exploiting security vulnerabilities.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="CoreTemp" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Core Temp is a compact no fuss small footprint yet powerful program to monitor processor temperature and other vital information."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ShareX" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Screen capture file sharing and productivity tool."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ONLY OFFICE" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="ONLYOFFICE is a project developed by experienced IT experts from Ascensio System SIA leading IT company with headquarters in Riga Latvia. Originally ONLYOFFICE was designed for internal team collaboration. An attempt to introduce it to a wider audience proved to be successful ONLYOFFICE received very positive feedback from the Internet community. As a result its functionality was considerably revised and expanded that brought about a high and stable growth of users from different countries."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ESET Internet Security" Tag="Security" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Security"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Ideal for modern users concerned about their privacy who actively use internet for shopping banking work and communication."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WinDirStat" Tag="Disk Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="WinDirStat is a disk usage statistics viewer and cleanup tool for Microsoft Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Winmerge" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="WinMerge is an Open Source differencing and merging tool for Windows. WinMerge can compare both  folders and files presenting differences in a visual text format that is easy to understand and handle."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Wireshark" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Wireshark is the worlds foremost and widelyused network protocol analyzer. It lets you see whats happening on your network at a microscopic level and is the de facto and often de jure standard across many commercial and nonprofit enterprises government agencies and educational institutions. Wireshark development thrives thanks to the volunteer contributions of networking experts around the globe and is the continuation of a project started by Gerald Combs in 1998."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TeraCopy" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="TeraCopy is designed to copy and move files at the maximum possible speed. It skips bad files during the copying process and then displays them at the end of the transfer so that you can see which ones need attention. TeraCopy can automatically check the copied files for errors by calculating their CRC checksum values. It also provides a lot more information about the files being copied than its Windows counterpart. TeraCopy integrates with Windows Explorers rightclick menu and can be set as the default copy handler."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="QuickLook" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Quick Look is among the few features I missed from Mac OS X It enables very quick preview of file by pressing Space key while highlighting it without opening its associated application Then I decide to add this feature to Windows by myself which results this QuickLook project."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="RepoZ" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="RepoZ provides a quick overview of the git repositories on your development machine including their current branch and a short status information It uses the repositories on your machine to create an efficient navigation widget and makes sure youll never loose track of your work along the way."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Intel Graphics Command Center" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Dont have time to mess around with settings The Intel Graphics Command Center easily finds and tunes your games complete with recommended settings for your computer Use oneclick optimization for many popular titles and instantly get the most out of your system. Windows 10 version 1709 or higher6th Gen Intel Core Platforms or newer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Go Programming Language" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Go is expressive concise clean and efficient Its concurrency mechanisms make it easy to write programs that get the most out of multicore and networked machines while its novel type system enables flexible and modular program construction Go compiles quickly to machine code yet has the convenience of garbage collection and the power of runtime reflection Its a fast statically typed compiled language that feels like a dynamically typed interpreted language."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Rust" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Rust is a curlybrace blockstructured expression language It visually resembles the C language family but differs significantly in syntactic and semantic details Its design is oriented toward concerns of programming in the large that is of creating and maintaining boundaries  both abstract and operational  that preserve largesystem integrity availability and concurrency."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Inkscape" Tag="Imaging" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Inkscape is an opensource vector graphics editor similar to Adobe Illustrator Corel Draw Freehand or Xara X What sets Inkscape apart is its use of Scalable Vector Graphics SVG an open XMLbased W3C standard as the native format."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Youtube Dl" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="youtubedl is a small commandline program to download videos from YouTubecom and a few more sites It is written in Python and its not platform specific It should work in your Unix box in Windows or in Mac OS X It is released to the public domain which means you can modify it redistribute it or use it however you like."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Postman" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Postman helps you be more efficient while working with APIs Using Postman you can construct complex HTTP requests quickly organize them in collections and share them with your coworkers."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Azure CLI" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Azure CLI is available across Azure services and is designed to get you working quickly with Azure with an emphasis on automation."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GameMaker Studio" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="GameMaker Studio has everything you need for games development no matter what your level or expertise."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Charles" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Charles is an HTTP proxy  HTTP monitor  Reverse Proxy that enables a developer to view all of the HTTP and SSL  HTTPS traffic between their machine and the Internet This includes requests responses and the HTTP headers which contain the cookies and caching information."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Windows Media Player" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Media Player is designed to make listening to and watching your multimedia content more enjoyable At the heart of Media Player is a fullfeatured music library that allows you to quickly browse and play music as well as create and manage playlists All your content in the music and video folders on your PC will appear automatically in your library."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="espanso" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A crossplatform Text Expander written in Rust."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Ability Office" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Ability Office Standard offers 3 core applications essential for home and business Word Processor Spreadsheet and Presentation in one affordable office suite It also includes a Photoalbum and quick application Launcher Just perfect for working from home allowing files to be edited and exchanged with those back in the office and absolutely ideal for students and school children."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Winbox" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Small utility that allows administration of MikroTik RouterOS using a fast and simple GUI."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="SearchMyFiles" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="SearchMyFiles allows you to make a very accurate search that cannot be done with Windows search For Example You can search all files created in the last 10 minutes with size between 500 and 700 bytes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="iTunes" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="iTunes is the best way to organize and enjoy the music movies and TV shows you already have and shop for the ones you want to get Its home to Apple Music which gives you unlimited access to millions of songs curated playlists1 and Beats 1 radio hosted by Zane Lowe and a team of acclaimed DJs Enjoy all the entertainment iTunes has to offer on your Mac and PC."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="StartIsBack++" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="StartIsBack returns Windows 10 and Windows 8 a real fully featured start menu and start button behaving exactly like the ones in Windows 7."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Advanced SystemCare Free" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Over time your computer may accumulate with large quantities of useless temporary and duplicate files Advanced SystemCare 12 will help clean up these junk files and free up your disk space Also you can use our advanced tools to make registry clean for better use."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Send Anywhere" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Send Anywhere is a multiplatform file sharing service where users can directly share digital content in real time."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="YUMI Legacy" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="YUMI Your Universal Multiboot Installer is the successor to MultibootISOs It can be used to create a Multiboot USB Flash Drive containing multiple operating systems antivirus utilities disc cloning diagnostic tools and more Contrary to MultiBootISOs which used grub to boot ISO files directly from USB YUMI uses syslinux to boot extracted distributions stored on the USB device and reverts to using grub to Boot Multiple ISO files from USB if necessary."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="YUMI UEFI" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="YUMI Your Universal Multiboot Installer is the successor to MultibootISOs It can be used to create a Multiboot USB Flash Drive containing multiple operating systems antivirus utilities disc cloning diagnostic tools and more Contrary to MultiBootISOs which used grub to boot ISO files directly from USB YUMI uses syslinux to boot extracted distributions stored on the USB device and reverts to using grub to Boot Multiple ISO files from USB if necessary."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="OP Auto Clicker" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A fullfledged autoclicker with two modes of autoclicking at your dynamic cursor location or at a prespecified location The maximum amounts of clicked can also be set or left as infinite Hotkeys work in the background for convenience."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Spotube" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Spotube is a Flutter based lightweight spotify client It utilizes the power of Spotify  Youtubes public API  creates a hazardless performant  resource friendly User Experience."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Audio Switcher" Tag="Media" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Easily switch the default audio device input or output on any Windows PC Vista and above Using this application you can switch output OR input sound devices at the click of a button or the press of a key I designed this application to be incredibly small and lightweight There is no bloat it does exactly what it should nothing more nothing less."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Teams Classic Desktop" Tag="Communication" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Microsoft Teams is a messaging app for teams where all conversations meetings files and notes can be accessed by everyone all in one place Its a place for collaboration and work to happen in the open."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Windows SDK" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Windows 10 SDK for Windows 10 version 1809 provides the latest headers libraries metadata and tools for building Windows 10 apps NoteWindows 10 development targeting Windows 10 version 1903 or later requires Visual Studio 2017 or later This SDK will not be discovered by previous versions of Visual Studio."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="RunAsDate Portable" Tag="Portable" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="RunAsDate is a small utility that allows you to run a program in the date and time that you specify This utility doesnt change the current system date and time of your computer but it only injects the datetime that you specify into the desired application."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Visual Studio 2017 Build " Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="These Build Tools allow you to build native and managed MSBuildbased applications without requiring the Visual Studio IDE There are options to install the Visual C compilers and libraries MFC ATL and CCLI support."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MSEdgeRedirect" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="This tool filters and passes the command line arguments of Microsoft Edge processes into your default browser instead of hooking into the microsoftedge handler this should provide resiliency against future changes Additionally an Image File Execution Options mode is available to operate similarly to the Old EdgeDeflector Additional modes are planned for future versions."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NET Desktop Runtime 5" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NET Desktop Runtime 3" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NET Desktop Runtime 6" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NET Desktop Runtime 7" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NET Desktop Runtime 8" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the NET Runtime."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Viber" Tag="Communication" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Viber is a mobile application that lets you make free phone calls and send text messages to anyone who also has the application installed You can call or text any Viber user anywhere in the world for free."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="StartAllBack" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Introducing  StartAllBack Windows 11 from a better timeline Embrace enhance unsweep classic UI from under the rug."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="DiskGenius Free" Tag="Disk Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="With powerful capabilities and userfriendly interface DiskGenius Free Edition provides a robust solution for individuals and organizations to seek efficient disk management."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="UNFORMAT" Tag="Disk Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="UNFORMAT is a software utility created to solve almost all data loss scenarios due to logical failure It can recover deleted files on a disk or restore deleted or damaged partitions and volumes As well as recovers data after using the FORMAT command."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Active@ UNDELETE" Tag="Disk Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Active UNDELETE helps you to recover deleted files and restore deleted partitions from a variety of file systems such as FAT NTFS NTFS  EFS MacOS HFS ApFS Linux ext2 ext3 ext4 ZFS Unix UFS Advanced scan algorithms help to restore files even from severely damaged disks Sophisticated userfriendly UI makes navigation through your data a breeze."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HxD Hex Editor" Tag="Disk Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="HxD is a carefully designed and fast hex editor which additionally to raw disk editing and modifying of main memory RAM handles files of any size."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Epic Games Launcher" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Epic Games Launcher is how you obtain the Unreal Game Engine modding tools and other Epic Games like Fortnite and the new Epic Games Store."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Vivaldi" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The new Vivaldi browser protects you from trackers blocks unwanted ads and puts you in control with unique builtin features Get Vivaldi and browse fast."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft PC Manager" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Microsoft PC manager a good way to protect your personal computer and optimize performance provides PC cleanup antivirus and Windows update making your computer safe and secure."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Openshot" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="OpenShot Video Editor is an awardwinning opensource video editor available on Linux Mac and Windows OpenShot can create stunning videos films and animations with an easytouse interface and rich set of features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WhatsApp" Tag="Communication" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="WhatsApp Messenger or simply WhatsApp is an American freeware crossplatform centralized messaging and voiceoverIP VoIP service owned by Facebook Inc It allows users to send text messages and voice messages make voice and video calls and share images documents user locations and other content."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Paint.NET" Tag="Imaging" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PaintNET is image and photo editing software for PCs that run Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Stretchly" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="stretchly is a crossplatform electron app that reminds you to take breaks when working on your computer By default it runs in your tray and displays a reminder window containing an idea for a microbreak for 20 seconds every 10 minutes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Silverlight" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Silverlight is a powerful development tool for creating engaging interactive user experiences for Web and mobile applications."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TreeSize" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Every hard disk is too small if you just wait long enough TreeSize Free tells you where precious disk space has gone."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Dot Net 3.5" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET is a free crossplatform opensource developer platform for building many different types of applications."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Flash Player ActiveX" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Adobe Flash Player is freeware software for viewing multimedia executing Rich Internet Applications and streaming video and audio content created on the Adobe Flash platform."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Google Drive" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Google Drive  All your files  everywhere Safely store your files and access them from any device Choose folders on your computer to sync with Google Drive or backup to Google Photos and access all of your content directly from your PC or Mac."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Dot Net 4.5.2" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Microsoft NET Framework 452 is a highly compatible inplace update to the Microsoft NET Framework 4 Microsoft NET Framework 45 and Microsoft NET Framework 451."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Dropbox" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Organize all your teams content tune out distractions and get everyone coordinated with the worlds first smart workspace."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="cURL" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Command line tool and library for transferring data with URLs."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PDF Creator" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PDFCreator lets you convert any printable document to PDF."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Autoruns" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="This utility shows you what programs are configured to run during system bootup or login."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft OneDrive" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Save your files and photos to OneDrive and access them from any device anywhere."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Process Explorer" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Process Explorer shows you information about which handles and DLLs processes have opened or loaded."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FFmpeg" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="FFmpeg is a widelyused crossplatform multimedia framework which can process almost all common and many uncommon media formats It has over 1000 internal components to capture decode encode modify combine stream media and it can make use of dozens of external libraries to provide more capabilities."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="OpenVPN Connect" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The official OpenVPN Connect client software developed and maintained by OpenVPN Inc."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Git Large File Storage" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Git Large File Storage LFS replaces large files such as audio samples videos datasets and graphics with text pointers inside Git while storing the file contents on a remote server like GitHubcom or GitHub Enterprise."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Nmap" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Nmap Network Mapper is a free and open source utility for network discovery and security auditing."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="UltraVNC" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="UltraVNC is an open source application that uses the VNC protocol to control another computer remotely over a network connection UltraVNC allows the use of a remote computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Plex" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Plex is a global streaming media service and a clientserver media player platform made by Plex Inc."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Plex Media Server" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Plex Media Server helps you organise your media and stream it to your devices."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visio Viewer" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="By using Microsoft Visio 2016 Viewer Visio users can freely distribute Visio drawings files with a vsdx vsdm vsd vdx vdw vstx vstm vst or vtx extension to team members partners customers or others even if the recipients do not have Visio installed on their computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Keyn Stroke" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="KeynStroke makes it easy for your audience to follow your actions on the screen."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Ability Office" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Ability Office 8 Standard complete office suite."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Fing" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Fing App is a free network scanner that makes you discover all connected devices run internet speed tests and help troubleshoot network and device issues Get Fingbox for more advanced security and protection for your network."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Ryujinx" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Ryujinx is an opensource Nintendo Switch emulator created by gdkchan and written in C This emulator aims at providing excellent accuracy and performance a userfriendly interface and consistent builds."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Omnify Hotspot" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The best virtual router to turn your PC into a WiFi hotspot  repeater WiFi hotspot allows you to create a wireless access point and share your internet Its easy to use and quick to start as you only need to give it a name and password and then connect your smartphone tablet media player ereader printer laptop and other wireless devices The network name can also include Unicode characters and Emojis."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MKVToolNix" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MKVToolNix is a set of tools to create alter and inspect Matroska files under Linux other Unices and Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Neat Download Manager" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Neat Download Manager is a free Internet Download Manager for Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="x630ce for all games" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Xbox 360 Controller Emulator allows your controller gamepad joystick steering wheel pedals etc. to function on your PC as an Xbox 360 controller. It allows you to remap buttons and axes and to drive cars with steering wheel and pedals or to fly planes with joystick and throttle in games like Grand Theft Auto or Saints Row  Digitally Signed."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="x630ce x86" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Xbox 360 Controller Emulator allows your controller gamepad joystick steering wheel pedals etc. to function on your PC as an Xbox 360 controller. It allows you to remap buttons and axes and to drive cars with steering wheel and pedals or to fly planes with joystick and throttle in games like Grand Theft Auto or Saints Row  Digitally Signed."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="x630ce x64" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Xbox 360 Controller Emulator allows your controller gamepad joystick steering wheel pedals etc. to function on your PC as an Xbox 360 controller. It allows you to remap buttons and axes and to drive cars with steering wheel and pedals or to fly planes with joystick and throttle in games like Grand Theft Auto or Saints Row  Digitally Signed."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft .NET SDK 7" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET is a free crossplatform opensource developer platform for building many different types of applications."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft .NET SDK 8" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET is a free crossplatform opensource developer platform for building many different types of applications."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft ASP.NET Core Runtime 7.0" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET is a free crossplatform opensource developer platform for building many different types of applications."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HFS HTTP File Server" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="You can use HFS HTTP File Server to send and receive files Its different from classic file sharing because it uses web technology to be more compatible with todays Internet It also differs from classic web servers because its very easy to use and runs right outofthe box."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Cemu" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Cemu is a highly experimental software to emulate Wii U applications on PC."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Chatterino" Tag="Communication" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Chatterino is a chat client for Twitch chat that offers a clean and customizable interface for a better streaming experience."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Clementine" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Clementine is a modern music player and library organizer supporting various audio formats and online radio services."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Clink" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Clink is a powerful Bashcompatible commandline interface CLIenhancement for Windows adding features like syntax highlighting and improved history."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="CMake" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="CMake is an opensource crossplatform family of tools designed to build test and package software."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="CopyQ Clipboard Manager" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="CopyQ is a clipboard manager with advanced features allowing you to store edit and retrieve clipboard history."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Crystal Disk Info" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Crystal Disk Info is a disk health monitoring tool that provides information about the status and performance of hard drives It helps users anticipate potential issues and monitor drive health."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Crystal Disk Mark" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Crystal Disk Mark is a disk benchmarking tool that measures the read and write speeds of storage devices It helps users assess the performance of their hard drives and SSDs."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Darktable" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Opensource photo editing tool offering an intuitive interface advanced editing capabilities and a nondestructive workflow for seamless image enhancement."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="EA App" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="EA App is a platform for accessing and playing Electronic Arts games."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Falkon" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Falkon is a lightweight and fast web browser with a focus on user privacy and efficiency."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="File Converter" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="File Converter is a very simple tool which allows you to convert and compress one or several files using the context menu in windows explorer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Files" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Alternative file explorer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Flameshot" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Flameshot is a powerful yet simple to use screenshot software offering annotation and editing features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Lightshot" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Ligthshot is an Easytouse lightweight screenshot software tool where you can optionally edit your screenshots using different tools share them via Internet andor save to disk and customize the available options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="F.lux" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="flux adjusts the color temperature of your screen to reduce eye strain during nighttime use."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GitHub CLI" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="GitHub CLI is a commandline tool that simplifies working with GitHub directly from the terminal."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GOG Galaxy" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="GOG Galaxy is a gaming client that offers DRMfree games additional content and more."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Greenshot" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Greenshot is a lightweight screenshot software tool with builtin image editor and customizable capture options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Hexchat" Tag="Communication" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="HexChat is a free opensource IRC Internet Relay Chat client with a graphical interface for easy communication."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HWMonitor" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="HWMonitor is a hardware monitoring program that reads PC systems main health sensors."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ImageGlass" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="ImageGlass is a versatile image viewer with support for various image formats and a focus on simplicity and speed."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Itch.io" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Itchio is a digital distribution platform for indie games and creative projects."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="KDE Connect" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="KDE Connect allows seamless integration between your KDE desktop and mobile devices."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="KeePassXC" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="KeePassXC is a crossplatform opensource password manager with strong encryption features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Lazygit" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Simple terminal UI for git commands."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="LocalSend" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An open source crossplatform alternative to AirDrop."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Fork" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Fork  a fast and friendly git client."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PulsarEdit" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A Communityled HyperHackable Text Editor."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Shotcut" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Shotcut is a free open source crossplatform video editor."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PaleMoon" Tag="Web Browsers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Pale Moon is an Open Source Goannabased web browser available for Microsoft Windows and Linux with other operating systems in development focusing on efficiency and ease of use."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="JoyToKey" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="enables PC game controllers to emulate the keyboard and mouse input."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Windows Auto Dark Mode" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Automatically switches between the dark and light theme of Windows 10 and Windows 11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Windows Firewall Control" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Windows Firewall Control is a powerful tool which extends the functionality of Windows Firewall and provides new extra features which makes Windows Firewall better."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TightVNC" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="TightVNC is a free and Open Source remote desktop software that lets you access and control a computer over the network With its intuitive interface you can interact with the remote screen as if you were sitting in front of it You can open files launch applications and perform other actions on the remote desktop almost as if you were physically there."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Python Version Manager" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="pyenv for Windows is a simple python version management tool It lets you easily switch between multiple versions of Python."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Pixi" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Pixi is a fast software package manager built on top of the existing conda ecosystem Spins up development environments quickly on Windows macOS and Linux Pixi supports Python R CC Rust Ruby and many other languages."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="VSCodium" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="VSCodium is a communitydriven freelylicensed binary distribution of Microsofts VS Code."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Thonny Python IDE" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Python IDE for beginners."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Poedit" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Poedit translations editor The best way to translate apps and sites."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Adobe Acrobat Reader" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Adobe Acrobat Reader DC software is the free trusted global standard for viewing printing signing sharing and annotating PDFs Its the only PDF viewer that can open and interact."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Flash Player Plugin" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Adobe Flash Player is freeware software for viewing multimedia executing Rich Internet Applications and streaming video and audio content created on the Adobe Flash platform."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Sysinternals" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Sysinternals Troubleshooting Utilities have been rolled up into a single suite of tools."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="SelfishNet" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Control your internet bandwidth with SelfishNet V3 ARP Spoofing application.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NTLite" Tag="Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Integrate updates drivers automate Windows and application setup speedup Windows deployment process and have it all set for the next time."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Olive Video Editor" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Olive is a free nonlinear video editor for Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Mark Text" Tag="Portable" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A simple and elegant opensource markdown editor that focused on speed and usability."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="pCloud Drive" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="pCloud is a file hosting service also called cloud storage or online storage founded in Switzerland in 2013."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Hurl" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Hurl is a command line tool that runs HTTP requests defined in a simple plain text format."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="File Hash Generator" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Compute and save MD5 SHA1 SHA2 RIPEMD hashes and CRC1632 checksums for multiple files Calculate hashes and checksums for the whole file or just specified bytes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Multimark down" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MultiMarkdown or MMD is a tool to help turn minimally markedup plain text into well formatted documents including HTML PDF."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PCSX2 Emulator" Tag="Portable" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PCSX2 is a free and opensource PlayStation 2 PS2 emulator Its purpose is to emulate the PS2s hardware."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="RetroArch" Tag="Gaming" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="RetroArch is a frontend for emulators game engines and media players It enables you to run classic games on a wide range of computers and consoles through its slick graphical interface."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Free Virtual Keyboard" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Free Virtual Keyboard works on any Windows based UMPC with a passive touchscreen Ultramobile PC Tablet PC and Panel PC."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TypeScript for Visual Studio 2017 and 2019" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="This is a standalone power tool release of TypeScript for Visual Studio 2017 and 2019 It includes both the TypeScript experience for Visual Studio and a standalone compiler that can be used from the command line."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Caret" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Beautiful  Clever Markdown Editor Download trial."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="iSpy" Tag="Imaging" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="iSpy is the worlds most popular open source video surveillance application Its compatible with the the vast majority of consumer webcams and IP cameras With more than 2 million users worldwide iSpy works with more cameras and devices than anything else on the market."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WavPack" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="WavPack is a completely open audio compression format providing lossless highquality lossy and a unique hybrid compression mode Although the technology is loosely based on previous versions of WavPack the new version 4 format has been designed from the ground up to offer unparalleled performance and functionality."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ProcessThreadsView" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="ProcessThreadsView is a small utility that displays extensive information about all threads of the process that you choose."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Zulu" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Zulu is a certified build of OpenJDK that is fully compliant with the Java SE standard Zulu is 100 open source and freely downloadable Now Java developers system administrators and end users can enjoy the full benefits of open source Java with deployment flexibility and control over upgrade timing."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GitHubReleaseNotesv1" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Generate Release Notes in MarkDown format from a GitHub project."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Tome" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Developing games is all about data With game systems for modifying data and user interfaces for presenting it finding a sophisticated data model is key to creating successful games Even more being able to change this data and iterate on a daytoday basis is mandatory in todays production cycles."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Win32 OpenSSH" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="OpenSSH is a complete implementation of the SSH protocol version 2 for secure remote login command execution and file transfer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Komodo Edit" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Komodo Edit is a free and open source text editor for dynamic programming languages."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FreeCAD" Tag="Imaging" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource multiplatform 3D parametric modeler."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="SQLite" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="SQLite is an inprocess library that implements a selfcontained serverless zeroconfiguration transactional SQL database engine SQLite is an embedded SQL database engine Unlike most other SQL databases SQLite does not have a separate server process SQLite reads and writes directly to ordinary disk files A complete SQL database with multiple tables indices triggers and views is contained in a single disk file."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MkDocs" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MkDocs is a fast simple and downright gorgeous static site generator thats geared towards building project documentation Documentation source files are written in Markdown and configured with a single YAML configuration file."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MkDocs Material Theme" Tag="Development" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MkDocs is a fast simple and downright gorgeous static site generator thats geared towards building project documentation Documentation source files are written in Markdown and configured with a single YAML configuration file."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PuTTY" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free implementation of SSH and Telnet along with an xterm terminal emulator."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WinSCP" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="WinSCP is an open source free SFTP client FTP client WebDAV client S3 client and SCP client for Windows Its main function is file transfer between a local and a remote computer Beyond this WinSCP offers scripting and basic file manager functionality."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="LibreOffice Still" Tag="Documents" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="LibreOffice is the free powerpacked Open Source personal productivity suite for Windows macOS and Linux that gives you six featurerich applications for all your document production and data processing needs."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Aio Runtimes" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="All in One Runtimes also known as AIO Runtimes is a program that integrates essential runtime packages ensuring the seamless functionality of all programs by installing them automatically."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Visual-C-Runtimes All in One Oct 2024" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="This archive contains the latest version Oct 2024 of all VCRedist Visual Studio C runtimes installable with a single click by running the included batch file installer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GPU-Z" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="GPUZ is a lightweight system utility designed to provide vital information about your video card and graphics processor."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MemTest86" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MemTest86 boots from a USB flash drive and tests the RAM in your computer for faults using a series of comprehensive algorithms and test patterns."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Memtest86+" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Memtest86 v6 is a unified free opensource memory testing tool released under GNU GPL v2.0. The new v6 code base originally called PCMemTest was provided by Martin Whitaker based on Memtest86 v5 developed by Sam Demeulemeester. Both are now working on Memtest86."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="VLC Skins" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Put the downloaded VLT files in the following folder On Windows the skins folder in the VLC installation directory e.g. CProgram FilesVideoLANVLCskins On Linux/Unix /.local/share/vlc/skins2."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GrepWin" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Regular expression search and replace for Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NICE DCV Server" Tag="Utilities" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NICE DCV is a remote display protocol that securely streams desktops and apps from cloud or data centers to any device enabling graphicsintensive applications on Amazon EC2. Its used for HPC workloads and by services like Appstream 2.0 and AWS RoboMaker."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NTag" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NTag is a cross platformgraphical tag editor focused on everyday life use cases."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Radeon™ RX 570 Adrenalin Edition Windows 10" Tag="GPU Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="GPU Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="RX 570 Driver Adrenalin 24.3.1 WHQL Recommended."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Radeon™ RX 580 Adrenalin Edition Windows 10" Tag="GPU Drivers" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="GPU Drivers"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="RX 580 Adrenalin 24.9.1 WHQL Recommended."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Visual C++ Redistributable Runtimes AIO Repack" Tag="Runtimes" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Visual C Redistributable Runtimes AIO Repack is all the latest Microsoft Visual C Redistributable Runtimes without the original setup bloat payload."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Volume2" Tag="Media Tools" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Advanced Windows volume control."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="qBittorrent Enhanced Edition" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Unofficial qBittorrent Enhanced based on qBittorrent."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Aspia" Tag="File Sharing" IsChecked="false"   ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Remote desktop and file transfer tool."/>
        </StackPanel>
                    </ListView>
                </TabItem.Content>
            </TabItem>
            <TabItem x:Name="tweeksTab" Header="{Binding tweaks}" BorderBrush="{x:Null}" Background="{x:Null}">
                <TabItem.HeaderTemplate>
                        <DataTemplate>
                            <StackPanel Orientation="Horizontal">
                                <TextBlock Text="" FontFamily="Segoe MDL2 Assets" FontSize="18" Margin="0,0,2,0"/>
                                <TextBlock Text="{Binding}"  FontSize="15" TextWrapping="Wrap" Margin="0,0,2,0"/>
                            </StackPanel>
                        </DataTemplate>
                </TabItem.HeaderTemplate>
                    <ListView Name="tweakslist"  Margin="0" ScrollViewer.VerticalScrollBarVisibility="Auto" Width="Auto" Height="Auto" BorderBrush="{x:Null}" Background="{x:Null}">
                                <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disk cleanup" Tag="Storage" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Storage"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Clean temporary files that are not necessary."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="System File Checker" Tag="Fixer" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Fixer"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="sfc /scannow Use the System File Checker tool to repair missing or corrupted system files."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Clean Taskbar" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disable the News and interests and People icon Show Search icon only for Windows 10/11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Remove Windows 10/11 Bloatware" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A selection of preinstalled apps including productivity tools games communication apps and entertainment software like Xbox Microsoft News TikTok and more will be removed.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Fix Stutter in games" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Fix Stutter in Games Disable GameBarPresenceWriter. Windows 10/11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Enable the Ultimate Performance Power Plan" Tag="Power" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Power"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Enable the Ultimate Performance Power Plan."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Reset the TCP/IP Stack" Tag="Fixer" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Fixer"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="If you have an internet problem Reset network configuration."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Setup Auto login" Tag="Other" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Other"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Setup auto login Windows username."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable  Xbox Services" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disables all Xbox Services Game Mode and Optimizations for Windowed Games and fix stutter playing smooth."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Start Menu Ads" Tag="Privacy" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disable Start menu Ads and Settings."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Windows Web Search" Tag="Privacy" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disable web search in Windows by Modify the registry settings related to Windows Search for Windows 10 and 11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Turn off background Apps" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Turn off background apps for Windows 10 and 11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable suggestions on Start Menu" Tag="Privacy" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disables suggestions on start menu for Windows 10 and 11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Remove Folder Shortcuts From File Explorer" Tag="Other" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Other"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Remove Documents Videos Pictures Desktop. Shortcuts from File Explorer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Optimize Windows Services" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disable Print Spooler Fax Diagnostic Policy Downloaded Maps Manager Windows Error Reporting Service Remote Registry  Internet Connection Sharing Disables Telemetry and Data."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Hibernate" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Hibernate is a powersaving mode in Microsoft Windows operating systems that allows the system to save the current state of your computer to the hard disk and then power down completely."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable OneDrive" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disabling OneDrive for Windows 10 and 11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Activate Windows Old Photo Viewer" Tag="Classic" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Classic"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Enables the classic Windows Photo Viewer for Windows 10."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Restore Classic Context Menu Windows 11" Tag="Classic" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Classic"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Restore the old context menu for Windows 11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Remove Copilot in Windows 11" Tag="Privacy" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Copilot in Windows provides centralized generative AI assistance to your users right from the Windows desktop Copilot in Windows appears as a side bar docked on the Windows desktop and is designed to help users get things done in Windows Copilot in Windows can perform common tasks in Windows like changing Windows settings which makes it different from the browserbased Copilot in Edge."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Recall Snapshots in Windows 11 24H" Tag="Privacy" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Recall is an upcoming preview experience exclusive to Copilot PCs that will help you easily find and remember things youve seen using natural language."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Delete Thumbnail Cache" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="removing the stored image thumbnails on your computer These thumbnails are small versions of images used by the operating system to display image previews quickly Over time the cache can become large or corrupted causing slowdowns or display issues Deleting it can free up space.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Old Volume Control in Windows 10" Tag="Classic" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Classic"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The old volume control in Windows 10 refers to the classic audio mixer interface that was used in earlier versions of Windows before the modern volume control system was introduced.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Toggle Key Sounds" Tag="Classic" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Classic"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Toggle key sounds in Windows are audio cues that play when you press the Caps Lock Num Lock or Scroll Lock keys. These sounds help users identify when these keys are activated or deactivated."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Homegroup" Tag="" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content=""/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disables HomeGroup  HomeGroup is a passwordprotected home networking service that lets you share your stuff with other PCs that are currently running and connected to your network."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Remove Home and Gallery from explorer in Windows 11" Tag="Privacy" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Removes the Home and Gallery from explorer and sets This PC as default."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable all Privacy Settings" Tag="Privacy" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disable WifiSense  Activity History  ActivityFeed Telemetry  DataCollection."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Autoplay and Autorun" Tag="Protection" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Protection"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disabling autoplay in Windows prevents the automatic launch of media or applications when a removable device such as a USB drive or CD is connected to the computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable SMB Server" Tag="Protection" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Protection"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="SMB Server enables file and printer sharing over a network allowing access to resources on remote computers as if they were local."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Set current network profile to public" Tag="" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content=""/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Deny file sharing device discovery etc."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Enable F8 boot menu options" Tag="BIOS" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="BIOS"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Enable F8 boot menu options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable display and sleep mode timeouts" Tag="Power" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Power"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="If you frequently use your device disable this."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Set Wallpaper desktop Quality to 100%" Tag="Personalization" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Personalization"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Its Microsoft what should I say."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Windows Transparency" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Its Microsoft what should I say."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable scheduled defragmentation task" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Defragmentation in Windows optimizes disk performance by reorganizing fragmented data improving access times and system efficiency."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Enable NET 3.5" Tag="" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content=""/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Some old games and applications require .NET Framework 3.5."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Super Performance" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="All Windows effects disabled and optimized for windowed games. You may need to log out and back in for changes to take effect. You can reset to default settings in Settings Tab."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Remove Widgets from Taskbar in Windows 11" Tag="Performance" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Widgets are one of the new user interface elements in Windows 11 They are used to display dynamic information on the desktop including weather news and other information from various sources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Unknown" Tag="Privacy" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Rename Computer name and Username to Unknown. The changes will take effect after you restart the computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Fix Arabic encoding" Tag="Fixer" IsChecked="false"    FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Fixer"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Fix issues related to strange symbols appearing in Arabic text."/>
        </StackPanel>
                    </ListView>
            </TabItem>
            <TabItem x:Name="SettingsTab" Header="{Binding settings}" BorderBrush="{x:Null}" Background="{x:Null}">
                <TabItem.HeaderTemplate>
                        <DataTemplate>
                            <StackPanel Orientation="Horizontal">
                                <TextBlock Text="" FontFamily="Segoe MDL2 Assets" FontSize="18" Margin="0,0,2,0"/>
                                <TextBlock Text="{Binding}"  FontSize="15" TextWrapping="Wrap" Margin="0,0,2,0"/>
                            </StackPanel>
                        </DataTemplate>
                </TabItem.HeaderTemplate>
                    <ListView Name="SettingsList"  Margin="0" ScrollViewer.VerticalScrollBarVisibility="Auto" Width="Auto" Height="Auto" BorderBrush="{x:Null}" Background="{x:Null}">
                                <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Show file extensions" Tag=""  Style="{StaticResource ToggleSwitchStyle}" Name="ToggleShowExt"  FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Protection"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Show file extensions in Windows displays the suffix at the end of file names like .txt .jpg .exe indicating file types and helping users identify which programs can open them simplifying file management and differentiation."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Show Super Hidden" Tag=""  Style="{StaticResource ToggleSwitchStyle}" Name="ToggleShowHidden"  FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Protection"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Show Super Hidden displays files and folders in Windows that are hidden beyond standard hidden files often system files to prevent accidental changes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Dark Mode" Tag=""  Style="{StaticResource ToggleSwitchStyle}" Name="ToggleDarkMode"  FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Personalize"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Dark Mode is a setting that changes the screen to darker colors reducing eye strain and saving battery life on OLED screens."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NumLook" Tag=""  Style="{StaticResource ToggleSwitchStyle}" Name="ToggleNumLook"  FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Protection"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Toggle the Num Lock key state when your computer starts."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Sticky Keys" Tag=""  Style="{StaticResource ToggleSwitchStyle}" Name="ToggleStickyKeys"  FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Accessibility"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Sticky keys is an accessibility feature of some graphical user interfaces which assists users who have physical disabilities or help users reduce repetitive strain injury."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Mouse Acceleration" Tag=""  Style="{StaticResource ToggleSwitchStyle}" Name="MouseAcceleration"  FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Accessibility"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Cursor movement is affected by the speed of your physical mouse movements."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="End Task On Taskbar Windows 11" Tag=""  Style="{StaticResource ToggleSwitchStyle}" Name="EndTaskOnTaskbar"  FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Accessibility"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Option to end task when right clicking a program in the taskbar."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Clear Page File At Shutdown" Tag=""  Style="{StaticResource ToggleSwitchStyle}" Name="ClearPageFileAtShutdown"  FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Storage "/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Page file in Windows removes sensitive data stored in virtual memory when the system shuts down. This enhances security by ensuring that the data in the page file which may contain passwords encryption keys or other sensitive information is wiped out and cannot be accessed after rebooting. However it can increase shutdown time."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Auto End Tasks" Tag=""  Style="{StaticResource ToggleSwitchStyle}" Name="AutoEndTasks"  FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Automatically end tasks that are not responding."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Performance Options" Tag=""  Style="{StaticResource ToggleSwitchStyle}" Name="VisualFXSetting"  FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Adjust for best performance."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Width="auto" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Launch To This PC" Tag=""  Style="{StaticResource ToggleSwitchStyle}" Name="LaunchTo"  FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Accessibility"/>
            </StackPanel>
            <TextBlock Width="555" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Changing the default opening location of File Explorer in Windows allows it to open directly to This PC instead of Quick Access making it easier to quickly access main drives and system folders."/>
        </StackPanel>
                    </ListView>
            </TabItem>
    </TabControl>
<!--End TabControl-->
        

<Grid Row="2">

  <Grid.ColumnDefinitions>
    <ColumnDefinition Width="*"/>
    <ColumnDefinition Width="auto"/>
  </Grid.ColumnDefinitions>


  <!-- Buttons -->
     <Grid Column="1" Background="Transparent">
      
      <!--Install Button-->
        <Button
          Name="installBtn"
          FontSize="14"
          HorizontalAlignment="Center"
          VerticalAlignment="Center"
          HorizontalContentAlignment="Center"
          VerticalContentAlignment="Center"
          Cursor="Hand"
          Width="140" 
          Height="45" 
          Margin="20">

          <StackPanel Orientation="Horizontal" HorizontalAlignment="Center" VerticalAlignment="Center">
              <TextBlock Name="installText" 
              Text="{Binding Install}" 
              Foreground="White" 
              Margin="0" 
              VerticalAlignment="Center"/>

              <TextBlock Name="installIcon"
              Text=" &#xE930;" 
              Foreground="White" 
              FontFamily="Segoe MDL2 Assets" 
              FontSize="14" 
              HorizontalAlignment="Center"
              VerticalAlignment="Center"/>
          </StackPanel>
        </Button>
      <!--End Install Button-->

      <!--Apply Button-->
          <Button

            Name="applyBtn"
            FontSize="14" 
            HorizontalAlignment="Center"
            VerticalAlignment="Center"
            HorizontalContentAlignment="Center"
            VerticalContentAlignment="Center"
            Cursor="Hand"
            Width="140" 
            Height="45" 
            Margin="20">
            
            <StackPanel Orientation="Horizontal" HorizontalAlignment="Center" VerticalAlignment="Center">

                <TextBlock Name="applyText" 
                Text="{Binding Apply}" 
                Foreground="White" 
                Margin="0" 
                VerticalAlignment="Center"/>

                <TextBlock Name="applyIcon" 
                Text=" &#xE930;" Foreground="White" 
                FontFamily="Segoe MDL2 Assets" 
                FontSize="14" 
                HorizontalAlignment="Center"
                VerticalAlignment="Center"/>

            </StackPanel>

          </Button>
      <!--End Apply Button-->

    </Grid>
  <!-- Buttons -->

  <!-- Quote Text & Icon -->
    <Grid Column="0" Background="Transparent">
      <StackPanel Orientation="Horizontal">

        <TextBlock
          Text="&#xEFA9;"
          Name="QuoteIcon"
          Margin="15,0,0,0"
          FontSize="14"
          TextAlignment="Center"
          HorizontalAlignment="Center"
          VerticalAlignment="Center"
          FontFamily="Segoe MDL2 Assets"
        />

        <TextBlock Name="quotes"
          HorizontalAlignment="Left"
          VerticalAlignment="Center" 
          TextWrapping="Wrap"
          Padding="8"
          Text="#StandWithPalestine"
          FontWeight="SemiBold"
          FlowDirection="LeftToRight"
          Width="611"
        />

      </StackPanel>
    </Grid>
  <!-- Quote Text & Icon -->

</Grid>

</Grid>
</Window>
<!--End Main Window-->



'
#===========================================================================
#endregion End WPF Main Window
#===========================================================================
#===========================================================================
#region Begin WPF About Window
#===========================================================================

$AboutWindowXaml = '<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="About | ITT"
    WindowStartupLocation="CenterScreen"
    Background="{DynamicResource PrimaryBackgroundColor}"
    WindowStyle="ToolWindow"
    Height="555" Width="455"
    ShowInTaskbar="True"
    MinHeight="555"
    MinWidth="455"
    ResizeMode="NoResize"
    Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/icon.ico">

    <Window.Resources>
      <!--Scrollbar Thumbs-->
          <Style x:Key="ScrollThumbs" TargetType="{x:Type Thumb}">
              <Setter Property="Template">
                  <Setter.Value>
                      <ControlTemplate TargetType="{x:Type Thumb}">
                          <Grid x:Name="Grid">
                              <Rectangle HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Fill="Transparent" />
                              <Border x:Name="Rectangle1" CornerRadius="5" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Background="{TemplateBinding Background}" />
                          </Grid>
                          <ControlTemplate.Triggers>
                              <Trigger Property="Tag" Value="Horizontal">
                                  <Setter TargetName="Rectangle1" Property="Width" Value="Auto" />
                                  <Setter TargetName="Rectangle1" Property="Height" Value="7" />
                              </Trigger>
                          </ControlTemplate.Triggers>
                      </ControlTemplate>
                  </Setter.Value>
              </Setter>
          </Style>
          <Style x:Key="{x:Type ScrollBar}" TargetType="{x:Type ScrollBar}">
              <Setter Property="Stylus.IsFlicksEnabled" Value="false" />
              <Setter Property="Foreground" Value="{DynamicResource PrimaryButtonForeground}" />
              <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
              <Setter Property="Width" Value="8" />
              <Setter Property="Template">
                  <Setter.Value>
                      <ControlTemplate TargetType="{x:Type ScrollBar}">
                          <Grid x:Name="GridRoot" Width="8" Background="{TemplateBinding Background}">
                              <Grid.RowDefinitions>
                                  <RowDefinition Height="0.00001*" />
                              </Grid.RowDefinitions>
                              <Track x:Name="PART_Track" Grid.Row="0" IsDirectionReversed="true" Focusable="false">
                                  <Track.Thumb>
                                      <Thumb x:Name="Thumb" Background="{TemplateBinding Foreground}" Style="{DynamicResource ScrollThumbs}" />
                                  </Track.Thumb>
                                  <Track.IncreaseRepeatButton>
                                      <RepeatButton x:Name="PageUp" Command="ScrollBar.PageDownCommand" Opacity="0" Focusable="false" />
                                  </Track.IncreaseRepeatButton>
                                  <Track.DecreaseRepeatButton>
                                      <RepeatButton x:Name="PageDown" Command="ScrollBar.PageUpCommand" Opacity="0" Focusable="false" />
                                  </Track.DecreaseRepeatButton>
                              </Track>
                          </Grid>
                          <ControlTemplate.Triggers>
                              <Trigger SourceName="Thumb" Property="IsMouseOver" Value="true">
                                  <Setter Value="{DynamicResource ButtonSelectBrush}" TargetName="Thumb" Property="Background" />
                              </Trigger>
                              <Trigger SourceName="Thumb" Property="IsDragging" Value="true">
                                  <Setter Value="{DynamicResource DarkBrush}" TargetName="Thumb" Property="Background" />
                              </Trigger>
                              <Trigger Property="IsEnabled" Value="false">
                                  <Setter TargetName="Thumb" Property="Visibility" Value="Collapsed" />
                              </Trigger>
                              <Trigger Property="Orientation" Value="Horizontal">
                                  <Setter TargetName="GridRoot" Property="LayoutTransform">
                                      <Setter.Value>
                                          <RotateTransform Angle="-90" />
                                      </Setter.Value>
                                  </Setter>
                                  <Setter TargetName="PART_Track" Property="LayoutTransform">
                                      <Setter.Value>
                                          <RotateTransform Angle="-90" />
                                      </Setter.Value>
                                  </Setter>
                                  <Setter Property="Width" Value="Auto" />
                                  <Setter Property="Height" Value="8" />
                                  <Setter TargetName="Thumb" Property="Tag" Value="Horizontal" />
                                  <Setter TargetName="PageDown" Property="Command" Value="ScrollBar.PageLeftCommand" />
                                  <Setter TargetName="PageUp" Property="Command" Value="ScrollBar.PageRightCommand" />
                              </Trigger>
                          </ControlTemplate.Triggers>
                      </ControlTemplate>
                  </Setter.Value>
              </Setter>
          </Style>
      <!--End Scrollbar Thumbs-->
      <!--Button Style-->
        <Style TargetType="Button">
          <Setter Property="Background" Value="{DynamicResource PrimaryButtonForeground}"/>
          <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor2}"/>
          <Setter Property="BorderBrush" Value="Transparent"/>
          <Setter Property="BorderThickness" Value="1"/>
          
          <Setter Property="Template">
              <Setter.Value>
                  <ControlTemplate TargetType="Button">
                      <Border CornerRadius="20" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}">
                          <ContentPresenter HorizontalAlignment="Center"
                                              VerticalAlignment="Center"/>
                          
                      </Border>
                  </ControlTemplate>
              </Setter.Value>
          </Setter>
          <Style.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                  <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                  <Setter Property="Foreground" Value="{DynamicResource PrimaryButtonHighlight}"/>
              </Trigger>
          </Style.Triggers>
        </Style>
      <!--End Button Style-->
  </Window.Resources>

  <Grid Margin="10">

      <!-- Define rows and columns for layout -->
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/> <!-- Logo -->
            <RowDefinition Height="Auto"/> <!-- Contribute Names -->
            <RowDefinition Height="Auto"/> <!-- Icons -->
        </Grid.RowDefinitions>
      <!-- Define rows and columns for layout -->

      <!-- Logo Section -->
        <Grid Grid.Row="0">
            <StackPanel Orientation="Vertical">

                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Images/logo.png" 
                Height="70" Width="Auto" HorizontalAlignment="Center" Margin="0,5,0,5"/>

                <TextBlock  Text="Made with ♥ by Emad Adel"
                    TextWrapping="Wrap" 
                    HorizontalAlignment="Center" 
                    Margin="0,5,0,5" 
                    Width="355" 
                    Padding="8" 
                    Foreground="{DynamicResource TextColorSecondaryColor2}" 
                    FontSize="14" 
                    TextAlignment="Center"/>


                <TextBlock 
                Name="ver" 
                Text="9/1/1998" 
                FontSize="14" 
                TextAlignment="Center" 
                Foreground="{DynamicResource TextColorSecondaryColor2}" />

                <!-- Description Section -->
                <TextBlock  Text="ITT created to simplify software installation and Windows tweaks, making it easier for others to use their computers. It is an open-source project, and you can contribute to make it better by adding your favorite apps and more."
                            TextWrapping="Wrap" HorizontalAlignment="Center" Margin="0,5,0,5" Width="355" Padding="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="14" TextAlignment="Center"/>




            </StackPanel>
        </Grid>
      <!-- Logo Section -->

        

      <!-- Contribute Names Section -->
        <Grid Grid.Row="1">
                  
          <StackPanel Orientation="Vertical">
      
              <!-- Contribute Names Section -->
              <TextBlock Text="Contributors"
              TextWrapping="Wrap" HorizontalAlignment="Center" Foreground="{DynamicResource TextColorSecondaryColor2}" Margin="0,5,0,5" FontSize="12" FontStyle="Italic" TextAlignment="Center"/>


              <ScrollViewer Grid.Row="2" VerticalScrollBarVisibility="Auto" Height="155">
      
                <StackPanel Margin="25">
                  <TextBlock Text=''emadadel4'' Margin=''1'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' />
<TextBlock Text=''yousefmhmd'' Margin=''1'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' />

                </StackPanel>

                </ScrollViewer>

          </StackPanel>

        </Grid>
      <!-- Contribute Names Section -->
      <!-- Social Media Icons Section -->
        <StackPanel Grid.Row="2" Orientation="Horizontal" HorizontalAlignment="Center" Margin="0,5,0,5">
            <Button Width="40" Name="github" Cursor="Hand" Height="40" Margin="5">
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/github.png"/>
            </Button>
            <Button Width="40" Name="telegram" Cursor="Hand" Height="40" Margin="5">
              <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/telegram.png"/>
          </Button>
            <Button Width="40"  Cursor="Hand" Name="yt" Height="40" Margin="5">
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/youtube.png"/>
            </Button>
            <Button Width="40" Name="blog" Cursor="Hand" Height="40" Margin="5">
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/blog.png"/>
            </Button>
            <Button Width="40" Name="coffee" Cursor="Hand" Height="40" Margin="5">
              <Image Source="https://cdn.buymeacoffee.com/assets/homepage/meta/apple-icon-120x120.png"/>
          </Button>
        </StackPanel>
      <!--  Icons Section -->

  </Grid>
</Window>

'
#===========================================================================
#endregion End WPF About Window
#===========================================================================
#===========================================================================
#region Begin WPF Event Window
#===========================================================================

function Show-Event {


    [xml]$event = $EventWindowXaml
    $EventWindowReader = (New-Object System.Xml.XmlNodeReader $event)
    $itt.event = [Windows.Markup.XamlReader]::Load($EventWindowReader)
    $itt.event.Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.CurretTheme))


    $CloseBtn = $itt.event.FindName('closebtn')

    
        $itt.event.FindName('title').text = 'CHANGELOG'.Trim()  # Set the title text
        $itt.event.FindName('date').text = '11/30/2024'.Trim()  # Set the Date text
        

    
            $itt.event.FindName('ps').add_MouseLeftButtonDown({
                    Start-Process('https://www.palestinercs.org/en/Donation')
                })
            
            
            $itt.event.FindName('ytv').add_MouseLeftButtonDown({
                    Start-Process('https://www.youtube.com/watch?v=QmO82OTsU5c')
                })
            
            
            $itt.event.FindName('shell').add_MouseLeftButtonDown({
                    Start-Process('https://github.com/emadadel4/shelltube')
                })
            
            
            $itt.event.FindName('gpu').add_MouseLeftButtonDown({
                    Start-Process('https://github.com/user-attachments/assets/9651da4b-c69b-441d-a912-fb6213de73fb')
                })
            
            

    $CloseBtn.add_MouseLeftButtonDown({
        $itt.event.Close()
    })

    $itt.event.FindName('DisablePopup').add_MouseLeftButtonDown({
        DisablePopup
        $itt.event.Close()
    })

    # Show dialog
    if($itt.PopupWindow -eq "off") {return}   
    $itt.event.ShowDialog() | Out-Null
}

function DisablePopup {
    Set-ItemProperty -Path $itt.registryPath  -Name "PopupWindow" -Value "off" -Force
}
$EventWindowXaml = '<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="Window" Title="ITT | Event" 
    WindowStartupLocation = "CenterScreen" 
    Background="Transparent"
    WindowStyle="None"
    AllowsTransparency="True"
    Height="600" Width="486"
    ShowInTaskbar = "False"
    Topmost="True"
    Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/icon.ico">

    <Window.Resources>
        <!--Scrollbar Thumbs-->
            <Style x:Key="ScrollThumbs" TargetType="{x:Type Thumb}">
                <Setter Property="Template">
                    <Setter.Value>
                        <ControlTemplate TargetType="{x:Type Thumb}">
                            <Grid x:Name="Grid">
                                <Rectangle HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Fill="Transparent" />
                                <Border x:Name="Rectangle1" CornerRadius="5" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Background="{TemplateBinding Background}" />
                            </Grid>
                            <ControlTemplate.Triggers>
                                <Trigger Property="Tag" Value="Horizontal">
                                    <Setter TargetName="Rectangle1" Property="Width" Value="Auto" />
                                    <Setter TargetName="Rectangle1" Property="Height" Value="7" />
                                </Trigger>
                            </ControlTemplate.Triggers>
                        </ControlTemplate>
                    </Setter.Value>
                </Setter>
            </Style>
            <Style x:Key="{x:Type ScrollBar}" TargetType="{x:Type ScrollBar}">
                <Setter Property="Stylus.IsFlicksEnabled" Value="false" />
                <Setter Property="Foreground" Value="{DynamicResource PrimaryButtonForeground}" />
                <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
                <Setter Property="Width" Value="8" />
                <Setter Property="Template">
                    <Setter.Value>
                        <ControlTemplate TargetType="{x:Type ScrollBar}">
                            <Grid x:Name="GridRoot" Width="8" Background="{TemplateBinding Background}">
                                <Grid.RowDefinitions>
                                    <RowDefinition Height="0.00001*" />
                                </Grid.RowDefinitions>
                                <Track x:Name="PART_Track" Grid.Row="0" IsDirectionReversed="true" Focusable="false">
                                    <Track.Thumb>
                                        <Thumb x:Name="Thumb" Background="{TemplateBinding Foreground}" Style="{DynamicResource ScrollThumbs}" />
                                    </Track.Thumb>
                                    <Track.IncreaseRepeatButton>
                                        <RepeatButton x:Name="PageUp" Command="ScrollBar.PageDownCommand" Opacity="0" Focusable="false" />
                                    </Track.IncreaseRepeatButton>
                                    <Track.DecreaseRepeatButton>
                                        <RepeatButton x:Name="PageDown" Command="ScrollBar.PageUpCommand" Opacity="0" Focusable="false" />
                                    </Track.DecreaseRepeatButton>
                                </Track>
                            </Grid>
                            <ControlTemplate.Triggers>
                                <Trigger SourceName="Thumb" Property="IsMouseOver" Value="true">
                                    <Setter Value="{DynamicResource ButtonSelectBrush}" TargetName="Thumb" Property="Background" />
                                </Trigger>
                                <Trigger SourceName="Thumb" Property="IsDragging" Value="true">
                                    <Setter Value="{DynamicResource DarkBrush}" TargetName="Thumb" Property="Background" />
                                </Trigger>
                                <Trigger Property="IsEnabled" Value="false">
                                    <Setter TargetName="Thumb" Property="Visibility" Value="Collapsed" />
                                </Trigger>
                                <Trigger Property="Orientation" Value="Horizontal">
                                    <Setter TargetName="GridRoot" Property="LayoutTransform">
                                        <Setter.Value>
                                            <RotateTransform Angle="-90" />
                                        </Setter.Value>
                                    </Setter>
                                    <Setter TargetName="PART_Track" Property="LayoutTransform">
                                        <Setter.Value>
                                            <RotateTransform Angle="-90" />
                                        </Setter.Value>
                                    </Setter>
                                    <Setter Property="Width" Value="Auto" />
                                    <Setter Property="Height" Value="8" />
                                    <Setter TargetName="Thumb" Property="Tag" Value="Horizontal" />
                                    <Setter TargetName="PageDown" Property="Command" Value="ScrollBar.PageLeftCommand" />
                                    <Setter TargetName="PageUp" Property="Command" Value="ScrollBar.PageRightCommand" />
                                </Trigger>
                            </ControlTemplate.Triggers>
                        </ControlTemplate>
                    </Setter.Value>
                </Setter>
            </Style>
        <!--End Scrollbar Thumbs-->
    </Window.Resources>

    <Window.Triggers>
        <EventTrigger RoutedEvent="Window.Loaded">
            <BeginStoryboard>
                <Storyboard>
                    <DoubleAnimation Storyboard.TargetProperty="Opacity" From="0" To="1" Duration="0:0:0.5"/>
                </Storyboard>
            </BeginStoryboard>
        </EventTrigger>
    </Window.Triggers>


    <Border Background="{DynamicResource PrimaryBackgroundColor}" BorderBrush="{DynamicResource SecondaryPrimaryBackgroundColor}" BorderThickness="4" CornerRadius="10">

    <Grid>


            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="auto"/>
            </Grid.RowDefinitions>

            <StackPanel x:Name="MainStackPanel" Height="Auto" Background="Transparent" Orientation="Vertical" Margin="20">
            
                <!-- Title -->
                    <Grid Row="0" Background="Transparent">
                                
                        <TextBlock Text="&#10006;" 
                        Name="closebtn"
                        HorizontalAlignment="Right" 
                        VerticalAlignment="Top"
                        Margin="0"
                        Cursor="Hand"
                        Foreground="red" />


                        <StackPanel Orientation="Vertical" Margin="0">

                            <TextBlock 
                            Name="title"
                            Height="Auto"
                            Width="Auto"
                            FontSize="20"
                            Text="What''s New"
                            Foreground="{DynamicResource TextColorSecondaryColor}"
                            FontWeight="SemiBold"
                            TextWrapping="Wrap"
                            VerticalAlignment="Center"
                            HorizontalAlignment="Left" />
        
                            <TextBlock
                            Name="date" 
                            Height="Auto"
                            Width="Auto"
                            Text="8/29/2024"
                            Foreground="{DynamicResource TextColorSecondaryColor2}"
                            TextWrapping="Wrap"
                            VerticalAlignment="Center"
                            HorizontalAlignment="Left" />
        
                        </StackPanel>

                    </Grid>
                <!-- End Title -->

            </StackPanel>

        <Grid Row="1" Background="Transparent" Margin="20">
            <ScrollViewer Name="ScrollViewer" VerticalScrollBarVisibility="Auto" Height="Auto">
                <StackPanel Orientation="Vertical">
                    <TextBlock Text=''Watch demo'' FontSize=''20'' Margin=''0,18,0,18'' FontWeight=''Bold'' Foreground=''{DynamicResource PrimaryButtonForeground}'' TextWrapping=''Wrap''/>
<Image x:Name=''ytv'' Source=''https://raw.githubusercontent.com/emadadel4/ITT/refs/heads/main/static/Images/thumbnail.jpg'' Cursor=''Hand'' Margin=''0,0,0,0'' Height=''Auto'' Width=''400''/>
<TextBlock Text='' • Keyboard Shortcuts:'' FontSize=''20'' Margin=''0,18,0,18'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl + F: Enter search mode. Press ESC to exit.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl + Q: Switch to the apps tab.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl + W: Switch to the Tweaks tab.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl + E: Switch to the Settings tab.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl + S: Install selected apps also apply selected tweaks.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift + S: Save items to JSON file.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift + D: Load items save file.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift + M: Mute music.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift + F: Play music.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift + P: Open Choco folder in File Explorer.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift + Q: Restore point.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift + I: ITT Shortcut.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                

                
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl + G: Closes the application.'' Margin=''15,0,0,0'' FontSize=''15'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
                
<TextBlock Text=''GPU Category:'' FontSize=''20'' Margin=''0,18,0,18'' FontWeight=''Bold'' Foreground=''{DynamicResource PrimaryButtonForeground}'' TextWrapping=''Wrap''/>
<Image x:Name=''gpu'' Source=''https://github.com/user-attachments/assets/9651da4b-c69b-441d-a912-fb6213de73fb'' Cursor=''Hand'' Margin=''0,0,0,0'' Height=''Auto'' Width=''400''/>
<TextBlock Text=''In the future, the most popular GPU drivers will be added.'' FontSize=''15'' Margin=''8''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>
<TextBlock Text=''Download any Youtube video:'' FontSize=''20'' Margin=''0,18,0,18'' FontWeight=''Bold'' Foreground=''{DynamicResource PrimaryButtonForeground}'' TextWrapping=''Wrap''/>
<Image x:Name=''shell'' Source=''https://raw.githubusercontent.com/emadadel4/ShellTube/main/demo.jpg'' Cursor=''Hand'' Margin=''0,0,0,0'' Height=''Auto'' Width=''400''/>
<TextBlock Text=''Shelltube is simple way to downnload videos and playlist from youtube just Launch it and start download your video you can Launch it from Third-party section.'' FontSize=''15'' Margin=''8''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>
<TextBlock Text=''Support Palestine - أدعم فلسطين'' FontSize=''20'' Margin=''0,18,0,18'' FontWeight=''Bold'' Foreground=''{DynamicResource PrimaryButtonForeground}'' TextWrapping=''Wrap''/>
<Image x:Name=''ps'' Source=''https://raw.githubusercontent.com/emadadel4/ITT/refs/heads/main/static/Images/ps_flag.jpg'' Cursor=''Hand'' Margin=''0,0,0,0'' Height=''Auto'' Width=''400''/>
<TextBlock Text=''Do not hesitate to use your words and talk about Palestine In this age, where voices intertwine and humanitarian issues multiply, each of us has a role to play as an influential activist. Every post can reach someone who needs to hear this truth. Every message can be a source of inspiration or awareness for another person. Do not be afraid to express your opinions, for words are the tools through which we can build awareness and spread the truth. Make your platforms a space for dialogue, and be part of this movement toward positive change. Share stories, ideas, and news—everything you provide can be a step toward achieving justice. Together, we can be the voice for those who have no voice and work toward a fairer world. Let us unite and raise our voices in support of Palestine and to revive hope in the hearts of those who need it.'' FontSize=''15'' Margin=''8''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>
<TextBlock Text=''لا تتردد في استخدام كلمتك، وشارك في الحديث عن فلسطين، فصوتك قادر على إحداث التغيير  في هذا العصر، حيث تتداخل الأصوات وتتزايد القضايا الإنسانية، يبرز دور كل واحد منا كناشط مؤثر. كل منشور يمكن أن يصل إلى شخص يحتاج إلى سماع هذه الحقيقة. كل رسالة يمكن أن تكون مصدر إلهام أو توعية لشخص آخر. لا تخف من التعبير عن آرائك، فالكلمات هي الأداة التي نستطيع من خلالها بناء الوعي ونشر الحقائق. اجعل منصاتك مساحة للحوار، وكن جزءًا من هذه الحركة نحو التغيير الإيجابي. شارك قصصًا، وأفكارًا، وأخبارًا، فكل ما تقدمه يمكن أن يكون خطوة نحو تحقيق العدالة. معًا، يمكننا أن نكون صوتًا لمن لا صوت لهم، وأن نعمل من أجل عالم أكثر عدلاً. فلنتحد ونرفع أصواتنا لنصرة فلسطين ولإحياء الأمل في قلوب من يحتاجونه.'' FontSize=''15'' Margin=''8''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>

                </StackPanel>
            </ScrollViewer>
        </Grid>

        <Grid Row="2" Background="Transparent">
                <TextBlock 
                Name="DisablePopup" 
                Foreground="{DynamicResource TextColorSecondaryColor2}"
                Text="Don''t show again"
                Background="Transparent"
                TextAlignment="Center"
                Cursor="Hand"
                Padding="15"
                Visibility="Visible"
                HorizontalAlignment="Center"
                VerticalAlignment="Center"
                />
        </Grid>
    </Grid>


    </Border>
</Window>

'
#===========================================================================
#endregion End WPF Event Window
#===========================================================================
#===========================================================================
#region Begin loadXmal
#===========================================================================
# Set the maximum number of threads for the RunspacePool to the number of threads on the machine
$maxthreads = [int]$env:NUMBER_OF_PROCESSORS

# Create a new session state for parsing variables into our runspace
$hashVars = New-object System.Management.Automation.Runspaces.SessionStateVariableEntry -ArgumentList 'itt',$itt,$Null
$InitialSessionState = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()

# Add the variable to the session state
$InitialSessionState.Variables.Add($hashVars)

$desiredFunctions = @(
'Install-App' , 
'InvokeCommand' ,
'Add-Log',
'Disable-Service',
'Uninstall-AppxPackage',
'Finish',
'Message',
'Notify',
'UpdateUI',
'Native-Downloader',
'Install-Choco',
'ExecuteCommand',
'Set-Registry',
'Uninstall-AppxPackage',
'Set-Taskbar',
'Refresh-Explorer',
'Remove-ScheduledTasks'
)

$functions = Get-ChildItem function:\ | Where-Object { $_.Name -in $desiredFunctions }
foreach ($function in $functions) {
    # Directly retrieve the function definition
    $functionDefinition = (Get-Command $function.Name).ScriptBlock.ToString()
    $functionEntry = New-Object System.Management.Automation.Runspaces.SessionStateFunctionEntry -ArgumentList $($function.Name), $functionDefinition
    $initialSessionState.Commands.Add($functionEntry)

    # debug
    #if ($Debug) { Write-Output "Added function: $($function.Name)" }
}


# Create and open the runspace pool
$itt.runspace = [runspacefactory]::CreateRunspacePool(1, $maxthreads, $InitialSessionState, $Host)
$itt.runspace.Open()

[xml]$XAML = $MainWindowXaml

# Read the XAML file
$reader = [System.Xml.XmlNodeReader] $xaml

try {
    $itt["window"] = [Windows.Markup.XamlReader]::Load($reader)
}catch{
    Write-Host $_.Exception.Message # Capture the error message
}

try {
    
    #===========================================================================
    #region Create default keys 
    #===========================================================================
    
        $appsTheme = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme"
        $fullCulture = Get-ItemPropertyValue -Path "HKCU:\Control Panel\International" -Name "LocaleName"
        $shortCulture = $fullCulture.Split('-')[0]

        # Ensure registry key exists and set defaults if necessary
        if (-not (Test-Path $itt.registryPath)) {
            New-Item -Path $itt.registryPath -Force | Out-Null
            Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
            Set-ItemProperty -Path $itt.registryPath -Name "UserTheme" -Value "none" -Force
            Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -Force
            Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value "100" -Force
            Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value "On" -Force
        }

        try {
            # Attempt to get existing registry values
            $itt.Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme" -ErrorAction Stop).Theme
            $itt.CurretTheme = (Get-ItemProperty -Path $itt.registryPath -Name "UserTheme" -ErrorAction Stop).UserTheme
            $itt.Locales = (Get-ItemProperty -Path $itt.registryPath -Name "locales" -ErrorAction Stop).locales
            $itt.Music = (Get-ItemProperty -Path $itt.registryPath -Name "Music" -ErrorAction Stop).Music
            $itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -ErrorAction Stop).PopupWindow 
        }
        catch {
            # Creating missing registry keys
            if($Debug) {Add-Log -Message "An error occurred. Creating missing registry keys..." -Level "debug"}
            New-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -PropertyType String -Force *> $Null
            New-ItemProperty -Path $itt.registryPath -Name "UserTheme" -Value "none" -PropertyType String -Force *> $Null
            New-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -PropertyType String -Force *> $Null
            New-ItemProperty -Path $itt.registryPath -Name "Music" -Value "100" -PropertyType String -Force *> $Null
            New-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value "On" -PropertyType String -Force *> $Null
        }

    #===========================================================================
    #endregion Create default keys 
    #===========================================================================

    #===========================================================================
    #region Set Language based on culture
    #===========================================================================
        
        try {
            
            switch ($itt.Locales) {

                "default" {
                    
                    switch($shortCulture)
                    {
                        "ar" { $locale = "ar" }
                        "en" { $locale = "en" }
                        "fr" { $locale = "fr" }
                        "tr" { $locale = "tr" }
                        "zh" { $locale = "zh" }
                        "ko" { $locale = "ko" }
                        "de" { $locale = "de" }
                        "ru" { $locale = "ru" }
                        "es" { $locale = "es" }
                        "ga" { $locale = "ga" }

                        default { $locale = "en" }
                    
                    }
    
                }
                "ar" { $locale = "ar" }
                "en" { $locale = "en" }
                "fr" { $locale = "fr" }
                "tr" { $locale = "tr" }
                "zh" { $locale = "zh" }
                "ko" { $locale = "ko" }
                "de" { $locale = "de" }
                "ru" { $locale = "ru" }
                "es" { $locale = "es" }
                "ga" { $locale = "ga" }
                default { $locale = "en" }
            }
            $itt["window"].DataContext = $itt.database.locales.Controls.$locale
            $itt.Language = $locale
        }
        catch {

            # fallbak to en lang
            $itt["window"].DataContext = $itt.database.locales.Controls.en
        }

    #===========================================================================
    #endregion Set Language based on culture
    #===========================================================================

    #===========================================================================
    #region Check theme settings
    #===========================================================================

        try {

            $themeResource = switch($itt.Theme)
            {
                "Light"{
                    "Light"
                }
                "Dark"{
                    "Dark"
                }
                "Custom"{
                    $itt.CurretTheme

                }
                default{

                    switch ($appsTheme) 
                    {
                        "0" { "Dark" }
                        "1" { "Light" }
                    }

                }
            }

            $itt["window"].Resources.MergedDictionaries.Add($itt["window"].FindResource($themeResource))
            $itt.CurretTheme = $themeResource
        }
        catch {
            # Fall back to default theme if there error
            $fallback = switch($appsTheme)
            {
                "0" { "Dark" }
                "1" { "Light" }
            }

            Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
            Set-ItemProperty -Path $itt.registryPath -Name "UserTheme" -Value "none" -Force
            $itt["window"].Resources.MergedDictionaries.Add($itt["window"].FindResource($fallback))
            $itt.CurretTheme = $fallback
        }

    #===========================================================================
    #endregion Check theme settings
    #===========================================================================

    #===========================================================================
    #region Get user Settings from registry
    #===========================================================================
    $itt.mediaPlayer.settings.volume = "$($itt.Music)"

    switch($itt.Music){
        "100" { $itt["window"].title = "Install Tweaks Tool #StandWithPalestine 🔊"}
        "0" {$itt["window"].title = "Install Tweaks Tool #StandWithPalestine 🔈"}
    }

    $itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow").PopupWindow
    #===========================================================================
    #endregion Get user Settings from registry
    #===========================================================================
    
    # init taskbar icon
    $itt["window"].TaskbarItemInfo = New-Object System.Windows.Shell.TaskbarItemInfo
    Set-Taskbar -progress "None" -icon "logo"
}
catch {
    Write-Host "Error: $_"
}

# List Views


$itt.CurrentList
$itt.CurrentCategory


$itt.TabControl = $itt["window"].FindName("taps")
$itt.AppsListView = $itt["window"].FindName("appslist")
$itt.TweaksListView = $itt["window"].FindName("tweakslist")
$itt.SettingsListView = $itt["window"].FindName("SettingsList")

# Buttons and Inputs
$itt.Description = $itt["window"].FindName("description")
$itt.Quotes = $itt["window"].FindName("quotes")
$itt.InstallBtn = $itt["window"].FindName("installBtn")
$itt.ApplyBtn = $itt["window"].FindName("applyBtn")
$itt.SearchInput = $itt["window"].FindName("searchInput")
$itt.SearchIcon = $itt["window"].FindName("SearchIcon")
$itt.installText = $itt["window"].FindName("installText")
$itt.installIcon = $itt["window"].FindName("installIcon")
$itt.applyText = $itt["window"].FindName("applyText")
$itt.applyIcon = $itt["window"].FindName("applyIcon")
$itt.QuoteIcon = $itt["window"].FindName("QuoteIcon")





#===========================================================================
#endregion End loadXmal
#===========================================================================
#===========================================================================
#region Begin Main
#===========================================================================
#===========================================================================
#region Select elements with a Name attribute using XPath and iterate over them
#===========================================================================
$xaml.SelectNodes("//*[@Name]") | ForEach-Object {
    $name = $_.Name
    $element = $itt["window"].FindName($name)

    if ($element) {
        $itt[$name] = $element

        # Add event handlers based on element type
        switch ($element.GetType().Name) {
            "Button" {
                $element.Add_Click({ Invoke-Button $args[0].Name })
            }
            "MenuItem" {
                $element.Add_Click({ 
                    Invoke-Button $args[0].Name -Content $args[0].Header
                })
            }

            "TextBox" {
                $element.Add_TextChanged({ Invoke-Button $args[0].Name })
                $element.Add_GotFocus({ Invoke-Button $args[0].Name })
            }
            "Ellipse" {
                $element.add_MouseLeftButtonDown({ Invoke-Button $args[0].Name })
            }
            "ComboBox" {
                $element.add_SelectionChanged({ Invoke-Button $args[0].Name })
            }
            "TabControl" {
                $element.add_SelectionChanged({ Invoke-Button $args[0].Name })
            }
            "CheckBox" {
                $element.IsChecked = Get-ToggleStatus -ToggleSwitch $name
                $element.Add_Click({ Invoke-Toogle $args[0].Name })
            }
        }
    }
}
#===========================================================================
#endregion Select elements with a Name attribute using XPath and iterate over them
#===========================================================================

# Define OnClosing event handler
$onClosingEvent = {
    param($s, $c)

    $exitDialog = $itt.database.locales.Controls.$($itt.Language).Exit_msg

    # Show confirmation message box
    $result = [System.Windows.MessageBox]::Show($exitDialog, "Confirmation", [System.Windows.MessageBoxButton]::YesNo, [System.Windows.MessageBoxImage]::Question)

    # Check user's choice
    if ($result -eq [System.Windows.MessageBoxResult]::Yes) {
        StopAllRunspace
    } else {
        $c.Cancel = $true
    }
}

# Handle the Loaded event
$itt["window"].Add_ContentRendered({
    Startup
    Show-Event
})

$itt.SearchInput.Add_TextChanged({
    if (![string]::IsNullOrEmpty($itt.SearchInput.Text)) {
        $itt.SearchIcon.Text = "" 
    }else{
        $itt.SearchIcon.Text = ""
    }
})

# Close Event handler
$itt["window"].add_Closing($onClosingEvent)

# Keyboard shortcut
$itt["window"].Add_PreViewKeyDown($KeyEvents)

# Show Window
$itt["window"].ShowDialog() | Out-Null

$script:powershell.Dispose()        
$itt.runspace.Dispose()             
$itt.runspace.Close()          
[System.GC]::Collect()    
$script:powershell.Stop()          
$newProcess.exit 
Stop-Transcript
#===========================================================================
#endregion End Main
#===========================================================================
