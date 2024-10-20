function Notify {

    <#
        .SYNOPSIS
        Displays a balloon tip notification in the system tray with a customizable title, message, icon, and duration.

        .DESCRIPTION
        The `Notify` function creates a balloon tip notification using the system tray's notification area. 
        This function is useful for displaying temporary alerts or messages to the user. 
        It allows you to specify the notification's title, message, icon type, and how long the balloon tip should be displayed.

        .PARAMETER title
        The title of the notification balloon. This appears as the header of the balloon tip.

        .PARAMETER msg
        The main message text of the notification balloon.

        .PARAMETER icon
        The icon to be displayed in the notification balloon. Should be one of the standard `System.Windows.Forms.NotifyIcon` icon types such as "Information", "Warning", or "Error".

        .PARAMETER time
        The duration (in milliseconds) for which the balloon tip will be displayed.

        .EXAMPLE
        Notify -title "ITT" -msg "Hello world!" -icon "Information" -time 3000
        Displays a notification balloon with the title "ITT" and the message "Hello world!" with an informational icon for 3 seconds.

        .EXAMPLE
        Notify -title "Warning" -msg "Please check your settings." -icon "Warning" -time 5000
        Displays a notification balloon with the title "Warning" and the message "Please check your settings." with a warning icon for 5 seconds.

        .NOTES
        - The `icon` parameter should match one of the standard `System.Windows.Forms.NotifyIcon` types.
        - The `notification` object is disposed of after showing the balloon tip to free up system resources.
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

    $notification.ShowBalloonTip($time)  # Display for specified time

    # Clean up resources
    $notification.Dispose()
}