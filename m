Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 94E3652ABC
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:31:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84HVHm2009016
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:31:17 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HVGvr029546
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:31:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 12:31:16 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HVGeT019828;
	Thu, 4 Sep 2014 12:31:16 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1XPasO-0001vs-48;
	Thu, 04 Sep 2014 13:31:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 13:31:08 -0400
Message-ID: <1409851868-7389-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
References: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH 4/4] configs: Add new configuration parameters
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
X-List-Received-Date: Thu, 04 Sep 2014 17:31:19 -0000
Content-Type: text/plain

* SOURCE_MIRROR_URL
* INSTALLER_PREFIX
* BUILD_LOG_VERBOSE

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 configs/amsdk/amsdk-config-05.06.00.00.txt      |   20 +++++++++++++++++++-
 configs/amsdk/amsdk-config-05.07.00.00.txt      |   20 +++++++++++++++++++-
 configs/amsdk/amsdk-config-06.00.00.00.txt      |   20 +++++++++++++++++++-
 configs/amsdk/amsdk-config-07.00.00.00.txt      |   20 +++++++++++++++++++-
 configs/amsdk/amsdk-config-07.01.00.00.txt      |   20 +++++++++++++++++++-
 configs/amsdk/amsdk-config-08.00.00.00.txt      |   20 +++++++++++++++++++-
 configs/arago-core-tisdk-daisy-puget.txt        |   18 ++++++++++++++++++
 configs/arago-core-tisdk-danny-puget.txt        |   18 ++++++++++++++++++
 configs/arago-core-tisdk-dora-puget.txt         |   18 ++++++++++++++++++
 configs/arago-core-tisdk-dylan-puget.txt        |   18 ++++++++++++++++++
 configs/coresdk/arago-core-amsdk-2013.04.01.txt |   20 +++++++++++++++++++-
 configs/coresdk/arago-core-tisdk-2013.04.00.txt |   20 +++++++++++++++++++-
 configs/coresdk/arago-core-tisdk-2013.04.01.txt |   20 +++++++++++++++++++-
 configs/coresdk/arago-core-tisdk-2013.04.02.txt |   20 +++++++++++++++++++-
 configs/coresdk/arago-core-tisdk-2013.10.00.txt |   20 +++++++++++++++++++-
 configs/coresdk/arago-core-tisdk-2013.12.00.txt |   20 +++++++++++++++++++-
 configs/coresdk/arago-core-tisdk-2013.12.01.txt |   20 +++++++++++++++++++-
 configs/coresdk/arago-core-tisdk-2014.08.00.txt |   20 +++++++++++++++++++-
 configs/distroless-meta-ti-puget.txt            |   18 ++++++++++++++++++
 19 files changed, 356 insertions(+), 14 deletions(-)

diff --git a/configs/amsdk/amsdk-config-05.06.00.00.txt b/configs/amsdk/amsdk-config-05.06.00.00.txt
index 5c459e8..ca4ac43 100644
--- a/configs/amsdk/amsdk-config-05.06.00.00.txt
+++ b/configs/amsdk/amsdk-config-05.06.00.00.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/amsdk/amsdk-05.06.00.00-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -207,6 +215,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/amsdk/amsdk-config-05.07.00.00.txt b/configs/amsdk/amsdk-config-05.07.00.00.txt
index 0f39da1..5424320 100644
--- a/configs/amsdk/amsdk-config-05.07.00.00.txt
+++ b/configs/amsdk/amsdk-config-05.07.00.00.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/amsdk/amsdk-05.07.00.00-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -222,6 +230,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/amsdk/amsdk-config-06.00.00.00.txt b/configs/amsdk/amsdk-config-06.00.00.00.txt
index 8684a6a..228761c 100644
--- a/configs/amsdk/amsdk-config-06.00.00.00.txt
+++ b/configs/amsdk/amsdk-config-06.00.00.00.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/amsdk/amsdk-06.00.00.00-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -228,6 +236,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/amsdk/amsdk-config-07.00.00.00.txt b/configs/amsdk/amsdk-config-07.00.00.00.txt
index 8f65d39..d967cbb 100644
--- a/configs/amsdk/amsdk-config-07.00.00.00.txt
+++ b/configs/amsdk/amsdk-config-07.00.00.00.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/amsdk/amsdk-07.00.00.00-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -228,6 +236,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/amsdk/amsdk-config-07.01.00.00.txt b/configs/amsdk/amsdk-config-07.01.00.00.txt
index 9dbcc73..3e4774e 100644
--- a/configs/amsdk/amsdk-config-07.01.00.00.txt
+++ b/configs/amsdk/amsdk-config-07.01.00.00.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/amsdk/amsdk-07.01.00.00-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -228,6 +236,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/amsdk/amsdk-config-08.00.00.00.txt b/configs/amsdk/amsdk-config-08.00.00.00.txt
index ff724e9..b4d98bb 100644
--- a/configs/amsdk/amsdk-config-08.00.00.00.txt
+++ b/configs/amsdk/amsdk-config-08.00.00.00.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/amsdk/amsdk-08.00.00.00-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -228,6 +236,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/arago-core-tisdk-daisy-puget.txt b/configs/arago-core-tisdk-daisy-puget.txt
index c132baf..4e2422a 100644
--- a/configs/arago-core-tisdk-daisy-puget.txt
+++ b/configs/arago-core-tisdk-daisy-puget.txt
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/arago-daisy-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/OE/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -229,6 +237,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/arago-core-tisdk-danny-puget.txt b/configs/arago-core-tisdk-danny-puget.txt
index be54fb0..1aa3e46 100644
--- a/configs/arago-core-tisdk-danny-puget.txt
+++ b/configs/arago-core-tisdk-danny-puget.txt
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/arago-danny-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/OE/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -229,6 +237,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/arago-core-tisdk-dora-puget.txt b/configs/arago-core-tisdk-dora-puget.txt
index 6ac968c..623817b 100644
--- a/configs/arago-core-tisdk-dora-puget.txt
+++ b/configs/arago-core-tisdk-dora-puget.txt
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/arago-dora-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/OE/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -229,6 +237,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/arago-core-tisdk-dylan-puget.txt b/configs/arago-core-tisdk-dylan-puget.txt
index e71fe7d..595212f 100644
--- a/configs/arago-core-tisdk-dylan-puget.txt
+++ b/configs/arago-core-tisdk-dylan-puget.txt
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/arago-dylan-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/OE/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -229,6 +237,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/coresdk/arago-core-amsdk-2013.04.01.txt b/configs/coresdk/arago-core-amsdk-2013.04.01.txt
index 2cc7686..cb85f35 100644
--- a/configs/coresdk/arago-core-amsdk-2013.04.01.txt
+++ b/configs/coresdk/arago-core-amsdk-2013.04.01.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/coresdk/coresdk-2013.04.01-amsdk-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -230,6 +238,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/coresdk/arago-core-tisdk-2013.04.00.txt b/configs/coresdk/arago-core-tisdk-2013.04.00.txt
index ccd9e19..c6466a4 100644
--- a/configs/coresdk/arago-core-tisdk-2013.04.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.04.00.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/coresdk/coresdk-2013.04.00-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -230,6 +238,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/coresdk/arago-core-tisdk-2013.04.01.txt b/configs/coresdk/arago-core-tisdk-2013.04.01.txt
index 303597d..7b7fac5 100644
--- a/configs/coresdk/arago-core-tisdk-2013.04.01.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.04.01.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/coresdk/coresdk-2013.04.01-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -230,6 +238,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/coresdk/arago-core-tisdk-2013.04.02.txt b/configs/coresdk/arago-core-tisdk-2013.04.02.txt
index 0bfb29d..a8f0a11 100644
--- a/configs/coresdk/arago-core-tisdk-2013.04.02.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.04.02.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/coresdk/coresdk-2013.04.02-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -230,6 +238,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/coresdk/arago-core-tisdk-2013.10.00.txt b/configs/coresdk/arago-core-tisdk-2013.10.00.txt
index 0af3398..c05ffa7 100644
--- a/configs/coresdk/arago-core-tisdk-2013.10.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.10.00.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/arago-dylan-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -228,6 +236,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/coresdk/arago-core-tisdk-2013.12.00.txt b/configs/coresdk/arago-core-tisdk-2013.12.00.txt
index 51b7be6..2f855c6 100644
--- a/configs/coresdk/arago-core-tisdk-2013.12.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.12.00.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/coresdk/coresdk-2013.12.00-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -228,6 +236,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/coresdk/arago-core-tisdk-2013.12.01.txt b/configs/coresdk/arago-core-tisdk-2013.12.01.txt
index a7ff529..0fc905f 100644
--- a/configs/coresdk/arago-core-tisdk-2013.12.01.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.12.01.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/coresdk/coresdk-2013.12.01-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -228,6 +236,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/coresdk/arago-core-tisdk-2014.08.00.txt b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
index 1a5e20c..b616732 100644
--- a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
@@ -126,11 +126,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/coresdk/coresdk-2014.08.00-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/home/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -228,6 +236,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
diff --git a/configs/distroless-meta-ti-puget.txt b/configs/distroless-meta-ti-puget.txt
index 917b125..bc9f783 100644
--- a/configs/distroless-meta-ti-puget.txt
+++ b/configs/distroless-meta-ti-puget.txt
@@ -112,11 +112,19 @@ CONFIG_FILE="${BUILD_ROOT}/configs/distroless-meta-ti-config.txt"
 #   4. Packaging logs for individual machines
 LOG_DIR="${BUILD_ROOT}/log-files"
 
+# Setting this variable to "true" will enable logging stdout and stderr of the 
+# bitbake command to the appropriate machine's build_log.txt.
+#BUILD_LOG_VERBOSE="true"
+
 # This is the directory where you want to configure your build to download
 # files to.  This is best done as a shared directory among the builds to
 # save download time and space.
 DL_DIR="/OE/downloads"
 
+# Setting this variable will configure the builds to attempt to use a mirror to 
+# obtain the build sources.
+#SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -215,6 +223,16 @@ INSTALLER_ROOT="$BUILD_ROOT/installer"
 # installer
 INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 
+# This variable will provide the prefix for the installer filename and default 
+# installation directory.
+# NOTE: This prefix should match the installer filename given in the webgen.mak
+#  
+# Installer name will have the form: 
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}-Linux-x86-Install.bin
+# Installation directory will have the form:
+#   - ${INSTALLER_PREFIX}-${MACHINE}-${TISDK_VERSION}
+INSTALLER_PREFIX="ti-sdk"
+
 # This variable points to a directory where additional SD card content
 # is located.  In general this directory should have a structure like
 #   - <machine>/boot - holds extra boot partition content
-- 
1.7.9.5


