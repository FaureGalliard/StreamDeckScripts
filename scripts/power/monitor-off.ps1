# Turn off all monitors (low-power mode). They wake on any mouse/keyboard input.
# The PC keeps running; nothing is closed or suspended.
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Mon {
    [DllImport("user32.dll")]
    public static extern IntPtr SendMessage(IntPtr hWnd, int msg, IntPtr wParam, IntPtr lParam);
}
"@
$HWND_BROADCAST  = [IntPtr]0xFFFF
$WM_SYSCOMMAND   = 0x0112
$SC_MONITORPOWER = 0xF170
$MONITOR_OFF     = 2
[Mon]::SendMessage($HWND_BROADCAST, $WM_SYSCOMMAND, [IntPtr]$SC_MONITORPOWER, [IntPtr]$MONITOR_OFF) | Out-Null
