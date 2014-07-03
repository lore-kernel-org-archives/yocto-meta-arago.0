Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 26CF652A42
	for <meta-arago@arago-project.org>;
	Thu,  3 Jul 2014 19:41:59 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8500FGJIPAPSO0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 03 Jul 2014 14:41:45 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8039120182; Thu,
	03 Jul 2014 15:41:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 03 Jul 2014 15:41:30 -0400
Message-id: <1404416491-28788-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [tisdk-build-scripts][PATCH 1/2] configs: add Daisy config for Puget machine
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jul 2014 19:41:59 -0000

From: Denys Dmytriyenko <denys@ti.com>

Move some wrongfully relocated files.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-core-tisdk-daisy-puget.txt           | 288 +++++++++++++++++++++
 ...-puget.txt => arago-core-tisdk-danny-puget.txt} |   0
 .../{coresdk => }/arago-core-tisdk-dora-puget.txt  |   0
 .../{coresdk => }/arago-core-tisdk-dylan-puget.txt |   0
 .../arago-core-amsdk-2013.04.01.txt                |   0
 5 files changed, 288 insertions(+)
 create mode 100644 configs/arago-core-tisdk-daisy-puget.txt
 rename configs/{coresdk/arago-core-tisdk-puget.txt => arago-core-tisdk-danny-puget.txt} (100%)
 rename configs/{coresdk => }/arago-core-tisdk-dora-puget.txt (100%)
 rename configs/{coresdk => }/arago-core-tisdk-dylan-puget.txt (100%)
 rename configs/{amsdk => coresdk}/arago-core-amsdk-2013.04.01.txt (100%)

diff --git a/configs/arago-core-tisdk-daisy-puget.txt b/configs/arago-core-tisdk-daisy-puget.txt
new file mode 100644
index 0000000..c132baf
--- /dev/null
+++ b/configs/arago-core-tisdk-daisy-puget.txt
@@ -0,0 +1,288 @@
+################################################################################
+#                      Core TISDK configuration file                           #
+################################################################################
+
+# This variable contains the list of variables found in this congif file
+# that MUST be set to a value.  Failure to set these variables could
+# lead to corruption of the host system or the build script not
+# executing properly
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+
+# This variable holds the SDK version you are building.  This will be picked
+# up in the installer name if you choose to package an installer.  You can
+# also use this in the CONFIG_FILE name below.
+TISDK_VERSION="2014.07"
+
+# This variable contains the list of machines to build an SDK for
+MACHINES="am335x-evm am437x-evm am37x-evm am3517-evm omap5-evm dra7xx-evm beagleboard am180x-evm k2hk-evm"
+
+# These variables indicate the maximum number of parallel builds that can be
+# done for each architecture.  Some things to note are:
+#   1. You should add these values together to get the maximum number of
+#      parallel builds.  If this is too many for your system then reduce the
+#      numbers.
+#   2. The machines will be built spread over the parallel builds and load
+#      balancing is handled automatically
+#   3. If there are no machines of a particular architectur then nothing will
+#      be built for that architecture
+#   4. In the case of just a couple of machines it may be faster to do only
+#      one build building both serially rather than two parallel builds
+#      depending on your system resources
+NUM_ARM9_BUILDS="1"
+NUM_CORTEX_BUILDS="1"
+
+# These variables contain the location of the bin directory where the toolchain
+# for each architecture is installed.
+TOOLCHAIN_ROOT_ARM9="/opt/arago-2011.09/armv5te/bin/"
+TOOLCHAIN_ROOT_CORTEX="/opt/linaro-2013.03/bin/"
+
+# This variable holds the unique ID for the build that will be used to
+# identify the build.
+BUILD_ID="`date +build-%F_%H-%M-%S`"
+
+# This variable contains the script directory where these scripts are running
+# from.  This is to allow finding other files used during the build later.
+# You should likely not change this
+SCRIPTS_ROOT="$PWD"
+
+# This variable points to be base of your build where the sources will be
+# checked out and the tmp build diretories for each architecture will be
+# created using the oe-layertool-setup.sh script from the repo at:
+#   git clone git://arago-project.org/git/projects/oe-layersetup.git
+# This will be created using the 
+#   - These directories will look like:
+#       - BUILD_ROOT/sources
+#       - BUILD_ROOT/arm9-1/arago-tmp
+#       - BUILD_ROOT/cortex-1/arago-tmp
+#       - BUILD_ROOT/cortex-2/arago-tmp
+BUILD_ROOT="/home/jenkins/tisdk-build"
+
+# This variable points to the base location where files will be extracted for
+# testing purposes.  This should not be confused with the NFS root which
+# will be configured below.
+# This variable should always be declared AFTER the BUILD_ROOT variable.
+# The build scripts will create subdirectories such as:
+#   - TEST_ROOT/am335x-evm-test
+# You can usually just take the default value
+TEST_ROOT="$BUILD_ROOT/testing"
+
+# This variable points to the directory where files will be placed to allow
+# for final packaging.
+# This variable should always be declared AFTER the BUILD_ROOT variable
+# You can usually just take the default value
+PACKAGE_ROOT="$BUILD_ROOT/packaging"
+
+# This variable points to the base location where the SDK files will
+# be deployed.  This is essentially the final staging directory
+DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
+
+# This variable contains the "filter" string to look for inside of the
+# SDK to select which file system to test.  Currently only testing of
+# one file system is supported.
+FS_FILTER="tisdk-rootfs-"
+
+# This variable indicates the type of FS images being generated.  By default
+# this is tar.gz images.  This should match what you set in your recipes
+FS_IMAGE_TYPE="tar.gz"
+
+# This variable contains the "filter" string to look for inside of the
+# OE build directory to find the SDK image.  Since the image name can
+# vary based on the recipe settings this string will account for that.
+SDK_FILTER="arago-core-tisdk-image-"
+
+# This variable indicates the type of SDK images being generated.  By default
+# this is tar.gz images.  This should match what you set in your recipes
+SDK_IMAGE_TYPE="tar.gz"
+
+# This variable points to an NFS share which has been pre-configured.  The
+# target testing will be done by creating a subdirectory in this NFS_ROOT
+# for each machine to boot the target board.
+# This directory should be configured to allow writing by the jenkins user
+# at a minimum, although allowing writing by anyone is simple.
+NFS_ROOT="/home/jenkins/nfs-root"
+
+# This variable points to the location where the sources will be checked out
+# using the oe-layertool-setup.sh script from the following repository:
+#   git clone git://arago-project.org/git/projects/oe-layersetup.git
+SOURCE_DIR="${BUILD_ROOT}/sources"
+
+# This variable indicates whether we should do a clean build which means
+# Removing the build directories
+CLEAN_BUILD="false"
+
+# This variable means that we should clean not only build build directories,
+# but also the sources as well and do a fully clean build.
+CLEAN_ALL="false"
+
+# This is the configuration file to use in the oe-layertool-setup.sh script
+# to configure the build.
+CONFIG_FILE="${BUILD_ROOT}/configs/arago-daisy-config.txt"
+
+# This directory will contain the log files for the various parts of the build.
+# This includes:
+#   1. Overall build process log (i.e. which machines are in which build dir)
+#   2. Build logs for individual machines
+#   3. Test logs for individual machines
+#   4. Packaging logs for individual machines
+LOG_DIR="${BUILD_ROOT}/log-files"
+
+# This is the directory where you want to configure your build to download
+# files to.  This is best done as a shared directory among the builds to
+# save download time and space.
+DL_DIR="/OE/downloads"
+
+# This variable points to an optional location where additional installer
+# content can be placed to be packaged inside of any image recipe that
+# inherits the tisdk-image class.  It is expected that the directory
+# structure should match the structure as you want it placed in the SDK.
+# If you are not building an SDK image with external components then this
+# is not required.
+INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"
+
+# This variable points to the directory with the test scripts you want to
+# run.  The entire directory will be copied to make removing the test scripts
+# easier during cleanup.
+# NOTE: The assumption is that this directory contains at least the
+#       following files:
+#           - opentest.sh // This is called by opentest framework
+#           - S90-fake-pointercal // This fakes pointer calibration
+#           - nightly-test.sh // This is called by opentest.sh and does
+#                                machine specific testing
+# NOTE: Since the scripts will be copied to TEST_SCRIPTS_TGT
+#       the opentest.sh script should call the scripts in the new directory.
+TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
+
+# This variable points to the directory within the target filesystem that
+# the scripts directory in TEST_SCRIPTS will be copied as.
+TEST_SCRIPTS_TGT="home/root/test-scripts"
+
+# This variable may be used to specify the exact network interface used to
+# communicate with the OpenTest Framework (e.g. eth1), instead of guessing it.
+# Useful on multi-homed machines with multiple interfaces, when guessing
+# between eth0 and eth1 is not possible. Leave empty for default behavior.
+TEST_LOCAL_IFACE="eth1"
+
+# This variable contains the tarball name for the opentest CLI which is
+# required to do target side testing.
+OPENTEST_CLI="$SCRIPTS_ROOT/linux-devtest.tgz"
+
+# This variable specifies the IP address of the TEE to be used with OpenTest
+# Defaults to 128.247.105.11 if not set
+OPENTEST_TEE_IP="none"
+
+# This variable specifies the hardware capabilities to be used with OpenTest
+# Capabilities are separated by underscores, some excamples are here:
+# http://arago-project.org/wiki/index.php/Opentest-CheatSheet
+# Defaults to "linux" if not set
+# Limit the board selection to official TI GT farm, avoiding personal boards
+OPENTEST_HW_CAP="linux_tigt_farm"
+
+# This variable will allow control over whether to perform build testing or
+# skip it.  This should usually be set to true but may be changed for
+# prototyping.
+RUN_BUILD_TESTS="true"
+
+# This variable points to the STAF installation location which is used
+# during the build test steps to call into the OpenTest Framework.  This
+# default value is the default value from the STAF installer
+STAF_ROOT="/usr/local/staf"
+
+# This variable indicates whether to continue the build process for a machine
+# even when the build testing fails.  This can be useful in the case of
+# the test system being down to allow the full packaging of the SDK to
+# continue.
+SKIP_TEST_FAILURES="false"
+
+# This variable indicates whether to productize the build by packaging
+# it into an installer and web content.  This will require that
+# InstallBuilder be installed on your host system and that you have
+# and project file created to package it.  If not then you can use
+# the simple SDK tarball that was created during the build as your
+# SDK.
+PRODUCTIZE_SDK="false"
+
+# This variable contains the command(s) that bitbake should run. Each command
+# should be seperated by a semicolon.
+BITBAKE_COMMAND="arago-core-tisdk-image"
+
+# This variable controls whether the build configuration included at the bottom
+# of the results file includes comments or not. The default is "false" to filter
+# comments out.
+RESULTS_CONFIG_COMMENTS="false"
+
+################################################################################
+# The following variables only need to be set if PRODUCTIZE_SDK is true.
+# If not you do not need to set these variables.  If you do want to
+# publish an SDK you will need access to other tools such as webgen that
+# are not available outside of TI.
+################################################################################
+
+# This points to the location where the InstallBuilder application has
+# been extracted.
+INSTALL_BUILDER="/home/jenkins/installbuilder"
+
+# This variable points to the root diretory where the installer content will be
+# staged to build the installer.
+INSTALLER_ROOT="$BUILD_ROOT/installer"
+
+# This variable will point to the InstallBuilder file used to build the SDK
+# installer
+INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
+
+# This variable points to a directory where additional SD card content
+# is located.  In general this directory should have a structure like
+#   - <machine>/boot - holds extra boot partition content
+#   - <machine>/start_here - holds the extra start_here partition content
+# Many times you will want to use symlinks here to save space, so the
+# build scripts will use the -L option to copy the linked file instead of
+# the symlink.
+SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
+
+# This variable determines whether the uImage and dtb files should be placed in
+# the boot partition tarball or not.  For newer kernel and u-boot combinations
+# the uImage and dtb files are kept in the rootfs partition and placing it in
+# the boot partition will cause confusion.
+PACKAGE_BOOT_KERNEL_FILES="false"
+
+# This variable points to the directory where the webgen tool has been
+# Installed.
+WEBGEN_ROOT="/home/jenkins/webgen"
+
+# This variable points to the location where additional webgen/webpage files
+# are located.  Many times you will want to use symlinks here to save space
+# so the build scripts will use the -L option to copy the linked file instead
+# of the symlink.
+WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
+
+# This variable points to the root location where the publish SDK data is
+# stored.  This data is the webgen.mak files required to build the SDK
+# ti.com style web pages.
+# The general assumption is that the directory structure looks like:
+#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+
+# This variable specifies whether or not to copy the build contents to
+# a remote web hosting server.
+COPY_TO_WEB="true"
+
+# This variable specifies whether or not to copy the deploy contents to a
+# remote web hosting server. These are unprocessed intermediate artifacts,
+# such as images, IPK feeds etc, so may not be distributed publicly as is.
+COPY_DEPLOY_TO_WEB="true"
+
+# This variable points to the user@webhost:<basepath> location where the
+# deploy contents should be placed.  This is best done if you have done a
+# key exchange between these systems so that your SCP command will not ask
+# for a password.
+WEB_HOST="lcpdbld@lsblogin02.dal.design.ti.com:/web/lcpd/htdocs/core-sdk/nightly"
+
+# This variable determines whether the DEPLOY_ROOT will be cleaned after
+# the remote copy.  The reason for this is that if the files already exist
+# on the remote system there is no need to keep them on the local system.
+CLEAN_AFTER_COPY="true"
+
+# This variable determines if the results directory should be copied before
+# the deploy directory is cleaned.  If this value is set then the results
+# will be copied to the given directory.  If not then they will not be
+# copied and will be cleaned if CLEAN_AFTER_COPY is true.
+BACKUP_RESULTS=""
diff --git a/configs/coresdk/arago-core-tisdk-puget.txt b/configs/arago-core-tisdk-danny-puget.txt
similarity index 100%
rename from configs/coresdk/arago-core-tisdk-puget.txt
rename to configs/arago-core-tisdk-danny-puget.txt
diff --git a/configs/coresdk/arago-core-tisdk-dora-puget.txt b/configs/arago-core-tisdk-dora-puget.txt
similarity index 100%
rename from configs/coresdk/arago-core-tisdk-dora-puget.txt
rename to configs/arago-core-tisdk-dora-puget.txt
diff --git a/configs/coresdk/arago-core-tisdk-dylan-puget.txt b/configs/arago-core-tisdk-dylan-puget.txt
similarity index 100%
rename from configs/coresdk/arago-core-tisdk-dylan-puget.txt
rename to configs/arago-core-tisdk-dylan-puget.txt
diff --git a/configs/amsdk/arago-core-amsdk-2013.04.01.txt b/configs/coresdk/arago-core-amsdk-2013.04.01.txt
similarity index 100%
rename from configs/amsdk/arago-core-amsdk-2013.04.01.txt
rename to configs/coresdk/arago-core-amsdk-2013.04.01.txt
-- 
2.0.0


