; --- Dynamic Game Prep Cleaner ---
; Schließt störende oder bandbreitenintensive Programme vor dem Spielen
; Nutzt ein Dictionary für bessere Erweiterbarkeit
; Hotkey: Ctrl + Alt + X

#SingleInstance Force
#Persistent
SetTitleMatchMode, 2

^!x::CloseBackgroundApps()
return

; === Dictionary mit Programmgruppen ===
InitAppList() {
    global AppGroups := {}

    ; Browser
    AppGroups["Browser"] := [
        "chrome.exe",
        "msedge.exe",
        "firefox.exe",
        "brave.exe",
        "opera.exe"
    ]

    ; Cloud-Dienste
    AppGroups["Cloud"] := [
        "GoogleDriveFS.exe",
        "googledrivesync.exe",
        "OneDrive.exe",
        "Dropbox.exe",
        "iCloudDrive.exe",
        "Box.exe"
    ]

    ; Kommunikation
    AppGroups["Kommunikation"] := [
        "Discord.exe",
        "Slack.exe",
        "Teams.exe",
        "Skype.exe"
    ]

    ; Game Launcher
    AppGroups["Launcher"] := [
        "EpicGamesLauncher.exe",
        "Steam.exe",
        "UbisoftConnect.exe",
        "EAApp.exe",
        "Battle.net.exe"
    ]

    ; Musik / Streaming
    AppGroups["Entertainment"] := [
        "Spotify.exe",
        "YouTube Music Desktop App.exe"
    ]

    return AppGroups
}

; === Hauptfunktion zum Schließen ===
CloseBackgroundApps() {
    static AppGroups := InitAppList()

    TrayTip, Game Prep, 🧹 Programme werden geschlossen..., 2, 1

    for category, exeList in AppGroups {
        for _, processName in exeList {
            TryClose(processName)
        }
    }

    TrayTip, Game Prep, ✅ Alle Programme überprüft und ggf. geschlossen., 3, 1
}

; === Hilfsfunktion: Prozess sicher beenden ===
TryClose(ProcessName) {
    Process, Exist, %ProcessName%
    if (ErrorLevel) {
        ; Versuch, das Programm sauber zu schließen
        Process, Close, %ProcessName%
        Sleep 300
        ; Falls es nicht reagiert, erzwinge Beenden
        Process, Exist, %ProcessName%
        if (ErrorLevel)
            Process, Kill, %ProcessName%
    }
}
