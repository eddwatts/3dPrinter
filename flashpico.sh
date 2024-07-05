# delete old pico mass storage relics from file system 
echo deleted mass storage relics \(if existing\): /
sudo find /media/$USER/ -type d -name 'RPI-RP*' -prune -print -exec rm -rf {} \;

# wait until pico has mounted as mass storage device
count=0
while [ ! -d /media/$USER/RPI-RP2 ]
do 
	sleep 0.5
	echo .
	count=$((count+1))
	# exit script if pico did not mount as mass storage device
	if [ $count -ge 30 ]; then 
		echo pico did not reboot - try again!
		exit
	fi
done

# give pico some time to mount fully
sleep 0.5

# copy flash-file to pico
echo copy flash-file to pico...
#sudo find -type f -name '*.uf2' -exec cp -prv {} /media/$USER/RPI-RP2 \;
cp ~/klipper/out/klipper.uf2 /media/$USER/RPI-RP2
rm /media/$USER/RPI-RP2

# check if flash has been successful
count=0
while [ -d /media/$USER/RPI-RP2 ]
do 
	sleep 0.5
	echo .
	count=$((count+1))
	# exit script if flash was not successful (pico is still mounted as mass storage device)
	if [ $count -ge 10 ]; then 
		echo pico was reset but could not be flashed - please drag and drop .uf2-file manually!
		exit
	fi
done

echo flash successful - black magic happened ~\\\(o.O~\\\)
