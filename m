Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 378C652AA6
	for <meta-arago@arago-project.org>;
	Thu, 28 Feb 2013 22:00:20 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIY00817AG7RV12@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 28 Feb 2013 16:00:08 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9EE7820092; Thu,
	28 Feb 2013 17:00:07 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 28 Feb 2013 17:00:05 -0500
Message-id: <1362088805-26864-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCHv2] u-boot 2012.10: replace recipe with bbappend, after moving to meta-ti
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
X-List-Received-Date: Thu, 28 Feb 2013 22:00:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - drop the PSP part of the version

 meta-arago-distro/conf/distro/arago.conf           |  2 +-
 .../u-boot/u-boot_2012.10-psp05.06.00.00.bb        | 40 ----------------------
 .../recipes-bsp/u-boot/u-boot_2012.10.bbappend     |  5 +++
 3 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6fa5401..1557b9d 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -54,7 +54,7 @@ PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x"
 PREFERRED_VERSION_virtual/kernel_am335x-evm = "3.2.0-psp05.06.00.00"
 
 # Use the SDK supported u-boot version
-PREFERRED_VERSION_u-boot_am335x-evm = "2012.10-psp05.06.00.00"
+PREFERRED_VERSION_u-boot_am335x-evm = "2012.10"
 
 PREFERRED_VERSION_linux-omapl138-psp_am180x-evm = "2.6.37"
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
deleted file mode 100644
index fa2183e..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-# Use the version of u-boot.inc in oe-core not the meta-ti version
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
-
-# Reset OEMAKE. Current u-boot.inc sets -02 which breaks this version of u-boot's build.
-# This issue was fixed in oe-core master by removing the -02 statement.
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
-
-DESCRIPTION = "u-boot bootloader for ARM MPU devices"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-COMPATIBLE_MACHINE = "ti33x|omap3"
-
-###################################################
-# When this recipe is moved to meta-ti these changes should go in a bbappend in meta-arago-distro.
-
-# PSPREL and UVER are used by arago-source-ipk.conf
-PSPREL = "05.06.00.00"
-UVER = "2012.10"
-###################################################
-
-DEFAULT_PREFERENCE = "-1"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r7+gitr${SRCPV}"
-
-SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
-"
-
-BRANCH = "amsdk-05.06.00.00"
-
-SRCREV = "6536bfa6b7f16bb49fdea8c72959e3ed54e77a82"
-
-S = "${WORKDIR}/git"
-
-UBOOT_SUFFIX = "img"
-
-# Set the name of the SPL that will built so that it is also packaged with u-boot.
-SPL_BINARY = "MLO"
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10.bbappend
new file mode 100644
index 0000000..05c3182
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10.bbappend
@@ -0,0 +1,5 @@
+PR_append = "-arago0"
+
+# PSPREL and UVER are used by arago-source-ipk.conf
+PSPREL = "05.06.00.00"
+UVER = "2012.10"
-- 
1.8.1.4


