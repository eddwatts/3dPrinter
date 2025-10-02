# 3dPrinter<br>

<h2>DietPi</h2>

<b>Gettig things ready</b><br>
install image and find device on network<br>
SSh in using root/dietpi<br>
run dietpi-config<br>
Navigate to Security options - Choose the option to Change password<br>
chnage SSH Server - OpenSSH<br>
install software: python3 and ffmpeg<br>
setup wifi<br>
quit the setup without reboot<br>
<br>
<b>Create a Non-Root User:</b><br>
run the commands:<br>
adduser -m pi<br>
passwd pi<br>
usermod -aG sudo,tty,dialout,video,gpio pi<br>
reboot<br>
<br>
<b>insatll klipper and set canbus up</b><br>
Login to SSH using pi login<br>
sudo bash <(curl -s https://github.com/eddwatts/3dPrinter/raw/main/Klippercan.sh)<br>
<br>
<br>

<h2>old:</h2>
installing from scratch:<br>
bash <(curl -s https://github.com/eddwatts/3dPrinter/raw/main/klipper-part1.sh?id=$RANDOM)<br>
install/update klipper, moonraker, fluidd/Mainsale, klipperscreen<br>
<br>
installer extras including ustreamer, timelapse, CanBoot<br>
bash <(curl -s https://github.com/eddwatts/3dPrinter/raw/main/klipper-part2.sh?id=$RANDOM)<br>
