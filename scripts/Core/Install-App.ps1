function Install-App {
    
    <#
        .SYNOPSIS
        Installs an application using either Chocolatey or Winget package managers.
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

     # If specific package manager is requested
    if ($Source -ne "auto") {

        switch ($Source.ToLower()) {
            "choco" { 
                
                if ($Choco -eq "na") {
                    Add-Log -Message "Chocolatey package not available for $Name" -Level "WARNING"
                    return @{ Success = $false; Message = "This app is not available in Chocolatey" }
                }

                Install-Dependencies -PKGMan "choco"

                $exitCode = Install-AppWithInstaller "choco" $chocoArgs

                return Log $exitCode "Chocolatey"
            }
            "winget" {

                if ($Winget -eq "na") {
                    Add-Log -Message "Winget package not available for $Name" -Level "WARNING"
                    return @{ Success = $false; Message = "This app is not available in Winget" }
                }

                Install-Dependencies -PKGMan "winget"

                $exitCode = Install-AppWithInstaller "winget" $wingetArgs

                return Log $exitCode "Winget"
            }
            "scoop" {

                if ($Scoop -eq "na") {
                    Add-Log -Message "Scoop package not available for $Name" -Level "WARNING"
                    return @{ Success = $false; Message = "This app is not available in Scoop" }
                }

                Install-Dependencies -PKGMan "scoop"

                $LASTEXITCODE = scoop install $scoopArgs

                return Log $LASTEXITCODE "Scoop"
            }
            default {
                Add-Log -Message "Invalid package manager specified: $Source" -Level "ERROR"
                return @{ Success = $false; Message = "Invalid package manager" }
            }
        }
    }

    # TODO: if all package managers are 'none', use itt
    if ($Choco -eq "na" -and $Winget -eq "na" -and $itt -ne "na") {

        Install-Dependencies -PKGMan "itt"
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
            Add-Log -Message "Attempting to install $Name." -Level "Winget"

            Install-Winget
            
            Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
            
            $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
            Log $wingetResult "Winget"
        }
        else 
        {
            # TODO: If choco is not equal to 'none' and winget is not equal to 'none', use choco first and fallback to scoop and if scoop is failed, use winget for last try
            if ($Choco -ne "na" -or $Winget -ne "na" -or $Scoop -ne "na") 
            {
                Add-Log -Message "Attempting to install $Name." -Level "Chocolatey"

                Install-Dependencies -PKGMan "choco"

                $chocoResult = Install-AppWithInstaller "choco" $chocoArgs

                if ($chocoResult -ne 0) {

                    Add-Log -Message "installation failed, Falling back to winget." -Level "info"

                    Install-Dependencies -PKGMan "winget"

                    $wingetResult = Install-AppWithInstaller "winget" $wingetArgs

                    if ($wingetResult -ne 0) {

                        Add-Log -Message "installation failed, Falling back to scoop." -Level "info"

                        Install-Dependencies -PKGMan "scoop"

                        scoop install $scoopArgs

                        Log $LASTEXITCODE "Scoop"
                        
                    }else {
                        Log $wingetResult "Winget"
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