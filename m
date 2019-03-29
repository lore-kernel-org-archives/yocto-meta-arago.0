Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B30EC529AE
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2019 16:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1E9AB40BA9;
	Fri, 29 Mar 2019 16:58:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mJD48hws9H8X; Fri, 29 Mar 2019 16:58:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 07D6540A18;
	Fri, 29 Mar 2019 16:58:49 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1C08716D69E;
	Fri, 29 Mar 2019 12:58:49 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 29 Mar 2019 12:58:44 -0400
Message-Id: <1553878725-54332-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/2] external-arm-toolchain: drop overlay fixes for bins, libs, stubs and headers
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
X-List-Received-Date: Fri, 29 Mar 2019 16:59:07 -0000

This reverts commit 3a57a88ed12fd22c9f3a408edac24d13b69bcba4.
---
 .../meta/external-arm-toolchain.bbappend           | 29 ----------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
deleted file mode 100644
index ab75476..0000000
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
+++ /dev/null
@@ -1,29 +0,0 @@
-PKGV = "${EAT_VER_LIBC}"
-
-RDEPENDS_ldd = "bash"
-RDEPENDS_tzcode = "bash"
-
-BINV = "${EAT_VER_GCC}"
-TARGET_SYS = "${EAT_TARGET_SYS}"
-
-do_install_append() {
-	install -d ${D}${bindir}
-	install -d ${D}${sbindir}
-	install -d ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
-	install -d ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}
-
-	cp ${CP_ARGS} -H ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/bin/* ${D}${bindir}
-	cp ${CP_ARGS} -H ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/sbin/* ${D}${sbindir}
-	rm -rf ${D}${bindir}/gdbserver
-	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/tzselect
-	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/ldd
-
-	cp ${CP_ARGS} -H ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} -H ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} -H ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-
-	cp ${CP_ARGS} -H ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} -H ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} -H ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgfortranbegin.* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/ || true
-	cp ${CP_ARGS} -H ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libcaf_single* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-}
-- 
2.7.4


