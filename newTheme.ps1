Write-Host "
+-------------------------------------------------------------------------+
|    ___ _____ _____   ____    _  _____  _    ____    _    ____  _____    |
|   |_ _|_   _|_   _| |  _ \  / \|_   _|/ \  | __ )  / \  / ___|| ____|   |
|    | |  | |   | |   | | | |/ _ \ | | / _ \ |  _ \ / _ \ \___ \|  _|     |
|    | |  | |   | |   | |_| / ___ \| |/ ___ \| |_) / ___ \ ___) | |___    |
|   |___| |_|   |_|   |____/_/   \_\_/_/   \_\____/_/   \_\____/|_____|   |
|    Made with ♥  By Emad Adel                                            |
+-------------------------------------------------------------------------+
"
try {
  # Prompt the user for the name and author
  $themeName = Read-Host -Prompt "Enter theme name (e.g., The Dark Knight)"
  $authorName = Read-Host -Prompt "Enter author name (e.g., Emad Adel)"
  $Key = $themeName -replace , '[^\w]', ''
  # Define the path for the Theme folder
  $themeFolderPath = "themes"
  # Create the Theme folder if it doesn't exist
  if (-not (Test-Path -Path $themeFolderPath)) {
      New-Item -ItemType Directory -Path $themeFolderPath | Out-Null
  }
  # Define the file name based on the theme name
  $fileName = "$themeFolderPath\$($themeName -replace '_', '' -replace ' ', '' -replace '[^\w]', '').xaml"
  # Generate the ResourceDictionary content
  $resourceDictionary = @"
  <!-- {$themeName} -->
  <!-- by {$authorName} -->
  <ResourceDictionary x:Key="$Key">
  
    <!-- Backgrounds -->
    <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#ffffff"/>
    <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#f6f8fa"/>

    <!-- Text -->
    <SolidColorBrush x:Key="TextColorPrimary" Color="#24292f"/>
    <SolidColorBrush x:Key="TextColorSecondaryColor" Color="#1f2328"/>
    <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#57606a"/>

    <!-- Buttons and Highlights -->
    <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#0969da"/>
    <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="#ffffff"/>
    <SolidColorBrush x:Key="ButtonBorderColor" Color="#0969da"/>
    <SolidColorBrush x:Key="HighlightColor" Color="#218bff"/>

    <!-- Borders and Labels -->
    <SolidColorBrush x:Key="BorderBrush" Color="#d0d7de"/>
    <SolidColorBrush x:Key="Label" Color="#d8e0e7"/>

    <!-- Toggle Switch -->
    <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#d0d7de"/>
    <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#f6f8fa"/>
    <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
    <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#57606a"/>
    <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#d0d7de"/>

    <!-- ListView -->
    <SolidColorBrush x:Key="itemColor1" Color="#f6f8fa"/>
    <SolidColorBrush x:Key="itemColor2" Color="#ebf0f4"/>

    <!-- Misc -->
    <SolidColorBrush x:Key="logo" Color="#0969da"/>
    <ImageBrush x:Key="BackgroundImage" ImageSource="{x:Null}" Stretch="UniformToFill"/>
    <x:String x:Key="SubText">Install Tweaks Tool</x:String>

  </ResourceDictionary>
  <!-- Name {$themeName} -->
"@
  # Save the ResourceDictionary content to a file
  Set-Content -Path $fileName -Value $resourceDictionary
  # Output the location of the saved file
  Write-Output "Theme has been successfully generated and saved to: $fileName" -ForegroundColor Green
  Write-Output "Feel free to customize the colors and create your own cool theme!"
}
catch {
    Write-Host "An error occurred: $_"
}