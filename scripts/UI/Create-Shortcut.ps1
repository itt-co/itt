function ITTShortcut {

    <#
        .SYNOPSIS
        Creates a desktop shortcut.
    #>

    # URL of the icon file
    # Determine the path in AppData\Roaming
    $appDataPath = "$env:ProgramData/itt"
    $localIconPath = Join-Path -Path $appDataPath -ChildPath "icon.ico"
    # Download the icon file
    Invoke-WebRequest -Uri $itt.icon -OutFile $localIconPath
    # Create a shortcut object
    $Shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\ITT Emad Adel.lnk")
    # Set the target path to PowerShell with your command
    $Shortcut.TargetPath = "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe"
    $Shortcut.Arguments = "-ExecutionPolicy Bypass -NoProfile -Command ""irm raw.githubusercontent.com/emadadel4/ITT/main/itt.ps1 | iex"""
    # Set the icon path to the downloaded icon file in AppData\Roaming
    $Shortcut.IconLocation = "$localIconPath"
    # Save the shortcut
    $Shortcut.Save()
}