Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 71E7A529F3
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2019 16:50:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89GnMEZ050233
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 11:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568047762;
	bh=B4EWQ+cTlMYEkJdfbnIjLQppyiMJAY8+0DFlaY2uQ8M=;
	h=From:To:CC:Subject:Date;
	b=MDgL2TP5aefmxHUiKf6DXYod1jNWV3zYL1iSAgYrOjOSp/ioMsAT5h3ol1hFNQDSk
	8EswAOZk1b5nkULoBI0bYzqUIoIeyA2Ig71p320RKb8yXGJr4IFCiHNTvQyfmE/LzX
	FBr49JkZ1WmxePOL3hIruZihUOZVQFkHlGV1l41w=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89GnMqw119119
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 11:49:22 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 9 Sep 2019 11:49:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 9 Sep 2019 11:49:22 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GnKO0020531;
	Mon, 9 Sep 2019 11:49:21 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Sep 2019 12:48:36 -0400
Message-ID: <20190909164836.1111-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH v2] packagegroup-arago-tisdk-addons*: add tensorflow-lite
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
X-List-Received-Date: Mon, 09 Sep 2019 16:50:27 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v2 change: package tensorflow-lite-examples instead of tensorflow-lite

 .../packagegroup-arago-tisdk-addons-sdk-target.bb      | 10 +++++++++-
 .../packagegroups/packagegroup-arago-tisdk-addons.bb   |  6 +++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 390effba..7ba5143a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r42"
+PR = "r43"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -159,20 +159,28 @@ EXTRA_PACKAGES = ""
 EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev \
                                 arm-compute-library-dev \
                                 ${ARMNN_PACKAGES} \
+                                tensorflow-lite-dev \
+                                tensorflow-lite-staticdev \
                                 pdm-anomaly-detection-dev \
 "
 EXTRA_PACKAGES_append_ti43x = " voxelsdk-dev \
                                 arm-compute-library-dev \
                                 ${ARMNN_PACKAGES} \
+                                tensorflow-lite-dev \
+                                tensorflow-lite-staticdev \
                                 pdm-anomaly-detection-dev \
 "
 EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev \
                                 arm-compute-library-dev \
                                 ${ARMNN_PACKAGES} \
+                                tensorflow-lite-dev \
+                                tensorflow-lite-staticdev \
                                 pdm-anomaly-detection-dev \
 "
 EXTRA_PACKAGES_append_am65xx = " arm-compute-library-dev \
                              ${ARMNN_PACKAGES} \
+                             tensorflow-lite-dev \
+                             tensorflow-lite-staticdev \
                              pdm-anomaly-detection-dev \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 3990dad6..52b2a64a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r74"
+PR = "r75"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -153,12 +153,14 @@ ARMNN_PACKAGES = "armnn"
 EXTRA_PACKAGES_append_ti33x = " voxelsdk \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
+                                tensorflow-lite-examples \
                                 pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_ti43x = " voxelsdk \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
+                                tensorflow-lite-examples \
                                 pdm-anomaly-detection \
 "
 
@@ -167,11 +169,13 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
                                    big-data-ipc-demo-linux-firmware \
                                    arm-compute-library \
                                    ${ARMNN_PACKAGES} \
+                                   tensorflow-lite-examples \
                                    pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
                              ${ARMNN_PACKAGES} \
+                             tensorflow-lite-examples \
                              pdm-anomaly-detection \
 "
 
-- 
2.17.1


