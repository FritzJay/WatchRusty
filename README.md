# WatchRusty

Automatically open your preferred browser to Rusty's stream, everyday, at 9pm EDT.

## How to do?

Open up Windows PowerShell and paste the following:

```PowerShell
$9pm = Get-Date -Hour 21 -Minute 0 -Second 0 -Format "yyyy-MM-ddTHH:mm:ss"
$EasternStandardTime = [System.TimeZoneInfo]::FindSystemTimeZoneById("Eastern Standard Time")
$LocalTimeZone = [System.TimeZoneInfo]::FindSystemTimeZoneById([System.TimeZone]::CurrentTimeZone.StandardName)
$9pmRustysTime = [System.TimeZoneInfo]::ConvertTime($9pm, $EasternStandardTime, $LocalTimeZone)

$Trigger = New-ScheduledTaskTrigger -Daily -At $9pmRustysTime
$Argument = "-Command `"Write-Output('Welcome to WatchRusty! Open up Windows PowerShell and paste the following to remove this scheduled task: Unregister-ScheduledTask WatchRusty -Confirm:`$false'); Explorer 'https://www.twitch.tv/rusty_neal'; Read-Host -Prompt 'Press any key to exit...'`""
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument $Argument
$Settings = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable
$ScheduledTask = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
Register-ScheduledTask WatchRusty -InputObject $ScheduledTask
```

Or, clone the project and run the PowerShell script, which is the same as the code above.

## What does it do?

It creates a Windows Scheduled Task that automatically opens your default web browser to twitch.tv/rusty_neal when he starts streaming. If you aren't familiar with Windows Scheduled Tasks and would like to remove this beauty, no problemo. Follow the step(s) below to remove the task automatically.

## Okay I'm done now

If you want to stop this automated nonsense, open up Windows PowerShell and paste the following:

```PowerShell
Unregister-ScheduledTask WatchRusty -Confirm:$false
```
