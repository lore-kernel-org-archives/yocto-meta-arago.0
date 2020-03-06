Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 32B0F529A8
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2020 17:56:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 026HsFL7125113
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2020 11:54:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583517255;
	bh=lifccuQPdlxi9vqZHfD4cC+OpL+CFKkgma9PRlB8vVU=;
	h=From:To:CC:Subject:Date;
	b=htyDMH+kT+lDw7ieyLmG8qzA0//jzPO43aXqsaWRArf4Mb5fy4J9pIBVZREMyz+P5
	UwdDHOZa9gbZ5dNQ5IJifmSqzOwTxgCiecySNaX4imsoGHIxw1fbflijW3SzHeCzks
	E3B0IvsweoXSPNJ6s8MGHKWvdakZDc7EB6fDScO0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 026HsFaJ020819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2020 11:54:15 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 6 Mar 2020 11:54:14 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 6 Mar 2020 11:54:14 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 026HsE8S079113; 
	Fri, 6 Mar 2020 11:54:14 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Mar 2020 12:46:25 -0500
Message-ID: <20200306174625.16312-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [thud] [PATCH] packagegroup-arago-tisdk-addons: add tensorflow-lite
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
X-List-Received-Date: Fri, 06 Mar 2020 17:56:19 -0000
Content-Type: text/plain

* This is for including the examples built from the tensforflow lite package
  to the target filesystem at usr/share/tensorflow-lite/examples

* As tensorflow-lite is creating static library, tensorflow-lite-demo which
  depends on tensorflow-lite will not bring in the examples folder for
  tensorflow-lite to the target filesystem

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
This is applicable to thud only, since zeus/master is now using ti-analytics.bb

 .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 583d2c0b..ff34ab95 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r77"
+PR = "r78"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -153,6 +153,7 @@ ARMNN_PACKAGES = "armnn"
 EXTRA_PACKAGES_append_ti33x = " voxelsdk \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
+                                tensorflow-lite \
                                 tensorflow-lite-demo \
                                 pdm-anomaly-detection \
 "
@@ -160,6 +161,7 @@ EXTRA_PACKAGES_append_ti33x = " voxelsdk \
 EXTRA_PACKAGES_append_ti43x = " voxelsdk \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
+                                tensorflow-lite \
                                 tensorflow-lite-demo \
                                 pdm-anomaly-detection \
 "
@@ -169,12 +171,14 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
                                    big-data-ipc-demo-linux-firmware \
                                    arm-compute-library \
                                    ${ARMNN_PACKAGES} \
+                                   tensorflow-lite \
                                    tensorflow-lite-demo \
                                    pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
                              ${ARMNN_PACKAGES} \
+                             tensorflow-lite \
                              tensorflow-lite-demo \
                              pdm-anomaly-detection \
 "
-- 
2.17.1


