$shell = " -NoLogo -NoProfile -NonInteractive -WindowStyle Hidden $PSScriptRoot\wallup.ps1"
Register-ScheduledTask BingWallpaper BingWallpaper (New-ScheduledTaskAction powershell $shell ) (New-ScheduledTaskTrigger -Daily -At 22:05)  (New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -RunOnlyIfNetworkAvailable -StartWhenAvailable)
