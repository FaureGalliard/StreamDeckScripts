# Mute every application's audio EXCEPT the app in the foreground window.
# Press it while your game/stream is focused to silence Spotify, browser, etc.
# Use unmute-all-apps to restore everything.
#
# Requires SoundVolumeView (NirSoft), portable .exe placed in the repo's
# tools\ folder:  https://www.nirsoft.net/utils/sound_volume_view.html

$svv = Join-Path $PSScriptRoot '..\..\tools\SoundVolumeView.exe'
if (-not (Test-Path $svv)) {
    Write-Error "SoundVolumeView.exe not found at '$svv'. Download it from https://www.nirsoft.net/utils/sound_volume_view.html and drop it in the tools\ folder."
    exit 1
}

# --- Identify the foreground process (the app we want to keep audible) ---
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Fg {
    [DllImport("user32.dll")] public static extern IntPtr GetForegroundWindow();
    [DllImport("user32.dll")] public static extern uint GetWindowThreadProcessId(IntPtr h, out uint pid);
}
"@
$hwnd = [Fg]::GetForegroundWindow()
$activePid = [uint32]0
[Fg]::GetWindowThreadProcessId($hwnd, [ref]$activePid) | Out-Null

# --- Export the current audio sessions to a temp CSV and act on each ---
$tmp = [System.IO.Path]::Combine($env:TEMP, "svv_sessions.csv")
& $svv /scomma $tmp
Start-Sleep -Milliseconds 300
if (-not (Test-Path $tmp)) { Write-Error "Could not read audio sessions."; exit 1 }

$rows = Import-Csv $tmp
Remove-Item $tmp -ErrorAction SilentlyContinue

foreach ($r in $rows) {
    if ($r.Type -ne 'Application') { continue }   # skip devices/system sounds
    $id = $r.'Item ID'
    if ([string]::IsNullOrEmpty($id)) { continue }
    if ($r.'Process ID' -eq $activePid) {
        & $svv /Unmute $id        # keep the focused app audible
    } else {
        & $svv /Mute $id          # silence the rest
    }
}
