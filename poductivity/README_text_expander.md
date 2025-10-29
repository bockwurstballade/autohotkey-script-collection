# 🧠 AHK Text Expander with Namespaces & GUI

A fully customizable **AutoHotkey-based text expansion system** that supports **multiple namespaces**, **dynamic hotstrings**, and a **GUI-based namespace selector**.

This project allows you to create and switch between different sets of text snippets (e.g., `work`, `dev`, `mail`), so you can use context-appropriate text expansions with minimal effort — system-wide and instantly.

---

## 🚀 Features

✅ **Multiple Namespaces**  
Create different snippet sets for different contexts — e.g.:
- `work.br` → “Best regards,”  
- `dev.todo` → “TODO: Remember to refactor this later.”  
- `mail.mfg` → “Mit freundlichen Grüßen”

✅ **Dynamic Hotstring Generation**  
All snippets are registered automatically when you switch namespaces — no manual coding needed.

✅ **GUI Namespace Selector**  
Press `Ctrl + Alt + N` to open a lightweight GUI to choose your active namespace.

✅ **Live Switching**  
Changing the namespace instantly updates all available snippets in memory.

✅ **Supports Functions and Variables**  
You can bind snippets to dynamic functions like inserting today’s date or current time.

---

## 💡 Example Usage

| Namespace | Hotstring | Output |
|------------|------------|--------|
| `work` | `work.br` | Best regards, |
| `work` | `work.today` | 29.10.2025 |
| `dev` | `dev.todo` | TODO: Remember to refactor this later. |
| `mail` | `mail.mfg` | Mit freundlichen Grüßen |

You can also use most hotstrings **without a prefix** (e.g. typing `br` instead of `work.br`).

---

## ⚙️ Hotkeys

| Shortcut | Action |
|-----------|---------|
| `Ctrl + Alt + N` | Open namespace selector GUI |
| (typing) `work.br` | Expands to “Best regards,” |
| (typing) `mail.today` | Inserts today’s date |

---

## 🧩 How It Works

1. **Each namespace** is represented as a dictionary (AHK `Map`) of key-value pairs.  
2. When you switch namespaces, the script:
   - Destroys all previous hotstrings  
   - Re-registers new ones dynamically  
3. You can include both **static text snippets** and **function-based expansions**.

---

## 🧱 Example Namespaces

```ahk
ExpansionsByNamespace["work"] := Map(
    "br", "Best regards,",
    "sig", "John Doe`nConsultant, WorkCorp`nworkcorp.com",
    "today", Func("ExpandToday")
)

ExpansionsByNamespace["dev"] := Map(
    "todo", "TODO: Remember to refactor this later.",
    "fix", "FIXME: Temporary workaround — needs review.",
    "sig", "John Doe`nLead Developer`nDevTeam.io"
)

ExpansionsByNamespace["mail"] := Map(
    "mfg", "Mit freundlichen Grüßen",
    "adr", "Beispielstraße 123, 10115 Berlin"
)
