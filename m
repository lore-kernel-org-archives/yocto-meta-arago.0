Return-Path: <a0850405@a0850405-off1>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C8BAF52A31
	for <meta-arago@arago-project.org>;
	Tue, 10 Mar 2015 20:49:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2AKnIi2001998
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2015 15:49:18 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2AKnG9J028243
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2015 15:49:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 15:49:16 -0500
Received: from a0850405-off1 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2AKnGPU027405;
	Tue, 10 Mar 2015 15:49:16 -0500
Received: from a0850405 by a0850405-off1 with local (Exim 4.82)	(envelope-from
	<a0850405@a0850405-off1>)	id 1YVR5X-0001ff-Vm;
	Tue, 10 Mar 2015 16:49:16 -0400
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Mar 2015 16:48:59 -0400
Message-ID: <1426020539-6389-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20150310161952.GB21244@edge>
References: <20150310161952.GB21244@edge>
MIME-Version: 1.0
Subject: [PATCH v2] recipes-devtools: New ltp-ddt_1.0.0 recipe
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
X-List-Received-Date: Tue, 10 Mar 2015 20:49:19 -0000
Content-Type: text/plain

Latest ltp release was recently merge to ltp-ddt and there is a new
way to configure and compile ltp-ddt.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
new file mode 100644
index 0000000..db66ed4
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -0,0 +1,84 @@
+SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
+HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+PROVIDES += "ltp"
+DEPENDS += "zip-native virtual/kernel alsa-lib"
+RDEPENDS_${PN} += "linaro-pm-qa-utils serialcheck"
+
+inherit autotools module-base kernel-module-split
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "eef6281052f36f6fe41059eadcf3b4a94f0d85ea"
+BRANCH ?= "master"
+PR = "r1-arago10+gitr${SRCPV}"
+
+SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
+          "
+
+S = "${WORKDIR}/git"
+
+LTPROOT = "/opt/ltp"
+
+EXTRA_OEMAKE_append = " \
+    prefix=${LTPROOT} \
+    CROSS_COMPILE=${HOST_PREFIX} \
+    SKIP_IDCHECK=1 \
+    KERNEL_INC=${STAGING_KERNEL_DIR} \
+    KERNEL_USR_INC=${STAGING_INCDIR} \
+    ALSA_INCPATH=${STAGING_INCDIR} \
+    ALSA_LIBPATH=${STAGING_LIBDIR} \
+    PLATFORM=${MACHINE} \
+    RANLIB=${RANLIB} \
+    KERNEL_PATH=${STAGING_KERNEL_DIR} \
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
+
+do_compile_append () {
+    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+    oe_runmake KERNEL_CC="${KERNEL_CC}" DESTDIR=${D} modules
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+    install -d ${D}${datadir}
+    install -d ${D}${kmoddir}
+    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
+}
+
+
+# do_make_scripts should be a separate task for the lock to work
+addtask make_scripts before do_compile
+do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
+do_make_scripts[deptask] = "do_populate_sysroot"
-- 
1.9.1


