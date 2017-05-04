Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 378AC5297F
	for <meta-arago@arago-project.org>;
	Thu,  4 May 2017 15:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 29BE020BE6;
	Thu,  4 May 2017 15:40:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id x3akVWvVScpM; Thu,  4 May 2017 15:40:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EDD6820873;
	Thu,  4 May 2017 15:40:30 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 7270C162493;
	Thu,  4 May 2017 11:40:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  4 May 2017 11:40:21 -0400
Message-Id: <1493912421-129421-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493912421-129421-1-git-send-email-denis@denix.org>
References: <1493912421-129421-1-git-send-email-denis@denix.org>
Subject: [tisdk-build-scripts][PATCH 2/2] configs/farm/poky*: add Poky configs
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
X-List-Received-Date: Thu, 04 May 2017 15:40:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/poky-master.txt | 196 +++++++++++++++++++++++++++++++++++++++++++
 configs/farm/poky-morty.txt  | 196 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 392 insertions(+)
 create mode 100644 configs/farm/poky-master.txt
 create mode 100644 configs/farm/poky-morty.txt

diff --git a/configs/farm/poky-master.txt b/configs/farm/poky-master.txt
new file mode 100644
index 0000000..900f6a1
--- /dev/null
+++ b/configs/farm/poky-master.txt
@@ -0,0 +1,196 @@
+################################################################################
+#                      Core TISDK configuration file                           #
+################################################################################
+
+# This variable contains the list of variables found in this congif file
+# that MUST be set to a value.  Failure to set these variables could
+# lead to corruption of the host system or the build script not
+# executing properly
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+
+# This variable holds the SDK version you are building.  This will be picked
+# up in the installer name if you choose to package an installer.  You can
+# also use this in the CONFIG_FILE name below.
+TISDK_VERSION="2017.05"
+
+# This variable contains the list of machines to build an SDK for
+MACHINES=""
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
+TOOLCHAIN_ROOT_ARM9=""
+TOOLCHAIN_ROOT_CORTEX=""
+
+# SECDEV variables for CAT and AUTO
+#TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
+#TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
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
+BUILD_ROOT="/OE/farm-poky-master"
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
+FS_FILTER="core-*image-"
+
+# This variable indicates the type of FS images being generated.  By default
+# this is tar.gz images.  This should match what you set in your recipes
+FS_IMAGE_TYPE="tar.xz"
+
+# This variable contains the "filter" string to look for inside of the
+# OE build directory to find the SDK image.  Since the image name can
+# vary based on the recipe settings this string will account for that.
+SDK_FILTER=""
+
+# This variable indicates the type of SDK images being generated.  By default
+# this is tar.gz images.  This should match what you set in your recipes
+SDK_IMAGE_TYPE="tar.xz"
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
+CLEAN_BUILD="true"
+
+# This variable indicates whether we should clean shared state (sstate)
+CLEAN_SSTATE="true"
+
+# This variable means that we should clean not only build build directories,
+# but also the sources as well and do a fully clean build.
+CLEAN_ALL="false"
+
+# This is the configuration file to use in the oe-layertool-setup.sh script
+# to configure the build.
+CONFIG_FILE="${BUILD_ROOT}/configs/poky-master-config.txt"
+
+# This directory will contain the log files for the various parts of the build.
+# This includes:
+#   1. Overall build process log (i.e. which machines are in which build dir)
+#   2. Build logs for individual machines
+#   3. Test logs for individual machines
+#   4. Packaging logs for individual machines
+LOG_DIR="${BUILD_ROOT}/logs"
+
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+BUILD_LOG_VERBOSE="true"
+
+# This is the directory where you want to configure your build to download
+# files to.  This is best done as a shared directory among the builds to
+# save download time and space.
+DL_DIR="${BUILD_ROOT}/downloads"
+
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+SOURCE_MIRROR_URL="http://lcpd.gt.design.ti.com/sources/"
+
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="1"
+
+# This shortcuts the entire testing and packaging portion of the code
+# and exits right after build step is done
+EXIT_AFTER_BUILD="true"
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
+BITBAKE_COMMAND="core-image-base"
+
+# This variable controls whether the build configuration included at the bottom
+# of the results file includes comments or not. The default is "false" to filter
+# comments out.
+RESULTS_CONFIG_COMMENTS="false"
+
+# This variable specifies whether or not to copy the build contents to
+# a remote web hosting server.
+COPY_TO_WEB="false"
+
+# This variable specifies whether or not to copy the deploy contents to a
+# remote web hosting server. These are unprocessed intermediate artifacts,
+# such as images, IPK feeds etc, so may not be distributed publicly as is.
+COPY_DEPLOY_TO_WEB="false"
+
+# This variable specifies whether or not to copy the "golden" contents to a
+# remote web hosting server. These are images that passed run-time tests.
+COPY_GOLDEN_TO_WEB="false"
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
diff --git a/configs/farm/poky-morty.txt b/configs/farm/poky-morty.txt
new file mode 100644
index 0000000..1b1aa72
--- /dev/null
+++ b/configs/farm/poky-morty.txt
@@ -0,0 +1,196 @@
+################################################################################
+#                      Core TISDK configuration file                           #
+################################################################################
+
+# This variable contains the list of variables found in this congif file
+# that MUST be set to a value.  Failure to set these variables could
+# lead to corruption of the host system or the build script not
+# executing properly
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+
+# This variable holds the SDK version you are building.  This will be picked
+# up in the installer name if you choose to package an installer.  You can
+# also use this in the CONFIG_FILE name below.
+TISDK_VERSION="2017.05"
+
+# This variable contains the list of machines to build an SDK for
+MACHINES=""
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
+TOOLCHAIN_ROOT_ARM9=""
+TOOLCHAIN_ROOT_CORTEX=""
+
+# SECDEV variables for CAT and AUTO
+#TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
+#TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
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
+BUILD_ROOT="/OE/farm-poky-morty"
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
+FS_FILTER="core-*image-"
+
+# This variable indicates the type of FS images being generated.  By default
+# this is tar.gz images.  This should match what you set in your recipes
+FS_IMAGE_TYPE="tar.xz"
+
+# This variable contains the "filter" string to look for inside of the
+# OE build directory to find the SDK image.  Since the image name can
+# vary based on the recipe settings this string will account for that.
+SDK_FILTER=""
+
+# This variable indicates the type of SDK images being generated.  By default
+# this is tar.gz images.  This should match what you set in your recipes
+SDK_IMAGE_TYPE="tar.xz"
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
+CLEAN_BUILD="true"
+
+# This variable indicates whether we should clean shared state (sstate)
+CLEAN_SSTATE="true"
+
+# This variable means that we should clean not only build build directories,
+# but also the sources as well and do a fully clean build.
+CLEAN_ALL="false"
+
+# This is the configuration file to use in the oe-layertool-setup.sh script
+# to configure the build.
+CONFIG_FILE="${BUILD_ROOT}/configs/poky-morty-config.txt"
+
+# This directory will contain the log files for the various parts of the build.
+# This includes:
+#   1. Overall build process log (i.e. which machines are in which build dir)
+#   2. Build logs for individual machines
+#   3. Test logs for individual machines
+#   4. Packaging logs for individual machines
+LOG_DIR="${BUILD_ROOT}/logs"
+
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+BUILD_LOG_VERBOSE="true"
+
+# This is the directory where you want to configure your build to download
+# files to.  This is best done as a shared directory among the builds to
+# save download time and space.
+DL_DIR="${BUILD_ROOT}/downloads"
+
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+SOURCE_MIRROR_URL="http://lcpd.gt.design.ti.com/sources/"
+
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="1"
+
+# This shortcuts the entire testing and packaging portion of the code
+# and exits right after build step is done
+EXIT_AFTER_BUILD="true"
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
+BITBAKE_COMMAND="core-image-base"
+
+# This variable controls whether the build configuration included at the bottom
+# of the results file includes comments or not. The default is "false" to filter
+# comments out.
+RESULTS_CONFIG_COMMENTS="false"
+
+# This variable specifies whether or not to copy the build contents to
+# a remote web hosting server.
+COPY_TO_WEB="false"
+
+# This variable specifies whether or not to copy the deploy contents to a
+# remote web hosting server. These are unprocessed intermediate artifacts,
+# such as images, IPK feeds etc, so may not be distributed publicly as is.
+COPY_DEPLOY_TO_WEB="false"
+
+# This variable specifies whether or not to copy the "golden" contents to a
+# remote web hosting server. These are images that passed run-time tests.
+COPY_GOLDEN_TO_WEB="false"
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
-- 
2.7.4


