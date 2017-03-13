Return-Path: <manishalocal@uda0393239>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 416FE52A12
	for <meta-arago@arago-project.org>;
	Mon, 13 Mar 2017 18:57:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2DIvxg6007461
	for <meta-arago@arago-project.org>; Mon, 13 Mar 2017 13:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489431479;
	bh=4IJy27eReE0aRNFy9aixKHA6+fw4sMo9ZjPuGAtOWlw=;
	h=From:To:CC:Subject:Date;
	b=RUbDAQgzslu85gNB63Of9ZjNqLb/7DsY3E9Grje9suI5jIk1OJVarn3FZduJWdDlx
	OY380yiW3MEf1MPGhk0bW24ttQ/gROOOcVB3LRei4R/s5eITh4rnf1DiouJWzwcGcA
	UqZD9VNTHAAOTFegFVaTiyaRdj1wtN7XOI9g6VLc=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2DIvwrv001760
	for <meta-arago@arago-project.org>; Mon, 13 Mar 2017 13:57:59 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 13:57:58 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2DIvw7p023832;
	Mon, 13 Mar 2017 13:57:58 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.76)
	(envelope-from <manishalocal@uda0393239>)	id 1cnVAM-0003N2-HP;
	Mon, 13 Mar 2017 13:57:58 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Mar 2017 13:57:55 -0500
Message-ID: <20170313185755.12918-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [master/morty][PATCH] recipes-multimedia : video-graphics-test : new demo
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
X-List-Received-Date: Mon, 13 Mar 2017 18:57:59 -0000
Content-Type: text/plain

Add new demo to Processor Linux SDK. This demo is package along with
source code in PLSDK and binary available under /usr/bin folder of the
filesystem. The demo is target to showcase AM57x Display Sub System
capabilities, 2D graphics accelerator GC320 video API usage for overlay
and QT drawing using 3D graphics accelerator. In this particular release
the demo is showing the DRM API usage for scaling and overlaying using
DSS and special QT QPA eglfs-kms for rendering using SGX. QT is the
master of the drm resource but shares the handle with application too.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |  3 +++
 .../ti-tisdk-makefile/Makefile_video-graphics-test | 24 +++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  1 +
 .../video-graphics-test/video-graphics-test_1.0.bb | 28 ++++++++++++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_video-graphics-test
 create mode 100644 meta-arago-extras/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 96f2db2..5941519 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -67,6 +67,9 @@ SRCIPK_INSTALL_DIR_pn-qt-tstat = "example-applications/${PN}-${PV}"
 CREATE_SRCIPK_pn-dual-camera-demo = "1"
 SRCIPK_INSTALL_DIR_pn-dual-camera-demo = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-video-graphics-test = "1"
+SRCIPK_INSTALL_DIR_pn-video-graphics-test = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-image-gallery = "1"
 SRCIPK_INSTALL_DIR_pn-image-gallery = "example-applications/${PN}"
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_video-graphics-test b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_video-graphics-test
new file mode 100644
index 0000000..1ffc395
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_video-graphics-test
@@ -0,0 +1,24 @@
+# QT Video Graphics build targets
+video-graphics-test:
+	@echo ================================
+	@echo    Building Video Graphics Test
+	@echo ================================
+	@cd example-applications; cd `find . -name "*video-graphics-test*"`; make -f Makefile.build
+
+video-graphics-test_clean:
+	@echo ================================
+	@echo    Building Video Graphics Test
+	@echo ================================
+	@cd example-applications; cd `find . -name "*video-graphics-test*"`; make -f Makefile.build clean
+
+video-graphics-test_install:
+	@echo ===================================================
+	@echo   Installing Video Graphics Test - Release version
+	@echo ===================================================
+	@cd example-applications; cd `find . -name "*video-graphics-test*"`; make -f Makefile.build install
+
+video-graphics-test_install_debug:
+	@echo =================================================
+	@echo   Installing Video Graphics Test - Debug version
+	@echo =================================================
+	@cd example-applications; cd `find . -name "*video-graphics-test*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 202078c..40ba3be 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "\
     file://Makefile_omapconf \
     file://Makefile_oprofile-example \
     file://Makefile_dual-camera-demo \
+    file://Makefile_video-graphics-test \
     file://Makefile_image-gallery \
     file://Makefile_cryptodev \
     file://Makefile_cmem-mod \
diff --git a/meta-arago-extras/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb b/meta-arago-extras/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
new file mode 100644
index 0000000..4e428b2
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Test applications for video and graphics interface"
+HOMEPAGE = "https://git.ti.com/sitara-linux/video-graphics-test"
+SECTION = "multimedia"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
+
+DEPENDS += "libdrm"
+
+PR = "r0"
+
+BRANCH = "master"
+SRCREV = "ebc7ab44d05fc726b0ddc7f4b45d71d7509313f5"
+
+SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-test.git;protocol=git;branch=${BRANCH} \
+"
+
+S = "${WORKDIR}/git"
+
+inherit qt-provider
+
+export SDK_PATH_TARGET='${STAGING_DIR_HOST}'
+
+# use the make targets already created in the Makefile.build files
+do_install() {
+    install -d ${D}/usr/bin
+    install video_graphics_test ${D}/usr/bin/video-graphics-test
+}
+
-- 
2.9.3


