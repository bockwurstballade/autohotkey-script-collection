# 🧠 Hotkey Viewer (AutoHotkey v2)

Ein kompaktes und modulares [AutoHotkey v2](https://www.autohotkey.com/) Skript, das auf Tastendruck automatisch die wichtigsten **Hotkeys des aktuell aktiven Programms** anzeigt.

Ideal für Power-User, Entwickler und Productivity-Fans, die ihre Tastenkombinationen im Griff behalten wollen.

---

## 🚀 Funktionen

✅ **Programm-Erkennung in Echtzeit**  
Das Skript erkennt automatisch, welches Fenster aktiv ist (z. B. Chrome, Notepad, Explorer).

✅ **Übersichtliche Hotkey-Anzeige**  
Ein kompaktes GUI-Fenster listet alle relevanten Tastenkombinationen des aktiven Programms auf.

✅ **Modularer Aufbau über Dictionaries (Maps)**  
Hotkeys werden pro Programm in einem leicht erweiterbaren Map-Objekt definiert.

✅ **Universeller Hotkey zum Öffnen der Übersicht**  
Standardmäßig: <kbd>Strg</kbd> + <kbd>Alt</kbd> + <kbd>H</kbd>  
(wenig Konfliktpotenzial mit Windows oder Drittprogrammen)

✅ **Leicht erweiterbar & individuell anpassbar**

---

## 🧩 Beispiel

Drücke **Strg + Alt + H**, während du z. B. in Chrome bist:

Hotkeys – chrome.exe

Strg + T → Neuer Tab
Strg + W → Tab schließen
Strg + Umschalt + T → Geschlossenen Tab wieder öffnen

yaml
Code kopieren

Oder in Notepad:

Hotkeys – notepad.exe

Strg + N → Neue Datei
Strg + O → Datei öffnen
Strg + S → Datei speichern

yaml
Code kopieren

---

## 📁 Projektstruktur

📦 Hotkey-Viewer/
┣ 📜 HotkeyViewer.ahk ← Hauptskript
┗ 📘 README.md ← Diese Datei

markdown
Code kopieren

Optional kannst du später noch hinzufügen:
- `config.json` → zum externen Laden der Hotkey-Definitionen
- `icons/` → Icons für GUI-Elemente
- `styles.ahk` → zentrales Styling für das Fenster

---

## ⚙️ Installation & Nutzung

1. **AutoHotkey v2** installieren  
   👉 [https://www.autohotkey.com/](https://www.autohotkey.com/)

2. **Repository klonen oder herunterladen**
   ```bash
   git clone https://github.com/<dein-user>/Hotkey-Viewer.git
Skript starten

Doppelklick auf HotkeyViewer.ahk

oder aus der Konsole:

bash
Code kopieren
autohotkey HotkeyViewer.ahk
Hotkey drücken:
<kbd>Strg</kbd> + <kbd>Alt</kbd> + <kbd>H</kbd>

🧠 Eigene Hotkeys hinzufügen
Öffne die Datei HotkeyViewer.ahk und erweitere das Dictionary ProgramHotkeys.

ahk
Code kopieren
ProgramHotkeys["vscode.exe"] := Map(
    "Strg + P", "Datei suchen",
    "Strg + Shift + P", "Befehle anzeigen",
    "Alt + ↑ / ↓", "Zeile verschieben"
)
💡 Tipp: Verwende den Prozessnamen (xyz.exe), den du im Task-Manager siehst.