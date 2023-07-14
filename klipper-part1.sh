echo 'dtoverlay=pi3-miniuart-bt' | sudo tee --append /boot/config.txt
echo 'disable_splash=1' | sudo tee --append /boot/config.txt
echo 'bcm2835-v4l2 max_video_width=2592 max_video_height=1944' | sudo tee --append /etc/modules
echo 'disable_camera_led=1' | sudo tee --append /boot/config.txt
echo 'allow-hotplug can0' | sudo tee --append /etc/network/interfaces.d/can0
echo 'iface can0 can static' | sudo tee --append /etc/network/interfaces.d/can0
echo ' bitrate 1000000' | sudo tee --append /etc/network/interfaces.d/can0
echo ' up ifconfig $IFACE txqueuelen 1024' | sudo tee --append /etc/network/interfaces.d/can0
echo ' pre-up ip link set can0 type can bitrate 1000000' | sudo tee --append /etc/network/interfaces.d/can0
echo ' pre-up ip link set can0 txqueuelen 1024' | sudo tee --append /etc/network/interfaces.d/can0
sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint do_legacy 0
sudo raspi-config nonint do_i2c 0
sudo apt update
sudo apt --fix-missing update
sudo apt-get upgrade -y
sudo apt-get install libjpeg-dev packagekit git libevent-dev libbsd-dev python3-virtualenv python3-dev python3-libgpiod android-tools-adb fbi liblmdb-dev libopenjp2-7 matchbox-keyboard xinput-calibrator ffmpeg libsodium-dev nginx dfu-util xinit xinput x11-xserver-utils xserver-xorg-input-evdev xserver-xorg-input-libinput -y
sudo apt autoremove -y
git clone https://github.com/th33xitus/kiauh.git
./kiauh/kiauh.sh
