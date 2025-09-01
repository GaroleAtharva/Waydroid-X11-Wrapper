#!/usr/bin/env bash
# Uninstall Waydroid + Weston (cleanup script)

set -euo pipefail

PKGS=(
    waydroid
    weston
)

echo "[+] Removing installed packages..."
sudo apt remove --purge -y "${PKGS[@]}"

echo "[+] Cleaning up unused dependencies..."
sudo apt autoremove -y
sudo apt clean

echo "[✓] Uninstallation complete."
