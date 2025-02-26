function Install-App {
    
    <#
        .SYNOPSIS
        Installs an application using either Chocolatey or Winget package managers.

        .DESCRIPTION
        The Install-App function automates the installation of applications using Chocolatey and Winget. 
        It first attempts to install the application with Chocolatey if provided. If Chocolatey is not 
        available or fails, it falls back to Winget for installation. The function also logs the 
        installation attempts, successes, and failures.

        .EXAMPLE
        Install-App -Name "Google Chrome" -Choco "googlechrome" -Winget "Google.Chrome"
    #>

    param ([string]$Name,[string]$Choco,[string]$Winget,[string]$ITT)

    # Helper function to install an app using a specific installer
    function Install-AppWithInstaller {
        param (
            [string]$Installer,
            [string]$InstallArgs
        )

        # Try to install and return the exit code
        $process = Start-Process -FilePath $Installer -ArgumentList $InstallArgs -NoNewWindow -Wait -PassThru
        return $process.ExitCode
    }

    # Function to log installation result
    function Log {
        param (
            [string]$Installer,
            [string]$Source
        )

        if ($Installer -ne 0) {
            Add-Log -Message "Installation Failed for ($Name). Report the issue in the ITT repository." -Level "$Source"
        }
        else {
            Add-Log -Message "Successfully Installed ($Name)" -Level "$Source"
        }
    }

    # Common Winget Arguments
    $wingetArgs = "install --id $Winget --silent --accept-source-agreements --accept-package-agreements --force"
    $chocoArgs = "install $Choco --confirm --acceptlicense -q --ignore-http-cache --limit-output --allowemptychecksumsecure --ignorechecksum --allowemptychecksum --usepackagecodes --ignoredetectedreboot --ignore-checksums --ignore-reboot-requests"
    $ittArgs = "install $ITT -y"

    # TODO: If Chocolatey is 'none', use Winget
    if ($Choco -eq "na" -and $Winget -eq "na" -and $itt -ne "na") {

        Install-Choco
        Add-Log -Message "Attempting to install $Name." -Level "ITT"
        $ITTResult = Install-AppWithInstaller "itt" $ittArgs
        Log $ITTResult "itt"
    }
    else 
    {
        # TODO: if choco is 'none' and winget is not 'none', use winget
        if ($Choco -eq "na" -and $Winget -ne "na") 
        {
            Install-Winget
            Add-Log -Message "Attempting to install $Name." -Level "Winget"
            Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
            $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
            Log $wingetResult "Winget"
        }
        else 
        {
            # TODO: If choco is not 'none' and winget is not 'none', use choco first and fallback to winget
            if ($Choco -ne "na" -or $Winget -ne "na") 
            {
                Install-Choco
                Add-Log -Message "Attempting to install $Name." -Level "Chocolatey"
                $chocoResult = Install-AppWithInstaller "choco" $chocoArgs

                if ($chocoResult -ne 0) {
                    Install-Winget
                    Add-Log -Message "installation failed, Falling back to Winget." -Level "Chocolatey"
                    Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
                    $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
                    Log $wingetResult "Winget"
                }else {
                    Log $chocoResult "Chocolatey"
                }
            }else {
                Add-Log -Message "Package not found in any repository" -Level "ERROR"
            }
        }
    }
}