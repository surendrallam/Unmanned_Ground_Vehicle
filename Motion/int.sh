#!/bin/sh

Lp=389 # PWM pin of Left
Ld=395 # Direction pin of Left
Rp=392
Rd=255

echo $Lp > /sys/class/gpio/export
echo $Ld > /sys/class/gpio/export
echo $Rp > /sys/class/gpio/export
echo $Rd > /sys/class/gpio/export

echo out > /sys/class/gpio/gpio$Lp/direction
echo out > /sys/class/gpio/gpio$Ld/direction
echo out > /sys/class/gpio/gpio$Rp/direction
echo out > /sys/class/gpio/gpio$Rd/direction

#Battery check

Lr=393 # LED Red
Lg=394 # LED Green
Lb=388 # LED Blue
Burzzer=466 # Burzzer

echo $Lr > /sys/class/gpio/export
echo $Lg > /sys/class/gpio/export
echo $Lb > /sys/class/gpio/export
echo $Burzzer > /sys/class/gpio/export

echo out > /sys/class/gpio/gpio$Lr/direction
echo out > /sys/class/gpio/gpio$Lg/direction
echo out > /sys/class/gpio/gpio$Lb/direction
echo out > /sys/class/gpio/gpio$Burzzer/direction
