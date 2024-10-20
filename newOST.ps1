try {
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

    # Read existing JSON file
    $jsonFilePath = "./Statics/Database/OST.json"
    $existingData = Get-Content $jsonFilePath -Raw -ErrorAction Stop | ConvertFrom-Json

    # Prompt for input
    $name = Read-Host "Enter the track name"
    $url = Read-Host "Enter the URL (Example: www.eprojects.orgfree.com/ezio_family.mp3)"

    # Store input
    $newTrack = @{
        name = $name
        url  = $url
    }

    # Add new object to existing array
    $existingData.Tracks += $newTrack

    # Write updated JSON to file
    $existingData | ConvertTo-Json -Depth 10 | Set-Content $jsonFilePath -ErrorAction Stop
    Write-Host "Added Successfully" -ForegroundColor Green

}
catch {
    Write-Host "An error occurred: $_"
}
