Subject: Re: [tisdk-build-scripts][PATCH 01/10] Remove very old debian/ubuntu build scripts and configs
To: meta-arago@lists.yoctoproject.org
From: "Jonathan Humphreys" <j-humphreys@ti.com>
X-Originating-Location: US (192.228.67.13)
X-Originating-Platform: Windows Chrome 96
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Nov 2021 15:10:57 -0800
References: <1637640060-31733-14-git-send-email-denis@denix.org>
In-Reply-To: <1637640060-31733-14-git-send-email-denis@denix.org>
Message-ID: <32437.1638227457727771367@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="KXvjHBUV7TBDBXcshXMo"

--KXvjHBUV7TBDBXcshXMo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 08:01 PM, Denys Dmytriyenko wrote:

>=20
> From: Denys Dmytriyenko <denys@konsulko.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Reviewed-by: Jonathan Humphreys <j-humphreys@ti.com>

>=20
> ---
> build-ubuntu-environment.sh | 194 -------------------------------
> configs/ubuntu-environment-creation.conf | 162 --------------------------
> lib/ubuntu/apt-helper-functions | 20 ----
> lib/ubuntu/create-target-files | 51 --------
> lib/ubuntu/create-ubuntu-host-chroot.sh | 77 ------------
> lib/ubuntu/do-bind-mounts.sh | 22 ----
> lib/ubuntu/kernel-build.sh | 46 --------
> lib/ubuntu/run-opentest-on-target-image | 35 ------
> lib/ubuntu/sudo-check | 5 -
> lib/ubuntu/use-armhf-pbuilder.sh | 117 -------------------
> 10 files changed, 729 deletions(-)
> delete mode 100755 build-ubuntu-environment.sh
> delete mode 100644 configs/ubuntu-environment-creation.conf
> delete mode 100644 lib/ubuntu/apt-helper-functions
> delete mode 100644 lib/ubuntu/create-target-files
> delete mode 100755 lib/ubuntu/create-ubuntu-host-chroot.sh
> delete mode 100755 lib/ubuntu/do-bind-mounts.sh
> delete mode 100755 lib/ubuntu/kernel-build.sh
> delete mode 100644 lib/ubuntu/run-opentest-on-target-image
> delete mode 100644 lib/ubuntu/sudo-check
> delete mode 100755 lib/ubuntu/use-armhf-pbuilder.sh
>=20
> diff --git a/build-ubuntu-environment.sh b/build-ubuntu-environment.sh
> deleted file mode 100755
> index b5dbf45..0000000
> --- a/build-ubuntu-environment.sh
> +++ /dev/null
> @@ -1,194 +0,0 @@
> -#!/bin/bash
> -
> -# Setup signal traps to stop any running background processes as well in
> -# the case that the script is stopped or exits
> -trap 'test -z "`jobs -p`" || kill `jobs -p` > /dev/null 2>&1; echo "I go=
t
> a signal"' SIGINT SIGQUIT SIGTSTP EXIT
> -
> -## Internal variables
> -MYLIBS=3D`dirname $0`/lib
> -
> -## Our library functions
> -source $MYLIBS/common-functions
> -source $MYLIBS/ubuntu/create-target-files
> -source $MYLIBS/ubuntu/apt-helper-functions
> -source $MYLIBS/ubuntu/sudo-check
> -source $MYLIBS/run-opentest
> -source $MYLIBS/ubuntu/run-opentest-on-target-image
> -
> -# Shorten the command to work in the ARM targetfs chroot
> -chroot_arm_targetfs() {
> - sudo chroot $BUILD_ROOT chroot /tmp/targetfs $*
> -}
> -
> -if [ $(sudo_check) -ne 0 ]; then
> - echo "Problem using sudo, exiting"
> - exit 1
> -fi
> -
> -# Add our directory to PATH for now
> -PATH=3D${PATH}:$MYLIBS/ubuntu
> -
> -# Parse the input config file to set the required build variables
> -parse_config_file `dirname $0`/configs/ubuntu-environment-creation.conf
> -
> -# Verify that the MANDATORY_INPUTS have been set. We know there are some
> -# values that absolutely need to be set or else you will end up
> -# trashing your host configuration.
> -if [ "$MANDATORY_INPUTS" =3D=3D "" ]
> -then
> - echo "Mandatory inputs not set"
> - exit 1
> -fi
> -
> -check_mandatory_inputs $MANDATORY_INPUTS
> -
> -## Finish our internal variables.
> -TARGETFS=3D$BUILD_ROOT/tmp/targetfs
> -
> -# Prepare the host chroot.
> -echo "Starting in `pwd`"
> -echo "Making clean Ubuntu 12.04.1 chroot (host)"
> -create-ubuntu-host-chroot.sh --release precise --target $BUILD_ROOT
> -use-armhf-pbuilder.sh --chroot $BUILD_ROOT --command create
> -
> -# Start the ARM targetfs directory out
> -mkdir -p $BUILD_ROOT/tmp/targetfs
> -if [ ! -x `which wget` ]; then
> - echo "Could not find wget, aborting!"
> - exit 1
> -fi
> -wget $ARMCOREURI
> -sudo tar -C $TARGETFS -xf `basename $ARMCOREURI`
> -rm `basename $ARMCOREURI`
> -do-bind-mounts.sh $TARGETFS
> -
> -# Fetch kernel sources. When using gitorious we may have to wait while
> -# the tarball is being generated.
> -wget --no-check-certificate -O linux.tgz $KERNELSRCURI
> -grep -q "he archive is currently being generated, try " linux.tgz
> -while test $? -eq 0; do
> - sleep 60
> - wget --no-check-certificate -O linux.tgz $KERNELSRCURI
> - grep -q "he archive is currently being generated, try " linux.tgz
> -done
> -cp $MYLIBS/ubuntu/kernel-build.sh $BUILD_ROOT/tmp/
> -mv linux.tgz $BUILD_ROOT/tmp/
> -# Now build.
> -use-armhf-pbuilder.sh --chroot $BUILD_ROOT --command --execute \
> - -- /tmp/kernel-build.sh --config $KERNELCONFIGTGT \
> - --source-tarball /tmp/linux.tgz
> -
> -# Start the feed.
> -mkdir -p $BUILD_ROOT/tmp/feed/dists/precise/main/binary-arm{el,hf}
> -
> -# See if we have a directory of packages to rebuild and place into the
> feed.
> -if [ "x$DEBPKGDIR" !=3D "x" ]; then
> - sudo mkdir $BUILD_ROOT/tmp/rebuildme
> - sudo mount -o bind $DEBPKGDIR $BUILD_ROOT/tmp/rebuildme
> -
> - # Now build.
> - for DSC in `(cd $DEBPKGDIR;ls *.dsc)`;do
> - use-armhf-pbuilder.sh --chroot $BUILD_ROOT --command \
> - build /tmp/rebuildme/$DSC
> - done
> -
> - # Move to feed directory.
> - sudo mv $BUILD_ROOT/var/cache/pbuilder/result/*.deb \
> - $BUILD_ROOT/tmp/feed/dists/precise/main/binary-armhf/
> - sudo umount $BUILD_ROOT/tmp/rebuildme
> -fi
> -
> -# Create our local feed for this
> -sudo chown -R `id -u` $BUILD_ROOT/tmp/tmp.*
> -sudo mv $BUILD_ROOT/tmp/tmp.*/*.deb
> $BUILD_ROOT/tmp/feed/dists/precise/main/binary-armel/
> -sudo chroot $BUILD_ROOT sh -c \
> - "cd /tmp/feed;dpkg-scanpackages -a armel dists" > Packages
> -sudo mv Packages $BUILD_ROOT/tmp/feed/dists/precise/main/binary-armel/
> -sudo chroot $BUILD_ROOT sh -c \
> - "cd /tmp/feed;dpkg-scanpackages -a armhf dists" > Packages
> -sudo mv Packages $BUILD_ROOT/tmp/feed/dists/precise/main/binary-armhf/
> -
> -# Prepare the ARM chroots for use
> -sudo cp $BUILD_ROOT/usr/bin/qemu-arm-static $TARGETFS/usr/bin/
> -sudo cp `dirname $0`/configs/target-debconf-selections.txt $TARGETFS/tmp=
/
>=20
> -if [ "x$USE_PROXY" =3D=3D "x1" ]; then
> - create_apt_conf_d_proxy
> - sudo mv proxy $TARGETFS/etc/apt/apt.conf.d/
> -fi
> -sudo cp /etc/resolv.conf $TARGETFS/etc/
> -echo foreign-architecture armel | \
> - sudo tee $TARGETFS/etc/dpkg/dpkg.cfg.d/architectures
> -sudo sed -i -e 's/^# deb /deb /g' -e 's/^deb /deb [arch=3Darmhf] /' \
> - $TARGETFS/etc/apt/sources.list
> -echo "deb [arch=3Darmel,armhf] file:/tmp/feed precise main" | \
> - sudo tee $TARGETFS/etc/apt/sources.list.d/local.list
> -
> -# Now install in the target chroot
> -mkdir -p $TARGETFS/tmp/feed
> -sudo mount -o bind $BUILD_ROOT/tmp/feed $TARGETFS/tmp/feed
> -chroot_arm_targetfs debconf-set-selections
> /tmp/target-debconf-selections.txt
> -chroot_arm_targetfs apt-get update
> -chroot_arm_targetfs apt-get --yes --force-yes upgrade
> -chroot_arm_targetfs apt-get --yes --force-yes install ${TARGET_PACKAGES}
> -chroot_arm_targetfs apt-get --yes --force-yes install
> linux-firmware-image \
> - linux-image-$KERNELVER
> -sudo umount $TARGETFS/tmp/feed
> -sudo rm $TARGETFS/etc/apt/sources.list.d/local.list \
> - $TARGETFS/tmp/target-debconf-selections.txt
> -
> -# Make sure we can login
> -create_serial_auto_detect_console_files
> -sudo mv serial-auto-detect-console.conf $TARGETFS/etc/init/
> -sudo mv serial-console $TARGETFS/bin/
> -sudo chmod 0755 $TARGETFS/bin/serial-console
> -sudo chown 0:0 $TARGETFS/bin/serial-console \
> - $TARGETFS/etc/init/serial-auto-detect-console.conf
> -
> -# Add a user to login with, in the targetfs
> -chroot_arm_targetfs adduser --disabled-password -q demo --gecos \"\"
> -sudo sed -i -e 's/^demo:x:1000/demo::1000/' $TARGETFS/etc/passwd
> -# No password root.
> -sudo sed -i -e 's/^root:x:0/root::0/' $TARGETFS/etc/passwd
> -if [ "x$ENABLE_OPENTEST" !=3D "x" ]; then
> - # For opentest, we need to add pts/0-7 to /etc/securetty
> - printf "pts/0\npts/1\npts/2\npts/3\npts/4\npts/5\npts/6\npts/7\n" | \
> - sudo tee -a $TARGETFS/etc/securetty
> -fi
> -# And allow sudo for 'demo'
> -echo "demo ALL=3DNOPASSWD: ALL" | sudo tee $TARGETFS/etc/sudoers.d/demo
> -
> -# TODO: Make removing qemu-arm-static from targetfs an option for
> debugging on
> -# host
> -
> -# Clean up
> -# We borrow from
> -# http://askubuntu.com/questions/162319/how-do-i-stop-all-processes-in-a=
-chroot
>=20
> -# for a "kill everything" type solution within the target chroot.
> -do-bind-mounts.sh --unmount $BUILD_ROOT
> -for ROOT in /proc/*/root; do
> - LINK=3D$(sudo readlink $ROOT)
> - if [ "x$LINK" !=3D "x" ]; then
> - if [ "x${LINK:0:${#TARGETFS}}" =3D "x$TARGETFS" ]; then
> - # this process is in the chroot...
> - sudo kill -9 $(basename $(dirname "$ROOT"))
> - fi
> - fi
> -done
> -do-bind-mounts.sh --unmount $TARGETFS
> -sudo rm $TARGETFS/etc/resolv.conf
> -
> -# Archive target rootfs
> -# TODO: Add more options than tar.gz?
> -if [ ! -d out ]; then
> - mkdir out
> -fi
> -
> -sudo tar -C $TARGETFS --one-file-system -jcf out/targetfs.tar.bz2 .
> -
> -if [ "x$ENABLE_OPENTEST" !=3D "x" ]; then
> - # Prepare for opentest, which requires ifconfig in the path.
> - PATH=3D${PATH}:$MYLIBS/ubuntu:/sbin
> - mkdir -p $LOG_DIR
> - set_opentest_platform $MACHINES
> - run_opentest_on_image $MACHINES
> -fi
> diff --git a/configs/ubuntu-environment-creation.conf
> b/configs/ubuntu-environment-creation.conf
> deleted file mode 100644
> index 7ca04da..0000000
> --- a/configs/ubuntu-environment-creation.conf
> +++ /dev/null
> @@ -1,162 +0,0 @@
> -########################################################################=
########
>=20
> -# Ubuntu Environment configuration file #
> -########################################################################=
########
>=20
> -
> -# This variable contains the list of variables found in this congif file
> -# that MUST be set to a value. Failure to set these variables could
> -# lead to corruption of the host system or the build script not
> -# executing properly
> -MANDATORY_INPUTS=3D"USE_PROXY ARMCOREURI MACHINES BUILD_ID SCRIPTS_ROOT
> BUILD_ROOT FS_IMAGE_TYPE NFS_ROOT LOG_DIR"
> -
> -# This variable contains the list of machines to build an SDK for
> -MACHINES=3D"am335x-evm"
> -
> -# This variable holds the unique ID for the build that will be used to
> -# identify the build.
> -BUILD_ID=3D"`date +build-%F_%H-%M-%S`"
> -
> -# This variable contains the script directory where these scripts are
> running
> -# from. This is to allow finding other files used during the build later=
.
>=20
> -# You should likely not change this
> -SCRIPTS_ROOT=3D"$PWD"
> -
> -# This variable points to be base of your build where the chroots will b=
e
>=20
> -# constructed and based within.
> -BUILD_ROOT=3D"$SCRIPTS_ROOT/ubuntu-$(uname -m)-12.04.1-chroot"
> -
> -# This variable contains the "filter" string to look for inside of the
> -# SDK to select which file system to test. Currently only testing of
> -# one file system is supported.
> -FS_FILTER=3D""
> -
> -# This variable indicates the type of FS images being generated. By
> default
> -# this is tar.gz images. This should match what you set in your recipes
> -FS_IMAGE_TYPE=3D"tar.bz2"
> -
> -# This variable points to an NFS share which has been pre-configured. Th=
e
>=20
> -# target testing will be done by creating a subdirectory in this NFS_ROO=
T
>=20
> -# for each machine to boot the target board.
> -# This directory should be configured to allow writing by the jenkins
> user
> -# at a minimum, although allowing writing by anyone is simple.
> -NFS_ROOT=3D"/home/jenkins/nfs-root"
> -
> -# This directory will contain the log files for the various parts of the
> build.
> -# This includes:
> -# 1. Overall build process log (i.e. which machines are in which build
> dir)
> -# 2. Build logs for individual machines
> -# 3. Test logs for individual machines
> -# 4. Packaging logs for individual machines
> -LOG_DIR=3D"${SCRIPTS_ROOT}/log-files"
> -
> -# This variable points to the base location where files will be extracte=
d
> for
> -# testing purposes. This should not be confused with the NFS root which
> -# will be configured below.
> -# This variable should always be declared AFTER the BUILD_ROOT variable.
> -# The build scripts will create subdirectories such as:
> -# - TEST_ROOT/tmp/am335x-evm-test
> -# You can usually just take the default value
> -TEST_ROOT=3D"$BUILD_ROOT/tmp/testing"
> -
> -# This variable points to the directory with the test scripts you want t=
o
>=20
> -# run. The entire directory will be copied to make removing the test
> scripts
> -# easier during cleanup.
> -# NOTE: The assumption is that this directory contains at least the
> -# following files:
> -# - opentest.sh // This is called by opentest framework
> -# - S90-fake-pointercal // This fakes pointer calibration
> -# - nightly-test.sh // This is called by opentest.sh and does
> -# machine specific testing
> -# NOTE: Since the scripts will be copied to /home/root/<directory name>
> -# the opentest.sh script should call the scripts in the new directory.
> -TEST_SCRIPTS=3D"$SCRIPTS_ROOT/test-scripts"
> -
> -# This variable points to the directory within the target filesystem tha=
t
>=20
> -# the scripts directory in TEST_SCRIPTS will be copied as.
> -TEST_SCRIPTS_TGT=3D"root/test-scripts"
> -
> -# This variable contains the tarball name for the opentest CLI which is
> -# required to do target side testing.
> -OPENTEST_CLI=3D"$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
> -
> -# This variable will allow control over whether to perform build testing
> or
> -# skip it. This should usually be set to true but may be changed for
> -# prototyping.
> -RUN_BUILD_TESTS=3D"true"
> -
> -# This variable points to the STAF installation location which is used
> -# during the build test steps to call into the OpenTest Framework. This
> -# default value is the default value from the STAF installer
> -STAF_ROOT=3D"/usr/local/staf"
> -
> -# This variable indicates whether to continue the build process for a
> machine
> -# even when the build testing fails. This can be useful in the case of
> -# the test system being down to allow the full packaging of the SDK to
> -# continue.
> -SKIP_TEST_FAILURES=3D"false"
> -
> -########################################################################=
########
>=20
> -# Network proxy related options, used during creating of the target. Set
> -# them to blank if not needed.
> -########################################################################=
########
>=20
> -
> -# Do we need to be using some sort of proxies at all?
> -USE_PROXY=3D1
> -
> -# If we need to use a proxy, and it is not already set within the
> -# environment, set these variables as well.
> -http_proxy=3D http://wwwgate.ti.com:80
> -#https_proxy=3D http://wwwgate.ti.com:80
> -#ftp_proxy=3D http://wwwgate.ti.com:80
> -
> -# If we have a local caching proxy for fetching debs, set this
> -LOCALDEBPROXY=3D" http://apt-cache.dal.design.ti.com:3142"
> -
> -# If we have a local deb mirror as well, set this
> -LOCALDEBMIRROR=3D"ubuntu.dal.design.ti.com"
> -
> -########################################################################=
########
>=20
> -# Location of the target chroot
> -ARMCOREURI=3D" http://cdimage.ubuntu.com/ubuntu-core/releases/12.04/rele=
ase/ubuntu-core-12.04.1-core-armhf.tar.gz"
>=20
> -
> -# Location of the kernel sources, and defconfig target
> -KERNELSRCURI=3D" https://gitorious.ti.com/ti-linux-kernel/ti-linux-kerne=
l/archive-tarball/ti-linux-3.8-rc3"
>=20
> -KERNELCONFIGTGT=3D"omap2plus"
> -KERNELVER=3D"3.8.0-rc3"
> -
> -# A directory that contains packages to be built by us. For each package
> -# you need to include all of the outputs from 'debuild -i -uc -us -S'
> -# in the original package sources.
> -DEBPKGDIR=3D"$SCRIPTS_ROOT/rebuildme"
> -
> -########################################################################=
########
>=20
> -# OpenTest configuration section.
> -########################################################################=
########
>=20
> -
> -# Do we want to run opentest? This will enable additional things such as
> -# no password root login via telnet.
> -ENABLE_OPENTEST=3D"1"
> -
> -# Packages on the target that must be installed for OpenTest to run and
> test
> -# things. telnetd must be installed for the framework to connect to the
> -# target. Anything else would be for the individual tests.
> -TARGET_OPENTEST_PACKAGES=3D"telnetd"
> -
> -########################################################################=
########
>=20
> -# Package selection for the target and optional host environment.
> -########################################################################=
########
>=20
> -
> -# Various packages we want to install into the final target filesystem
> -# We install debconf-utils for debconf-get-selections which we use to
> keep
> -# target-debconf-selections.txt up to date and make package installation
> -# non-interactive.
> -TARGET_BASE_PACKAGES=3D"u-boot"
> -TARGET_MISC_PACKAGES=3D"sudo debconf-utils"
> -TARGET_NETWORK_PACKAGES=3D"net-tools isc-dhcp-client"
> -TARGET_X11_PACKAGES=3D"xserver-xorg-input-tslib xfce4"
> -TARGET_PACKAGES=3D"${TARGET_MISC_PACKAGES} ${TARGET_NETWORK_PACKAGES} \
> - ${TARGET_X11_PACKAGES} ${TARGET_OPENTEST_PACKAGES} \
> - ${TARGET_BASE_PACKAGES}"
> -
> -# Various packages we want to install into the host chroot environment.
> -HOST_CHROOT_ENV_PACKAGES=3D"qemu-user-static pbuilder debootstrap
> devscripts \
> - pbuilder-scripts dpkg-dev"
> diff --git a/lib/ubuntu/apt-helper-functions
> b/lib/ubuntu/apt-helper-functions
> deleted file mode 100644
> index 6ac05aa..0000000
> --- a/lib/ubuntu/apt-helper-functions
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -create_apt_conf_d_proxy() {
> - PROXY=3D""
> - MIRROR=3D""
> - if [ "x$LOCALDEBPROXY" !=3D "x" ]; then
> - PROXY=3D"Proxy \"$LOCALDEBPROXY\";"
> - fi
> - if [ "x$LOCALDEBMIRROR" !=3D "x" ]; then
> - MIRROR=3D"Proxy::$LOCALDEBMIRROR \"DIRECT\";"
> - fi
> -# TODO: Use mktemp
> - cat << EOF > proxy
> -Acquire
> -{
> - http {
> - $PROXY
> - $MIRROR
> - }
> -}
> -EOF
> -}
> diff --git a/lib/ubuntu/create-target-files
> b/lib/ubuntu/create-target-files
> deleted file mode 100644
> index 20d1089..0000000
> --- a/lib/ubuntu/create-target-files
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -# Create the two files needed for serial consoles
> -create_serial_auto_detect_console_files() {
> -# TODO: Use mktemp
> - cat << EOF > serial-auto-detect-console.conf
> -# serial-auto-detect-console - starts getty on serial console
> -#
> -# This service starts a getty on the serial port given in the 'console'
> kernel
> -# argument.
> -#
> -
> -start on runlevel [23]
> -stop on runlevel [!23]
> -
> -respawn
> -
> -exec /bin/sh /bin/serial-console
> -EOF
> -
> - cat << EOF > serial-console
> -#!/bin/bash
> -for arg in \$(cat /proc/cmdline)
> -do
> - case \$arg in
> - console=3D*)
> - tty=3D\${arg#console=3D}
> - tty=3D\${tty#/dev/}
> -
> - case \$tty in
> - tty[a-zA-Z]* )
> - PORT=3D\${tty%%,*}
> -
> - # check for service which do something on this port
> - if [ -f /etc/init/\$PORT.conf ];then continue;fi
> -
> - tmp=3D\${tty##\$PORT,}
> - SPEED=3D\${tmp%%n*}
> - BITS=3D\${tmp##\${SPEED}n}
> -
> - # 8bit serial is default
> - [ -z \$BITS ] && BITS=3D8
> - [ 8 -eq \$BITS ] && GETTY_ARGS=3D"\$GETTY_ARGS -8 "
> -
> - [ -z \$SPEED ] && SPEED=3D'115200,57600,38400,19200,9600'
> -
> - GETTY_ARGS=3D"\$GETTY_ARGS \$SPEED \$PORT"
> - exec /sbin/getty \$GETTY_ARGS
> - esac
> - esac
> -done
> -EOF
> -}
> diff --git a/lib/ubuntu/create-ubuntu-host-chroot.sh
> b/lib/ubuntu/create-ubuntu-host-chroot.sh
> deleted file mode 100755
> index 07644e3..0000000
> --- a/lib/ubuntu/create-ubuntu-host-chroot.sh
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -#!/bin/bash
> -#
> -# This script will create a 'buildd' variant chroot of the passed in
> release
> -# name and place it into the named directory.
> -
> -if [ $# -ne 4 ]; then
> - echo "Usage:"
> - echo "$0 --release codename --target chroot-directory"
> - echo "For example:"
> - echo "$0 --release precise --target ubuntu-12.04.1-chroot"
> - exit 1
> -fi
> -
> -while test $# -ne 0; do
> - if [ "$1" =3D=3D "--release" ]; then
> - RELEASE=3D"$2"
> - shift 2
> - elif [ "$1" =3D=3D "--target" ]; then
> - HOSTCHROOT=3D"$2"
> - shift 2
> - else
> - echo "Unsupported argument $1"
> - exit 1
> - fi
> -done
> -
> -## Internal variables
> -MYLIBS=3D`dirname $0`
> -MYCONF=3D`dirname $0`/../../configs
> -
> -## Our library functions
> -. $MYLIBS/apt-helper-functions
> -. $MYLIBS/sudo-check
> -
> -## Configuration details
> -. $MYCONF/ubuntu-environment-creation.conf
> -
> -## Add our directory to PATH for now
> -PATH=3D${PATH}:$MYLIBS
> -
> -if [ $(sudo_check) -ne 0 ]; then
> - echo "Problem using sudo, exiting"
> - exit 1
> -fi
> -
> -if [ `uname -m` =3D=3D "x86_64" ]; then
> - HOSTARCH=3Damd64
> -elif [ `uname -m` =3D=3D "i686" ]; then
> - HOSTARCH=3Di386
> -else
> - echo "Could not determine host arch (uname -m) for Ubuntu, exiting"
> - exit 1
> -fi
> -
> -sudo debootstrap --variant=3Dbuildd --arch $HOSTARCH $RELEASE $HOSTCHROO=
T \
>=20
> - http://mirrors.us.kernel.org/ubuntu/
> -
> -# Setup bind mounts
> -do-bind-mounts.sh $HOSTCHROOT
> -
> -# Prepare the host chroot.
> -if [ "x$USE_PROXY" =3D=3D "x1" ]; then
> - create_apt_conf_d_proxy
> - sudo mv proxy $HOSTCHROOT/etc/apt/apt.conf.d/
> -fi
> -sudo cp /etc/hosts $HOSTCHROOT/etc/
> -printf "deb http://us.archive.ubuntu.com/ubuntu/ $RELEASE universe
> -deb http://us.archive.ubuntu.com/ubuntu/ $RELEASE-updates universe
> -deb http://us.archive.ubuntu.com/ubuntu/ $RELEASE-backports universe\n" =
|
> \
> - sudo tee $HOSTCHROOT/etc/apt/sources.list.d/$RELEASE-universe.list
> -export HOME=3D`mktemp -d`
> -sudo mkdir -p $HOSTCHROOT/$HOME
> -sudo chroot $HOSTCHROOT apt-get update
> -sudo chroot $HOSTCHROOT apt-get --yes install ${HOST_CHROOT_ENV_PACKAGES=
}
>=20
> -
> -# Clean up
> -do-bind-mounts.sh --unmount $HOSTCHROOT
> diff --git a/lib/ubuntu/do-bind-mounts.sh b/lib/ubuntu/do-bind-mounts.sh
> deleted file mode 100755
> index 96c15d7..0000000
> --- a/lib/ubuntu/do-bind-mounts.sh
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -#!/bin/bash
> -
> -if [ $# -lt 1 -o $# -gt 2 -o $# -eq 2 -a "$1" !=3D "--unmount" ]; then
> - echo "$0 [--unmount] directory"
> - exit 1;
> -fi
> -
> -# Handle unmount
> -if [ $# -eq 2 ];then
> - for DIR in dev/pts dev sys proc/sys/fs/binfmt_misc proc;do
> - sudo umount $2/$DIR 2>/dev/null
> - done
> - exit 0;
> -fi
> -
> -for DIR in sys dev dev/pts proc;do
> - if [ ! -d $1/$DIR ]; then
> - echo "No $1/$DIR ? Exit!"
> - exit 1
> - fi
> - sudo mount -o bind /$DIR $1/$DIR
> -done
> diff --git a/lib/ubuntu/kernel-build.sh b/lib/ubuntu/kernel-build.sh
> deleted file mode 100755
> index dac3e2f..0000000
> --- a/lib/ubuntu/kernel-build.sh
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -#!/bin/bash
> -#
> -# Given that we are being invoked in an environment where 'make deb-pkg'
> in
> -# the kernel will produce the deb packages for the architecture we want,
> we
> -# need to be passed:
> -# --config target (such as omap2plus)
> -# --source-tarball (such as linux-am33x.tar.bz2)
> -#
> -# And we are given a pre-patched (if needed) source tree.
> -#
> -
> -if [ $# -ne 4 ]; then
> - echo "Usage:"
> - echo "$0 --config config_target --source-tarball source.tar.bz2"
> - echo "For example:"
> - echo "$0 --config omap2plus --source-tarball linux-am33x.tar.bz2"
> - exit 1
> -fi
> -
> -while test $# -ne 0; do
> - if [ "$1" =3D=3D "--config" ]; then
> - CONFIG=3D"$2"
> - shift 2
> - elif [ "$1" =3D=3D "--source-tarball" ]; then
> - SRC=3D"$2"
> - shift 2
> - else
> - echo "Unsupported argument $1"
> - exit 1
> - fi
> -done
> -
> -# Unpack, configure, build.
> -D1=3D`mktemp -d`
> -cd $D1
> -tar xf $SRC
> -KSRC=3D`ls`
> -cd $KSRC
> -make ${CONFIG}_defconfig
> -if [ -x /usr/bin/getconf ]; then
> - JOBS=3D`getconf _NPROCESSORS_CONF`
> -else
> - JOBS=3D2
> -fi
> -make -j$JOBS uImage modules
> -make KBUILD_IMAGE=3DuImage deb-pkg
> diff --git a/lib/ubuntu/run-opentest-on-target-image
> b/lib/ubuntu/run-opentest-on-target-image
> deleted file mode 100644
> index 066e8dc..0000000
> --- a/lib/ubuntu/run-opentest-on-target-image
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -run_opentest_on_image() {
> - # Set m for logging purposes
> - m=3D"$1"
> -
> - # Create a temporary directory to extract the build files to for
> - # testing. If the directory already exists then delete the old
> - # contents first.
> - test_dir=3D"$TEST_ROOT/$m-test"
> -
> - if [ -d $test_dir ]
> - then
> - rm -rf $test_dir
> - fi
> - mkdir -p $test_dir
> -
> - # Only run the build testing if the config file says to do so
> - if [ "$RUN_BUILD_TESTS" =3D=3D "true" ]
> - then
> - run_target_side_test $m
> - else
> - echo "SKIPPED" > $LOG_DIR/$m-test-result.txt
> - fi
> -
> - if [ "$?" !=3D "0" -a "$SKIP_TEST_FAILURES" =3D=3D "true" ]
> - then
> - # Check if this was a CRITICAL failure
> - grep "CRITICAL" $LOG_DIR/$m-test-result.txt > /dev/null 2>&1
> - if [ "$?" =3D=3D "0" ]
> - then
> - # This was a critical failure so return without copying
> - # the files
> - return 1
> - fi
> - fi
> -}
> diff --git a/lib/ubuntu/sudo-check b/lib/ubuntu/sudo-check
> deleted file mode 100644
> index d80b390..0000000
> --- a/lib/ubuntu/sudo-check
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -sudo_check() {
> - # See if the user is allowed to use sudo
> - sudo -v > /dev/null 2>&1
> - echo $?
> -}
> diff --git a/lib/ubuntu/use-armhf-pbuilder.sh
> b/lib/ubuntu/use-armhf-pbuilder.sh
> deleted file mode 100755
> index fa4cca3..0000000
> --- a/lib/ubuntu/use-armhf-pbuilder.sh
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -#!/bin/bash
> -#
> -# This script will call pbuilder create and make the armhf that can be
> -# used later to build target packages. We take an optional argument of
> -# --chroot host-chroot of a directory to chroot into and invoke our
> -# pbuilder commands.
> -
> -## Internal variables
> -MYLIBS=3D`dirname $0`/..
> -MYCONF=3D`dirname $0`/../../configs
> -
> -## Our library functions
> -source $MYLIBS/ubuntu/sudo-check
> -source $MYLIBS/common-functions
> -
> -while test $# -ne 0; do
> - if [ "$1" =3D=3D "--chroot" ]; then
> - HOSTCHROOT=3D"$2"
> - shift 2
> - elif [ "$1" =3D=3D "--command" ]; then
> - CMD=3D"$2"
> - shift 2
> - ARGS=3D"$*"
> - shift $#
> - else
> - echo "Unsupported argument $1"
> - echo "Usage: $0 [--chroot host-chroot] --command [args]"
> - exit 1
> - fi
> -done
> -
> -if [ -z $CMD ]; then
> - echo "Usage: $0 [--chroot host-chroot] --command [args]"
> - exit 1
> -fi
> -
> -# Parse the input config file to set the required build variables
> -parse_config_file $MYCONF/ubuntu-environment-creation.conf
> -
> -# Verify that the MANDATORY_INPUTS have been set. We know there are some
> -# values that absolutely need to be set or else you will end up
> -# trashing your host configuration.
> -if [ "$MANDATORY_INPUTS" =3D=3D "" ]
> -then
> - echo "Mandatory inputs not set"
> - exit 1
> -fi
> -
> -check_mandatory_inputs $MANDATORY_INPUTS
> -
> -if [ $(sudo_check) -ne 0 ]; then
> - echo "Problem using sudo, exiting"
> - exit 1
> -fi
> -
> -# Add our directory to PATH for now
> -PATH=3D${PATH}:$MYLIBS
> -
> -if [ "x$HOSTCHROOT" =3D=3D "x" ]; then
> - PBUILDER=3D"sudo pbuilder"
> - export HOME=3D`mktemp -d`
> -else
> - PBUILDER=3D"sudo chroot $HOSTCHROOT pbuilder"
> - export HOME=3D`sudo chroot $HOSTCHROOT mktemp -d`
> -fi
> -
> -# Make sure the host chroot has bindmounts already setup.
> -if [ ! -z $HOSTCHROOT -a ! -d $HOSTCHROOT/proc/self/fd ]; then
> - do-bind-mounts.sh $HOSTCHROOT
> -fi
> -
> -# Optionally use a proxy, when invoking pbuilder
> -PBUILDERPROXY=3D""
> -if [ "x$LOCALDEBPROXY" !=3D "x" ]; then
> - PBUILDERPROXY=3D"--http-proxy $LOCALDEBPROXY"
> -fi
> -
> -# Make sure we pass -j N along when building.
> -if [ -x /usr/bin/getconf ]; then
> - JOBS=3D`getconf _NPROCESSORS_CONF`
> -else
> - JOBS=3D2
> -fi
> -DEBUILDOPS=3D"-j$JOBS"
> -
> -case $CMD in
> - create | --create )
> - $PBUILDER create --debootstrap qemu-debootstrap \
> - --bindmounts "/tmp" \
> - --debootstrapopts --variant=3Dbuildd --debootstrapopts \
> - --arch=3Darmhf --extrapackages uboot-mkimage \
> - --mirror http://ports.ubuntu.com/ubuntu-ports/ \
> - $PBUILDERPROXY
> - ;;
> - build | --build )
> - $PBUILDER --build $ARGS $PBUILDERPROXY \
> - --bindmounts "/tmp" \
> - --debbuildopts \"$DEBUILDOPS\" \
> - --mirror http://ports.ubuntu.com/ubuntu-ports/
> - ;;
> - execute | --execute )
> - $PBUILDER --execute $PBUILDERPROXY \
> - --bindmounts "/tmp" \
> - --debbuildopts $DEBUILDOPS \
> - --mirror http://ports.ubuntu.com/ubuntu-ports/ \
> - $ARGS
> - ;;
> - * )
> - echo "Unknown command: $CMD"
> - exit 2
> - ;;
> -esac
> -
> -# Clean up
> -if [ ! -z "$HOSTCHROOT" -a -d $HOSTCHROOT/proc/self/fd ]; then
> - do-bind-mounts.sh --unmount $HOSTCHROOT
> -fi
> --
> 2.7.4

--KXvjHBUV7TBDBXcshXMo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 08:01 PM, Denys Dmytriyenko wrote:<br />
<blockquote>From: Denys Dmytriyenko &lt;denys@konsulko.com&gt;<br /><br />S=
igned-off-by: Denys Dmytriyenko &lt;denys@konsulko.com&gt;</blockquote>
<span style=3D"white-space: pre-wrap;">Reviewed-by: Jonathan Humphreys &lt;=
j-humphreys@ti.com&gt;</span><br />
<blockquote>---<br />build-ubuntu-environment.sh | 194 --------------------=
-----------<br />configs/ubuntu-environment-creation.conf | 162 -----------=
---------------<br />lib/ubuntu/apt-helper-functions | 20 ----<br />lib/ubu=
ntu/create-target-files | 51 --------<br />lib/ubuntu/create-ubuntu-host-ch=
root.sh | 77 ------------<br />lib/ubuntu/do-bind-mounts.sh | 22 ----<br />=
lib/ubuntu/kernel-build.sh | 46 --------<br />lib/ubuntu/run-opentest-on-ta=
rget-image | 35 ------<br />lib/ubuntu/sudo-check | 5 -<br />lib/ubuntu/use=
-armhf-pbuilder.sh | 117 -------------------<br />10 files changed, 729 del=
etions(-)<br />delete mode 100755 build-ubuntu-environment.sh<br />delete m=
ode 100644 configs/ubuntu-environment-creation.conf<br />delete mode 100644=
 lib/ubuntu/apt-helper-functions<br />delete mode 100644 lib/ubuntu/create-=
target-files<br />delete mode 100755 lib/ubuntu/create-ubuntu-host-chroot.s=
h<br />delete mode 100755 lib/ubuntu/do-bind-mounts.sh<br />delete mode 100=
755 lib/ubuntu/kernel-build.sh<br />delete mode 100644 lib/ubuntu/run-opent=
est-on-target-image<br />delete mode 100644 lib/ubuntu/sudo-check<br />dele=
te mode 100755 lib/ubuntu/use-armhf-pbuilder.sh<br /><br />diff --git a/bui=
ld-ubuntu-environment.sh b/build-ubuntu-environment.sh<br />deleted file mo=
de 100755<br />index b5dbf45..0000000<br />--- a/build-ubuntu-environment.s=
h<br />+++ /dev/null<br />@@ -1,194 +0,0 @@<br />-#!/bin/bash<br />-<br />-=
# Setup signal traps to stop any running background processes as well in<br=
 />-# the case that the script is stopped or exits<br />-trap 'test -z "`jo=
bs -p`" || kill `jobs -p` &gt; /dev/null 2&gt;&amp;1; echo "I got a signal"=
' SIGINT SIGQUIT SIGTSTP EXIT<br />-<br />-## Internal variables<br />-MYLI=
BS=3D`dirname $0`/lib<br />-<br />-## Our library functions<br />-source $M=
YLIBS/common-functions<br />-source $MYLIBS/ubuntu/create-target-files<br /=
>-source $MYLIBS/ubuntu/apt-helper-functions<br />-source $MYLIBS/ubuntu/su=
do-check<br />-source $MYLIBS/run-opentest<br />-source $MYLIBS/ubuntu/run-=
opentest-on-target-image<br />-<br />-# Shorten the command to work in the =
ARM targetfs chroot<br />-chroot_arm_targetfs() {<br />- sudo chroot $BUILD=
_ROOT chroot /tmp/targetfs $*<br />-}<br />-<br />-if [ $(sudo_check) -ne 0=
 ]; then<br />- echo "Problem using sudo, exiting"<br />- exit 1<br />-fi<b=
r />-<br />-# Add our directory to PATH for now<br />-PATH=3D${PATH}:$MYLIB=
S/ubuntu<br />-<br />-# Parse the input config file to set the required bui=
ld variables<br />-parse_config_file `dirname $0`/configs/ubuntu-environmen=
t-creation.conf<br />-<br />-# Verify that the MANDATORY_INPUTS have been s=
et. We know there are some<br />-# values that absolutely need to be set or=
 else you will end up<br />-# trashing your host configuration.<br />-if [ =
"$MANDATORY_INPUTS" =3D=3D "" ]<br />-then<br />- echo "Mandatory inputs no=
t set"<br />- exit 1<br />-fi<br />-<br />-check_mandatory_inputs $MANDATOR=
Y_INPUTS<br />-<br />-## Finish our internal variables.<br />-TARGETFS=3D$B=
UILD_ROOT/tmp/targetfs<br />-<br />-# Prepare the host chroot.<br />-echo "=
Starting in `pwd`"<br />-echo "Making clean Ubuntu 12.04.1 chroot (host)"<b=
r />-create-ubuntu-host-chroot.sh --release precise --target $BUILD_ROOT<br=
 />-use-armhf-pbuilder.sh --chroot $BUILD_ROOT --command create<br />-<br /=
>-# Start the ARM targetfs directory out<br />-mkdir -p $BUILD_ROOT/tmp/tar=
getfs<br />-if [ ! -x `which wget` ]; then<br />- echo "Could not find wget=
, aborting!"<br />- exit 1<br />-fi<br />-wget $ARMCOREURI<br />-sudo tar -=
C $TARGETFS -xf `basename $ARMCOREURI`<br />-rm `basename $ARMCOREURI`<br /=
>-do-bind-mounts.sh $TARGETFS<br />-<br />-# Fetch kernel sources. When usi=
ng gitorious we may have to wait while<br />-# the tarball is being generat=
ed.<br />-wget --no-check-certificate -O linux.tgz $KERNELSRCURI<br />-grep=
 -q "he archive is currently being generated, try " linux.tgz<br />-while t=
est $? -eq 0; do<br />- sleep 60<br />- wget --no-check-certificate -O linu=
x.tgz $KERNELSRCURI<br />- grep -q "he archive is currently being generated=
, try " linux.tgz<br />-done<br />-cp $MYLIBS/ubuntu/kernel-build.sh $BUILD=
_ROOT/tmp/<br />-mv linux.tgz $BUILD_ROOT/tmp/<br />-# Now build.<br />-use=
-armhf-pbuilder.sh --chroot $BUILD_ROOT --command --execute \<br />- -- /tm=
p/kernel-build.sh --config $KERNELCONFIGTGT \<br />- --source-tarball /tmp/=
linux.tgz<br />-<br />-# Start the feed.<br />-mkdir -p $BUILD_ROOT/tmp/fee=
d/dists/precise/main/binary-arm{el,hf}<br />-<br />-# See if we have a dire=
ctory of packages to rebuild and place into the feed.<br />-if [ "x$DEBPKGD=
IR" !=3D "x" ]; then<br />- sudo mkdir $BUILD_ROOT/tmp/rebuildme<br />- sud=
o mount -o bind $DEBPKGDIR $BUILD_ROOT/tmp/rebuildme<br />-<br />- # Now bu=
ild.<br />- for DSC in `(cd $DEBPKGDIR;ls *.dsc)`;do<br />- use-armhf-pbuil=
der.sh --chroot $BUILD_ROOT --command \<br />- build /tmp/rebuildme/$DSC<br=
 />- done<br />-<br />- # Move to feed directory.<br />- sudo mv $BUILD_ROO=
T/var/cache/pbuilder/result/*.deb \<br />- $BUILD_ROOT/tmp/feed/dists/preci=
se/main/binary-armhf/<br />- sudo umount $BUILD_ROOT/tmp/rebuildme<br />-fi=
<br />-<br />-# Create our local feed for this<br />-sudo chown -R `id -u` =
$BUILD_ROOT/tmp/tmp.*<br />-sudo mv $BUILD_ROOT/tmp/tmp.*/*.deb $BUILD_ROOT=
/tmp/feed/dists/precise/main/binary-armel/<br />-sudo chroot $BUILD_ROOT sh=
 -c \<br />- "cd /tmp/feed;dpkg-scanpackages -a armel dists" &gt; Packages<=
br />-sudo mv Packages $BUILD_ROOT/tmp/feed/dists/precise/main/binary-armel=
/<br />-sudo chroot $BUILD_ROOT sh -c \<br />- "cd /tmp/feed;dpkg-scanpacka=
ges -a armhf dists" &gt; Packages<br />-sudo mv Packages $BUILD_ROOT/tmp/fe=
ed/dists/precise/main/binary-armhf/<br />-<br />-# Prepare the ARM chroots =
for use<br />-sudo cp $BUILD_ROOT/usr/bin/qemu-arm-static $TARGETFS/usr/bin=
/<br />-sudo cp `dirname $0`/configs/target-debconf-selections.txt $TARGETF=
S/tmp/<br />-if [ "x$USE_PROXY" =3D=3D "x1" ]; then<br />- create_apt_conf_=
d_proxy<br />- sudo mv proxy $TARGETFS/etc/apt/apt.conf.d/<br />-fi<br />-s=
udo cp /etc/resolv.conf $TARGETFS/etc/<br />-echo foreign-architecture arme=
l | \<br />- sudo tee $TARGETFS/etc/dpkg/dpkg.cfg.d/architectures<br />-sud=
o sed -i -e 's/^# deb /deb /g' -e 's/^deb /deb [arch=3Darmhf] /' \<br />- $=
TARGETFS/etc/apt/sources.list<br />-echo "deb [arch=3Darmel,armhf] file:/tm=
p/feed precise main" | \<br />- sudo tee $TARGETFS/etc/apt/sources.list.d/l=
ocal.list<br />-<br />-# Now install in the target chroot<br />-mkdir -p $T=
ARGETFS/tmp/feed<br />-sudo mount -o bind $BUILD_ROOT/tmp/feed $TARGETFS/tm=
p/feed<br />-chroot_arm_targetfs debconf-set-selections /tmp/target-debconf=
-selections.txt<br />-chroot_arm_targetfs apt-get update<br />-chroot_arm_t=
argetfs apt-get --yes --force-yes upgrade<br />-chroot_arm_targetfs apt-get=
 --yes --force-yes install ${TARGET_PACKAGES}<br />-chroot_arm_targetfs apt=
-get --yes --force-yes install linux-firmware-image \<br />- linux-image-$K=
ERNELVER<br />-sudo umount $TARGETFS/tmp/feed<br />-sudo rm $TARGETFS/etc/a=
pt/sources.list.d/local.list \<br />- $TARGETFS/tmp/target-debconf-selectio=
ns.txt<br />-<br />-# Make sure we can login<br />-create_serial_auto_detec=
t_console_files<br />-sudo mv serial-auto-detect-console.conf $TARGETFS/etc=
/init/<br />-sudo mv serial-console $TARGETFS/bin/<br />-sudo chmod 0755 $T=
ARGETFS/bin/serial-console<br />-sudo chown 0:0 $TARGETFS/bin/serial-consol=
e \<br />- $TARGETFS/etc/init/serial-auto-detect-console.conf<br />-<br />-=
# Add a user to login with, in the targetfs<br />-chroot_arm_targetfs addus=
er --disabled-password -q demo --gecos \"\"<br />-sudo sed -i -e 's/^demo:x=
:1000/demo::1000/' $TARGETFS/etc/passwd<br />-# No password root.<br />-sud=
o sed -i -e 's/^root:x:0/root::0/' $TARGETFS/etc/passwd<br />-if [ "x$ENABL=
E_OPENTEST" !=3D "x" ]; then<br />- # For opentest, we need to add pts/0-7 =
to /etc/securetty<br />- printf "pts/0\npts/1\npts/2\npts/3\npts/4\npts/5\n=
pts/6\npts/7\n" | \<br />- sudo tee -a $TARGETFS/etc/securetty<br />-fi<br =
/>-# And allow sudo for 'demo'<br />-echo "demo ALL=3DNOPASSWD: ALL" | sudo=
 tee $TARGETFS/etc/sudoers.d/demo<br />-<br />-# TODO: Make removing qemu-a=
rm-static from targetfs an option for debugging on<br />-# host<br />-<br /=
>-# Clean up<br />-# We borrow from<br />-# <a href=3D"http://askubuntu.com=
/questions/162319/how-do-i-stop-all-processes-in-a-chroot" target=3D"_blank=
" rel=3D"noopener">http://askubuntu.com/questions/162319/how-do-i-stop-all-=
processes-in-a-chroot</a><br />-# for a "kill everything" type solution wit=
hin the target chroot.<br />-do-bind-mounts.sh --unmount $BUILD_ROOT<br />-=
for ROOT in /proc/*/root; do<br />- LINK=3D$(sudo readlink $ROOT)<br />- if=
 [ "x$LINK" !=3D "x" ]; then<br />- if [ "x${LINK:0:${#TARGETFS}}" =3D "x$T=
ARGETFS" ]; then<br />- # this process is in the chroot...<br />- sudo kill=
 -9 $(basename $(dirname "$ROOT"))<br />- fi<br />- fi<br />-done<br />-do-=
bind-mounts.sh --unmount $TARGETFS<br />-sudo rm $TARGETFS/etc/resolv.conf<=
br />-<br />-# Archive target rootfs<br />-# TODO: Add more options than ta=
r.gz?<br />-if [ ! -d out ]; then<br />- mkdir out<br />-fi<br />-<br />-su=
do tar -C $TARGETFS --one-file-system -jcf out/targetfs.tar.bz2 .<br />-<br=
 />-if [ "x$ENABLE_OPENTEST" !=3D "x" ]; then<br />- # Prepare for opentest=
, which requires ifconfig in the path.<br />- PATH=3D${PATH}:$MYLIBS/ubuntu=
:/sbin<br />- mkdir -p $LOG_DIR<br />- set_opentest_platform $MACHINES<br /=
>- run_opentest_on_image $MACHINES<br />-fi<br />diff --git a/configs/ubunt=
u-environment-creation.conf b/configs/ubuntu-environment-creation.conf<br /=
>deleted file mode 100644<br />index 7ca04da..0000000<br />--- a/configs/ub=
untu-environment-creation.conf<br />+++ /dev/null<br />@@ -1,162 +0,0 @@<br=
 />-#######################################################################=
#########<br />-# Ubuntu Environment configuration file #<br />-###########=
#####################################################################<br />=
-<br />-# This variable contains the list of variables found in this congif=
 file<br />-# that MUST be set to a value. Failure to set these variables c=
ould<br />-# lead to corruption of the host system or the build script not<=
br />-# executing properly<br />-MANDATORY_INPUTS=3D"USE_PROXY ARMCOREURI M=
ACHINES BUILD_ID SCRIPTS_ROOT BUILD_ROOT FS_IMAGE_TYPE NFS_ROOT LOG_DIR"<br=
 />-<br />-# This variable contains the list of machines to build an SDK fo=
r<br />-MACHINES=3D"am335x-evm"<br />-<br />-# This variable holds the uniq=
ue ID for the build that will be used to<br />-# identify the build.<br />-=
BUILD_ID=3D"`date +build-%F_%H-%M-%S`"<br />-<br />-# This variable contain=
s the script directory where these scripts are running<br />-# from. This i=
s to allow finding other files used during the build later.<br />-# You sho=
uld likely not change this<br />-SCRIPTS_ROOT=3D"$PWD"<br />-<br />-# This =
variable points to be base of your build where the chroots will be<br />-# =
constructed and based within.<br />-BUILD_ROOT=3D"$SCRIPTS_ROOT/ubuntu-$(un=
ame -m)-12.04.1-chroot"<br />-<br />-# This variable contains the "filter" =
string to look for inside of the<br />-# SDK to select which file system to=
 test. Currently only testing of<br />-# one file system is supported.<br /=
>-FS_FILTER=3D""<br />-<br />-# This variable indicates the type of FS imag=
es being generated. By default<br />-# this is tar.gz images. This should m=
atch what you set in your recipes<br />-FS_IMAGE_TYPE=3D"tar.bz2"<br />-<br=
 />-# This variable points to an NFS share which has been pre-configured. T=
he<br />-# target testing will be done by creating a subdirectory in this N=
FS_ROOT<br />-# for each machine to boot the target board.<br />-# This dir=
ectory should be configured to allow writing by the jenkins user<br />-# at=
 a minimum, although allowing writing by anyone is simple.<br />-NFS_ROOT=
=3D"/home/jenkins/nfs-root"<br />-<br />-# This directory will contain the =
log files for the various parts of the build.<br />-# This includes:<br />-=
# 1. Overall build process log (i.e. which machines are in which build dir)=
<br />-# 2. Build logs for individual machines<br />-# 3. Test logs for ind=
ividual machines<br />-# 4. Packaging logs for individual machines<br />-LO=
G_DIR=3D"${SCRIPTS_ROOT}/log-files"<br />-<br />-# This variable points to =
the base location where files will be extracted for<br />-# testing purpose=
s. This should not be confused with the NFS root which<br />-# will be conf=
igured below.<br />-# This variable should always be declared AFTER the BUI=
LD_ROOT variable.<br />-# The build scripts will create subdirectories such=
 as:<br />-# - TEST_ROOT/tmp/am335x-evm-test<br />-# You can usually just t=
ake the default value<br />-TEST_ROOT=3D"$BUILD_ROOT/tmp/testing"<br />-<br=
 />-# This variable points to the directory with the test scripts you want =
to<br />-# run. The entire directory will be copied to make removing the te=
st scripts<br />-# easier during cleanup.<br />-# NOTE: The assumption is t=
hat this directory contains at least the<br />-# following files:<br />-# -=
 opentest.sh // This is called by opentest framework<br />-# - S90-fake-poi=
ntercal // This fakes pointer calibration<br />-# - nightly-test.sh // This=
 is called by opentest.sh and does<br />-# machine specific testing<br />-#=
 NOTE: Since the scripts will be copied to /home/root/&lt;directory name&gt=
;<br />-# the opentest.sh script should call the scripts in the new directo=
ry.<br />-TEST_SCRIPTS=3D"$SCRIPTS_ROOT/test-scripts"<br />-<br />-# This v=
ariable points to the directory within the target filesystem that<br />-# t=
he scripts directory in TEST_SCRIPTS will be copied as.<br />-TEST_SCRIPTS_=
TGT=3D"root/test-scripts"<br />-<br />-# This variable contains the tarball=
 name for the opentest CLI which is<br />-# required to do target side test=
ing.<br />-OPENTEST_CLI=3D"$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"<br />-<br=
 />-# This variable will allow control over whether to perform build testin=
g or<br />-# skip it. This should usually be set to true but may be changed=
 for<br />-# prototyping.<br />-RUN_BUILD_TESTS=3D"true"<br />-<br />-# Thi=
s variable points to the STAF installation location which is used<br />-# d=
uring the build test steps to call into the OpenTest Framework. This<br />-=
# default value is the default value from the STAF installer<br />-STAF_ROO=
T=3D"/usr/local/staf"<br />-<br />-# This variable indicates whether to con=
tinue the build process for a machine<br />-# even when the build testing f=
ails. This can be useful in the case of<br />-# the test system being down =
to allow the full packaging of the SDK to<br />-# continue.<br />-SKIP_TEST=
_FAILURES=3D"false"<br />-<br />-##########################################=
######################################<br />-# Network proxy related option=
s, used during creating of the target. Set<br />-# them to blank if not nee=
ded.<br />-################################################################=
################<br />-<br />-# Do we need to be using some sort of proxies=
 at all?<br />-USE_PROXY=3D1<br />-<br />-# If we need to use a proxy, and =
it is not already set within the<br />-# environment, set these variables a=
s well.<br />-http_proxy=3D<a href=3D"http://wwwgate.ti.com:80" target=3D"_=
blank" rel=3D"noopener">http://wwwgate.ti.com:80</a><br />-#https_proxy=3D<=
a href=3D"http://wwwgate.ti.com:80" target=3D"_blank" rel=3D"noopener">http=
://wwwgate.ti.com:80</a><br />-#ftp_proxy=3D<a href=3D"http://wwwgate.ti.co=
m:80" target=3D"_blank" rel=3D"noopener">http://wwwgate.ti.com:80</a><br />=
-<br />-# If we have a local caching proxy for fetching debs, set this<br /=
>-LOCALDEBPROXY=3D"<a href=3D"http://apt-cache.dal.design.ti.com:3142&quot;=
" target=3D"_blank" rel=3D"noopener">http://apt-cache.dal.design.ti.com:314=
2"</a><br />-<br />-# If we have a local deb mirror as well, set this<br />=
-LOCALDEBMIRROR=3D"ubuntu.dal.design.ti.com"<br />-<br />-#################=
###############################################################<br />-# Loc=
ation of the target chroot<br />-ARMCOREURI=3D"<a href=3D"http://cdimage.ub=
untu.com/ubuntu-core/releases/12.04/release/ubuntu-core-12.04.1-core-armhf.=
tar.gz&quot;" target=3D"_blank" rel=3D"noopener">http://cdimage.ubuntu.com/=
ubuntu-core/releases/12.04/release/ubuntu-core-12.04.1-core-armhf.tar.gz"</=
a><br />-<br />-# Location of the kernel sources, and defconfig target<br /=
>-KERNELSRCURI=3D"<a href=3D"https://gitorious.ti.com/ti-linux-kernel/ti-li=
nux-kernel/archive-tarball/ti-linux-3.8-rc3&quot;" target=3D"_blank" rel=3D=
"noopener">https://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel/archive=
-tarball/ti-linux-3.8-rc3"</a><br />-KERNELCONFIGTGT=3D"omap2plus"<br />-KE=
RNELVER=3D"3.8.0-rc3"<br />-<br />-# A directory that contains packages to =
be built by us. For each package<br />-# you need to include all of the out=
puts from 'debuild -i -uc -us -S'<br />-# in the original package sources.<=
br />-DEBPKGDIR=3D"$SCRIPTS_ROOT/rebuildme"<br />-<br />-##################=
##############################################################<br />-# Open=
Test configuration section.<br />-#########################################=
#######################################<br />-<br />-# Do we want to run op=
entest? This will enable additional things such as<br />-# no password root=
 login via telnet.<br />-ENABLE_OPENTEST=3D"1"<br />-<br />-# Packages on t=
he target that must be installed for OpenTest to run and test<br />-# thing=
s. telnetd must be installed for the framework to connect to the<br />-# ta=
rget. Anything else would be for the individual tests.<br />-TARGET_OPENTES=
T_PACKAGES=3D"telnetd"<br />-<br />-#######################################=
#########################################<br />-# Package selection for the=
 target and optional host environment.<br />-##############################=
##################################################<br />-<br />-# Various p=
ackages we want to install into the final target filesystem<br />-# We inst=
all debconf-utils for debconf-get-selections which we use to keep<br />-# t=
arget-debconf-selections.txt up to date and make package installation<br />=
-# non-interactive.<br />-TARGET_BASE_PACKAGES=3D"u-boot"<br />-TARGET_MISC=
_PACKAGES=3D"sudo debconf-utils"<br />-TARGET_NETWORK_PACKAGES=3D"net-tools=
 isc-dhcp-client"<br />-TARGET_X11_PACKAGES=3D"xserver-xorg-input-tslib xfc=
e4"<br />-TARGET_PACKAGES=3D"${TARGET_MISC_PACKAGES} ${TARGET_NETWORK_PACKA=
GES} \<br />- ${TARGET_X11_PACKAGES} ${TARGET_OPENTEST_PACKAGES} \<br />- $=
{TARGET_BASE_PACKAGES}"<br />-<br />-# Various packages we want to install =
into the host chroot environment.<br />-HOST_CHROOT_ENV_PACKAGES=3D"qemu-us=
er-static pbuilder debootstrap devscripts \<br />- pbuilder-scripts dpkg-de=
v"<br />diff --git a/lib/ubuntu/apt-helper-functions b/lib/ubuntu/apt-helpe=
r-functions<br />deleted file mode 100644<br />index 6ac05aa..0000000<br />=
--- a/lib/ubuntu/apt-helper-functions<br />+++ /dev/null<br />@@ -1,20 +0,0=
 @@<br />-create_apt_conf_d_proxy() {<br />- PROXY=3D""<br />- MIRROR=3D""<=
br />- if [ "x$LOCALDEBPROXY" !=3D "x" ]; then<br />- PROXY=3D"Proxy \"$LOC=
ALDEBPROXY\";"<br />- fi<br />- if [ "x$LOCALDEBMIRROR" !=3D "x" ]; then<br=
 />- MIRROR=3D"Proxy::$LOCALDEBMIRROR \"DIRECT\";"<br />- fi<br />-# TODO: =
Use mktemp<br />- cat &lt;&lt; EOF &gt; proxy<br />-Acquire<br />-{<br />- =
http {<br />- $PROXY<br />- $MIRROR<br />- }<br />-}<br />-EOF<br />-}<br /=
>diff --git a/lib/ubuntu/create-target-files b/lib/ubuntu/create-target-fil=
es<br />deleted file mode 100644<br />index 20d1089..0000000<br />--- a/lib=
/ubuntu/create-target-files<br />+++ /dev/null<br />@@ -1,51 +0,0 @@<br />-=
# Create the two files needed for serial consoles<br />-create_serial_auto_=
detect_console_files() {<br />-# TODO: Use mktemp<br />- cat &lt;&lt; EOF &=
gt; serial-auto-detect-console.conf<br />-# serial-auto-detect-console - st=
arts getty on serial console<br />-#<br />-# This service starts a getty on=
 the serial port given in the 'console' kernel<br />-# argument.<br />-#<br=
 />-<br />-start on runlevel [23]<br />-stop on runlevel [!23]<br />-<br />=
-respawn<br />-<br />-exec /bin/sh /bin/serial-console<br />-EOF<br />-<br =
/>- cat &lt;&lt; EOF &gt; serial-console<br />-#!/bin/bash<br />-for arg in=
 \$(cat /proc/cmdline)<br />-do <br />- case \$arg in<br />- console=3D*)<b=
r />- tty=3D\${arg#console=3D}<br />- tty=3D\${tty#/dev/}<br />-<br />- cas=
e \$tty in<br />- tty[a-zA-Z]* )<br />- PORT=3D\${tty%%,*}<br />-<br />- # =
check for service which do something on this port<br />- if [ -f /etc/init/=
\$PORT.conf ];then continue;fi<br />-<br />- tmp=3D\${tty##\$PORT,}<br />- =
SPEED=3D\${tmp%%n*}<br />- BITS=3D\${tmp##\${SPEED}n}<br />-<br />- # 8bit =
serial is default<br />- [ -z \$BITS ] &amp;&amp; BITS=3D8<br />- [ 8 -eq \=
$BITS ] &amp;&amp; GETTY_ARGS=3D"\$GETTY_ARGS -8 "<br />-<br />- [ -z \$SPE=
ED ] &amp;&amp; SPEED=3D'115200,57600,38400,19200,9600'<br />-<br />- GETTY=
_ARGS=3D"\$GETTY_ARGS \$SPEED \$PORT"<br />- exec /sbin/getty \$GETTY_ARGS<=
br />- esac<br />- esac<br />-done<br />-EOF<br />-}<br />diff --git a/lib/=
ubuntu/create-ubuntu-host-chroot.sh b/lib/ubuntu/create-ubuntu-host-chroot.=
sh<br />deleted file mode 100755<br />index 07644e3..0000000<br />--- a/lib=
/ubuntu/create-ubuntu-host-chroot.sh<br />+++ /dev/null<br />@@ -1,77 +0,0 =
@@<br />-#!/bin/bash<br />-#<br />-# This script will create a 'buildd' var=
iant chroot of the passed in release<br />-# name and place it into the nam=
ed directory.<br />-<br />-if [ $# -ne 4 ]; then<br />- echo "Usage:"<br />=
- echo "$0 --release codename --target chroot-directory"<br />- echo "For e=
xample:"<br />- echo "$0 --release precise --target ubuntu-12.04.1-chroot"<=
br />- exit 1<br />-fi<br />-<br />-while test $# -ne 0; do<br />- if [ "$1=
" =3D=3D "--release" ]; then<br />- RELEASE=3D"$2"<br />- shift 2<br />- el=
if [ "$1" =3D=3D "--target" ]; then<br />- HOSTCHROOT=3D"$2"<br />- shift 2=
<br />- else<br />- echo "Unsupported argument $1"<br />- exit 1<br />- fi<=
br />-done<br />-<br />-## Internal variables<br />-MYLIBS=3D`dirname $0`<b=
r />-MYCONF=3D`dirname $0`/../../configs<br />-<br />-## Our library functi=
ons<br />-. $MYLIBS/apt-helper-functions<br />-. $MYLIBS/sudo-check<br />-<=
br />-## Configuration details<br />-. $MYCONF/ubuntu-environment-creation.=
conf<br />-<br />-## Add our directory to PATH for now<br />-PATH=3D${PATH}=
:$MYLIBS<br />-<br />-if [ $(sudo_check) -ne 0 ]; then<br />- echo "Problem=
 using sudo, exiting"<br />- exit 1<br />-fi<br />-<br />-if [ `uname -m` =
=3D=3D "x86_64" ]; then<br />- HOSTARCH=3Damd64<br />-elif [ `uname -m` =3D=
=3D "i686" ]; then<br />- HOSTARCH=3Di386<br />-else<br />- echo "Could not=
 determine host arch (uname -m) for Ubuntu, exiting"<br />- exit 1<br />-fi=
<br />-<br />-sudo debootstrap --variant=3Dbuildd --arch $HOSTARCH $RELEASE=
 $HOSTCHROOT \<br />- <a href=3D"http://mirrors.us.kernel.org/ubuntu/" targ=
et=3D"_blank" rel=3D"noopener">http://mirrors.us.kernel.org/ubuntu/</a><br =
/>-<br />-# Setup bind mounts<br />-do-bind-mounts.sh $HOSTCHROOT<br />-<br=
 />-# Prepare the host chroot.<br />-if [ "x$USE_PROXY" =3D=3D "x1" ]; then=
<br />- create_apt_conf_d_proxy<br />- sudo mv proxy $HOSTCHROOT/etc/apt/ap=
t.conf.d/<br />-fi<br />-sudo cp /etc/hosts $HOSTCHROOT/etc/<br />-printf "=
deb <a href=3D"http://us.archive.ubuntu.com/ubuntu/" target=3D"_blank" rel=
=3D"noopener">http://us.archive.ubuntu.com/ubuntu/</a> $RELEASE universe<br=
 />-deb <a href=3D"http://us.archive.ubuntu.com/ubuntu/" target=3D"_blank" =
rel=3D"noopener">http://us.archive.ubuntu.com/ubuntu/</a> $RELEASE-updates =
universe<br />-deb <a href=3D"http://us.archive.ubuntu.com/ubuntu/" target=
=3D"_blank" rel=3D"noopener">http://us.archive.ubuntu.com/ubuntu/</a> $RELE=
ASE-backports universe\n" | \<br />- sudo tee $HOSTCHROOT/etc/apt/sources.l=
ist.d/$RELEASE-universe.list<br />-export HOME=3D`mktemp -d`<br />-sudo mkd=
ir -p $HOSTCHROOT/$HOME<br />-sudo chroot $HOSTCHROOT apt-get update<br />-=
sudo chroot $HOSTCHROOT apt-get --yes install ${HOST_CHROOT_ENV_PACKAGES}<b=
r />-<br />-# Clean up<br />-do-bind-mounts.sh --unmount $HOSTCHROOT<br />d=
iff --git a/lib/ubuntu/do-bind-mounts.sh b/lib/ubuntu/do-bind-mounts.sh<br =
/>deleted file mode 100755<br />index 96c15d7..0000000<br />--- a/lib/ubunt=
u/do-bind-mounts.sh<br />+++ /dev/null<br />@@ -1,22 +0,0 @@<br />-#!/bin/b=
ash<br />-<br />-if [ $# -lt 1 -o $# -gt 2 -o $# -eq 2 -a "$1" !=3D "--unmo=
unt" ]; then<br />- echo "$0 [--unmount] directory"<br />- exit 1;<br />-fi=
<br />-<br />-# Handle unmount<br />-if [ $# -eq 2 ];then<br />- for DIR in=
 dev/pts dev sys proc/sys/fs/binfmt_misc proc;do <br />- sudo umount $2/$DI=
R 2&gt;/dev/null<br />- done<br />- exit 0;<br />-fi<br />-<br />-for DIR i=
n sys dev dev/pts proc;do<br />- if [ ! -d $1/$DIR ]; then<br />- echo "No =
$1/$DIR ? Exit!"<br />- exit 1<br />- fi<br />- sudo mount -o bind /$DIR $1=
/$DIR<br />-done<br />diff --git a/lib/ubuntu/kernel-build.sh b/lib/ubuntu/=
kernel-build.sh<br />deleted file mode 100755<br />index dac3e2f..0000000<b=
r />--- a/lib/ubuntu/kernel-build.sh<br />+++ /dev/null<br />@@ -1,46 +0,0 =
@@<br />-#!/bin/bash<br />-#<br />-# Given that we are being invoked in an =
environment where 'make deb-pkg' in<br />-# the kernel will produce the deb=
 packages for the architecture we want, we<br />-# need to be passed:<br />=
-# --config target (such as omap2plus)<br />-# --source-tarball (such as li=
nux-am33x.tar.bz2)<br />-#<br />-# And we are given a pre-patched (if neede=
d) source tree.<br />-#<br />-<br />-if [ $# -ne 4 ]; then<br />- echo "Usa=
ge:"<br />- echo "$0 --config config_target --source-tarball source.tar.bz2=
"<br />- echo "For example:"<br />- echo "$0 --config omap2plus --source-ta=
rball linux-am33x.tar.bz2"<br />- exit 1<br />-fi<br />-<br />-while test $=
# -ne 0; do<br />- if [ "$1" =3D=3D "--config" ]; then<br />- CONFIG=3D"$2"=
<br />- shift 2<br />- elif [ "$1" =3D=3D "--source-tarball" ]; then<br />-=
 SRC=3D"$2"<br />- shift 2<br />- else<br />- echo "Unsupported argument $1=
"<br />- exit 1<br />- fi<br />-done<br />-<br />-# Unpack, configure, buil=
d.<br />-D1=3D`mktemp -d`<br />-cd $D1<br />-tar xf $SRC<br />-KSRC=3D`ls`<=
br />-cd $KSRC<br />-make ${CONFIG}_defconfig<br />-if [ -x /usr/bin/getcon=
f ]; then<br />- JOBS=3D`getconf _NPROCESSORS_CONF`<br />-else<br />- JOBS=
=3D2<br />-fi<br />-make -j$JOBS uImage modules<br />-make KBUILD_IMAGE=3Du=
Image deb-pkg<br />diff --git a/lib/ubuntu/run-opentest-on-target-image b/l=
ib/ubuntu/run-opentest-on-target-image<br />deleted file mode 100644<br />i=
ndex 066e8dc..0000000<br />--- a/lib/ubuntu/run-opentest-on-target-image<br=
 />+++ /dev/null<br />@@ -1,35 +0,0 @@<br />-run_opentest_on_image() {<br /=
>- # Set m for logging purposes<br />- m=3D"$1"<br />-<br />- # Create a te=
mporary directory to extract the build files to for<br />- # testing. If th=
e directory already exists then delete the old<br />- # contents first.<br =
/>- test_dir=3D"$TEST_ROOT/$m-test"<br />-<br />- if [ -d $test_dir ]<br />=
- then<br />- rm -rf $test_dir<br />- fi<br />- mkdir -p $test_dir<br />-<b=
r />- # Only run the build testing if the config file says to do so<br />- =
if [ "$RUN_BUILD_TESTS" =3D=3D "true" ]<br />- then<br />- run_target_side_=
test $m<br />- else<br />- echo "SKIPPED" &gt; $LOG_DIR/$m-test-result.txt<=
br />- fi<br />-<br />- if [ "$?" !=3D "0" -a "$SKIP_TEST_FAILURES" =3D=3D =
"true" ]<br />- then<br />- # Check if this was a CRITICAL failure<br />- g=
rep "CRITICAL" $LOG_DIR/$m-test-result.txt &gt; /dev/null 2&gt;&amp;1<br />=
- if [ "$?" =3D=3D "0" ]<br />- then<br />- # This was a critical failure s=
o return without copying<br />- # the files<br />- return 1<br />- fi<br />=
- fi<br />-}<br />diff --git a/lib/ubuntu/sudo-check b/lib/ubuntu/sudo-chec=
k<br />deleted file mode 100644<br />index d80b390..0000000<br />--- a/lib/=
ubuntu/sudo-check<br />+++ /dev/null<br />@@ -1,5 +0,0 @@<br />-sudo_check(=
) {<br />- # See if the user is allowed to use sudo<br />- sudo -v &gt; /de=
v/null 2&gt;&amp;1<br />- echo $?<br />-}<br />diff --git a/lib/ubuntu/use-=
armhf-pbuilder.sh b/lib/ubuntu/use-armhf-pbuilder.sh<br />deleted file mode=
 100755<br />index fa4cca3..0000000<br />--- a/lib/ubuntu/use-armhf-pbuilde=
r.sh<br />+++ /dev/null<br />@@ -1,117 +0,0 @@<br />-#!/bin/bash<br />-#<br=
 />-# This script will call pbuilder create and make the armhf that can be<=
br />-# used later to build target packages. We take an optional argument o=
f<br />-# --chroot host-chroot of a directory to chroot into and invoke our=
<br />-# pbuilder commands.<br />-<br />-## Internal variables<br />-MYLIBS=
=3D`dirname $0`/..<br />-MYCONF=3D`dirname $0`/../../configs<br />-<br />-#=
# Our library functions<br />-source $MYLIBS/ubuntu/sudo-check<br />-source=
 $MYLIBS/common-functions<br />-<br />-while test $# -ne 0; do<br />- if [ =
"$1" =3D=3D "--chroot" ]; then<br />- HOSTCHROOT=3D"$2"<br />- shift 2<br /=
>- elif [ "$1" =3D=3D "--command" ]; then<br />- CMD=3D"$2"<br />- shift 2<=
br />- ARGS=3D"$*"<br />- shift $#<br />- else<br />- echo "Unsupported arg=
ument $1"<br />- echo "Usage: $0 [--chroot host-chroot] --command [args]"<b=
r />- exit 1<br />- fi<br />-done<br />-<br />-if [ -z $CMD ]; then<br />- =
echo "Usage: $0 [--chroot host-chroot] --command [args]"<br />- exit 1<br /=
>-fi<br />-<br />-# Parse the input config file to set the required build v=
ariables<br />-parse_config_file $MYCONF/ubuntu-environment-creation.conf<b=
r />-<br />-# Verify that the MANDATORY_INPUTS have been set. We know there=
 are some<br />-# values that absolutely need to be set or else you will en=
d up<br />-# trashing your host configuration.<br />-if [ "$MANDATORY_INPUT=
S" =3D=3D "" ]<br />-then<br />- echo "Mandatory inputs not set"<br />- exi=
t 1<br />-fi<br />-<br />-check_mandatory_inputs $MANDATORY_INPUTS<br />-<b=
r />-if [ $(sudo_check) -ne 0 ]; then<br />- echo "Problem using sudo, exit=
ing"<br />- exit 1<br />-fi<br />-<br />-# Add our directory to PATH for no=
w<br />-PATH=3D${PATH}:$MYLIBS<br />-<br />-if [ "x$HOSTCHROOT" =3D=3D "x" =
]; then<br />- PBUILDER=3D"sudo pbuilder"<br />- export HOME=3D`mktemp -d`<=
br />-else<br />- PBUILDER=3D"sudo chroot $HOSTCHROOT pbuilder"<br />- expo=
rt HOME=3D`sudo chroot $HOSTCHROOT mktemp -d`<br />-fi<br />-<br />-# Make =
sure the host chroot has bindmounts already setup.<br />-if [ ! -z $HOSTCHR=
OOT -a ! -d $HOSTCHROOT/proc/self/fd ]; then<br />- do-bind-mounts.sh $HOST=
CHROOT<br />-fi<br />-<br />-# Optionally use a proxy, when invoking pbuild=
er<br />-PBUILDERPROXY=3D""<br />-if [ "x$LOCALDEBPROXY" !=3D "x" ]; then<b=
r />- PBUILDERPROXY=3D"--http-proxy $LOCALDEBPROXY"<br />-fi<br />-<br />-#=
 Make sure we pass -j N along when building.<br />-if [ -x /usr/bin/getconf=
 ]; then<br />- JOBS=3D`getconf _NPROCESSORS_CONF`<br />-else<br />- JOBS=
=3D2<br />-fi<br />-DEBUILDOPS=3D"-j$JOBS"<br />-<br />-case $CMD in<br />-=
 create | --create )<br />- $PBUILDER create --debootstrap qemu-debootstrap=
 \<br />- --bindmounts "/tmp" \<br />- --debootstrapopts --variant=3Dbuildd=
 --debootstrapopts \<br />- --arch=3Darmhf --extrapackages uboot-mkimage \<=
br />- --mirror <a href=3D"http://ports.ubuntu.com/ubuntu-ports/" target=3D=
"_blank" rel=3D"noopener">http://ports.ubuntu.com/ubuntu-ports/</a> \<br />=
- $PBUILDERPROXY<br />- ;;<br />- build | --build )<br />- $PBUILDER --buil=
d $ARGS $PBUILDERPROXY \<br />- --bindmounts "/tmp" \<br />- --debbuildopts=
 \"$DEBUILDOPS\" \<br />- --mirror <a href=3D"http://ports.ubuntu.com/ubunt=
u-ports/" target=3D"_blank" rel=3D"noopener">http://ports.ubuntu.com/ubuntu=
-ports/</a><br />- ;;<br />- execute | --execute )<br />- $PBUILDER --execu=
te $PBUILDERPROXY \<br />- --bindmounts "/tmp" \<br />- --debbuildopts $DEB=
UILDOPS \<br />- --mirror <a href=3D"http://ports.ubuntu.com/ubuntu-ports/"=
 target=3D"_blank" rel=3D"noopener">http://ports.ubuntu.com/ubuntu-ports/</=
a> \<br />- $ARGS<br />- ;;<br />- * )<br />- echo "Unknown command: $CMD"<=
br />- exit 2<br />- ;;<br />-esac<br />-<br />-# Clean up<br />-if [ ! -z =
"$HOSTCHROOT" -a -d $HOSTCHROOT/proc/self/fd ]; then<br />- do-bind-mounts.=
sh --unmount $HOSTCHROOT<br />-fi<br />-- <br />2.7.4</blockquote>

--KXvjHBUV7TBDBXcshXMo--
