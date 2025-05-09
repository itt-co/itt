param (
    [string]$applications = "./static/Database/Applications.json"
)
Write-Host "
+-------------------------------------------------------------------------+
|    ___ _____ _____   ____    _  _____  _    ____    _    ____  _____    |
|   |_ _|_   _|_   _| |  _ \  / \|_   _|/ \  | __ )  / \  / ___|| ____|   |
|    | |  | |   | |   | | | |/ _ \ | | / _ \ |  _ \ / _ \ \___ \|  _|     |
|    | |  | |   | |   | |_| / ___ \| |/ ___ \| |_) / ___ \ ___) | |___    |
|   |___| |_|   |_|   |____/_/   \_\_/_/   \_\____/_/   \_\____/|_____|   |
|    Made with ♥  By Emad Adel                                            |
|                                                                         |
| Choco packages:  https://community.chocolatey.org/packages              |
| Winget packages: https://winget.run/ & https://winget.ragerworks.com/   |
| ITT packages:    https://github.com/itt-co/itt-packages                 |
+-------------------------------------------------------------------------+
"
#===========================================================================
#region Begin Prompt user to choose download method
#===========================================================================
$Mthoed = @{
    1 = "API [Choco/Winget/ITT]"
}
do {

    Write-Host "Which method to download this app will be?:"

    foreach ($key in $Mthoed.Keys | Sort-Object) {
        Write-Host "$key - $($Mthoed[$key])"
    }

    $choice = Read-Host "Enter the number corresponding to the methods"

    if ([int]$choice -in $Mthoed.Keys) {
        $userInput = $Mthoed[[int]$choice]
    }
    else {
        Write-Host "Invalid choice. Please select a valid option."
    }
    
} until ([int]$choice -in $Mthoed.Keys)
#===========================================================================
#endregion end  Prompt user to choose download method
#===========================================================================
function Check {

    param (
        [string]$choco,
        [string]$winget,
        [string]$itt,
        [string]$scoop
    )

    $jsonContent = Get-Content -Path $applications -Raw | ConvertFrom-Json
    
    foreach ($item in $jsonContent) {

        if ($item.choco -eq $choco -and $item.choco -ne "na") {
            Write-Host "($choco) already exists!" -ForegroundColor Yellow
            exit
        }
        elseif ($item.winget -eq $winget -and $item.winget -ne "na") {
            Write-Host "($winget) already exists!" -ForegroundColor Yellow
            exit

        }elseif ($item.itt -eq $itt -and $item.itt -ne "na") {
            Write-Host "($itt) already exists!" -ForegroundColor Yellow
            exit
        }
        elseif ($item.scoop -eq $scoop -and $item.scoop -ne "na") {
            Write-Host "($scoop) already exists!" -ForegroundColor Yellow
            exit
        }
    }
}
function Create-JsonObject {

    $Name = Read-Host "Enter app name"
    $Description = Read-Host "Enter app description"

    # Create the base JSON object
    $jsonObject = @{
        name        = $Name
        description = $Description
        winget      = "na"
        choco       = "na"
        itt         = "na"
        scoop       = "na"
        category    = ""
    }

    $downloadMethod = Download-Mthoed

    # Set the itt ,winget, choco values
    $jsonObject.itt = $downloadMethod.itt
    $jsonObject.winget = $downloadMethod.winget
    $jsonObject.choco = $downloadMethod.choco
    $jsonObject.scoop = $downloadMethod.scoop
    $jsonObject.category += Category
    return $jsonObject
}
function Download-Mthoed {
    # Handle the selected method
    switch ($userInput) {

        "API [Choco/Winget/ITT]" {

            # choco input 
                $choco = Read-Host "Enter Chocolatey package name"
                $choco = ($choco -replace "choco install", "" -replace ",,", ",").Trim()
                if ($choco -eq "") { $choco = "na" }  # Set default value if empty
            # choco Prompt 

            # winget input
                $winget = Read-Host "Enter winget package"
                if ($winget -eq "") { $winget = "na" }  # Set default value if empty
                $cleanedWinget = $winget -replace "winget install -e --id", "" -replace "\s+", ""
            # winget input

            # itt scoop 
                $itt = Read-Host "Enter scoop package name"
                if ($scoop -eq "") { $scoop = "na" }  # Set default value if empty
            # itt scoop 
                 
            # itt input 
                $itt = Read-Host "Enter itt package name"
                if ($itt -eq "") { $itt = "na" }  # Set default value if empty
            # itt input 

            # Check if there is dublicate 
            Check -itt $itt -choco $choco -winget $winget -scoop $scoop

            return @{
                winget       = $cleanedWinget
                choco        = $choco
                itt          = $itt
                scoop        = $scoop
            }
        }
    }
}
function Category {
    #===========================================================================
    #region Begin Categories Prompt
    #===========================================================================
    # Define category options
    $validCategories = @{
        1  = "Web Browsers"
        2  = "Media"
        3  = "Media Tools"
        4  = "Documents"
        5  = "Compression"
        6  = "Communication"
        7  = "Gaming"
        8  = "Imaging"
        9  = "Drivers"
        10 = "Utilities"
        11 = "Disk Tools"
        12 = "File Sharing"
        13 = "Development"
        14 = "Runtimes"
        15 = "Portable"
        16 = "Security"
        17 = "GPU Drivers"
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
        }
        else {
            Write-Host "Invalid choice. Please select a valid option."
        }
    } until ([int]$choice -in $validCategories.Keys)
    return $category
    #===========================================================================
    #endregion Categories
    #===========================================================================
}
#===========================================================================
#region Begin output json file
#===========================================================================
# Check if the JSON file exists
if (Test-Path $applications) {
    # Read existing JSON file
    $existingJson = Get-Content -Path $applications -Raw | ConvertFrom-Json
    # Create a new JSON object to add
    $newJsonObject = Create-JsonObject
    # Append the new object to the existing JSON structure
    $existingJson += $newJsonObject
    # Convert back to JSON format while maintaining the property order
    $jsonOutput = @()
    foreach ($item in $existingJson) {
        $jsonOutput += [PSCustomObject]@{
            Name        = $item.Name
            Description = $item.Description
            winget      = $item.winget
            choco       = $item.choco
            itt         = $item.itt
            scoop       = $item.scoop
            category    = $item.category
        }
    }
    # Write the ordered JSON to the file
    $jsonOutput | ConvertTo-Json -Depth 20 | Out-File -FilePath $applications -Encoding utf8
    Write-Host "Added successfully, Don't forget to build and test it before PR!" -ForegroundColor Green
} 
else {
    Write-Host "The file $applications does not exist!" -ForegroundColor Red
    exit
}
#===========================================================================
#endregion end output json file
#===========================================================================