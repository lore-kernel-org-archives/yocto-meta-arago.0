Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 81FD9529D4
	for <meta-arago@arago-project.org>;
	Sat, 18 Nov 2017 04:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8524220B64;
	Sat, 18 Nov 2017 04:35:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DrVtoEtcPwv2; Sat, 18 Nov 2017 04:35:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5EA5A20B4D;
	Sat, 18 Nov 2017 04:35:18 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id CDFFE162731;
	Fri, 17 Nov 2017 23:35:17 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 17 Nov 2017 23:35:17 -0500
Message-Id: <1510979717-84888-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH v2] ltp-ddt: update to latest 20170929 base
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
X-List-Received-Date: Sat, 18 Nov 2017 04:35:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Drop the do_compile_prepend function, because the upstream already fix
the parallel make race, we can check it here:
https://github.com/linux-test-project/ltp/commit/3f385652efe811fe7491474f8513baf44cf0a12d

Sync up with oe-core on DEPENDS/RDEPENDS/SKIP_*

Disable TI RPC (Transport-Independent RPC) due to missing dependency

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - disable TI RPC dependency

 .../0003-Add-knob-to-control-tirpc-support.patch   | 45 ++++++++++++++++++
 .../{ltp-ddt_20170116.bb => ltp-ddt_20170929.bb}   | 54 ++++++++++++++++------
 2 files changed, 85 insertions(+), 14 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0003-Add-knob-to-control-tirpc-support.patch
 rename meta-arago-extras/recipes-devtools/ltp-ddt/{ltp-ddt_20170116.bb => ltp-ddt_20170929.bb} (55%)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0003-Add-knob-to-control-tirpc-support.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0003-Add-knob-to-control-tirpc-support.patch
new file mode 100644
index 0000000..bf1176f
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0003-Add-knob-to-control-tirpc-support.patch
@@ -0,0 +1,45 @@
+From b193011da301b3d944e8fddcf4817513c31c5b88 Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fathi.boudra@linaro.org>
+Date: Thu, 7 Jan 2016 17:36:19 +0000
+Subject: [PATCH 03/32] Add knob to control tirpc support
+
+allow to disable tirpc. Helps to disable it at top level for eg. musl it
+does not yet work.
+
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index cc50397..9e2936b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -98,6 +98,13 @@ if test "x$with_python" = xyes; then
+ else
+     AC_SUBST([WITH_PYTHON],["no"])
+ fi
++
++# TI RPC
++AC_ARG_WITH([tirpc],
++  AC_HELP_STRING([--without-tirpc],
++    [without libtirpc support]),
++  [],[with_tirpc=yes],
++)
+ # END tools knobs
+ 
+ # Testsuites knobs
+@@ -169,7 +176,9 @@ LTP_CHECK_RENAMEAT2
+ LTP_CHECK_FALLOCATE
+ LTP_CHECK_SYSCALL_FCNTL
+ LTP_CHECK_SYSCALL_PERF_EVENT_OPEN
++if test "x$with_tirpc" = xyes; then
+ LTP_CHECK_TIRPC
++fi
+ LTP_CHECK_TEE
+ LTP_CHECK_SPLICE
+ LTP_CHECK_VMSPLICE
+-- 
+2.7.0
+
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
similarity index 55%
rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
rename to meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
index 245645d..6bf701b 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
@@ -4,25 +4,53 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r29"
+PR = "r0"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
-DEPENDS += "zip-native alsa-lib libaio"
+DEPENDS = "alsa-lib attr libaio libcap acl openssl zip-native"
 
-RDEPENDS_${PN} += "pm-qa serialcheck gawk perl python3-core"
+RDEPENDS_${PN} = "\
+    acl \
+    at \
+    attr \
+    bash \
+    cpio \
+    cronie \
+    curl \
+    e2fsprogs-mke2fs \
+    expect \
+    gawk \
+    gzip \
+    iproute2 \
+    ldd \
+    libaio \
+    logrotate \
+    perl \
+    pm-qa \
+    python-core \
+    serialcheck \
+    unzip \
+    util-linux \
+    which \
+"
 
 inherit autotools-brokensep
 
-SRCREV = "ea64df36bc1f411bdcd20bf4057206f9e0cb7e52"
+SRCREV = "feec63612a16bb48cd1da698ca794d25ff03bedc"
 BRANCH ?= "master"
 
-SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
+SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
+    file://0003-Add-knob-to-control-tirpc-support.patch \
+"
 
 S = "${WORKDIR}/git"
 
 LTPROOT = "/opt/ltp"
 
+# disable TI RPC (Transport-Independent RPC) due to missing dependency
+EXTRA_OECONF += " --without-tirpc"
+
 EXTRA_OEMAKE_append = " \
     prefix=${LTPROOT} \
     CROSS_COMPILE=${HOST_PREFIX} \
@@ -50,17 +78,15 @@ FILES_${PN}-dbg += " \
     ${LTPROOT}/testcases/realtime/*/*/.debug \
 "
 
-FILES_${PN}-staticdev += "${LTPROOT}/lib"
+FILES_${PN}-staticdev += "${LTPROOT}/lib ${LTPROOT}/lib/libmem.a ${LTPROOT}/testcases/data/nm01/lib.a"
 FILES_${PN} += "${LTPROOT}/*"
 
-# The makefiles make excessive use of make -C and several include testcases.mk
-# which triggers a build of the syscall header. To reproduce, build ltp,
-# then delete the header, then "make -j XX" and watch regen.sh run multiple
-# times. Its easier to generate this once here instead.
-do_compile_prepend () {
-    ( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
-}
-
 do_install() {
     oe_runmake install
 }
+
+# Avoid file dependency scans, as LTP checks for things that may or may not
+# exist on the running system.  For instance it has specific checks for
+# csh and ksh which are not typically part of OpenEmbedded systems (but
+# can be added via additional layers.)
+SKIP_FILEDEPS_${PN} = '1'
-- 
2.7.4


