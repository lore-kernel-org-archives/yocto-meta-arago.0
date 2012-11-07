Return-Path: <denys@ti.com>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id 615F752A0E
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 21:03:30 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MD400ISQYH1L2Z0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 07 Nov 2012 15:03:01 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3463920031; Wed,
	07 Nov 2012 16:03:01 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 07 Nov 2012 16:03:00 -0500
Message-id: <1352322180-17306-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCHv2] meta-toolchain-arago: make SDK/devkit relocatable
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
X-List-Received-Date: Wed, 07 Nov 2012 21:03:30 -0000

Implement poor man's relocation technique for self-contained crosssdk binaries

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
In v2 use stub shell scripts instead of aliases, to work in Makefiles

 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index d2fe982..81bdeed 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r5"
+PR = "r6"
 
 SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
 
@@ -28,6 +28,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export TARGET_SYS=${ARAGO_TARGET_SYS}' >> $script
 	echo 'export TARGET_PREFIX=$TARGET_SYS-' >> $script
 	echo 'export PATH=$SDK_PATH/bin:$PATH' >> $script
+	echo 'export LD_LIBRARY_PATH=$SDK_PATH/lib:$LD_LIBRARY_PATH' >> $script
 	echo 'export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
@@ -55,3 +56,13 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
+
+populate_sdk_ipk_append () {
+	cd ${SDK_OUTPUT}/${SDKPATH}/bin
+	binfiles=`find ! -name "${ARAGO_TARGET_SYS}-*" -type f -perm +111 -exec file {} \;|grep -v ":.*ASCII.*text"|cut -d":" -f1|cut -c3-`
+	for i in $binfiles; do
+		mv $i $i.real
+		printf "#!/bin/sh\n\x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.real \x24\x2a\n" > $i
+		chmod +x $i
+	done
+}
-- 
1.8.0


