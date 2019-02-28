#!/bin/sh 

La=396
Lb=392
Ra=397
Rb=255

echo 1 > /sys/class/gpio/gpio$La/value 
echo 0 > /sys/class/gpio/gpio$Lb/value 
echo 1 > /sys/class/gpio/gpio$Ra/value 
echo 0 > /sys/class/gpio/gpio$Rb/value
