Param (
#	$WallpaperPath = ($env:WallpaperPath, "$pwd\Pictures","$env:USERPROFILE\Pictures" | Select-Object -First 1),
#	 $WallpaperPath = $env:WallpaperPath,
#    $WallpaperPath = "$pwd\Pictures",
#    $WallpaperPath = "$env:USERPROFILE\Pictures",
    $WallpaperPath = "$PSScriptRoot\Pictures\zh",


#    $WallpaperResolution = ($env:WallpaperResolution, '1920x1080' | Select-Object -First 1),
#    $WallpaperResolution = '1920x1200',
    $WallpaperResolution = '1920x1080',
#    $WallpaperResolution = '1366x768',
#    $WallpaperResolution = '1280x768',
#    $WallpaperResolution = '1024x768',
#    $WallpaperResolution = '800x600',
#    $WallpaperResolution = '800x480',
#    $WallpaperResolution = '768x1280',
#    $WallpaperResolution = '720x1280',
#    $WallpaperResolution = '640x480',
#    $WallpaperResolution = '480x800',
#    $WallpaperResolution = '400x240',
#    $WallpaperResolution = '320x240',
#    $WallpaperResolution = '240x320',

#    $DaysAgo = ($env:DaysAgo, 0 | Select-Object -First 1)
# 可选值：`0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`	
    $DaysAgo =  0
)
#$date = Get-Date -Format 'yyyy_MM_dd_HH_mm_ss_'
$date = Get-Date -Format 'yyyy_MM_dd_'


$WallpaperPath1 = $WallpaperPath+'\wallpaper'+$date+'zh'+'.jpg'
# Download wallpaper
if (!(Test-Path $WallpaperPath1)){
[xml]$Bing = Invoke-WebRequest "www.bing.com/HPImageArchive.aspx?n=1&idx=$DaysAgo&ensearch=0" -UseBasicParsing
Invoke-WebRequest "www.bing.com$($Bing.images.image.urlBase)_$WallpaperResolution.jpg" -UseBasicParsing -OutFile $WallpaperPath1
}

# Convert file format
$WallpaperPath2 =$WallpaperPath+ '\wallpaper_'+'temp'+'.bmp'
$WallpaperPath2
[Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
$convertfile = new-object System.Drawing.Bitmap($WallpaperPath1)
$convertfile.Save($WallpaperPath2, "bmp")
# Set wallpaper
(Add-Type -MemberDefinition '[DllImport("user32.dll")]public static extern bool SystemParametersInfo (uint uiAction, uint uiParam, String pvParam, uint fWinIni);' -Name 'Params' -PassThru)::SystemParametersInfo(20, 0, $WallpaperPath2, 3)
