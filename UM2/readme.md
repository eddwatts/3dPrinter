<h1>ultimaker board:</h1>
* Use Atmega AVR - atmega2560<br>
cd ~/klipper/<br>
make clean<br>
make menuconfig<br>
make<br>
ls /dev/serial/by-id/*<br>
sudo service klipper stop<br>
make flash FLASH_DEVICE=/dev/serial/by-id/usb-1a86_USB2.0-Serial-if00-port0<br>
#sudo service klipper start<br>
<br>
<h1>SKR PICO:</h1>
*  extra options enable<br>
*  micro-controller architecture: Raspberry Pi RP2040<br>
*  communication interface: usb to can bus bridgh<br>
*  can RX GPIO: 1<br>
*  can TX GPIO: 0<br>
*  CAN bus Speed: 1000000<br>
make clean<br>
make menuconfig<br>
make<br>
cp out/klipper.uf2 ~/printer_data/config/SKRPICO.uf2<br>
flash using pc?<br>
or<br>
sudo mount /dev/sda1 /mnt<br>
sudo cp out/klipper.uf2 /mnt<br>
sudo umount /mnt<br>
<br>
<h1>THR42:</h1><br>
*  extra options enable<br>
*  micro-controller architecture: Raspberry Pi RP2040<br>
*  communication interface: can bus<br>
*  can RX GPIO: 8<br>
*  can TX GPIO: 9<br>
*  CAN bus Speed: 1000000<br>
make clean<br>
make menuconfig<br>
make<br>
cp out/klipper.uf2 ~/printer_data/config/THR42.uf2<br>
flash using pc?<br>
<br>
<h1>Find can boot devices:</h1>
~/CanBoot/scripts/flash_can.py -i can0 -q
