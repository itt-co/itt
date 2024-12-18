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
    <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="Black"/>
    <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#FF111111"/>
    <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#FFB80000" />
    <SolidColorBrush x:Key="TextColorPrimary" Color="WhiteSmoke" />
    <SolidColorBrush x:Key="TextColorSecondaryColor" Color="White"/>
    <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#bbbbbb"/>
    <SolidColorBrush x:Key="BorderBrush" Color="#2b2d31" />
    <SolidColorBrush x:Key="ButtonBorderColor" Color="#1DB954"/>
    <SolidColorBrush x:Key="Label" Color="#3f3f3f"/>
    <SolidColorBrush x:Key="HighlightColor" Color="#FFB80000"/>
    <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
    <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
    <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
    <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#c9c9c7"/>
    <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#c9c9c7"/>
    <Color x:Key="ListViewCardLeftColor">#FF1B1B1B</Color> 
    <Color x:Key="ListViewCardRightColor">#FF1B1B1B</Color>
  </ResourceDictionary>
  <!-- Name {$themeName} -->
"@
  # Save the ResourceDictionary content to a file
  Set-Content -Path $fileName -Value $resourceDictionary
  # Output the location of the saved file
  Write-Output "The theme has been successfully generated and saved to: $fileName" -ForegroundColor Green
  Write-Output "Now, feel free to customize the colors and create your own cool theme!"
}
catch {
    Write-Host "An error occurred: $_"
}