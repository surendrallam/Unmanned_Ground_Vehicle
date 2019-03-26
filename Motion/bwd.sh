#!/bin/sh 

Lp=389 # PWM pin of Left
Ld=395 # Direction pin of Left
Rp=392
Rd=255

echo 1 > /sys/class/gpio/gpio$Lp/value 
echo 0 > /sys/class/gpio/gpio$Ld/value 
echo 1 > /sys/class/gpio/gpio$Rp/value 
echo 1 > /sys/class/gpio/gpio$Rd/value
