function Notify {
    <#
        .SYNOPSIS
        Displays a balloon tip notification in the system tray with a customizable title, message, icon, and duration.
        .DESCRIPTION
        The `Notify` function creates a balloon tip notification using the system tray's notification area. 
        This function is useful for displaying temporary alerts or messages to the user. 
        It allows you to specify the notification's title, message, icon type, and how long the balloon tip should be displayed.
        .EXAMPLE
        Notify -title "ITT" -msg "Hello world!" -icon "Information" -time 3000
        Displays a notification balloon with the title "ITT" and the message "Hello world!" with an informational icon for 3 seconds.
    #>
    param(
        [string]$title,
        [string]$msg,
        [string]$icon,
        [Int32]$time
    )
    $notification = New-Object System.Windows.Forms.NotifyIcon
    $notification.Icon = [System.Drawing.SystemIcons]::Information
    $notification.BalloonTipIcon = $icon
    $notification.BalloonTipText = $msg
    $notification.BalloonTipTitle = $title
    $notification.Visible = $true
    $notification.ShowBalloonTip($time)
    # Clean up resources
    $notification.Dispose()
}