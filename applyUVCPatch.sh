#!/bin/bash
cd $HOME/librealsense
INSTALLDIR=$PWD
cd /usr/src/kernel
sudo patch -p1 i- $INSTALLDIR/scripts/realsense-camera-formats.patch
cd $INSTALLDIR
echo $PWD

