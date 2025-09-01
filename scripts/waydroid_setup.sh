#Depracted follow the README.md instead

#!/usr/bin/env bash
# Setup and launch Waydroid inside Weston

set -euo pipefail

# Run waydroid init if not already done
if ! sudo waydroid status >/dev/null 2>&1; then
    echo "[+] Initializing Waydroid..."
    sudo waydroid init
fi

# Start the container
echo "[+] Starting Waydroid container..."
sudo systemctl start waydroid-container

# Launch Weston in a nested X11 window and run Waydroid session
echo "[+] Launching Weston + Waydroid..."
weston --socket=wayland-1 &
sleep 2

WAYLAND_DISPLAY=wayland-1 waydroid show-full-ui &
