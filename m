Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id 97D3752A31
	for <meta-arago@arago-project.org>;
	Sat,  2 Jul 2016 20:55:57 +0000 (UTC)
Received: from vz-proxy-m004.mx.aol.com ([64.236.83.8])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O9P004ZTGSJ5V00@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Sat, 02 Jul 2016 15:55:42 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=Bcm0RCOkHTZ4We9DUxtllQ==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=kvuLnWNYtDR8xu-5sswA:9
Received: by 100.15.86.14 with SMTP id 7c2fd0e1; Sat, 02 Jul 2016 20:55:42 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 755341620A0;	Sat,  2 Jul 2016 16:55:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 02 Jul 2016 16:55:31 -0400
Message-id: <1467492931-1110-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] ltp-ddt: update to 20160510 and make platform-agnostic
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
X-List-Received-Date: Sat, 02 Jul 2016 20:55:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - removed remaining kernel vars

 .../recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb   | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
new file mode 100644
index 0000000..1b4d0ed
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
@@ -0,0 +1,66 @@
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


