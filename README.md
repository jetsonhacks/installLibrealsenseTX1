# installLibrealsenseTX1
Install librealsense for Intel RealSense cameras on Jetson TX1 Development Kit

In order to install the V4L2 version of the librealsense library on the Jetson TX1, a new kernel must be built. Please see:

https://github.com/jetsonhacks/buildJetsonTX1Kernel

for instructions.

Once the source for the kernel has been downloaded and built, this scripts in this repository can be used to build the librealsense library and patch the UVC video driver to recognize the Intel RealSense video modes. First:

$ ./installLibrealsense.sh

Which will install needed dependencies, and then librealsense repository. The install script will also patch librealsense specifically for the Jetson (arm.patch) and set udev rules so that the camera may be used in user space.

Once the setup is complete, the library will be built and installed.

After installLibrealsense.sh is finished, run:

$ ./buildPatchedKernel.sh

This script will configure the kernel to use the UVC driver as a module, and then apply patches to the UVC driver to recognize the different RealSense video formats. Once the preparation is complete, the module will be installed and the kernel image will be placed in the boot directory.

Note that the running kernel will be replaced by whatever is in the /usr/src/kernel directory once the machine is restarted.



