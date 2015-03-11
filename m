Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 1D733529F8
	for <meta-arago@arago-project.org>;
	Wed, 11 Mar 2015 17:39:20 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NL2008P96D6T1H0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 Mar 2015 12:39:07 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ReEn0Opq c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8 a=HihYlcsHAAAA:8	a=n03p9V2yo-4l__NJcRgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4551C200EB;	Wed,
	11 Mar 2015 13:39:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 Mar 2015 13:39:06 -0400
Message-id: <1426095546-18262-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH v3] ltp-ddt: add version 1.0.0
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
X-List-Received-Date: Wed, 11 Mar 2015 17:39:20 -0000

From: Carlos Hernandez <ceh@ti.com>

Latest ltp release was recently merged to ltp-ddt and there is a new way
to configure and compile ltp-ddt.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v3 changes:
* Sync up with mainline meta-oe
* Move to meta-arago-extras
* Switch from linaro-pm-qa-utils to mainline pm-qa
* Drop PR, will set in meta-arago-distro along with AUTOREV
* Unify DESTDIR and KERNEL_CC into EXTRA_OEMAKE
* Re-add packaging share dir into datadir

 .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
new file mode 100644
index 0000000..e7907cc
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -0,0 +1,86 @@
+SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
+HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+PROVIDES += "ltp"
+DEPENDS += "zip-native virtual/kernel alsa-lib"
+
+RDEPENDS_${PN} += "pm-qa serialcheck"
+
+inherit autotools module-base kernel-module-split
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "eef6281052f36f6fe41059eadcf3b4a94f0d85ea"
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
+    KERNEL_CC='${KERNEL_CC}' \
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
+KERNEL_MODULES_META_PACKAGE = "${PN}"
+
+kmoddir = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"
+
+# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure call.
+# we explicitly force regeneration of that directory and pass configure options.
+do_configure_append() {
+    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS})
+}
+
+do_compile_append () {
+    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+    oe_runmake modules
+}
+
+do_install() {
+    oe_runmake install
+    install -d ${D}${datadir}
+    install -d ${D}${kmoddir}
+    cp -a ${D}${LTPROOT}/share/* ${D}${datadir}
+    rm -rf ${D}${LTPROOT}/share/
+    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
+}
+
+# do_make_scripts should be a separate task for the lock to work
+addtask make_scripts before do_compile
+do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
+do_make_scripts[deptask] = "do_populate_sysroot"
-- 
2.2.0


