Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.14430.1639175511866832753
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 14:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9293740C85;
	Fri, 10 Dec 2021 22:31:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mdC4wW6q-SE; Fri, 10 Dec 2021 22:31:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5654140C83;
	Fri, 10 Dec 2021 22:31:48 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E740C174712;
	Fri, 10 Dec 2021 17:31:46 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: j-humphreys@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [tisdk-build-scripts][PATCH 2/3] configs: cleanup config files due to removed functionality
Date: Fri, 10 Dec 2021 17:31:36 -0500
Message-Id: <1639175497-11553-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639175497-11553-1-git-send-email-denis@denix.org>
References: <1639175497-11553-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

With the removal of multi-machine builds, testing, packaging and publishing
functionality, corresponding settings in the config files can be removed
as well.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 configs/farm/arago-dunfell-next.txt | 281 +-----------------------------------
 configs/farm/arago-dunfell.txt      | 281 +-----------------------------------
 configs/farm/arago-master.txt       | 281 +-----------------------------------
 configs/farm/distroless-dunfell.txt | 136 ++---------------
 configs/farm/distroless-master.txt  | 136 ++---------------
 configs/farm/poky-dunfell.txt       | 136 ++---------------
 configs/farm/poky-master.txt        | 136 ++---------------
 7 files changed, 60 insertions(+), 1327 deletions(-)

diff --git a/configs/farm/arago-dunfell-next.txt b/configs/farm/arago-dunfell-next.txt
index 74b1094..2cf092c 100644
--- a/configs/farm/arago-dunfell-next.txt
+++ b/configs/farm/arago-dunfell-next.txt
@@ -2,43 +2,17 @@
 #                      Core TISDK configuration file                           #
 ################################################################################
 
-# This variable contains the list of variables found in this congif file
-# that MUST be set to a value.  Failure to set these variables could
-# lead to corruption of the host system or the build script not
-# executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS NUM_AARCH64_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+# This variable contains the list of variables found in this config file
+# that MUST be set to a value
+MANDATORY_INPUTS="MACHINES BUILD_ID SCRIPTS_ROOT BUILD_ROOT DEPLOY_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
 
-# This variable holds the SDK version you are building.  This will be picked
-# up in the installer name if you choose to package an installer.  You can
-# also use this in the CONFIG_FILE name below.
+# This variable holds the SDK version you are building
 TISDK_VERSION="live"
 
-# This variable contains the list of machines to build an SDK for
+# This variable contains the machine name to build for
 MACHINES=""
 
-# These variables indicate the maximum number of parallel builds that can be
-# done for each architecture.  Some things to note are:
-#   1. You should add these values together to get the maximum number of
-#      parallel builds.  If this is too many for your system then reduce the
-#      numbers.
-#   2. The machines will be built spread over the parallel builds and load
-#      balancing is handled automatically
-#   3. If there are no machines of a particular architectur then nothing will
-#      be built for that architecture
-#   4. In the case of just a couple of machines it may be faster to do only
-#      one build building both serially rather than two parallel builds
-#      depending on your system resources
-NUM_ARM9_BUILDS="1"
-NUM_CORTEX_BUILDS="1"
-NUM_AARCH64_BUILDS="1"
-
-# These variables contain the location of the bin directory where the toolchain
-# for each architecture is installed.
-TOOLCHAIN_ROOT_ARM9=""
-TOOLCHAIN_ROOT_CORTEX=""
-TOOLCHAIN_ROOT_AARCH64=""
-
-# SECDEV variables for CAT and AUTO
+# SECDEV variables for CAT, AUTO and K3
 TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
 TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
 TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
@@ -56,58 +30,12 @@ SCRIPTS_ROOT="$PWD"
 # checked out and the tmp build diretories for each architecture will be
 # created using the oe-layertool-setup.sh script from the repo at:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
-# This will be created using the 
-#   - These directories will look like:
-#       - BUILD_ROOT/sources
-#       - BUILD_ROOT/arm9-1/arago-tmp
-#       - BUILD_ROOT/cortex-1/arago-tmp
-#       - BUILD_ROOT/cortex-2/arago-tmp
 BUILD_ROOT="$SCRIPTS_ROOT/farm-arago-dunfell-next-build"
 
-# This variable points to the base location where files will be extracted for
-# testing purposes.  This should not be confused with the NFS root which
-# will be configured below.
-# This variable should always be declared AFTER the BUILD_ROOT variable.
-# The build scripts will create subdirectories such as:
-#   - TEST_ROOT/am335x-evm-test
-# You can usually just take the default value
-TEST_ROOT="$BUILD_ROOT/testing"
-
-# This variable points to the directory where files will be placed to allow
-# for final packaging.
-# This variable should always be declared AFTER the BUILD_ROOT variable
-# You can usually just take the default value
-PACKAGE_ROOT="$BUILD_ROOT/packaging"
-
 # This variable points to the base location where the SDK files will
 # be deployed.  This is essentially the final staging directory
 DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
 
-# This variable contains the "filter" string to look for inside of the
-# SDK to select which file system to test.  Currently only testing of
-# one file system is supported.
-FS_FILTER="tisdk-*rootfs-"
-
-# This variable indicates the type of FS images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-FS_IMAGE_TYPE="tar.xz"
-
-# This variable contains the "filter" string to look for inside of the
-# OE build directory to find the SDK image.  Since the image name can
-# vary based on the recipe settings this string will account for that.
-SDK_FILTER="tisdk-core-bundle-"
-
-# This variable indicates the type of SDK images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-SDK_IMAGE_TYPE="tar.xz"
-
-# This variable points to an NFS share which has been pre-configured.  The
-# target testing will be done by creating a subdirectory in this NFS_ROOT
-# for each machine to boot the target board.
-# This directory should be configured to allow writing by the jenkins user
-# at a minimum, although allowing writing by anyone is simple.
-NFS_ROOT="/home/jenkins/nfs-root"
-
 # This variable points to the location where the sources will be checked out
 # using the oe-layertool-setup.sh script from the following repository:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
@@ -120,7 +48,7 @@ CLEAN_BUILD="true"
 # This variable indicates whether we should clean shared state (sstate)
 CLEAN_SSTATE="true"
 
-# This variable means that we should clean not only build build directories,
+# This variable means that we should clean not only build directories,
 # but also the sources as well and do a fully clean build.
 CLEAN_ALL="false"
 
@@ -129,14 +57,9 @@ CLEAN_ALL="false"
 CONFIG_FILE="${BUILD_ROOT}/configs/arago-dunfell-next-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
-# This includes:
-#   1. Overall build process log (i.e. which machines are in which build dir)
-#   2. Build logs for individual machines
-#   3. Test logs for individual machines
-#   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/logs"
 
-# Setting this variable to "true" will enable logging stdout and stderr of the 
+# Setting this variable to "true" will enable logging stdout and stderr of the
 # bitbake command to the appropriate machine's build_log.txt.
 BUILD_LOG_VERBOSE="true"
 
@@ -153,194 +76,6 @@ SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 # of the source repos.
 BB_GENERATE_MIRROR_TARBALLS="1"
 
-# This shortcuts the entire testing and packaging portion of the code
-# and exits right after build step is done
-EXIT_AFTER_BUILD="true"
-
-# This variable points to an optional location where additional installer
-# content can be placed to be packaged inside of any image recipe that
-# inherits the tisdk-image class.  It is expected that the directory
-# structure should match the structure as you want it placed in the SDK.
-# If you are not building an SDK image with external components then this
-# is not required.
-INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"
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
-# NOTE: Since the scripts will be copied to TEST_SCRIPTS_TGT
-#       the opentest.sh script should call the scripts in the new directory.
-TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
-
-# This variable points to the directory within the target filesystem that
-# the scripts directory in TEST_SCRIPTS will be copied as.
-TEST_SCRIPTS_TGT="home/root/test-scripts"
-
-# This variable may be used to specify the exact network interface used to
-# communicate with the OpenTest Framework (e.g. eth1), instead of guessing it.
-# Useful on multi-homed machines with multiple interfaces, when guessing
-# between eth0 and eth1 is not possible. Leave empty for default behavior.
-TEST_LOCAL_IFACE="eth1"
-
-# This variable contains the tarball name for the opentest CLI which is
-# required to do target side testing.
-OPENTEST_CLI="$SCRIPTS_ROOT/linux-devtest.tgz"
-
-# Pre-configured conf/site_info.xml file for OpenTest client
-OPENTEST_CONF_SITE_INFO="$SCRIPTS_ROOT/site_info.xml"
-
-# This variable specifies the IP address of the TEE to be used with OpenTest
-# Defaults to 128.247.105.11 if not set
-OPENTEST_TEE_IP="none"
-
-# This variable specifies the hardware capabilities to be used with OpenTest
-# Capabilities are separated by underscores, some excamples are here:
-# http://arago-project.org/wiki/index.php/Opentest-CheatSheet
-# Defaults to "linux" if not set
-# Limit the board selection to official TI GT farm, avoiding personal boards
-OPENTEST_HW_CAP="linux_tigt_farm"
-
-# Determine whether SPL/UART and U-boot binaries are passed to OpenTest for
-# testing. Otherwise uses existing bootloaders on the board (SD, NAND, etc)
-OPENTEST_BOOTLOADERS="false"
-
-# Specify the number of attempts to boot the target (default is 1)
-OPENTEST_BOOT_ATTEMPTS="3"
-
-# Specify timeout in seconds for boot to finish (default is 150 sec)
-OPENTEST_BOOT_TIMEOUT="300"
-
-# This variable will allow control over whether to perform build testing or
-# skip it.  This should usually be set to true but may be changed for
-# prototyping.
-RUN_BUILD_TESTS="false"
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
-# This variable indicates whether to productize the build by packaging
-# it into an installer and web content.  This will require that
-# InstallBuilder be installed on your host system and that you have
-# and project file created to package it.  If not then you can use
-# the simple SDK tarball that was created during the build as your
-# SDK.
-PRODUCTIZE_SDK="false"
-
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
 BITBAKE_COMMAND="ti-rtos-metadata ; -k tisdk-core-bundle tisdk-tiny-image ti-world"
-
-# This variable controls whether the build configuration included at the bottom
-# of the results file includes comments or not. The default is "false" to filter
-# comments out.
-RESULTS_CONFIG_COMMENTS="false"
-
-################################################################################
-# The following variables only need to be set if PRODUCTIZE_SDK is true.
-# If not you do not need to set these variables.  If you do want to
-# publish an SDK you will need access to other tools such as webgen that
-# are not available outside of TI.
-################################################################################
-
-# This points to the location where the InstallBuilder application has
-# been extracted.
-INSTALL_BUILDER="/home/jenkins/installbuilder"
-
-# This variable points to the root diretory where the installer content will be
-# staged to build the installer.
-INSTALLER_ROOT="$BUILD_ROOT/installer"
-
-# This variable will point to the InstallBuilder file used to build the SDK
-# installer
-INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
-
-# This variable will provide the prefix for the installer filename and default 
-# installation directory.
-# NOTE: This prefix should match the installer filename given in the webgen.mak
-#  
-# Installer name will have the form: 
-#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
-# Installation directory will have the form:
-#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
-INSTALLER_PREFIX="ti-sdk"
-
-# This variable points to a directory where additional SD card content
-# is located.  In general this directory should have a structure like
-#   - <machine>/boot - holds extra boot partition content
-#   - <machine>/start_here - holds the extra start_here partition content
-# Many times you will want to use symlinks here to save space, so the
-# build scripts will use the -L option to copy the linked file instead of
-# the symlink.
-SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
-
-# This variable determines whether the uImage and dtb files should be placed in
-# the boot partition tarball or not.  For newer kernel and u-boot combinations
-# the uImage and dtb files are kept in the rootfs partition and placing it in
-# the boot partition will cause confusion.
-PACKAGE_BOOT_KERNEL_FILES="false"
-
-# This variable points to the directory where the webgen tool has been
-# Installed.
-WEBGEN_ROOT="/home/jenkins/webgen"
-
-# This variable points to the location where additional webgen/webpage files
-# are located.  Many times you will want to use symlinks here to save space
-# so the build scripts will use the -L option to copy the linked file instead
-# of the symlink.
-WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
-
-# This variable points to the root location where the publish SDK data is
-# stored.  This data is the webgen.mak files required to build the SDK
-# ti.com style web pages.
-# The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
-
-# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
-# to the webgen exports directory. Setting this variable to "1" will override
-# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
-EXPORT_ARAGO_SRC="0"
-
-# This variable specifies whether or not to copy the build contents to
-# a remote web hosting server.
-COPY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the deploy contents to a
-# remote web hosting server. These are unprocessed intermediate artifacts,
-# such as images, IPK feeds etc, so may not be distributed publicly as is.
-COPY_DEPLOY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the "golden" contents to a
-# remote web hosting server. These are images that passed run-time tests.
-COPY_GOLDEN_TO_WEB="false"
-
-# This variable points to the user@webhost:<basepath> location where the
-# deploy contents should be placed.  This is best done if you have done a
-# key exchange between these systems so that your SCP command will not ask
-# for a password.
-WEB_HOST=""
-
-# This variable determines whether the DEPLOY_ROOT will be cleaned after
-# the remote copy.  The reason for this is that if the files already exist
-# on the remote system there is no need to keep them on the local system.
-CLEAN_AFTER_COPY="true"
-
-# This variable determines if the results directory should be copied before
-# the deploy directory is cleaned.  If this value is set then the results
-# will be copied to the given directory.  If not then they will not be
-# copied and will be cleaned if CLEAN_AFTER_COPY is true.
-BACKUP_RESULTS=""
diff --git a/configs/farm/arago-dunfell.txt b/configs/farm/arago-dunfell.txt
index e099df2..331ef0f 100644
--- a/configs/farm/arago-dunfell.txt
+++ b/configs/farm/arago-dunfell.txt
@@ -2,43 +2,17 @@
 #                      Core TISDK configuration file                           #
 ################################################################################
 
-# This variable contains the list of variables found in this congif file
-# that MUST be set to a value.  Failure to set these variables could
-# lead to corruption of the host system or the build script not
-# executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS NUM_AARCH64_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+# This variable contains the list of variables found in this config file
+# that MUST be set to a value
+MANDATORY_INPUTS="MACHINES BUILD_ID SCRIPTS_ROOT BUILD_ROOT DEPLOY_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
 
-# This variable holds the SDK version you are building.  This will be picked
-# up in the installer name if you choose to package an installer.  You can
-# also use this in the CONFIG_FILE name below.
+# This variable holds the SDK version you are building
 TISDK_VERSION="live"
 
-# This variable contains the list of machines to build an SDK for
+# This variable contains the machine name to build for
 MACHINES=""
 
-# These variables indicate the maximum number of parallel builds that can be
-# done for each architecture.  Some things to note are:
-#   1. You should add these values together to get the maximum number of
-#      parallel builds.  If this is too many for your system then reduce the
-#      numbers.
-#   2. The machines will be built spread over the parallel builds and load
-#      balancing is handled automatically
-#   3. If there are no machines of a particular architectur then nothing will
-#      be built for that architecture
-#   4. In the case of just a couple of machines it may be faster to do only
-#      one build building both serially rather than two parallel builds
-#      depending on your system resources
-NUM_ARM9_BUILDS="1"
-NUM_CORTEX_BUILDS="1"
-NUM_AARCH64_BUILDS="1"
-
-# These variables contain the location of the bin directory where the toolchain
-# for each architecture is installed.
-TOOLCHAIN_ROOT_ARM9=""
-TOOLCHAIN_ROOT_CORTEX=""
-TOOLCHAIN_ROOT_AARCH64=""
-
-# SECDEV variables for CAT and AUTO
+# SECDEV variables for CAT, AUTO and K3
 TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
 TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
 TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
@@ -56,58 +30,12 @@ SCRIPTS_ROOT="$PWD"
 # checked out and the tmp build diretories for each architecture will be
 # created using the oe-layertool-setup.sh script from the repo at:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
-# This will be created using the 
-#   - These directories will look like:
-#       - BUILD_ROOT/sources
-#       - BUILD_ROOT/arm9-1/arago-tmp
-#       - BUILD_ROOT/cortex-1/arago-tmp
-#       - BUILD_ROOT/cortex-2/arago-tmp
 BUILD_ROOT="$SCRIPTS_ROOT/farm-arago-dunfell-build"
 
-# This variable points to the base location where files will be extracted for
-# testing purposes.  This should not be confused with the NFS root which
-# will be configured below.
-# This variable should always be declared AFTER the BUILD_ROOT variable.
-# The build scripts will create subdirectories such as:
-#   - TEST_ROOT/am335x-evm-test
-# You can usually just take the default value
-TEST_ROOT="$BUILD_ROOT/testing"
-
-# This variable points to the directory where files will be placed to allow
-# for final packaging.
-# This variable should always be declared AFTER the BUILD_ROOT variable
-# You can usually just take the default value
-PACKAGE_ROOT="$BUILD_ROOT/packaging"
-
 # This variable points to the base location where the SDK files will
 # be deployed.  This is essentially the final staging directory
 DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
 
-# This variable contains the "filter" string to look for inside of the
-# SDK to select which file system to test.  Currently only testing of
-# one file system is supported.
-FS_FILTER="tisdk-*rootfs-"
-
-# This variable indicates the type of FS images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-FS_IMAGE_TYPE="tar.xz"
-
-# This variable contains the "filter" string to look for inside of the
-# OE build directory to find the SDK image.  Since the image name can
-# vary based on the recipe settings this string will account for that.
-SDK_FILTER="tisdk-core-bundle-"
-
-# This variable indicates the type of SDK images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-SDK_IMAGE_TYPE="tar.xz"
-
-# This variable points to an NFS share which has been pre-configured.  The
-# target testing will be done by creating a subdirectory in this NFS_ROOT
-# for each machine to boot the target board.
-# This directory should be configured to allow writing by the jenkins user
-# at a minimum, although allowing writing by anyone is simple.
-NFS_ROOT="/home/jenkins/nfs-root"
-
 # This variable points to the location where the sources will be checked out
 # using the oe-layertool-setup.sh script from the following repository:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
@@ -120,7 +48,7 @@ CLEAN_BUILD="true"
 # This variable indicates whether we should clean shared state (sstate)
 CLEAN_SSTATE="true"
 
-# This variable means that we should clean not only build build directories,
+# This variable means that we should clean not only build directories,
 # but also the sources as well and do a fully clean build.
 CLEAN_ALL="false"
 
@@ -129,14 +57,9 @@ CLEAN_ALL="false"
 CONFIG_FILE="${BUILD_ROOT}/configs/arago-dunfell-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
-# This includes:
-#   1. Overall build process log (i.e. which machines are in which build dir)
-#   2. Build logs for individual machines
-#   3. Test logs for individual machines
-#   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/logs"
 
-# Setting this variable to "true" will enable logging stdout and stderr of the 
+# Setting this variable to "true" will enable logging stdout and stderr of the
 # bitbake command to the appropriate machine's build_log.txt.
 BUILD_LOG_VERBOSE="true"
 
@@ -153,194 +76,6 @@ SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 # of the source repos.
 BB_GENERATE_MIRROR_TARBALLS="1"
 
-# This shortcuts the entire testing and packaging portion of the code
-# and exits right after build step is done
-EXIT_AFTER_BUILD="true"
-
-# This variable points to an optional location where additional installer
-# content can be placed to be packaged inside of any image recipe that
-# inherits the tisdk-image class.  It is expected that the directory
-# structure should match the structure as you want it placed in the SDK.
-# If you are not building an SDK image with external components then this
-# is not required.
-INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"
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
-# NOTE: Since the scripts will be copied to TEST_SCRIPTS_TGT
-#       the opentest.sh script should call the scripts in the new directory.
-TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
-
-# This variable points to the directory within the target filesystem that
-# the scripts directory in TEST_SCRIPTS will be copied as.
-TEST_SCRIPTS_TGT="home/root/test-scripts"
-
-# This variable may be used to specify the exact network interface used to
-# communicate with the OpenTest Framework (e.g. eth1), instead of guessing it.
-# Useful on multi-homed machines with multiple interfaces, when guessing
-# between eth0 and eth1 is not possible. Leave empty for default behavior.
-TEST_LOCAL_IFACE="eth1"
-
-# This variable contains the tarball name for the opentest CLI which is
-# required to do target side testing.
-OPENTEST_CLI="$SCRIPTS_ROOT/linux-devtest.tgz"
-
-# Pre-configured conf/site_info.xml file for OpenTest client
-OPENTEST_CONF_SITE_INFO="$SCRIPTS_ROOT/site_info.xml"
-
-# This variable specifies the IP address of the TEE to be used with OpenTest
-# Defaults to 128.247.105.11 if not set
-OPENTEST_TEE_IP="none"
-
-# This variable specifies the hardware capabilities to be used with OpenTest
-# Capabilities are separated by underscores, some excamples are here:
-# http://arago-project.org/wiki/index.php/Opentest-CheatSheet
-# Defaults to "linux" if not set
-# Limit the board selection to official TI GT farm, avoiding personal boards
-OPENTEST_HW_CAP="linux_tigt_farm"
-
-# Determine whether SPL/UART and U-boot binaries are passed to OpenTest for
-# testing. Otherwise uses existing bootloaders on the board (SD, NAND, etc)
-OPENTEST_BOOTLOADERS="false"
-
-# Specify the number of attempts to boot the target (default is 1)
-OPENTEST_BOOT_ATTEMPTS="3"
-
-# Specify timeout in seconds for boot to finish (default is 150 sec)
-OPENTEST_BOOT_TIMEOUT="300"
-
-# This variable will allow control over whether to perform build testing or
-# skip it.  This should usually be set to true but may be changed for
-# prototyping.
-RUN_BUILD_TESTS="false"
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
-# This variable indicates whether to productize the build by packaging
-# it into an installer and web content.  This will require that
-# InstallBuilder be installed on your host system and that you have
-# and project file created to package it.  If not then you can use
-# the simple SDK tarball that was created during the build as your
-# SDK.
-PRODUCTIZE_SDK="false"
-
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
 BITBAKE_COMMAND="ti-rtos-metadata ; tisdk-core-bundle tisdk-tiny-image ti-world"
-
-# This variable controls whether the build configuration included at the bottom
-# of the results file includes comments or not. The default is "false" to filter
-# comments out.
-RESULTS_CONFIG_COMMENTS="false"
-
-################################################################################
-# The following variables only need to be set if PRODUCTIZE_SDK is true.
-# If not you do not need to set these variables.  If you do want to
-# publish an SDK you will need access to other tools such as webgen that
-# are not available outside of TI.
-################################################################################
-
-# This points to the location where the InstallBuilder application has
-# been extracted.
-INSTALL_BUILDER="/home/jenkins/installbuilder"
-
-# This variable points to the root diretory where the installer content will be
-# staged to build the installer.
-INSTALLER_ROOT="$BUILD_ROOT/installer"
-
-# This variable will point to the InstallBuilder file used to build the SDK
-# installer
-INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
-
-# This variable will provide the prefix for the installer filename and default 
-# installation directory.
-# NOTE: This prefix should match the installer filename given in the webgen.mak
-#  
-# Installer name will have the form: 
-#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
-# Installation directory will have the form:
-#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
-INSTALLER_PREFIX="ti-sdk"
-
-# This variable points to a directory where additional SD card content
-# is located.  In general this directory should have a structure like
-#   - <machine>/boot - holds extra boot partition content
-#   - <machine>/start_here - holds the extra start_here partition content
-# Many times you will want to use symlinks here to save space, so the
-# build scripts will use the -L option to copy the linked file instead of
-# the symlink.
-SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
-
-# This variable determines whether the uImage and dtb files should be placed in
-# the boot partition tarball or not.  For newer kernel and u-boot combinations
-# the uImage and dtb files are kept in the rootfs partition and placing it in
-# the boot partition will cause confusion.
-PACKAGE_BOOT_KERNEL_FILES="false"
-
-# This variable points to the directory where the webgen tool has been
-# Installed.
-WEBGEN_ROOT="/home/jenkins/webgen"
-
-# This variable points to the location where additional webgen/webpage files
-# are located.  Many times you will want to use symlinks here to save space
-# so the build scripts will use the -L option to copy the linked file instead
-# of the symlink.
-WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
-
-# This variable points to the root location where the publish SDK data is
-# stored.  This data is the webgen.mak files required to build the SDK
-# ti.com style web pages.
-# The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
-
-# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
-# to the webgen exports directory. Setting this variable to "1" will override
-# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
-EXPORT_ARAGO_SRC="0"
-
-# This variable specifies whether or not to copy the build contents to
-# a remote web hosting server.
-COPY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the deploy contents to a
-# remote web hosting server. These are unprocessed intermediate artifacts,
-# such as images, IPK feeds etc, so may not be distributed publicly as is.
-COPY_DEPLOY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the "golden" contents to a
-# remote web hosting server. These are images that passed run-time tests.
-COPY_GOLDEN_TO_WEB="false"
-
-# This variable points to the user@webhost:<basepath> location where the
-# deploy contents should be placed.  This is best done if you have done a
-# key exchange between these systems so that your SCP command will not ask
-# for a password.
-WEB_HOST=""
-
-# This variable determines whether the DEPLOY_ROOT will be cleaned after
-# the remote copy.  The reason for this is that if the files already exist
-# on the remote system there is no need to keep them on the local system.
-CLEAN_AFTER_COPY="true"
-
-# This variable determines if the results directory should be copied before
-# the deploy directory is cleaned.  If this value is set then the results
-# will be copied to the given directory.  If not then they will not be
-# copied and will be cleaned if CLEAN_AFTER_COPY is true.
-BACKUP_RESULTS=""
diff --git a/configs/farm/arago-master.txt b/configs/farm/arago-master.txt
index 0779ded..08c96c1 100644
--- a/configs/farm/arago-master.txt
+++ b/configs/farm/arago-master.txt
@@ -2,43 +2,17 @@
 #                      Core TISDK configuration file                           #
 ################################################################################
 
-# This variable contains the list of variables found in this congif file
-# that MUST be set to a value.  Failure to set these variables could
-# lead to corruption of the host system or the build script not
-# executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS NUM_AARCH64_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+# This variable contains the list of variables found in this config file
+# that MUST be set to a value
+MANDATORY_INPUTS="MACHINES BUILD_ID SCRIPTS_ROOT BUILD_ROOT DEPLOY_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
 
-# This variable holds the SDK version you are building.  This will be picked
-# up in the installer name if you choose to package an installer.  You can
-# also use this in the CONFIG_FILE name below.
+# This variable holds the SDK version you are building
 TISDK_VERSION="live"
 
-# This variable contains the list of machines to build an SDK for
+# This variable contains the machine name to build for
 MACHINES=""
 
-# These variables indicate the maximum number of parallel builds that can be
-# done for each architecture.  Some things to note are:
-#   1. You should add these values together to get the maximum number of
-#      parallel builds.  If this is too many for your system then reduce the
-#      numbers.
-#   2. The machines will be built spread over the parallel builds and load
-#      balancing is handled automatically
-#   3. If there are no machines of a particular architectur then nothing will
-#      be built for that architecture
-#   4. In the case of just a couple of machines it may be faster to do only
-#      one build building both serially rather than two parallel builds
-#      depending on your system resources
-NUM_ARM9_BUILDS="1"
-NUM_CORTEX_BUILDS="1"
-NUM_AARCH64_BUILDS="1"
-
-# These variables contain the location of the bin directory where the toolchain
-# for each architecture is installed.
-TOOLCHAIN_ROOT_ARM9=""
-TOOLCHAIN_ROOT_CORTEX=""
-TOOLCHAIN_ROOT_AARCH64=""
-
-# SECDEV variables for CAT and AUTO
+# SECDEV variables for CAT, AUTO and K3
 TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
 TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
 TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
@@ -56,58 +30,12 @@ SCRIPTS_ROOT="$PWD"
 # checked out and the tmp build diretories for each architecture will be
 # created using the oe-layertool-setup.sh script from the repo at:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
-# This will be created using the 
-#   - These directories will look like:
-#       - BUILD_ROOT/sources
-#       - BUILD_ROOT/arm9-1/arago-tmp
-#       - BUILD_ROOT/cortex-1/arago-tmp
-#       - BUILD_ROOT/cortex-2/arago-tmp
 BUILD_ROOT="$SCRIPTS_ROOT/farm-arago-master-build"
 
-# This variable points to the base location where files will be extracted for
-# testing purposes.  This should not be confused with the NFS root which
-# will be configured below.
-# This variable should always be declared AFTER the BUILD_ROOT variable.
-# The build scripts will create subdirectories such as:
-#   - TEST_ROOT/am335x-evm-test
-# You can usually just take the default value
-TEST_ROOT="$BUILD_ROOT/testing"
-
-# This variable points to the directory where files will be placed to allow
-# for final packaging.
-# This variable should always be declared AFTER the BUILD_ROOT variable
-# You can usually just take the default value
-PACKAGE_ROOT="$BUILD_ROOT/packaging"
-
 # This variable points to the base location where the SDK files will
 # be deployed.  This is essentially the final staging directory
 DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
 
-# This variable contains the "filter" string to look for inside of the
-# SDK to select which file system to test.  Currently only testing of
-# one file system is supported.
-FS_FILTER="tisdk-*rootfs-"
-
-# This variable indicates the type of FS images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-FS_IMAGE_TYPE="tar.xz"
-
-# This variable contains the "filter" string to look for inside of the
-# OE build directory to find the SDK image.  Since the image name can
-# vary based on the recipe settings this string will account for that.
-SDK_FILTER="tisdk-core-bundle-"
-
-# This variable indicates the type of SDK images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-SDK_IMAGE_TYPE="tar.xz"
-
-# This variable points to an NFS share which has been pre-configured.  The
-# target testing will be done by creating a subdirectory in this NFS_ROOT
-# for each machine to boot the target board.
-# This directory should be configured to allow writing by the jenkins user
-# at a minimum, although allowing writing by anyone is simple.
-NFS_ROOT="/home/jenkins/nfs-root"
-
 # This variable points to the location where the sources will be checked out
 # using the oe-layertool-setup.sh script from the following repository:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
@@ -120,7 +48,7 @@ CLEAN_BUILD="true"
 # This variable indicates whether we should clean shared state (sstate)
 CLEAN_SSTATE="true"
 
-# This variable means that we should clean not only build build directories,
+# This variable means that we should clean not only build directories,
 # but also the sources as well and do a fully clean build.
 CLEAN_ALL="false"
 
@@ -129,14 +57,9 @@ CLEAN_ALL="false"
 CONFIG_FILE="${BUILD_ROOT}/configs/arago-master-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
-# This includes:
-#   1. Overall build process log (i.e. which machines are in which build dir)
-#   2. Build logs for individual machines
-#   3. Test logs for individual machines
-#   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/logs"
 
-# Setting this variable to "true" will enable logging stdout and stderr of the 
+# Setting this variable to "true" will enable logging stdout and stderr of the
 # bitbake command to the appropriate machine's build_log.txt.
 BUILD_LOG_VERBOSE="true"
 
@@ -153,194 +76,6 @@ SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 # of the source repos.
 BB_GENERATE_MIRROR_TARBALLS="1"
 
-# This shortcuts the entire testing and packaging portion of the code
-# and exits right after build step is done
-EXIT_AFTER_BUILD="true"
-
-# This variable points to an optional location where additional installer
-# content can be placed to be packaged inside of any image recipe that
-# inherits the tisdk-image class.  It is expected that the directory
-# structure should match the structure as you want it placed in the SDK.
-# If you are not building an SDK image with external components then this
-# is not required.
-INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"
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
-# NOTE: Since the scripts will be copied to TEST_SCRIPTS_TGT
-#       the opentest.sh script should call the scripts in the new directory.
-TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
-
-# This variable points to the directory within the target filesystem that
-# the scripts directory in TEST_SCRIPTS will be copied as.
-TEST_SCRIPTS_TGT="home/root/test-scripts"
-
-# This variable may be used to specify the exact network interface used to
-# communicate with the OpenTest Framework (e.g. eth1), instead of guessing it.
-# Useful on multi-homed machines with multiple interfaces, when guessing
-# between eth0 and eth1 is not possible. Leave empty for default behavior.
-TEST_LOCAL_IFACE="eth1"
-
-# This variable contains the tarball name for the opentest CLI which is
-# required to do target side testing.
-OPENTEST_CLI="$SCRIPTS_ROOT/linux-devtest.tgz"
-
-# Pre-configured conf/site_info.xml file for OpenTest client
-OPENTEST_CONF_SITE_INFO="$SCRIPTS_ROOT/site_info.xml"
-
-# This variable specifies the IP address of the TEE to be used with OpenTest
-# Defaults to 128.247.105.11 if not set
-OPENTEST_TEE_IP="none"
-
-# This variable specifies the hardware capabilities to be used with OpenTest
-# Capabilities are separated by underscores, some excamples are here:
-# http://arago-project.org/wiki/index.php/Opentest-CheatSheet
-# Defaults to "linux" if not set
-# Limit the board selection to official TI GT farm, avoiding personal boards
-OPENTEST_HW_CAP="linux_tigt_farm"
-
-# Determine whether SPL/UART and U-boot binaries are passed to OpenTest for
-# testing. Otherwise uses existing bootloaders on the board (SD, NAND, etc)
-OPENTEST_BOOTLOADERS="false"
-
-# Specify the number of attempts to boot the target (default is 1)
-OPENTEST_BOOT_ATTEMPTS="3"
-
-# Specify timeout in seconds for boot to finish (default is 150 sec)
-OPENTEST_BOOT_TIMEOUT="300"
-
-# This variable will allow control over whether to perform build testing or
-# skip it.  This should usually be set to true but may be changed for
-# prototyping.
-RUN_BUILD_TESTS="false"
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
-# This variable indicates whether to productize the build by packaging
-# it into an installer and web content.  This will require that
-# InstallBuilder be installed on your host system and that you have
-# and project file created to package it.  If not then you can use
-# the simple SDK tarball that was created during the build as your
-# SDK.
-PRODUCTIZE_SDK="false"
-
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
 BITBAKE_COMMAND="-k tisdk-core-bundle tisdk-tiny-image"
-
-# This variable controls whether the build configuration included at the bottom
-# of the results file includes comments or not. The default is "false" to filter
-# comments out.
-RESULTS_CONFIG_COMMENTS="false"
-
-################################################################################
-# The following variables only need to be set if PRODUCTIZE_SDK is true.
-# If not you do not need to set these variables.  If you do want to
-# publish an SDK you will need access to other tools such as webgen that
-# are not available outside of TI.
-################################################################################
-
-# This points to the location where the InstallBuilder application has
-# been extracted.
-INSTALL_BUILDER="/home/jenkins/installbuilder"
-
-# This variable points to the root diretory where the installer content will be
-# staged to build the installer.
-INSTALLER_ROOT="$BUILD_ROOT/installer"
-
-# This variable will point to the InstallBuilder file used to build the SDK
-# installer
-INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
-
-# This variable will provide the prefix for the installer filename and default 
-# installation directory.
-# NOTE: This prefix should match the installer filename given in the webgen.mak
-#  
-# Installer name will have the form: 
-#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
-# Installation directory will have the form:
-#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
-INSTALLER_PREFIX="ti-sdk"
-
-# This variable points to a directory where additional SD card content
-# is located.  In general this directory should have a structure like
-#   - <machine>/boot - holds extra boot partition content
-#   - <machine>/start_here - holds the extra start_here partition content
-# Many times you will want to use symlinks here to save space, so the
-# build scripts will use the -L option to copy the linked file instead of
-# the symlink.
-SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
-
-# This variable determines whether the uImage and dtb files should be placed in
-# the boot partition tarball or not.  For newer kernel and u-boot combinations
-# the uImage and dtb files are kept in the rootfs partition and placing it in
-# the boot partition will cause confusion.
-PACKAGE_BOOT_KERNEL_FILES="false"
-
-# This variable points to the directory where the webgen tool has been
-# Installed.
-WEBGEN_ROOT="/home/jenkins/webgen"
-
-# This variable points to the location where additional webgen/webpage files
-# are located.  Many times you will want to use symlinks here to save space
-# so the build scripts will use the -L option to copy the linked file instead
-# of the symlink.
-WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
-
-# This variable points to the root location where the publish SDK data is
-# stored.  This data is the webgen.mak files required to build the SDK
-# ti.com style web pages.
-# The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
-
-# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
-# to the webgen exports directory. Setting this variable to "1" will override
-# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
-EXPORT_ARAGO_SRC="0"
-
-# This variable specifies whether or not to copy the build contents to
-# a remote web hosting server.
-COPY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the deploy contents to a
-# remote web hosting server. These are unprocessed intermediate artifacts,
-# such as images, IPK feeds etc, so may not be distributed publicly as is.
-COPY_DEPLOY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the "golden" contents to a
-# remote web hosting server. These are images that passed run-time tests.
-COPY_GOLDEN_TO_WEB="false"
-
-# This variable points to the user@webhost:<basepath> location where the
-# deploy contents should be placed.  This is best done if you have done a
-# key exchange between these systems so that your SCP command will not ask
-# for a password.
-WEB_HOST=""
-
-# This variable determines whether the DEPLOY_ROOT will be cleaned after
-# the remote copy.  The reason for this is that if the files already exist
-# on the remote system there is no need to keep them on the local system.
-CLEAN_AFTER_COPY="true"
-
-# This variable determines if the results directory should be copied before
-# the deploy directory is cleaned.  If this value is set then the results
-# will be copied to the given directory.  If not then they will not be
-# copied and will be cleaned if CLEAN_AFTER_COPY is true.
-BACKUP_RESULTS=""
diff --git a/configs/farm/distroless-dunfell.txt b/configs/farm/distroless-dunfell.txt
index 16e0b69..4acbf7f 100644
--- a/configs/farm/distroless-dunfell.txt
+++ b/configs/farm/distroless-dunfell.txt
@@ -2,43 +2,17 @@
 #                      Core TISDK configuration file                           #
 ################################################################################
 
-# This variable contains the list of variables found in this congif file
-# that MUST be set to a value.  Failure to set these variables could
-# lead to corruption of the host system or the build script not
-# executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
-
-# This variable holds the SDK version you are building.  This will be picked
-# up in the installer name if you choose to package an installer.  You can
-# also use this in the CONFIG_FILE name below.
+# This variable contains the list of variables found in this config file
+# that MUST be set to a value
+MANDATORY_INPUTS="MACHINES BUILD_ID SCRIPTS_ROOT BUILD_ROOT DEPLOY_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+
+# This variable holds the SDK version you are building
 TISDK_VERSION="live"
 
-# This variable contains the list of machines to build an SDK for
+# This variable contains the machine name to build for
 MACHINES=""
 
-# These variables indicate the maximum number of parallel builds that can be
-# done for each architecture.  Some things to note are:
-#   1. You should add these values together to get the maximum number of
-#      parallel builds.  If this is too many for your system then reduce the
-#      numbers.
-#   2. The machines will be built spread over the parallel builds and load
-#      balancing is handled automatically
-#   3. If there are no machines of a particular architectur then nothing will
-#      be built for that architecture
-#   4. In the case of just a couple of machines it may be faster to do only
-#      one build building both serially rather than two parallel builds
-#      depending on your system resources
-NUM_ARM9_BUILDS="1"
-NUM_CORTEX_BUILDS="1"
-NUM_AARCH64_BUILDS="1"
-
-# These variables contain the location of the bin directory where the toolchain
-# for each architecture is installed.
-TOOLCHAIN_ROOT_ARM9=""
-TOOLCHAIN_ROOT_CORTEX=""
-TOOLCHAIN_ROOT_AARCH64=""
-
-# SECDEV variables for CAT and AUTO
+# SECDEV variables for CAT, AUTO and K3
 TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
 TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
 TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
@@ -56,58 +30,12 @@ SCRIPTS_ROOT="$PWD"
 # checked out and the tmp build diretories for each architecture will be
 # created using the oe-layertool-setup.sh script from the repo at:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
-# This will be created using the 
-#   - These directories will look like:
-#       - BUILD_ROOT/sources
-#       - BUILD_ROOT/arm9-1/arago-tmp
-#       - BUILD_ROOT/cortex-1/arago-tmp
-#       - BUILD_ROOT/cortex-2/arago-tmp
 BUILD_ROOT="$SCRIPTS_ROOT/farm-distroless-dunfell-build"
 
-# This variable points to the base location where files will be extracted for
-# testing purposes.  This should not be confused with the NFS root which
-# will be configured below.
-# This variable should always be declared AFTER the BUILD_ROOT variable.
-# The build scripts will create subdirectories such as:
-#   - TEST_ROOT/am335x-evm-test
-# You can usually just take the default value
-TEST_ROOT="$BUILD_ROOT/testing"
-
-# This variable points to the directory where files will be placed to allow
-# for final packaging.
-# This variable should always be declared AFTER the BUILD_ROOT variable
-# You can usually just take the default value
-PACKAGE_ROOT="$BUILD_ROOT/packaging"
-
 # This variable points to the base location where the SDK files will
 # be deployed.  This is essentially the final staging directory
 DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
 
-# This variable contains the "filter" string to look for inside of the
-# SDK to select which file system to test.  Currently only testing of
-# one file system is supported.
-FS_FILTER="core-*image-"
-
-# This variable indicates the type of FS images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-FS_IMAGE_TYPE="tar.xz"
-
-# This variable contains the "filter" string to look for inside of the
-# OE build directory to find the SDK image.  Since the image name can
-# vary based on the recipe settings this string will account for that.
-SDK_FILTER=""
-
-# This variable indicates the type of SDK images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-SDK_IMAGE_TYPE="tar.xz"
-
-# This variable points to an NFS share which has been pre-configured.  The
-# target testing will be done by creating a subdirectory in this NFS_ROOT
-# for each machine to boot the target board.
-# This directory should be configured to allow writing by the jenkins user
-# at a minimum, although allowing writing by anyone is simple.
-NFS_ROOT="/home/jenkins/nfs-root"
-
 # This variable points to the location where the sources will be checked out
 # using the oe-layertool-setup.sh script from the following repository:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
@@ -120,7 +48,7 @@ CLEAN_BUILD="true"
 # This variable indicates whether we should clean shared state (sstate)
 CLEAN_SSTATE="true"
 
-# This variable means that we should clean not only build build directories,
+# This variable means that we should clean not only build directories,
 # but also the sources as well and do a fully clean build.
 CLEAN_ALL="false"
 
@@ -129,14 +57,9 @@ CLEAN_ALL="false"
 CONFIG_FILE="${BUILD_ROOT}/configs/distroless-dunfell-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
-# This includes:
-#   1. Overall build process log (i.e. which machines are in which build dir)
-#   2. Build logs for individual machines
-#   3. Test logs for individual machines
-#   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/logs"
 
-# Setting this variable to "true" will enable logging stdout and stderr of the 
+# Setting this variable to "true" will enable logging stdout and stderr of the
 # bitbake command to the appropriate machine's build_log.txt.
 BUILD_LOG_VERBOSE="true"
 
@@ -153,47 +76,6 @@ SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 # of the source repos.
 BB_GENERATE_MIRROR_TARBALLS="1"
 
-# This shortcuts the entire testing and packaging portion of the code
-# and exits right after build step is done
-EXIT_AFTER_BUILD="true"
-
-# This variable indicates whether to productize the build by packaging
-# it into an installer and web content.  This will require that
-# InstallBuilder be installed on your host system and that you have
-# and project file created to package it.  If not then you can use
-# the simple SDK tarball that was created during the build as your
-# SDK.
-PRODUCTIZE_SDK="false"
-
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
 BITBAKE_COMMAND="core-image-base"
-
-# This variable controls whether the build configuration included at the bottom
-# of the results file includes comments or not. The default is "false" to filter
-# comments out.
-RESULTS_CONFIG_COMMENTS="false"
-
-# This variable specifies whether or not to copy the build contents to
-# a remote web hosting server.
-COPY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the deploy contents to a
-# remote web hosting server. These are unprocessed intermediate artifacts,
-# such as images, IPK feeds etc, so may not be distributed publicly as is.
-COPY_DEPLOY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the "golden" contents to a
-# remote web hosting server. These are images that passed run-time tests.
-COPY_GOLDEN_TO_WEB="false"
-
-# This variable determines whether the DEPLOY_ROOT will be cleaned after
-# the remote copy.  The reason for this is that if the files already exist
-# on the remote system there is no need to keep them on the local system.
-CLEAN_AFTER_COPY="true"
-
-# This variable determines if the results directory should be copied before
-# the deploy directory is cleaned.  If this value is set then the results
-# will be copied to the given directory.  If not then they will not be
-# copied and will be cleaned if CLEAN_AFTER_COPY is true.
-BACKUP_RESULTS=""
diff --git a/configs/farm/distroless-master.txt b/configs/farm/distroless-master.txt
index 9684f03..850cb9c 100644
--- a/configs/farm/distroless-master.txt
+++ b/configs/farm/distroless-master.txt
@@ -2,43 +2,17 @@
 #                      Core TISDK configuration file                           #
 ################################################################################
 
-# This variable contains the list of variables found in this congif file
-# that MUST be set to a value.  Failure to set these variables could
-# lead to corruption of the host system or the build script not
-# executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
-
-# This variable holds the SDK version you are building.  This will be picked
-# up in the installer name if you choose to package an installer.  You can
-# also use this in the CONFIG_FILE name below.
+# This variable contains the list of variables found in this config file
+# that MUST be set to a value
+MANDATORY_INPUTS="MACHINES BUILD_ID SCRIPTS_ROOT BUILD_ROOT DEPLOY_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+
+# This variable holds the SDK version you are building
 TISDK_VERSION="live"
 
-# This variable contains the list of machines to build an SDK for
+# This variable contains the machine name to build for
 MACHINES=""
 
-# These variables indicate the maximum number of parallel builds that can be
-# done for each architecture.  Some things to note are:
-#   1. You should add these values together to get the maximum number of
-#      parallel builds.  If this is too many for your system then reduce the
-#      numbers.
-#   2. The machines will be built spread over the parallel builds and load
-#      balancing is handled automatically
-#   3. If there are no machines of a particular architectur then nothing will
-#      be built for that architecture
-#   4. In the case of just a couple of machines it may be faster to do only
-#      one build building both serially rather than two parallel builds
-#      depending on your system resources
-NUM_ARM9_BUILDS="1"
-NUM_CORTEX_BUILDS="1"
-NUM_AARCH64_BUILDS="1"
-
-# These variables contain the location of the bin directory where the toolchain
-# for each architecture is installed.
-TOOLCHAIN_ROOT_ARM9=""
-TOOLCHAIN_ROOT_CORTEX=""
-TOOLCHAIN_ROOT_AARCH64=""
-
-# SECDEV variables for CAT and AUTO
+# SECDEV variables for CAT, AUTO and K3
 TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
 TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
 TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
@@ -56,58 +30,12 @@ SCRIPTS_ROOT="$PWD"
 # checked out and the tmp build diretories for each architecture will be
 # created using the oe-layertool-setup.sh script from the repo at:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
-# This will be created using the 
-#   - These directories will look like:
-#       - BUILD_ROOT/sources
-#       - BUILD_ROOT/arm9-1/arago-tmp
-#       - BUILD_ROOT/cortex-1/arago-tmp
-#       - BUILD_ROOT/cortex-2/arago-tmp
 BUILD_ROOT="$SCRIPTS_ROOT/farm-distroless-master-build"
 
-# This variable points to the base location where files will be extracted for
-# testing purposes.  This should not be confused with the NFS root which
-# will be configured below.
-# This variable should always be declared AFTER the BUILD_ROOT variable.
-# The build scripts will create subdirectories such as:
-#   - TEST_ROOT/am335x-evm-test
-# You can usually just take the default value
-TEST_ROOT="$BUILD_ROOT/testing"
-
-# This variable points to the directory where files will be placed to allow
-# for final packaging.
-# This variable should always be declared AFTER the BUILD_ROOT variable
-# You can usually just take the default value
-PACKAGE_ROOT="$BUILD_ROOT/packaging"
-
 # This variable points to the base location where the SDK files will
 # be deployed.  This is essentially the final staging directory
 DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
 
-# This variable contains the "filter" string to look for inside of the
-# SDK to select which file system to test.  Currently only testing of
-# one file system is supported.
-FS_FILTER="core-*image-"
-
-# This variable indicates the type of FS images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-FS_IMAGE_TYPE="tar.xz"
-
-# This variable contains the "filter" string to look for inside of the
-# OE build directory to find the SDK image.  Since the image name can
-# vary based on the recipe settings this string will account for that.
-SDK_FILTER=""
-
-# This variable indicates the type of SDK images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-SDK_IMAGE_TYPE="tar.xz"
-
-# This variable points to an NFS share which has been pre-configured.  The
-# target testing will be done by creating a subdirectory in this NFS_ROOT
-# for each machine to boot the target board.
-# This directory should be configured to allow writing by the jenkins user
-# at a minimum, although allowing writing by anyone is simple.
-NFS_ROOT="/home/jenkins/nfs-root"
-
 # This variable points to the location where the sources will be checked out
 # using the oe-layertool-setup.sh script from the following repository:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
@@ -120,7 +48,7 @@ CLEAN_BUILD="true"
 # This variable indicates whether we should clean shared state (sstate)
 CLEAN_SSTATE="true"
 
-# This variable means that we should clean not only build build directories,
+# This variable means that we should clean not only build directories,
 # but also the sources as well and do a fully clean build.
 CLEAN_ALL="false"
 
@@ -129,14 +57,9 @@ CLEAN_ALL="false"
 CONFIG_FILE="${BUILD_ROOT}/configs/distroless-master-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
-# This includes:
-#   1. Overall build process log (i.e. which machines are in which build dir)
-#   2. Build logs for individual machines
-#   3. Test logs for individual machines
-#   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/logs"
 
-# Setting this variable to "true" will enable logging stdout and stderr of the 
+# Setting this variable to "true" will enable logging stdout and stderr of the
 # bitbake command to the appropriate machine's build_log.txt.
 BUILD_LOG_VERBOSE="true"
 
@@ -153,47 +76,6 @@ SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 # of the source repos.
 BB_GENERATE_MIRROR_TARBALLS="1"
 
-# This shortcuts the entire testing and packaging portion of the code
-# and exits right after build step is done
-EXIT_AFTER_BUILD="true"
-
-# This variable indicates whether to productize the build by packaging
-# it into an installer and web content.  This will require that
-# InstallBuilder be installed on your host system and that you have
-# and project file created to package it.  If not then you can use
-# the simple SDK tarball that was created during the build as your
-# SDK.
-PRODUCTIZE_SDK="false"
-
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
 BITBAKE_COMMAND="core-image-base"
-
-# This variable controls whether the build configuration included at the bottom
-# of the results file includes comments or not. The default is "false" to filter
-# comments out.
-RESULTS_CONFIG_COMMENTS="false"
-
-# This variable specifies whether or not to copy the build contents to
-# a remote web hosting server.
-COPY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the deploy contents to a
-# remote web hosting server. These are unprocessed intermediate artifacts,
-# such as images, IPK feeds etc, so may not be distributed publicly as is.
-COPY_DEPLOY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the "golden" contents to a
-# remote web hosting server. These are images that passed run-time tests.
-COPY_GOLDEN_TO_WEB="false"
-
-# This variable determines whether the DEPLOY_ROOT will be cleaned after
-# the remote copy.  The reason for this is that if the files already exist
-# on the remote system there is no need to keep them on the local system.
-CLEAN_AFTER_COPY="true"
-
-# This variable determines if the results directory should be copied before
-# the deploy directory is cleaned.  If this value is set then the results
-# will be copied to the given directory.  If not then they will not be
-# copied and will be cleaned if CLEAN_AFTER_COPY is true.
-BACKUP_RESULTS=""
diff --git a/configs/farm/poky-dunfell.txt b/configs/farm/poky-dunfell.txt
index 7a45515..e22ea50 100644
--- a/configs/farm/poky-dunfell.txt
+++ b/configs/farm/poky-dunfell.txt
@@ -2,43 +2,17 @@
 #                      Core TISDK configuration file                           #
 ################################################################################
 
-# This variable contains the list of variables found in this congif file
-# that MUST be set to a value.  Failure to set these variables could
-# lead to corruption of the host system or the build script not
-# executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
-
-# This variable holds the SDK version you are building.  This will be picked
-# up in the installer name if you choose to package an installer.  You can
-# also use this in the CONFIG_FILE name below.
+# This variable contains the list of variables found in this config file
+# that MUST be set to a value
+MANDATORY_INPUTS="MACHINES BUILD_ID SCRIPTS_ROOT BUILD_ROOT DEPLOY_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+
+# This variable holds the SDK version you are building
 TISDK_VERSION="live"
 
-# This variable contains the list of machines to build an SDK for
+# This variable contains the machine name to build for
 MACHINES=""
 
-# These variables indicate the maximum number of parallel builds that can be
-# done for each architecture.  Some things to note are:
-#   1. You should add these values together to get the maximum number of
-#      parallel builds.  If this is too many for your system then reduce the
-#      numbers.
-#   2. The machines will be built spread over the parallel builds and load
-#      balancing is handled automatically
-#   3. If there are no machines of a particular architectur then nothing will
-#      be built for that architecture
-#   4. In the case of just a couple of machines it may be faster to do only
-#      one build building both serially rather than two parallel builds
-#      depending on your system resources
-NUM_ARM9_BUILDS="1"
-NUM_CORTEX_BUILDS="1"
-NUM_AARCH64_BUILDS="1"
-
-# These variables contain the location of the bin directory where the toolchain
-# for each architecture is installed.
-TOOLCHAIN_ROOT_ARM9=""
-TOOLCHAIN_ROOT_CORTEX=""
-TOOLCHAIN_ROOT_AARCH64=""
-
-# SECDEV variables for CAT and AUTO
+# SECDEV variables for CAT, AUTO and K3
 TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
 TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
 TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
@@ -56,58 +30,12 @@ SCRIPTS_ROOT="$PWD"
 # checked out and the tmp build diretories for each architecture will be
 # created using the oe-layertool-setup.sh script from the repo at:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
-# This will be created using the 
-#   - These directories will look like:
-#       - BUILD_ROOT/sources
-#       - BUILD_ROOT/arm9-1/arago-tmp
-#       - BUILD_ROOT/cortex-1/arago-tmp
-#       - BUILD_ROOT/cortex-2/arago-tmp
 BUILD_ROOT="$SCRIPTS_ROOT/farm-poky-dunfell-build"
 
-# This variable points to the base location where files will be extracted for
-# testing purposes.  This should not be confused with the NFS root which
-# will be configured below.
-# This variable should always be declared AFTER the BUILD_ROOT variable.
-# The build scripts will create subdirectories such as:
-#   - TEST_ROOT/am335x-evm-test
-# You can usually just take the default value
-TEST_ROOT="$BUILD_ROOT/testing"
-
-# This variable points to the directory where files will be placed to allow
-# for final packaging.
-# This variable should always be declared AFTER the BUILD_ROOT variable
-# You can usually just take the default value
-PACKAGE_ROOT="$BUILD_ROOT/packaging"
-
 # This variable points to the base location where the SDK files will
 # be deployed.  This is essentially the final staging directory
 DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
 
-# This variable contains the "filter" string to look for inside of the
-# SDK to select which file system to test.  Currently only testing of
-# one file system is supported.
-FS_FILTER="core-*image-"
-
-# This variable indicates the type of FS images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-FS_IMAGE_TYPE="tar.xz"
-
-# This variable contains the "filter" string to look for inside of the
-# OE build directory to find the SDK image.  Since the image name can
-# vary based on the recipe settings this string will account for that.
-SDK_FILTER=""
-
-# This variable indicates the type of SDK images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-SDK_IMAGE_TYPE="tar.xz"
-
-# This variable points to an NFS share which has been pre-configured.  The
-# target testing will be done by creating a subdirectory in this NFS_ROOT
-# for each machine to boot the target board.
-# This directory should be configured to allow writing by the jenkins user
-# at a minimum, although allowing writing by anyone is simple.
-NFS_ROOT="/home/jenkins/nfs-root"
-
 # This variable points to the location where the sources will be checked out
 # using the oe-layertool-setup.sh script from the following repository:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
@@ -120,7 +48,7 @@ CLEAN_BUILD="true"
 # This variable indicates whether we should clean shared state (sstate)
 CLEAN_SSTATE="true"
 
-# This variable means that we should clean not only build build directories,
+# This variable means that we should clean not only build directories,
 # but also the sources as well and do a fully clean build.
 CLEAN_ALL="false"
 
@@ -129,14 +57,9 @@ CLEAN_ALL="false"
 CONFIG_FILE="${BUILD_ROOT}/configs/poky-dunfell-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
-# This includes:
-#   1. Overall build process log (i.e. which machines are in which build dir)
-#   2. Build logs for individual machines
-#   3. Test logs for individual machines
-#   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/logs"
 
-# Setting this variable to "true" will enable logging stdout and stderr of the 
+# Setting this variable to "true" will enable logging stdout and stderr of the
 # bitbake command to the appropriate machine's build_log.txt.
 BUILD_LOG_VERBOSE="true"
 
@@ -153,47 +76,6 @@ SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 # of the source repos.
 BB_GENERATE_MIRROR_TARBALLS="1"
 
-# This shortcuts the entire testing and packaging portion of the code
-# and exits right after build step is done
-EXIT_AFTER_BUILD="true"
-
-# This variable indicates whether to productize the build by packaging
-# it into an installer and web content.  This will require that
-# InstallBuilder be installed on your host system and that you have
-# and project file created to package it.  If not then you can use
-# the simple SDK tarball that was created during the build as your
-# SDK.
-PRODUCTIZE_SDK="false"
-
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
 BITBAKE_COMMAND="core-image-base"
-
-# This variable controls whether the build configuration included at the bottom
-# of the results file includes comments or not. The default is "false" to filter
-# comments out.
-RESULTS_CONFIG_COMMENTS="false"
-
-# This variable specifies whether or not to copy the build contents to
-# a remote web hosting server.
-COPY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the deploy contents to a
-# remote web hosting server. These are unprocessed intermediate artifacts,
-# such as images, IPK feeds etc, so may not be distributed publicly as is.
-COPY_DEPLOY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the "golden" contents to a
-# remote web hosting server. These are images that passed run-time tests.
-COPY_GOLDEN_TO_WEB="false"
-
-# This variable determines whether the DEPLOY_ROOT will be cleaned after
-# the remote copy.  The reason for this is that if the files already exist
-# on the remote system there is no need to keep them on the local system.
-CLEAN_AFTER_COPY="true"
-
-# This variable determines if the results directory should be copied before
-# the deploy directory is cleaned.  If this value is set then the results
-# will be copied to the given directory.  If not then they will not be
-# copied and will be cleaned if CLEAN_AFTER_COPY is true.
-BACKUP_RESULTS=""
diff --git a/configs/farm/poky-master.txt b/configs/farm/poky-master.txt
index 95d78d1..5c46cd2 100644
--- a/configs/farm/poky-master.txt
+++ b/configs/farm/poky-master.txt
@@ -2,43 +2,17 @@
 #                      Core TISDK configuration file                           #
 ################################################################################
 
-# This variable contains the list of variables found in this congif file
-# that MUST be set to a value.  Failure to set these variables could
-# lead to corruption of the host system or the build script not
-# executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
-
-# This variable holds the SDK version you are building.  This will be picked
-# up in the installer name if you choose to package an installer.  You can
-# also use this in the CONFIG_FILE name below.
+# This variable contains the list of variables found in this config file
+# that MUST be set to a value
+MANDATORY_INPUTS="MACHINES BUILD_ID SCRIPTS_ROOT BUILD_ROOT DEPLOY_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+
+# This variable holds the SDK version you are building
 TISDK_VERSION="live"
 
-# This variable contains the list of machines to build an SDK for
+# This variable contains the machine name to build for
 MACHINES=""
 
-# These variables indicate the maximum number of parallel builds that can be
-# done for each architecture.  Some things to note are:
-#   1. You should add these values together to get the maximum number of
-#      parallel builds.  If this is too many for your system then reduce the
-#      numbers.
-#   2. The machines will be built spread over the parallel builds and load
-#      balancing is handled automatically
-#   3. If there are no machines of a particular architectur then nothing will
-#      be built for that architecture
-#   4. In the case of just a couple of machines it may be faster to do only
-#      one build building both serially rather than two parallel builds
-#      depending on your system resources
-NUM_ARM9_BUILDS="1"
-NUM_CORTEX_BUILDS="1"
-NUM_AARCH64_BUILDS="1"
-
-# These variables contain the location of the bin directory where the toolchain
-# for each architecture is installed.
-TOOLCHAIN_ROOT_ARM9=""
-TOOLCHAIN_ROOT_CORTEX=""
-TOOLCHAIN_ROOT_AARCH64=""
-
-# SECDEV variables for CAT and AUTO
+# SECDEV variables for CAT, AUTO and K3
 TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
 TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
 TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
@@ -56,58 +30,12 @@ SCRIPTS_ROOT="$PWD"
 # checked out and the tmp build diretories for each architecture will be
 # created using the oe-layertool-setup.sh script from the repo at:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
-# This will be created using the 
-#   - These directories will look like:
-#       - BUILD_ROOT/sources
-#       - BUILD_ROOT/arm9-1/arago-tmp
-#       - BUILD_ROOT/cortex-1/arago-tmp
-#       - BUILD_ROOT/cortex-2/arago-tmp
 BUILD_ROOT="$SCRIPTS_ROOT/farm-poky-master-build"
 
-# This variable points to the base location where files will be extracted for
-# testing purposes.  This should not be confused with the NFS root which
-# will be configured below.
-# This variable should always be declared AFTER the BUILD_ROOT variable.
-# The build scripts will create subdirectories such as:
-#   - TEST_ROOT/am335x-evm-test
-# You can usually just take the default value
-TEST_ROOT="$BUILD_ROOT/testing"
-
-# This variable points to the directory where files will be placed to allow
-# for final packaging.
-# This variable should always be declared AFTER the BUILD_ROOT variable
-# You can usually just take the default value
-PACKAGE_ROOT="$BUILD_ROOT/packaging"
-
 # This variable points to the base location where the SDK files will
 # be deployed.  This is essentially the final staging directory
 DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
 
-# This variable contains the "filter" string to look for inside of the
-# SDK to select which file system to test.  Currently only testing of
-# one file system is supported.
-FS_FILTER="core-*image-"
-
-# This variable indicates the type of FS images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-FS_IMAGE_TYPE="tar.xz"
-
-# This variable contains the "filter" string to look for inside of the
-# OE build directory to find the SDK image.  Since the image name can
-# vary based on the recipe settings this string will account for that.
-SDK_FILTER=""
-
-# This variable indicates the type of SDK images being generated.  By default
-# this is tar.gz images.  This should match what you set in your recipes
-SDK_IMAGE_TYPE="tar.xz"
-
-# This variable points to an NFS share which has been pre-configured.  The
-# target testing will be done by creating a subdirectory in this NFS_ROOT
-# for each machine to boot the target board.
-# This directory should be configured to allow writing by the jenkins user
-# at a minimum, although allowing writing by anyone is simple.
-NFS_ROOT="/home/jenkins/nfs-root"
-
 # This variable points to the location where the sources will be checked out
 # using the oe-layertool-setup.sh script from the following repository:
 #   git clone git://arago-project.org/git/projects/oe-layersetup.git
@@ -120,7 +48,7 @@ CLEAN_BUILD="true"
 # This variable indicates whether we should clean shared state (sstate)
 CLEAN_SSTATE="true"
 
-# This variable means that we should clean not only build build directories,
+# This variable means that we should clean not only build directories,
 # but also the sources as well and do a fully clean build.
 CLEAN_ALL="false"
 
@@ -129,14 +57,9 @@ CLEAN_ALL="false"
 CONFIG_FILE="${BUILD_ROOT}/configs/poky-master-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
-# This includes:
-#   1. Overall build process log (i.e. which machines are in which build dir)
-#   2. Build logs for individual machines
-#   3. Test logs for individual machines
-#   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/logs"
 
-# Setting this variable to "true" will enable logging stdout and stderr of the 
+# Setting this variable to "true" will enable logging stdout and stderr of the
 # bitbake command to the appropriate machine's build_log.txt.
 BUILD_LOG_VERBOSE="true"
 
@@ -153,47 +76,6 @@ SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 # of the source repos.
 BB_GENERATE_MIRROR_TARBALLS="1"
 
-# This shortcuts the entire testing and packaging portion of the code
-# and exits right after build step is done
-EXIT_AFTER_BUILD="true"
-
-# This variable indicates whether to productize the build by packaging
-# it into an installer and web content.  This will require that
-# InstallBuilder be installed on your host system and that you have
-# and project file created to package it.  If not then you can use
-# the simple SDK tarball that was created during the build as your
-# SDK.
-PRODUCTIZE_SDK="false"
-
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
 BITBAKE_COMMAND="core-image-base"
-
-# This variable controls whether the build configuration included at the bottom
-# of the results file includes comments or not. The default is "false" to filter
-# comments out.
-RESULTS_CONFIG_COMMENTS="false"
-
-# This variable specifies whether or not to copy the build contents to
-# a remote web hosting server.
-COPY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the deploy contents to a
-# remote web hosting server. These are unprocessed intermediate artifacts,
-# such as images, IPK feeds etc, so may not be distributed publicly as is.
-COPY_DEPLOY_TO_WEB="false"
-
-# This variable specifies whether or not to copy the "golden" contents to a
-# remote web hosting server. These are images that passed run-time tests.
-COPY_GOLDEN_TO_WEB="false"
-
-# This variable determines whether the DEPLOY_ROOT will be cleaned after
-# the remote copy.  The reason for this is that if the files already exist
-# on the remote system there is no need to keep them on the local system.
-CLEAN_AFTER_COPY="true"
-
-# This variable determines if the results directory should be copied before
-# the deploy directory is cleaned.  If this value is set then the results
-# will be copied to the given directory.  If not then they will not be
-# copied and will be cleaned if CLEAN_AFTER_COPY is true.
-BACKUP_RESULTS=""
-- 
2.7.4

