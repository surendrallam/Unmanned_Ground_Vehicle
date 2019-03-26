#!/bin/sh 

La=389
Lb=395
Ra=392
Rb=255

echo 1 > /sys/class/gpio/gpio$La/value 
echo 1 > /sys/class/gpio/gpio$Lb/value 
echo 1 > /sys/class/gpio/gpio$Ra/value 
echo 1 > /sys/class/gpio/gpio$Rb/value
