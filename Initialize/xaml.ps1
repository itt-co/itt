# Set the maximum number of threads for the RunspacePool to the number of threads on the machine
$maxthreads = [int]$env:NUMBER_OF_PROCESSORS

# Create a new session state for parsing variables into our runspace
$hashVars = New-object System.Management.Automation.Runspaces.SessionStateVariableEntry -ArgumentList 'itt',$itt,$Null
$InitialSessionState = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()

# Add the variable to the session state
$InitialSessionState.Variables.Add($hashVars)

$desiredFunctions = @(
'Install-App' , 
'InvokeCommand' ,
'Add-Log',
'Disable-Service',
'Uninstall-AppxPackage',
'Finish',
'Message',
'Notify',
'UpdateUI',
'Native-Downloader',
'Install-Choco',
'ExecuteCommand',
'Set-Registry',
'Uninstall-AppxPackage',
'Set-Taskbar',
'Refresh-Explorer',
'Remove-ScheduledTasks'
)

$functions = Get-ChildItem function:\ | Where-Object { $_.Name -in $desiredFunctions }
foreach ($function in $functions) {
    # Directly retrieve the function definition
    $functionDefinition = (Get-Command $function.Name).ScriptBlock.ToString()
    $functionEntry = New-Object System.Management.Automation.Runspaces.SessionStateFunctionEntry -ArgumentList $($function.Name), $functionDefinition
    $initialSessionState.Commands.Add($functionEntry)

    # debug
    #if ($Debug) { Write-Output "Added function: $($function.Name)" }
}


# Create and open the runspace pool
$itt.runspace = [runspacefactory]::CreateRunspacePool(1, $maxthreads, $InitialSessionState, $Host)
$itt.runspace.Open()

[xml]$XAML = $MainWindowXaml

# Read the XAML file
$reader = [System.Xml.XmlNodeReader] $xaml

try {
    $itt["window"] = [Windows.Markup.XamlReader]::Load($reader)
}catch{
    Write-Host $_.Exception.Message # Capture the error message
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
            Set-ItemProperty -Path $itt.registryPath -Name "UserTheme" -Value "none" -Force
            Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -Force
            Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value "100" -Force
            Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value "On" -Force
        }

        try {
            # Attempt to get existing registry values
            $itt.Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme" -ErrorAction Stop).Theme
            $itt.CurretTheme = (Get-ItemProperty -Path $itt.registryPath -Name "UserTheme" -ErrorAction Stop).UserTheme
            $itt.Locales = (Get-ItemProperty -Path $itt.registryPath -Name "locales" -ErrorAction Stop).locales
            $itt.Music = (Get-ItemProperty -Path $itt.registryPath -Name "Music" -ErrorAction Stop).Music
            $itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -ErrorAction Stop).PopupWindow 
        }
        catch {
            # Creating missing registry keys
            if($Debug) {Add-Log -Message "An error occurred. Creating missing registry keys..." -Level "debug"}
            New-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -PropertyType String -Force *> $Null
            New-ItemProperty -Path $itt.registryPath -Name "UserTheme" -Value "none" -PropertyType String -Force *> $Null
            New-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -PropertyType String -Force *> $Null
            New-ItemProperty -Path $itt.registryPath -Name "Music" -Value "100" -PropertyType String -Force *> $Null
            New-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value "On" -PropertyType String -Force *> $Null
        }

    #===========================================================================
    #endregion Create default keys 
    #===========================================================================

    #===========================================================================
    #region Set Language based on culture
    #===========================================================================
        
        try {
            
            switch ($itt.Locales) {

                "default" {
                    
                    switch($shortCulture)
                    {
                        "ar" { $locale = "ar" }
                        "en" { $locale = "en" }
                        "fr" { $locale = "fr" }
                        "tr" { $locale = "tr" }
                        "zh" { $locale = "zh" }
                        "ko" { $locale = "ko" }
                        "de" { $locale = "de" }
                        "ru" { $locale = "ru" }
                        "es" { $locale = "es" }
                        "ga" { $locale = "ga" }

                        default { $locale = "en" }
                    
                    }
    
                }
                "ar" { $locale = "ar" }
                "en" { $locale = "en" }
                "fr" { $locale = "fr" }
                "tr" { $locale = "tr" }
                "zh" { $locale = "zh" }
                "ko" { $locale = "ko" }
                "de" { $locale = "de" }
                "ru" { $locale = "ru" }
                "es" { $locale = "es" }
                "ga" { $locale = "ga" }
                default { $locale = "en" }
            }
            $itt["window"].DataContext = $itt.database.locales.Controls.$locale
            $itt.Language = $locale
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

            $themeResource = switch($itt.Theme)
            {
                "Light"{
                    "Light"
                }
                "Dark"{
                    "Dark"
                }
                "Custom"{
                    $itt.CurretTheme

                }
                default{

                    switch ($appsTheme) 
                    {
                        "0" { "Dark" }
                        "1" { "Light" }
                    }

                }
            }

            $itt["window"].Resources.MergedDictionaries.Add($itt["window"].FindResource($themeResource))
            $itt.CurretTheme = $themeResource
        }
        catch {
            # Fall back to default theme if there error
            $fallback = switch($appsTheme)
            {
                "0" { "Dark" }
                "1" { "Light" }
            }

            Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
            Set-ItemProperty -Path $itt.registryPath -Name "UserTheme" -Value "none" -Force
            $itt["window"].Resources.MergedDictionaries.Add($itt["window"].FindResource($fallback))
            $itt.CurretTheme = $fallback
        }

    #===========================================================================
    #endregion Check theme settings
    #===========================================================================

    #===========================================================================
    #region Get user Settings from registry
    #===========================================================================
    $itt.mediaPlayer.settings.volume = "$($itt.Music)"

    switch($itt.Music){
        "100" { $itt["window"].title = "Install Tweaks Tool #StandWithPalestine 🔊"}
        "0" {$itt["window"].title = "Install Tweaks Tool #StandWithPalestine 🔈"}
    }

    $itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow").PopupWindow
    #===========================================================================
    #endregion Get user Settings from registry
    #===========================================================================
    
    # init taskbar icon
    $itt["window"].TaskbarItemInfo = New-Object System.Windows.Shell.TaskbarItemInfo
    Set-Taskbar -progress "None" -icon "logo"
}
catch {
    Write-Host "Error: $_"
}

# List Views


$itt.CurrentList
$itt.CurrentCategory


$itt.TabControl = $itt["window"].FindName("taps")
$itt.AppsListView = $itt["window"].FindName("appslist")
$itt.TweaksListView = $itt["window"].FindName("tweakslist")
$itt.SettingsListView = $itt["window"].FindName("SettingsList")

# Buttons and Inputs
$itt.Description = $itt["window"].FindName("description")
$itt.Quotes = $itt["window"].FindName("quotes")
$itt.InstallBtn = $itt["window"].FindName("installBtn")
$itt.ApplyBtn = $itt["window"].FindName("applyBtn")
$itt.SearchInput = $itt["window"].FindName("searchInput")
$itt.SearchIcon = $itt["window"].FindName("SearchIcon")
$itt.installText = $itt["window"].FindName("installText")
$itt.installIcon = $itt["window"].FindName("installIcon")
$itt.applyText = $itt["window"].FindName("applyText")
$itt.applyIcon = $itt["window"].FindName("applyIcon")
$itt.QuoteIcon = $itt["window"].FindName("QuoteIcon")




