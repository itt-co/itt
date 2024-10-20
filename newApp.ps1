param (
    [string]$json = "./Statics/Database/Applications.json"
)

Clear-Host
Write-Host "
+-------------------------------------------------------------------------+
|    ___ _____ _____   ____    _  _____  _    ____    _    ____  _____    |
|   |_ _|_   _|_   _| |  _ \  / \|_   _|/ \  | __ )  / \  / ___|| ____|   |
|    | |  | |   | |   | | | |/ _ \ | | / _ \ |  _ \ / _ \ \___ \|  _|     |
|    | |  | |   | |   | |_| / ___ \| |/ ___ \| |_) / ___ \ ___) | |___    |
|   |___| |_|   |_|   |____/_/   \_\_/_/   \_\____/_/   \_\____/|_____|   |
|    Made with ♥  By Emad Adel                                            |
|                                                                         |
|  Choco https://community.chocolatey.org/packages                        |
|  Winget https://winget.run/                                             |
+-------------------------------------------------------------------------+
"
$validCategories = @{

    # Available options

    1 = "API [Choco/Winget] Recommended"

    2 = "Default [HttpClient]" 
}

# Prompt user to choose mothed
do {
    Write-Host "Which method to download this app will be?:"
    foreach ($key in $validCategories.Keys | Sort-Object) {
        Write-Host "$key - $($validCategories[$key])"
    }
    $choice = Read-Host "Enter the number corresponding to the methods"
    if ([int]$choice -in $validCategories.Keys) {
        $userInput = $validCategories[[int]$choice]
    } else {
        Write-Host "Invalid choice. Please select a valid option."
    }
} until ([int]$choice -in $validCategories.Keys)

# Read User Input.
$userInput

function Check {
    param (
        [string]$choco,
        [string]$winget
    )
    
    $jsonContent = Get-Content -Path $json -Raw | ConvertFrom-Json

    foreach ($item in $jsonContent) 
    {
        if ($item.choco -eq $choco -and $item.choco -ne "none")
        {
            Write-Host "($choco) already exists!" -ForegroundColor Yellow
            exit

        } elseif ($item.winget -eq $winget -and $item.winget -ne "none") 
        {
            Write-Host "($winget) already exists!" -ForegroundColor Yellow
            exit
        }
    }

}

#===========================================================================
#region Native Downloader 
#===========================================================================
function Native {


if($userInput -eq "Default [HttpClient]")
{

$AppName = Read-Host "Enter App name"
$description = [regex]::Replace((Read-Host "Enter app description").Trim(), "[^\w\s]", "")
$url = Read-Host "Enter URL Download file"

#===========================================================================
#region Begin Extinction Prompt
#===========================================================================

$Extinction = @{
    1 = "exe"
    2 = "msi"
    3 = "rar"
    4 = "zip"
}
# Prompt user to choose Excute
do {
    Write-Host "What extension is this file?"
    foreach ($key in $Extinction.Keys | Sort-Object) {
        Write-Host "$key - $($Extinction[$key])"
    }
    $choice = Read-Host "Enter the number corresponding to the option"
    if ([int]$choice -in $Extinction.Keys) {
        $type = $Extinction[[int]$choice]
    } else {
        Write-Host "Invalid choice. Please select a valid option."
    }
} until ([int]$choice -in $Extinction.Keys)

#===========================================================================
#endregion Extinction
#===========================================================================

#===========================================================================
#region Begin IsExcute Prompt
#===========================================================================

$IsExcute = @{
    1 = "false"
    2 = "true"
}

# Prompt user to choose Excute
do {
    Write-Host "Is Excute file? .exe"
    foreach ($key in $IsExcute.Keys | Sort-Object) {
        Write-Host "$key - $($IsExcute[$key])"
    }
    $choice = Read-Host "Enter the number corresponding to the option"
    if ([int]$choice -in $IsExcute.Keys) {
        $Excute = $IsExcute[[int]$choice]
    } else {
        Write-Host "Invalid choice. Please select a valid option."
    }
} until ([int]$choice -in $IsExcute.Keys)



#===========================================================================
#endregion IsExcute
#===========================================================================

#===========================================================================
#region Begin runAfterDownload Prompt
#===========================================================================

$runAfterDownload = @{
    1 = "yes"
    2 = "no"
}

# Prompt user to choose Excute
do {
    Write-Host "Run aftar download?"
    foreach ($key in $runAfterDownload.Keys | Sort-Object) {
        Write-Host "$key - $($runAfterDownload[$key])"
    }
    $choice = Read-Host "Enter the number corresponding to the option"
    if ([int]$choice -in $runAfterDownload.Keys) {
        $run = $runAfterDownload[[int]$choice]
    } else {
        Write-Host "Invalid choice. Please select a valid option."
    }
} until ([int]$choice -in $runAfterDownload.Keys)



#===========================================================================
#endregion runAfterDownload
#===========================================================================

#===========================================================================
#region Args/launcher/type Prompt
#===========================================================================

# Prompt the user to enter a silent argument for installation
$exeArgs = Read-Host "Enter Silent argmanet: If not silent installation press enter to skip"
if ($exeArgs -eq "") { $exeArgs = "/verysilent" }  # Set default value if empty

# Prompt the user to enter the launcher name (e.g., the executable file)
$launcher = Read-Host "Enter Launcher name [filename.exe]"
if ($launcher -eq "") { $launcher = "none" }  # Set default value if empty

# Check if the installation type is MSI, in which case override the arguments with MSI-specific ones
if($type -eq "msi") {$exeArgs = "/quiet"} # Set default for msi
#===========================================================================
#endregion Args/launcher/type
#===========================================================================

#===========================================================================
#region Begin CreateShourtcut Prompt
#===========================================================================

$CreateShourtcut = @{
    1 = "yes"
    2 = "no"
}

# Prompt user to choose Excute
do {
    Write-Host "Create shourtcut on desktop?"
    foreach ($key in $CreateShourtcut.Keys | Sort-Object) {
        Write-Host "$key - $($CreateShourtcut[$key])"
    }
    $choice = Read-Host "Enter the number corresponding to the option"
    if ([int]$choice -in $CreateShourtcut.Keys) {
        $shourtcut = $CreateShourtcut[[int]$choice]
    } else {
        Write-Host "Invalid choice. Please select a valid option."
    }
} until ([int]$choice -in $CreateShourtcut.Keys)



#===========================================================================
#endregion CreateShourtcut
#===========================================================================

#===========================================================================
#region Begin Categories Prompt
#===========================================================================

# Define category options
$validCategories = @{
    1 = "Web Browsers"
    2 = "Media"
    3 = "Media Tools"
    4 = "Documents"
    5 = "Compression"
    6 = "Communication"
    7 = "Gaming"
    8 = "Imaging"
    9 = "Drivers"
    10 = "Utilities"
    11 = "Disk Tools"
    12 = "File Sharing"
    13 = "Development"
    14 = "Runtimes"
    15 = "Portable"
    16 = "Security"
}

# Prompt user to choose category
do {
    Write-Host "Which category this app will be?:"
    foreach ($key in $validCategories.Keys | Sort-Object) {
        Write-Host "$key - $($validCategories[$key])"
    }
    $choice = Read-Host "Enter the number corresponding to the category"
    if ([int]$choice -in $validCategories.Keys) {
        $category = $validCategories[[int]$choice]
    } else {
        Write-Host "Invalid choice. Please select a valid option."
    }
} until ([int]$choice -in $validCategories.Keys)
#===========================================================================
#endregion Categories
#===========================================================================

# Define the data
$data = @{
    "name" = $AppName
    "description" = $description
    "winget" = "none"
    "choco" = "none"
    "scoop" = "none"
    "default" = @(
        @{
            "IsExcute" = $Excute
            "url" = $url
            "extinction" = $type
            "exeArgs" = $exeArgs
            "output" = "none"
            "launcher" = $launcher
            "shortcut" = $shourtcut
            "run" = $run
        }
    )
    "category" = $category
    "check" = "false"
}

# Convert to JSON string
$jsonString = @"
{
    "name": "$($data["name"])",
    "description": "$($data["description"])",
    "winget": "none",
    "choco": "none",
    "scoop": "none",
    "default": [
        {
            "IsExcute": "$($data["default"][0]["IsExcute"])",
            "url": "$($data["default"][0]["url"])",
            "extinction": "$($data["default"][0]["extinction"])",
            "exeArgs": "$($data["default"][0]["exeArgs"])",
            "output": "$($data["default"][0]["output"])",
            "launcher": "$($data["default"][0]["launcher"])",
            "shortcut": "$($data["default"][0]["shortcut"])",
            "run": "$($data["default"][0]["run"])"
        }
    ],
    "category": "$($data["category"])",
    "check": "false"
}
"@

# Read existing JSON file
$existingJson = Get-Content -Path $json | ConvertFrom-Json

# Append new data to existing JSON
$existingJson += $jsonString | ConvertFrom-Json

# Convert to JSON string
$updatedJson = $existingJson | ConvertTo-Json -Depth 100

# Output to file
$updatedJson | Out-File -FilePath $json -Encoding utf8

Write-Host "Added successfully, Don't forget to build and test it before commit" -ForegroundColor Green 
}

}
#===========================================================================
#endregion Native Downloader 
#===========================================================================

#===========================================================================
#region API 
#===========================================================================
function API {

        $Name = Read-Host "Enter app name"
        $Description = [regex]::Replace((Read-Host "Enter app description").Trim(), "[^\w\s]", "")

        $choco = Read-Host "Enter Chocolatey package name"
        if ($choco -eq "") { $choco = "none" }  # Set default value if empty

        # Remove "choco install" from $choco if it exists
        $choco = ($choco -replace "choco install", "" -replace ",,", ",").Trim()

        # Check choco packge already exists
        Check -choco $choco

        $winget = (Read-Host "Enter Winget package name (Enter to skip)").Trim()  # Remove leading and trailing spaces
        if ($winget -eq "") { $winget = "none" }  # Set default value if empty

        $winget = $winget.Split('--id=')[-1].Trim()
        $winget = $winget.Replace("-e", "").Trim()

        # Check winget packge already exists
        Check -winget $winget

        $scoop = (Read-Host "Enter Scoop package name (Enter to skip)").Trim()  # Remove leading and trailing spaces
        if ($scoop -eq "") { $scoop = "none" }  # Set default value if empty

        $output = "none" # default value is none

        # Define category options
        $validCategories = @{
            1 = "Web Browsers"
            2 = "Media"
            3 = "Media Tools"
            4 = "Documents"
            5 = "Compression"
            6 = "Communication"
            7 = "Gaming"
            8 = "Imaging"
            9 = "Drivers"
            10 = "Utilities"
            11 = "Disk Tools"
            12 = "File Sharing"
            13 = "Development"
            14 = "Runtimes"
            15 = "Portable"
            16 = "Security"
        }

        # Prompt user to choose category
        do {
            Write-Host "Which category this app will be?:"
            foreach ($key in $validCategories.Keys | Sort-Object) {
                Write-Host "$key - $($validCategories[$key])"
            }
            $choice = Read-Host "Enter the number corresponding to the category"
            if ([int]$choice -in $validCategories.Keys) {
                $category = $validCategories[[int]$choice]
            } else {
                Write-Host "Invalid choice. Please select a valid option."
            }
        } until ([int]$choice -in $validCategories.Keys)

      


    # Define the data
    $data = @{
        "name" = $Name
        "description" = $Description
        "winget" = $winget
        "choco" = $choco
        "scoop" = $scoop
        "default" = @(
            @{
                "IsExcute" = "false"
                "url" = "none"
                "exeArgs" = "/verysilent /tasks=addcontextmenufiles,addcontextmenufolders,addtopath"
                "output" = $output
                "launcher" = "none"
                "shortcut" = "no"
                "run" = "no"
            }
        )
        "category" = $category
        "check" = "false"
    }

    # Convert to JSON string
    $jsonString = @"
    {
        "name": "$($data["name"])",
        "description": "$($data["description"])",
        "winget": "$($data["winget"])",
        "choco": "$($data["choco"])",
        "scoop": "$($data["scoop"])",
        "default": [
            {
                "IsExcute": "false",
                "url": "none",
                "exeArgs": "/verysilent /tasks=addcontextmenufiles,addcontextmenufolders,addtopath",
                "output": "$($data["default"][0]["output"])",
                "launcher": "$($data["default"][0]["launcher"])",
                "shortcut": "$($data["default"][0]["shortcut"])",
                "run": "$($data["default"][0]["run"])"
            }
        ],
        "category": "$($data["category"])",
        "check": "false"
    }
"@

    # Read existing JSON file
    $existingJson = Get-Content -Path $json | ConvertFrom-Json

    # Append new data to existing JSON
    $existingJson += $jsonString | ConvertFrom-Json

    # Convert to JSON string
    $updatedJson = $existingJson | ConvertTo-Json -Depth 100

    # Output to file
    $updatedJson | Out-File -FilePath $json -Encoding utf8

    Write-Host "Added successfully, Don't forget to build and test it before commit" -ForegroundColor Green 
        

}
#===========================================================================
#endregion API 
#===========================================================================

if($userInput -eq "API [Choco/Winget] Recommended")
{
    API

}else
{
    Native
}