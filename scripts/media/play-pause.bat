@echo off
REM Play / pause the current media (sends the multimedia play-pause key).
powershell.exe -NoProfile -Command "(New-Object -ComObject WScript.Shell).SendKeys([char]179)"
