Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 37B4A52D1C
	for <meta-arago@arago-project.org>;
	Thu,  6 May 2021 02:57:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1462wJna107182;
	Wed, 5 May 2021 21:58:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620269899;
	bh=5/+aGuHPvpsu+F2vCeVDs0sWJ3vKyeXlLa6hgDIXmM0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UnuA/IqJRQgxSGFuCmGDLou5qcVRlwEelkmFvInwlJOL5jjrlcJ3bKTX0Y5A57ZD1
	qfhkYmBq8Oa97f0gNUi9eS2AUYW9ZVBIHj4SJTcL+3hIFnZ6bLnFvNwW43qIFEy/kz
	hpINYrV8/Cp7CTobS9i3KxZ/UyPJkL37laC2jk/Q=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1462wJ2D102275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 May 2021 21:58:19 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 5 May 2021 21:58:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 5 May 2021 21:58:19 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1462wJOm065468;
	Wed, 5 May 2021 21:58:19 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	1462wHRB003287; Wed, 5 May 2021 21:58:19 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Wed, 5 May 2021 21:58:09 -0500
Message-ID: <20210506025812.25256-4-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506025812.25256-1-g-tammana@ti.com>
References: <20210506025812.25256-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [dunfell/master][PATCH 3/6] packagegroup-arago-tisdk*: Add feature depenendency for dual-camera-demo
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
X-List-Received-Date: Thu, 06 May 2021 02:57:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

`dual-camera-demo` package is qt based application, which is dependent
on gpu machine feature. Add the package to packagegroups conditionally
to enusure correct dependency chain.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb        | 2 +-
 .../packagegroup-arago-tisdk-multimedia-sdk-host.bb         | 6 ++++--
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb    | 6 ++++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 2483e8a8..65c75459 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -49,6 +49,7 @@ MATRIX_QT_APPS_append_ti33x = " \
 
 MATRIX_QT_APPS_append_ti43x = " \
     matrix-analytics-pdm-anomaly-detection \
+    matrix-gui-apps-dual-camera     \
 "
 
 MATRIX_TOUCH_APPS = " \
@@ -126,7 +127,6 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
                                     \
-    matrix-gui-apps-dual-camera     \
     matrix-gui-apps-image-gallery   \
                                     \
     matrix-hmi-demo-evse            \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 081cc926..f3c23b83 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -11,18 +11,20 @@ BARCODE_PKG = ""
 #    ${@['','barcode-roi-src'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
 #"
 
+DUAL_CAMERA_PKG = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'dual-camera-demo-src', '', d)}"
+
 MULTIMEDIA = ""
 
 MULTIMEDIA_append_ti33x = " ${BARCODE_PKG}"
 
 MULTIMEDIA_append_ti43x = " \
-    dual-camera-demo-src \
+    ${DUAL_CAMERA_PKG} \
     image-gallery-src \
     ${BARCODE_PKG} \
 "
 
 MULTIMEDIA_append_omap-a15 = " \
-    dual-camera-demo-src \
+    ${DUAL_CAMERA_PKG} \
     image-gallery-src \
     ${BARCODE_PKG} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 36ebd35a..da1a64e2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -16,13 +16,15 @@ MULTIMEDIA_append_keystone = " \
     hevc-arm-decoder \
 "
 
+DUAL_CAMERA_DEMO = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'dual-camera-demo', '', d)}"
+
 MULTIMEDIA_append_ti43x = " \
-    dual-camera-demo \
+    ${DUAL_CAMERA_DEMO} \
     image-gallery \
 "
 
 MULTIMEDIA_append_omap-a15 = " \
-    dual-camera-demo \
+    ${DUAL_CAMERA_DEMO} \
     image-gallery \
 "
 
-- 
2.31.1


