🎵 Spotify Volume Knob Controller (AHK v2) https://www.autohotkey.com/v2
This AutoHotkey v2 script lets you control Spotify’s internal volume (not system volume) by sending Ctrl+Up and Ctrl+Down keystrokes directly to the Spotify window.
It is designed to be triggered by Razer Synapse macros — for example, using the volume dial on compatible keyboards.
*************************************************************************************************************************************************************************
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
*************************************************************************************************************************************************************************
🖥️ Usage with Razer Synapse
Compile the script into an .exe with AutoHotkey v2.

Make the following path in file explorer
C:\Tools\SpotifyVolumeControl

(The .exe file is the compiled file from the .ahk file in this repository)

In order to compile 
1. Launch AutoHotkey Dash
2. Click compile
3. Download the SpotifyDialControl.ahk
3. Look for "Source (script file)" then on the same line click browse and select the newly downloaded file.
5. Then at the bottom right of the window click convert
6. Now add the compiled .exe file to C:\Tools\SpotifyVolumeControl

In Synapse, go the macro tab and make two new macros (It doesn't matter what you name them whatever works for you.

Using the RUN COMMAND add this line:
C:\Tools\SpotifyVolumeControl\SpotifyVolumeControl.exe up
And othe other one add the RUN COMMAND add the line:
C:\Tools\SpotifyVolumeControl\SpotifyVolumeControl.exe down

Now add the up command to the clockwise rotation when you click on your keyabords tab at the top of the screen and are on "Customize" and you click on the knob.

To the clockwise add the up macro and the down macro to the counter-clockwise macro
*************************************************************************************************************************************************************************
📄 Example Log Output

Copy
Edit
20250812141638 - START arg=up
20250812141638 - Found Spotify HWND=198068
20250812141638 - PrevActiveHWND=327968
20250812141638 - Sent Ctrl+Up
20250812141638 - Restored previous window.
*************************************************************************************************************************************************************************
💡 Notes
Requires AutoHotkey v2 — this will not work in v1 due to syntax differences.

Will only work is Spotify is currently running.

Windows will think that this is a virus(its not 😵) so add an exclution to the file in windows security!

Window focus change is currently visible for reliability.
A hidden activation method is possible, but may be less consistent. (I also don't know how to do this...)
