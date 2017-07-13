#! /bin/bash
########################
# Linux Distribution: Ubuntu 14.04
# Linux Kernel: 3.14.33
# RTAI: 4.1.1
########################
cd /usr/src
RTAI=rtai-4.1.1
LINUX=linux-3.14.33
# Get rtai source
wget https://www.rtai.org/userfiles/downloads/RTAI/${RTAI}.tar.bz2
tar -xvf ${RTAI}.bar.bz2
ln -s ${RTAI} rtai

# Get linux kernel k
wget https://www.kernel.org/pub/linux/kernel/v3.x/${LINUX}.tar.xz
tar -xvf ${LINUX}.tar.xz
ln -s ${LINUX} linux

##########
# install package requirement
##########

# grub
#add-apt-repository ppa:danielrichter2007/grub-customizer
#apt-get update
#apt-get -y install grub-customizer
#
## general
#apt-get -y install cvs subversion build-essential git-core g++-multilib gcc-multilib ncurses-dev
#
## Rtai
#apt-get -y install libtool automake libncurses5-dev kernel-package
