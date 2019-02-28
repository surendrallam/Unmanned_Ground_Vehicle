#!/bin/sh

# Updating, Upgrading and installing dependencies
sudo apt-get update 
sudo apt-get upgrade
sudo apt-get install cmake libjpeg8-dev

echo 'System had been updated'

# Mjpg-Streamer
# Installing the Mjpg-Streamer for camera streaming
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
mkdir sniffer
mkdir shell
cd /sniffer/shell/
wget https://raw.githubusercontent.com/surendrasafepro/Sniffer-TX2/master/stream.sh

# Coding for Sniffer motion
wget https://raw.githubusercontent.com/surendrasafepro/Sniffer-TX2/master/int.sh
wget https://raw.githubusercontent.com/surendrasafepro/Sniffer-TX2/master/int.sh
wget https://raw.githubusercontent.com/surendrasafepro/Sniffer-TX2/master/rgt.sh
wget https://raw.githubusercontent.com/surendrasafepro/Sniffer-TX2/master/lft.sh
wget https://raw.githubusercontent.com/surendrasafepro/Sniffer-TX2/master/stop.sh

# INstalling Apache2 and PHP7
sudo apt-get install php libapache2-mod-php
sudo a2enmod mpm_prefork && sudo a2enmod php7.0
sudo service apache2 restart

# Proving permissions for PHP to access the files
sudo sh -c 'echo "www-data ALL=NOPASSWD: ALL" >> sudo visudo'
sudo sh -c 'echo "%sys ALL=(ALL) NOPASSWD: ALL" >> sudo visudo'

cd /var/www/html/
wget https://raw.githubusercontent.com/surendrasafepro/Sniffer-TX2/master/sniffer.php
wget https://raw.githubusercontent.com/surendrasafepro/Sniffer-TX2/master/index.html
wget https://raw.githubusercontent.com/surendrasafepro/Sniffer-TX2/master/jquery.min.js





