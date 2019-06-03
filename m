Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9C604529DF
	for <meta-arago@arago-project.org>;
	Mon,  3 Jun 2019 21:36:38 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x53La2Jg127742
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 16:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559597762;
	bh=s3b3TRLb3PPav6sv1qJjKfA5WlqWSKwiwkxjmRGIgxs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=L8QW/bqCnBzIcbO5Yh6i9BHx0AcWQFBh88wUoy99RsH0uS9QfPbbw8tEIBneekatU
	0IhvnrXhDnaSYmC11GVfXJ3qr0sLlsLCEAUt7zeOmXxqCdAFxJjDPn77eP8f6HaML9
	sCZjHDyD49gOtsueyN+xzD1IeF4Eu7W6eFJYLycM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x53La1vb099828
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 16:36:02 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 3 Jun 2019 16:36:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 3 Jun 2019 16:36:01 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x53La0V9022105;
	Mon, 3 Jun 2019 16:36:01 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Jun 2019 17:34:45 -0400
Message-ID: <20190603213445.13887-5-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603213445.13887-1-h-gou@ti.com>
References: <20190603213445.13887-1-h-gou@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH 4/4] packagegroup-arago-tisdk-matrix: add matrix-analytics-pdm-anomaly-detection demo
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
X-List-Received-Date: Mon, 03 Jun 2019 21:36:40 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 2b7ee6de..1298a0d4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r78"
+PR = "r79"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -115,6 +115,7 @@ MATRIX_APPS_append_ti33x = "        \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
                                     \
     ${MATRIX_ARMNN_APPS}            \
+    matrix-analytics-pdm-anomaly-detection \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -138,6 +139,7 @@ MATRIX_APPS_append_ti43x = "        \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
                                     \
     ${MATRIX_ARMNN_APPS}            \
+    matrix-analytics-pdm-anomaly-detection \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
@@ -160,6 +162,7 @@ MATRIX_APPS_append_omap-a15 = "     \
     ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
                                 \
     ${MATRIX_ARMNN_APPS}            \
+    matrix-analytics-pdm-anomaly-detection \
 "
 
 MATRIX_APPS_append_k3 = "           \
@@ -175,6 +178,7 @@ MATRIX_APPS_append_k3 = "           \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
                                     \
     ${MATRIX_ARMNN_APPS}            \
+    matrix-analytics-pdm-anomaly-detection \
 "
 
 MATRIX_APPS_append_dra7xx += " \
-- 
2.17.1


