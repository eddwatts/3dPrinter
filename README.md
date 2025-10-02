# 3dPrinter<br>

## DietPi
### DietPi Klipper Installation<br>
Download the DietPi image from: https://dietpi.com/#download<br>
<br>
### Getting Things Ready<br>
1. Install the image
2. find the device on your network.
3. SSH in using root / dietpi.
4. run dietpi-config menu if not loaded
5. Set up your WiFi under Network Options: Adapters.
6. Change your SSH Server to OpenSSH.
7. Exit the setup when finished. (do not reboot)
<br>
### Create a Non-Root User<br>
run the commands:<br>
'''
adduser -m pi<br>
usermod -aG sudo,tty,dialout,video,gpio pi<br>
reboot<br>
'''
<br>
### Install klipper and set canbus up<br>
Login to SSH using pi login<br>
'''
cd ~<br>
curl -s -o Klippercan.sh https://github.com/eddwatts/3dPrinter/raw/main/Klippercan.sh<br>
<br>
### (Optional but recommended) Inspect the script's contents<br>
less Klippercan.sh<br>
<br>
### Make it executable and run it<br>
sudo chmod +x Klippercan.sh<br>
./Klippercan.sh<br>
'''
<br>
<br>
## old:
###installing from scratch:<br>
bash <(curl -s https://github.com/eddwatts/3dPrinter/raw/main/klipper-part1.sh?id=$RANDOM)<br>
install/update klipper, moonraker, fluidd/Mainsale, klipperscreen<br>
<br>
###installer extras including ustreamer, timelapse, CanBoot<br>
bash <(curl -s https://github.com/eddwatts/3dPrinter/raw/main/klipper-part2.sh?id=$RANDOM)<br>
