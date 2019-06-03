Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8DE1B52A19
	for <meta-arago@arago-project.org>;
	Mon,  3 Jun 2019 19:26:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x53JQ273090466
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 14:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559589962;
	bh=RHUOzPgsiwOjksCK2liiMhWTX+JmU9Qcv+JdSCCGpo8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a3CMtGd2IcUVJxipWyrd+71g0dHNEHLFdZtMpasZDOKbjjy6jSXOiWcBIbCzc506n
	BPRVQ1jTXiEQZXHHlrgWN2TdkLBvhqwVckToK4lwHoXo9XCtuPQw+HWZJeR5kcd4bY
	Ps2USoYtJja4xBzjuWoqAnP3VINsYYMZp+auIK2I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x53JQ2fu107718
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 14:26:02 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 3 Jun 2019 14:26:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 3 Jun 2019 14:26:02 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x53JQ0c9100439;
	Mon, 3 Jun 2019 14:26:01 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Jun 2019 15:24:22 -0400
Message-ID: <20190603192424.23922-5-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603192424.23922-1-h-gou@ti.com>
References: <20190603192424.23922-1-h-gou@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH 4/6] packagegroup-arago-tisdk-addons*: add pdm-anomaly-detection
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
X-List-Received-Date: Mon, 03 Jun 2019 19:26:44 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb | 21 ++++++++++++++++++-
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  6 +++++-
 .../packagegroup-arago-tisdk-addons.bb        |  6 +++++-
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index f74e357c..3b734554 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r34"
+PR = "r35"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -86,7 +86,26 @@ EXTRA_LIBS_append_keystone = " \
 #    gdbserverproxy-module-drv-src \
 #"
 
+EXTRA_PACKAGES = ""
+
+EXTRA_PACKAGES_append_omap-a15 = " \
+    pdm-anomaly-detection-src \
+"
+
+EXTRA_PACKAGES_append_ti33x = " \
+    pdm-anomaly-detection-src \
+"
+
+EXTRA_PACKAGES_append_ti43x = " \
+    pdm-anomaly-detection-src \
+"
+
+EXTRA_PACKAGES_append_k3 = " \
+    pdm-anomaly-detection-src \
+"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
     ${EXTRA_LIBS} \
+    ${EXTRA_PACKAGES} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 062f5c53..8bce1756 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r41"
+PR = "r42"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -160,17 +160,21 @@ EXTRA_PACKAGES = ""
 EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev \
                                 arm-compute-library-dev \
                                 ${ARMNN_PACKAGES} \
+                                pdm-anomaly-detection-dev \
 "
 EXTRA_PACKAGES_append_ti43x = " voxelsdk-dev \
                                 arm-compute-library-dev \
                                 ${ARMNN_PACKAGES} \
+                                pdm-anomaly-detection-dev \
 "
 EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev \
                                 arm-compute-library-dev \
                                 ${ARMNN_PACKAGES} \
+                                pdm-anomaly-detection-dev \
 "
 EXTRA_PACKAGES_append_k3 = " arm-compute-library-dev \
                              ${ARMNN_PACKAGES} \
+                             pdm-anomaly-detection-dev \
 "
 
 IPCDEV = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index abcf6bc7..c94b27e6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r73"
+PR = "r74"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -151,11 +151,13 @@ ARMNN_PACKAGES = ""
 EXTRA_PACKAGES_append_ti33x = " voxelsdk \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
+                                pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_ti43x = " voxelsdk \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
+                                pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
@@ -163,10 +165,12 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
                                    big-data-ipc-demo-linux-firmware \
                                    arm-compute-library \
                                    ${ARMNN_PACKAGES} \
+                                   pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_k3 = " arm-compute-library \
                              ${ARMNN_PACKAGES} \
+                             pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
-- 
2.17.1


