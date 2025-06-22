function Invoke-Button {

    <#
        .SYNOPSIS
            Handles various button actions and commands based on the specified action parameter.
        .EXAMPLE
            Invoke-Button -action "sysinfo"
    #>

    Param ([string]$action,[string]$Content)

    # debug start
    function Debug-Message {if($Debug) {  Add-Log "$action,$Content" -Level "Debug"  }}
    # debug end

    # Switch block to handle different actions
    Switch -Wildcard ($action) {
        "installBtn" {
            $itt.SearchInput.Text = $null
            Invoke-Install
        }
        "applyBtn" {
            Invoke-Apply
        }
        "$($itt.CurrentCategory)" {
            FilterByCat($itt["window"].FindName($itt.CurrentCategory).SelectedItem.Tag)
        }
        "searchInput" {
            Search
        }
        "auto" {
            Set-ItemProperty -Path $itt.registryPath -Name "source" -Value "auto" -Force
            Set-Statusbar -Text "📢 Switched to auto"
        }
        "choco" {
            Set-ItemProperty -Path $itt.registryPath -Name "source" -Value "choco" -Force
            Set-Statusbar -Text "📢 Switched to choco"
        }
        "winget" {
            Set-ItemProperty -Path $itt.registryPath -Name "source" -Value "winget" -Force
            Set-Statusbar -Text "📢 Switched to winget"
        }
        # Menu items
        "systemlang" {
            Set-Language -lang "default"
        }
        #{locales}
        "save" {
            Save-File
        }
        "load" {
            Get-file
        }
        # Device Management
        "deviceManager" {
            Start-Process devmgmt.msc 
        }
        "appsfeatures" {
            Start-Process appwiz.cpl 
        }
        "sysinfo" {
            Start-Process msinfo32.exe
            Start-Process dxdiag.exe 
        }
        "poweroption" {
            Start-Process powercfg.cpl 
        }
        "services" {
            Start-Process services.msc 
        }
        "network" {
            Start-Process ncpa.cpl

        }
        "taskmgr" {
            Start-Process taskmgr.exe
        }
        "diskmgmt" {
            Start-Process diskmgmt.msc
        }
        "msconfig" {
            Start-Process msconfig.exe
        }
        "ev" {
            rundll32 sysdm.cpl,EditEnvironmentVariables
        }
        "spp" {
            systemPropertiesProtection
        }
        "systheme" {
            SwitchToSystem 
        }
        #{themes}
        # chocoloc
        "chocoloc" {
            Start-Process explorer.exe "C:\ProgramData\chocolatey\lib"
        }
        # itt Dir
        "itt" {
            Start-Process explorer.exe $env:ProgramData\itt
        }
        # restore point
        "restorepoint" {
            ITT-ScriptBlock -ScriptBlock{CreateRestorePoint}
        }
        # Music
        "moff" {
            Manage-Music -action "SetVolume" -volume 0 
        }
        "mon" {
            Manage-Music -action "SetVolume" -volume 100 
        }
        # Mirror Links
        "unhook" {
            Start-Process "https://unhook.app/" 
        }
        "efy" {
            Start-Process "https://www.mrfdev.com/enhancer-for-youtube" 
        }
        "uBlock" {
            Start-Process "https://ublockorigin.com/" 
        }
        "mas" {
            Add-Log -Message "Microsoft Activation Scripts (MAS)" -Level "info"
            ITT-ScriptBlock -ScriptBlock {irm https://get.activated.win | iex}
        }
        "idm" {
            Add-Log -Message "Running IDM Activation..." -Level "info"
            ITT-ScriptBlock -ScriptBlock {curl.exe -L -o $env:TEMP\\IDM_Trial_Reset.exe "https://github.com/itt-co/itt-packages/raw/refs/heads/main/automation/idm-trial-reset/IDM%20Trial%20Reset.exe"; cmd /c "$env:TEMP\\IDM_Trial_Reset.exe"}
        }
        "winoffice" {
            Start-Process "https://massgrave.dev/genuine-installation-media" 
        }
        "sordum" {
            Start-Process "https://www.sordum.org/" 
        }
        "majorgeeks" {
            Start-Process "https://www.majorgeeks.com/" 
        }
        "techpowerup" {
            Start-Process "https://www.techpowerup.com/download/"
        }
        # Other actions
        "ittshortcut" {
            ITTShortcut $action
        }
        "dev" {
            About
        }
        "shelltube"{
            Start-Process -FilePath "powershell" -ArgumentList "irm https://github.com/emadadel4/shelltube/releases/latest/download/st.ps1 | iex"
        }
        "rapidos"{
            Start-Process ("https://github.com/rapid-community/RapidOS")
        }
        "asustool"{
            Start-Process ("https://github.com/codecrafting-io/asus-setup-tool")
        }
        "webtor"{
            Start-Process ("https://webtor.io/")
        }
        "spotifydown"{
            Start-Process ("https://spotidownloader.com/")
        }
        "finddriver"{
            Find-Driver
        }
        "taps"{
            ChangeTap
        }
        Default {
            Write-Host "Unknown action: $action"
        }
    }

    # debug start
        Debug-Message $action
    # debug end
}
