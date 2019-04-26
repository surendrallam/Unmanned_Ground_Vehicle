#!/bin/sh

# Updating, Upgrading and installing dependencies
sudo apt-get update 
sudo apt-get upgrade
sudo apt-get install cmake libjpeg8-dev
sudo apt-get install libv4l-dev
sudo apt-get install v4l-utils

echo 'System had been updated'

username=$(whoami)
# Mjpg-Streamer
# Installing the Mjpg-Streamer for camera streaming
cd ~/
git clone https://github.com/jacksonliam/mjpg-streamer.git
cd mjpg-streamer/mjpg-streamer-experimental
make
sudo make install
cd ../../
sudo cp -r mjpg-streamer /usr/local/bin
cd mjpg-streamer/mjpg-streamer-experimental
sudo cp -r output_http.so input_uvc.so /usr/local/lib/

echo 'Mjpg-streamer had been installed successfully'

# coding for Camera streaming
cd ~/
mkdir sniffer
cd sniffer/
mkdir shell
cd shell/
cp camera/stream.sh stream.sh

# Coding for Sniffer motion
cp -r /home/$username/sniffer/motion/int.sh int.sh
cp -r /home/$username/sniffer/motion/fwd.sh fwd.sh
cp -r /home/$username/sniffer/motion/bwd.sh bwd.sh
cp -r /home/$username/sniffer/motion/rgt.sh rgt.sh
cp -r /home/$username/sniffer/motion/lft.sh lft.sh
cp -r /home/$username/sniffer/motion/stop.sh stop.sh

echo 'Coding for motion has been successfully done.'

# Installing Apache2 and PHP7
cd ~/
sudo apt-get install php libapache2-mod-php
sudo a2enmod mpm_prefork && sudo a2enmod php7.0
sudo service apache2 restart

echo 'Apache and PHP had been installed successfully'

# Proving permissions for PHP to access the files
sudo sh -c 'echo "www-data ALL=NOPASSWD: ALL" >> sudo visudo'
sudo sh -c 'echo "nvidia ALL=(ALL) NOPASSWD: ALL" >> sudo visudo'

# Creating the web server for Camera live streaming.
cd /var/www/html/
sudo rm -r index.html
cp -r /home/$username/sniffer/camera/sniffer.php sniffer.php
cp -r /home/$username/sniffer/camera/index.html index.html
cp -r /home/$username/sniffer/camera/jquery.min.js jquery.min.js

# Initialising the streaming at the boot.

echo 'Hoory..! Successfully installation done.'
