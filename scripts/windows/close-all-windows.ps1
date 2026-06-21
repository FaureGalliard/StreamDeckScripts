# Close every visible application window, including File Explorer windows.
# Does NOT kill the desktop/taskbar (explorer.exe stays running).

# Ask each app with a visible window to close gracefully (lets you save).
Get-Process |
    Where-Object { $_.MainWindowTitle -ne "" -and $_.ProcessName -ne "explorer" } |
    ForEach-Object { $_.CloseMainWindow() | Out-Null }

# Close File Explorer windows specifically (they are owned by explorer.exe).
$shell = New-Object -ComObject Shell.Application
$shell.Windows() | ForEach-Object { $_.Quit() }
[System.Runtime.InteropServices.Marshal]::ReleaseComObject($shell) | Out-Null
