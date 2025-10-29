; --- Namespace-basierter Text Expander mit GUI ---
; Ermöglicht das Umschalten zwischen verschiedenen Textbaustein-Sets (Dictionaries)
; GUI öffnen mit: Ctrl + Alt + N

#SingleInstance Force
#Persistent
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t

; === Globale Variablen ===
global CurrentNamespace := "work"
global ExpansionsByNamespace := {}

; === Namespaces & Textbausteine definieren ===
ExpansionsByNamespace["work"] := Map(
    "br", "Best regards,",
    "sig", "John Doe`nConsultant, WorkCorp`nworkcorp.com",
    "today", Func("ExpandToday"),
    "time", Func("ExpandTime")
)

ExpansionsByNamespace["dev"] := Map(
    "todo", "TODO: Remember to refactor this later.",
    "fix", "FIXME: Temporary workaround — needs review.",
    "sig", "John Doe`nLead Developer`nDevTeam.io",
    "now", Func("ExpandTime")
)

ExpansionsByNamespace["mail"] := Map(
    "mfg", "Mit freundlichen Grüßen",
    "adr", "Beispielstraße 123, 10115 Berlin",
    "sig", "John Doe`nPrivatperson",
    "today", Func("ExpandToday")
)

; === GUI öffnen mit Ctrl + Alt + N ===
^!n::OpenNamespaceSelector()
return

; === GUI erstellen ===
OpenNamespaceSelector() {
    global CurrentNamespace, ExpansionsByNamespace

    Gui, Namespace:Destroy
    Gui, Namespace:+AlwaysOnTop +ToolWindow
    Gui, Namespace:Font, s10, Segoe UI
    Gui, Namespace:Add, Text,, 🌐 **Namespace auswählen:**
    
    Namespaces := ""
    for ns, _ in ExpansionsByNamespace
        Namespaces .= ns "|"
    StringTrimRight, Namespaces, Namespaces, 1
    
    Gui, Namespace:Add, DropDownList, vSelectedNS w200 Choose1, %Namespaces%
    Gui, Namespace:Add, Button, gSetNamespace w200, Aktivieren
    Gui, Namespace:Add, Text,, Aktuell aktiv: %CurrentNamespace%
    Gui, Namespace:Show, AutoSize Center, Namespace-Auswahl
}

; === Namespace aktivieren ===
SetNamespace:
    global CurrentNamespace, ExpansionsByNamespace
    Gui, Submit
    CurrentNamespace := SelectedNS
    ReloadHotstrings()
    TrayTip, Namespace gewechselt, 🌐 Aktiver Namespace: %CurrentNamespace%, 2, 1
    Gui, Namespace:Destroy
return

; === Hotstrings neu generieren ===
ReloadHotstrings() {
    global ExpansionsByNamespace, CurrentNamespace

    ; Alle bisherigen Hotstrings löschen (nur möglich durch Neuinitialisierung)
    Hotstring("Reset")

    Expansions := ExpansionsByNamespace[CurrentNamespace]
    for key, value in Expansions {
        Hotstring("::" CurrentNamespace "." key "::", Func("ExpandText").Bind(value))
        ; Zusätzlich ohne Namespace nutzbar:
        Hotstring("::" key "::", Func("ExpandText").Bind(value))
    }
}

; === Gemeinsame Expand-Funktion ===
ExpandText(value, *) {
    if IsObject(value)
        value.Call()
    else
        SendInput, % value
}

; === Hilfsfunktionen für dynamische Inhalte ===
ExpandToday() {
    FormatTime, CurrentDate,, dd.MM.yyyy
    SendInput, %CurrentDate%
}

ExpandTime() {
    FormatTime, CurrentTime,, HH:mm
    SendInput, %CurrentTime%
}

; === Initialisierung beim Start ===
ReloadHotstrings()
