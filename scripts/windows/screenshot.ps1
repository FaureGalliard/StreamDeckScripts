# Capture all screens and save a timestamped PNG to the Pictures\Screenshots folder.
Add-Type -AssemblyName System.Windows.Forms, System.Drawing

$bounds = [System.Windows.Forms.SystemInformation]::VirtualScreen
$bmp = New-Object System.Drawing.Bitmap $bounds.Width, $bounds.Height
$gfx = [System.Drawing.Graphics]::FromImage($bmp)
$gfx.CopyFromScreen($bounds.Location, [System.Drawing.Point]::Empty, $bounds.Size)

$dir = Join-Path ([Environment]::GetFolderPath('MyPictures')) 'Screenshots'
if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }

$file = Join-Path $dir ("screenshot_{0:yyyy-MM-dd_HH-mm-ss}.png" -f (Get-Date))
$bmp.Save($file, [System.Drawing.Imaging.ImageFormat]::Png)

$gfx.Dispose()
$bmp.Dispose()
