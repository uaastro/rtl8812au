#!/bin/bash
# Install required packages
apt update
apt-get install build-essential
apt-get install bc
apt-get install libelf-dev
apt-get install linux-headers-`uname -r`

# Build
make
# Install
cp 88XXau_wfb.ko /lib/modules/`uname -r`/kernel/drivers/net/wireless/
cp 88XXau_wfb.ko /lib/modules/`uname -r`/kernel/drivers/net/wireless/rtl8812au/
cp wfb.conf /etc/modprobe.d/

depmod -a
modprobe -r 88XXau
modprobe 88XXau_wfb

echo restart your system to get effect



