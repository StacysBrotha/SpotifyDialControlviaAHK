🎵 Spotify Volume Knob Controller (AHK v2)
This AutoHotkey v2 script lets you control Spotify’s internal volume (not system volume) by sending Ctrl+Up and Ctrl+Down keystrokes directly to the Spotify window.
It is designed to be triggered by Razer Synapse macros — for example, using the volume dial on compatible keyboards.

🔧 How It Works
Takes a command-line argument (up or down) when run from Razer Synapse.

Finds the Spotify window using WinExist("ahk_exe Spotify.exe") to retrieve its window handle (HWND).

Saves the currently active window so it can restore your workflow after changing volume.

Activates Spotify briefly so the key presses are guaranteed to register
(Spotify ignores background key sends in most cases).

Sends the appropriate keystroke:

Ctrl+Up → Increase Spotify volume

Ctrl+Down → Decrease Spotify volume

Restores the previously active window to return focus to what you were doing.

Logs every action to spotify_volume_log.txt in the same directory for troubleshooting.

🖥️ Usage with Razer Synapse
Compile the script into an .exe with AutoHotkey v2.

In Synapse, set your dial’s clockwise rotation to:

vbnet
Copy
Edit
C:\Path\To\SpotifyVolume.exe up
And counterclockwise to:

vbnet
Copy
Edit
C:\Path\To\SpotifyVolume.exe down
📄 Example Log Output
pgsql
Copy
Edit
20250812141638 - START arg=up
20250812141638 - Found Spotify HWND=198068
20250812141638 - PrevActiveHWND=327968
20250812141638 - Sent Ctrl+Up
20250812141638 - Restored previous window.
💡 Notes
Requires AutoHotkey v2 — this will not work in v1 due to syntax differences.

Works best if Spotify is already running.

Window focus change is currently visible for reliability.
A hidden activation method is possible, but may be less consistent.
