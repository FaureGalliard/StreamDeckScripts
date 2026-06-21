# Switch to the PREVIOUS virtual desktop (same as Win+Ctrl+Left).
# SendKeys can't send the Windows key, so we simulate the keystrokes via Win32.
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Kbd {
    [DllImport("user32.dll")]
    public static extern void keybd_event(byte vk, byte scan, uint flags, IntPtr extra);
}
"@
$WIN = 0x5B; $CTRL = 0x11; $LEFT = 0x25; $UP = 0x2

[Kbd]::keybd_event($WIN, 0, 0, [IntPtr]::Zero)
[Kbd]::keybd_event($CTRL, 0, 0, [IntPtr]::Zero)
[Kbd]::keybd_event($LEFT, 0, 0, [IntPtr]::Zero)
[Kbd]::keybd_event($LEFT, 0, $UP, [IntPtr]::Zero)
[Kbd]::keybd_event($CTRL, 0, $UP, [IntPtr]::Zero)
[Kbd]::keybd_event($WIN, 0, $UP, [IntPtr]::Zero)
