; ============================
; Hotkey Viewer by ChatGPT
; ============================

#Requires AutoHotkey v2.0

; --- Einstellungen ---
global HOTKEY_COMBO := "^!h" ; Strg + Alt + H → selten belegt
global ProgramHotkeys := Map() ; Dictionary aller Programme

; --- Hotkey-Daten definieren ---
ProgramHotkeys["notepad.exe"] := Map(
    "Strg + N", "Neue Datei",
    "Strg + O", "Datei öffnen",
    "Strg + S", "Datei speichern"
)

ProgramHotkeys["chrome.exe"] := Map(
    "Strg + T", "Neuer Tab",
    "Strg + W", "Tab schließen",
    "Strg + Umschalt + T", "Geschlossenen Tab wieder öffnen"
)

ProgramHotkeys["explorer.exe"] := Map(
    "Alt + ↑", "Ein Ordner nach oben",
    "Strg + N", "Neues Fenster",
    "F2", "Datei umbenennen"
)

; --- GUI-Styling ---
global gui := Gui("AlwaysOnTop +ToolWindow", "Hotkeys für aktives Programm")
gui.SetFont("s10", "Segoe UI")

; --- Haupt-Hotkey ---
Hotkey(HOTKEY_COMBO, ShowHotkeys)

ShowHotkeys(*) {
    WinGet, processName, "ProcessName", "A" ; aktives Fenster
    processName := StrLower(processName)

    if ProgramHotkeys.Has(processName) {
        hotkeys := ProgramHotkeys[processName]
        DisplayHotkeyWindow(processName, hotkeys)
    } else {
        DisplayHotkeyWindow(processName, "")
    }
}

DisplayHotkeyWindow(program, hotkeys) {
    gui.Destroy()
    gui := Gui("AlwaysOnTop +ToolWindow", "Hotkeys – " program)
    gui.SetFont("s10", "Segoe UI")

    if (hotkeys = "") {
        gui.AddText(, "Keine Hotkeys definiert für: " program)
    } else {
        gui.AddText("Bold", "Hotkeys für " program)
        gui.AddText() ; Leerzeile
        for k, v in hotkeys {
            gui.AddText(, k " → " v)
        }
    }
    gui.Show("AutoSize Center")
}

; --- Skript läuft ---
MsgBox "Hotkey-Hilfe gestartet! Drücke " HOTKEY_COMBO " um Hotkeys anzuzeigen."
