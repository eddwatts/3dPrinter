# 3dPrinter<br>

## DietPi
### DietPi Klipper Installation<br>
Download the DietPi image from: https://dietpi.com/#download<br>
<br>
### Getting Things Ready<br>
install image and find device on network<br>
SSh in using root/dietpi<br>
run dietpi-config<br>
Navigate to Security options - Choose the option to Change password<br>
change SSH Server - OpenSSH<br>
setup wifi<br>
quit the setup without reboot<br>
dietpi-software
install software: python3 and ffmpeg<br>
quit the setup without reboot<br>
<br>
### Create a Non-Root User<br>
run the commands:<br>
adduser -m pi<br>
usermod -aG sudo,tty,dialout,video,gpio pi<br>
reboot<br>
<br>
<b>insatll klipper and set canbus up</b><br>
Login to SSH using pi login<br>
cd ~
### Download the script
curl -s -o Klippercan.sh https://github.com/eddwatts/3dPrinter/raw/main/Klippercan.sh

### (Optional but recommended) Inspect the script's contents
less Klippercan.sh

### Make it executable and run it
chmod +x Klippercan.sh
./Klippercan.sh
./kiauh/kiauh.sh
<br>
<br>
## old:
###installing from scratch:<br>
bash <(curl -s https://github.com/eddwatts/3dPrinter/raw/main/klipper-part1.sh?id=$RANDOM)<br>
install/update klipper, moonraker, fluidd/Mainsale, klipperscreen<br>
<br>
###installer extras including ustreamer, timelapse, CanBoot<br>
bash <(curl -s https://github.com/eddwatts/3dPrinter/raw/main/klipper-part2.sh?id=$RANDOM)<br>
