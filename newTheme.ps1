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
    <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="White"/>
    <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="WhiteSmoke"/>
    <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#1976d2" />
    <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
    <SolidColorBrush x:Key="TextColorPrimary" Color="Black" />
    <SolidColorBrush x:Key="TextColorSecondaryColor" Color="Black"/>
    <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#4B5361"/>
    <SolidColorBrush x:Key="BorderBrush" Color="#FFB3B3B3"/>
    <SolidColorBrush x:Key="ButtonBorderColor" Color="#525FE1"/>
    <SolidColorBrush x:Key="Label" Color="LightBlue"/>
    <SolidColorBrush x:Key="HighlightColor" Color="#098fd4"/>
    <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
    <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
    <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
    <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="black"/>
    <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="black"/>
    <Color x:Key="ListViewCardLeftColor">#f0f0f0</Color>
    <Color x:Key="ListViewCardRightColor">#ffffff</Color>
    <ImageBrush x:Key="BackgroundImage" ImageSource="{x:Null}" Stretch="UniformToFill"/>
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