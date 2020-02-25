Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2DCED52988
	for <meta-arago@arago-project.org>;
	Tue, 25 Feb 2020 23:42:09 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PNe82t130225
	for <meta-arago@arago-project.org>; Tue, 25 Feb 2020 17:40:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582674008;
	bh=Fy761Eve4i8cvqehE5S8g78DkzdfW3Nyq85ooLhZmDY=;
	h=From:To:CC:Subject:Date;
	b=Dv0xR/0+5+cMJWrnuYu8O5rcojTFy/4qG4fIzvGrX1uxs4W6hUWJBiZJ2UNo9ZaG5
	bhbzx5zoKNTdPo1Q8AkqRKjlOyWX3JTCuX0ButVga3Gd2B1wtwSd284taV1qPBt6hb
	a2Lio5KSwnuNCAZhL+ijzYjKZ8VEQ9xqAilVZthE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PNe848010677
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 25 Feb 2020 17:40:08 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 25 Feb 2020 17:40:08 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 25 Feb 2020 17:40:08 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PNe7bT105992;
	Tue, 25 Feb 2020 17:40:08 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 25 Feb 2020 18:32:31 -0500
Message-ID: <20200225233231.25035-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [zeus/master] [PATCH 3/3 v2] packagegroup-arago-tisdk-addons: add tensorflow-lite-demo
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
X-List-Received-Date: Tue, 25 Feb 2020 23:42:09 -0000
Content-Type: text/plain

* tensorflow-lite-examples has been replaced with tensorflow-lite, which will
  be pulled in as dependency of tensorflow-lite-demo

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v2 change: remove tensorflow-lite since it will be pulled in as dependency of tensorflow-lite-demo

 .../packagegroups/packagegroup-arago-tisdk-addons.bb   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index a68662a7..4e1e4049 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r76"
+PR = "r77"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -156,14 +156,14 @@ VOXEL_PACKAGES = ""
 EXTRA_PACKAGES_append_ti33x = " ${VOXEL_PACKAGES} \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
-                                tensorflow-lite-examples \
+                                tensorflow-lite-demo \
                                 pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_ti43x = " ${VOXEL_PACKAGES} \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
-                                tensorflow-lite-examples \
+                                tensorflow-lite-demo \
                                 pdm-anomaly-detection \
 "
 
@@ -172,13 +172,13 @@ EXTRA_PACKAGES_append_omap-a15 = " ${VOXEL_PACKAGES} \
                                    big-data-ipc-demo-linux-firmware \
                                    arm-compute-library \
                                    ${ARMNN_PACKAGES} \
-                                   tensorflow-lite-examples \
+                                   tensorflow-lite-demo \
                                    pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
                              ${ARMNN_PACKAGES} \
-                             tensorflow-lite-examples \
+                             tensorflow-lite-demo \
                              pdm-anomaly-detection \
 "
 
-- 
2.17.1


