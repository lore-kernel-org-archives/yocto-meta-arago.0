Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D0C69529B3
	for <meta-arago@arago-project.org>;
	Thu, 21 Jun 2018 18:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0CD7320BEE;
	Thu, 21 Jun 2018 18:43:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id L-wHR8G7YcNm; Thu, 21 Jun 2018 18:43:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DDD662017D;
	Thu, 21 Jun 2018 18:43:04 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 6EAC51634AC;
	Thu, 21 Jun 2018 14:43:04 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 21 Jun 2018 14:43:03 -0400
Message-Id: <1529606583-22355-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH v2] u-boot-ti-staging: use ${B}/r5 to not overwrite output of a53 build
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
X-List-Received-Date: Thu, 21 Jun 2018 18:43:12 -0000

But ${B} itself cannot change for sstate to work correctly.

Also change r8 typo to r5 - wishful thinking? :)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../u-boot/u-boot-ti-staging_2018.01.bbappend      | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend
index 13f0a65..5f6c1a5 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend
@@ -3,24 +3,24 @@ PACKAGECONFIG_append_k3 = " optee"
 CROSS_COMPILE_V7 = "${ELT_TARGET_SYS_ARMV7}-"
 PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
 
-UBOOT_R8_BINARY = "tiboot3.bin"
-UBOOT_R8_IMAGE = "tiboot3-${MACHINE}-${PV}-${PR}.bin"
-UBOOT_R8_SYMLINK = "tiboot3-${MACHINE}.bin"
+UBOOT_R5_BINARY = "tiboot3.bin"
+UBOOT_R5_IMAGE = "tiboot3-${MACHINE}-${PV}-${PR}.bin"
+UBOOT_R5_SYMLINK = "tiboot3-${MACHINE}.bin"
 
 do_compile_append_am65xx-evm() {
-	# Build R8 side now
-	make ${PARALLEL_MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1 HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" -C ${S} O=${B} am65x_evm_r5_defconfig
-	make ${PARALLEL_MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1 HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" -C ${S} O=${B} SYSFW=${SYSFW_FILE} ${UBOOT_MAKE_TARGET}
+	# Build R5 side now
+	make ${PARALLEL_MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1 HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" -C ${S} O=${B}/r5 am65x_evm_r5_defconfig
+	make ${PARALLEL_MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1 HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" -C ${S} O=${B}/r5 SYSFW=${SYSFW_FILE} ${UBOOT_MAKE_TARGET}
 }
 
 do_install_append_am65xx-evm() {
-	install -m 644 ${B}/${UBOOT_R8_BINARY} ${D}/boot/${UBOOT_R8_IMAGE}
-	ln -sf ${UBOOT_R8_IMAGE} ${D}/boot/${UBOOT_R8_BINARY}
+	install -m 644 ${B}/r5/${UBOOT_R5_BINARY} ${D}/boot/${UBOOT_R5_IMAGE}
+	ln -sf ${UBOOT_R5_IMAGE} ${D}/boot/${UBOOT_R5_BINARY}
 }
 
 do_deploy_append_am65xx-evm() {
-	install ${B}/${UBOOT_R8_BINARY} ${DEPLOYDIR}/${UBOOT_R8_IMAGE}
-	rm -f ${DEPLOYDIR}/${UBOOT_R8_BINARY} ${DEPLOYDIR}/${UBOOT_R8_SYMLINK}
-	ln -sf ${UBOOT_R8_IMAGE} ${DEPLOYDIR}/${UBOOT_R8_BINARY}
-	ln -sf ${UBOOT_R8_IMAGE} ${DEPLOYDIR}/${UBOOT_R8_SYMLINK}
+	install ${B}/r5/${UBOOT_R5_BINARY} ${DEPLOYDIR}/${UBOOT_R5_IMAGE}
+	rm -f ${DEPLOYDIR}/${UBOOT_R5_BINARY} ${DEPLOYDIR}/${UBOOT_R5_SYMLINK}
+	ln -sf ${UBOOT_R5_IMAGE} ${DEPLOYDIR}/${UBOOT_R5_BINARY}
+	ln -sf ${UBOOT_R5_IMAGE} ${DEPLOYDIR}/${UBOOT_R5_SYMLINK}
 }
-- 
2.7.4


