#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "--- Starting Klipper CAN Bus Setup ---"

# --- Network and udev Rule Configuration ---
echo "Downloading and setting up network and udev rules..."
sudo curl -o "/etc/systemd/network/80-can0.network" https://github.com/eddwatts/3dPrinter/raw/refs/heads/main/80-can.network -L
sudo curl -o "/etc/udev/rules.d/71-can-txqueuelen.rules" https://github.com/eddwatts/3dPrinter/raw/refs/heads/main/71-can-txqueuelen.rules -L

# These lines were commented out in the original script.
# sudo curl -o "/etc/systemd/network/80-can.network" https://github.com/eddwatts/3dPrinter/raw/refs/heads/main/80-can.network -L
# sudo curl -o "/etc/udev/rules.d/99-persistent-network.rules" https://github.com/eddwatts/3dPrinter/raw/refs/heads/main/71-can-txqueuelen.rules -L


# --- Apply Network Changes ---
echo "Applying network and udev changes..."
sudo systemctl enable systemd-networkd
sudo systemctl restart systemd-networkd
sudo udevadm control --reload-rules
sudo udevadm trigger


# --- Install Required Packages ---
echo "Updating package list and installing git and can-utils..."
sudo apt-get update
sudo apt-get install -y git can-utils


# --- Clone Klipper Software Repositories ---
echo "Cloning KIAUH, Katapult, and Moonraker Timelapse..."
cd ~
git clone https://github.com/dw-0/kiauh.git
git clone https://github.com/Arksine/katapult
git clone https://github.com/mainsail-crew/moonraker-timelapse.git

echo "--- Setup Complete! Now Run Kiauh---"
./kiauh/kiauh.sh
