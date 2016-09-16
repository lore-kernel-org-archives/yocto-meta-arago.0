Return-Path: <me@uda0271916>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 7DBF952007
	for <meta-arago@arago-project.org>;
	Fri, 16 Sep 2016 22:07:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8GM7EiC031137
	for <meta-arago@arago-project.org>; Fri, 16 Sep 2016 17:07:14 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8GM7EM9006398
	for <meta-arago@arago-project.org>; Fri, 16 Sep 2016 17:07:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Sep 2016 17:07:13 -0500
Received: from uda0271916 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8GM7D6C011131;
	Fri, 16 Sep 2016 17:07:14 -0500
Received: from a0271916local by uda0271916 with local (Exim 4.82)
	(envelope-from <me@uda0271916>)	id 1bl1Ht-00018a-LC; Fri, 16 Sep 2016
	17:07:13 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Fri, 16 Sep 2016 17:06:48 -0500
Message-ID: <1474063608-3969-1-git-send-email-g-tammana@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-gc320-tests: add recipe for gc320 tests
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
X-List-Received-Date: Fri, 16 Sep 2016 22:07:16 -0000
Content-Type: text/plain

Samples tests for GC320 chipset in TI SoCs.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb     | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb

diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
new file mode 100644
index 0000000..ef0b6c0
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Test application for GC320 2D API"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=22a001855467f373c47f45de5330e3c9"
+
+DEPENDS = "ti-gc320-libs"
+
+BRANCH = "ti-${PV}"
+
+SRC_URI = "git://git.ti.com/graphics/ti-gc320-test.git;protocol=git;branch=${BRANCH}"
+SRCREV = "d8df0699308179b20d4a0ce69972db92eca914af"
+PR = "r1"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += "AQROOT=${S}/tests/src -f makefile.linux TOOLCHAIN_PATH=${TOOLCHAIN_PATH} CROSS_COMPILE=${TARGET_PREFIX} ARCH_TYPE=${TARGET_ARCH} CPU_TYPE=cortex-a15 VIVANTE_SDK_INC=${S}/sdk/include VIVANTE_SDK_LIB=${STAGING_DIR_TARGET}/usr/lib DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} LIBDIR=${libdir} SDK_DIR=${S}/build/tests/ EGL_API_FB=1"
+
+do_install() {
+	cd ${S}/tests/src/test/hal/common/UnitTest
+    oe_runmake install
+	cd ${S}/tests/src/test/hal/common/UnitTest/galRunTest2
+	oe_runmake install
+
+	install -d ${D}${bindir}/GC320/tests/unit_test/
+
+	for file in ${S}/build/tests/samples/hal/unit_test/*; do
+		install -m 755 $file ${D}${bindir}/GC320/tests/unit_test/
+	done
+}
+
+INSANE_SKIP_${PN} += "ldflags"
-- 
1.9.1


