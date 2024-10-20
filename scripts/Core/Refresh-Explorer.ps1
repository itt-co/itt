function Refresh-Explorer {
    # Check if explorer is not running and start it if needed
    Stop-Process -Name explorer -Force
    Start-Sleep -Seconds 1
    if (-not (Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
        Start-Process explorer.exe -Verb RunAs
    }
}