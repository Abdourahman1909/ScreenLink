# ScreenLink

> Share any window with nearby laptops — real-time collaborative screen sharing over local WiFi.

<p align="center">
  <img src="icon.png" width="128" height="128" alt="ScreenLink Icon" />
</p>

## What is ScreenLink?

ScreenLink lets you **share any window** from your laptop to another laptop on the same WiFi — instantly. No accounts, no servers, no internet required. Just open the app on both laptops and start collaborating.

### ✨ Features

- 📡 **Auto-Discovery** — Laptops find each other automatically (zero configuration)
- 📺 **Window Sharing** — Share any specific window, not your entire screen
- 🖱️ **Remote Input** — The other person can click and type on the shared window
- 👻 **Send Away** — Hide the window from your screen to free space (other laptop still sees it)
- 🔒 **Private** — Works only on local WiFi, no data leaves your network
- 🔔 **Accept/Reject** — You choose whether to accept incoming shares

### 🖥️ Use Cases

- **Pair Programming** — Share your code editor, your partner can type directly
- **Group Projects** — Share research/docs across the table without a projector
- **Lab Work** — Send a running experiment window to your partner's screen
- **Quick Help** — Share your terminal so your friend can help debug

## Download

Go to the [**Releases**](../../releases) page and download the latest version for your OS.

### Linux

1. Download `ScreenLink-x.x.x-x86_64.AppImage`
2. Make it executable:
   ```bash
   chmod +x ScreenLink-*.AppImage
   ```
3. Run it:
   ```bash
   ./ScreenLink-*.AppImage
   ```

> **Requirements:** Linux with X11, `xdotool` and `wmctrl` for full functionality:
> ```bash
> sudo apt install xdotool wmctrl
> ```

## How It Works

1. **Open ScreenLink** on both laptops (same WiFi)
2. They **discover each other** automatically
3. Right-click the **tray icon** → pick a window → pick a device
4. The other laptop gets a **notification** → accepts → sees the window live

## Screenshots

*Coming soon*

## License

All rights reserved. This software is provided as-is for personal use.
