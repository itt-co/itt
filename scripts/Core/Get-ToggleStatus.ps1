function Get-ToggleStatus {

    <#
        .SYNOPSIS
        Checks the status of various system toggle switches based on the provided parameter.
        .DESCRIPTION
        This function retrieves the status of the specified toggle switch.
        .EXAMPLE
        Get-ToggleStatus -ToggleSwitch "ToggleDarkMode"
    #>

    Param($ToggleSwitch)
    # Check status of "ToggleDarkMode"
    if ($ToggleSwitch -eq "darkmode") {
        $app = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').AppsUseLightTheme
        $system = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').SystemUsesLightTheme
        if ($app -eq 0 -and $system -eq 0) {
            return $true
        }
        else {
            # Return true if Sticky Keys are enabled
            return $false
        }
    }

    # Check status of "ToggleShowExt" (Show File Extensions)
    if ($ToggleSwitch -eq "showfileextensions") {
        $hideextvalue = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced').HideFileExt
        if ($hideextvalue -eq 0) {
            return $true
        }
        else {
            # Return true if Sticky Keys are enabled
            return $false
        }
    }

    # Check status of "showsuperhidden" (Show Hidden Files)
    if ($ToggleSwitch -eq "showsuperhidden") {
        $hideextvalue = (Get-ItemPropertyValue -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSuperHidden")
        if ($hideextvalue -eq 1) {
            return $true
        }
        else {
            # Return true if Sticky Keys are enabled
            return $false
        }
    }

    # Check status of "ToggleNumLock"
    if ($ToggleSwitch -eq "numlook") {
        $numlockvalue = (Get-ItemProperty -path 'HKCU:\Control Panel\Keyboard').InitialKeyboardIndicators
        if ($numlockvalue -eq 2) {
            return $true
        }
        else {
            # Return true if Sticky Keys are enabled
            return $false
        }
    } 

    # Check status of "ToggleStickyKeys"    
    if ($ToggleSwitch -eq "stickykeys") {
        $StickyKeys = (Get-ItemProperty -path 'HKCU:\Control Panel\Accessibility\StickyKeys').Flags
        if ($StickyKeys -eq 58) {
            return $false
        }
        else {
            # Return true if Sticky Keys are enabled
            return $true
        }
    }

    # Check status of "MouseAcceleration"    
    if ($ToggleSwitch -eq "mouseacceleration") {
        $Speed = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseSpeed
        $Threshold1 = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseThreshold1
        $Threshold2 = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseThreshold2
        if ($Speed -eq 1 -and $Threshold1 -eq 6 -and $Threshold2 -eq 10) {
            return $true
        }
        else {
            return $false
        }
    }

    # EndTaskOnTaskbar     
    if ($ToggleSwitch -eq "endtaskontaskbarwindows11") {
        $path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings"
        if (-not (Test-Path $path)) {
            return $false
        }
        else {
            $TaskBar = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings').TaskbarEndTask
            if ($TaskBar -eq 1) {
                return $true
            } 
            else {
                return $false
            }
        }
    }

    # Remove Page file     
    if ($ToggleSwitch -eq "clearpagefileatshutdown") {
        $PageFile = (Get-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\\Memory Management').ClearPageFileAtShutdown
        if ($PageFile -eq 1) {
            return $true
        } 
        else {
            return $false
        }
    }

    # Auto end tasks     
    if ($ToggleSwitch -eq "autoendtasks") {
        $PageFile = (Get-ItemProperty -path 'HKCU:\Control Panel\Desktop').AutoEndTasks
        if ($PageFile -eq 1) {
            return $true
        } 
        else {
            return $false
        }
    }

    # Performance Options     
    if ($ToggleSwitch -eq "performanceoptions") {
        $VisualFXSetting = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects').VisualFXSetting
        if ($VisualFXSetting -eq 2) {
            return $true
        } 
        else {
            return $false
        }
    }

    # Quick Access   
    if ($ToggleSwitch -eq "launchtothispc") {
        $LaunchTo = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced').LaunchTo
        if ($LaunchTo -eq 1) {
            return $true
        } 
        else {
            return $false
        }
    }

    # Disable Automatic Driver Installation
    if ($ToggleSwitch -eq "disableautomaticdriverinstallation") {
        $disableautomaticdrive = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching').SearchOrderConfig
        if ($disableautomaticdrive -eq 1) {
            return $true
        } 
        else {
            return $false
        }
    }

    # Always show icons never thumbnail
    if ($ToggleSwitch -eq "AlwaysshowiconsneverThumbnail") {
        $alwaysshowicons = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced').IconsOnly
        if ($alwaysshowicons -eq 1) {
            return $true
        } 
        else {
            return $false
        }
    }

    # Core Isolation Memory Integrity
    if ($ToggleSwitch -eq "CoreIsolationMemoryIntegrity") {
        $CoreIsolationMemory = (Get-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard').Enabled
        if ($CoreIsolationMemory -eq 1) {
            return $true
        } 
        else {
            return $false
        }
        
    }

    # Windows Sandbox
    if ($ToggleSwitch -eq "WindowsSandbox") {
        $WS = Get-WindowsOptionalFeature -Online -FeatureName "Containers-DisposableClientVM"
        if ($WS.State -eq "Enabled") {
            return $true
        } 
        else {
            return $false
        }
    }

    # Windows Sandbox
    if ($ToggleSwitch -eq "WindowsSubsystemforLinux") {
        $WSL = Get-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux"
        if ($WSL.State -eq "Enabled") {
            return $true
        } 
        else {
            return $false
        }
    }   

    # HyperV
    if ($ToggleSwitch -eq "HyperVVirtualization") {

        $HyperV = Get-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V"

        if ($HyperV.State -eq "Enabled") {
            return $true
        } 
        else {
            return $false
        }
    }
}