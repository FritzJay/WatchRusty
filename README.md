# WatchRusty

Automatically open your preferred browser to Rusty's stream at 9pm EDT

## How to do?

Open up "Windows PowerShell" and paste the following:

```PowerShell
$9pmYourTime = [DateTime]::Today.AddHours(21)
$RustysTZ = [System.TimeZoneInfo]::FindSystemTimeZoneById("Eastern Standard Time")
$9pmRustysTime = [System.TimeZoneInfo]::ConvertTimeFromUtc($9pmYourTime.ToUniversalTime(), $RustysTZ)

$Trigger = New-ScheduledTaskTrigger -Daily -At $9pmRustysTime
$Argument = "-Command `"Write-Output('Welcome to WatchRusty! Open up Windows PowerShell and paste the following to remove this scheduled task: Unregister-ScheduledTask WatchRusty -Confirm:false'); Explorer 'https://www.twitch.tv/rusty_neal'; Read-Host -Prompt 'Press any key to exit...'`""
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument $Argument
$Settings = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable
$ScheduledTask = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
Register-ScheduledTask WatchRusty -InputObject $ScheduledTask
```

Or, clone the project and run the PowerShell script, which is the same as the code above.
