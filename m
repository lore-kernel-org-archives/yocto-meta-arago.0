Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id C5D63529D2
	for <meta-arago@arago-project.org>;
	Tue,  7 Mar 2017 16:19:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v27GJ6XA017244
	for <meta-arago@arago-project.org>; Tue, 7 Mar 2017 10:19:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488903546;
	bh=Jl0GPNK3VBdX1E2JUgPRQNrAkthPQqQ1OHzZn12obTc=;
	h=From:To:CC:Subject:Date;
	b=eCMHzL1mZd0wpCAj70ouz+jcK+NYPuxLuU4d5LHKrMoCI4a1vApkEF8Cn36g1lDE/
	MxOaLDwARnWKMTcrT1KztI4fl/wea6EZClZnlr6vQZw9gfs9sbn1CVAlyXDLOUuPOX
	UdX9iTy6yBckqJj517RjvPo2eDahKPs50/A1n7vc=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v27GJ6RN000698
	for <meta-arago@arago-project.org>; Tue, 7 Mar 2017 10:19:06 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Mar 2017 10:19:05 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v27GJ5EX015243;	Tue, 7 Mar 2017 10:19:05 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Mar 2017 11:19:02 -0500
Message-ID: <1488903542-1469-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH] packagegroup-arago-tisdk-multimedia*: add dual-camera-demo and image-gallery for omap-a15
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
X-List-Received-Date: Tue, 07 Mar 2017 16:19:07 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb | 8 ++++++--
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb          | 7 ++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index cded1aa..116085b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related sources into the SDK"
 LICENSE = "MIT"
-PR = "r13"
+PR = "r14"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -16,7 +16,11 @@ MULTIMEDIA_append_ti43x = " \
 
 MULTIMEDIA_append_ti33x = " barcode-roi-src"
 
-MULTIMEDIA_append_omap-a15 = " barcode-roi-src"
+MULTIMEDIA_append_omap-a15 = " \
+    dual-camera-demo-src \
+    image-gallery-src \
+    barcode-roi-src \
+"
 
 MULTIMEDIA_append_dra7xx = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'opencl', 'qt-opencv-opencl-opengl-multithreaded-src', '', d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index bb344b0..cb143b8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r19"
+PR = "r20"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -17,6 +17,11 @@ MULTIMEDIA_append_ti43x = " \
     image-gallery \
 "
 
+MULTIMEDIA_append_omap-a15 = " \
+    dual-camera-demo \
+    image-gallery \
+"
+
 MULTIMEDIA_append_dra7xx = " \
     hevc-arm-decoder \
     ${@bb.utils.contains('MACHINE_FEATURES', 'opencl', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
-- 
1.9.1


