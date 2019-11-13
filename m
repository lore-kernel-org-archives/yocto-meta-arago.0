Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0A31B529D4
	for <meta-arago@arago-project.org>;
	Wed, 13 Nov 2019 00:26:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAD0OZYo001008
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2019 18:24:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573604675;
	bh=470D5k8sywTvoBnGDF+kNbhFPHQZDWiPjhpF5cFB6Sc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IOD+d3pooqekorM1bixDQjcglCYusbcnwzy+RSLgo6bqU/KQW4WQAjLauFcso+pcy
	KciMgV41nXC2LvpkzY8pkzhQdqrBJcFmAzOowVYlHm7tJpNtOdlWh76imWHchEw4t+
	45rV3JU7hArYW6mPo1+Sxbl0U3DzlZzbGm7KjlTc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAD0OZXu077833
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2019 18:24:35 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 12 Nov 2019 18:24:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 12 Nov 2019 18:24:17 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD0ONEA056588;
	Tue, 12 Nov 2019 18:24:34 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Nov 2019 19:13:49 -0500
Message-ID: <20191113001349.30916-3-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191113001349.30916-1-a0271529@ti.com>
References: <20191113001349.30916-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [thud/master] [PATCH 3/3] packagegroup-arago-tisdk-addons: add tensorflow-lite
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
X-List-Received-Date: Wed, 13 Nov 2019 00:26:00 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 14b2370c..73f3f950 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r76"
+PR = "r77"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -154,6 +154,7 @@ EXTRA_PACKAGES_append_ti33x = " voxelsdk \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
                                 tensorflow-lite-examples \
+                                tensorflow-lite \
                                 pdm-anomaly-detection \
 "
 
@@ -161,6 +162,7 @@ EXTRA_PACKAGES_append_ti43x = " voxelsdk \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
                                 tensorflow-lite-examples \
+                                tensorflow-lite \
                                 pdm-anomaly-detection \
 "
 
@@ -170,12 +172,14 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
                                    arm-compute-library \
                                    ${ARMNN_PACKAGES} \
                                    tensorflow-lite-examples \
+                                   tensorflow-lite \
                                    pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
                              ${ARMNN_PACKAGES} \
                              tensorflow-lite-examples \
+                             tensorflow-lite \
                              pdm-anomaly-detection \
 "
 
-- 
2.17.1


