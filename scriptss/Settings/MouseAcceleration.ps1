function Invoke-MouseAcceleration {

    <#
        .SYNOPSIS
        Toggles mouse acceleration settings on or off.

        .DESCRIPTION
        This function allows you to enable or disable mouse acceleration by adjusting the related registry settings. 
        If the `$Mouse` parameter is set to `$false`, mouse acceleration is enabled with default values. 
        If it is set to `$true`, mouse acceleration is disabled. Additionally, you can specify custom values for 
        `MouseSpeed`, `Threshold1`, and `Threshold2`.

        .EXAMPLE
        # Disables mouse acceleration
        MouseAcceleration -Mouse $true

        # Enables mouse acceleration with default values
        MouseAcceleration -Mouse $false

        # Enables mouse acceleration with custom values
        MouseAcceleration -Mouse $false -MouseSpeed 1 -Threshold1 4 -Threshold2 8

        # Disables mouse acceleration and logs actions
        MouseAcceleration -Mouse $true -Path "HKCU:\Control Panel\Mouse"
    #>

    param (
        $Mouse,
        $Speed = 0,
        $Threshold1  = 0,
        $Threshold2  = 0,
        [string]$Path = "HKCU:\Control Panel\Mouse"
    )

    try {
        if($Mouse -eq $false)
        {
            Add-Log -Message "Mouse Acceleration" -LEVEL "Apply"
            $Speed = 1
            $Threshold1 = 6
            $Threshold2 = 10
        }else {
            $Speed = 0
            $Threshold1 = 0
            $Threshold2 = 0
            Add-Log -Message "Mouse Acceleration" -LEVEL "Disabled"
        }

        Set-ItemProperty -Path $Path -Name MouseSpeed -Value $Speed
        Set-ItemProperty -Path $Path -Name MouseThreshold1 -Value $Threshold1
        Set-ItemProperty -Path $Path -Name MouseThreshold2 -Value $Threshold2
    }
    catch {
        Add-Log -Message "Unable  set valuse" -LEVEL "ERROR"
    }
}