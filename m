Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7BAD15209B
	for <meta-arago@arago-project.org>;
	Thu, 16 Nov 2017 22:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2022D20BAC;
	Thu, 16 Nov 2017 22:52:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id c2FUmOV01bLk; Thu, 16 Nov 2017 22:52:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F416B20B9C;
	Thu, 16 Nov 2017 22:52:35 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 84F12162723;
	Thu, 16 Nov 2017 17:52:35 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 16 Nov 2017 17:52:34 -0500
Message-Id: <1510872754-49450-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] ltp-ddt: update to latest 20170929 base
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
X-List-Received-Date: Thu, 16 Nov 2017 22:52:38 -0000

Drop the do_compile_prepend function, because the upstream already fix
the parallel make race, we can check it here:
https://github.com/linux-test-project/ltp/commit/3f385652efe811fe7491474f8513baf44cf0a12d

Sync up with oe-core on DEPENDS/RDEPENDS/SKIP_*

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{ltp-ddt_20170116.bb => ltp-ddt_20170929.bb}   | 47 ++++++++++++++++------
 1 file changed, 34 insertions(+), 13 deletions(-)
 rename meta-arago-extras/recipes-devtools/ltp-ddt/{ltp-ddt_20170116.bb => ltp-ddt_20170929.bb} (61%)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
similarity index 61%
rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
rename to meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
index 245645d..0e591a4 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
@@ -4,17 +4,40 @@ SECTION = "console/utils"
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
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
@@ -50,17 +73,15 @@ FILES_${PN}-dbg += " \
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


