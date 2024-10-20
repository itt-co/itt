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

# Define the content in the desired format
$table = @"
Key,Text
name,"$name",
Welcome,
installBtn,
applyBtn,
downloading,
about,
thirdparty,
preferences,
management,
apps,
tweaks,
settings,
saveapps,
loadapps,
music,
on,
off,
defaultTheme,
ittlink,
reset,
reopen,
theme,
language,
mas,
winoffice,
idm,
extensions,
all,
search,
restorepoint,
chocoloc,
InstallMessage,
ApplyMessage,
Applying,
choseapp,
chosetweak,
pleasewait,
lastupdate,
sourcecode,
devby,
exit,
watchdemo,
happybirthday,
myplaylist,
OneAppReq,
"@

    # Write the content to the CSV file
    $csvFilePath = "locales/$csvFilePath.csv"

    Set-Content -Path $csvFilePath -Value $table -Encoding UTF8
    Write-Host "Template saved at "$csvFilePath". You can edit the file using any CSV editor such as Excel, or Notepad++."
}
catch {
    Write-Host "An error occurred: $_"
}