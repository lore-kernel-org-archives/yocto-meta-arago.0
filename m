Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 73AD452995
	for <meta-arago@arago-project.org>;
	Fri, 28 Jun 2019 21:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3325940BB6;
	Fri, 28 Jun 2019 21:31:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sxMpuOOer9G1; Fri, 28 Jun 2019 21:31:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 69D2240BAC;
	Fri, 28 Jun 2019 21:31:54 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 254CF170A91;
	Fri, 28 Jun 2019 17:31:54 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 28 Jun 2019 17:31:52 -0400
Message-Id: <1561757513-47688-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/2] external-arm-toolchain: swap symlink for gcc-runtime packages
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
X-List-Received-Date: Fri, 28 Jun 2019 21:32:41 -0000

Native gcc already has ${libdir}/gcc/${TARGET_SYS} and expects gcc-runtime to be there.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../meta/external-arm-toolchain.bbappend           | 36 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
index af9d6cd..a5d6329 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
@@ -8,8 +8,9 @@ do_install_append() {
 
 	if [ ${EAT_TARGET_SYS} != ${ORIG_TARGET_SYS} ]; then
 		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/${ORIG_TARGET_SYS}
-		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/gcc/${ORIG_TARGET_SYS}
 		ln -sf ${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${ORIG_TARGET_SYS}
+		mv ${D}${libdir}/gcc/${EAT_TARGET_SYS} ${D}${libdir}/gcc/${ORIG_TARGET_SYS}
+		ln -sf ${ORIG_TARGET_SYS} ${D}${libdir}/gcc/${EAT_TARGET_SYS}
 	fi
 
 	ln -sf libatomic.so.1 ${D}${libdir}/libatomic.so
@@ -22,6 +23,35 @@ do_install_append() {
 	ln -sf libgfortran.so.5 ${D}${libdir}/libgfortran.so
 }
 
-FILES_libgomp-dev += "\
-    ${libdir}/gcc/${ORIG_TARGET_SYS} \
+FILES_libgcc-dev += "\
+    ${libdir}/gcc/${TARGET_SYS} \
+"
+
+FILES_libgfortran-dev = "\
+    ${libdir}/libgfortran*.so \
+    ${libdir}/libgfortran.spec \
+    ${libdir}/libgfortran.la \
+    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/libgfortranbegin.* \
+    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/libcaf_single* \
+    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/finclude/ \
+"
+
+FILES_libssp-dev = "\
+    ${libdir}/libssp*.so \
+    ${libdir}/libssp*_nonshared.a \
+    ${libdir}/libssp*.la \
+    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/ssp \
+"
+
+FILES_libquadmath-dev = "\
+    ${libdir}/libquadmath*.so \
+    ${libdir}/libquadmath.la \
+    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/quadmath* \
+"
+
+FILES_libgomp-dev = "\
+    ${libdir}/libgomp*${SOLIBSDEV} \
+    ${libdir}/libgomp*.la \
+    ${libdir}/libgomp.spec \
+    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/omp.h \
 "
-- 
2.7.4


