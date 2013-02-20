Return-Path: <ceh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9F90952A27
	for <meta-arago@arago-project.org>;
	Wed, 20 Feb 2013 22:26:06 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1KMQ0wX019554
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2013 16:26:00 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1KMQ0aJ009985
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2013 16:26:00 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Feb 2013 16:26:00 -0600
Received: from localhost.localdomain (gtdev04-a0850405.am.dhcp.ti.com
	[10.218.102.32])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r1KMQ0RK022750;	Wed, 20 Feb 2013 16:26:00 -0600
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Feb 2013 17:42:54 -0500
Message-ID: <1361400177-5858-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/4] U-boot: Include UART SPL in deploy package
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
X-List-Received-Date: Wed, 20 Feb 2013 22:26:10 -0000
Content-Type: text/plain

MLO can not be used to boot from UART, so include both
MLO and uart spl in deploy package.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 meta-arago-distro/recipes-bsp/u-boot/spl-uart.inc  |   27 ++++++++++++++++++++
 .../u-boot/u-boot_2012.10-psp05.06.00.00.bb        |    4 ++-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/spl-uart.inc

diff --git a/meta-arago-distro/recipes-bsp/u-boot/spl-uart.inc b/meta-arago-distro/recipes-bsp/u-boot/spl-uart.inc
new file mode 100644
index 0000000..8e3c809
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/spl-uart.inc
@@ -0,0 +1,27 @@
+# SECOND PROGRAM LOADER image meant to be loaded from UART.
+SPL_UART_BINARY ?= ""
+SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
+SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
+
+do_install_append () {
+    if [ "x${SPL_UART_BINARY}" != "x" ]
+    then
+        install ${S}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
+        ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
+    fi
+}
+
+FILES_${PN} = "/boot ${sysconfdir}"
+FILESPATH =. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"
+
+do_deploy_append () {
+    cd ${DEPLOYDIR}
+    if [ "x${SPL_UART_BINARY}" != "x" ]
+    then
+        install ${S}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
+        rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+        ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
+        ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+    fi
+}
+
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
index fa2183e..ec85538 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
@@ -1,5 +1,6 @@
 # Use the version of u-boot.inc in oe-core not the meta-ti version
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+require spl-uart.inc
 
 # Reset OEMAKE. Current u-boot.inc sets -02 which breaks this version of u-boot's build.
 # This issue was fixed in oe-core master by removing the -02 statement.
@@ -23,7 +24,7 @@ DEFAULT_PREFERENCE = "-1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r7+gitr${SRCPV}"
+PR = "r8+gitr${SRCPV}"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
 "
@@ -38,3 +39,4 @@ UBOOT_SUFFIX = "img"
 
 # Set the name of the SPL that will built so that it is also packaged with u-boot.
 SPL_BINARY = "MLO"
+SPL_UART_BINARY = "u-boot-spl.bin"
-- 
1.7.0.4


