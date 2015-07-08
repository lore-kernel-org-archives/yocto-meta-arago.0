Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id E649B5299C
	for <meta-arago@arago-project.org>;
	Wed,  8 Jul 2015 22:33:27 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NR6001MVXAZJJ60@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 08 Jul 2015 17:33:00 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=KZwvylsD c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=s1wRp-aPvzp7AgINL_AA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D8EED161AC2;	Wed,
	8 Jul 2015 18:32:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 08 Jul 2015 18:32:59 -0400
Message-id: <1436394779-9622-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] external-linaro-sdk-toolchain: adjust for dropping short compiler binaries
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
X-List-Received-Date: Wed, 08 Jul 2015 22:33:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-sdk-toolchain.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
index cd24553..32e93fc 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
@@ -2,7 +2,7 @@ inherit cross-canadian
 
 require external-linaro-bfd-version.inc
 
-PR = "r4"
+PR = "r5"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_DEFAULT_DEPS = "1"
@@ -39,13 +39,15 @@ datadir = "${exec_prefix}/share"
 
 gcclibdir = "${libdir}/gcc"
 
+# New Linaro toolchain misses these binaries, comment out for now
+#	${prefix}/${ELT_TARGET_SYS}/bin/cpp
+#	${prefix}/${ELT_TARGET_SYS}/bin/cc
+#	${prefix}/${ELT_TARGET_SYS}/bin/g++
+#	${prefix}/${ELT_TARGET_SYS}/bin/c++
+#	${prefix}/${ELT_TARGET_SYS}/bin/gcov
+#	${prefix}/${ELT_TARGET_SYS}/bin/gcc*
+
 FILES_gcc-cross-canadian-arm = "\
-	${prefix}/${ELT_TARGET_SYS}/bin/cpp \
-	${prefix}/${ELT_TARGET_SYS}/bin/cc \
-	${prefix}/${ELT_TARGET_SYS}/bin/g++ \
-	${prefix}/${ELT_TARGET_SYS}/bin/c++ \
-	${prefix}/${ELT_TARGET_SYS}/bin/gcov \
-	${prefix}/${ELT_TARGET_SYS}/bin/gcc* \
 	${prefix}/${ELT_TARGET_SYS}/lib/libstdc++.* \
 	${prefix}/${ELT_TARGET_SYS}/lib/libgcc_s.* \
 	${prefix}/${ELT_TARGET_SYS}/lib/libsupc++.* \
@@ -117,7 +119,7 @@ do_install() {
 	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/man/man1', '', d)}
 	install -d ${D}${gcclibdir}/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include
 
-	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/bin/{c++,g++,gcc*} ${D}${prefix}/${ELT_TARGET_SYS}/bin
+#	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/bin/{c++,g++,gcc*} ${D}${prefix}/${ELT_TARGET_SYS}/bin
 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/lib/{libstdc++.*,libgcc_s.*,libsupc++.*} ${D}${prefix}/${ELT_TARGET_SYS}/lib
 	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/* ${D}${gcclibdir}/${ELT_TARGET_SYS}/${ELT_VER_GCC}
 	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gcov,gcc*,g++,cpp} ${D}${bindir}
-- 
2.2.0


