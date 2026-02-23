# Script para cerrar todas las ventanas, incluyendo el Explorador de Archivos
# Cierra ventanas de aplicaciones estándar
Get-Process | Where-Object {$_.MainWindowTitle -ne "" -and $_.ProcessName -ne "explorer"} | ForEach-Object { $_.CloseMainWindow() }

# Cierra específicamente las ventanas del Explorador de Archivos
$shell = New-Object -ComObject Shell.Application
$shell.Windows() | ForEach-Object { $_.Quit() }

# Forzar cierre del proceso explorer.exe (opcional, reinicia el Explorador)
# Stop-Process -Name "explorer" -Force
# Start-Process "explorer"  # Reinicia el Explorador si se detuvo