@echo off
REM Skip to the next track (sends the multimedia next key).
powershell.exe -NoProfile -Command "(New-Object -ComObject WScript.Shell).SendKeys([char]176)"
