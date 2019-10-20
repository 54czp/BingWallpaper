# BingWallpaper

每日必应壁纸 每日20：05更新

支持 Win10 Win7

## 使用

下载后双击运行

或使用`PowerShell`执行以下命令

### 注册任务计划 install.ps1

```ps1
.\install.ps1
```

### 立即执行 wallup.ps1

```ps1
.\wallup.ps1
```

### 注销任务计划

此命令需要管理员权限

```ps1
Unregister-ScheduledTask BingWallpaper \BingWallpaper\
```

## 设置

通过环境变量改变行为

- 壁纸文件夹
  - 环境变量名：`WallpaperPath`
  - 默认值：`$pwd\Pictures\zh`,`$pwd\Pictures\en`
  - 可选值：任意有读写权限的文件夹
  
  
- 壁纸分辨率
  - 环境变量名：`WallpaperResolution`
  - 默认值：`1920x1080`
  - 可选值：
    - `1920x1200`
    - `1920x1080`
    - `1366x768`
    - `1280x768`
    - `1024x768`
    - `800x600`
    - `800x480`
    - `768x1280`
    - `720x1280`
    - `640x480`
    - `480x800`
    - `400x240`
    - `320x240`
    - `240x320`

