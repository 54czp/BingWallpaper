# 导入所需的模块
Import-Module ScheduledTasks

# 定义任务的参数
$taskName = "BingWallpaper"
$scriptPath = "$PSScriptRoot\wallup.ps1"
$triggerTime = New-ScheduledTaskTrigger -At 00:00 -Daily
$triggerAtStartup = New-ScheduledTaskTrigger -AtStartup -RandomDelay (New-TimeSpan -Minutes 1)

# 创建一个新的操作，该操作将执行指定的脚本
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-WindowStyle Hidden -File `"$scriptPath`""

# 创建一个新的任务设置，该设置将在用户登录后的一段时间开始任务，并设置任务为隐藏
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -Hidden

# 创建一个新的计划任务，设置任务的用户信息
Register-ScheduledTask -TaskName $taskName -Trigger $triggerTime, $triggerAtStartup -Action $action -Settings $settings
