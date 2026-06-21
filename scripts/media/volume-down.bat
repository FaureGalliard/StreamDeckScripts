@echo off
REM Lower the master volume one step (sends the "volume down" key twice).
powershell.exe -NoProfile -Command "$w = New-Object -ComObject WScript.Shell; 1..2 | ForEach-Object { $w.SendKeys([char]174) }"
