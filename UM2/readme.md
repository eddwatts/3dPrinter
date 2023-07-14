#ultimaker board:
* Use Atmega AVR - atmega2560<br>
cd ~/klipper/
make clean
make menuconfig
make
ls /dev/serial/by-id/*
sudo service klipper stop
make flash FLASH_DEVICE=/dev/serial/by-id/usb-1a86_USB2.0-Serial-if00-port0
#sudo service klipper start
<br>
#SKR PICO:
*  extra options enable
*  micro-controller architecture: Raspberry Pi RP2040
*  communication interface: usb to can bus bridgh
*  can RX GPIO: 1
*  can TX GPIO: 0
*  CAN bus Speed: 1000000<br>
make clean
make menuconfig
make
cp out/klipper.uf2 ~/printer_data/config/SKRPICO.uf2
flash using pc?
or
sudo mount /dev/sda1 /mnt
sudo cp out/klipper.uf2 /mnt
sudo umount /mnt
<br>
#THR42:
*  extra options enable
*  micro-controller architecture: Raspberry Pi RP2040
*  communication interface: can bus
*  can RX GPIO: 8
*  can TX GPIO: 9
*  CAN bus Speed: 1000000<br>
make clean
make menuconfig
make
cp out/klipper.uf2 ~/printer_data/config/THR42.uf2
flash using pc?
