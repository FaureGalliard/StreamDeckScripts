# Show / hide hidden files and folders in File Explorer.
# Registry: Hidden = 1 shows hidden items, 2 hides them.
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
$current = (Get-ItemProperty -Path $key -Name Hidden -ErrorAction SilentlyContinue).Hidden
$new = if ($current -eq 1) { 2 } else { 1 }
Set-ItemProperty -Path $key -Name Hidden -Value $new

# Refresh open Explorer windows so the change is visible immediately.
$shell = New-Object -ComObject Shell.Application
$shell.Windows() | ForEach-Object { $_.Refresh() }
[System.Runtime.InteropServices.Marshal]::ReleaseComObject($shell) | Out-Null
