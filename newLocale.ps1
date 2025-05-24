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
Write-Host "[!] Check the locales directory before adding a new Language." -ForegroundColor Yellow
try {
    $name = Read-Host "Enter language display name (e.g. English)"
    $locales = Read-Host "Enter language code (e.g. en)"
    $Author = Read-Host "Enter author name (e.g. Emad Adel)"
    $csvFilePath = "$locales"
# Define the cOntent in the desired format
$table = @"
Key,Text
author,"$Author",
name,"$name",
Welcome,Save time and install all your programs at once and debloat Windows and more. Be part of ITT and contribute to improving it
Install,Install
Apply,Apply
Downloading,Downloading...
About,About
Third_party,Third-party
Preferences,Preferences
Management,Management
Apps,Apps
Tweaks,Tweaks
Settings,Settings
Save,Save
Restore,Restore
Music,Music
On,On
Off,Off
Disk_Managment,Disk Managment
Msconfig,System Configuration
Environment_Variables,Environment Variables
Task_Manager,Task Manager
Apps_features,Programs and Features
Networks,Networks
Services,Services
Device_Manager,Device Manager
Power_Options,Power options
System_Info,System Info
Use_system_setting,Use system setting
Create_desktop_shortcut,Create desktop shortcut
Reset_preferences,Reset Preferences
Reopen_itt_again,Please reopen itt again.
Theme,Theme
Language,Language
Browsers_extensions,Browsers extensions
All,All
Search,Search
Create_restore_point,Create a restore point
Portable_Downloads_Folder,Portable Downloads Folder
Install_msg,Are you sure you want to install the following App(s)
Apply_msg,Are you sure you want to apply the following Tweak(s)
Applying,Applying...
Please_wait,Please wait a process is running in the background
Last_update,Last update
Exit_msg,Are you sure you want to close the program? Any ongoing installations will be canceled
Empty_save_msg,Choose at least One app to save it
easter_egg,Can you uncover the hidden secret? Dive into the source code be the first to discover the feature and integrate it into the tool
system_protection,System protection
web_browsers,🌐 Web Browsers
media,🎬 Media
media_tools,🎚 Media Tools
documents,📃 Documents
compression,📀 Compression
communication,📞 Communication
file_sharing,📁 File Sharing
imaging,📷 Imaging
gaming,🎮 Gaming
utilities,🔨 Utilities
disk_tools,💽 Disk Tools
development,👩‍💻 Development
security,🛡 Security
portable,💼 Portable
runtimes,📈 Runtimes
drivers,🔌 Drivers
privacy,🔒 Privacy
fixer,🔧 Fixer
performance,⚡ Performance
personalization,🎨 Personalization
power,🔋 Power
protection,🛡 Protection
classic,🕰 Classic
"@
    # Write the cOntent to the CSV file
    $csvFilePath = "locales/$csvFilePath.csv"
    Set-COntent -Path $csvFilePath -Value $table -Encoding UTF8
    Write-Host "Template saved at "$csvFilePath". You can edit the file using any CSV editor such as Excel, or VSCode."
}
catch {
    Write-Host "An error occurred: $_"
}