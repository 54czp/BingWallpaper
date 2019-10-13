$shell = " -NoLogo -NoProfile -NonInteractive -WindowStyle Hidden $pwd\wallup.ps1"
Register-ScheduledTask BingWallpaper BingWallpaper (New-ScheduledTaskAction powershell $shell ) (New-ScheduledTaskTrigger -Daily -At 20:05)  (New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -RunOnlyIfNetworkAvailable -StartWhenAvailable)
