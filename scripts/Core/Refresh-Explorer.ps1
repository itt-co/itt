function Refresh-Explorer {


    Add-Log -Message "Restart explorer." -Level "info"

    Stop-Process -processName: Explorer -Force

    Start-Sleep -Seconds 1

    # Check if explorer is not running and start it if needed
    if (-not (Get-Process -processName: Explorer)) {
        Start-Process explorer.exe
    }
}