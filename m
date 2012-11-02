Return-Path: <denys@ti.com>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 14BFD529A5
	for <meta-arago@arago-project.org>;
	Fri,  2 Nov 2012 18:10:26 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCV007QMH5CE081@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 02 Nov 2012 13:10:25 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 36C7E201C2; Fri,
	02 Nov 2012 14:10:24 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 02 Nov 2012 14:10:23 -0400
Message-id: <1351879823-3340-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [PATCHv2] meta-toolchain-arago: remove MULTIMACH_TARGET_SYS suffix from environment-setup
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
X-List-Received-Date: Fri, 02 Nov 2012 18:10:27 -0000

This is a temporary change and needs to be reverted once we adopt
a multilib toolchain/SDK.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
In v2 decided to go for simplicity and not worry about inconsistency -
siteinfo and version files will have their suffixes unchanged.

 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 1e5d140..d3d0d12 100644
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
-- 
1.7.12.4


