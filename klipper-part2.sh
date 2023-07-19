cd ~
git clone --depth=1 https://github.com/pikvm/ustreamer
git clone https://github.com/mainsail-crew/moonraker-timelapse.git
git clone https://github.com/Arksine/CanBoot
pip3 install pyserial

cd ~/moonraker-timelapse/
make install

cd ~/ustreamer
make

echo ' ' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '[update_manager timelapse]' | sudo tee --append ~/printer_data/config/moonraker.conf
echo 'type: git_repo' | sudo tee --append ~/printer_data/config/moonraker.conf
echo 'primary_branch: main' | sudo tee --append ~/printer_data/config/moonraker.conf
echo 'path: ~/moonraker-timelapse' | sudo tee --append ~/printer_data/config/moonraker.conf
echo 'origin: https://github.com/mainsail-crew/moonraker-timelapse.git' | sudo tee --append ~/printer_data/config/moonraker.conf
echo 'managed_services: klipper moonraker' | sudo tee --append ~/printer_data/config/moonraker.conf
echo ' ' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '[file_manager]' | sudo tee --append ~/printer_data/config/moonraker.conf
echo 'enable_object_processing: True' | sudo tee --append ~/printer_data/config/moonraker.conf
echo ' ' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '[timelapse]' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '##   Following basic configuration is default to most images and don't need' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '##   to be changed in most scenarios. Only uncomment and change it if your' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '##   Image differ from standart installations. In most common scenarios ' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '##   a User only need [timelapse] in their configuration.' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '#output_path: ~/timelapse/' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '##   Directory where the generated video will be saved' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '#frame_path: /tmp/timelapse/' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '##   Directory where the temporary frames are saved' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '#ffmpeg_binary_path: /usr/bin/ffmpeg' | sudo tee --append ~/printer_data/config/moonraker.conf
echo '##   Directory where ffmpeg is installed' | sudo tee --append ~/printer_data/config/moonraker.conf

echo '' | sudo tee --append ~/printer_data/moonraker.asvc
echo 'ustreamer0' | sudo tee --append ~/printer_data/moonraker.asvc
echo 'ustreamer1' | sudo tee --append ~/printer_data/moonraker.asvc
echo 'ustreamer2' | sudo tee --append ~/printer_data/moonraker.asvc
echo 'safeshutdown' | sudo tee --append ~/printer_data/moonraker.asvc

sudo curl -o ~/safeshutdown.py https://raw.githubusercontent.com/eddwatts/3dPrinter/main/SafeShutdown/newsafeshutdown.py?id=$RANDOM -L
sudo curl -o /etc/systemd/system/safeshutdown.service https://raw.githubusercontent.com/eddwatts/3dPrinter/main/SafeShutdown/safeshutdown.service?id=$RANDOM -L
sudo curl -o /etc/systemd/system/ustreamer0.service https://raw.githubusercontent.com/eddwatts/3dPrinter/main/ustreamer/ustreamer0.service?id=$RANDOM -L
sudo curl -o /etc/systemd/system/ustreamer1.service https://raw.githubusercontent.com/eddwatts/3dPrinter/main/ustreamer/ustreamer1.service?id=$RANDOM -L
sudo curl -o /etc/systemd/system/ustreamer2.service https://raw.githubusercontent.com/eddwatts/3dPrinter/main/ustreamer/ustreamer2.service?id=$RANDOM -L

sudo chmod +x ~/safeshutdown.py
sudo systemctl enable safeshutdown.service
sudo systemctl start  safeshutdown.service
sudo systemctl enable ustreamer0.service
sudo systemctl start ustreamer0.service
sudo systemctl enable ustreamer1.service
sudo systemctl start ustreamer1.service
sudo systemctl enable ustreamer2.service
sudo systemctl start ustreamer2.service

sudo systemctl stop moonraker.service
sudo cp ~/klipper/scripts/klipper-mcu.service /etc/systemd/system/
sudo systemctl enable klipper-mcu.service
sudo systemctl start klipper-mcu.service
sudo systemctl start moonraker.service
