# Run Waydroid on X11(Xorg) using Weston Compositor

This repository provides a simple setup for running **Waydroid** (Android container) on systems using **X11 (Xorg)** by leveraging **Weston** as a Wayland compositor wrapper.  

### Why is this useful?
- Waydroid normally requires a Wayland session, which is not available by default on X11 systems.  
- This repo is designed for **X11 users** who want to run Waydroid without switching their entire desktop environment to Wayland.  
- Easy install/uninstall scripts are included.  

---

## Installation

Clone this repository and install dependencies:

```bash
git clone https://github.com/GaroleAtharva/Waydroid-X11-Wrapper.git
cd Waydroid-X11-Wrapper
chmod +x install.sh
./install.sh
````

This installs:

* `waydroid`
* `weston`

---

## Setup Waydroid

After installation, initialize Waydroid:

* For **minimal (LineageOS only recommanded)**:

  ```bash
  sudo waydroid init
  ```

* For **with GAPPS (Google Apps)**:

  ```bash
  sudo waydroid init -s GAPPS
  ```

---

## Running Waydroid on X11

1. Start Weston (nested in X11):

   ```bash
   weston &
   ```

2. Inside the **Weston terminal** that opens, run:

   ```bash
   waydroid show-full-ui
   ```

---

## Uninstallation

If you want to remove everything:

```bash
cd scripts
./uninstall.sh
```

---

## ✅ Summary

* Works for **X11 users** who want Waydroid without switching to Wayland.
* Provides minimal scripts for **easy install, setup, and removal**.
* Tested on Ubuntu and Debian distros.

---

