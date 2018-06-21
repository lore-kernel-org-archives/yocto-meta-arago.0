Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id AEF85529B3
	for <meta-arago@arago-project.org>;
	Thu, 21 Jun 2018 18:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C820520BEE;
	Thu, 21 Jun 2018 18:36:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3vbSzOqytC5D; Thu, 21 Jun 2018 18:36:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9316C2079D;
	Thu, 21 Jun 2018 18:36:35 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 0BF2D1634AC;
	Thu, 21 Jun 2018 14:36:35 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 21 Jun 2018 14:36:34 -0400
Message-Id: <1529606194-21954-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] u-boot-ti-staging: use ${B}/r8 to not overwrite output of a53 build
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
X-List-Received-Date: Thu, 21 Jun 2018 18:36:43 -0000

But ${B} itself cannot change for sstate to work correctly.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend
index 13f0a65..0dc1994 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend
@@ -9,17 +9,17 @@ UBOOT_R8_SYMLINK = "tiboot3-${MACHINE}.bin"
 
 do_compile_append_am65xx-evm() {
 	# Build R8 side now
-	make ${PARALLEL_MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1 HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" -C ${S} O=${B} am65x_evm_r5_defconfig
-	make ${PARALLEL_MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1 HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" -C ${S} O=${B} SYSFW=${SYSFW_FILE} ${UBOOT_MAKE_TARGET}
+	make ${PARALLEL_MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1 HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" -C ${S} O=${B}/r8 am65x_evm_r5_defconfig
+	make ${PARALLEL_MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1 HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" -C ${S} O=${B}/r8 SYSFW=${SYSFW_FILE} ${UBOOT_MAKE_TARGET}
 }
 
 do_install_append_am65xx-evm() {
-	install -m 644 ${B}/${UBOOT_R8_BINARY} ${D}/boot/${UBOOT_R8_IMAGE}
+	install -m 644 ${B}/r8/${UBOOT_R8_BINARY} ${D}/boot/${UBOOT_R8_IMAGE}
 	ln -sf ${UBOOT_R8_IMAGE} ${D}/boot/${UBOOT_R8_BINARY}
 }
 
 do_deploy_append_am65xx-evm() {
-	install ${B}/${UBOOT_R8_BINARY} ${DEPLOYDIR}/${UBOOT_R8_IMAGE}
+	install ${B}/r8/${UBOOT_R8_BINARY} ${DEPLOYDIR}/${UBOOT_R8_IMAGE}
 	rm -f ${DEPLOYDIR}/${UBOOT_R8_BINARY} ${DEPLOYDIR}/${UBOOT_R8_SYMLINK}
 	ln -sf ${UBOOT_R8_IMAGE} ${DEPLOYDIR}/${UBOOT_R8_BINARY}
 	ln -sf ${UBOOT_R8_IMAGE} ${DEPLOYDIR}/${UBOOT_R8_SYMLINK}
-- 
2.7.4


