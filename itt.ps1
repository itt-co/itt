
################################################################################################################
###                                                                                                          ###
###  This file is automatically generated DO NOT modify this file                                            ###
###                                                                                                          ###
################################################################################################################


#Start-Transcript $ENV:TEMP\itt.log -Append

<#
.Dev
    Author         : Emad Adel @emadadel4
    GitHub         : https://github.com/emadadel4
    Website        : https://eprojects.orgfree.com/
    Version        : #{replaceme}
#>

if (!(Test-Path -Path $ENV:TEMP)) {
    New-Item -ItemType Directory -Force -Path $ENV:TEMP
}


# Load DLLs
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

# Variable to sync between runspaces
$sync = [Hashtable]::Synchronized(@{})
$sync.PSScriptRoot = $PSScriptRoot
$sync.version = "24.04.01"
$sync.github = "https://github.com/emadadel4"
$sync.website = "https://eprojects.orgfree.com"
$sync.author = "Emad Adel @emadadel4"

$sync.configs = @{}
$sync.ProcessRunning = $false

# $currentPid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
# $principal = new-object System.Security.Principal.WindowsPrincipal($currentPid)
# $adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator


# if ($principal.IsInRole($adminRole))
# {
#     $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Admin)"
#     clear-host
# }
# else
# {
#     $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
#     $newProcess.Arguments = $myInvocation.MyCommand.Definition;
#     $newProcess.Verb = "runas";
#     [System.Diagnostics.Process]::Start($newProcess);
#     break
# }

function about{

    $authorInfo = @"
        Author   : $($sync.author)
        GitHub   : $($sync.github)
        Website  : $($sync.website)
        Version  : $($sync.version)
"@

    Show-CustomDialog -Message $authorInfo -Width 400
}

#===========================================================================
# function
#===========================================================================
function Install()
{
    $Link = "https://ninite.com/"

    foreach ($item in $sync.list.Items)
    {
        if ($item.IsChecked)
        {
            $result = $item

            foreach ($data in $sync.configs.applications)
            {
                if($item.Content -eq $data.name)
                {
                    $Link = $Link + $data.ninite + "-"
                    Write-Host $data.name
                    $Link = $Link + $data.url + "-"
                }
            }
        }
        
    }

    if($result)
    {
        $Link = $Link + "/ninite.exe"
        $Destination = "$env:temp/Install.exe"
        
        if (Test-Path $Destination)
        {
            Remove-Item -Verbose -Force $Destination
        }

        Write-Host "Ninite Link: $($Link)"
        $discription.Text = "Starting Download"
        Invoke-WebRequest $Link -OutFile $Destination
        Start-Process -Filepath $Destination
        $discription.Text = "Installing..."

    }
    else
    {
        [System.Windows.MessageBox]::Show("Please select the program(s) to install", "ITT", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
    }
}

function ApplyTweaks() {

    foreach ($item in $sync.tweaks.Items)
    {
        if ($item.IsChecked)
        {
            $result = $item

            foreach ($data in $sync.configs.tweaks)
            {
                if($item.Content -eq $data.name)
                {
                    if($data.fromUrl -eq "true")
                    {
                        $url = $data.script
                    }
                    else
                    {
                        $script = $data.script
                    }
                }
            }
        }
        
    }

    if($result)
    {
        Invoke-RestMethod $url | Invoke-Expression 
        powershell.exe -Command  $script
        
    }
    else
    {
        [System.Windows.MessageBox]::Show("Please select the Tweeak(s) to apply", "ITT", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
    }
}
function PlayMusic
{
    $MediaPlayer = [Windows.Media.Playback.MediaPlayer, Windows.Media, ContentType = WindowsRuntime]::New()
    $MediaPlayer.IsLoopingEnabled = $true
    $MediaPlayer.Volume = 0.6
    $ost = 'https://vgmsite.com/soundtracks/assassins-creed-ezios-family-m-me-remix-2022/qdxeshajdz/01.%20Ezio%27s%20Family%20%28M%C3%B8me%20Remix%29.mp3'
    $MediaPlayer.Source = [Windows.Media.Core.MediaSource]::CreateFromUri($ost)
    $MediaPlayer.Play()   
}
function Show-CustomDialog {
    
    param(
        [string]$Message,
        [int]$Width = 300,
        [int]$Height = 200
    )

    Add-Type -AssemblyName PresentationFramework

    # Define theme colors
    $foregroundColor = [Windows.Media.Brushes]::White
    $backgroundColor = [Windows.Media.Brushes]::Black
    $font = New-Object Windows.Media.FontFamily("Consolas")
    $borderColor = [Windows.Media.Brushes]::Green
    $buttonBackgroundColor = [Windows.Media.Brushes]::Black
    $buttonForegroundColor = [Windows.Media.Brushes]::White
    $shadowColor = [Windows.Media.ColorConverter]::ConvertFromString("#AAAAAAAA")

    # Create a custom dialog window
    $dialog = New-Object Windows.Window
    $dialog.Title = "About"
    $dialog.Height = $Height
    $dialog.Width = $Width
    $dialog.Margin = New-Object Windows.Thickness(10)  # Add margin to the entire dialog box
    $dialog.WindowStyle = [Windows.WindowStyle]::None  # Remove title bar and window controls
    $dialog.ResizeMode = [Windows.ResizeMode]::NoResize  # Disable resizing
    $dialog.WindowStartupLocation = [Windows.WindowStartupLocation]::CenterScreen  # Center the window
    $dialog.Foreground = $foregroundColor
    $dialog.Background = $backgroundColor
    $dialog.FontFamily = $font

    # Create a Border for the green edge with rounded corners
    $border = New-Object Windows.Controls.Border
    $border.BorderBrush = $borderColor
    $border.BorderThickness = New-Object Windows.Thickness(1)  # Adjust border thickness as needed
    $border.CornerRadius = New-Object Windows.CornerRadius(10)  # Adjust the radius for rounded corners

    # Create a drop shadow effect
    $dropShadow = New-Object Windows.Media.Effects.DropShadowEffect
    $dropShadow.Color = $shadowColor
    $dropShadow.Direction = 270
    $dropShadow.ShadowDepth = 5
    $dropShadow.BlurRadius = 10

    # Apply drop shadow effect to the border
    $dialog.Effect = $dropShadow

    $dialog.Content = $border

    # Create a grid for layout inside the Border
    $grid = New-Object Windows.Controls.Grid
    $border.Child = $grid

    # Add the following line to show gridlines
    #$grid.ShowGridLines = $true

    # Add the following line to set the background color of the grid
    $grid.Background = [Windows.Media.Brushes]::Transparent
    # Add the following line to make the Grid stretch
    $grid.HorizontalAlignment = [Windows.HorizontalAlignment]::Stretch
    $grid.VerticalAlignment = [Windows.VerticalAlignment]::Stretch

    # Add the following line to make the Border stretch
    $border.HorizontalAlignment = [Windows.HorizontalAlignment]::Stretch
    $border.VerticalAlignment = [Windows.VerticalAlignment]::Stretch


    # Set up Row Definitions
    $row0 = New-Object Windows.Controls.RowDefinition
    $row0.Height = [Windows.GridLength]::Auto

    $row1 = New-Object Windows.Controls.RowDefinition
    $row1.Height = [Windows.GridLength]::new(1, [Windows.GridUnitType]::Star)

    $row2 = New-Object Windows.Controls.RowDefinition
    $row2.Height = [Windows.GridLength]::Auto

    # Add Row Definitions to Grid
    $grid.RowDefinitions.Add($row0)
    $grid.RowDefinitions.Add($row1)
    $grid.RowDefinitions.Add($row2)
        
    # Add StackPanel for horizontal layout with margins
    $stackPanel = New-Object Windows.Controls.StackPanel
    $stackPanel.Margin = New-Object Windows.Thickness(10)  # Add margins around the stack panel
    $stackPanel.Orientation = [Windows.Controls.Orientation]::Horizontal
    $stackPanel.HorizontalAlignment = [Windows.HorizontalAlignment]::Left  # Align to the left
    $stackPanel.VerticalAlignment = [Windows.VerticalAlignment]::Top  # Align to the top

    $grid.Children.Add($stackPanel)
    [Windows.Controls.Grid]::SetRow($stackPanel, 0)  # Set the row to the second row (0-based index)

    $viewbox = New-Object Windows.Controls.Viewbox
    $viewbox.Width = 25
    $viewbox.Height = 25
    

    # Add "Winutil" text
    $IttTextBlock = New-Object Windows.Controls.TextBlock
    $IttTextBlock.Text = "ITT"
    $IttTextBlock.FontSize = 18  # Adjust font size as needed
    $IttTextBlock.Foreground = $foregroundColor
    $IttTextBlock.Margin = New-Object Windows.Thickness(10, 5, 10, 5)  # Add margins around the text block
    $stackPanel.Children.Add($IttTextBlock)

    # Add TextBlock for information with text wrapping and margins
    $messageTextBlock = New-Object Windows.Controls.TextBlock
    $messageTextBlock.Text = $Message
    $messageTextBlock.TextWrapping = [Windows.TextWrapping]::Wrap  # Enable text wrapping
    $messageTextBlock.HorizontalAlignment = [Windows.HorizontalAlignment]::Left
    $messageTextBlock.VerticalAlignment = [Windows.VerticalAlignment]::Top
    $messageTextBlock.Margin = New-Object Windows.Thickness(10)  # Add margins around the text block
    $grid.Children.Add($messageTextBlock)
    [Windows.Controls.Grid]::SetRow($messageTextBlock, 1)  # Set the row to the second row (0-based index)

    # Add OK button
    $okButton = New-Object Windows.Controls.Button
    $okButton.Content = "OK"
    $okButton.Width = 80
    $okButton.Height = 30
    $okButton.HorizontalAlignment = [Windows.HorizontalAlignment]::Center
    $okButton.VerticalAlignment = [Windows.VerticalAlignment]::Bottom
    $okButton.Margin = New-Object Windows.Thickness(0, 0, 0, 10)
    $okButton.Background = $buttonBackgroundColor
    $okButton.Foreground = $buttonForegroundColor
    $okButton.BorderBrush = $borderColor
    $okButton.Add_Click({
        $dialog.Close()
    })
    $grid.Children.Add($okButton)
    [Windows.Controls.Grid]::SetRow($okButton, 2)  # Set the row to the third row (0-based index)

    # Handle Escape key press to close the dialog
    $dialog.Add_KeyDown({
        if ($_.Key -eq 'Escape') {
            $dialog.Close()
        }
    })

    # Set the OK button as the default button (activated on Enter)
    $okButton.IsDefault = $true

    # Show the custom dialog
    $dialog.ShowDialog()
}
#===========================================================================
# End Function
#===========================================================================
function ChangeTap() {
    
    if($window.FindName('apps').IsSelected)
    {
        $window.FindName('installBtn').Visibility = "Visible"
        $window.FindName('applyBtn').Visibility = "Hidden"
    }

    if($window.FindName('tweeks').IsSelected)
    {
        $window.FindName('applyBtn').Visibility = "Visible"
        $window.FindName('installBtn').Visibility = "Hidden"
    }
}
$sync.configs.applications = '[
  {
    "name": "Chrome",
    "description": "Chrome is a fast, simple, and secure web browser, built for the modern web.",
    "url": "chrome",
    "ninite": "chrome",
    "check": "false",
    "website": "https://www.google.com/chrome",
    "category": "Web Browsers"
  },
  {
    "name": "Firefox",
    "description": "Mozilla Firefox, or simply Firefox, is a free and open-source web browser developed by the Mozilla Foundation.",
    "url": "firefox",
    "ninite": "firefox",
    "check": "true",
    "website": "https://www.mozilla.org/en-US/firefox/new/",
    "category": "Web Browsers"
  },
  {
    "name": "Edge",
    "description": "Microsoft Edge is Chromium based and is a faster, more secure, and more modern browsing experience than Internet Explorer and Microsoft Edge Legacy. For more information, see Microsoft Edge features for work. Additionally, Microsoft Edge will soon be the only Microsoft browser that supports Microsoft 365 web apps and services.",
    "url": "edge",
    "ninite": "edge",
    "check": "false",
    "website": "https://www.microsoft.com/edge",
    "category": "Web Browsers"
  },
  {
    "name": "7zip",
    "description": "7-Zip is a free and open-source file archiver1234. It is a utility used to place groups of files within compressed containers known as archives",
    "url": "7zip",
    "ninite": "7zip",
    "check": "false",
    "website": "https://7-zip.org/",
    "category": "Compression"
  },
  {
    "name": "WinRAR",
    "description": "WinRAR is a powerful compression, archiving and archive managing software tool1234. It can create and view archives in RAR or ZIP file formats, and unpack numerous archive file formats",
    "url": "winrar",
    "ninite": "winrar",
    "check": "true",
    "website": "https://www.rarlab.com",
    "category": "Compression"
  },
  {
    "name": "VLC",
    "description": "VLC media player is a free and open-source, portable, cross-platform media player software and streaming media server",
    "url": "vlc",
    "ninite": "vlc",
    "check": "false",
    "website": "https://www.videolan.org/vlc/",
    "category": "Media"
  },
  {
    "name": "K-Lite Codecs",
    "description": "K-Lite Codec Pack Audio and video codec packThe K-Lite Codec Pack is a collection of audio and video codecs for Microsoft Windows DirectShow that enables an operating system and its software to play various audio and video formats",
    "url": "klitecodecs",
    "ninite": "klitecodecs",
    "check": "true",
    "website": "https://www.codecguide.com/download_kl.htm",
    "category": "Media"
  },
  {
    "name": "Audacity",
    "description": "Audacity is free and open-source digital audio editor and recording application software, available for Windows, macOS, Linux, and other Unix-like operating systems",
    "url": "audacity",
    "ninite": "audacity",
    "check": "false",
    "website": "#",
    "category": "Media"
  },
  {
    "name": "Foxit Reader",
    "description": "Foxit PDF Reader, formerly known as Foxit Reader, is a multilingual freemium PDF tool that can create, view, edit, digitally sign, and print PDF files",
    "url": "foxit",
    "ninite": "foxit",
    "check": "false",
    "website": "https://www.foxit.com/",
    "category": "Documents"
  },
  {
    "name": "LibreOffice",
    "description": "LibreOffice is a free and open-source office productivity software suite12345. It is a project of The Document Foundation, and was forked in 2010 from OpenOffice.org, an open-sourced version of the earlier StarOffice",
    "url": "libreoffice",
    "ninite": "libreoffice",
    "check": "false",
    "website": "https://www.libreoffice.org/",
    "category": "Documents"
  },
  {
    "name": "SumatraPDF",
    "description": "Sumatra PDF is a free and open-source document viewer that supports many document formats including: Portable Document Format (PDF), Microsoft Compiled HTML Help, DjVu, EPUB, FictionBook, MOBI, PRC etc",
    "url": "sumatrapdf",
    "ninite": "sumatrapdf",
    "check": "true",
    "website": "https://duckduckgo.com/?q=vlc",
    "category": "Documents"
  },
  {
    "name": "Malwarebytes",
    "description": "Malwarebytes is anti-malware software for Microsoft Windows, macOS, ChromeOS, Android, and iOS that finds and removes malware. Made by Malwarebytes Corporation, it was first released in January 2006",
    "url": "malwarebytes",
    "ninite": "malwarebytes",
    "check": "false",
    "website": "none",
    "category": "Security"
  },
  {
    "id": "8",
    "name": "Avast Antivirus",
    "description": "Avast Antivirus is a family of cross-platform internet security applications developed by Avast for Microsoft Windows, macOS, Android, and iOS. Avast offers free and paid products that provide computer security",
    "url": "avast",
    "ninite": "avast",
    "check": "false",
    "website": "none",
    "category": "Security"
  },
  {
    "id": "8",
    "name": "KeePass 2",
    "description": "KeePass Password Safe is a free and open-source password manager primarily for Windows. It officially supports macOS and Linux operating systems.",
    "url": "keepass2",
    "ninite": "keepass2",
    "check": "false",
    "website": "none",
    "category": "Other"
  },
  {
    "id": "8",
    "name": "ImgBurn",
    "description": "mgBurn???easily the most impressive free/donationware burning software I???ve run across. The program handles a host of image types including ISO, NRG, PDI, UDI, BIN/CUE, and CDI???obviating the need to buy several different imaging programs???and will also create data CDs, DVDs, and get this: Blu-ray data discs.",
    "url": "imgburn",
    "ninite": "imgburn",
    "check": "false",
    "website": "none",
    "category": "Utilities"
  },
  {
    "name": "Nodepad++",
    "description": "Notepad++ is a text editor and source code editor for use under Microsoft Windows. It supports around 80 programming languages with syntax highlighting and code folding. It allows working with multiple open files in a single window, thanks to its tabbed editing interface.",
    "url": "notepadplusplus",
    "ninite": "notepadplusplus",
    "check": "false",
    "website": "none",
    "category": "Developer Tools"
  },
  {
    "name": "Revo uninstaller",
    "description": "Revo Uninstaller is an uninstaller for Microsoft Windows. It uninstalls programs and additionally removes any files and Windows registry entries left behind by the program''s uninstaller or by the Windows uninstall function.",
    "url": "Revo",
    "ninite": "Revo",
    "check": "false",
    "website": "none",
    "category": "Utilities"
  },
  {
    "name": "CCleaner",
    "description": "CCleaner is a utility used to clean potentially unwanted files and invalid Windows Registry entries from a computer1. It was originally developed by Piriform and has been around since 200412. It started out as an optimization tool for PCs, but its developers rolled out iterations for macOS and Android in 2012 and 2014, respectivel",
    "url": "ccleaner",
    "ninite": "ccleaner",
    "check": "false",
    "website": "none",
    "category": "Utilities"
  },
  {
    "name": "GIMP",
    "description": "Free graphics editor GNU Image Manipulation Program, commonly known by its acronym GIMP, is a free and open-source raster graphics editor used for image manipulation and image editing, free-form drawing, transcoding betwe",
    "url": "gimp",
    "ninite": "gimp",
    "check": "false",
    "website": "none",
    "category": "Imaging"
  },
  {
    "name": "FastStone Image Viewer",
    "description": "FastStone Image Viewer is an image viewer and organizer software for Microsoft Windows, provided free of charge for personal and educational use. The program also includes basic image editing tools, like cropping, color adjustment and red-eye removal.",
    "url": "faststone",
    "ninite": "faststone",
    "check": "false",
    "website": "none",
    "category": "Imaging"
  },
  {
    "name": "Visual Studio Code",
    "description": "Visual Studio Code, also commonly referred to as VS Code, is a source-code editor developed by Microsoft for Windows, Linux and macOS. Features include support for debugging, syntax highlighting",
    "url": "vscode",
    "ninite": "vscode",
    "check": "false",
    "website": "none",
    "category": "app"
  },
  {
    "name": "Blender",
    "description": "Blender is a free and open-source 3D computer graphics software tool set used for creating animated films, visual effects, art, 3D-printed models, motion graphics, interactive 3D applications, virtual reality, and, formerly, video games.",
    "url": "#",
    "ninite": "blender",
    "check": "false",
    "website": "none",
    "category": "Imaging"
  },
  {
    "id": "8",
    "name": "qBittorrent",
    "description": "Cross-platform BitTorrent client",
    "url": "qbittorrent",
    "ninite": "qbittorrent",
    "check": "true",
    "website": "none",
    "category": "File Sharing"
  },
  {
    "id": "8",
    "name": "Discord",
    "description": "Discord is a versatile communication platform that has evolved beyond its gaming origins. Initially designed for gamers, it now serves as a hub for various communities. Here are some key points about Discord",
    "url": "discord",
    "ninite": "discord",
    "check": "false",
    "website": "none",
    "category": "Messaging"
  },
  {
    "id": "8",
    "name": "Steam",
    "description": "Steam Video game store and digital distribution platform among other services",
    "url": "steam",
    "ninite": "steam",
    "check": "false",
    "website": "none",
    "category": "Messaging"
  },
  {
    "name": "Zoom",
    "description": "Zoom Video Communications",
    "url": "zoom",
    "ninite": "zoom",
    "check": "false",
    "website": "none",
    "category": "Messaging"
  }
]' | convertfrom-json
  
$sync.configs.tweaks = '[
  {
    "name": "Fix stutter in games",
    "description": "Fix Stutter in Games (Disable GameBarPresenceWriter). Windows 10/11",
    "website": "https://github.com/emadadel4/Fix-Stutter-in-Games",
    "script": "https://raw.githubusercontent.com/emadadel4/Fix-Stutter-in-Games/main/fix.ps1",
    "fromUrl": "true",
    "check": "true",
    "category": "tweak"
  },
  {
    "name": "Disk Cleanup",
    "description": "Clean temporary files that are not necessary",
    "website": "#",
    "script": "cleanmgr.exe /d C: /VERYLOWDISK Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase",
    "fromUrl": "false",
    "check": "true",
    "category": "tweak"
  }
]' | convertfrom-json
  
$inputXML =  '
<!--Window-->
    <Window
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        x:Name="Window" Title="ITT @emadadel4" WindowStartupLocation = "CenterScreen" 
        Background="White"
        Height="450" MinHeight="450" MinWidth="800" Width="800"  ShowInTaskbar = "True" Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/icon.ico">

    
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
                <Setter Property="Foreground" Value="#8C8C8C" />
                <Setter Property="Background" Value="Transparent" />
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

            <Style TargetType="Window" x:Key="MyBorderStyle">
                <Setter Property="Background" Value="Wheat"/>
            </Style>

            <!--Button Style-->
                <Style TargetType="Button">
                    <Setter Property="Background" Value="Black"/>
                    <Setter Property="Foreground" Value="White"/>

                    <Setter Property="Template">
                        <Setter.Value>
                            <ControlTemplate TargetType="Button">
                                <Border Background="{TemplateBinding Background}">
                                    <ContentPresenter HorizontalAlignment="Center"
                                                    VerticalAlignment="Center"/>
                                    
                                </Border>
                            </ControlTemplate>
                        </Setter.Value>
                    </Setter>

                    <Style.Triggers>
                        <Trigger Property="IsMouseOver" Value="True">
                            <Setter Property="Background" Value="#2F58CD"/>
                        </Trigger>
                    </Style.Triggers>


                </Style>
            <!--End Button Style-->

        </Window.Resources>

    <Grid>

        <Grid.RowDefinitions>
            <RowDefinition Height="*"/>
            <RowDefinition Height="auto"/>
        </Grid.RowDefinitions>

        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="*"/>
            <ColumnDefinition Width="222"/>
        </Grid.ColumnDefinitions>

         <!--TabControl-->
 <TabControl x:Name="taps" TabStripPlacement="Left" Margin="0, 10, 0, 10" Grid.Row="0" BorderBrush="WhiteSmoke" Foreground="White" Background="WhiteSmoke">
     <TabControl.Resources>


         <Style TargetType="TabItem">
             <Setter Property="Template">
                 <Setter.Value>
                     <ControlTemplate TargetType="TabItem">
                         <Border Name="Border" BorderThickness="0,0,0,0" Padding="5" BorderBrush="Gainsboro"  Margin="10,5">
                             <ContentPresenter x:Name="ContentSite"
                             VerticalAlignment="Center"
                             HorizontalAlignment="Center"
                             ContentSource="Header"
                             Margin="10,2"/>
                         </Border>
                         <ControlTemplate.Triggers>
                             <Trigger Property="IsSelected" Value="True">
                                 <Setter TargetName="Border" Property="Background" Value="Black" />
                                 <Setter Property="Foreground" Value="White" />

                             </Trigger>
                             <Trigger Property="IsSelected" Value="False">
                                 <Setter TargetName="Border" Property="Background" Value="WhiteSmoke" />
                                 <Setter Property="Foreground" Value="Black" />
                             </Trigger>
                         </ControlTemplate.Triggers>
                     </ControlTemplate>
                 </Setter.Value>
             </Setter>
         </Style>
     </TabControl.Resources>
     <TabItem Header="Install" Name="apps" BorderBrush="{x:Null}" Padding="16">
         <TabItem.Content>
             <ListView Margin="10" ScrollViewer.VerticalScrollBarVisibility="Auto" x:Name="list" BorderBrush="{x:Null}" Background="{x:Null}">
             </ListView>
         </TabItem.Content>
     </TabItem>
     <TabItem Header="Tweeks" x:Name="tweeks" Padding="16" BorderBrush="{x:Null}" Background="{x:Null}">
         <TabItem.Content>
             <ListView Name="tweaks"  Margin="10" ScrollViewer.VerticalScrollBarVisibility="Auto" BorderBrush="{x:Null}" Background="{x:Null}">
             </ListView>
         </TabItem.Content>
     </TabItem>
 </TabControl>
 <!--End TabControl-->


        <!--Main Section-->
            <Grid  Grid.Row="0" Grid.Column="1"   Background="WhiteSmoke" Margin="10">
                <StackPanel Margin="15" Orientation="Vertical">
                    <TextBlock Name="description" Text="Description" TextWrapping="Wrap" Foreground="Black"/>
                    <TextBlock Name="itemLink" Visibility="Hidden"  Text="Offical website" Cursor="Hand"  Margin="5" Foreground="blue"/>
                </StackPanel>

                <!--Install Button-->
                <Button
                                Name="installBtn"
                                Content="Install"
                                HorizontalAlignment="Center"
                                VerticalAlignment="Bottom"
                                Cursor="Hand"
                                Width="90" Height="44" Margin="16" Padding="10"
                            />
                <!--End Install Button-->

                <!--Apply Button-->
                <Button
                            Name="applyBtn"
                            Content="Apply"
                            HorizontalAlignment="Center"
                            VerticalAlignment="Bottom"
                            Cursor="Hand"
                            Visibility="Hidden"
                            Width="90" Height="44" Margin="16" Padding="10"/>
                <!--End Apply Button-->

            </Grid>
        <!--End Main Section-->

        <!--Footer-->
            <Grid Grid.Row="1" Grid.ColumnSpan="2">
                <TextBlock Cursor="Pen" x:Name="quotes"  HorizontalAlignment="Left" VerticalAlignment="Center" Padding="16" TextWrapping="Wrap" Text="Whoami?!" Foreground="Black"/>
            </Grid>
        <!--End Footer-->

        <!--About label-->
            <Label
                    Name="about"
                    Content="/Dev"
                    HorizontalAlignment="Left"
                    VerticalAlignment="Bottom"
                    BorderBrush="{x:Null}"
                    Background="{x:Null}"
                    Foreground="Bisque"
                    Margin="15"
                    Cursor="Hand"
                    Width="auto" Height="auto"/>
        <!--End About label-->

    </Grid>

        
    </Window>
<!--End Window-->

'
#===========================================================================
# Load XMAL 
#===========================================================================

#region Load XMAL
# Set the maximum number of threads for the RunspacePool to the number of threads on the machine
$maxthreads = [int]$env:NUMBER_OF_PROCESSORS

# Create a new session state for parsing variables into our runspace
$hashVars = New-object System.Management.Automation.Runspaces.SessionStateVariableEntry -ArgumentList 'sync',$sync,$Null
$InitialSessionState = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()

# Add the variable to the session state
$InitialSessionState.Variables.Add($hashVars)

# Create the runspace pool
$sync.runspace = [runspacefactory]::CreateRunspacePool(
    1,                      # Minimum thread count
    $maxthreads,            # Maximum thread count
    $InitialSessionState,   # Initial session state
    $Host                   # Machine to create runspaces on
)

# Open the RunspacePool instance
$sync.runspace.Open()

[xml]$XAML = $inputXML

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Read the XAML file
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
try
{ 
    $window = [Windows.Markup.XamlReader]::Load($reader)
}
catch [System.Management.Automation.MethodInvocationException] {
   
    Write-Host "error"
}
#endregion
#===========================================================================
# End Load XMAL 
#===========================================================================


#===========================================================================
# Loops 
#===========================================================================

#region Generate items from json file
$sync.list = $Window.FindName("list")
foreach ($item in $sync.configs.applications)
{
    $checkbox = New-Object System.Windows.Controls.CheckBox
    $sync.list.Items.Add($checkbox)
    $checkbox.Content = $item.name

}

# Get Discription of selected item in $list
$discription = $Window.FindName("description")
$itemLink = $Window.FindName('itemLink')
$sync.list.Add_SelectionChanged({
		
    $itemLink.Visibility = "Visible"

    foreach($data in $sync.configs.applications)
    {
        if($sync.list.SelectedItem.Content -eq $data.name)
        {
            $discription.Text = $data.description

        }
    }
})
#endregion

#region Get Selected item Website link from json file
$itemLink.add_MouseLeftButtonDown({

    foreach ($item in $sync.list.SelectedItem.Content)
    {
        foreach ($data in $sync.configs.applications)
        {
            if($item -eq $data.name)
            {
                Start-Process ("https://duckduckgo.com/?hps=1&q=%5C" + $data.name)
            }
        }
    }

})
#endregion
#region Generate tweaks from json file
$sync.tweaks = $Window.FindName("tweaks")
foreach ($item in $sync.configs.tweaks)
{
    $checkbox = New-Object System.Windows.Controls.CheckBox
    $sync.tweaks.Items.Add($checkbox)
    $checkbox.Content = $item.name

}

# Get Discription of selected tweaks in $list
$sync.tweaks.Add_SelectionChanged({
		
    foreach($data in $sync.configs.tweaks)
    {
        if($sync.tweaks.SelectedItem.Content -eq $data.name)
        {
            $discription.Text = $data.description

        }
    }
})

#endregion

Clear-Host

#===========================================================================
# End Loops 
#===========================================================================

$window.FindName('installBtn').add_click({Install})
$window.FindName('applyBtn').add_click({ApplyTweaks})
$window.FindName('about').add_MouseLeftButtonDown({about})

$window.FindName('taps').add_SelectionChanged({ChangeTap})


$sync = $window.ShowDialog() | out-null
#Stop-Transcript

