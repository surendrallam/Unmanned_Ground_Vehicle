# Sniffer-TX2
Buliding of Sniffer on Jetson TX2

This repository is for building Sniffer project on TX2.

# Steps for installing the repository:
  1. Download the repository by cloning. (git clone https://github.com/surendrasafepro/Sniffer-TX2.git)
  2. Direct to the Sniffer-TX2 folder. (cd Sniffer-TX2)
  3. Install the repository using the following command. (sudo bash install.sh)
  4. once the installation is done, run the below commands in the Shell.
# a. sudo sh -c 'echo "sudo bash /home/nvidia/sniffer/shell/int.sh & sudo bash /home/nvidia/sniffer/shell/stream.sh" >> .bashrc'
# b. sudo sh -c 'echo "www-data ALL=NOPASSWD: ALL" >> sudo visudo'
# c. sudo sh -c 'echo "nvidia ALL=(ALL) NOPASSWD: ALL" >> sudo visudo'
# Note: Accepct with 'Y' whenever you are asked to choose (Y/N), and provide the system password while installation.
