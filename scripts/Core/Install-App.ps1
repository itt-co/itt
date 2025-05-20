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

    param ([string]$Source, [string]$Name,[string]$Choco,[string]$Scoop,[string]$Winget,[string]$ITT)
    
    # Arguments
    $wingetArgs = "install --id $Winget --silent --accept-source-agreements --accept-package-agreements --force"
    $chocoArgs = "install $Choco --confirm --acceptlicense -q --ignore-http-cache --limit-output --allowemptychecksumsecure --ignorechecksum --allowemptychecksum --usepackagecodes --ignoredetectedreboot --ignore-checksums --ignore-reboot-requests"
    $ittArgs = "install $ITT -y"
    $scoopArgs = "$Scoop"

    # Helper function to install an app using a specific installer
    function Install-AppWithInstaller {
        param ([string]$Installer,[string]$InstallArgs)

        # Try to install and return the exit code
        $process = Start-Process -FilePath $Installer -ArgumentList $InstallArgs -NoNewWindow -Wait -PassThru
        return $process.ExitCode
    }

    # Function to log installation result
    function Log {

        param ([string]$Installer,[string]$Source)

        if ($Installer -ne 0) {
            return @{ Success = $false; Message = "Installation Failed for ($Name). Report the issue in ITT repository." }
        }
        else {
            return @{ Success = $true; Message = "Successfully Installed ($Name)" }
        }
    }

    if($Source -ne "auto")
    {
        switch ($Source) {

            "choco" { 
                Install-Dependencies -PKGMan "choco"
                Install-AppWithInstaller "$Source" $chocoArgs
            }
            "winget" {
                Install-Dependencies -PKGMan "winget"
                Install-AppWithInstaller "$Source" $wingetArgs
            }
            "scoop" {
                Install-Dependencies -PKGMan "scoop"
                Install-AppWithInstaller "$Source" $scoopArgs
            }
        }
    }

    # TODO: if all package managers are 'none', use itt
    if ($Choco -eq "na" -and $Winget -eq "na" -and $itt -ne "na" -and $scoop -eq "na") {

        Install-ITTAChoco
        Add-Log -Message "Attempting to install $Name." -Level "ITT"
        $ITTResult = Install-AppWithInstaller "itt" $ittArgs
        Log $ITTResult "itt"
    }
    else 
    {
        # TODO: if choco is 'none' and Scoop is equal to 'none' and winget is NOT 'none', use winget
        # Skip choco and scoop
        if ($Choco -eq "na" -and $Scoop -eq "na" -and $Winget -ne "na") 
        {
            Install-Winget
            Add-Log -Message "Attempting to install $Name." -Level "Winget"
            Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
            $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
            Log $wingetResult "Winget"
        }
        else 
        {
            # TODO: If choco is not equal to 'none' and winget is not equal to 'none', use choco first and fallback to scoop and if scoop is failed, use winget for last try
            if ($Choco -ne "na" -or $Winget -ne "na" -or $Scoop -ne "na") 
            {
                Install-Dependencies -PKGMan "choco"
                Add-Log -Message "Attempting to install $Name." -Level "Chocolatey"
                $chocoResult = Install-AppWithInstaller "choco" $chocoArgs

                if ($chocoResult -ne 0) {

                    Add-Log -Message "installation failed, Falling back to Scoop." -Level "info"

                    Install-Dependencies -PKGMan "scoop"

                    scoop install $scoopArgs --skip-hash-check

                    if ($LASTEXITCODE -ne 0) {

                        Add-Log -Message "installation failed, Falling back to Winget." -Level "info"
                        Install-Dependencies -PKGMan "winget"
                        $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
                        Log $wingetResult "Winget"
                    }else {
                        Log $LASTEXITCODE "Scoop"
                    }
                }
                else 
                {
                    Log $chocoResult "Chocolatey"
                }
            }
            else 
            {
                Add-Log -Message "$Name is not available in any package manager" -Level "info"
            }
        }
    }
}