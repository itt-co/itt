function Install-Winget {

    <#
        .SYNOPSIS
        Installs Winget on Windows systems that support it.

        .DESCRIPTION
        This function checks if Winget is installed on the system. If not, it verifies the system's architecture and Windows version to ensure compatibility. It 
        then downloads and installs the necessary dependencies and Winget itself.
    #>

    if(Get-Command winget -ErrorAction SilentlyContinue) {return}
    $ComputerInfo = Get-ComputerInfo -ErrorAction Stop
    $arch = [int](($ComputerInfo).OsArchitecture -replace '\D', '')

    if ($ComputerInfo.WindowsVersion -lt "1809") {
        Add-Log -Message "Winget is not supported on this version of Windows Upgrade to 1809 or newer." -Level "info" 
        return
    }

    $VCLibs = "https://aka.ms/Microsoft.VCLibs.x$arch.14.00.Desktop.appx"
    $UIXaml = "https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x$arch.appx"
    $WingetLatset = "https://aka.ms/getwinget"

    try {
        
        Add-Log -Message "Installing Winget... This might take several minutes" -Level "info"
        Start-BitsTransfer -Source $VCLibs -Destination "$env:TEMP\Microsoft.VCLibs.Desktop.appx"
        Start-BitsTransfer -Source $UIXaml -Destination "$env:TEMP\Microsoft.UI.Xaml.appx"
        Start-BitsTransfer -Source $WingetLatset -Destination "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

        Add-AppxPackage "$env:TEMP\Microsoft.VCLibs.Desktop.appx"
        Add-AppxPackage "$env:TEMP\Microsoft.UI.Xaml.appx"
        Add-AppxPackage "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
        Start-Sleep -Seconds 1
        Add-Log -Message "Successfully installed Winget. Continuing to install selected apps..." -Level "info"
        return
    }
    catch {
        Write-Error "Failed to install $_"
    }
}