Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 33396529EA
	for <meta-arago@arago-project.org>;
	Thu, 25 Aug 2016 17:12:19 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OCH00KWU6GISQ60@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 25 Aug 2016 12:12:19 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=t7CeM3EgAAAA:8 a=HihYlcsHAAAA:8
	a=Dz2XzPb0fCRfJJ3s9AYA:9
Received: by 100.15.86.14 with SMTP id 33f6a851; Thu, 25 Aug 2016 17:12:18 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 46C7E161A44;	Thu, 25 Aug 2016 13:12:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 25 Aug 2016 13:12:15 -0400
Message-id: <1472145136-3811-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] ltp-ddt: remove old version
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
X-List-Received-Date: Thu, 25 Aug 2016 17:12:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ltp-ddt/ltp-Do-not-link-against-libfl.patch    | 31 -------
 .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      | 98 ----------------------
 2 files changed, 129 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch
deleted file mode 100644
index 3e4aa73..0000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5bda9c0af56869c6ff2c25d38ea087179c946bc6 Mon Sep 17 00:00:00 2001
-From: Chong Lu <Chong.Lu@windriver.com>
-Date: Tue, 11 Mar 2014 14:47:22 +0800
-Subject: [PATCH] ltp: Don't link against libfl
-
-We have already defined yywrap function in scan.l file. After this, we no longer need to
-link against libfl and so no longer get errors about undefined references to yylex.
-
-Upstream-status: Pending
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- pan/Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pan/Makefile b/pan/Makefile
-index 4cc6466..a4b575b 100644
---- a/pan/Makefile
-+++ b/pan/Makefile
-@@ -31,7 +31,7 @@ CPPFLAGS		+= -Wno-error
- 
- CPPFLAGS		+= -I$(abs_srcdir)
- 
--LDLIBS			+= -lm $(LEXLIB)
-+LDLIBS			+= -lm
- 
- LFLAGS			+= -l
- 
--- 
-1.7.9.5
-
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
deleted file mode 100644
index 873b1b7..0000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ /dev/null
@@ -1,98 +0,0 @@
-SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
-HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-PR = "r15"
-PV_append = "+git${SRCPV}"
-
-PROVIDES += "ltp"
-DEPENDS += "zip-native alsa-lib"
-
-RDEPENDS_${PN} += "pm-qa serialcheck"
-
-inherit autotools-brokensep module-base kernel-module-split
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRCREV = "bd7bc9eea597808d0b98616c657bfbf7fa7e8ee3"
-BRANCH ?= "master"
-
-SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-    file://ltp-Do-not-link-against-libfl.patch \
-"
-
-S = "${WORKDIR}/git"
-
-LTPROOT = "/opt/ltp"
-
-EXTRA_OEMAKE_append = " \
-    prefix=${LTPROOT} \
-    CROSS_COMPILE=${HOST_PREFIX} \
-    SKIP_IDCHECK=1 \
-    KERNEL_PATH=${STAGING_KERNEL_DIR} \
-    KERNEL_INC=${STAGING_KERNEL_DIR} \
-    KERNEL_USR_INC=${STAGING_INCDIR} \
-    ALSA_INCPATH=${STAGING_INCDIR} \
-    ALSA_LIBPATH=${STAGING_LIBDIR} \
-    PLATFORM=${MACHINE} \
-    RANLIB=${RANLIB} \
-    DESTDIR=${D} \
-    CC='${CC}' \
-    KERNEL_CC='${KERNEL_CC}' \
-    KERNEL_SRC=${STAGING_KERNEL_DIR} \
-"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-FILES_${PN}-dbg += " \
-    ${LTPROOT}/.debug \
-    ${LTPROOT}/bin/.debug \
-    ${LTPROOT}/runtest/.debug \
-    ${LTPROOT}/testcases/bin/.debug \
-    ${LTPROOT}/testcases/bin/*/bin/.debug \
-    ${LTPROOT}/testcases/bin/*/test/.debug \
-    ${LTPROOT}/testcases/bin/ddt/.debug \
-    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
-    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
-    ${LTPROOT}/testcases/realtime/*/*/.debug \
-"
-
-FILES_${PN}-staticdev += "${LTPROOT}/lib"
-FILES_${PN} += "${LTPROOT}/*"
-
-KERNEL_MODULES_META_PACKAGE = "${PN}"
-
-kmoddir = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"
-
-# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure call.
-# we explicitly force regeneration of that directory and pass configure options.
-do_configure_append() {
-    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS})
-}
-
-# The makefiles make excessive use of make -C and several include testcases.mk
-# which triggers a build of the syscall header. To reproduce, build ltp,
-# then delete the header, then "make -j XX" and watch regen.sh run multiple
-# times. Its easier to generate this once here instead.
-do_compile_prepend () {
-    ( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
-}
-
-do_compile_append () {
-    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-    oe_runmake modules
-}
-
-do_install() {
-    oe_runmake install
-    install -d ${D}${datadir}
-    install -d ${D}${kmoddir}
-    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir} || true
-}
-
-# do_make_scripts should be a separate task for the lock to work
-addtask make_scripts after do_patch before do_compile
-do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
-- 
2.7.4


