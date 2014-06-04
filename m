Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 210CC52A04
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 19:19:51 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N6N00160SC28H80@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 04 Jun 2014 14:19:30 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B745D2008D; Wed,
	04 Jun 2014 15:19:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 04 Jun 2014 15:19:13 -0400
Message-id: <1401909553-14380-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] external-linaro-toolchain: updates and fixes for Linaro gcc-4.8
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
X-List-Received-Date: Wed, 04 Jun 2014 19:19:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Tested with Linaro 2014.04 release.

* Provide a hardfp version of ld-linux-armhf.so.3 symlink besides regular ld-linux.so.3
* Update absolute ld-linux* path in libc.so script with relative one to work in OE sysroot
* Avoid clashing additional scsi headers when separate linux-libc-headers is used

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain.bbappend     | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 34d4edd..aa7d253 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -2,7 +2,7 @@ INSANE_SKIP_libstdc++-dev += "staticdev"
 
 ALLOW_EMPTY_${PN}-utils = "1"
 
-PR_append = "-arago5"
+PR_append = "-arago6"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
@@ -98,8 +98,16 @@ do_install_append() {
 	install -d ${D}/include
 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/* ${D}/include
 
+	ln -sf ld-${ELT_VER_LIBC}.so ${D}${base_libdir}/ld-linux-armhf.so.3
+	if [ -f ${D}${libdir}/libc.so ];then
+		sed -i -e "s# /lib/ld-linux# ../../lib/ld-linux#g" ${D}${libdir}/libc.so
+	fi
+	if [ -f ${D}${base_libdir}/libc.so ];then
+		sed -i -e "s# /lib/ld-linux# ../../lib/ld-linux#g" ${D}${base_libdir}/libc.so
+	fi
+
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/asm*; rm -rf ${D}${includedir}/drm; rm -rf ${D}${includedir}/linux; rm -rf ${D}${includedir}/mtd; rm -rf ${D}${includedir}/rdma; rm -rf ${D}${includedir}/sound; rm -rf ${D}${includedir}/video', d)}
-	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/scsi/.install; rm -rf ${D}${includedir}/scsi/scsi_netlink*; rm -rf ${D}${includedir}/scsi/scsi_bsg*; rm -rf ${D}${includedir}/xen', d)}
+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/scsi/.install; rm -rf ${D}${includedir}/scsi/scsi_netlink*; rm -rf ${D}${includedir}/scsi/scsi_bsg*; rm -rf ${D}${includedir}/scsi/fc; rm -rf ${D}${includedir}/xen', d)}
 
 	rm -rf ${D}/lib/libgfortran*
 	rm -rf ${D}/lib/ldscripts
-- 
2.0.0


