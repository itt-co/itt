function Remove-ScheduledTasks {
    param (
        [Parameter(Mandatory = $true)]
        [array]$TasksToRemove
    )

    if ($TasksToRemove -and $TasksToRemove.Count -gt 0) {
        foreach ($taskNamePattern in $TasksToRemove) {
            $tasks = Get-ScheduledTask -TaskName "*$taskNamePattern*" -ErrorAction SilentlyContinue

            if ($tasks) {
                foreach ($task in $tasks) {
                    Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false
                    Add-Log -Message "$($task.TaskName) Removed" -Level "INFO"
                }
            } else {
                if ($Debug) {
                    Add-Log -Message "No tasks matching '$taskNamePattern' found" -Level "debug"
                }
            }
        }
    }
}