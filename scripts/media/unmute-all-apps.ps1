# Unmute every application audio session (companion to mute-other-apps).
# Requires SoundVolumeView (NirSoft) in the repo's tools\ folder.

$svv = Join-Path $PSScriptRoot '..\..\tools\SoundVolumeView.exe'
if (-not (Test-Path $svv)) {
    Write-Error "SoundVolumeView.exe not found at '$svv'. Download it from https://www.nirsoft.net/utils/sound_volume_view.html and drop it in the tools\ folder."
    exit 1
}

$tmp = [System.IO.Path]::Combine($env:TEMP, "svv_sessions.csv")
& $svv /scomma $tmp
Start-Sleep -Milliseconds 300
if (-not (Test-Path $tmp)) { Write-Error "Could not read audio sessions."; exit 1 }

$rows = Import-Csv $tmp
Remove-Item $tmp -ErrorAction SilentlyContinue

foreach ($r in $rows) {
    if ($r.Type -ne 'Application') { continue }
    $id = $r.'Item ID'
    if (-not [string]::IsNullOrEmpty($id)) { & $svv /Unmute $id }
}
