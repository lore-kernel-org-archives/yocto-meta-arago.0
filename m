Return-Path: <hzhang@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id ACA13529A7
	for <meta-arago@arago-project.org>;
	Wed, 27 May 2015 20:32:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4RKWlWc031428
	for <meta-arago@arago-project.org>; Wed, 27 May 2015 15:32:47 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4RKWlK0019908
	for <meta-arago@arago-project.org>; Wed, 27 May 2015 15:32:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 May 2015 15:32:47 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4RKWlZo016590;
	Wed, 27 May 2015 15:32:47 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1Yxi0N-0007Ta-1Q; Wed, 27 May 2015 16:32:47 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 May 2015 16:32:45 -0400
Message-ID: <1432758765-28548-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] recovery-kernel: add recovery kernel dtb build for K2L and K2E
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
X-List-Received-Date: Wed, 27 May 2015 20:32:50 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

The patch adds the Linux recovery kernel device tree build for K2L and
K2E devices based on kernel v3.10.72.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../recovery-kernel/recovery-kernel_1.0.bb         |   18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
index ad3528e..6e4f9c7 100644
--- a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
+++ b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Recovery kernel building for Keystone EVM"
 LICENSE = "GPLv2"
 
-PR = "r2"
+PR = "r3"
 COMPATIBLE_MACHINE = "keystone"
-BRANCH = "master"
-SRCREV = "9bc93706b37c39c3a95593dc3d56773e9b7425ad"
+BRANCH = "v3.10.72/master"
+SRCREV = "b9bad8fccc5f9c6bcd78363982b3249a15f193fb"
 SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 FILES_${PN} += "${bindir}/crashdump"
 LINUX_ZIMAGE = "zImage"
 KERNEL_MACHINE ?= "keystone2_recovery_defconfig"
-KERNEL_DTBTYPE = "k2hk-evm-recovery.dtb"
+KERNEL_DTBTYPE = "k2hk-evm-recovery.dtb k2l-evm-recovery.dtb k2e-evm-recovery.dtb "
 CRASHDIR = "crashdump"
 ARCH = "${TARGET_ARCH}"
 CROSS_COMPILE = "${TARGET_PREFIX}"
@@ -27,11 +27,17 @@ do_configure () {
 do_compile() {
 	make ${LINUX_ZIMAGE} KALLSYMS_EXTRA_PASS=1
 	make ${KERNEL_DTBTYPE}
-	dtc -I dtb -O dtb -p 2048 -o ${KERNEL_DTBTYPE} arch/arm/boot/dts/${KERNEL_DTBTYPE}
+        for d in ${KERNEL_DTBTYPE}
+        do
+            dtc -I dtb -O dtb -p 2048 -o $d arch/arm/boot/dts/$d
+        done
 }
 
 do_install () {
 	install -d ${D}${bindir}/${CRASHDIR}/
 	install ${S}/arch/arm/boot/${LINUX_ZIMAGE} ${D}${bindir}/${CRASHDIR}
-	install ${S}/${KERNEL_DTBTYPE} ${D}${bindir}/${CRASHDIR}
+        for d in ${KERNEL_DTBTYPE}
+        do
+            install ${S}/$d ${D}${bindir}/${CRASHDIR}
+        done
 }
-- 
1.7.9.5


