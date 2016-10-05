#!/bin/bash
# Patch UVC RealSense camera format changes
cd /usr/src/kernel
sudo patch -p1 -i $HOME/librealsense/scripts/realsense-camera-formats.patch

