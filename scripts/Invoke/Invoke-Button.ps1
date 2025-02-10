function Invoke-Button {

    <#
        .SYNOPSIS
            Handles various button actions and commands based on the specified action parameter.
        .DESCRIPTION
            The `Invoke-Button` function executes different actions depending on the input parameter. It manages operations such as installing apps.
        .EXAMPLE
            Invoke-Button -action "sysinfo"
    #>

    Param ([string]$action,[string]$Content)
    # debug start
        function Debug-Message {
                if($Debug) {  Add-Log "$action,$Content" -Level "Debug"  }
        }
    # debug end

    # Switch block to handle different actions
    Switch -Wildcard ($action) {
        "installBtn" {
            $itt.SearchInput.Text = $null
            Invoke-Install
            # debug start
                Debug-Message $action
            # debug end
        }
        "applyBtn" {
            Invoke-Apply
            # debug start
                Debug-Message $action
            # debug end
        }
        "$($itt.CurrentCategory)" {
            FilterByCat($itt["window"].FindName($itt.CurrentCategory).SelectedItem.Content)
            # debug start
                Debug-Message $action
            # debug end

        }
        "searchInput" {
            Search
            # debug start
                Debug-Message $action
            # debug end
        }
        # Menu items
        "systemlang" {
            Set-Language -lang "default"
            # debug start
                Debug-Message $action
            # debug end
        }
        #{locales}
        "save" {
            Save-File
            # debug start
                Debug-Message $action
            # debug end
        }
        "load" {
            Load-SavedFile
            # debug start
                Debug-Message $action
            # debug end
        }
        # Device Management
        "deviceManager" {
            Start-Process devmgmt.msc 
            # debug start
                Debug-Message $action
            # debug end
        }
        "appsfeatures" {
            Start-Process appwiz.cpl 
            # debug start
                Debug-Message $action
            # debug end
        }
        "sysinfo" {
            Start-Process msinfo32.exe
            Start-Process dxdiag.exe 
            # debug start
                Debug-Message $action
            # debug end
        }
        "poweroption" {
            Start-Process powercfg.cpl 
            # debug start
                Debug-Message $action
            # debug end
        }
        "services" {
            Start-Process services.msc 
            # debug start
                Debug-Message $action
            # debug end
        }
        "network" {
            Start-Process ncpa.cpl
            # debug start
                Debug-Message $action
            # debug end

        }
        "taskmgr" {
            Start-Process taskmgr.exe
            # debug start
                Debug-Message $action
            # debug end
        }
        "diskmgmt" {
            Start-Process diskmgmt.msc
            # debug start
                Debug-Message $action
            # debug end
        }
        "msconfig" {
            Start-Process msconfig.exe
            # debug start
                Debug-Message $action
            # debug end
        }
        "ev" {
            rundll32 sysdm.cpl,EditEnvironmentVariables
        }
        "systheme" {
            SwitchToSystem 
            # debug start
                Debug-Message $action
            # debug end
        }
        #{themes}
        # chocoloc
        "chocoloc" {
            Start-Process explorer.exe "C:\ProgramData\chocolatey\lib"
            # debug start
                Debug-Message $action
            # debug end
        }
        # itt Dir
        "itt" {
            Start-Process explorer.exe $env:ProgramData\itt
            # debug start
                Debug-Message $action
            # debug end

        }
        # restore point
        "restorepoint" {
            RestorePoint
            # debug start
                Debug-Message $action
            # debug end
        }
        # Music
        "moff" {
            Manage-Music -action "SetVolume" -volume 0 
            # debug start
                Debug-Message $action
            # debug end
        }
        "mon" {
            Manage-Music -action "SetVolume" -volume 100 
            # debug start
                Debug-Message $action
            # debug end
        }
        # Mirror Links
        "unhook" {
            Start-Process "https://unhook.app/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "uBlock" {
            Start-Process "https://ublockorigin.com/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "mas" {
            Add-Log -Message "Microsoft Activation Scripts (MAS)" -Level "info"
            ITT-ScriptBlock -ScriptBlock {irm https://get.activated.win | iex}
            # debug start
                Debug-Message $action
            # debug end
        }
        "idm" {
            Add-Log -Message "IDM Activation Script (WindowsAddict)" -Level "info"
            ITT-ScriptBlock -ScriptBlock {irm https://massgrave.dev/ias | iex}
            # debug start
                Debug-Message $action
            # debug end
        }
        "neat" {
            Start-Process "https://addons.mozilla.org/en-US/firefox/addon/neatdownloadmanager-extension/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "winoffice" {
            Start-Process "https://massgrave.dev/genuine-installation-media" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "sordum" {
            Start-Process "https://www.sordum.org/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "majorgeeks" {
            Start-Process "https://www.majorgeeks.com/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "techpowerup" {
            Start-Process "https://www.techpowerup.com/download/"
            # debug start
                Debug-Message $action
            # debug end
        }
        # Other actions
        "ittshortcut" {
            ITTShortcut $action
            # debug start
                Debug-Message $action
            # debug end
        }
        "dev" {
            About
            # debug start
                Debug-Message $action
            # debug end
        }
        # Reset-Preferences
        "reset"{
            Reset-Preferences
            # debug start
                Debug-Message $action
            # debug end
        }
        "shelltube"{
            Start-Process -FilePath "powershell" -ArgumentList "irm https://github.com/emadadel4/shelltube/releases/latest/download/st.ps1 | iex"
            # debug start
                Debug-Message $action
            # debug end
        }
        "fmhy"{
            Start-Process ("https://fmhy.net/")
            # debug start
                Debug-Message $action
            # debug end
        }
        "rapidos"{
            Start-Process ("https://github.com/rapid-community/RapidOS")
            # debug start
                Debug-Message $action
            # debug end
        }
        "asustool"{
            Start-Process ("https://github.com/codecrafting-io/asus-setup-tool")
            # debug start
                Debug-Message $action
            # debug end
        }
        "webtor"{
            Start-Process ("https://webtor.io/")
            # debug start
                Debug-Message $action
            # debug end
        }
        "spotifydown"{
            Start-Process ("https://spotifydown.com")
            # debug start
                Debug-Message $action
            # debug end
        }
        "taps"{
            ChangeTap
            # debug start
                Debug-Message $action
            # debug end
        }
        Default {
            Write-Host "Unknown action: $action"
        }
    }
}