Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5D7CB52A2D
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0D3A440C1D;
	Wed,  8 Apr 2020 00:45:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hcYCDHCLcelx; Wed,  8 Apr 2020 00:45:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF32740C30;
	Wed,  8 Apr 2020 00:45:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AC0B51718FF;
	Tue,  7 Apr 2020 20:45:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:44:42 -0400
Message-Id: <1586306702-7953-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586306702-7953-1-git-send-email-denis@denix.org>
References: <1586306702-7953-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 04/24] barcode-roi: also require opencv distro feature
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

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb          | 1 +
 meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb        | 1 +
 .../recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb         | 4 +++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
index d011e24..1e7ee19 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -19,6 +19,7 @@ ANALYTICS = " \
     ${ARMNN_PACKAGES} \
     ${TENSORFLOW_DEMO} \
     ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
+    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
 "
 ANALYTICS_keystone = ""
 ANALYTICS_j7-evm = ""
diff --git a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
index 69e06f3..0673c0a 100644
--- a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
+++ b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://detect_barcode.cpp;beginline=1;endline=25;md5=babab64
 inherit features_check
 
 REQUIRED_MACHINE_FEATURES = "dsp"
+REQUIRED_DISTRO_FEATURES = "opencv"
 
 DEPENDS += "opencv"
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
index 51810b4..d164c71 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -11,7 +11,9 @@ S = "${WORKDIR}/git/machinevision_apps"
 # Make sure machinevision submenu and app images has been installed
 MACHINEVISION_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-machinevision"
 
-BARCODE_RDEPENDS = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'barcode-roi', '', d)}"
+BARCODE_RDEPENDS = " \
+    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
+"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
-- 
2.7.4


