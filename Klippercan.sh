#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Root Check ---
# Ensure the script is run with root privileges (i.e., using 'sudo')
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Please use 'sudo ./Klippercan.sh'"
   exit 1
fi

echo "--- Starting Klipper Prerequisite Setup ---"

# --- Network and udev Rule Configuration ---
echo "Setting up network and udev rules..."
echo '[Match]' | sudo tee --append /etc/systemd/network/80-can0.network
echo 'Name=can*' | sudo tee --append /etc/systemd/network/80-can0.network
echo ' ' | sudo tee --append /etc/systemd/network/80-can0.network
echo '[CAN]' | sudo tee --append /etc/systemd/network/80-can0.network
echo 'BitRate=1000000' | sudo tee --append /etc/systemd/network/80-can0.network
echo '# TransmitQueueLength=128 - not working and not needed as its in the rules file' | sudo tee --append /etc/systemd/network/80-can0.network
echo 'SUBSYSTEM=="net", ACTION=="change|add", KERNEL=="can*" ATTR{tx_queue_len}="128"' | sudo tee --append /etc/udev/rules.d/71-can-txqueuelen.rules

# These lines were commented out in the original script.
# sudo curl -o "/etc/systemd/network/80-can0.network" https://github.com/eddwatts/3dPrinter/raw/refs/heads/main/80-can.network -L
# sudo curl -o "/etc/udev/rules.d/71-can-txqueuelen.rules" https://github.com/eddwatts/3dPrinter/raw/refs/heads/main/71-can-txqueuelen.rules -L
# sudo curl -o "/etc/systemd/network/80-can.network" https://github.com/eddwatts/3dPrinter/raw/refs/heads/main/80-can.network -L
# sudo curl -o "/etc/udev/rules.d/99-persistent-network.rules" https://github.com/eddwatts/3dPrinter/raw/refs/heads/main/71-can-txqueuelen.rules -L

# --- Apply Network Changes ---
echo "Applying network and udev changes..."
systemctl enable systemd-networkd
systemctl restart systemd-networkd
udevadm control --reload-rules
udevadm trigger

# --- Install Required Packages ---
echo "Updating package list and installing git and can-utils..."
sudo apt-get update && sudo apt-get install -y git curl can-utils python3 ffmpeg python3-serial


# --- Clone KIAUH ---
# We clone KIAUH into the home directory of the user who ran the sudo command
# (e.g., /home/pi), not into the root home directory.
SUDO_USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
echo "Cloning the Klipper Installation and Update Helper (KIAUH) into $SUDO_USER_HOME..."
cd "$SUDO_USER_HOME"
git clone https://github.com/dw-0/kiauh.git
git clone https://github.com/Arksine/katapult
git clone https://github.com/mainsail-crew/moonraker-timelapse.git

echo "--- Setup Complete! Now Run ./kiauh/kiauh.sh---"
./kiauh/kiauh.sh
