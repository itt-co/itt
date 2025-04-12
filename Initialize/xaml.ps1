# Set the maximum number of threads for the RunspacePool to the number of threads on the machine
$maxthreads = [int]$env:NUMBER_OF_PROCESSORS
# Create a new session state for parsing variables into our runspace
$hashVars = New-object System.Management.Automation.Runspaces.SessionStateVariableEntry -ArgumentList 'itt', $itt, $Null
$InitialSessionState = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
# Add the variable to the session state

$InitialSessionState.Variables.Add($hashVars)

$functions = @(
    'Install-App', 'Install-Winget', 'InvokeCommand', 'Add-Log',
    'Disable-Service', 'Uninstall-AppxPackage', 'Finish', 'Message',
    'Notify', 'UpdateUI', 'Install-ITTAChoco',
    'ExecuteCommand', 'Set-Registry', 'Set-Taskbar',
    'Refresh-Explorer', 'Remove-ScheduledTasks','CreateRestorePoint','Set-Taskbar'
)

foreach ($func in $functions) {
    $command = Get-Command $func -ErrorAction SilentlyContinue
    if ($command) {
        $InitialSessionState.Commands.Add(
            (New-Object System.Management.Automation.Runspaces.SessionStateFunctionEntry $command.Name, $command.ScriptBlock.ToString())
        )

        #debug start
        Write-Output "Added function: $func"
        #debug end
    }
}

# Create and open the runspace pool
$itt.runspace = [runspacefactory]::CreateRunspacePool(1, $maxthreads, $InitialSessionState, $Host)
$itt.runspace.Open()

# Initialize Main window
try {
    [xml]$MainXaml = $MainWindowXaml
    $itt["window"] = [Windows.Markup.XamlReader]::Load([System.Xml.XmlNodeReader]$MainXaml)
}
catch {
    Write-Output "Error: $($_.Exception.Message)"
}
try {
    #===========================================================================
    #region Create default keys
    #===========================================================================
    $appsTheme = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme"
    $fullCulture = Get-ItemPropertyValue -Path "HKCU:\Control Panel\International" -Name "LocaleName"
    $shortCulture = $fullCulture.Split('-')[0]
    # Ensure registry key exists and set defaults if necessary
    if (-not (Test-Path $itt.registryPath)) {
        New-Item -Path $itt.registryPath -Force | Out-Null
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
        Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -Force
        Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value 0 -Force
        Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 0 -Force
        Set-ItemProperty -Path $itt.registryPath -Name "backup" -Value 0 -Force
    }
    try {
        # Attempt to get existing registry values
        $itt.Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme" -ErrorAction Stop).Theme
        $itt.Locales = (Get-ItemProperty -Path $itt.registryPath -Name "locales" -ErrorAction Stop).locales
        $itt.Music = (Get-ItemProperty -Path $itt.registryPath -Name "Music" -ErrorAction Stop).Music
        $itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -ErrorAction Stop).PopupWindow
        $itt.backup = (Get-ItemProperty -Path $itt.registryPath -Name "backup" -ErrorAction Stop).backup
    }
    catch {
        # Creating missing registry keys
        # debug start
        if ($Debug) { Add-Log -Message "An error occurred. Creating missing registry keys..." -Level "debug" }
        # debug end
        New-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -PropertyType String -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -PropertyType String -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "Music" -Value 0 -PropertyType DWORD -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 0 -PropertyType DWORD -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "backup" -Value 0 -PropertyType DWORD -Force *> $Null
    }
    #===========================================================================
    #endregion Create default keys
    #===========================================================================
    #===========================================================================
    #region Set Language based on culture
    #===========================================================================
    try {
        $Locales = switch ($itt.Locales) {
            "default" {
                switch ($shortCulture) {
                    #{LangagesSwitch}
                    default { "en" }
                }
            }
            #{LangagesSwitch}
            default { "en" }
        }
        $itt["window"].DataContext = $itt.database.locales.Controls.$Locales
        $itt.Language = $Locales
    }
    catch {
        # fallbak to en lang
        $itt["window"].DataContext = $itt.database.locales.Controls.en
    }
    #===========================================================================
    #endregion Set Language based on culture
    #===========================================================================
    #===========================================================================
    #region Check theme settings
    #===========================================================================
    try {
        $Themes = switch ($itt.Theme) {
            #{ThemesSwitch}
            default {
                switch ($appsTheme) {
                    "0" { 
                        "Dark"
                        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
                    }
                    "1" { 
                        
                        "Light" 
                        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
                    }
                }
            }
        }
        $itt["window"].Resources.MergedDictionaries.Add($itt["window"].FindResource($Themes))
        $itt.Theme = $Themes
    }
    catch {
        # Fall back to default theme if there error
        $fallback = switch ($appsTheme) {
            "0" { "Dark" }
            "1" { "Light" }
        }
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
        $itt["window"].Resources.MergedDictionaries.Add($itt["window"].FindResource($fallback))
        $itt.Theme = $fallback
    }
    #===========================================================================
    #endregion Check theme settings
    #===========================================================================
    #===========================================================================
    #region Get user Settings from registry
    #===========================================================================
    # Check if Music is set to 100, then reset toggle state to false
    $itt.mediaPlayer.settings.volume = "$($itt.Music)"
    if ($itt.Music -eq 0) {
        $global:toggleState = $false
    }
    else {
        $global:toggleState = $true
    }

    $itt["window"].title = "Install Tweaks Tool " + @("🔈", "🔊")[$itt.Music -eq 100]
    $itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow").PopupWindow
    #===========================================================================
    #endregion Get user Settings from registry
    #===========================================================================
    # init taskbar icon
    $itt["window"].TaskbarItemInfo = New-Object System.Windows.Shell.TaskbarItemInfo
    if (-not $Debug) { Set-Taskbar -progress "None" -icon "logo" }
}
catch {
    Write-Output "Error: $_"
}


#===========================================================================
#region Initialize WPF Controls
#===========================================================================

# List Views
$itt.CurrentList
$itt.CurrentCategory
$itt.Search_placeholder = $itt["window"].FindName("search_placeholder")
$itt.TabControl = $itt["window"].FindName("taps")
$itt.AppsListView = $itt["window"].FindName("appslist")
$itt.TweaksListView = $itt["window"].FindName("tweakslist")
$itt.SettingsListView = $itt["window"].FindName("SettingsList")

# Buttons and Inputs
$itt.Description = $itt["window"].FindName("description")
$itt.Statusbar = $itt["window"].FindName("statusbar")
$itt.InstallBtn = $itt["window"].FindName("installBtn")
$itt.ApplyBtn = $itt["window"].FindName("applyBtn")
$itt.SearchInput = $itt["window"].FindName("searchInput")
$itt.installText = $itt["window"].FindName("installText")
$itt.installIcon = $itt["window"].FindName("installIcon")
$itt.applyText = $itt["window"].FindName("applyText")
$itt.applyIcon = $itt["window"].FindName("applyIcon")
$itt.QuoteIcon = $itt["window"].FindName("QuoteIcon")

#===========================================================================
#endregion Initialize WPF Controls
#===========================================================================