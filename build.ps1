param (
    [string]$OutputScript = "itt.ps1",
    [string]$readme = "README.md",
    [string]$Assets = ".\static",
    [string]$Controls = ".\xaml\Controls",
    [string]$DatabaseDirectory = ".\static\Database",
    [string]$StartScript = ".\Initialize\start.ps1",
    [string]$MainScript = ".\Initialize\main.ps1",
    [string]$ScritsDirectory = ".\scripts",
    [string]$windows = ".\xaml\Views",
    [string]$LoadXamlScript = ".\Initialize\xaml.ps1",
    [string]$Themes = "themes",
    [switch]$Debug,
    [switch]$Realsee,
    [string]$ProjectDir = $PSScriptRoot,
    [string]$localNodePath = "CHANGELOG.md",
    [string]$NoteUrl = "https://raw.githubusercontent.com/emadadel4/ITT/refs/heads/main/CHANGELOG.md"
)
# Initializeialize synchronized hashtable
$itt = [Hashtable]::Synchronized(@{})
$itt.database = @{}
$global:imageLinkMap = @{}
$global:localesMap = @{}
$global:TitleContent = ""
$global:DateContent = ""
function Update-Progress {
    param (
        [Parameter(Mandatory, position=0)]
        [string]$Status,
        [Parameter(Mandatory, position=1)]
        [ValidateRange(0,100)]
        [int]$PercentComplete ,
        [Parameter(position=2)]
        [string]$Activity = "Building"
    )
    Write-Progress -Activity $Activity -Status $Status -PercentComplete $PercentComplete 
}
# write content to output script
function WriteToScript {
    param (
        [string]$Content
    )
    $streamWriter = $null
    try {
        $streamWriter = [System.IO.StreamWriter]::new($OutputScript, $true)
        $streamWriter.WriteLine($Content)
    }
    finally {
        if ($null -ne $streamWriter) {
            $streamWriter.Dispose()
        }
    }
}
# Replace placeholder function
function ReplaceTextInFile {
    param (
        [string]$FilePath,
        [string]$TextToReplace,
        [string]$ReplacementText
    )
    Write-Host "Replace Placeholder" -ForegroundColor Yellow
    Update-Progress "$($MyInvocation.MyCommand.Name)" 30
    # Read the content of the file
    $content = Get-Content $FilePath
    # Replace the text
    $newContent = $content -replace [regex]::Escape($TextToReplace), $ReplacementText
    # Write the modified content back to the file
    $newContent | Out-File -FilePath $FilePath -Encoding utf8
}
# handle file content generation
function AddFileContentToScript {
    param (
        [string]$FilePath
    )
    $Content = Get-Content -Path $FilePath -Raw
    WriteToScript -Content $Content
}
# process files in a directory
function ProcessDirectory {
    param (
        [string]$Directory
    )
    Get-ChildItem $Directory -Recurse -File | ForEach-Object {
        if ($_.DirectoryName -ne $Directory) {
            AddFileContentToScript -FilePath $_.FullName
        }
    }
}
# Generate Checkboxex apps/tewaks/settings
function GenerateCheckboxes {
    param (
        [array]$Items,
        [string]$ContentField,
        [string]$TagField = "",
        [string]$TipsField = "",
        [string]$IsCheckedField = "",
        [string]$ToggleField = "",
        [string]$NameField = ""
    )
    Write-Host "Generate Checkboxes..." -ForegroundColor Yellow
    $Checkboxes = ""
    foreach ($Item in $Items) {
        # Clean description and category to remove special characters
        $CleanedDescription = $Item.Description -replace '[^\w\s./]', ''
        $CleanedCategory = $Item.Category -replace '[^\w\s]', ''
        # Get content from the specified content field
        $Content = $Item.$ContentField
        # Optional attributes for CheckBox based on fields
        $Tag = if ($TagField) { "Tag=`"$($Item.$TagField)`"" } else { "" }
        $Tips = if ($TipsField) { "ToolTip=`"Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository.`"" } else { "" }
        $Name = if ($NameField) { "Name=`"$($Item.$NameField)`"" } else { "" }
        $Toggle = if ($ToggleField) { "Style=`"{StaticResource ToggleSwitchStyle}`"" } else { "" }
        $IsChecked = if ($IsCheckedField) { "IsChecked=`"$($Item.$IsCheckedField)`"" } else { "" }
        # Build the CheckBox and its container
        $Checkboxes += @"
        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="$Content" $Tag $IsChecked $Toggle $Name $Tips FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="$CleanedCategory"/>
            </StackPanel>
            <TextBlock Width="800" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="$CleanedDescription."/>
        </StackPanel>
"@
    }
    return $Checkboxes
}
# Process each JSON file in the specified directory
function Sync-JsonFiles {
    param (
        [Parameter(Mandatory = $true)]
        [string]$DatabaseDirectory,
        [Parameter(Mandatory = $true)]
        [string]$OutputScriptPath
    )
    Get-ChildItem $DatabaseDirectory | Where-Object {$_.Extension -eq ".json"} | ForEach-Object {
        # Get the content of the JSON file as raw text
        $json = Get-Content $_.FullName -Raw
        # Cache json file into $itt.database
        $itt.database.$($_.BaseName) = $json | ConvertFrom-Json
        # Prepare the output with the @' and '@ format
        $output = "`$itt.database.$($_.BaseName) = @'`n$json`n'@ | ConvertFrom-Json"
        # Write the output to the script file
        Write-Output $output | Out-File $OutputScriptPath -Append -Encoding Default
    }
}
# Update app tweaks etc count.. from README.MD
function Update-Readme {
    param (
        [string]$OriginalReadmePath = "Templates\README.md",
        [string]$NewReadmePath = "README.md"
    )
    Write-Host "Update Readme..." -ForegroundColor Yellow
    # Read the content of the original README.md file
    $readmeContent = Get-Content -Path $OriginalReadmePath -Raw
    $badgeUrl = "https://img.shields.io/badge/Latest Update-$(Get-Date -Format 'MM/dd/yyy')-blue?style=for-the-badge"
    # Prepare values for the placeholders
    $applicationsCount = $itt.database.Applications.Count
    $tweaksCount = $itt.database.Tweaks.Count
    $quotesCount = $itt.database.Quotes.Quotes.Count
    $tracksCount = $itt.database.OST.Tracks.Count
    $settingsCount = $itt.database.Settings.Count
    $localesCount = ($itt.database.locales.Controls.PSObject.Properties | Measure-Object).Count
    # Create a hashtable for placeholders and their replacements
    $placeholders = @{
        "#{a}" = $applicationsCount
        "#{t}" = $tweaksCount
        "#{q}" = $quotesCount
        "#{OST}" = $tracksCount
        "#{s}" = $settingsCount
        "#{loc}" = $localesCount
        "#{last}" = $badgeUrl
    }
    # Replace placeholders in a single pass
    $updatedContent = $readmeContent
    foreach ($key in $placeholders.Keys) {
        $updatedContent = $updatedContent -replace [regex]::Escape($key), $placeholders[$key]
    }
    # Write the updated content to the new README.md file
    Set-Content -Path $NewReadmePath -Value $updatedContent -Encoding UTF8
    Write-Host `n`
    # Output the counts to the console in one go
    Write-Host "Apps $applicationsCount`nTweaks $tweaksCount`nQuotes $quotesCount`nTracks $tracksCount`nSettings $settingsCount`nLocales $localesCount" -ForegroundColor Yellow
}
# Add New Contributor to Contributor.md and show his name in about window
function NewCONTRIBUTOR {
    # Define paths
    $gitFolder = ".git"
    $contribFile = "CONTRIBUTING.md"
    $xamlFile = "Templates\about.xaml"
    $updatedXamlFile = "xaml\views\AboutWindow.xaml" 
    Update-Progress "Check for new contributor..." 40
    # Function to get GitHub username from .git folder
    function Get-GitHubUsername {
        $configFile = Join-Path $gitFolder "config"
        if (Test-Path $configFile) {
            $configContent = Get-Content $configFile -Raw
            if ($configContent -match 'url\s*=\s*https?://github.com/([^/]+)/') {
                return $matches[1]
            }
        }
        return $null
    }
    # Get GitHub username
    $username = Get-GitHubUsername
    if (-not $username) {
        Write-Error "GitHub username not found in .git/config."
        exit 1
    }
    # Read CONTRIBUTORS.md content and ensure username is unique
    if (Test-Path $contribFile) {
        $contribLines = Get-Content $contribFile | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" } | Sort-Object -Unique
        if ($username -notin $contribLines) {
            Add-Content $contribFile $username
            $contribLines += $username
        }
    } else {
        # Create CONTRIBUTORS.md if it doesn't exist and add the username
        Set-Content $contribFile $username
        $contribLines = @($username)
    }
    # Read the existing XAML file content
    $MainXamlContent = Get-Content $xamlFile -Raw
    # Create a StringBuilder for TextBlock elements
    $stringBuilder = New-Object System.Text.StringBuilder
    # Generate unique TextBlock elements for each name in CONTRIBUTORS.md
    foreach ($name in $contribLines) {
        [void]$stringBuilder.AppendLine("<TextBlock Text='$name' Margin='1' Foreground='{DynamicResource TextColorSecondaryColor2}' />")
    }
    # Replace #{names} in the XAML file with the TextBlock elements
    $newXamlContent = $MainXamlContent -replace '#{names}', $stringBuilder.ToString()
    # Write the updated content to the new XAML file
    Set-Content -Path $updatedXamlFile -Value $newXamlContent -Encoding UTF8
}
function ConvertTo-Xaml {
    param (
        [string]$text,
        [string]$HeadlineFontSize = 20,
        [string]$DescriptionFontSize = 15
    )
    Write-Host "Generate Events Window Content..." -ForegroundColor Yellow
    # Initialize XAML as an empty string
    $xaml = ""
    # Process each line of the input text
    foreach ($line in $text -split "`n") {
        switch -Regex ($line) {
            "^###### (.+)"{
                $global:DateContent += $matches[1].Trim()
            }
            "!\[itt\.xName:(.+?)\s*\[(.+?)\]\]\((.+?)\)" {
                $xaml += "<Image x:Name=''$($matches[1].Trim())'' Source=''$($matches[3].Trim())'' Cursor=''Hand'' Margin=''0,0,0,0'' Height=''Auto'' Width=''400''/>`n"
                $link = $matches[2].Trim()   # Extract the link from inside the brackets
                $name = $matches[1].Trim()   # Extract the xName after 'tt.xName:'
                $global:imageLinkMap[$name] = $link
            }
            "^## (.+)" { # Event title
                $global:TitleContent += $matches[1].Trim()
            }
            "^### (.+)" { # Headline 
                $text = $matches[1].Trim()
                $xaml += "<TextBlock Text=''$text'' FontSize=''$HeadlineFontSize'' Margin=''0,18,0,18'' FontWeight=''Bold'' Foreground=''{DynamicResource PrimaryButtonForeground}'' TextWrapping=''Wrap''/>`n"
            }
            "^##### (.+)" { ##### Headline
                $text = $matches[1].Trim()  
                $xaml += "<TextBlock Text='' • $text'' FontSize=''$HeadlineFontSize'' Margin=''0,18,0,18'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>`n" 
            }
            "^#### (.+)" { #### Description
                $text = $matches[1].Trim()  
                $xaml += "<TextBlock Text=''$text'' FontSize=''$DescriptionFontSize'' Margin=''8''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>`n" 
            }
            "^- (.+)" { # - Lists
                $text = $matches[1].Trim()  
                $xaml += "
                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• $text'' Margin=''15,0,0,0'' FontSize=''$DescriptionFontSize'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                `n" 
            }
        }
    }
    return $xaml
}
# Generate themes menu items
function GenerateThemesKeys {
    param (
        [string]$ThemesPath = "themes"
    )
    Write-Host "Generate Themes Keys..." -ForegroundColor Yellow
    # Validate the path
    if (-Not (Test-Path $ThemesPath)) {
        Write-Host "The specified path does not exist: $ThemesPath"
        return
    }
    # Create a StringBuilder for better performance on string concatenation
    $stringBuilder = New-Object System.Text.StringBuilder
    # Generate MenuItem entries for each file in the themes folder
    Get-ChildItem -Path $ThemesPath -File | ForEach-Object {
        # Read the content of each file
        $content = Get-Content $_.FullName -Raw
        # Use regex to extract content inside curly braces for Header and x:Key value
        $header = if ($content -match '\{(.*?)\}') { $matches[1] } else { "Unknown" }
        $name = if ($content -match 'x:Key="(.*?)"') { $matches[1] } else { "No Key" }
        # Append the MenuItem entry to the StringBuilder
        $null = $stringBuilder.AppendFormat("<MenuItem Name=`"{0}`" Header=`"{1}`"/>`n", $name, $header)
    }
    # Convert StringBuilder to string and return the output
    return $stringBuilder.ToString().TrimEnd("`n".ToCharArray())  # Remove the trailing newline
}
function GenerateLocalesKeys {
    param (
        [string]$localesPath = "locales"
    )
    Write-Host "Generate Locales Keys..." -ForegroundColor Yellow
    # Validate the path
    if (-Not (Test-Path $localesPath)) {
        Write-Host "The specified path does not exist: $ThemesPath"
        return
    }
    $stringBuilder = New-Object System.Text.StringBuilder
    Get-ChildItem -Path $localesPath -Filter *.csv | ForEach-Object {
        $csvData = Import-Csv -Path $_.FullName
        $language = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
        foreach ($row in $csvData) {
            if ($row.Key -eq 'name') {
                $name = $row.Text
            }
        }
        $null = $stringBuilder.AppendFormat("<MenuItem Name=`"{0}`" Header=`"{1}`"/>`n", "$language", "$name")
    }
    return $stringBuilder.ToString().TrimEnd("`n".ToCharArray())  # Remove the trailing newline
}
function GenerateClickEventHandlers {
    Write-Host "Generate Click Event Handlers..." -ForegroundColor Yellow
    try {
        # Define file paths for scripts and templates
        $FilePaths = @{
            "EventWindowScript" = Join-Path -Path "templates" -ChildPath "Show-Event.ps1"
        }
        # Read the content of the event window script file
        $EventWindowScript  = Get-Content -Path $FilePaths["EventWindowScript"] -Raw
        # Initialize an empty string to hold event handler code
        $EventHandler = ""
        # Loop through each key in the global image link map
        foreach ($name  in $global:imageLinkMap.Keys) 
        {
            # Get the URL corresponding to the current image link name
            $url = $imageLinkMap[$name]
            # Append a mouse click event handler for each image link
            $EventHandler += 
            "
            `$itt.event.FindName('$name').add_MouseLeftButtonDown({
                    Start-Process('$url')
                })
            `
            "
        }
        # Create the event title assignment using the extracted content
        $EventTitle = "
        `$itt.event.FindName('title').text = '$global:TitleContent'`.Trim()
        `$itt.event.FindName('date').text = '$global:DateContent'`.Trim()
        "
        # Replace placeholders in the event window script with actual event handlers and title
        $EventWindowScript = $EventWindowScript -replace '#{contorlshandler}', $EventHandler
        $EventWindowScript = $EventWindowScript -replace '#{title}', $EventTitle
        # Write the modified content back to the script
        WriteToScript -Content $EventWindowScript
    }
    catch {
        Write-Host $_.Exception.Message # Capture the error message
    }
}
# Generate GenerateInvokeButtons
function GenerateInvokeButtons {
    Write-Host "Generate InvokeButtons..." -ForegroundColor Yellow
    # Define file paths for the Invoke button template
    $FilePaths = @{
        "Invoke" = Join-Path -Path "templates" -ChildPath "Invoke-Button.ps1"
    }
    try {
        # Read the content of the Invoke-Button.ps1 file
        $InvokeContent = Get-Content -Path $FilePaths["Invoke"] -Raw
        $menuItems = Get-ChildItem -Path "themes" -File | ForEach-Object {
            # Get the filename without its extension
            $filename = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
            $Key = $filename -replace '[^\w]', ''
            @"
            "$Key" {
                Set-Theme -Theme `$action
                # debug start
                Debug-Message
                # debug end
            }
"@
        }
         $LanguageItems = Get-ChildItem -Path "locales" -File | ForEach-Object {
            # Get the filename without its extension
            $filename = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
            # Remove non-word characters to create a valid key
            $Key = $filename -replace '[^\w]', ''
            # Create a MenuItem block for each theme
            @"
            "$Key" {
                Set-Language -lang "$Key"
                # debug start
                `Debug-Message $action
                # debug end
            }
"@
        }
        $menuItemsOutput = $menuItems -join "`n"
        $LanguageItemsItemsOutput = $LanguageItems -join "`n"
        $InvokeContent = $InvokeContent -replace '#{locales}', "$LanguageItemsItemsOutput"
        $InvokeContent = $InvokeContent -replace '#{themes}', "$menuItemsOutput"
        WriteToScript -Content $InvokeContent
    }
    catch {
        Write-Host $_.Exception.Message 
    }
}
# Generate Locales
function Convert-Locales {
    param (
        [string]$csvFolderPath = "locales", 
        [string]$jsonOutputPath = "static/Database/locales.json"
    )
    Write-Host "Convert Locales CSV Files..." -ForegroundColor Yellow
    # Initialize an OrderedDictionary to store the "Controls" object
    $locales = @{
        "Controls" = [System.Collections.Specialized.OrderedDictionary]@{}
    }
    # Get all CSV files in the specified folder and process each one
    Get-ChildItem -Path $csvFolderPath -Filter *.csv | ForEach-Object {
        # Import the content of the current CSV file
        $csvData = Import-Csv -Path $_.FullName
        # Extract the filename without the extension to use as the language key
        $language = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
        # If the language key doesn't already exist in the Controls object, add it
        if (-not $locales["Controls"].Contains($language)) {
            $locales["Controls"][$language] = [System.Collections.Specialized.OrderedDictionary]@{}  # Use OrderedDictionary
        }
        # Loop through each row of the CSV file and add the key-value pairs to the respective language section
        foreach ($row in $csvData) {
            $locales["Controls"][$language][$row.Key] = $row.Text
        }
    }
    # Convert the hashtable to JSON format and save it to the specified output path
    $jsonOutput = $locales | ConvertTo-Json -Depth 10 -Compress
    # Read existing JSON content if the file exists
    $existingJsonOutput = if (Test-Path $jsonOutputPath) { Get-Content $jsonOutputPath -Raw } else { "" }
    # Normalize both JSON outputs for comparison
    $jsonOutputNormalized = $jsonOutput | ConvertFrom-Json | ConvertTo-Json -Depth 10
    $existingJsonOutputNormalized = $existingJsonOutput | ConvertFrom-Json | ConvertTo-Json -Depth 10
    # Write the JSON to the specified file only if it has changed
    if ($existingJsonOutputNormalized -ne $jsonOutputNormalized) {
        Set-Content -Path $jsonOutputPath -Value $jsonOutput -Encoding UTF8
        Write-Host "JSON file updated." -ForegroundColor Green
    } else {
        Write-Host "No changes detected. JSON file not updated." -ForegroundColor Yellow
    }
}

# comparison itt.ps1 remove all comments and space
function Realsee {
  
    try {
        Write-Host "Removing all debug comments and unnecessary content..." -ForegroundColor Yellow
        $FilePath = $OutputScript
        $Content = Get-Content -Path $FilePath -Raw
        $Content = $Content -replace '(#\s*debug start[\s\S]*?#\s*debug end)', ''
        $Content = $Content -replace '<#[\s\S]*?#>', ''
        $Content = ($Content -split "`r?`n" | ForEach-Object {
            ($_ -replace '^\s*#.*$', '').Trim()
        }) -join "`n"
        #$Content = $Content -replace '(\r?\n){2,}', "`n"
        $Content = ($Content -split "`r?`n" | Where-Object { $_ -notmatch '^\s*$' }) -join "`n"
        Set-Content -Path $FilePath -Value $Content
    }
    catch {
        Write-Error "An error occurred: $_" -ForegroundColor Red
    }

}
# Write script header
function WriteHeader {
    WriteToScript -Content @"
######################################################################################
#      ___ _____ _____   _____ __  __    _    ____       _    ____  _____ _          #
#     |_ _|_   _|_   _| | ____|  \/  |  / \  |  _ \     / \  |  _ \| ____| |         #
#      | |  | |   | |   |  _| | |\/| | / _ \ | | | |   / _ \ | | | |  _| | |         #
#      | |  | |   | |   | |___| |  | |/ ___ \| |_| |  / ___ \| |_| | |___| |___      #
#     |___| |_|   |_|   |_____|_|  |_/_/   \_\____/  /_/   \_\____/|_____|_____|     #
#                Automatically generated from build don't play here :)               # 
#                              #StandWithPalestine                                   #
# https://github.com/emadadel4                                                       #
# https://t.me/emadadel4                                                             #
# https://emadadel4.github.io/posts/itt                                              #
######################################################################################
"@
}
# Main script generation
try {
    if (Test-Path -Path $OutputScript) {
        Remove-Item -Path $OutputScript -Force
    }
    WriteHeader
    WriteToScript -Content @"
#===========================================================================
#region Begin Start
#===========================================================================
"@
    AddFileContentToScript -FilePath $StartScript
    ReplaceTextInFile -FilePath $OutputScript -TextToReplace '#{replaceme}' -ReplacementText "$(Get-Date -Format 'MM/dd/yyy')"
    WriteToScript -Content @"
#===========================================================================
#endregion End Start
#===========================================================================
"@
    WriteToScript -Content @"
#===========================================================================
#region Begin Database /APPS/TWEEAKS/Quotes/OST/Settings
#===========================================================================
"@
    Convert-Locales
    Sync-JsonFiles -DatabaseDirectory $DatabaseDirectory -OutputScriptPath $OutputScript
    WriteToScript -Content @"
#===========================================================================
#endregion End Database /APPS/TWEEAKS/Quotes/OST/Settings
#===========================================================================
"@
    # Write Main section
    WriteToScript -Content @"
#===========================================================================
#region Begin Main Functions
#===========================================================================
"@
    GenerateInvokeButtons
    ProcessDirectory -Directory $ScritsDirectory
    WriteToScript -Content @"
#===========================================================================
#endregion End Main Functions
#===========================================================================
"@
WriteToScript -Content @"
#===========================================================================
#region Begin WPF Main Window
#===========================================================================
"@
    # Define file paths
    $FilePaths = @{
        "MainWindow"    = Join-Path -Path $windows -ChildPath "MainWindow.xaml"
        "taps" = Join-Path -Path $Controls -ChildPath "taps.xaml"
        "menu" = Join-Path -Path $Controls -ChildPath "menu.xaml"
        "catagory" = Join-Path -Path $Controls -ChildPath "catagory.xaml"
        "search" = Join-Path -Path $Controls -ChildPath "search.xaml"
        "buttons" = Join-Path -Path $Controls -ChildPath "buttons.xaml"
        "Style"   = Join-Path -Path $Assets -ChildPath "Themes/Styles.xaml"
        "Colors"  = Join-Path -Path $Assets -ChildPath "Themes/Colors.xaml"
    }
    # Read and replace placeholders in XAML content
    try {
        # Read content from files
        $MainXamlContent     = (Get-Content -Path $FilePaths["MainWindow"] -Raw) -replace "'", "''"
        $AppXamlContent  = Get-Content -Path $FilePaths["taps"] -Raw
        $StyleXamlContent    = Get-Content -Path $FilePaths["Style"] -Raw
        $ColorsXamlContent   = Get-Content -Path $FilePaths["Colors"] -Raw
        $MenuXamlContent     = Get-Content -Path $FilePaths["menu"] -Raw
        $ButtonsXamlContent  = Get-Content -Path $FilePaths["buttons"] -Raw
        $CatagoryXamlContent = Get-Content -Path $FilePaths["catagory"] -Raw
        $searchXamlContent   = Get-Content -Path $FilePaths["search"] -Raw
        # Replace placeholders with actual content
        $MainXamlContent = $MainXamlContent -replace "{{Taps}}", $AppXamlContent
        $MainXamlContent = $MainXamlContent -replace "{{Style}}", $StyleXamlContent
        $MainXamlContent = $MainXamlContent -replace "{{Colors}}", $ColorsXamlContent
        $MainXamlContent = $MainXamlContent -replace "{{menu}}", $MenuXamlContent
        $MainXamlContent = $MainXamlContent -replace "{{buttons}}", $ButtonsXamlContent
        $MainXamlContent = $MainXamlContent -replace "{{catagory}}", $CatagoryXamlContent
        $MainXamlContent = $MainXamlContent -replace "{{search}}", $searchXamlContent
    } catch {
        Write-Error "An error occurred while processing the XAML content: $($_.Exception.Message)"
    }
    $AppsCheckboxes = GenerateCheckboxes -Items $itt.database.Applications -ContentField "Name" -TagField "Category" -IsCheckedField "check" -TipsField "show"
    $TweaksCheckboxes = GenerateCheckboxes -Items $itt.database.Tweaks -ContentField "Name" -TagField "Category" -IsCheckedField "check"
    $SettingsCheckboxes = GenerateCheckboxes -Items $itt.database.Settings -ContentField "Content" -NameField "Name" -ToggleField "Style="{StaticResource ToggleSwitchStyle}""
    $MainXamlContent = $MainXamlContent -replace "{{Apps}}", $AppsCheckboxes 
    $MainXamlContent = $MainXamlContent -replace "{{Tweaks}}", $TweaksCheckboxes 
    $MainXamlContent = $MainXamlContent -replace "{{Settings}}", $SettingsCheckboxes 
    $MainXamlContent = $MainXamlContent -replace "{{ThemesKeys}}", (GenerateThemesKeys)
    $MainXamlContent = $MainXamlContent -replace "{{LocalesKeys}}", (GenerateLocalesKeys)
    # Get xaml files from Themes and put it inside MainXamlContent
    $ThemeFilesContent = Get-ChildItem -Path "$Themes" -File | 
    ForEach-Object { Get-Content $_.FullName -Raw } | 
    Out-String
    $MainXamlContent = $MainXamlContent -replace "{{CustomThemes}}", $ThemeFilesContent 
    # Final output
    WriteToScript -Content "`$MainWindowXaml = '$MainXamlContent'"
    # Signup a new CONTRIBUTOR
    NewCONTRIBUTOR
    WriteToScript -Content @"
#===========================================================================
#endregion End WPF Main Window
#===========================================================================
"@
WriteToScript -Content @"
#===========================================================================
#region Begin WPF About Window
#===========================================================================
"@
    # Define file paths
    $FilePaths = @{
        "about" = Join-Path -Path $windows -ChildPath "AboutWindow.xaml"
    }
    # Read and replace placeholders in XAML content
    try {
        $AboutWindowXamlContent = (Get-Content -Path $FilePaths["about"] -Raw) -replace "'", "''"
    } catch {
        Write-Error "Error: $($_.Exception.Message)"
    }
    WriteToScript -Content "`$AboutWindowXaml = '$AboutWindowXamlContent'"
    WriteToScript -Content @"
#===========================================================================
#endregion End WPF About Window
#===========================================================================
"@
WriteToScript -Content @"
#===========================================================================
#region Begin WPF Event Window
#===========================================================================
"@
    # Define file paths
    $FilePaths = @{
        "event" = Join-Path -Path $windows -ChildPath "EventWindow.xaml"
    }
    # Read and replace placeholders in XAML content
    try {
        $EventWindowXamlContent = (Get-Content -Path $FilePaths["event"] -Raw) -replace "'", "''"
        # debug offline local file
        $textContent = Get-Content -Path $localNodePath -Raw
        $xamlContent = ConvertTo-Xaml -text $textContent
        GenerateClickEventHandlers
        $EventWindowXamlContent = $EventWindowXamlContent -replace "UpdateContent", $xamlContent
        WriteToScript -Content "`$EventWindowXaml = '$EventWindowXamlContent'"
    } catch {
        Write-Error "Error: $($_.Exception.Message)"
    }
    WriteToScript -Content @"
#===========================================================================
#endregion End WPF Event Window
#===========================================================================
"@
    WriteToScript -Content @"
#===========================================================================
#region Begin loadXmal
#===========================================================================
"@
    AddFileContentToScript -FilePath $LoadXamlScript
    WriteToScript -Content @"
#===========================================================================
#endregion End loadXmal
#===========================================================================
"@
    # Write Main section
    WriteToScript -Content @"
#===========================================================================
#region Begin Main
#===========================================================================
"@
    #ProcessDirectory -Directory $ScritsDirectory
    AddFileContentToScript -FilePath $MainScript
    WriteToScript -Content @"
#===========================================================================
#endregion End Main
#===========================================================================
"@

if($Realsee){
    Realsee
}

if($Debug)
{
    Write-Host " `n`Debug mode..." -ForegroundColor Green
    $script = "& '$ProjectDir\$OutputScript'"
    $pwsh = if (Get-Command pwsh -ErrorAction SilentlyContinue) { "pwsh" } else { "powershell" }
    $wt = if (Get-Command wt.exe -ErrorAction SilentlyContinue) { "wt.exe" } else { $pwsh }
    Start-Process $wt -ArgumentList "$pwsh -NoProfile -Command $script -Debug"

}

    Update-Readme
    Write-Host " `n`Build successfully" -ForegroundColor Green
}
catch {
    Write-Error "An error occurred: $_"
}