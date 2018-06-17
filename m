Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A258F529C0
	for <meta-arago@arago-project.org>;
	Sun, 17 Jun 2018 19:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3B7D7207AB;
	Sun, 17 Jun 2018 19:37:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hq0LyuIrBw7Z; Sun, 17 Jun 2018 19:37:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 141A720B1F;
	Sun, 17 Jun 2018 19:37:42 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id AC3FC1634A5;
	Sun, 17 Jun 2018 15:37:41 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 17 Jun 2018 15:37:32 -0400
Message-Id: <1529264260-41284-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/9] u-boot-ti-staging: add handling of R8 side on AM65x
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:50 -0000

This uses a different ARMv7 toolchain when building for ARMv8 platform.
It passes SYSFW binary to the build referred by SYSFW_FILE environment variable.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../u-boot/u-boot-ti-staging_2018.01.bbappend      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend
new file mode 100644
index 0000000..13f0a65
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend
@@ -0,0 +1,26 @@
+PACKAGECONFIG_append_k3 = " optee"
+
+CROSS_COMPILE_V7 = "${ELT_TARGET_SYS_ARMV7}-"
+PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
+
+UBOOT_R8_BINARY = "tiboot3.bin"
+UBOOT_R8_IMAGE = "tiboot3-${MACHINE}-${PV}-${PR}.bin"
+UBOOT_R8_SYMLINK = "tiboot3-${MACHINE}.bin"
+
+do_compile_append_am65xx-evm() {
+	# Build R8 side now
+	make ${PARALLEL_MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1 HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" -C ${S} O=${B} am65x_evm_r5_defconfig
+	make ${PARALLEL_MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1 HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" -C ${S} O=${B} SYSFW=${SYSFW_FILE} ${UBOOT_MAKE_TARGET}
+}
+
+do_install_append_am65xx-evm() {
+	install -m 644 ${B}/${UBOOT_R8_BINARY} ${D}/boot/${UBOOT_R8_IMAGE}
+	ln -sf ${UBOOT_R8_IMAGE} ${D}/boot/${UBOOT_R8_BINARY}
+}
+
+do_deploy_append_am65xx-evm() {
+	install ${B}/${UBOOT_R8_BINARY} ${DEPLOYDIR}/${UBOOT_R8_IMAGE}
+	rm -f ${DEPLOYDIR}/${UBOOT_R8_BINARY} ${DEPLOYDIR}/${UBOOT_R8_SYMLINK}
+	ln -sf ${UBOOT_R8_IMAGE} ${DEPLOYDIR}/${UBOOT_R8_BINARY}
+	ln -sf ${UBOOT_R8_IMAGE} ${DEPLOYDIR}/${UBOOT_R8_SYMLINK}
+}
-- 
2.7.4


