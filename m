Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A9A2852B36
	for <meta-arago@arago-project.org>;
	Thu,  2 Feb 2017 19:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A377920999;
	Thu,  2 Feb 2017 19:58:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id V31FL8ICfLGH; Thu,  2 Feb 2017 19:58:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 83D79208AE;
	Thu,  2 Feb 2017 19:58:24 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id F233A16232F;
	Thu,  2 Feb 2017 14:58:23 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  2 Feb 2017 14:58:23 -0500
Message-Id: <1486065503-26606-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] packagegroup-matrix: machinevision app depends on opencl, move to corresponding list
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
X-List-Received-Date: Thu, 02 Feb 2017 19:58:25 -0000

So it can be guarded by opencl DISTRO_FEATURE.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index a851ed5..848492c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r61"
+PR = "r62"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -37,7 +37,6 @@ MATRIX_TOUCH_APPS = " \
     matrix-gui-touch-demos \
 "
 
-
 MATRIX_QT_APPS_keystone = ""
 
 MATRIX_SGX_DEMOS = " \
@@ -58,7 +57,8 @@ MATRIX_OPENCL_APPS = " \
 "
 
 MATRIX_OPENCL_APPS_append_dra7xx = " \
-    ${@bb.utils.contains('MACHINE_FEATURES','opencl','matrix-video-analytics-opencv-opencl-opengl-demo','',d)} \
+    matrix-video-analytics-opencv-opencl-opengl-demo \
+    matrix-machinevision-demo-dlp3dscanner \
 "
 
 MATRIX_APPS = ""
@@ -109,7 +109,6 @@ MATRIX_APPS_append_omap-a15 = "     \
 
 MATRIX_APPS_append_dra7xx += " \
     matrix-multimedia-demo-dsp66imgproc \
-    matrix-machinevision-demo-dlp3dscanner \
 "
 
 MATRIX_APPS_append_keystone = " \
-- 
2.7.4


