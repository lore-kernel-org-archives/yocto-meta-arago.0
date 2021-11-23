Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.6834.1637640068432250296
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 20:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C20F140C83;
	Tue, 23 Nov 2021 04:01:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4BbI0IIzJUZ4; Tue, 23 Nov 2021 04:01:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 902A340B05;
	Tue, 23 Nov 2021 04:01:04 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9BC1B1746D4;
	Mon, 22 Nov 2021 23:01:03 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: j-humphreys@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [tisdk-build-scripts][PATCH 01/10] Remove very old debian/ubuntu build scripts and configs
Date: Mon, 22 Nov 2021 23:00:38 -0500
Message-Id: <1637640060-31733-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637640060-31733-1-git-send-email-denis@denix.org>
References: <1637640060-31733-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 build-ubuntu-environment.sh              | 194 -------------------------------
 configs/ubuntu-environment-creation.conf | 162 --------------------------
 lib/ubuntu/apt-helper-functions          |  20 ----
 lib/ubuntu/create-target-files           |  51 --------
 lib/ubuntu/create-ubuntu-host-chroot.sh  |  77 ------------
 lib/ubuntu/do-bind-mounts.sh             |  22 ----
 lib/ubuntu/kernel-build.sh               |  46 --------
 lib/ubuntu/run-opentest-on-target-image  |  35 ------
 lib/ubuntu/sudo-check                    |   5 -
 lib/ubuntu/use-armhf-pbuilder.sh         | 117 -------------------
 10 files changed, 729 deletions(-)
 delete mode 100755 build-ubuntu-environment.sh
 delete mode 100644 configs/ubuntu-environment-creation.conf
 delete mode 100644 lib/ubuntu/apt-helper-functions
 delete mode 100644 lib/ubuntu/create-target-files
 delete mode 100755 lib/ubuntu/create-ubuntu-host-chroot.sh
 delete mode 100755 lib/ubuntu/do-bind-mounts.sh
 delete mode 100755 lib/ubuntu/kernel-build.sh
 delete mode 100644 lib/ubuntu/run-opentest-on-target-image
 delete mode 100644 lib/ubuntu/sudo-check
 delete mode 100755 lib/ubuntu/use-armhf-pbuilder.sh

diff --git a/build-ubuntu-environment.sh b/build-ubuntu-environment.sh
deleted file mode 100755
index b5dbf45..0000000
--- a/build-ubuntu-environment.sh
+++ /dev/null
@@ -1,194 +0,0 @@
-#!/bin/bash
-
-# Setup signal traps to stop any running background processes as well in
-# the case that the script is stopped or exits
-trap 'test -z "`jobs -p`" || kill `jobs -p` > /dev/null 2>&1; echo "I got a signal"' SIGINT SIGQUIT SIGTSTP EXIT
-
-## Internal variables
-MYLIBS=`dirname $0`/lib
-
-## Our library functions
-source $MYLIBS/common-functions
-source $MYLIBS/ubuntu/create-target-files
-source $MYLIBS/ubuntu/apt-helper-functions
-source $MYLIBS/ubuntu/sudo-check
-source $MYLIBS/run-opentest
-source $MYLIBS/ubuntu/run-opentest-on-target-image
-
-# Shorten the command to work in the ARM targetfs chroot
-chroot_arm_targetfs() {
-	sudo chroot $BUILD_ROOT chroot /tmp/targetfs $*
-}
-
-if [ $(sudo_check) -ne 0 ]; then
-	echo "Problem using sudo, exiting"
-	exit 1
-fi
-
-# Add our directory to PATH for now
-PATH=${PATH}:$MYLIBS/ubuntu
-
-# Parse the input config file to set the required build variables
-parse_config_file `dirname $0`/configs/ubuntu-environment-creation.conf
-
-# Verify that the MANDATORY_INPUTS have been set.  We know there are some
-# values that absolutely need to be set or else you will end up
-# trashing your host configuration.
-if [ "$MANDATORY_INPUTS" == "" ]
-then
-    echo "Mandatory inputs not set"
-    exit 1
-fi
-
-check_mandatory_inputs $MANDATORY_INPUTS
-
-## Finish our internal variables.
-TARGETFS=$BUILD_ROOT/tmp/targetfs
-
-# Prepare the host chroot.
-echo "Starting in `pwd`"
-echo "Making clean Ubuntu 12.04.1 chroot (host)"
-create-ubuntu-host-chroot.sh --release precise  --target $BUILD_ROOT
-use-armhf-pbuilder.sh --chroot $BUILD_ROOT --command create
-
-# Start the ARM targetfs directory out
-mkdir -p $BUILD_ROOT/tmp/targetfs
-if [ ! -x `which wget` ]; then
-	echo "Could not find wget, aborting!"
-	exit 1
-fi
-wget $ARMCOREURI
-sudo tar -C $TARGETFS -xf `basename $ARMCOREURI`
-rm `basename $ARMCOREURI`
-do-bind-mounts.sh $TARGETFS
-
-# Fetch kernel sources.  When using gitorious we may have to wait while
-# the tarball is being generated.
-wget --no-check-certificate -O linux.tgz $KERNELSRCURI
-grep -q "he archive is currently being generated, try " linux.tgz
-while test $? -eq 0; do
-	sleep 60
-	wget --no-check-certificate -O linux.tgz $KERNELSRCURI
-	grep -q "he archive is currently being generated, try " linux.tgz
-done
-cp $MYLIBS/ubuntu/kernel-build.sh $BUILD_ROOT/tmp/
-mv linux.tgz $BUILD_ROOT/tmp/
-# Now build.
-use-armhf-pbuilder.sh --chroot $BUILD_ROOT --command --execute \
-	-- /tmp/kernel-build.sh --config $KERNELCONFIGTGT \
-	--source-tarball /tmp/linux.tgz
-
-# Start the feed.
-mkdir -p $BUILD_ROOT/tmp/feed/dists/precise/main/binary-arm{el,hf}
-
-# See if we have a directory of packages to rebuild and place into the feed.
-if [ "x$DEBPKGDIR" != "x" ]; then
-	sudo mkdir $BUILD_ROOT/tmp/rebuildme
-	sudo mount -o bind $DEBPKGDIR $BUILD_ROOT/tmp/rebuildme
-
-	# Now build.
-	for DSC in `(cd $DEBPKGDIR;ls *.dsc)`;do
-		use-armhf-pbuilder.sh --chroot $BUILD_ROOT --command  \
-			build /tmp/rebuildme/$DSC
-	done
-
-	# Move to feed directory.
-	sudo mv $BUILD_ROOT/var/cache/pbuilder/result/*.deb \
-		$BUILD_ROOT/tmp/feed/dists/precise/main/binary-armhf/
-	sudo umount $BUILD_ROOT/tmp/rebuildme
-fi
-
-# Create our local feed for this
-sudo chown -R `id -u` $BUILD_ROOT/tmp/tmp.*
-sudo mv $BUILD_ROOT/tmp/tmp.*/*.deb $BUILD_ROOT/tmp/feed/dists/precise/main/binary-armel/
-sudo chroot $BUILD_ROOT sh -c \
-	"cd /tmp/feed;dpkg-scanpackages -a armel dists" > Packages
-sudo mv Packages $BUILD_ROOT/tmp/feed/dists/precise/main/binary-armel/
-sudo chroot $BUILD_ROOT sh -c \
-	"cd /tmp/feed;dpkg-scanpackages -a armhf dists" > Packages
-sudo mv Packages $BUILD_ROOT/tmp/feed/dists/precise/main/binary-armhf/
-
-# Prepare the ARM chroots for use
-sudo cp $BUILD_ROOT/usr/bin/qemu-arm-static $TARGETFS/usr/bin/
-sudo cp `dirname $0`/configs/target-debconf-selections.txt $TARGETFS/tmp/
-if [ "x$USE_PROXY" == "x1" ]; then
-	create_apt_conf_d_proxy
-	sudo mv proxy $TARGETFS/etc/apt/apt.conf.d/
-fi
-sudo cp /etc/resolv.conf $TARGETFS/etc/
-echo foreign-architecture armel | \
-	sudo tee $TARGETFS/etc/dpkg/dpkg.cfg.d/architectures
-sudo sed -i -e 's/^# deb /deb /g' -e 's/^deb /deb [arch=armhf] /' \
-	$TARGETFS/etc/apt/sources.list
-echo "deb [arch=armel,armhf] file:/tmp/feed precise main" | \
-	sudo tee $TARGETFS/etc/apt/sources.list.d/local.list
-
-# Now install in the target chroot
-mkdir -p $TARGETFS/tmp/feed
-sudo mount -o bind $BUILD_ROOT/tmp/feed $TARGETFS/tmp/feed
-chroot_arm_targetfs debconf-set-selections /tmp/target-debconf-selections.txt
-chroot_arm_targetfs apt-get update
-chroot_arm_targetfs apt-get --yes --force-yes upgrade
-chroot_arm_targetfs apt-get --yes --force-yes install ${TARGET_PACKAGES}
-chroot_arm_targetfs apt-get --yes --force-yes install linux-firmware-image \
-	linux-image-$KERNELVER
-sudo umount $TARGETFS/tmp/feed
-sudo rm $TARGETFS/etc/apt/sources.list.d/local.list \
-	$TARGETFS/tmp/target-debconf-selections.txt
-
-# Make sure we can login
-create_serial_auto_detect_console_files
-sudo mv serial-auto-detect-console.conf $TARGETFS/etc/init/
-sudo mv serial-console $TARGETFS/bin/
-sudo chmod 0755 $TARGETFS/bin/serial-console
-sudo chown 0:0 $TARGETFS/bin/serial-console \
-	$TARGETFS/etc/init/serial-auto-detect-console.conf
-
-# Add a user to login with, in the targetfs
-chroot_arm_targetfs adduser --disabled-password -q demo --gecos \"\"
-sudo sed -i -e 's/^demo:x:1000/demo::1000/' $TARGETFS/etc/passwd
-# No password root.
-sudo sed -i -e 's/^root:x:0/root::0/' $TARGETFS/etc/passwd
-if [ "x$ENABLE_OPENTEST" != "x" ]; then
-	# For opentest, we need to add pts/0-7 to /etc/securetty
-	printf "pts/0\npts/1\npts/2\npts/3\npts/4\npts/5\npts/6\npts/7\n" | \
-		sudo tee -a $TARGETFS/etc/securetty
-fi
-# And allow sudo for 'demo'
-echo "demo ALL=NOPASSWD: ALL" | sudo tee $TARGETFS/etc/sudoers.d/demo
-
-# TODO: Make removing qemu-arm-static from targetfs an option for debugging on
-# host
-
-# Clean up
-# We borrow from
-# http://askubuntu.com/questions/162319/how-do-i-stop-all-processes-in-a-chroot
-# for a "kill everything" type solution within the target chroot.
-do-bind-mounts.sh --unmount $BUILD_ROOT
-for ROOT in /proc/*/root; do
-    LINK=$(sudo readlink $ROOT)
-    if [ "x$LINK" != "x" ]; then
-        if [ "x${LINK:0:${#TARGETFS}}" = "x$TARGETFS" ]; then
-            # this process is in the chroot...
-            sudo kill -9 $(basename $(dirname "$ROOT"))
-        fi
-    fi
-done
-do-bind-mounts.sh --unmount $TARGETFS
-sudo rm $TARGETFS/etc/resolv.conf
-
-# Archive target rootfs
-# TODO: Add more options than tar.gz?
-if [ ! -d out ]; then
-	mkdir out
-fi
-
-sudo tar -C $TARGETFS --one-file-system -jcf out/targetfs.tar.bz2 .
-
-if [ "x$ENABLE_OPENTEST" != "x" ]; then
-    # Prepare for opentest, which requires ifconfig in the path.
-    PATH=${PATH}:$MYLIBS/ubuntu:/sbin
-    mkdir -p $LOG_DIR
-    set_opentest_platform $MACHINES
-    run_opentest_on_image $MACHINES
-fi
diff --git a/configs/ubuntu-environment-creation.conf b/configs/ubuntu-environment-creation.conf
deleted file mode 100644
index 7ca04da..0000000
--- a/configs/ubuntu-environment-creation.conf
+++ /dev/null
@@ -1,162 +0,0 @@
-################################################################################
-#                    Ubuntu Environment configuration file                     #
-################################################################################
-
-# This variable contains the list of variables found in this congif file
-# that MUST be set to a value.  Failure to set these variables could
-# lead to corruption of the host system or the build script not
-# executing properly
-MANDATORY_INPUTS="USE_PROXY ARMCOREURI MACHINES BUILD_ID SCRIPTS_ROOT BUILD_ROOT FS_IMAGE_TYPE NFS_ROOT LOG_DIR"
-
-# This variable contains the list of machines to build an SDK for
-MACHINES="am335x-evm"
-
-# This variable holds the unique ID for the build that will be used to
-# identify the build.
-BUILD_ID="`date +build-%F_%H-%M-%S`"
-
-# This variable contains the script directory where these scripts are running
-# from.  This is to allow finding other files used during the build later.
-# You should likely not change this
-SCRIPTS_ROOT="$PWD"
-
-# This variable points to be base of your build where the chroots will be
-# constructed and based within.
-BUILD_ROOT="$SCRIPTS_ROOT/ubuntu-$(uname -m)-12.04.1-chroot"
-
-# This variable contains the "filter" string to look for inside of the
-# SDK to select which file system to test.  Currently only testing of
-# one file system is supported.
-FS_FILTER=""
-
-# This variable indicates the type of FS images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-FS_IMAGE_TYPE="tar.bz2"
-
-# This variable points to an NFS share which has been pre-configured.  The
-# target testing will be done by creating a subdirectory in this NFS_ROOT
-# for each machine to boot the target board.
-# This directory should be configured to allow writing by the jenkins user
-# at a minimum, although allowing writing by anyone is simple.
-NFS_ROOT="/home/jenkins/nfs-root"
-
-# This directory will contain the log files for the various parts of the build.
-# This includes:
-#   1. Overall build process log (i.e. which machines are in which build dir)
-#   2. Build logs for individual machines
-#   3. Test logs for individual machines
-#   4. Packaging logs for individual machines
-LOG_DIR="${SCRIPTS_ROOT}/log-files"
-
-# This variable points to the base location where files will be extracted for
-# testing purposes.  This should not be confused with the NFS root which
-# will be configured below.
-# This variable should always be declared AFTER the BUILD_ROOT variable.
-# The build scripts will create subdirectories such as:
-#   - TEST_ROOT/tmp/am335x-evm-test
-# You can usually just take the default value
-TEST_ROOT="$BUILD_ROOT/tmp/testing"
-
-# This variable points to the directory with the test scripts you want to
-# run.  The entire directory will be copied to make removing the test scripts
-# easier during cleanup.
-# NOTE: The assumption is that this directory contains at least the
-#       following files:
-#           - opentest.sh // This is called by opentest framework
-#           - S90-fake-pointercal // This fakes pointer calibration
-#           - nightly-test.sh // This is called by opentest.sh and does
-#                                machine specific testing
-# NOTE: Since the scripts will be copied to /home/root/<directory name>
-#       the opentest.sh script should call the scripts in the new directory.
-TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
-
-# This variable points to the directory within the target filesystem that
-# the scripts directory in TEST_SCRIPTS will be copied as.
-TEST_SCRIPTS_TGT="root/test-scripts"
-
-# This variable contains the tarball name for the opentest CLI which is
-# required to do target side testing.
-OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
-
-# This variable will allow control over whether to perform build testing or
-# skip it.  This should usually be set to true but may be changed for
-# prototyping.
-RUN_BUILD_TESTS="true"
-
-# This variable points to the STAF installation location which is used
-# during the build test steps to call into the OpenTest Framework.  This
-# default value is the default value from the STAF installer
-STAF_ROOT="/usr/local/staf"
-
-# This variable indicates whether to continue the build process for a machine
-# even when the build testing fails.  This can be useful in the case of
-# the test system being down to allow the full packaging of the SDK to
-# continue.
-SKIP_TEST_FAILURES="false"
-
-################################################################################
-# Network proxy related options, used during creating of the target.  Set
-# them to blank if not needed.
-################################################################################
-
-# Do we need to be using some sort of proxies at all?
-USE_PROXY=1
-
-# If we need to use a proxy, and it is not already set within the
-# environment, set these variables as well.
-http_proxy=http://wwwgate.ti.com:80
-#https_proxy=http://wwwgate.ti.com:80
-#ftp_proxy=http://wwwgate.ti.com:80
-
-# If we have a local caching proxy for fetching debs, set this
-LOCALDEBPROXY="http://apt-cache.dal.design.ti.com:3142"
-
-# If we have a local deb mirror as well, set this
-LOCALDEBMIRROR="ubuntu.dal.design.ti.com"
-
-################################################################################
-# Location of the target chroot
-ARMCOREURI="http://cdimage.ubuntu.com/ubuntu-core/releases/12.04/release/ubuntu-core-12.04.1-core-armhf.tar.gz"
-
-# Location of the kernel sources, and defconfig target
-KERNELSRCURI="https://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel/archive-tarball/ti-linux-3.8-rc3"
-KERNELCONFIGTGT="omap2plus"
-KERNELVER="3.8.0-rc3"
-
-# A directory that contains packages to be built by us.  For each package
-# you need to include all of the outputs from 'debuild -i -uc -us -S'
-# in the original package sources.
-DEBPKGDIR="$SCRIPTS_ROOT/rebuildme"
-
-################################################################################
-# OpenTest configuration section.
-################################################################################
-
-# Do we want to run opentest?  This will enable additional things such as
-# no password root login via telnet.
-ENABLE_OPENTEST="1"
-
-# Packages on the target that must be installed for OpenTest to run and test
-# things.  telnetd must be installed for the framework to connect to the
-# target.  Anything else would be for the individual tests.
-TARGET_OPENTEST_PACKAGES="telnetd"
-
-################################################################################
-# Package selection for the target and optional host environment.
-################################################################################
-
-# Various packages we want to install into the final target filesystem
-# We install debconf-utils for debconf-get-selections which we use to keep
-# target-debconf-selections.txt up to date and make package installation
-# non-interactive.
-TARGET_BASE_PACKAGES="u-boot"
-TARGET_MISC_PACKAGES="sudo debconf-utils"
-TARGET_NETWORK_PACKAGES="net-tools isc-dhcp-client"
-TARGET_X11_PACKAGES="xserver-xorg-input-tslib xfce4"
-TARGET_PACKAGES="${TARGET_MISC_PACKAGES} ${TARGET_NETWORK_PACKAGES} \
-	${TARGET_X11_PACKAGES} ${TARGET_OPENTEST_PACKAGES} \
-	${TARGET_BASE_PACKAGES}"
-
-# Various packages we want to install into the host chroot environment.
-HOST_CHROOT_ENV_PACKAGES="qemu-user-static pbuilder debootstrap devscripts \
-	pbuilder-scripts dpkg-dev"
diff --git a/lib/ubuntu/apt-helper-functions b/lib/ubuntu/apt-helper-functions
deleted file mode 100644
index 6ac05aa..0000000
--- a/lib/ubuntu/apt-helper-functions
+++ /dev/null
@@ -1,20 +0,0 @@
-create_apt_conf_d_proxy() {
-	PROXY=""
-	MIRROR=""
-	if [ "x$LOCALDEBPROXY" != "x" ]; then
-		PROXY="Proxy \"$LOCALDEBPROXY\";"
-	fi
-	if [ "x$LOCALDEBMIRROR" != "x" ]; then
-		MIRROR="Proxy::$LOCALDEBMIRROR \"DIRECT\";"
-	fi
-# TODO: Use mktemp
-	cat << EOF > proxy
-Acquire
-{
-  http {
-    $PROXY
-    $MIRROR
-  }
-}
-EOF
-}
diff --git a/lib/ubuntu/create-target-files b/lib/ubuntu/create-target-files
deleted file mode 100644
index 20d1089..0000000
--- a/lib/ubuntu/create-target-files
+++ /dev/null
@@ -1,51 +0,0 @@
-# Create the two files needed for serial consoles
-create_serial_auto_detect_console_files() {
-# TODO: Use mktemp
-	cat << EOF > serial-auto-detect-console.conf
-# serial-auto-detect-console - starts getty on serial console
-#
-# This service starts a getty on the serial port given in the 'console' kernel
-# argument.
-#
-
-start on runlevel [23]
-stop on runlevel [!23]
-
-respawn
-
-exec /bin/sh /bin/serial-console
-EOF
-
-	cat << EOF > serial-console
-#!/bin/bash
-for arg in \$(cat /proc/cmdline)
-do  
-    case \$arg in
-        console=*)
-            tty=\${arg#console=}
-            tty=\${tty#/dev/}
-
-            case \$tty in
-                tty[a-zA-Z]* )
-                    PORT=\${tty%%,*}
-
-                    # check for service which do something on this port
-                    if [ -f /etc/init/\$PORT.conf ];then continue;fi
-
-                    tmp=\${tty##\$PORT,}
-                    SPEED=\${tmp%%n*}
-                    BITS=\${tmp##\${SPEED}n}
-
-                    # 8bit serial is default
-                    [ -z \$BITS ] && BITS=8
-                    [ 8 -eq \$BITS ] && GETTY_ARGS="\$GETTY_ARGS -8 "
-
-                    [ -z \$SPEED ] && SPEED='115200,57600,38400,19200,9600'
-
-                    GETTY_ARGS="\$GETTY_ARGS \$SPEED \$PORT"
-                    exec /sbin/getty \$GETTY_ARGS
-            esac
-    esac
-done
-EOF
-}
diff --git a/lib/ubuntu/create-ubuntu-host-chroot.sh b/lib/ubuntu/create-ubuntu-host-chroot.sh
deleted file mode 100755
index 07644e3..0000000
--- a/lib/ubuntu/create-ubuntu-host-chroot.sh
+++ /dev/null
@@ -1,77 +0,0 @@
-#!/bin/bash
-#
-# This script will create a 'buildd' variant chroot of the passed in release
-# name and place it into the named directory.
-
-if [ $# -ne 4 ]; then
-	echo "Usage:"
-	echo "$0 --release codename --target chroot-directory"
-	echo "For example:"
-	echo "$0 --release precise --target ubuntu-12.04.1-chroot"
-	exit 1
-fi
-
-while test $# -ne 0; do
-        if [ "$1" == "--release" ]; then
-		RELEASE="$2"
-		shift 2
-	elif [ "$1" == "--target" ]; then
-		HOSTCHROOT="$2"
-		shift 2
-	else
-		echo "Unsupported argument $1"
-		exit 1
-	fi
-done
-
-## Internal variables
-MYLIBS=`dirname $0`
-MYCONF=`dirname $0`/../../configs
-
-## Our library functions
-. $MYLIBS/apt-helper-functions
-. $MYLIBS/sudo-check
-
-## Configuration details
-. $MYCONF/ubuntu-environment-creation.conf
-
-## Add our directory to PATH for now
-PATH=${PATH}:$MYLIBS
-
-if [ $(sudo_check) -ne 0 ]; then
-	echo "Problem using sudo, exiting"
-	exit 1
-fi
-
-if [ `uname -m` == "x86_64" ]; then
-	HOSTARCH=amd64
-elif [ `uname -m` == "i686" ]; then
-	HOSTARCH=i386
-else
-	echo "Could not determine host arch (uname -m) for Ubuntu, exiting"
-	exit 1
-fi
-
-sudo debootstrap --variant=buildd --arch $HOSTARCH $RELEASE $HOSTCHROOT \
-	http://mirrors.us.kernel.org/ubuntu/
-
-# Setup bind mounts
-do-bind-mounts.sh $HOSTCHROOT
-
-# Prepare the host chroot.
-if [ "x$USE_PROXY" == "x1" ]; then
-	create_apt_conf_d_proxy
-	sudo mv proxy $HOSTCHROOT/etc/apt/apt.conf.d/
-fi
-sudo cp /etc/hosts $HOSTCHROOT/etc/
-printf "deb http://us.archive.ubuntu.com/ubuntu/ $RELEASE universe
-deb http://us.archive.ubuntu.com/ubuntu/ $RELEASE-updates universe
-deb http://us.archive.ubuntu.com/ubuntu/ $RELEASE-backports universe\n" | \
-	sudo tee $HOSTCHROOT/etc/apt/sources.list.d/$RELEASE-universe.list
-export HOME=`mktemp -d`
-sudo mkdir -p $HOSTCHROOT/$HOME
-sudo chroot $HOSTCHROOT apt-get update
-sudo chroot $HOSTCHROOT apt-get --yes install ${HOST_CHROOT_ENV_PACKAGES}
-
-# Clean up
-do-bind-mounts.sh --unmount $HOSTCHROOT
diff --git a/lib/ubuntu/do-bind-mounts.sh b/lib/ubuntu/do-bind-mounts.sh
deleted file mode 100755
index 96c15d7..0000000
--- a/lib/ubuntu/do-bind-mounts.sh
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/bash
-
-if [ $# -lt 1 -o $# -gt 2 -o $# -eq 2 -a "$1" != "--unmount" ]; then
-	echo "$0 [--unmount] directory"
-	exit 1;
-fi
-
-# Handle unmount
-if [ $# -eq 2 ];then
-	for DIR in dev/pts dev sys proc/sys/fs/binfmt_misc proc;do 
-		sudo umount $2/$DIR 2>/dev/null
-	done
-	exit 0;
-fi
-
-for DIR in sys dev dev/pts proc;do
-	if [ ! -d $1/$DIR ]; then
-		echo "No $1/$DIR ?  Exit!"
-		exit 1
-	fi
-	sudo mount -o bind /$DIR $1/$DIR
-done
diff --git a/lib/ubuntu/kernel-build.sh b/lib/ubuntu/kernel-build.sh
deleted file mode 100755
index dac3e2f..0000000
--- a/lib/ubuntu/kernel-build.sh
+++ /dev/null
@@ -1,46 +0,0 @@
-#!/bin/bash
-#
-# Given that we are being invoked in an environment where 'make deb-pkg' in
-# the kernel will produce the deb packages for the architecture we want, we
-# need to be passed:
-# --config target (such as omap2plus)
-# --source-tarball (such as linux-am33x.tar.bz2)
-#
-# And we are given a pre-patched (if needed) source tree.
-#
-
-if [ $# -ne 4 ]; then
-	echo "Usage:"
-	echo "$0 --config config_target --source-tarball source.tar.bz2"
-	echo "For example:"
-	echo "$0 --config omap2plus --source-tarball linux-am33x.tar.bz2"
-	exit 1
-fi
-
-while test $# -ne 0; do
-        if [ "$1" == "--config" ]; then
-		CONFIG="$2"
-		shift 2
-	elif [ "$1" == "--source-tarball" ]; then
-		SRC="$2"
-		shift 2
-	else
-		echo "Unsupported argument $1"
-		exit 1
-	fi
-done
-
-# Unpack, configure, build.
-D1=`mktemp -d`
-cd $D1
-tar xf $SRC
-KSRC=`ls`
-cd $KSRC
-make ${CONFIG}_defconfig
-if [ -x /usr/bin/getconf ]; then
-	JOBS=`getconf _NPROCESSORS_CONF`
-else
-	JOBS=2
-fi
-make -j$JOBS uImage modules
-make KBUILD_IMAGE=uImage deb-pkg
diff --git a/lib/ubuntu/run-opentest-on-target-image b/lib/ubuntu/run-opentest-on-target-image
deleted file mode 100644
index 066e8dc..0000000
--- a/lib/ubuntu/run-opentest-on-target-image
+++ /dev/null
@@ -1,35 +0,0 @@
-run_opentest_on_image() {
-    # Set m for logging purposes
-    m="$1"
-
-    # Create a temporary directory to extract the build files to for
-    # testing.  If the directory already exists then delete the old
-    # contents first.
-    test_dir="$TEST_ROOT/$m-test"
-
-    if [ -d $test_dir ]
-    then
-        rm -rf $test_dir
-    fi
-    mkdir -p $test_dir
-
-    # Only run the build testing if the config file says to do so
-    if [ "$RUN_BUILD_TESTS" == "true" ]
-    then
-        run_target_side_test $m
-    else
-        echo "SKIPPED" > $LOG_DIR/$m-test-result.txt
-    fi
-
-    if [ "$?" != "0" -a "$SKIP_TEST_FAILURES" == "true" ]
-    then
-        # Check if this was a CRITICAL failure
-        grep "CRITICAL" $LOG_DIR/$m-test-result.txt > /dev/null 2>&1
-        if [ "$?" == "0" ]
-        then
-            # This was a critical failure so return without copying
-            # the files
-            return 1
-        fi
-    fi
-}
diff --git a/lib/ubuntu/sudo-check b/lib/ubuntu/sudo-check
deleted file mode 100644
index d80b390..0000000
--- a/lib/ubuntu/sudo-check
+++ /dev/null
@@ -1,5 +0,0 @@
-sudo_check() {
-	# See if the user is allowed to use sudo
-	sudo -v > /dev/null 2>&1
-	echo $?
-}
diff --git a/lib/ubuntu/use-armhf-pbuilder.sh b/lib/ubuntu/use-armhf-pbuilder.sh
deleted file mode 100755
index fa4cca3..0000000
--- a/lib/ubuntu/use-armhf-pbuilder.sh
+++ /dev/null
@@ -1,117 +0,0 @@
-#!/bin/bash
-#
-# This script will call pbuilder create and make the armhf that can be
-# used later to build target packages.  We take an optional argument of
-# --chroot host-chroot of a directory to chroot into and invoke our
-# pbuilder commands.
-
-## Internal variables
-MYLIBS=`dirname $0`/..
-MYCONF=`dirname $0`/../../configs
-
-## Our library functions
-source $MYLIBS/ubuntu/sudo-check
-source $MYLIBS/common-functions
-
-while test $# -ne 0; do
-	if [ "$1" == "--chroot" ]; then
-		HOSTCHROOT="$2"
-		shift 2
-	elif [ "$1" == "--command" ]; then
-		CMD="$2"
-		shift 2
-		ARGS="$*"
-		shift $#
-	else
-		echo "Unsupported argument $1"
-		echo "Usage: $0 [--chroot host-chroot] --command [args]"
-		exit 1
-	fi
-done
-
-if [ -z $CMD ]; then
-	echo "Usage: $0 [--chroot host-chroot] --command [args]"
-	exit 1
-fi
-
-# Parse the input config file to set the required build variables
-parse_config_file $MYCONF/ubuntu-environment-creation.conf
-
-# Verify that the MANDATORY_INPUTS have been set.  We know there are some
-# values that absolutely need to be set or else you will end up
-# trashing your host configuration.
-if [ "$MANDATORY_INPUTS" == "" ]
-then
-    echo "Mandatory inputs not set"
-    exit 1
-fi
-
-check_mandatory_inputs $MANDATORY_INPUTS
-
-if [ $(sudo_check) -ne 0 ]; then
-	echo "Problem using sudo, exiting"
-	exit 1
-fi
-
-# Add our directory to PATH for now
-PATH=${PATH}:$MYLIBS
-
-if [ "x$HOSTCHROOT" == "x" ]; then
-	PBUILDER="sudo pbuilder"
-	export HOME=`mktemp -d`
-else
-	PBUILDER="sudo chroot $HOSTCHROOT pbuilder"
-	export HOME=`sudo chroot $HOSTCHROOT mktemp -d`
-fi
-
-# Make sure the host chroot has bindmounts already setup.
-if [ ! -z $HOSTCHROOT -a ! -d $HOSTCHROOT/proc/self/fd ]; then
-	do-bind-mounts.sh $HOSTCHROOT
-fi
-
-# Optionally use a proxy, when invoking pbuilder
-PBUILDERPROXY=""
-if [ "x$LOCALDEBPROXY" != "x" ]; then
-	PBUILDERPROXY="--http-proxy $LOCALDEBPROXY"
-fi
-
-# Make sure we pass -j N along when building.
-if [ -x /usr/bin/getconf ]; then
-        JOBS=`getconf _NPROCESSORS_CONF`
-else
-        JOBS=2
-fi
-DEBUILDOPS="-j$JOBS"
-
-case $CMD in
-	create | --create )
-		$PBUILDER create --debootstrap qemu-debootstrap \
-			--bindmounts "/tmp" \
-			--debootstrapopts --variant=buildd --debootstrapopts \
-			--arch=armhf --extrapackages uboot-mkimage \
-			--mirror http://ports.ubuntu.com/ubuntu-ports/ \
-			$PBUILDERPROXY
-		;;
-	build | --build )
-		$PBUILDER --build $ARGS $PBUILDERPROXY \
-			--bindmounts "/tmp" \
-			--debbuildopts \"$DEBUILDOPS\" \
-			--mirror http://ports.ubuntu.com/ubuntu-ports/
-		;;
-	execute | --execute )
-		$PBUILDER --execute $PBUILDERPROXY \
-			--bindmounts "/tmp" \
-			--debbuildopts $DEBUILDOPS \
-			--mirror http://ports.ubuntu.com/ubuntu-ports/ \
-			$ARGS
-		;;
-	* )
-		echo "Unknown command: $CMD"
-		exit 2
-		;;
-esac
-
-# Clean up
-if [ ! -z "$HOSTCHROOT" -a -d $HOSTCHROOT/proc/self/fd ]; then
-	do-bind-mounts.sh --unmount $HOSTCHROOT
-fi
-- 
2.7.4

