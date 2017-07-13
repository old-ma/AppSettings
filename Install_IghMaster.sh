#!/bin/bash
##########
# The script for installing the Igh EtherLab Master
##########

ENABLE_RTDM=true
#ENABLE_RTDM=false

if [ ${ENABLE_RTDM} ]; then
   RTDM_FLAGS="--enable-rtdm --with-rtai-dir=/usr/realtime/"
fi


# Download source 
cd /usr/src
if [ ! -f ./ethercat-hg ]; then
   hg clone http://hg.code.sf.net/p/etherlabmaster/code ethercat-hg
fi
cd ethercat-hg

# Set RTAI module symbols
RTAI_MODSYMS=/usr/realtime/modules/Module.symvers
if [ -f ${RTAI_MODSYMS} ]; then
   export KBUILD_EXTRA_SYMBOLS=${RTAI_MODSYMS}
else
   echo cannot find file ${RTAI_MODSYMS}
   exit 1
fi

# Generate  configure
if [ ! -f ./configure ]; then
    ./bootstrap
fi

# Configure 
./configure --prefix=/usr/local/ --disable-8139too --enable-e1000e  ${RTDM_FLAGS}
if [[ $? != 0 ]]
then
   echo configure is failure
   exit 1
fi

#make clean
make
make modules
make install
make modules_install


