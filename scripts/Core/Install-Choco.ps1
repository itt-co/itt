function Install-Choco {

    # Installing Choco package manager if not exist
    if (-not (Get-Command choco -ErrorAction SilentlyContinue))
    {
        Add-Log -Message "Checking dependencies This won't take a minute..." -Level "INFO"
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) *> $null
    }

    # Installing ITT Package manager if not exist
    if (-not (Get-Command itt -ErrorAction SilentlyContinue))
    {
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/itt-co/bin/refs/heads/main/install.ps1')) *> $null
    }
}