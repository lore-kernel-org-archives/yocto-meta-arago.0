Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 76676529F8
	for <meta-arago@arago-project.org>;
	Thu, 11 Jun 2015 21:24:25 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NPS00GAJU3PDG00@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 11 Jun 2015 16:23:59 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=S6gku9YP c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=XAFQembCKUMA:10
	a=sozttTNsAAAA:8	a=rBuT45v6VCjeuUEH7rIA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 087BF161A9A;	Thu,
	11 Jun 2015 17:23:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 11 Jun 2015 17:23:48 -0400
Message-id: <1434057828-14132-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] gcc-linaro, external-linaro-toolchain: adjust C++ header file locations
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
X-List-Received-Date: Thu, 11 Jun 2015 21:24:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Target compiler is being built from sources, while the rest of the toolchain
pieces, like runtimes and header files, are picked up from a prebuilt Linaro
release, which uses slightly different paths for C++ headers.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bbappend       | 5 ++++-
 .../recipes-core/meta/external-linaro-toolchain.bbappend             | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bbappend b/meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bbappend
index 91db51a..d86c0d9 100644
--- a/meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bbappend
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bbappend
@@ -1,4 +1,7 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
+
+EXTRA_OECONF_PATHS_remove = "--with-gxx-include-dir=${includedir}/c++/"
+EXTRA_OECONF_PATHS += "--with-gxx-include-dir=/include/c++/${BINV}/"
 
 FILES_${PN} = "\
   ${bindir}/${TARGET_PREFIX}gcc* \
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index de4c43c..2d04861 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -10,7 +10,7 @@ INSANE_SKIP_libitm += "ldflags textrel"
 ALLOW_EMPTY_${PN}-utils = "1"
 ALLOW_EMPTY_ldd = "1"
 
-PR_append = "-arago9"
+PR_append = "-arago10"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
@@ -109,6 +109,7 @@ FILES_libgcc-dev += " \
 do_install_append() {
 	install -d ${D}/include
 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/* ${D}/include
+	ln -sf ${ELT_TARGET_SYS} ${D}/include/c++/${ELT_VER_GCC}/${TARGET_SYS}
 
 	install -d ${D}/${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/
 	cp -a ${TOOLCHAIN_PATH}/${base_libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/*.o ${D}/${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/
-- 
2.2.0


