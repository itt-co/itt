function Add-Log {
    param ([string]$Message, [string]$Level = "INFO")

    $level = $Level.ToUpper()
    $colorMap = @{ INFO="White"; WARNING="Yellow"; ERROR="Red"; INSTALLED="White"; APPLY="White"; DEBUG="Yellow" }
    $iconMap  = @{ INFO="i"; WARNING="!"; ERROR="X"; INSTALLED="√"; APPLY="√"; DISABLED="X"; ENABLED="√"; DEBUG="Debug" }

    $color = if ($colorMap.ContainsKey($level)) { $colorMap[$level] } else { "White" }
    $icon  = if ($iconMap.ContainsKey($level)) { $iconMap[$level] } else { "i" }

    Write-Host "[$icon] $Message" -ForegroundColor $color
}