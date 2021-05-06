Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 8867A52D1C
	for <meta-arago@arago-project.org>;
	Thu,  6 May 2021 02:57:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1462wMqr107208;
	Wed, 5 May 2021 21:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620269902;
	bh=XaR57y2afqrtsZC33rPQXyul2RlBwrKUXQBOLHKVlBg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sYyuL+9VEtHdntWQ/nQFeZu75nIk4zC39DmFKWvvcmorfPddysbkQLcCULDVb4bmF
	ih8rx+3+bHvmTzXWCgc4f+WnGFpM01GAY80uxP6UtnCPnfkbsNn1/aCF8SvEN9RbTs
	qLXsGu76x33z2sBUGF5CQjxkl1gzYg8MrY7t6t+g=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1462wMgd113575
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 May 2021 21:58:22 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 5 May 2021 21:58:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 5 May 2021 21:58:22 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1462wM56065626;
	Wed, 5 May 2021 21:58:22 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	1462wHRE003287; Wed, 5 May 2021 21:58:22 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Wed, 5 May 2021 21:58:12 -0500
Message-ID: <20210506025812.25256-7-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506025812.25256-1-g-tammana@ti.com>
References: <20210506025812.25256-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [dunfell/master][PATCH 6/6] packagegroup-arago-tisdk-hmi*: Install them conditionally
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
X-List-Received-Date: Thu, 06 May 2021 02:57:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

hmi demos have qt dependency, so install them through corresponding
machine feature condition.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../packagegroup-arago-tisdk-hmi-sdk-host.bb  |  4 +++-
 .../packagegroup-arago-tisdk-hmi.bb           |  4 +++-
 .../packagegroup-arago-tisdk-matrix.bb        | 24 +++++++++----------
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
index 1eb83d18..6c6ce6e0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
@@ -4,7 +4,9 @@ PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
+inherit packagegroup features_check
+
+REQUIRED_MACHINE_FEATURES = "gpu"
 
 HMI = ""
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
index 10f6d306..6958f08c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
@@ -4,7 +4,9 @@ PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
+inherit packagegroup features_check
+
+REQUIRED_MACHINE_FEATURES = "gpu"
 
 HMI = " \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 74b49898..4675cb80 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -37,20 +37,31 @@ MATRIX_QT_APPS = " \
 
 MATRIX_QT_APPS_append_omap-a15 = " \
     matrix-analytics-pdm-anomaly-detection \
+    matrix-hmi-demo-evse            \
+    matrix-hmi-demo-mmwavegesture   \
 "
 
 MATRIX_QT_APPS_append_am65xx = " \
     matrix-analytics-pdm-anomaly-detection \
+                                    \
+    matrix-hmi-demo-evse            \
+    matrix-hmi-demo-mmwavegesture   \
 "
 
 MATRIX_QT_APPS_append_ti33x = " \
     matrix-analytics-pdm-anomaly-detection \
+    matrix-hmi-demo-evse            \
+    matrix-hmi-demo-protection-relays \
+    matrix-hmi-demo-mmwavegesture   \
 "
 
 MATRIX_QT_APPS_append_ti43x = " \
     matrix-analytics-pdm-anomaly-detection \
     matrix-gui-apps-dual-camera     \
     matrix-gui-apps-image-gallery   \
+                                    \
+    matrix-hmi-demo-evse            \
+    matrix-hmi-demo-mmwavegesture   \
 "
 
 MATRIX_TOUCH_APPS = " \
@@ -109,10 +120,6 @@ MATRIX_APPS_append_ti33x = "        \
                                     \
     matrix-gui-ethernet-demos       \
                                     \
-    matrix-hmi-demo-evse            \
-    matrix-hmi-demo-protection-relays \
-    matrix-hmi-demo-mmwavegesture   \
-                                    \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
 
@@ -128,10 +135,6 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
                                     \
-                                    \
-    matrix-hmi-demo-evse            \
-    matrix-hmi-demo-mmwavegesture   \
-                                    \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
 
@@ -139,8 +142,6 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-audiocapture \
     matrix-multimedia-demo-h265dec  \
-    matrix-hmi-demo-evse            \
-    matrix-hmi-demo-mmwavegesture   \
                                     \
     ${@bb.utils.contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264dec','matrix-multimedia-demo-h264dec',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264enc','',d)} \
@@ -165,9 +166,6 @@ MATRIX_APPS_append_am65xx = "           \
     matrix-multimedia-demo-mpeg4aacdec \
     matrix-multimedia-demo-mpeg4dec \
                                     \
-    matrix-hmi-demo-evse            \
-    matrix-hmi-demo-mmwavegesture   \
-                                    \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
 
-- 
2.31.1


