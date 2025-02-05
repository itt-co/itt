function Add-Log {
    param (
        [string]$Message,
        [string]$Level = "INFO"
    )
    # Determine the color based on the log level
    switch ($Level.ToUpper()) {
        "INFO" { $color = "White" }
        "WARNING" { $color = "Yellow" }
        "ERROR" { $color = "Red" }
        "Installed" { $color = "White" }
        "Apply" { $color = "White" }
        "debug" { $color = "Yello" }
        default { $color = "White" }
    }
    switch ($Level.ToUpper()) {
        "INFO" { $icon = "i" }
        "WARNING" { $icon = "!" }
        "ERROR" { $icon = "X" }
        "Installed" { $icon = "√" }
        "Apply" { $icon = "√" }
        "Disabled" { $icon = "X" }
        "Enabled" { $icon = "√" }
        "Debug" { $icon = "Debug" }
        default { $icon = "i" }
    }
    # Construct the log message
    $logMessage =  "[$icon] $Message"
    # Write the log message to the console with the specified color
    Write-Host " $logMessage" -ForegroundColor $color
}