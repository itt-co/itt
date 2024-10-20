Function Get-ToggleStatus {

    <#
        .SYNOPSIS
        Checks the status of various system toggle switches based on the provided parameter.

        .DESCRIPTION
        This function retrieves and returns the status of specific system toggle switches, such as Dark Mode, file extension visibility, hidden files visibility, Num Lock, and Sticky Keys. The status is determined by querying the Windows Registry for relevant settings.

        .PARAMETER ToggleSwitch
        Specifies which toggle switch status to check. The following values are supported:
        - `ToggleDarkMode`: Checks if Dark Mode is enabled.
        - `ToggleShowExt`: Checks if file extensions are set to be shown.
        - `ToggleShowHidden`: Checks if hidden files are set to be shown.
        - `ToggleNumLock`: Checks if Num Lock is enabled.
        - `ToggleStickyKeys`: Checks if Sticky Keys is enabled.

        .RETURN
        - Returns `$true` if the specified toggle switch is enabled according to the criteria.
        - Returns `$false` if the toggle switch is disabled or if the check does not match the criteria.

        .EXAMPLE
        Get-ToggleStatus -ToggleSwitch "ToggleDarkMode"
        Checks if Dark Mode is enabled on the system and returns `$true` if it is.

        .EXAMPLE
        Get-ToggleStatus -ToggleSwitch "ToggleShowExt"
        Checks if file extensions are shown in the File Explorer and returns `$true` if they are.

        .NOTES
        - The function relies on querying specific registry paths to determine the status of the toggle switches.
        - The function uses registry values to determine the state of settings related to the specified toggle switches.
        - Ensure that you have appropriate permissions to access the registry paths used by this function.
        - The function includes error handling to return `$false` if the registry values do not match the expected criteria for the toggle switches.
    #>


    Param($ToggleSwitch) # Parameter to specify which toggle switch status to check

    # Check status of "ToggleDarkMode"
    if($ToggleSwitch -eq "ToggleDarkMode"){
        $app = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').AppsUseLightTheme
        $system = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').SystemUsesLightTheme
        if($app -eq 0 -and $system -eq 0){
            return $true
        }
        else{
            # Return true if Sticky Keys are enabled
            return $false
        }
    }
  
    # Check status of "ToggleShowExt" (Show File Extensions)
    if($ToggleSwitch -eq "ToggleShowExt"){
        $hideextvalue = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced').HideFileExt
        if($hideextvalue -eq 0){
            return $true
        }
        else{
            # Return true if Sticky Keys are enabled
            return $false
        }
    }

    # Check status of "ToggleShowHidden" (Show Hidden Files)
    if($ToggleSwitch -eq "ToggleShowHidden"){
        $hideextvalue = (Get-ItemPropertyValue -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSuperHidden")
        if($hideextvalue -eq 1){
            return $true
        }
        else{
            # Return true if Sticky Keys are enabled
            return $false
        }
    }

    # Check status of "ToggleNumLock"
    if($ToggleSwitch -eq "ToggleNumLook"){
        $numlockvalue = (Get-ItemProperty -path 'HKCU:\Control Panel\Keyboard').InitialKeyboardIndicators
        if($numlockvalue -eq 2){
            return $true
        }
        else{
            # Return true if Sticky Keys are enabled
            return $false
        }
    } 
    
    # Check status of "ToggleStickyKeys"    
    if ($ToggleSwitch -eq "ToggleStickyKeys") {
        $StickyKeys = (Get-ItemProperty -path 'HKCU:\Control Panel\Accessibility\StickyKeys').Flags
        if($StickyKeys -eq 58){
            return $false
        }
        else{
            # Return true if Sticky Keys are enabled
            return $true
        }
    }

    # Check status of "MouseAcceleration"    
    if($ToggleSwitch -eq "MouseAcceleration") {
        $Speed = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseSpeed
        $Threshold1 = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseThreshold1
        $Threshold2 = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseThreshold2

        if($Speed -eq 1 -and $Threshold1 -eq 6 -and $Threshold2 -eq 10) {
            return $true
        } else {
            return $false
        }
    }
}