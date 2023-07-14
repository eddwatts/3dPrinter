<h1>monster 8 v2 (canboot):</h1>
*  micro-controller architecture: STM32<br>
*  Processor model: STM32F407<br>
*  Clock: 8Mhz crystal<br>
*  communication interface: USB on PA11/PA12<br>
*  Applocation start offset: 32Kib<br>
*  Support bootloader entry on rapid double clock of reset: enable<br>
cd CanBoot<br>
make menuconfig<br>
make clean<br>
make<br>
lsusb<br>
(You should see a STMicroelectronics STM Device in DFU mode listed)<br>
sudo dfu-util -a 0 -D ~/CanBoot/out/canboot.bin --dfuse-address 0x08000000:force:mass-erase:leave -d 0483:df11<br>
<br>
<h1>monster 8 v2 (Klipper):</h1>
*  extra options enable<br>
*  micro-controller architecture: STM32<br>
*  Processor model: STM32F407<br>
*  Bootloader offset: 32Kib<br>
*  Clock: 8Mhz crystal<br>
*  communication interface: usb to can bus bridge (USB on PA11/PA12)<br>
*  can bus interface PB8/PB9<br>
*  CAN bus Speed: 1000000<br>
cd ~/klipper<br>
make clean<br>
make menuconfig<br>
make clean<br>
make<br>
reboot board to canboot<br>
python3 ~/CanBoot/scripts/flash_can.py -d  /dev/serial/by-id/usb-CanBoot_stm32f407xx_<NUMBERSHERE>-if00<br>
<br>
<h1>THR42:</h1><br>
*  extra options enable<br>
*  micro-controller architecture: Raspberry Pi RP2040<br>
*  communication interface: can bus<br>
*  can RX GPIO: 8<br>
*  can TX GPIO: 9<br>
*  CAN bus Speed: 1000000<br>
cd ~/klipper
make clean<br>
make menuconfig<br>
make<br>
cp out/klipper.uf2 ~/printer_data/config/THR42.uf2<br>
flash using pc?<br>
<br>
<h1>Find can boot devices:</h1>
~/CanBoot/scripts/flash_can.py -i can0 -q
