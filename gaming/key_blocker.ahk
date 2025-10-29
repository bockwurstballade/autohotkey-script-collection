; --- Game Mode Key Blocker (Finale Version) ---
; Deaktiviert störende Tasten beim Spielen
; - Windows-Tasten (links & rechts)
; - CapsLock
; - (optional) Einfügen-Taste (Insert)
; - (optional) F1–F12
; - (optional) Sprachwechsel-Hotkeys (Alt+Shift, Ctrl+Shift, Win+Space)
; Toggle per: Ctrl + Alt + G

#SingleInstance Force
#Persistent
SetTitleMatchMode, 2
GameMode := false

; --- Manuelles Umschalten ---
^!g::
    GameMode := !GameMode
    if (GameMode) {
        BlockGamingKeys(true)
        TrayTip, Game Mode, 🚫 Game Mode aktiviert (Tasten gesperrt), 2, 1
    } else {
        BlockGamingKeys(false)
        TrayTip, Game Mode, ✅ Game Mode deaktiviert (Tasten aktiv), 2, 1
    }
return

; --- (OPTIONAL) Automatische Aktivierung bei bestimmtem Spiel ---
; Diese Funktion prüft regelmäßig, ob ein bestimmtes Spiel läuft.
; Wenn ja → Game Mode automatisch aktivieren
; Wenn nein → wieder deaktivieren
; Zum Aktivieren entferne das Semikolon vor den folgenden Zeilen:
;SetTimer, CheckIfGameRunning, 2000  ; prüft alle 2 Sekunden

;CheckIfGameRunning:
;    Process, Exist, war3.exe          ; Beispiel: Warcraft 3
;    if (ErrorLevel && !GameMode) {
;        GameMode := true
;        BlockGamingKeys(true)
;        TrayTip, Game Mode, 🎮 Spiel erkannt – Game Mode aktiviert, 2, 1
;    } else if (!ErrorLevel && GameMode) {
;        GameMode := false
;        BlockGamingKeys(false)
;        TrayTip, Game Mode, 💤 Spiel beendet – Game Mode deaktiviert, 2, 1
;    }
;return

; --- Funktion zum Aktivieren / Deaktivieren der Tastensperren ---
BlockGamingKeys(state) {
    if (state) {
        ; ========== STANDARD-TASTEN ==========
        Hotkey, LWin, BlockKey, On          ; Linke Windows-Taste
        Hotkey, RWin, BlockKey, On          ; Rechte Windows-Taste
        Hotkey, CapsLock, BlockKey, On      ; CapsLock (Großschreibung)

        ; ========== OPTIONALE SEKTIONEN ==========
        ; 1️⃣ Einfügen-Taste (Insert / Einfg)
        ;Hotkey, Insert, BlockKey, On        ; verhindert Überschreibmodus

        ; 2️⃣ Funktionstasten (F1–F12)
        ;Loop, 12 {
        ;   fnKey := "F" . A_Index
        ;   Hotkey, %fnKey%, BlockKey, On
        ;}

        ; 3️⃣ Alt+Tab, Alt+F4, Ctrl+Esc (Systemkombinationen)
        ;Hotkey, !Tab, BlockKey, On
        ;Hotkey, !F4, BlockKey, On
        ;Hotkey, ^Esc, BlockKey, On

        ; 4️⃣ Sprachwechsel-Kombinationen (Windows Language Switch)
        ;Hotkey, !Shift, BlockKey, On        ; Alt + Shift (Sprache umschalten)
        ;Hotkey, ^Shift, BlockKey, On        ; Ctrl + Shift (Layout wechseln)
        ;Hotkey, #Space, BlockKey, On        ; Win + Space (Eingabesprache wechseln)

    } else {
        ; --- Alle Hotkeys wieder freigeben ---
        Hotkey, LWin, Off
        Hotkey, RWin, Off
        Hotkey, CapsLock, Off
        Hotkey, Insert, Off

        Loop, 12 {
            fnKey := "F" . A_Index
            Hotkey, %fnKey%, Off
        }

        Hotkey, !Tab, Off
        Hotkey, !F4, Off
        Hotkey, ^Esc, Off
        Hotkey, !Shift, Off
        Hotkey, ^Shift, Off
        Hotkey, #Space, Off
    }
}

; --- Diese Funktion blockiert die Tasten-Ereignisse ---
BlockKey:
return
