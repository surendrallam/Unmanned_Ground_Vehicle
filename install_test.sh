#!/bin/sh

# Updating, Upgrading and installing required dependencies and libraries.
sudo apt-get update 
sudo apt-get upgrade
sudo apt-get install cmake libjpeg8-dev
sudo apt-get install libv4l-dev
sudo apt-get install v4l-utils

echo 'System had been updated'

# Installing the Mjpg-Streamer for live-camera streaming to HTML.
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

# Installing Apache2 and PHP7
cd ~/
sudo apt-get install php libapache2-mod-php
sudo a2enmod mpm_prefork && sudo a2enmod php7.0
sudo service apache2 restart

echo 'Apache and PHP had been installed successfully'

echo 'Hoory..! Successfully installation done.'
