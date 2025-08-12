#Requires AutoHotkey v2.0
#SingleInstance Force
SetTitleMatchMode 2

logFile := A_ScriptDir "\spotify_volume_log.txt"

; Command-line args: "up" or "down"
if (A_Args.Length >= 1) {
    dir := A_Args[1]
    log("START arg=" dir)

    hwnd := WinExist("ahk_exe Spotify.exe")
    if !hwnd {
        log("Spotify not found.")
        ExitApp
    }
    log("Found Spotify HWND=" hwnd)

    prevHwnd := WinExist("A")
    log("PrevActiveHWND=" prevHwnd)

    ; Activate Spotify
    WinActivate("ahk_id " hwnd)
    Sleep(100)

    ; Send volume control keys
    if (dir = "up") {
        Send("^{" "Up" "}")
        log("Sent Ctrl+Up")
    }
    else if (dir = "down") {
        Send("^{" "Down" "}")
        log("Sent Ctrl+Down")
    }
    else {
        log("Unknown arg: " dir)
    }

    Sleep(100)

    ; Restore previous window if it exists
    if (prevHwnd && WinExist("ahk_id " prevHwnd)) {
        WinActivate("ahk_id " prevHwnd)
        log("Restored previous window.")
    }

    ExitApp
}
else {
    MsgBox("No argument provided. Use 'up' or 'down'.")
}

log(msg) {
    global logFile
    FileAppend(Format("{} - {}\n", A_Now, msg), logFile)
}
