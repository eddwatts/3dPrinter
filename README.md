# 3dPrinter<br>

<h2>DietPi</h2>

<b>Gettig things ready</b>
install image and find device on network
SSh in using root/dietpi
run dietpi-config
Navigate to Security options - Choose the option to Change password
chnage SSH Server - OpenSSH
install software: python3 and ffmpeg
setup wifi
quit the setup without reboot

<b>Create a Non-Root User:</b>
run the commands:
adduser -m pi
passwd pi
usermod -aG sudo,tty,dialout,video,gpio pi
reboot

<b>insatll klipper and set canbus up</b>
Login to SSH using pi login
sudo bash <(curl -s https://github.com/eddwatts/3dPrinter/raw/main/Klippercan.sh)


<h2>old:</h2>
installing from scratch:<br>
bash <(curl -s https://github.com/eddwatts/3dPrinter/raw/main/klipper-part1.sh?id=$RANDOM)<br>
install/update klipper, moonraker, fluidd/Mainsale, klipperscreen<br>
<br>
installer extras including ustreamer, timelapse, CanBoot<br>
bash <(curl -s https://github.com/eddwatts/3dPrinter/raw/main/klipper-part2.sh?id=$RANDOM)<br>
