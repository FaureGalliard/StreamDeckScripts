# 🎛️ Stream Deck — Windows System Scripts

A small, dependency-free collection of `.bat` and PowerShell scripts that
automate common Windows actions, designed to be triggered from an **Elgato
Stream Deck** (or any other launcher / hotkey tool).

Everything here is plain Windows — **no external programs to install.** Just
point a Stream Deck button at a script and go.

---

## 📂 Repository structure

```
scripts/
├── power/      Power & session actions
│   ├── shutdown.bat          Shut down immediately
│   ├── restart.bat           Restart immediately
│   ├── sleep.bat             Suspend the system
│   └── lock-screen.bat       Lock the workstation (Win+L)
│
├── windows/    Windows / shell tweaks
│   ├── close-all-windows.bat     Close every open window (keeps explorer.exe)
│   ├── toggle-dark-mode.bat      Switch Light/Dark mode
│   ├── empty-recycle-bin.bat     Empty the Recycle Bin (no prompt)
│   ├── toggle-desktop-icons.bat  Show / hide all desktop icons
│   └── screenshot.bat            Save a timestamped full-screen PNG
│
├── media/      Audio control (uses native multimedia keys)
│   ├── toggle-mute.bat       Mute / unmute master volume
│   ├── volume-up.bat         Volume up
│   └── volume-down.bat       Volume down
│
└── apps/       App launchers
    └── launch-stream-mode.bat   Template: open your streaming apps at once

assets/icons/   Drop your button icons here (144×144 px recommended)
```

> Scripts that need PowerShell ship as a pair: a `.ps1` with the logic and a
> tiny `.bat` launcher next to it. **Point Stream Deck at the `.bat`** — it
> resolves the `.ps1` path relative to itself, so the repo works no matter
> where you clone it.

---

## ⚙️ Requirements

- Windows 10 or Windows 11
- Standard user permissions (a few actions may need "Run as administrator")
- Elgato Stream Deck software (optional — any launcher works)

---

## 🚀 Using these with Stream Deck

1. Open the Stream Deck software.
2. Drag the **System → Open** action onto a button.
3. Set **App / File** to the `.bat` you want (e.g. `scripts\power\lock-screen.bat`).
4. (Optional) Tick **Run as Administrator** if the action needs it.
5. Assign a custom icon from `assets/icons/`.

### 📦 Share a whole button layout

Stream Deck can export an entire button set as a **`.streamDeckProfile`** file
(right-click a profile → **Export…**). Commit that file to this repo and anyone
can import it to get every button pre-wired — just have them clone the repo to
the same path the profile expects, or re-point the actions after import.

---

## 🛠️ Customization

**Add a delay before power actions** — change the `/t` value (seconds):

```bat
shutdown /s /t 10
```

**Stream-mode launcher** — open `scripts/apps/launch-stream-mode.bat` and
uncomment / edit the `start` lines to point at your own apps.

**Keep personal copies out of git** — files ending in `.local.bat` /
`.local.ps1` are git-ignored, so you can keep machine-specific versions
without committing them.

---

## ⚠️ Notes & safety

- `shutdown` / `restart` run **immediately** with `/t 0`. Add a delay if you
  want a chance to cancel (`shutdown /a` aborts a pending shutdown).
- `empty-recycle-bin.bat` deletes permanently and **without confirmation**.
- `close-all-windows` asks apps to close gracefully (you can still save), but
  unsaved work in an app that closes silently may be lost.

---

## 📄 License

[GNU GPL v3](LICENSE) — free software: use, study, share, and modify it.
Derivative works must remain under the GPL.

---

## 👨‍💻 Author

**Angel Gabriel Crispin Valdivia**
Backend Developer · Automation
