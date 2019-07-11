Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 89D8752092
	for <meta-arago@arago-project.org>;
	Thu, 11 Jul 2019 16:34:10 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6BGXM7M037167
	for <meta-arago@arago-project.org>; Thu, 11 Jul 2019 11:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562862802;
	bh=hcYWpoG5CJLk3X6PuYHc7iP/0II4eb8NS11mHWKqa8M=;
	h=From:To:CC:Subject:Date;
	b=Cofv2Vzeu3ow9OXltMZXW6kePDnoaHX8fHrA/qCeNxzun1nKSo/WSj8ckUgcNwMkH
	wrjOP9LW0vJ17zsw378EKmKoOMSv2VLMlLtLgkNAdeTNC+TER2Rb2Jco/jdUz0LC/E
	L5/2YjMboA5FI0yttCoproRWd75TctHFXA8kF+/M=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6BGXMIL006639
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 11 Jul 2019 11:33:22 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 11 Jul 2019 11:33:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 11 Jul 2019 11:33:22 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6BGXLL4071086;
	Thu, 11 Jul 2019 11:33:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 11 Jul 2019 12:16:39 -0400
Message-ID: <1562861799-2019-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] opencl, tidl: extend compatibility to dra7xx SOC family
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
X-List-Received-Date: Thu, 11 Jul 2019 16:34:11 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb | 2 +-
 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb      | 2 +-
 meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
index 003889c..9810322 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
@@ -20,7 +20,7 @@ DEPENDS = " common-csl-ip-rtos \
             opencl-tidl-fw \
 "
 
-COMPATIBLE_MACHINE = "dra7xx-evm|am57xx-evm|am57xx-hs-evm"
+COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/monitor_ipu"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
index 48f4db1..283a18e 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -8,7 +8,7 @@ require recipes-ti/includes/ti-paths.inc
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "dra7xx-evm|am57xx-evm|am57xx-hs-evm"
+COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit python3native
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
index c8efb93..c7016ad 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
@@ -8,7 +8,7 @@ require recipes-ti/includes/ti-paths.inc
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "dra7xx-evm|am57xx-evm|am57xx-hs-evm"
+COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "opencv \
-- 
2.7.4


