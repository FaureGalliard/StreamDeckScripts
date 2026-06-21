@echo off
REM Put the system to sleep (suspend).
REM Note: if hibernation is enabled, Windows may hibernate instead.
REM Disable hibernation with: powercfg /hibernate off
rundll32.exe powrprof.dll,SetSuspendState 0,1,0
