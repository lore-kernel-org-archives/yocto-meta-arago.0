Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id ABF7352A93
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsJMW008336
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046059;
	bh=a4IsG6ZxjT7O72gws/gQ6F3Ny2imy8Qfxt7mK9G0cjE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BO4JrHVrUKfRuhkXAHIGTV2d5le3QE2ZUPPD0gP6sgNltXnhuzXnvzIfI4TlwMm+J
	Ajv5m2U/uL0TYztPSrCBdEKBVaALPqh9pvmFCx6QcjDxPSZMQPRYLdylupklWwbea5
	Htn7QF4W36pR96d7sFEKvBkWOEhojFRO+QhQg/pQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsJLY013525
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:19 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:19 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFSG013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:19 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:54:07 -0400
Message-ID: <1507046051-57949-20-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 19/23] packagegroup-arago-tisdk-multimedia(-sdk): remove unsupported tests for X11
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:20 -0000
Content-Type: text/plain

For X11:
remove dual-camera-demo image-gallery video-graphics-test
qt-opencv-opencl-opengl-multithreaded barcode-roi

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...egroup-arago-tisdk-multimedia-sdk-host.bbappend | 24 ++++++++++++++++++++--
 ...roup-arago-tisdk-multimedia-sdk-target.bbappend | 21 +++++++++++++++++++
 .../packagegroup-arago-tisdk-multimedia.bbappend   | 24 +++++++++++++++++-----
 3 files changed, 62 insertions(+), 7 deletions(-)
 create mode 100644 recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bbappend

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bbappend
index d832f6f..df0a234 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bbappend
@@ -1,3 +1,23 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
-MULTIMEDIA_append_omap-a15 = " video-graphics-test-src"
+MULTIMEDIA_append_omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', 'video-graphics-test-src', d)}"
+
+MULTIMEDIA_remove_ti33x = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-src', '', d)} \
+"
+
+MULTIMEDIA_remove_ti43x = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'dual-camera-demo-src', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'image-gallery-src', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-src', '', d)} \
+"
+
+MULTIMEDIA_remove_omap-a15 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'dual-camera-demo-src', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'image-gallery-src', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-src', '', d)} \
+"
+
+MULTIMEDIA_remove_dra7xx = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'qt-opencv-opencl-opengl-multithreaded-src', '', d)} \
+"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bbappend
new file mode 100644
index 0000000..2fad543
--- /dev/null
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bbappend
@@ -0,0 +1,21 @@
+PR_append = ".tisdk0"
+
+MULTIMEDIA_remove_ti33x = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-dev', '', d)} \
+"
+
+MULTIMEDIA_remove_ti43x = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-dev', '', d)} \
+"
+
+MULTIMEDIA_remove_omap-a15 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-dev', '', d)} \
+"
+
+MULTIMEDIA_remove_keystone = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-dev', '', d)} \
+"
+
+MULTIMEDIA_remove_dra7xx = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
+"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
index db94cad..3fccd09 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
@@ -1,14 +1,28 @@
-PR_append = ".tisdk1"
+PR_append = ".tisdk2"
 
 MULTIMEDIA_append_omap-a15 = " \
-    video-graphics-test \
-    chromium-wayland \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'video-graphics-test', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'chromium-wayland', '', d)} \
 "
 
 MULTIMEDIA_append_ti43x = " \
-    chromium-wayland \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'chromium-wayland', '', d)} \
 "
 
 MULTIMEDIA_append_ti33x = " \
-    chromium-wayland \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'chromium-wayland', '', d)} \
+"
+
+MULTIMEDIA_remove_omap-a15 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'dual-camera-demo', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'image-gallery', '', d)} \
+"
+
+MULTIMEDIA_remove_ti43x = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'dual-camera-demo', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'image-gallery', '', d)} \
+"
+
+MULTIMEDIA_remove_dra7xx = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
 "
-- 
1.9.1


