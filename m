Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 22E7352D20
	for <meta-arago@arago-project.org>;
	Thu,  6 May 2021 02:57:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1462wLUV107199;
	Wed, 5 May 2021 21:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620269901;
	bh=fG0Po21UNY5+VsDqBJvxkHylqwHLKIzRfx6AuCP3xTg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PfWVSE7J8Sp61/6jffeqpbp51EMawRbatyjsR3KXbmyGW8YO5RxXGuORE8smUg1C4
	yYlLMhcbhZ1UXNvW2qIYeux2CbT15rNbqUAbA4vOs1C0IrbtBx0gyJSIo17UNhtd59
	mg6FG/dwzL05qxx/r83DErxuu3BwFsg2ckGKb9VU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1462wKOZ113513
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 May 2021 21:58:20 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 5 May 2021 21:58:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 5 May 2021 21:58:20 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1462wKci065521;
	Wed, 5 May 2021 21:58:20 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	1462wHRC003287; Wed, 5 May 2021 21:58:20 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Wed, 5 May 2021 21:58:10 -0500
Message-ID: <20210506025812.25256-5-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506025812.25256-1-g-tammana@ti.com>
References: <20210506025812.25256-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [dunfell/master][PATCH 4/6] packagegroups-arago-tisdk*: image-gallery: Add machine feature conditional
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
X-List-Received-Date: Thu, 06 May 2021 02:57:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

image-gallery is dependent on qt, so make it a gpu machine feature
conditional package.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb         | 2 +-
 .../packagegroup-arago-tisdk-multimedia-sdk-host.bb          | 5 +++--
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb     | 5 +++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 65c75459..74b49898 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -50,6 +50,7 @@ MATRIX_QT_APPS_append_ti33x = " \
 MATRIX_QT_APPS_append_ti43x = " \
     matrix-analytics-pdm-anomaly-detection \
     matrix-gui-apps-dual-camera     \
+    matrix-gui-apps-image-gallery   \
 "
 
 MATRIX_TOUCH_APPS = " \
@@ -127,7 +128,6 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
                                     \
-    matrix-gui-apps-image-gallery   \
                                     \
     matrix-hmi-demo-evse            \
     matrix-hmi-demo-mmwavegesture   \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index f3c23b83..96f165ad 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -12,6 +12,7 @@ BARCODE_PKG = ""
 #"
 
 DUAL_CAMERA_PKG = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'dual-camera-demo-src', '', d)}"
+IMAGE_GALLERY_PKG = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu','image-gallery-src', '', d)}"
 
 MULTIMEDIA = ""
 
@@ -19,13 +20,13 @@ MULTIMEDIA_append_ti33x = " ${BARCODE_PKG}"
 
 MULTIMEDIA_append_ti43x = " \
     ${DUAL_CAMERA_PKG} \
-    image-gallery-src \
+    ${IMAGE_GALLERY_PKG} \
     ${BARCODE_PKG} \
 "
 
 MULTIMEDIA_append_omap-a15 = " \
     ${DUAL_CAMERA_PKG} \
-    image-gallery-src \
+    ${IMAGE_GALLERY_PKG} \
     ${BARCODE_PKG} \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index da1a64e2..b87966be 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -17,15 +17,16 @@ MULTIMEDIA_append_keystone = " \
 "
 
 DUAL_CAMERA_DEMO = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'dual-camera-demo', '', d)}"
+IMAGE_GALLERY_DEMO = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'image-gallery', '', d)}"
 
 MULTIMEDIA_append_ti43x = " \
     ${DUAL_CAMERA_DEMO} \
-    image-gallery \
+    ${IMAGE_GALLERY_DEMO} \
 "
 
 MULTIMEDIA_append_omap-a15 = " \
     ${DUAL_CAMERA_DEMO} \
-    image-gallery \
+    ${IMAGE_GALLERY_DEMO} \
 "
 
 MULTIMEDIA_append_dra7xx = " \
-- 
2.31.1


