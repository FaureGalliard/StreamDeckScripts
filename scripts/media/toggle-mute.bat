@echo off
REM Toggle the master volume mute by sending the multimedia "mute" key.
powershell.exe -NoProfile -Command "(New-Object -ComObject WScript.Shell).SendKeys([char]173)"
