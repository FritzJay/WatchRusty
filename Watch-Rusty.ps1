$9pm = Get-Date -Hour 21 -Minute 0 -Second 0 -Format "yyyy-MM-ddTHH:mm:ss"
$EasternStandardTime = [System.TimeZoneInfo]::FindSystemTimeZoneById("Eastern Standard Time")
$LocalTimeZone = Get-Timezone
$9pmRustysTime = [System.TimeZoneInfo]::ConvertTime($9pm, $EasternStandardTime, $LocalTimeZone)

$Trigger = New-ScheduledTaskTrigger -Daily -At $9pmRustysTime
$Argument = "-Command `"Write-Output('Welcome to WatchRusty! Open up Windows PowerShell and paste the following to remove this scheduled task: Unregister-ScheduledTask WatchRusty -Confirm:`$false'); Explorer 'https://www.twitch.tv/rusty_neal'; Read-Host -Prompt 'Press enter to exit...'`""
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument $Argument
$Settings = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable
$ScheduledTask = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
Register-ScheduledTask WatchRusty -InputObject $ScheduledTask