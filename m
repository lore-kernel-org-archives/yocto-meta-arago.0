Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 3F74852CB2
	for <meta-arago@arago-project.org>;
	Thu,  6 May 2021 02:57:48 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1462wJrP091233;
	Wed, 5 May 2021 21:58:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620269899;
	bh=EhLFjMuwr5ZijS+hg/ha2nEzOQ6EAmf8pQBSJR5aiC4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=K7jcnO9S+F/9VwZ4fUJ2s1zkx8tOeHDkeiBk0LymjsJfQmYcg4zGX2BZUAzsMKpI/
	nNal3MoYakW+iRDif6R8SoA72GfnQFizbQT8GpYk2gfPyfKgKlc3b2TalqCdNpxarI
	/lnQc3T1Ip/Oh8DGoeQ7FCfkOIC8uHqwgZFYh02Y=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1462wJfO113436
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 May 2021 21:58:19 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 5 May 2021 21:58:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 5 May 2021 21:58:18 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1462wICN002700;
	Wed, 5 May 2021 21:58:18 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	1462wHRA003287; Wed, 5 May 2021 21:58:18 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Wed, 5 May 2021 21:58:08 -0500
Message-ID: <20210506025812.25256-3-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506025812.25256-1-g-tammana@ti.com>
References: <20210506025812.25256-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [dunfell/master][PATCH 2/6] packagegroup-arago-tisdk*: add feature check for pdm-anomaly-detection
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
X-List-Received-Date: Thu, 06 May 2021 02:57:48 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

pdm-anomaly-detection pacakge is needs qt which is dependent on gpu
machine feature. Add the pacakge conditionally to the packagegroup to
ensure right dependency chain.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb | 12 ++++++----
 ...kagegroup-arago-tisdk-addons-sdk-target.bb | 13 +++++++----
 .../packagegroup-arago-tisdk-matrix.bb        | 23 +++++++++++++------
 3 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 34cb619e..d42f213d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -99,22 +99,26 @@ EXTRA_LIBS_append_keystone = " \
 #    gdbserverproxy-module-drv-src \
 #"
 
+PDM_ANOMALY_PKG_SRC = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detection-src', '', d)} \
+"
+
 EXTRA_PACKAGES = ""
 
 EXTRA_PACKAGES_append_omap-a15 = " \
-    pdm-anomaly-detection-src \
+    ${PDM_ANOMALY_PKG_SRC} \
 "
 
 EXTRA_PACKAGES_append_ti33x = " \
-    pdm-anomaly-detection-src \
+    ${PDM_ANOMALY_PKG_SRC} \
 "
 
 EXTRA_PACKAGES_append_ti43x = " \
-    pdm-anomaly-detection-src \
+    ${PDM_ANOMALY_PKG_SRC} \
 "
 
 EXTRA_PACKAGES_append_am65xx = " \
-    pdm-anomaly-detection-src \
+    ${PDM_ANOMALY_PKG_SRC} \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index b55c79a4..48a6cd5e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -169,29 +169,34 @@ EXTRA_LIBS_append_k2e = " libulm-staticdev \
                               gdbserver-c6x-dev \
 "
 
+PDM_ANOMALY_PKG_DEV = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detection-dev', '', d)} \
+"
+
+
 EXTRA_PACKAGES = ""
 EXTRA_PACKAGES_append_ti33x = " \
                                 arm-compute-library-dev \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
-                                pdm-anomaly-detection-dev \
+                                ${PDM_ANOMALY_PKG_DEV} \
 "
 EXTRA_PACKAGES_append_ti43x = " \
                                 arm-compute-library-dev \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
-                                pdm-anomaly-detection-dev \
+                                ${PDM_ANOMALY_PKG_DEV} \
 "
 EXTRA_PACKAGES_append_omap-a15 = " \
                                 arm-compute-library-dev \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
-                                pdm-anomaly-detection-dev \
+                                ${PDM_ANOMALY_PKG_DEV} \
 "
 EXTRA_PACKAGES_append_am65xx = " arm-compute-library-dev \
                              tensorflow-lite-dev \
                              tensorflow-lite-staticdev \
-                             pdm-anomaly-detection-dev \
+                             ${PDM_ANOMALY_PKG_DEV} \
 "
 
 IPCDEV = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 897b354a..2483e8a8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -35,6 +35,22 @@ MATRIX_QT_APPS = " \
     matrix-gui-thermostat-demo \
 "
 
+MATRIX_QT_APPS_append_omap-a15 = " \
+    matrix-analytics-pdm-anomaly-detection \
+"
+
+MATRIX_QT_APPS_append_am65xx = " \
+    matrix-analytics-pdm-anomaly-detection \
+"
+
+MATRIX_QT_APPS_append_ti33x = " \
+    matrix-analytics-pdm-anomaly-detection \
+"
+
+MATRIX_QT_APPS_append_ti43x = " \
+    matrix-analytics-pdm-anomaly-detection \
+"
+
 MATRIX_TOUCH_APPS = " \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','matrix-gui-touch-demos','',d)} \
 "
@@ -96,8 +112,6 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-hmi-demo-mmwavegesture   \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
-                                    \
-    matrix-analytics-pdm-anomaly-detection \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -119,8 +133,6 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-hmi-demo-mmwavegesture   \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
-                                    \
-    matrix-analytics-pdm-anomaly-detection \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
@@ -140,7 +152,6 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-generic-pm           \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
-    matrix-analytics-pdm-anomaly-detection \
 "
 
 #    ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','gpu',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
@@ -158,8 +169,6 @@ MATRIX_APPS_append_am65xx = "           \
     matrix-hmi-demo-mmwavegesture   \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
-                                    \
-    matrix-analytics-pdm-anomaly-detection \
 "
 
 MATRIX_APPS_append_dra7xx += " \
-- 
2.31.1


