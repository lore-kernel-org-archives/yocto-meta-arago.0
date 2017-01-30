Return-Path: <g-tammana@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id CEC4652A1B
	for <meta-arago@arago-project.org>;
	Mon, 30 Jan 2017 16:58:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v0UGvxvq026472
	for <meta-arago@arago-project.org>; Mon, 30 Jan 2017 10:57:59 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v0UGvsV5007520
	for <meta-arago@arago-project.org>; Mon, 30 Jan 2017 10:57:54 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 30 Jan 2017 10:57:53 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v0UGvseg002598;	Mon, 30 Jan 2017 10:57:54 -0600
Received: from uda0271916b.am.dhcp.ti.com (uda0271916b.am.dhcp.ti.com
	[128.247.77.97])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with
	ESMTP id v0UGvs300477;	Mon, 30 Jan 2017 10:57:54 -0600 (CST)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Mon, 30 Jan 2017 10:57:59 -0600
Message-ID: <1485795479-11561-1-git-send-email-g-tammana@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ti-gc320-tests: Update SRCREV to add more tests
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
X-List-Received-Date: Mon, 30 Jan 2017 16:58:10 -0000
Content-Type: text/plain

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb                 | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
index ef0b6c0..4bbcb18 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -8,16 +8,18 @@ DEPENDS = "ti-gc320-libs"
 BRANCH = "ti-${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/ti-gc320-test.git;protocol=git;branch=${BRANCH}"
-SRCREV = "d8df0699308179b20d4a0ce69972db92eca914af"
-PR = "r1"
+SRCREV = "53207f8e360a3336276b62066a1d8a9e923de17e"
+PR = "r2"
 
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += "AQROOT=${S}/tests/src -f makefile.linux TOOLCHAIN_PATH=${TOOLCHAIN_PATH} CROSS_COMPILE=${TARGET_PREFIX} ARCH_TYPE=${TARGET_ARCH} CPU_TYPE=cortex-a15 VIVANTE_SDK_INC=${S}/sdk/include VIVANTE_SDK_LIB=${STAGING_DIR_TARGET}/usr/lib DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} LIBDIR=${libdir} SDK_DIR=${S}/build/tests/ EGL_API_FB=1"
 
 do_install() {
-	cd ${S}/tests/src/test/hal/common/UnitTest
-    oe_runmake install
+	cd ${S}/tests/src/test/hal/common/UnitTest/galUtil
+	oe_runmake install
+	cd ${S}/tests/src/test/hal/common/UnitTest/units/gal2D/clear
+	oe_runmake install
 	cd ${S}/tests/src/test/hal/common/UnitTest/galRunTest2
 	oe_runmake install
 
-- 
2.7.4


