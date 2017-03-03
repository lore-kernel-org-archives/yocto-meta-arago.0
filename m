Return-Path: <a0850405@a0850405-t7500>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id AFAFB529A0
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 19:17:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v23JH6sq013133
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 13:17:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488568626;
	bh=Syyj16N5srv46Y3JR8oVbyFLy+YqMfDO/XLSaZJMylc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YUP9377B/tpANPJ+oGcdu+YCNOCQAMyOf3sS/Xkh/nfM4YSLe5a2I+Q1tpCaMUu/j
	JrlExvxu9497NFbWwMgb9p+hV5fGrrxzdqEovTOcZ0Mw5MvV7JH2HiXIbDzXbF0KFQ
	jX7D0ISNyE6j55ztJ701Z1v8h2p90wTlsYtCFpXA=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23JH6M8029747
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 13:17:06 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Mar 2017 13:17:05 -0600
Received: from a0850405-T7500 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23JH64o009842;
	Fri, 3 Mar 2017 13:17:06 -0600
Received: from a0850405 by a0850405-T7500 with local (Exim 4.86_2)
	(envelope-from <a0850405@a0850405-t7500>)	id 1cjshK-000B7B-0a;
	Fri, 03 Mar 2017 14:17:02 -0500
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Mar 2017 14:16:52 -0500
Message-ID: <1488568612-42684-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488551149-39460-2-git-send-email-ceh@ti.com>
References: <1488551149-39460-2-git-send-email-ceh@ti.com>
MIME-Version: 1.0
Cc: yan-liu@ti.com
Subject: [PATCH 2/2 v2] ltp-ddt: update to latest ltp release 20170116
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
X-List-Received-Date: Fri, 03 Mar 2017 19:17:06 -0000
Content-Type: text/plain

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb   | 66 ----------------------
 .../recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb   | 66 ++++++++++++++++++++++
 2 files changed, 66 insertions(+), 66 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
deleted file mode 100644
index 3bb17c8f8535..000000000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
+++ /dev/null
@@ -1,66 +0,0 @@
-SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
-HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-PR = "r10"
-PV_append = "+git${SRCPV}"
-
-PROVIDES += "ltp"
-DEPENDS += "zip-native alsa-lib libaio"
-
-RDEPENDS_${PN} += "pm-qa serialcheck"
-
-inherit autotools-brokensep
-
-SRCREV = "429d12779e28e1997f656db19c5bf73edf9e9365"
-BRANCH ?= "master"
-
-SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-LTPROOT = "/opt/ltp"
-
-EXTRA_OEMAKE_append = " \
-    prefix=${LTPROOT} \
-    CROSS_COMPILE=${HOST_PREFIX} \
-    SKIP_IDCHECK=1 \
-    KERNEL_USR_INC=${STAGING_INCDIR} \
-    ALSA_INCPATH=${STAGING_INCDIR} \
-    ALSA_LIBPATH=${STAGING_LIBDIR} \
-    RANLIB=${RANLIB} \
-    DESTDIR=${D} \
-    CC='${CC}' \
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
-# The makefiles make excessive use of make -C and several include testcases.mk
-# which triggers a build of the syscall header. To reproduce, build ltp,
-# then delete the header, then "make -j XX" and watch regen.sh run multiple
-# times. Its easier to generate this once here instead.
-do_compile_prepend () {
-    ( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
-}
-
-do_install() {
-    oe_runmake install
-}
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
new file mode 100644
index 000000000000..2d78fa835c9f
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
@@ -0,0 +1,66 @@
+SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
+HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PR = "r11"
+PV_append = "+git${SRCPV}"
+
+PROVIDES += "ltp"
+DEPENDS += "zip-native alsa-lib libaio"
+
+RDEPENDS_${PN} += "pm-qa serialcheck"
+
+inherit autotools-brokensep
+
+SRCREV = "7b43afae8b931541388b0a7e6f65d7ceb6d01b3e"
+BRANCH ?= "master"
+
+SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+LTPROOT = "/opt/ltp"
+
+EXTRA_OEMAKE_append = " \
+    prefix=${LTPROOT} \
+    CROSS_COMPILE=${HOST_PREFIX} \
+    SKIP_IDCHECK=1 \
+    KERNEL_USR_INC=${STAGING_INCDIR} \
+    ALSA_INCPATH=${STAGING_INCDIR} \
+    ALSA_LIBPATH=${STAGING_LIBDIR} \
+    RANLIB=${RANLIB} \
+    DESTDIR=${D} \
+    CC='${CC}' \
+"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+FILES_${PN}-dbg += " \
+    ${LTPROOT}/.debug \
+    ${LTPROOT}/bin/.debug \
+    ${LTPROOT}/runtest/.debug \
+    ${LTPROOT}/testcases/bin/.debug \
+    ${LTPROOT}/testcases/bin/*/bin/.debug \
+    ${LTPROOT}/testcases/bin/*/test/.debug \
+    ${LTPROOT}/testcases/bin/ddt/.debug \
+    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
+    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
+    ${LTPROOT}/testcases/realtime/*/*/.debug \
+"
+
+FILES_${PN}-staticdev += "${LTPROOT}/lib"
+FILES_${PN} += "${LTPROOT}/*"
+
+# The makefiles make excessive use of make -C and several include testcases.mk
+# which triggers a build of the syscall header. To reproduce, build ltp,
+# then delete the header, then "make -j XX" and watch regen.sh run multiple
+# times. Its easier to generate this once here instead.
+do_compile_prepend () {
+    ( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
+}
+
+do_install() {
+    oe_runmake install
+}
-- 
2.7.4


