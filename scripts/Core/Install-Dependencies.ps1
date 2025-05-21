function Install-Dependencies {

    param ([string]$PKGMan)

    switch ($PKGMan)
    {
        "itt" {

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
        "choco" { 

            if (-not (Get-Command choco -ErrorAction SilentlyContinue))
            {
                Add-Log -Message "Installing dependencies... This might take few seconds" -Level "INFO"
                Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) *> $null
            }
        }
        "winget" { 

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
        "scoop" {

            if (-not (Get-Command scoop -ErrorAction SilentlyContinue))
            {
                Add-Log -Message "Installing scoop... This might take few seconds" -Level "info"
                Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
                Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
                scoop bucket add extras
            }
        }
    }
}