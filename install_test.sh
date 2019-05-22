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
sudo cp -r /home/$username/sniffer/Camera/stream.sh stream.sh

# Coding for Sniffer motion
sudo cp -r /home/$username/sniffer/Motion/int.sh int.sh
sudo cp -r /home/$username/sniffer/Motion/fwd.sh fwd.sh
sudo cp -r /home/$username/sniffer/Motion/bwd.sh bwd.sh
sudo cp -r /home/$username/sniffer/Motion/rgt.sh rgt.sh
sudo cp -r /home/$username/sniffer/Motion/lft.sh lft.sh
sudo cp -r /home/$username/sniffer/Motion/stop.sh stop.sh

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
sudo cp -r /home/$username/sniffer/Camera/sniffer.php sniffer.php
sudo cp -r /home/$username/sniffer/Camera/index.html index.html
sudo cp -r /home/$username/sniffer/Camera/jquery.min.js jquery.min.js

# Initialising the streaming at the boot.

echo 'Hoory..! Successfully installation done.'
