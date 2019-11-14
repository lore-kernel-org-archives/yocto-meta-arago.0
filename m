Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B3ABE52A46
	for <meta-arago@arago-project.org>;
	Thu, 14 Nov 2019 01:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AB3A340BF4;
	Thu, 14 Nov 2019 01:19:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ik1Y7gPUG69p; Thu, 14 Nov 2019 01:19:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 80FFF40BFC;
	Thu, 14 Nov 2019 01:19:04 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3861D1742F0;
	Wed, 13 Nov 2019 20:19:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 13 Nov 2019 20:18:57 -0500
Message-Id: <1573694338-30083-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573694338-30083-1-git-send-email-denis@denix.org>
References: <1573694338-30083-1-git-send-email-denis@denix.org>
Subject: [RFC][PATCH 4/5] packagegroup-*-multimedia*: cleanup
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
X-List-Received-Date: Thu, 14 Nov 2019 01:20:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb | 11 +++----
 .../packagegroup-arago-tisdk-multimedia.bb         | 35 +++++++---------------
 2 files changed, 14 insertions(+), 32 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 2ab9dc7..11d3318 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -8,31 +8,28 @@ inherit packagegroup
 
 MULTIMEDIA = ""
 
+MULTIMEDIA_append_ti33x = " barcode-roi-src"
+
 MULTIMEDIA_append_ti43x = " \
     dual-camera-demo-src \
     image-gallery-src \
     barcode-roi-src \
 "
 
-MULTIMEDIA_append_ti33x = " barcode-roi-src"
-
-MULTIMEDIA_append_am65xx = " barcode-roi-src"
-
 MULTIMEDIA_append_omap-a15 = " \
     dual-camera-demo-src \
     image-gallery-src \
     barcode-roi-src \
 "
 
+MULTIMEDIA_append_am65xx = " barcode-roi-src"
+
 MULTIMEDIA_append_dra7xx = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'qt-opencv-opencl-opengl-multithreaded-src', '', d)} \
 "
 
 MULTIMEDIA_append_keystone = " barcode-roi-src"
 
-#Demo doesn't work on 3.14
-# ${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)}
-
 RDEPENDS_${PN} = "\
     ${MULTIMEDIA} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 6f6f1f7..056b2c8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r23"
+PR = "r24"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,6 +11,7 @@ MULTIMEDIA = " \
 "
 
 MULTIMEDIA_omapl138 = ""
+
 MULTIMEDIA_append_keystone = " \
     hevc-arm-decoder \
 "
@@ -26,6 +27,7 @@ MULTIMEDIA_append_omap-a15 = " \
 "
 
 MULTIMEDIA_append_dra7xx = " \
+    vis \
     hevc-arm-decoder \
     ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
 "
@@ -34,36 +36,19 @@ MULTIMEDIA_append_omap5-evm = " \
     abefw \
 "
 
-MULTIMEDIA_append_j7-evm = " \
-    ti-img-encode-decode \
-    vxd-dec-fw \
-"
-
-ACCEL_FW = ""
-
-ACCEL_FW_append_am57xx-evm = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
-"
+ACCEL_MM = ""
 
-ACCEL_FW_append_am57xx-hs-evm = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
+ACCEL_MM_append_omap-a15 = " \
+    ipumm-fw \
 "
 
-ACCEL_FW_append_omap5-evm = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
-"
-
-ACCEL_FW_append_dra7xx-evm = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
-    vis \
-"
-
-ACCEL_FW_append_dra7xx-hs-evm = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
+ACCEL_MM_append_j7-evm = " \
+    ti-img-encode-decode \
+    vxd-dec-fw \
 "
 
 RDEPENDS_${PN} = "\
     packagegroup-arago-gst \
     ${MULTIMEDIA} \
-    ${ACCEL_FW} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', '${ACCEL_MM}', '', d)} \
 "
-- 
2.7.4


