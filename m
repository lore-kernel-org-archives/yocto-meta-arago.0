Return-Path: <qsu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3EA54529D0
	for <meta-arago@arago-project.org>;
	Fri,  7 Dec 2018 19:28:57 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB7JSjVj058819
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2018 13:28:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544210925;
	bh=dRKZtY/NwjGkRAHBHvCOdm5J316K5JeRWFQfh6leis0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=H0miMZwJRgJteQzVSgioFFB4EYh/EKGS10HZzmNLX1CznunQgo3okDWdlcr5+jKs9
	N6qPnVZyEVZWGYvAn1jxU60DxHYPwx8iZK6WeYKwJ3OUa7/yu+HaLsNcUWpCIvFMqi
	LaVkt920PSU4RR4iRJ4xAXaXTWGcw7BTEG5czroo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB7JSjsG041328
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2018 13:28:45 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 7 Dec 2018 13:28:45 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 7 Dec 2018 13:28:45 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB7JSiJl021043
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2018 13:28:45 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Dec 2018 14:28:39 -0500
Message-ID: <1544210919-14906-3-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1544210919-14906-1-git-send-email-qsu@ti.com>
References: <1544210919-14906-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 3/3] packagegroup-arago-tisdk-matrix: add Arm NN Matrix GUI demo examples
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
X-List-Received-Date: Fri, 07 Dec 2018 19:28:58 -0000
Content-Type: text/plain

Signed-off-by: Qin Su <qsu@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb       | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index d3ab6ec..5ddaa9f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r75"
+PR = "r76"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -106,6 +106,9 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-hmi-demo-protection-relays \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
+                                    \
+    matrix-armnn-demo-staticimg     \
+    matrix-armnn-demo-livecam       \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -126,6 +129,9 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-hmi-demo-evse            \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
+                                    \
+    matrix-armnn-demo-staticimg     \
+    matrix-armnn-demo-livecam       \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
@@ -145,6 +151,9 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
     ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
+                                \
+    matrix-armnn-demo-staticimg \
+    matrix-armnn-demo-livecam   \
 "
 
 MATRIX_APPS_append_k3 = "           \
@@ -157,6 +166,9 @@ MATRIX_APPS_append_k3 = "           \
     matrix-hmi-demo-evse            \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
+                                    \
+    matrix-armnn-demo-staticimg     \
+    matrix-armnn-demo-livecam       \
 "
 
 MATRIX_APPS_append_dra7xx += " \
-- 
1.9.1


