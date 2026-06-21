# tools/

External helpers that a few scripts rely on. They are **not bundled** with this
repo — download them here yourself.

## SoundVolumeView (required by `mute-other-apps` / `unmute-all-apps`)

Portable, no install needed.

1. Download from <https://www.nirsoft.net/utils/sound_volume_view.html>
2. Unzip and place **`SoundVolumeView.exe`** directly in this `tools/` folder.

## AudioDeviceCmdlets (required by `cycle-output-device` / `cycle-input-device`)

A PowerShell module (nothing goes in this folder). Install once:

```powershell
Install-Module -Name AudioDeviceCmdlets -Scope CurrentUser
```
