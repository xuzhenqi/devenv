#!/usr/bin/env bash

# opencv
cd $DEV_HOME/documentation
wget -c -r -np -k -L -p http://docs.opencv.org/2.4/
wget -c -r -np -k -L -p https://ffmpeg.org/doxygen/3.2/

cd $DEV_HOME/documentation/docs.opencv.org/2.4/
python -m SimpleHTTPServer 10000 &

cd $DEV_HOME/documentation/ffmpeg.org/doxygen/3.2/
python -m SimpleHTTPServer 10001 &
