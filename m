Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 0755D52AC5
	for <meta-arago@arago-project.org>;
	Mon, 17 Aug 2015 22:52:27 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NT900AEB0VCT370@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 17 Aug 2015 17:52:25 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=v0Mc-vGSVRNzN1B27WgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3DC2E161B7B;	Mon,
	17 Aug 2015 18:52:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 17 Aug 2015 18:52:23 -0400
Message-id: <1439851943-29587-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1439851943-29587-1-git-send-email-denis@denix.org>
References: <1439851943-29587-1-git-send-email-denis@denix.org>
Subject: [master/fido][PATCH 3/3] external-linaro-toolchain: most of changes got upstreamed, update bbappend
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
X-List-Received-Date: Mon, 17 Aug 2015 22:52:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../meta/external-linaro-toolchain.bbappend        | 64 +++-------------------
 1 file changed, 7 insertions(+), 57 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index cae7030..8e88506 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -1,37 +1,26 @@
-INSANE_SKIP_libstdc++-dev += "staticdev"
-INSANE_SKIP_libgcc-dev += "staticdev"
-INSANE_SKIP_libmudflap-dev += "staticdev"
-INSANE_SKIP_${PN}-dev += "staticdev"
-INSANE_SKIP_libmudflap += "ldflags"
-INSANE_SKIP_libssp += "ldflags"
-INSANE_SKIP_libgomp += "ldflags"
-INSANE_SKIP_libitm += "ldflags textrel"
-
 ALLOW_EMPTY_${PN}-utils = "1"
 ALLOW_EMPTY_ldd = "1"
-ALLOW_EMPTY_libstdc++ = "1"
-ALLOW_EMPTY_libgomp = "1"
 
-PR_append = "-arago14"
+PR_append = "-arago15"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
-PROVIDES += "virtual/${TARGET_PREFIX}gcc-intermediate"
+
 PROVIDES += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', 'linux-libc-headers linux-libc-headers-dev', '', d)}"
 
 PACKAGES := "${@oe_filter_out('linux-libc-headers-dev', '${PACKAGES}', d)}"
 PACKAGES := "${@oe_filter_out('linux-libc-headers', '${PACKAGES}', d)}"
-PACKAGES := "${@oe_filter_out('libsegfault', '${PACKAGES}', d)}"
-PACKAGES =+ "libsegfault"
+
 PACKAGES += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', 'linux-libc-headers-dev', '', d)}"
 
 DEPENDS += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'linux-libc-headers', d)}"
+
 DEPENDS += "external-linaro-toolchain-cross"
 
 RDEPENDS_${PN}-utils = ""
 
 PKGV = "${ELT_VER_LIBC}"
-PKGV_eglibc-thread-db = "${ELT_VER_LIBC}"
+PKGV_glibc-thread-db = "${ELT_VER_LIBC}"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
 FILES_${PN} += "\
@@ -81,11 +70,6 @@ FILES_${PN} += "\
 	${base_libdir}/libpcprofile.so \
 "
 
-FILES_${PN}-dev += "\
-	${libdir}/*.a \
-	${base_libdir}/*.a \
-"
-
 FILES_linux-libc-headers = ""
 
 FILES_linux-libc-headers-dev = "\
@@ -98,47 +82,13 @@ FILES_linux-libc-headers-dev = "\
 	${includedir}/video \
 "
 
-FILES_libstdc++-dev = "\
-	/include/c++ \
-	${base_libdir}/libstdc++.so \
-	${base_libdir}/libstdc++.a \
-	${base_libdir}/libsupc++.a \
-"
-
-FILES_libgcc-dev += " \
-	${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/libgcc*.a \
-	${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/*.o"
-
 do_install_append() {
-	install -d ${D}/include
-	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/* ${D}/include
-	ln -sf ${ELT_TARGET_SYS} ${D}/include/c++/${ELT_VER_GCC}/${TARGET_SYS}
-
-	install -d ${D}/${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/
-	cp -a ${TOOLCHAIN_PATH}/${base_libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/*.o ${D}/${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/
-	cp -a ${TOOLCHAIN_PATH}/${base_libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/libgcc*.a ${D}/${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/
-
-	ln -sf ld-${ELT_VER_LIBC}.so ${D}${base_libdir}/ld-linux-armhf.so.3
-	if [ -f ${D}${libdir}/libc.so ];then
-		sed -i -e "s# /lib/ld-linux# ../../lib/ld-linux#g" ${D}${libdir}/libc.so
-	fi
-	if [ -f ${D}${base_libdir}/libc.so ];then
-		sed -i -e "s# /lib/ld-linux# ../../lib/ld-linux#g" ${D}${base_libdir}/libc.so
-	fi
+	mv ${D}${base_libdir}/libc.so ${D}${libdir}/libc.so || true
+	mv ${D}${base_libdir}/libpthread.so ${D}${libdir}/libpthread.so || true
 
 	install -d ${D}/${base_sbindir}
 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/libc/${base_sbindir}/ldconfig ${D}/${base_sbindir}/
 
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/asm*; rm -rf ${D}${includedir}/drm; rm -rf ${D}${includedir}/linux; rm -rf ${D}${includedir}/mtd; rm -rf ${D}${includedir}/rdma; rm -rf ${D}${includedir}/sound; rm -rf ${D}${includedir}/video', d)}
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/uapi/.install; rm -rf ${D}${includedir}/misc/.install; rm -rf ${D}${includedir}/misc/cxl.h; rm -rf ${D}${includedir}/scsi/.install; rm -rf ${D}${includedir}/scsi/scsi_netlink*; rm -rf ${D}${includedir}/scsi/scsi_bsg*; rm -rf ${D}${includedir}/scsi/fc; rm -rf ${D}${includedir}/xen', d)}
-
-	rm -rf ${D}/lib/libgfortran*
-	rm -rf ${D}/lib/ldscripts
-	rm -rf ${D}${datadir}/lintian
-	rm -r ${D}${bindir} || true
-	rm -r ${D}${sbindir} || true
-	rm -r ${D}${libexecdir} || true
-	rm -rf ${D}/lib/libacl.so*
-	rm -rf ${D}/lib/libattr.so*
-	rm -rf ${D}${libdir}/liblzma.so*
 }
-- 
2.2.0


