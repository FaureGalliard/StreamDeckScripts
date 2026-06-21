# Rotate the default RECORDING (microphone) device to the next one (wraps around).
#
# OPTIONAL — requires the AudioDeviceCmdlets module:
#   Install-Module -Name AudioDeviceCmdlets -Scope CurrentUser
if (-not (Get-Module -ListAvailable -Name AudioDeviceCmdlets)) {
    Write-Error "AudioDeviceCmdlets not installed. Run: Install-Module -Name AudioDeviceCmdlets -Scope CurrentUser"
    exit 1
}
Import-Module AudioDeviceCmdlets

$devices = @(Get-AudioDevice -List | Where-Object { $_.Type -eq 'Recording' })
if ($devices.Count -lt 2) { exit 0 }

$indices = $devices | ForEach-Object { $_.Index }
$current = ($devices | Where-Object { $_.Default }).Index
$pos = [Array]::IndexOf([int[]]$indices, [int]$current)
$next = $devices[($pos + 1) % $devices.Count]
Set-AudioDevice -Index $next.Index | Out-Null
