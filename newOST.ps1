param (
    [string]$json = "./static/Database/OST.json"
)
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
    # Read existing JSON file
    $jsonFilePath = $json
    $existingData = Get-Content $json -Raw -ErrorAction Stop | ConvertFrom-Json
    # Prompt for input
    $name = Read-Host "Enter track name"
    $url = Read-Host "Enter URL (Example: emadadel4.github.io/ezio_family.mp3)"
    # Store input
    $newTrack = @{
        name = $name
        url  = $url
    }
    # Add new object to existing array
    $existingData.Tracks += $newTrack
    # Write updated JSON to file
    $existingData | ConvertTo-Json -Depth 10 | Set-Content $jsonFilePath -ErrorAction Stop
}
catch {
    Write-Host "An error occurred: $_"
}
finally {
    Write-Host "Added successfully, Don't forget to build and test it before PR" -ForegroundColor Green 
}
