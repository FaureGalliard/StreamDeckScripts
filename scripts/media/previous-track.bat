@echo off
REM Go to the previous track (sends the multimedia previous key).
powershell.exe -NoProfile -Command "(New-Object -ComObject WScript.Shell).SendKeys([char]177)"
