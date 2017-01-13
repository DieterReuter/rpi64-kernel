#!/bin/bash
set -e
set -x

# Create target dir for build artefacts
CDIR=$PWD
BUILD_NR=$(date '+%Y%m%d-%H%M%S')
BUILD_DEST=/builds/$BUILD_NR
mkdir -p $BUILD_DEST

# Get the Linux kernel 4.9 source
if [[ -d $LINUX ]]; then
  # update kernel repo
  cd $LINUX
  git pull
  git checkout rpi-4.9.y
else
  # clone kernel repo
  git clone --single-branch --branch rpi-4.9.y --depth 1 https://www.github.com/raspberrypi/linux $LINUX
  cd $LINUX
fi

# Compile Linux kernel
MAKE="make -j 8 ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE"

# Add kernel branding for HypriotOS
sed -i 's/^EXTRAVERSION =.*/EXTRAVERSION = -bee42/g' Makefile
export LOCALVERSION="" # suppress '+' sign in 4.9.2+

# Configure the kernel
$MAKE bcmrpi3_defconfig

# Get exact kernel version string
KR=$($MAKE kernelrelease | grep "^4")
echo "Kernel release= $KR"

# Copy kernel config for later reference
cp .config $BUILD_DEST/config-$KR

# Build the kernel and modules
$MAKE
$MAKE modules

# Install modules
INSTALLDIR=$CDIR/$KR
if [[ -d $INSTALLDIR ]]; then
  rm -fr $INSTALLDIR
  mkdir -p $INSTALLDIR
fi
$MAKE INSTALL_MOD_PATH=$INSTALLDIR modules_install
rm $INSTALLDIR/lib/modules/$KR/{build,source}

# Build kernel module dependencies
depmod -a -b $INSTALLDIR $KR

# Install kernel, dtb and overlays
mkdir -p $INSTALLDIR/boot/overlays
cp arch/arm64/boot/Image $INSTALLDIR/boot/kernel8.img
cp arch/arm64/boot/dts/broadcom/bcm2710-rpi-3-b.dtb $INSTALLDIR/boot/
cp arch/arm64/boot/dts/overlays/*.dtbo $INSTALLDIR/boot/overlays/

# Create tar file
tar -cjvf $CDIR/$KR.tar.bz2 -C $INSTALLDIR .

# Copy build artefacts
cp $CDIR/$KR.tar.bz2 $BUILD_DEST/
cp -R $INSTALLDIR/boot $BUILD_DEST/
