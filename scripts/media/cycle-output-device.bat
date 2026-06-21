@echo off
REM Launcher for cycle-output-device.ps1 (path is relative to this file).
REM OPTIONAL: needs the AudioDeviceCmdlets PowerShell module.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0cycle-output-device.ps1"
