Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BA66C52A15
	for <meta-arago@arago-project.org>;
	Tue, 25 Feb 2020 23:22:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PNKCCL065749
	for <meta-arago@arago-project.org>; Tue, 25 Feb 2020 17:20:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582672812;
	bh=U20JgLy91m4+rGIOy0IkRNfZuFsrX/4sehtQNN4tbhY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sjgGd4GvH3OO95kfz8GJb4AIszJQuYwY7fvqNAlqS4MXU447Raa0L06OmM3EkW9QC
	V4TbBi1+r95zj1QfauilKZncR6WuIif1LYGENqzIXOhmGR3Cbx4kLebdHs8U7jgbFQ
	W+ttchkr0sqnRdBbhpKdA9tKChnfaIWBFIj6hS8o=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PNKB6k112735
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 25 Feb 2020 17:20:11 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 25 Feb 2020 17:20:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 25 Feb 2020 17:20:11 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PNK5J3105846;
	Tue, 25 Feb 2020 17:20:11 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 25 Feb 2020 18:12:26 -0500
Message-ID: <20200225231226.24898-3-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225231226.24898-1-a0271529@ti.com>
References: <20200225231226.24898-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [zeus/master] [PATCH 3/3] packagegroup-arago-tisdk-addons: replace tensorflow-lite-examples with tensorflow-lite and add tensorflow-lite-demo
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
X-List-Received-Date: Tue, 25 Feb 2020 23:22:15 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bb             | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index a68662a7..2ed1abf7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r76"
+PR = "r77"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -156,14 +156,16 @@ VOXEL_PACKAGES = ""
 EXTRA_PACKAGES_append_ti33x = " ${VOXEL_PACKAGES} \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
-                                tensorflow-lite-examples \
+                                tensorflow-lite \
+                                tensorflow-lite-demo \
                                 pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_ti43x = " ${VOXEL_PACKAGES} \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
-                                tensorflow-lite-examples \
+                                tensorflow-lite \
+                                tensorflow-lite-demo \
                                 pdm-anomaly-detection \
 "
 
@@ -172,13 +174,15 @@ EXTRA_PACKAGES_append_omap-a15 = " ${VOXEL_PACKAGES} \
                                    big-data-ipc-demo-linux-firmware \
                                    arm-compute-library \
                                    ${ARMNN_PACKAGES} \
-                                   tensorflow-lite-examples \
+                                   tensorflow-lite \
+                                   tensorflow-lite-demo \
                                    pdm-anomaly-detection \
 "
 
 EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
                              ${ARMNN_PACKAGES} \
-                             tensorflow-lite-examples \
+                             tensorflow-lite \
+                             tensorflow-lite-demo \
                              pdm-anomaly-detection \
 "
 
-- 
2.17.1


