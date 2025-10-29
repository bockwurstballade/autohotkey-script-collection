; --- Ultimate AHK App Launcher ---
; Features:
;   1. Hotkey-basiertes Starten von Programmen
;   2. Hotstring-basierte Textkommandos (z. B. "launch.vscode")
;   3. GUI-Menü mit Ctrl+Alt+Space

#SingleInstance Force
#Persistent
SetTitleMatchMode, 2

; ===============================
; 🧠 1️⃣ HOTKEY-BASED LAUNCHER
; ===============================
; Ctrl+Alt+C → VS Code
^!c::Run "C:\Users\<DEINNAME>\AppData\Local\Programs\Microsoft VS Code\Code.exe"

; Ctrl+Alt+W → Browser
^!w::Run "C:\Program Files\Google\Chrome\Application\chrome.exe"

; Ctrl+Alt+M → Mail
^!m::Run "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"

; Ctrl+Alt+T → Terminal
^!t::Run "wt.exe"

; Ctrl+Alt+S → Spotify
^!s::Run "C:\Users\<DEINNAME>\AppData\Roaming\Spotify\Spotify.exe"

; Ctrl+Alt+E → Explorer
^!e::Run "explorer.exe"


; ===============================
; ✍️ 2️⃣ HOTSTRING-BASED LAUNCHER
; ===============================
; Tipp "launch.vscode" → VS Code
::launch.vscode::
    SendInput, ^a{Backspace}
    Run "C:\Users\<DEINNAME>\AppData\Local\Programs\Microsoft VS Code\Code.exe"
return

; Tipp "launch.browser" → Chrome
::launch.browser::
    SendInput, ^a{Backspace}
    Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
return

; Tipp "launch.mail" → Outlook
::launch.mail::
    SendInput, ^a{Backspace}
    Run "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
return

; Tipp "launch.explorer" → Datei-Explorer
::launch.explorer::
    SendInput, ^a{Backspace}
    Run "explorer.exe"
return


; ===============================
; 🪟 3️⃣ GUI MENU LAUNCHER
; ===============================
; Öffne Menü mit Ctrl + Alt + Space
^!Space::ShowLauncherMenu()
return

ShowLauncherMenu() {
    global
    Gui, Launcher:Destroy
    Gui, Launcher:+AlwaysOnTop +ToolWindow
    Gui, Launcher:Font, s10, Segoe UI
    Gui, Launcher:Add, Text,, 🧭 **Choose an application to launch:**
    Gui, Launcher:Add, Button, gLaunchVSCode w200, VS Code
    Gui, Launcher:Add, Button, gLaunchBrowser w200, Browser (Chrome)
    Gui, Launcher:Add, Button, gLaunchMail w200, Outlook Mail
    Gui, Launcher:Add, Button, gLaunchExplorer w200, File Explorer
    Gui, Launcher:Add, Button, gLaunchSpotify w200, Spotify
    Gui, Launcher:Add, Button, gLaunchTerminal w200, Terminal
    Gui, Launcher:Show, AutoSize Center, App Launcher
}

; --- Button Actions ---
LaunchVSCode:
    Run "C:\Users\<DEINNAME>\AppData\Local\Programs\Microsoft VS Code\Code.exe"
    Gui, Launcher:Destroy
return

LaunchBrowser:
    Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
    Gui, Launcher:Destroy
return

LaunchMail:
    Run "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
    Gui, Launcher:Destroy
return

LaunchExplorer:
    Run "explorer.exe"
    Gui, Launcher:Destroy
return

LaunchSpotify:
    Run "C:\Users\<DEINNAME>\AppData\Roaming\Spotify\Spotify.exe"
    Gui, Launcher:Destroy
return

LaunchTerminal:
    Run "wt.exe"
    Gui, Launcher:Destroy
return
