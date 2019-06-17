Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 65EEA52092
	for <meta-arago@arago-project.org>;
	Mon, 17 Jun 2019 12:53:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5HCqSNC127915
	for <meta-arago@arago-project.org>; Mon, 17 Jun 2019 07:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560775948;
	bh=qg7y+UD8j6j/wHmMfivG2QQUI2VkG++iS2mKX0UZR1g=;
	h=From:To:CC:Subject:Date;
	b=nz8Ha7t7iU3fZirqxRGjtxSanv5AM/ralxnNYnvl0TEmxgBMelphkD36i0/PCtbpi
	uCcsJ2208frCr5gLOSCUFURYW+7D+Q+EKmoiYtDPrLdau7hp8AO3vNrPxYL1r+dP7b
	Q6ltAGodgn6Q3E4hamDwB/3KuH2j6R/4LXXPRmWg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5HCqSs9037213
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 17 Jun 2019 07:52:28 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 17 Jun 2019 07:52:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 17 Jun 2019 07:52:28 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5HCqRnT086943;
	Mon, 17 Jun 2019 07:52:27 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Jun 2019 08:36:28 -0400
Message-ID: <1560774988-9601-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/ti2019.01][PATCH] Revert "packagegroups: disable armnn for now due to gcc8 breakage"
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
X-List-Received-Date: Mon, 17 Jun 2019 12:53:09 -0000
Content-Type: text/plain

This reverts commit dbc7318ccfef2fa2fd606a51b84965e32b4a2442.

The armnn build issues have been resolved.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb  | 3 +--
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 3 +--
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb             | 9 ++++-----
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 375473c..390effb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -153,8 +153,7 @@ EXTRA_LIBS_append_k2e = " libulm-staticdev \
                               gdbserver-c6x-dev \
 "
 
-ARMNN_PACKAGES = ""
-#ARMNN_PACKAGES = "armnn-dev"
+ARMNN_PACKAGES = "armnn-dev"
 
 EXTRA_PACKAGES = ""
 EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 2f903ff..a7be94a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -144,8 +144,7 @@ EXTRA_PACKAGES_omapl138 = " \
     protobuf \
 "
 
-ARMNN_PACKAGES = ""
-#ARMNN_PACKAGES = "armnn"
+ARMNN_PACKAGES = "armnn"
 
 EXTRA_PACKAGES_append_ti33x = " voxelsdk \
                                 arm-compute-library \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index e33f910..78f9c56 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -89,11 +89,10 @@ MATRIX_OPENCV_OPENCL_APPS_omap-a15 = " \
      matrix-machinevision-demo-simplepeopletracking \
 "
 
-MATRIX_ARMNN_APPS = ""
-#MATRIX_ARMNN_APPS = " \
-#    matrix-armnn-demo-staticimg     \
-#    matrix-armnn-demo-livecam       \
-#"
+MATRIX_ARMNN_APPS = " \
+    matrix-armnn-demo-staticimg     \
+    matrix-armnn-demo-livecam       \
+"
 
 MATRIX_APPS = ""
 
-- 
2.7.4


