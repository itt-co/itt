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
