Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A37995298B
	for <meta-arago@arago-project.org>;
	Tue, 21 Jan 2020 21:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E749140AB5;
	Tue, 21 Jan 2020 21:13:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dOnmVZ9ah8ge; Tue, 21 Jan 2020 21:13:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C87DD4087B;
	Tue, 21 Jan 2020 21:13:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 681C71743A8;
	Tue, 21 Jan 2020 16:13:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 21 Jan 2020 16:13:27 -0500
Message-Id: <1579641208-15555-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579641208-15555-1-git-send-email-denis@denix.org>
References: <1579641208-15555-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 2/3] external-arm-toolchain: update to accomodate latest upstream changes
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
X-List-Received-Date: Tue, 21 Jan 2020 21:15:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-arm-toolchain.bbappend  | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
index b88c337..5bf8090 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
@@ -26,9 +26,9 @@ do_install_append() {
 	ln -sf libgfortran.so.5 ${D}${libdir}/libgfortran.so
 }
 
-FILES_libgcc-dev += "\
-    ${libdir}/gcc/${TARGET_SYS} \
-"
+# Below FILES_* overrides are due to TARGET_SYS -> ORIG_TARGET_SYS move in ${libdir}/gcc
+# to enable native compile on the target
+FILES_libgcov-staticdev = "${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/libgcov.a"
 
 FILES_libgfortran-dev = "\
     ${libdir}/libgfortran*.so \
@@ -39,6 +39,18 @@ FILES_libgfortran-dev = "\
     ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/finclude/ \
 "
 
+FILES_gcc-sanitizers = "${libdir}/*.spec ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/sanitizer/*.h"
+
+# This is provided by gcc:
+#    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include
+FILES_libgcc-dev = "\
+    ${base_libdir}/libgcc*.so \
+    ${@oe.utils.conditional('BASETARGET_SYS', '${ORIG_TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
+    ${libdir}/${TARGET_SYS}/${BINV}* \
+    ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
+    ${libdir}/gcc/${TARGET_SYS} \
+"
+
 FILES_libssp-dev = "\
     ${libdir}/libssp*.so \
     ${libdir}/libssp*_nonshared.a \
-- 
2.7.4


