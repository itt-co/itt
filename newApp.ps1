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
|  Choco packages: https://community.chocolatey.org/packages              |
|  Winget packages: https://winget.run/                                   |
+-------------------------------------------------------------------------+
"
#===========================================================================
#region Begin Prompt user to choose download method
#===========================================================================
    $Mthoed = @{
        1 = "API [Choco/Winget] Recommended"
        2 = "Default [HttpClient]"
    }
    do {
        Write-Host "Which method to download this app will be?:"
        foreach ($key in $Mthoed.Keys | Sort-Object) {
            Write-Host "$key - $($Mthoed[$key])"
        }
        $choice = Read-Host "Enter the number corresponding to the methods"
        if ([int]$choice -in $Mthoed.Keys) {
            $userInput = $Mthoed[[int]$choice]
        } else {
            Write-Host "Invalid choice. Please select a valid option."
        }
    } until ([int]$choice -in $Mthoed.Keys)
#===========================================================================
#endregion end  Prompt user to choose download method
#===========================================================================
function Check {
    param (
        [string]$choco,
        [string]$winget
    )
    $jsonContent = Get-Content -Path $applications -Raw | ConvertFrom-Json
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
function Create-JsonObject {
    $Name = Read-Host "Enter app name"
    $Description  = Read-Host "Enter app description"
    # Create the base JSON object
    $jsonObject = @{
        name        = $Name
        description = $Description
        winget      = "none"
        choco       = "none"
        scoop       = "none"
        default     = @()
        category    = ""
        check       = "false"
    }
    $downloadMethod = Download-Mthoed
    # Only add the necessary download method details to the default section
    if ($downloadMethod.defaultEntry) {
        $jsonObject.default += $downloadMethod.defaultEntry
    }
    # Set the winget and choco values outside of the default section
    $jsonObject.winget = $downloadMethod.winget
    $jsonObject.choco  = $downloadMethod.choco
    $jsonObject.category += Category
    return $jsonObject
}
function Download-Mthoed {
    # Handle the selected method
    switch ($userInput) {
        "API [Choco/Winget] Recommended" {
            # Prompt the user for input
            $choco  = Read-Host "Enter Chocolatey package name"
            $choco = ($choco -replace "choco install", "" -replace ",,", ",").Trim()
            if ($choco -eq "") { $choco = "none" }  # Set default value if empty
            Check -choco $choco
            # Prompt the user for input
            $winget = Read-Host "Enter winget package"
            if ($winget -eq "") { $winget = "none" }  # Set default value if empty
            # Remove the string 'winget install -e --id' and any spaces from the input
            $cleanedWinget = $winget -replace "winget install -e --id", "" -replace "\s+", ""
            Check -winget $cleanedWinget
            return @{
                winget    = $cleanedWinget
                choco     = $choco
                defaultEntry = $null
            }
        }
        "Default [HttpClient]" {
            $url = Read-Host "Enter url file (e.g: emadadel4.github.io/setup.exe)"  
            $launcher = Read-Host "Setup launcher (e.g: setup.exe)"
            $IsPortable = @{
                1 = "ture"
                2 = "false"
            }
            do {
                Write-Host "
                If the file to be downloaded is compressed, choose 'true'
                If the file to be is downloaded is installer exe , choose 'false'
                "
                foreach ($key in $IsPortable.Keys | Sort-Object) {
                    Write-Host "$key - $($IsPortable[$key])"
                }
                $choice = Read-Host "Enter the number corresponding to the methods"
                if ([int]$choice -in $IsPortable.Keys) {
                    $Portable = $IsPortable[[int]$choice]
                } else {
                    Write-Host "Invalid choice. Please select a valid option."
                }
            } until ([int]$choice -in $IsPortable.Keys)
            $arg = Read-Host "Enter ArgumentList (e.g: /silent) You can skip this if don't know setup Argument"
            if (-not $arg -or $arg -eq '') {$arg = "/silent"}
            return @{
                winget    = "none"
                choco     = "none"
                defaultEntry = @{
                    url      = $url
                    launcher = $launcher
                    args     = $arg
                    portable = $Portable
                }
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
        } else {
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
                Name               = $item.Name
                Description        = $item.Description
                winget             = $item.winget
                choco              = $item.choco
                default            = $item.default
                category           = $item.category
                check              = $item.check
            }
        }
        # Write the ordered JSON to the file
        $jsonOutput | ConvertTo-Json -Depth 20 | Out-File -FilePath $applications -Encoding utf8
        Write-Host "Added successfully, Don't forget to build and test it before push commit" -ForegroundColor Green
    } 
    else
    {
        Write-Host "The file $applications does not exist!" -ForegroundColor Red
    }
#===========================================================================
#endregion end output json file
#===========================================================================