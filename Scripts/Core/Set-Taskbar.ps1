function Set-Taskbar {

    <#
        .SYNOPSIS
        Sets the taskbar progress and overlay icon in the application window.

        .DESCRIPTION
        The `Set-Taskbar` function allows setting the taskbar progress state, progress value, 
        and overlay icon for the application's taskbar item. 
        You can specify the progress state, value, and change the icon displayed on the taskbar.

        .EXAMPLE
        Set-Taskbar -progress 'Normal' -value 0.5 -icon 'done'
        This example sets the taskbar progress state to 'Normal' with a progress value of 50% 
        and shows a 'done' icon as an overlay for 2 seconds before switching back to the default icon.
    #>
    
    param (
        [string]$progress,
        [double]$value,
        [string]$icon
    )


    if ($value) {
        $itt["window"].taskbarItemInfo.ProgressValue = $value
    }


    if($progress)
    {
        switch ($progress) {
            'None' { $itt["window"].taskbarItemInfo.ProgressState = "None" }
            'Normal' { $itt["window"].taskbarItemInfo.ProgressState = "Normal" }
            'Indeterminate' { $itt["window"].taskbarItemInfo.ProgressState = "Indeterminate" }
            'Error' { $itt["window"].taskbarItemInfo.ProgressState = "Error" }
            default { throw "Set-Taskbar Invalid state" }
        }
    }

    if($icon)
    {
        switch ($icon) {

            "done" {
                $itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/Statics/Icons/done.png"
            }
            "logo" {
                $itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/Statics/Icons/icon.ico"
            }
            "error" {
                $itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/Statics/Icons/error.png"
            }
            default{
                $itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/Statics/Icons/icon.ico"
            }
        }   
    }
}