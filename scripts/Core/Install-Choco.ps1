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
