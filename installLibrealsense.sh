#!/bin/bash
# Install the Intel Realsense library librealsense on a Jetson TX1 Development Kit
# Copyright (c) 2016 Jetsonhacks 
# MIT License
INSTALL_DIR=$PWD
sudo apt-get install libusb-1.0-0-dev pkg-config -y
sudo apt-get install libglfw3-dev -y
sudo apt-get install qtcreator -y
# Install librealsense into home directory
cd $HOME
git clone https://github.com/IntelRealSense/librealsense.git
cd librealsense
# Checkout version 1.11.0 of librealsense, last tested version
git checkout v1.11.0
# git checkout 74ff66da50210e6b9edc3157411bad95c209740f
# Patches uvc-v4l2.cpp to avoid crash; removes -sse flag from .pro file 
patch -p1 -i $INSTALL_DIR/arm.patch
# Install Qt libraries
sudo scripts/install_qt.sh
# Copy over the udev rules so that camera can be run from user space
sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && udevadm trigger
# Make and Install
make -j4
sudo make install


