@echo off
REM Toggle "Show desktop": first press minimizes all windows, second press
REM restores every window exactly where it was (same behavior as Win+D).
powershell.exe -NoProfile -Command "(New-Object -ComObject Shell.Application).ToggleDesktop()"
