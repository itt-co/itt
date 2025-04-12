function Install-ITTAChoco {

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
    else
    {
        try {
            # Check for updates
            $currentVersion = (itt.exe -ver)
            $installerPath = "$env:TEMP\installer.msi"
            $latestReleaseApi = "https://api.github.com/repos/itt-co/bin/releases/latest"
            $latestVersion = (Invoke-RestMethod -Uri $latestReleaseApi).tag_name
            if ($latestVersion -eq $currentVersion) {return}
            # Write-Host "New version available: $latestVersion. Updating..."
            Invoke-WebRequest "https://github.com/itt-co/bin/releases/latest/download/installer.msi" -OutFile $installerPath
            Start-Process msiexec.exe -ArgumentList "/i `"$installerPath`" /q" -NoNewWindow -Wait
            Write-Host "Updated to version $latestVersion successfully."
            # Remove-Item -Path $installerPath -Force
        }
        catch {
            Add-Log -Message "$_" -Level "error"
        }
    }
}