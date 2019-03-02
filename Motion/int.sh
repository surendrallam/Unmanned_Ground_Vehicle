#!/bin/sh

La=396
Lb=392
Ra=397
Rb=255

echo $La > /sys/class/gpio/export
echo $Lb > /sys/class/gpio/export
echo $Ra > /sys/class/gpio/export
echo $Rb > /sys/class/gpio/export

echo out > /sys/class/gpio/gpio$La/direction
echo out > /sys/class/gpio/gpio$Lb/direction
echo out > /sys/class/gpio/gpio$Ra/direction
echo out > /sys/class/gpio/gpio$Rb/direction
