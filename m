Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 6744A52A51
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 11C3640C30;
	Wed,  8 Apr 2020 00:45:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JNQQBo56yr8d; Wed,  8 Apr 2020 00:45:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E379640C1F;
	Wed,  8 Apr 2020 00:45:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A05291718FE;
	Tue,  7 Apr 2020 20:45:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:44:41 -0400
Message-Id: <1586306702-7953-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586306702-7953-1-git-send-email-denis@denix.org>
References: <1586306702-7953-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 03/24] qt-opencv-opencl-opengl-multithreaded: require opencv, opencl, opengl distro features
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
X-List-Received-Date: Wed, 08 Apr 2020 00:47:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Also require dsp machine feature.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb         | 1 +
 meta-arago-distro/recipes-core/packagegroups/ti-world.bb             | 1 -
 .../qt-opencv-opencl-opengl-multithreaded_git.bb                     | 5 +++++
 .../recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb      | 2 +-
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
index 994179c..d011e24 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -18,6 +18,7 @@ TENSORFLOW_DEMO_dra7xx = " \
 ANALYTICS = " \
     ${ARMNN_PACKAGES} \
     ${TENSORFLOW_DEMO} \
+    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 "
 ANALYTICS_keystone = ""
 ANALYTICS_j7-evm = ""
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 84852f1..6c0ba5f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -53,7 +53,6 @@ RDEPENDS_${PN} = "\
     packagegroup-arago-tisdk-addons-extra \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     packagegroup-arago-misc \
diff --git a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
index 2f644f6..7d2fb51 100644
--- a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
+++ b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
@@ -4,6 +4,11 @@ SECTION = "multimedia"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e28b998056a1a513e87be11c5045e85b"
 
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "dsp"
+REQUIRED_DISTRO_FEATURES = "opencv opencl opengl"
+
 DEPENDS += "opencv opencl virtual/egl ti-cgt6x-native clocl-native dsplib-c66x"
 
 COMPATIBLE_MACHINE = "dra7xx"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
index b979168..79aabd5 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
@@ -19,7 +19,7 @@ PACKAGES = "matrix-video-analytics-opencv-opencl-opengl-demo \
 
 RDEPENDS_matrix-video-analytics-opencv-opencl-opengl-demo = " \
     ${VIDEO_ANALYTICS_DEMO_RDEPENDS} \
-    qt-opencv-opencl-opengl-multithreaded \
+    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 "
 
 # Split the matrix files by demos
-- 
2.7.4


