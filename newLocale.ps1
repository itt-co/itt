Clear-Host
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

Write-Host "[!] Before adding your locale, first check if it exists in the locales directory."

try {
    
    $name = Read-Host "Language name"
    $locales = Read-Host "Locales code e.g ar"
    
    $csvFilePath = "$locales"

# Define the cOntent in the desired format
$table = @"
Key,Text
author,"NAME OF THE AUTHOR(S) OF THIS TRANSLATION",
name,"$name",
Welcome,
System_Info,
Power_Options,
Device_Manager,
Services,
Networks,
Apps_features,
Task_Manager,
Disk_Managment,
Install,
Apply,
Downloading,
About,
Third_party,
Preferences,
Management,
Apps,
Tweaks,
Settings,
Save,
Restore,
Music,
On,
Off,
Use_system_setting,
Create_desktop_shortcut,
Reset_preferences,
Please_reopen_itt_again.,
Theme,
Language,
MAS,
Win_Office,
IDM,
Browsers_extensions,
All,
Search,
Create_restore_point,
Portable_Downloads_Folder,
Install_msg,
Apply_msg,
Applying,
App_empty_select,
Tweak_empty_select,
Please_wait,
Last_update,
Exit_msg,
Happy_birthday,
My_playlist,
Empty_save_msg,
"@

    # Write the cOntent to the CSV file
    $csvFilePath = "locales/$csvFilePath.csv"

    Set-COntent -Path $csvFilePath -Value $table -Encoding UTF8
    Write-Host "Template saved at "$csvFilePath". You can edit the file using any CSV editor such as Excel, or Notepad++."
}
catch {
    Write-Host "An error occurred: $_"
}