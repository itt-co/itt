function Set-Taskbar {

    <#
        .SYNOPSIS
        Sets the taskbar progress and overlay icon in the application window.
        .DESCRIPTION
        The `Set-Taskbar` function allows setting the taskbar progress state, progress value, 
    #>

    param ([string]$progress,[double]$value,[string]$icon)


    try {

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
                "done" {$itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/done.png"}
                "logo" {$itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"}
                "error" {$itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/IT/main/static/Icons/error.png"}
                default{$itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/main//static/Icons/icon.ico"}
            }   
        }

    }
    catch {
        #Add-Log -Message "$_" -Level "info"
    }
}