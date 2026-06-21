@echo off
REM Raise the master volume one step (sends the "volume up" key twice).
powershell.exe -NoProfile -Command "$w = New-Object -ComObject WScript.Shell; 1..2 | ForEach-Object { $w.SendKeys([char]175) }"
