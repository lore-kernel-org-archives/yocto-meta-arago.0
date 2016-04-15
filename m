Return-Path: <a0869574local@uda0869574b>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 05DE85296D
	for <meta-arago@arago-project.org>;
	Fri, 15 Apr 2016 19:14:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3FJERLD030612
	for <meta-arago@arago-project.org>; Fri, 15 Apr 2016 14:14:27 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3FJERrd004175
	for <meta-arago@arago-project.org>; Fri, 15 Apr 2016 14:14:27 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 15 Apr 2016 14:14:27 -0500
Received: from uda0869574b (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3FJERF8028278;
	Fri, 15 Apr 2016 14:14:27 -0500
Received: from a0869574local by uda0869574b with local (Exim 4.82)
	(envelope-from <a0869574local@uda0869574b>)	id 1ar9CE-0008DE-Od;
	Fri, 15 Apr 2016 15:14:26 -0400
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Apr 2016 15:14:19 -0400
Message-ID: <1460747660-31535-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master/fido][PATCH 1/2] libarch: made libarch into a RTSC package.
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
X-List-Received-Date: Fri, 15 Apr 2016 19:14:28 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb | 4 ++--
 meta-arago-extras/recipes-ti/libarch/libarch.inc             | 6 +++---
 meta-arago-extras/recipes-ti/libarch/libarch_git.bb          | 9 ++-------
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb b/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
index 62a09af..8ea5b65 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
@@ -11,8 +11,8 @@ export LIBARCH_DIR    = "${LIBARCH_INSTALL_DIR}"
 export TARGET_ROOTDIR = "${STAGING_DIR_TARGET}"
 
 do_compile() {
-    make examples TARGET=${TARGET} LIBOS=LIB_OPENCL
-
+    cd examples
+    make TARGET=${TARGET} LIBOS=LIB_OPENCL
     # Remove object files before installing so that the binaries are not present
     find . -name "*.obj" -type f -delete
     find . -name "*.o" -type f -delete
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch.inc b/meta-arago-extras/recipes-ti/libarch/libarch.inc
index 83e147c..438e428 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch.inc
+++ b/meta-arago-extras/recipes-ti/libarch/libarch.inc
@@ -2,15 +2,15 @@ HOMEPAGE = "https://git.ti.com/library-architecture/libarch"
 LICENSE = "BSD-3-Clause"
 
 PV = "1_0_0_0"
-INC_PR = "r0"
+INC_PR = "r1"
 
 require recipes-ti/includes/arago-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
 BRANCH = "master"
-LIC_FILES_CHKSUM = "file://docs/LibArch_1.0.0_manifest.html;md5=bb48cacb8827ec8d8e5a94c4f2425ee3"
+LIC_FILES_CHKSUM = "file://src/ti/libarch/docs/LibArch_1.0.0_manifest.html;md5=bb48cacb8827ec8d8e5a94c4f2425ee3"
 SRC_URI = "git://git.ti.com/library-architecture/libarch.git;protocol=git;branch=${BRANCH}"
-SRCREV = "c4bc65775bdb6bd8574e43d3cb7148c6bbdc8de6"
+SRCREV = "4b2f1c5d5b6b9f3d021e498120a914456fb9eba1"
 
 COMPATIBLE_MACHINE = "k2hk-evm|am57xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch_git.bb b/meta-arago-extras/recipes-ti/libarch/libarch_git.bb
index 18c998a..f125c4a 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch_git.bb
+++ b/meta-arago-extras/recipes-ti/libarch/libarch_git.bb
@@ -5,17 +5,12 @@ include libarch.inc
 PR = "${INC_PR}.0"
 
 do_compile() {
-    make lib TARGET=${TARGET} LIBOS=LIB_OPENCL
-    make docs
-
-    # Delete .obj files before installing
-    rm src/*.obj
+    make -f build/Makefile TARGET=${TARGET} LIBOS=LIB_OPENCL
 }
 
 do_install() {
     install -d ${D}${LIBARCH_INSTALL_DIR_RECIPE}
-    cp -r docs lib include src ${D}${LIBARCH_INSTALL_DIR_RECIPE}
-    cp Makefile ${D}${LIBARCH_INSTALL_DIR_RECIPE}
+    cp -r exports/libarch_*/* ${D}${LIBARCH_INSTALL_DIR_RECIPE}
 }
 
 FILES_${PN}-dev += "${LIBARCH_INSTALL_DIR_RECIPE}"
-- 
1.9.1


