# 🎮 AHK Gaming Modifier Expansion System (with Profiles & Smart Shift)

A **multi-profile AutoHotkey system** for advanced gamers who run out of keyboard space on the left-hand side.  
This version introduces **Smart Shift Logic**, which allows Shift to keep its normal function (e.g. sprinting, running)  
while **also acting as a custom modifier** for selected keys.

---

## 🚀 Features

✅ **Multiple key-mapping profiles** (MOBA, MMO, Shooter, etc.)  
✅ **Smart Shift Layer** → Shift stays normal, but adds extra actions on selected keys  
✅ **Modifier flexibility:** Alt, Shift, CapsLock, AltGr, Mouse Buttons  
✅ **Configurable via `config.ini`** — no need to edit the script  
✅ **Profile selector GUI** (`Ctrl + Alt + P`)  
✅ **Windows-safe** — avoids system-level shortcuts like Alt+F4 or Win+key  
✅ **Lightweight, low-latency, game-safe**

---

## 🧠 Why “Smart Shift”?

In most games, **Shift** is already bound to sprinting or focus.  
However, it's one of the most ergonomic modifiers available.  
To avoid conflicts, we use **Smart Shift** — meaning:

- ✅ Shift continues to function normally for everything (e.g. movement, sprint)  
- 🎯 Only specific combos (e.g. Shift+Q, Shift+E, Shift+R, Shift+F) trigger mapped actions  
- 💡 This allows new hotkeys **without breaking existing gameplay mechanics**

Example:

| Input | Action |
|--------|--------|
| `Shift` | Sprint (normal) |
| `Shift + Q` | Sends `{Numpad1}` |
| `Shift + E` | Sends `{Numpad2}` |
| `Shift + F` | Sends `{Numpad3}` |

---

## ⚙️ How It Works

1. Define mappings in `config.ini` under `[MOBA]`, `[MMO]`, `[Shooter]`, etc.  
2. Each mapping uses AHK’s modifier syntax (`!` = Alt, `+` = Shift, etc.)  
3. The script dynamically loads all mappings at startup.  
4. Press **Ctrl + Alt + P** to open the **profile selector GUI**.  
5. Select a profile → mappings update instantly.

---

## 📁 Example Config (`config.ini`)

! = Alt

+ = Shift

CapsLock & = CapsLock als Modifier

<^>! = AltGr

XButton1 & = Seitliche Maustaste

```ini
[MOBA]
!q={Numpad1}
!w={Numpad2}
!e={Numpad3}
!r={Numpad4}
+a={Numpad5}
+s={Numpad6}
+d={Numpad7}
+f={Numpad8}
