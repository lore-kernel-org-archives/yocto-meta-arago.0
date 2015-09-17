Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 2F74052A02
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2015 02:48:26 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUS007ZRVRVW5M0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 16 Sep 2015 21:48:13 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=sZzFWqfjpx2-B448DNgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4837C161C39;	Wed,
	16 Sep 2015 22:47:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 16 Sep 2015 22:47:50 -0400
Message-id: <1442458071-18791-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] external-linaro-toolchain: fix devkit linking, C++ headers, omp.h
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
X-List-Received-Date: Thu, 17 Sep 2015 02:48:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../meta/external-linaro-toolchain.bbappend        | 29 +++++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 467fe9f..a979181 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -4,7 +4,7 @@ ALLOW_EMPTY_ldd = "1"
 ALLOW_EMPTY_libstdc++ = "1"
 ALLOW_EMPTY_libgomp = "1"
 
-PR_append = "-arago23"
+PR_append = "-arago24"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
@@ -90,18 +90,39 @@ FILES_libgcc-dev += "\
 	${libdir}/libgcc.a \
 "
 
+FILES_libstdc++-dev += "\
+	/include/c++/ \
+"
+
+FILES_libgomp-dev += "\
+	${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include/omp.h \
+"
+
 do_install_append() {
 	mv ${D}${base_libdir}/libc.so ${D}${libdir}/libc.so || true
 	mv ${D}${base_libdir}/libpthread.so ${D}${libdir}/libpthread.so || true
 
+	ln -sf ../../lib/libc.so.6 ${D}${libdir}/libc.so.6
+	ln -sf ../../lib/libpthread.so.0 ${D}${libdir}/libpthread.so.0
+
+	sed -i -e "s# /lib/${ELT_TARGET_SYS}# ../../lib#g" -e "s# /usr/lib/${ELT_TARGET_SYS}# .#g" -e "s# /lib/ld-linux# ../../lib/ld-linux#g" ${D}${libdir}/libc.so
+	sed -i -e "s# /lib/# ../../lib/#g" -e "s# /usr/lib/# ./#g" ${D}${libdir}/libc.so
+
+	sed -i -e "s# /lib/${ELT_TARGET_SYS}# ../../lib#g" -e "s# /usr/lib/${ELT_TARGET_SYS}# .#g" ${D}${libdir}/libpthread.so
+	sed -i -e "s# /lib/# ../../lib/#g" -e "s# /usr/lib/# ./#g" ${D}${libdir}/libpthread.so
+
+
 	install -d ${D}${base_sbindir}
 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/libc/${base_sbindir}/ldconfig ${D}${base_sbindir}/
 	install -d ${D}${sysconfdir}
 	echo -e "/lib\n/usr/lib" >> ${D}${sysconfdir}/ld.so.conf
-	( cd ${D}${libdir} && ln -sf ../../lib/libc.so.6 )
 
-	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/* ${D}${includedir}
-	ln -sf ${ELT_TARGET_SYS} ${D}${includedir}/c++/${ELT_VER_GCC}/${TARGET_SYS}
+	install -d ${D}/include
+	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/* ${D}/include
+	ln -sf ${ELT_TARGET_SYS} ${D}/include/c++/${ELT_VER_GCC}/${TARGET_SYS}
+
+	install -d ${D}${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include
+	cp -a ${TOOLCHAIN_PATH}/${base_libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include/omp.h ${D}${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include
 
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/asm*; rm -rf ${D}${includedir}/drm; rm -rf ${D}${includedir}/linux; rm -rf ${D}${includedir}/mtd; rm -rf ${D}${includedir}/rdma; rm -rf ${D}${includedir}/sound; rm -rf ${D}${includedir}/video', d)}
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/uapi/.install; rm -rf ${D}${includedir}/misc/.install; rm -rf ${D}${includedir}/misc/cxl.h; rm -rf ${D}${includedir}/scsi/.install; rm -rf ${D}${includedir}/scsi/scsi_netlink*; rm -rf ${D}${includedir}/scsi/scsi_bsg*; rm -rf ${D}${includedir}/scsi/fc; rm -rf ${D}${includedir}/xen', d)}
-- 
2.2.0


