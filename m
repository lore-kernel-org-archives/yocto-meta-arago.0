Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 735E1529CE
	for <meta-arago@arago-project.org>;
	Tue, 26 Jun 2018 21:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 664CD20BD9;
	Tue, 26 Jun 2018 21:08:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xKGAFl5xTGHq; Tue, 26 Jun 2018 21:08:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 395CC20174;
	Tue, 26 Jun 2018 21:08:00 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id ACFC11634C4;
	Tue, 26 Jun 2018 17:07:59 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 26 Jun 2018 17:07:56 -0400
Message-Id: <1530047276-8874-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] external-linaro-sdk-toolchain: add support for aarch64
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
X-List-Received-Date: Tue, 26 Jun 2018 21:08:07 -0000

Use TRANSLATED_TARGET_ARCH and not hardcode "arm".

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../meta/external-linaro-sdk-toolchain.bb          | 70 ++++++++++------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
index de6fd57..acb2183 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
@@ -14,20 +14,20 @@ EXCLUDE_FROM_SHLIBS = "1"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-INSANE_SKIP_gcc-cross-canadian-arm = "dev-so staticdev file-rdeps"
-INSANE_SKIP_gdb-cross-canadian-arm = "dev-so file-rdeps"
-INSANE_SKIP_binutils-cross-canadian-arm = "dev-so file-rdeps"
+INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps"
+INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
+INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
 
 PROVIDES = "\
-	gcc-cross-canadian-arm \
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'gdb-cross-canadian-arm', '', d)} \
-	binutils-cross-canadian-arm \
+	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', '', d)} \
+	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
 "
 
 PACKAGES = "\
-	gcc-cross-canadian-arm \
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'gdb-cross-canadian-arm', '', d)} \
-	binutils-cross-canadian-arm \
+	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', '', d)} \
+	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
 "
 
 # Don't need the extra target triplet in the new SDK dir structure
@@ -37,15 +37,7 @@ libexecdir = "${exec_prefix}/libexec"
 datadir = "${exec_prefix}/share"
 gcclibdir = "${libdir}/gcc"
 
-# New Linaro toolchain misses these binaries, comment out for now
-#	${prefix}/${ELT_TARGET_SYS}/bin/cpp
-#	${prefix}/${ELT_TARGET_SYS}/bin/cc
-#	${prefix}/${ELT_TARGET_SYS}/bin/g++
-#	${prefix}/${ELT_TARGET_SYS}/bin/c++
-#	${prefix}/${ELT_TARGET_SYS}/bin/gcov
-#	${prefix}/${ELT_TARGET_SYS}/bin/gcc*
-
-FILES_gcc-cross-canadian-arm = "\
+FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
 	${prefix}/${ELT_TARGET_SYS}/lib/libstdc++.* \
 	${prefix}/${ELT_TARGET_SYS}/lib/libgcc_s.* \
 	${prefix}/${ELT_TARGET_SYS}/lib/libsupc++.* \
@@ -57,7 +49,7 @@ FILES_gcc-cross-canadian-arm = "\
 	${libexecdir}/* \
 "
 
-FILES_gdb-cross-canadian-arm = "\
+FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
 	${bindir}/${TARGET_PREFIX}gdb \
 	${bindir}/${TARGET_PREFIX}gdbtui \
 	${datadir}/gdb/* \
@@ -65,7 +57,7 @@ FILES_gdb-cross-canadian-arm = "\
 	${datadir}/man/man1/${TARGET_PREFIX}* \
 "
 
-FILES_binutils-cross-canadian-arm = "\
+FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
 	${prefix}/${ELT_TARGET_SYS}/bin/ld* \
 	${prefix}/${ELT_TARGET_SYS}/bin/objcopy \
 	${prefix}/${ELT_TARGET_SYS}/bin/strip \
@@ -91,19 +83,22 @@ FILES_binutils-cross-canadian-arm = "\
 	${bindir}/${TARGET_PREFIX}size \
 "
 
-DESCRIPTION_gcc-cross-canadian-arm = "The GNU cc and gcc C compilers"
-DESCRIPTION_gdb-cross-canadian-arm = "gdb - GNU debugger"
-DESCRIPTION_binutils-cross-canadian-arm = "A GNU collection of binary utilities"
+DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc and gcc C compilers"
+DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU debugger"
+DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU collection of binary utilities"
 
 #LICENSE = "${ARG_LIC_LIBC}"
-#LICENSE_gcc-cross-canadian-arm = "${ARG_LIC_GCC}"
-#LICENSE_gdb-cross-canadian-arm = "${ARG_LIC_GDB}"
-#LICENSE_binutils-cross-canadian-arm = "${ARG_LIC_BFD}"
+#LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ARG_LIC_GCC}"
+#LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ARG_LIC_GDB}"
+#LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ARG_LIC_BFD}"
 
 PKGV = "${ELT_VER_MAIN}"
-PKGV_gcc-cross-canadian-arm = "${ELT_VER_GCC}"
-PKGV_gdb-cross-canadian-arm = "${ELT_VER_GDB}"
-PKGV_binutils-cross-canadian-arm = "${ELT_VER_BFD}"
+PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ELT_VER_GCC}"
+PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ELT_VER_GDB}"
+PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ELT_VER_BFD}"
+
+LIBDIR = "lib"
+LIBDIR_aarch64 = "lib64"
 
 do_install() {
 	install -d ${D}${prefix}/${ELT_TARGET_SYS}/bin
@@ -112,21 +107,20 @@ do_install() {
 	install -d ${D}${libdir}
 	install -d ${D}${prefix}/${ELT_TARGET_SYS}/lib/ldscripts
 	install -d ${D}${libexecdir}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/gdb', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/info', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/man/man1', '', d)}
+	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/gdb', '', d)}
+	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/info', '', d)}
+	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/man/man1', '', d)}
 	install -d ${D}${gcclibdir}/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include
 
-#	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/bin/{c++,g++,gcc*} ${D}${prefix}/${ELT_TARGET_SYS}/bin
-	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/lib/{libstdc++.*,libgcc_s.*,libsupc++.*} ${D}${prefix}/${ELT_TARGET_SYS}/lib
+	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/${LIBDIR}/{libstdc++.*,libgcc_s.*,libsupc++.*} ${D}${prefix}/${ELT_TARGET_SYS}/lib
 	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/* ${D}${gcclibdir}/${ELT_TARGET_SYS}/${ELT_VER_GCC}
 	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gcov,gcc*,g++,cpp} ${D}${bindir}
 	cp -a ${TOOLCHAIN_PATH}/libexec/* ${D}${libexecdir}
 
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/gdb/* ${D}${datadir}/gdb/', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/info/* ${D}${datadir}/info/', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/man/man1/${TARGET_PREFIX}* ${D}${datadir}/man/man1/', '', d)}
+	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}', '', d)}
+	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/gdb/* ${D}${datadir}/gdb/', '', d)}
+	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/info/* ${D}${datadir}/info/', '', d)}
+	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/man/man1/${TARGET_PREFIX}* ${D}${datadir}/man/man1/', '', d)}
 
 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/bin/{ld*,objcopy,strip,nm,ranlib,as,ar,objdump} ${D}${prefix}/${ELT_TARGET_SYS}/bin
 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}/${ELT_TARGET_SYS}/lib/ldscripts
-- 
2.7.4


