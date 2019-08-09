# Working
This repository contains 3 folders.
1. Motion (Contains the programs related to motion of the rover)
2. Camera (Contains the programs for live streaming of camera feed and User Interface)
3. Battery (Programs to monitor the battery voltage using ADS1115)

# Steps for installing the repository:
  1. Download the repository by cloning. (git clone git@github.com:surendrasafepro/Rover_on_TX2.git)
  2. Direct to the Sniffer-TX2 folder. (cd Sniffer-TX2)
  3. Install the repository using the following command. (sudo bash install.sh)
  4. once the installation is done, run the below commands in the Shell.

# Steps to follow after installing repository.
# a. sudo sh -c 'echo "sudo bash /home/nvidia/sniffer/shell/int.sh & sudo bash /home/nvidia/sniffer/shell/stream.sh" >> .bashrc'
# b. sudo sh -c 'echo "www-data ALL=NOPASSWD: ALL" >> sudo visudo'
# c. sudo sh -c 'echo "nvidia ALL=(ALL) NOPASSWD: ALL" >> sudo visudo'
# Note: Accepct with 'Y' whenever you are asked to choose (Y/N), and provide the system password while installation and make sure to follow above mentioned steps.
