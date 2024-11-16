function Invoke-Button {

    <#
        .SYNOPSIS
        Handles various button actions and commands based on the specified action parameter.

        .DESCRIPTION
        The `Invoke-Button` function executes different actions depending on the input parameter. It manages operations such as installing apps, applying tweaks, changing themes, opening system utilities, and managing language settings. This function is designed to be used with UI elements where each button triggers a specific action.

        .PARAMETER action
        A string specifying the action to perform. The action can be one of several predefined values representing different operations, such as installing apps, applying tweaks, opening system utilities, changing themes, or managing language settings.

        .EXAMPLE
        Invoke-Button -action "installBtn"

        .EXAMPLE
        Invoke-Button -action "Dark"

        .EXAMPLE
        Invoke-Button -action "sysinfo"

        .NOTES
        - The function uses a `Switch` statement to handle different actions based on the `$action` parameter.
        - For UI-related actions, such as installing apps or applying tweaks, it calls `Invoke-Install` or `Invoke-Apply`.
        - For system utilities and settings, it uses `Start-Process` to open tools like Device Manager, Task Manager, or disk management utilities.
        - For language settings, it invokes the `Set-Language` function with the specified language code.
        - For theme changes, it calls functions like `Switch-ToDarkMode` or `Switch-ToLightMode`.
        - For managing audio settings, it calls `MuteMusic` or `UnmuteMusic`.
        - For opening URLs related to tools or scripts, it uses `Start-Process` with the URL as an argument.
        - The `Debug-Message` function is used for internal debugging and can be uncommented for logging purposes.
    #>

    Param ([string]$action,[string]$Content)

    # Helper function for debugging
    function Debug-Message {
        if($Debug) {  Add-Log "Name:$action Content:$Content" -Level "debug"  }
    }

    # Switch block to handle different actions
    Switch -Wildcard ($action) {

        "installBtn" {
            $itt.SearchInput.Text = $null
            Invoke-Install
            Debug-Message
        }
        "applyBtn" {
            Invoke-Apply
            Debug-Message 
        }
        "taps" {
            ChangeTap
        }
        "$($itt.CurrentCategory)" {
            FilterByCat($itt["window"].FindName($itt.CurrentCategory).SelectedItem.Content)
            Debug-Message $action
        }
        "searchInput" {
            Search
            Debug-Message
        }

        # Menu items

        "systemlang" {
            Set-Language -lang "default"
            Debug-Message
        }
        
        #{locales}

        "save" {
            SaveItemsToJson
            Debug-Message
        }
        "load" {
            LoadJson
            Debug-Message
        }

        # Device Management
        "deviceManager" {
            Start-Process devmgmt.msc 
            Debug-Message
        }
        "appsfeatures" {
            Start-Process appwiz.cpl 
            Debug-Message
        }
        "sysinfo" {
            Start-Process msinfo32.exe
            Start-Process dxdiag.exe 
            Debug-Message
        }
        "poweroption" {
            Start-Process powercfg.cpl 
            Debug-Message $action
        }
        "services" {
            Start-Process services.msc 
            Debug-Message $action
        }
        "network" {
            Start-Process ncpa.cpl
            Debug-Message $action
        }
        "taskmgr" {
            Start-Process taskmgr.exe 
            Debug-Message $action
        }
        "diskmgmt" {
            Start-Process diskmgmt.msc
            Debug-Message $action
        }

        "systheme" {
            SwitchToSystem 
            Debug-Message
        }

        #{themes}



        # chocoloc
         "chocoloc" {
            Start-Process explorer.exe "C:\ProgramData\chocolatey\lib"
            Debug-Message $action
        }

        # restore point
        "restorepoint" {
            RestorePoint
            Debug-Message $action
        }

        # Music
        "moff" {
            MuteMusic -Value 0
            Debug-Message $action
        }
        "mon" {
            UnmuteMusic -Value 100
            Debug-Message $action
        }

        # Mirror Links
        "unhook" {
            Start-Process "https://unhook.app/" 
            Debug-Message $action
        }
        "uBlock" {
            Start-Process "https://ublockorigin.com/" 
            Debug-Message $action
        }
        "mas" {
            Start-Process "https://github.com/massgravel/Microsoft-Activation-Scripts"
            Debug-Message $action
        }
        "idm" {
            Start-Process "https://github.com/WindowsAddict/IDM-Activation-Script"
            Debug-Message $action
        }
        "neat" {
            Start-Process "https://addons.mozilla.org/en-US/firefox/addon/neatdownloadmanager-extension/" 
            Debug-Message $action
        }

        "winoffice" {
            Start-Process "https://massgrave.dev/genuine-installation-media" 
            Debug-Message $action
        }
        "sordum" {
            Start-Process "https://www.sordum.org/" 
            Debug-Message $action
        }
        "majorgeeks" {
            Start-Process "https://www.majorgeeks.com/" 
            Debug-Message $action
        }

        "techpowerup" {
            Start-Process "https://www.techpowerup.com/download/" 
            Debug-Message $action
        }

        # Other actions
        "ittshortcut" {
            ITTShortcut $action
            Debug-Message $action
        }
        "dev" {
            About
            Debug-Message $action
        }
        # Reset-Preferences

        "reset"{
            Reset-Preferences
            Debug-Message $action
        }

        "shelltube"{
            Start-Process -FilePath "powershell" -ArgumentList "irm https://github.com/emadadel4/shelltube/releases/latest/download/st.ps1 | iex"
            Debug-Message $action
        }

        Default {
            Write-Host "Unknown action: $action"
        }
    }
}