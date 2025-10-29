; --- Gaming Modifier Expansion System with Profiles ---
; Dynamisches Hotkey-Profil-System für Gamer (MOBA, MMO, Shooter)
; Hotkey zum Öffnen der GUI: Ctrl + Alt + P
; Konfigurationsdatei: config.ini (im selben Ordner)

#SingleInstance Force
#Persistent
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode, 2

global CurrentProfile := ""
global Profiles := Map()

; === Lade Profile aus config.ini ===
LoadProfiles() {
    global Profiles
    Profiles := Map()
    iniFile := A_ScriptDir "\config.ini"

    if !FileExist(iniFile) {
        MsgBox, 48, Error, config.ini not found! Please create it first.
        ExitApp
    }

    IniRead, sections, %iniFile%
    for section in StrSplit(sections, "`n") {
        if section = ""
            continue
        Profiles[section] := Map()
        IniRead, keys, %iniFile%, %section%
        for line in StrSplit(keys, "`n") {
            if line = ""
                continue
            StringSplit, parts, line, =
            key := Trim(parts1)
            value := Trim(parts2)
            Profiles[section][key] := value
        }
    }
}

; === Aktiviere Hotkeys für ein bestimmtes Profil ===
ActivateProfile(profileName) {
    global Profiles, CurrentProfile

    if !Profiles.Has(profileName) {
        MsgBox, 48, Error, Profile "%profileName%" not found!
        return
    }

    ; Alte Hotkeys deaktivieren
    Hotkey, If, false
    Hotkey, If

    ; Neue aktivieren
    for combo, sendKey in Profiles[profileName] {
        ; Dynamisch Hotkeys erstellen
        Hotkey, %combo%, SendMappedKey, On
    }

    CurrentProfile := profileName
    TrayTip, Gaming Profile, 🎮 Active profile: %profileName%, 3, 1
}

; === Hotkey-Handler ===
SendMappedKey:
    thisHotkey := A_ThisHotkey
    sendKey := Profiles[CurrentProfile][thisHotkey]
    if (sendKey != "")
        Send, %sendKey%
return

; === GUI zur Profil-Auswahl ===
^!p::
    Gui, Profile:Destroy
    Gui, Profile:+AlwaysOnTop +ToolWindow
    Gui, Profile:Font, s10, Segoe UI
    Gui, Profile:Add, Text,, 🎮 Choose your active gaming profile:
    profileList := ""
    for name, _ in Profiles
        profileList .= name "|"
    StringTrimRight, profileList, profileList, 1
    Gui, Profile:Add, DropDownList, vSelectedProfile w200 Choose1, %profileList%
    Gui, Profile:Add, Button, gSetProfile w200, Activate
    if (CurrentProfile != "")
        Gui, Profile:Add, Text,, Current: %CurrentProfile%
    Gui, Profile:Show, AutoSize Center, Gaming Profile Selector
return

SetProfile:
    Gui, Submit
    ActivateProfile(SelectedProfile)
    Gui, Profile:Destroy
return

; === Initialisierung ===
LoadProfiles()
ActivateProfile("MOBA")  ; Standardprofil beim Start
return
