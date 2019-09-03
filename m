Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B7B35529E4
	for <meta-arago@arago-project.org>;
	Tue,  3 Sep 2019 21:57:31 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x83LuSBt051419
	for <meta-arago@arago-project.org>; Tue, 3 Sep 2019 16:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567547788;
	bh=H6AcUdzHisUoxuqXyX6KDmBomsYMeLztILx027favk4=;
	h=From:To:CC:Subject:Date;
	b=L+Yfk8+wPOd9ERnyOxx54fzdCw45O0xjG0Nqe4NlYG6Xq6ygBC80kF1bqPlD+bXhn
	PBvvYO7TDHnaBjjRrHG7/HT1gcPDQN1brH/xrByTRpwz+aeZGnM8kLVKpo4eKvrhyq
	UsLiA9PRM707ufKdY6NebCFZJ0UkReIRkfdNmWss=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x83LuSg0025651
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 3 Sep 2019 16:56:28 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 3 Sep 2019 16:56:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 3 Sep 2019 16:56:28 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x83LuR80077865;
	Tue, 3 Sep 2019 16:56:27 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Sep 2019 17:55:57 -0400
Message-ID: <20190903215557.4804-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH] packagegroup-arago-tisdk-addons*: add tensorflow-lite
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
X-List-Received-Date: Tue, 03 Sep 2019 21:57:32 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
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
index 3990dad6..32d6ca06 100644
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
+                                tensorflow-lite \
                                 pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_ti43x = " voxelsdk \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
+                                tensorflow-lite \
                                 pdm-anomaly-detection \
 "
 
@@ -167,11 +169,13 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
                                    big-data-ipc-demo-linux-firmware \
                                    arm-compute-library \
                                    ${ARMNN_PACKAGES} \
+                                   tensorflow-lite \
                                    pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
                              ${ARMNN_PACKAGES} \
+                             tensorflow-lite \
                              pdm-anomaly-detection \
 "
 
-- 
2.17.1


