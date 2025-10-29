; --- Clipboard History Manager with Hotkeys ---
; runs continuously in background and monitors clipboard
; Keeps up to 10 clipboard items and lets you paste older ones via hotkeys
; Example hotkeys: Ctrl+Alt+2, Ctrl+Alt+3, etc.

#Persistent
#SingleInstance Force
SetTitleMatchMode, 2
ClipHistory := []  ; create empty array
MaxHistory := 10

; --- Monitor Clipboard Changes ---
OnClipboardChange("StoreClipboard")

StoreClipboard(Type) {
    global ClipHistory, MaxHistory
    if (Type != 1)  ; only text changes
        return
    ClipHistory.InsertAt(1, Clipboard)
    if (ClipHistory.Count() > MaxHistory)
        ClipHistory.RemoveAt(MaxHistory + 1)
}

; --- Paste from History ---
PasteFromHistory(index) {
    global ClipHistory
    if (index > ClipHistory.Count()) {
        MsgBox "No clipboard item #" index
        return
    }
    ClipSaved := ClipboardAll  ; backup
    Clipboard := ClipHistory[index]
    Send ^v
    Sleep 100
    Clipboard := ClipSaved  ; restore
}

; --- Define Hotkeys ---
^!1::PasteFromHistory(1)
^!2::PasteFromHistory(2)
^!3::PasteFromHistory(3)
^!4::PasteFromHistory(4)
^!5::PasteFromHistory(5)
^!6::PasteFromHistory(6)
^!7::PasteFromHistory(7)
^!8::PasteFromHistory(8)
^!9::PasteFromHistory(9)
^!0::PasteFromHistory(10)

; Optional: show history (Ctrl+Alt+H)
^!h::
    global ClipHistory
    list := ""
    for i, item in ClipHistory
        list .= i ". " SubStr(item, 1, 60) "`n"
    MsgBox list
return
