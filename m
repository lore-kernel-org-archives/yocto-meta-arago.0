Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 3684552A0E
	for <meta-arago@arago-project.org>;
	Fri, 17 Feb 2017 20:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CD20A20B96;
	Fri, 17 Feb 2017 20:44:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3PWAHweJYAJl; Fri, 17 Feb 2017 20:44:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC73120999;
	Fri, 17 Feb 2017 20:44:55 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D597816237D;
	Fri, 17 Feb 2017 15:44:54 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 17 Feb 2017 15:44:45 -0500
Message-Id: <1487364285-82424-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487363294-71224-1-git-send-email-denys@ti.com>
References: <1487363294-71224-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH v2] external-linaro-toolchain: reorder PACKAGES so libgcc-dev picks libgcc.a
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
X-List-Received-Date: Fri, 17 Feb 2017 20:44:58 -0000

Recent update to the upstream external-linaro-toolchain.bb in meta-linaro
changed the order of PACKAGES and libgcc-dev is now towards the end of the
list and has no chance of picking libgcc.a. Since native compiler on the
target uses libgcc.a and expects it to come from libgcc-dev package, the
fix is to move it up the PACKAGES list.

Moreover, with gcc6, linaro prebuilt toolchain stopped packaging libgcc.a
inside the target sysroot, so pick it up from gcc lib dir instead.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - support gcc6 by copying libgcc.a from gcc lib dir

 .../recipes-core/meta/external-linaro-toolchain.bbappend           | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 31f5ba0..7648e36 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -6,7 +6,7 @@ ALLOW_EMPTY_ldd = "1"
 ALLOW_EMPTY_libstdc++ = "1"
 ALLOW_EMPTY_libgomp = "1"
 
-PR_append = ".arago33"
+PR_append = ".arago34"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
@@ -20,6 +20,9 @@ PACKAGES := "${@oe_filter_out('linux-libc-headers', '${PACKAGES}', d)}"
 
 PACKAGES += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', 'linux-libc-headers-dev', '', d)}"
 
+PACKAGES := "${@oe_filter_out('libgcc-dev', '${PACKAGES}', d)}"
+PACKAGES =+ "libgcc-dev"
+
 DEPENDS += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'linux-libc-headers', d)}"
 
 DEPENDS += "external-linaro-toolchain-cross-${TARGET_ARCH}"
@@ -152,6 +155,8 @@ do_install_append() {
 		ln -sf ${TARGET_SYS} ${D}${libdir}/gcc/${ELT_TARGET_SYS}
 	fi
 
+	cp -a ${TOOLCHAIN_PATH}/${base_libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/libgcc.a ${D}${libdir}
+
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/asm*; rm -rf ${D}${includedir}/drm; rm -rf ${D}${includedir}/linux; rm -rf ${D}${includedir}/mtd; rm -rf ${D}${includedir}/rdma; rm -rf ${D}${includedir}/sound; rm -rf ${D}${includedir}/video', d)}
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/uapi/.install; rm -rf ${D}${includedir}/misc/.install; rm -rf ${D}${includedir}/misc/cxl.h; rm -rf ${D}${includedir}/scsi/.install; rm -rf ${D}${includedir}/scsi/scsi_netlink*; rm -rf ${D}${includedir}/scsi/scsi_bsg*; rm -rf ${D}${includedir}/scsi/cxlflash_ioctl.h; rm -rf ${D}${includedir}/scsi/fc; rm -rf ${D}${includedir}/xen', d)}
 
-- 
2.7.4


