Return-Path: <denys@ti.com>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id C1ED0529AD
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 19:32:31 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCT00EFZQ9RM0B2@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 01 Nov 2012 14:32:16 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 840BA201BB; Thu,
	01 Nov 2012 15:32:15 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 01 Nov 2012 15:32:14 -0400
Message-id: <1351798334-12904-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [PATCH] meta-toolchain-arago: remove MULTIMACH_TARGET_SYS suffix from top level files
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
X-List-Received-Date: Thu, 01 Nov 2012 19:32:32 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      | 40 +++++++++++++++++++---
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 1e5d140..8c92b10 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -4,19 +4,19 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r2"
+PR = "r3"
 
 SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
 
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
 	# Create environment setup script
-	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup-${MULTIMACH_TARGET_SYS}
+	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup
 	rm -f $script
 	touch $script
 	echo 'SDK_PATH="${SDKPATHNATIVE}"' >> $script
-	echo 'if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./environment-setup-${MULTIMACH_TARGET_SYS}" ]; then' >> $script
-	echo '    echo "Error: This script needs to be sourced. Please run as \". ./environment-setup-${MULTIMACH_TARGET_SYS}\""' >> $script
+	echo 'if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./environment-setup" ]; then' >> $script
+	echo '    echo "Error: This script needs to be sourced. Please run as \". ./environment-setup\""' >> $script
 	echo '    exit 1' >> $script
 	echo 'else' >> $script
 	echo '    if [ -n "$BASH_SOURCE" ]; then' >> $script
@@ -31,7 +31,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
-	echo 'export CONFIG_SITE=$SDK_PATH/site-config-${MULTIMACH_TARGET_SYS}' >> $script
+	echo 'export CONFIG_SITE=$SDK_PATH/site-config' >> $script
 	echo -e 'export CC=\x24{TARGET_PREFIX}gcc' >> $script
 	echo -e 'export CXX=\x24{TARGET_PREFIX}g++' >> $script
 	echo -e 'export GDB=\x24{TARGET_PREFIX}gdb' >> $script
@@ -46,3 +46,33 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
+
+#This function create a site config file
+toolchain_create_sdk_siteconfig () {
+	local siteconfig=${SDK_OUTPUT}/${SDKPATH}/site-config
+
+	rm -f $siteconfig
+	touch $siteconfig
+
+	for sitefile in ${TOOLCHAIN_CONFIGSITE_NOCACHE} ; do
+		cat $sitefile >> $siteconfig
+	done
+
+	#get cached site config
+	for sitefile in ${TOOLCHAIN_NEED_CONFIGSITE_CACHE}; do
+		if [ -r ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config ]; then
+			cat ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config >> $siteconfig
+		fi
+	done
+}
+
+#This function create a version information file
+toolchain_create_sdk_version () {
+	local versionfile=${SDK_OUTPUT}/${SDKPATH}/version
+	rm -f $versionfile
+	touch $versionfile
+	echo 'Distro: ${DISTRO}' >> $versionfile
+	echo 'Distro Version: ${DISTRO_VERSION}' >> $versionfile
+	echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
+	echo 'Timestamp: ${DATETIME}' >> $versionfile
+}
-- 
1.7.12.4


