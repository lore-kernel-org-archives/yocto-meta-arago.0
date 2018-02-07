Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 246D852A5B
	for <meta-arago@arago-project.org>;
	Wed,  7 Feb 2018 20:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A0D7A20B01;
	Wed,  7 Feb 2018 20:33:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 7WIe_4kGOOiR; Wed,  7 Feb 2018 20:33:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 51E2C20B5B;
	Wed,  7 Feb 2018 20:33:20 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 19AC216328B;
	Wed,  7 Feb 2018 15:33:18 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Feb 2018 15:33:08 -0500
Message-Id: <1518035594-38357-9-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518035594-38357-1-git-send-email-denys@ti.com>
References: <1518035594-38357-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 09/15] external-linaro-toolchain: remove support for separate linux-libc-headers
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
X-List-Received-Date: Wed, 07 Feb 2018 20:33:32 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/toolchain-linaro.inc              |  5 -----
 .../recipes-core/meta/external-linaro-toolchain.bbappend  | 15 ---------------
 2 files changed, 20 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index b888be2..81cf1f7 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -26,11 +26,6 @@ TOOLCHAIN_PREFIX := "${TOOLCHAIN_SYS}-"
 
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-linaro-toolchain"
 
-# Use specific libc headers instead of ones provided by toolchain
-PREFERRED_PROVIDER_linux-libc-headers_forcevariable = "linux-libc-headers"
-PREFERRED_PROVIDER_linux-libc-headers-dev_forcevariable = "linux-libc-headers"
-PREFERRED_PROVIDER_virtual/linux-libc-headers_forcevariable = "linux-libc-headers"
-
 PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-linaro-sdk-toolchain"
 PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-linaro-sdk-toolchain"
 #PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-linaro-sdk-toolchain"
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index df5b5c0..65fb53a 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -9,23 +9,11 @@ ALLOW_EMPTY_libgomp = "1"
 
 PR_append = ".arago36"
 
-PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
-PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
-
-PROVIDES += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', 'linux-libc-headers linux-libc-headers-dev', '', d)}"
-
 RPROVIDES_${PN}-staticdev += "glibc-staticdev"
 
-PACKAGES := "${@oe_filter_out('linux-libc-headers-dev', '${PACKAGES}', d)}"
-PACKAGES := "${@oe_filter_out('linux-libc-headers', '${PACKAGES}', d)}"
-
-PACKAGES += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', 'linux-libc-headers-dev', '', d)}"
-
 PACKAGES := "${@oe_filter_out('libgcc-dev', '${PACKAGES}', d)}"
 PACKAGES =+ "libgcc-dev"
 
-DEPENDS += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'linux-libc-headers', d)}"
-
 RDEPENDS_${PN}-utils = ""
 
 PKGV = "${ELT_VER_LIBC}"
@@ -157,7 +145,4 @@ do_install_append() {
 
 	cp -a ${TOOLCHAIN_PATH}/${base_libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/libgcc.a ${D}${libdir}
 	cp -a ${TOOLCHAIN_PATH}/${base_libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/crt*.o ${D}${libdir}
-
-	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/asm*; rm -rf ${D}${includedir}/drm; rm -rf ${D}${includedir}/linux; rm -rf ${D}${includedir}/mtd; rm -rf ${D}${includedir}/rdma; rm -rf ${D}${includedir}/sound; rm -rf ${D}${includedir}/video', d)}
-	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/uapi/.install; rm -rf ${D}${includedir}/misc/.install; rm -rf ${D}${includedir}/misc/cxl.h; rm -rf ${D}${includedir}/scsi/.install; rm -rf ${D}${includedir}/scsi/scsi_netlink*; rm -rf ${D}${includedir}/scsi/scsi_bsg*; rm -rf ${D}${includedir}/scsi/cxlflash_ioctl.h; rm -rf ${D}${includedir}/scsi/fc; rm -rf ${D}${includedir}/xen', d)}
 }
-- 
2.7.4


