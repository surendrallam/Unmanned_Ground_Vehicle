#!/bin/sh

PORT="8080"
SIZE="640x480"
FRAMERATE="60"

export LD_LIBRARY_PATH=/usr/local/lib
mjpg_streamer -i "input_uvc.so -f $FRAMERATE -r $SIZE -d /dev/video1 -y" -o "output_http.so -w /var/www/html -p $PORT"

