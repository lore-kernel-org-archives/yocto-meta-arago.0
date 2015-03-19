Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id B14E752099
	for <meta-arago@arago-project.org>;
	Thu, 19 Mar 2015 21:03:11 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLH00E5D94FY9J0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 19 Mar 2015 16:02:50 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=NqFmqHZM c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=lRxpQPx1AAAA:8 a=0gcC27t9AAAA:8	a=oR5dmqMzAAAA:8 a=-9mUelKeXuEA:10
	a=emO1SXQWCLwA:10 a=sozttTNsAAAA:8	a=hzORWkhJx1XeWjjhdNsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0E67C200EC;	Thu,
	19 Mar 2015 17:02:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 19 Mar 2015 17:02:38 -0400
Message-id: <1426798958-2818-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] recipes: switch remaining gitorious.org git repos to http
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
X-List-Received-Date: Thu, 19 Mar 2015 21:03:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

No PR bump needed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb            | 2 +-
 meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb        | 3 +--
 meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb    | 2 +-
 .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb        | 2 +-
 meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb              | 2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
index 493a80a..d285347 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -11,7 +11,7 @@ PR = "r9"
 BRANCH ?= "master"
 SRCREV = "5df7da69a50d27b7f594db0918c5e6793c3a6237"
 
-SRC_URI = "git://gitorious.org/am_sysinfo/am_sysinfo.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gitorious.org/am_sysinfo/am_sysinfo.git;protocol=http;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
index 096aa40..c02eab4 100644
--- a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
@@ -9,8 +9,7 @@ PR = "r1"
 BRANCH ?= "master"
 SRCREV = "169242aa7a265d5c94755d74601ad4a3f1828c96"
 
-SRC_URI = "git://gitorious.org/screenshot/screenshot.git;protocol=git;branch=${BRANCH}"
-
+SRC_URI = "git://gitorious.org/screenshot/screenshot.git;protocol=http;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
index e797aa5..10c5082 100644
--- a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
@@ -14,7 +14,7 @@ COMPATIBLE_MACHINE = "(omap3)"
 BRANCH ?= "master"
 SRCREV = "b67b11011a8a54a7598eed383f3a106c32b47c6d"
 
-SRC_URI = "git://gitorious.org/av_examples/av_examples.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gitorious.org/av_examples/av_examples.git;protocol=http;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index e882cad..05692ec 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -12,7 +12,7 @@ PR = "r8"
 BRANCH = "drm"
 SRCREV = "4ede12a9c6b51b7693b005b00a715056e99fa7a0"
 
-SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=http;branch=${BRANCH} \
            file://desc_dual-camera.html \
            file://dual_camera_qt5.sh \
            file://dual_camera_qt4.sh \
diff --git a/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
index ad10de9..f6c615e 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
@@ -13,7 +13,7 @@ PR = "r3"
 BRANCH = "master"
 SRCREV = "1f89d5e6c160e87e73a9c06933e50c3981bbf41d"
 
-SRC_URI = "git://gitorious.org/image-gallery/image-gallery.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gitorious.org/image-gallery/image-gallery.git;protocol=http;branch=${BRANCH}"
 
 QT5_DIFF = " \
     file://0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch \
-- 
2.2.0


