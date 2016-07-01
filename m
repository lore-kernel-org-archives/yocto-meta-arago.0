Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id F3E82529A0
	for <meta-arago@arago-project.org>;
	Fri,  1 Jul 2016 17:29:45 +0000 (UTC)
Received: from vz-proxy-m008.mx.aol.com ([64.236.83.1])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O9N007Y5CKXO120@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 01 Jul 2016 12:29:32 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=IfeYs1eZmZ/JIJO4DN4ZPw==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=VIEj9xB_9w0MRSac3lwA:9
Received: by 100.15.86.14 with SMTP id 02312dee; Fri, 01 Jul 2016 17:29:31 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id E19431620A1;	Fri,  1 Jul 2016 13:29:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 01 Jul 2016 13:29:13 -0400
Message-id: <1467394153-24953-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1467394153-24953-1-git-send-email-denis@denix.org>
References: <1467394153-24953-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] ltp-ddt: update to 20160510 and make platform-agnostic
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
X-List-Received-Date: Fri, 01 Jul 2016 17:29:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb   | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
new file mode 100644
index 0000000..0d85e20
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
@@ -0,0 +1,70 @@
+SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
+HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PR = "r0"
+PV_append = "+git${SRCPV}"
+
+PROVIDES += "ltp"
+DEPENDS += "zip-native alsa-lib"
+
+RDEPENDS_${PN} += "pm-qa serialcheck"
+
+inherit autotools-brokensep
+
+SRCREV = "64fd73129d6ce6b6c1f43388a912483cd52d489b"
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
+    KERNEL_PATH=${STAGING_KERNEL_DIR} \
+    KERNEL_INC=${STAGING_KERNEL_DIR} \
+    KERNEL_USR_INC=${STAGING_INCDIR} \
+    ALSA_INCPATH=${STAGING_INCDIR} \
+    ALSA_LIBPATH=${STAGING_LIBDIR} \
+    PLATFORM=${MACHINE} \
+    RANLIB=${RANLIB} \
+    DESTDIR=${D} \
+    CC='${CC}' \
+    KERNEL_SRC=${STAGING_KERNEL_DIR} \
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


