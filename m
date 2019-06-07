Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 6038C5298B
	for <meta-arago@arago-project.org>;
	Fri,  7 Jun 2019 14:06:01 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x57E5LDL049532
	for <meta-arago@arago-project.org>; Fri, 7 Jun 2019 09:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559916321;
	bh=QjEKrTRxglZWpm99p3sVcpX4RRiruGsGk8l19zcnEW4=;
	h=From:To:Subject:Date;
	b=FyNHMGJ5qS5MXiXL7bUxXAlkWn2Iv/PufWxKE1m5/DsuW6fWQPSSQnfrmkV3rwF4b
	C2BzYscVLXfynnxodcAU5sLwdXmGNCcCmHujlMi4AJrzKZKIqwTW70wGcQaBcyuumu
	5mpoxbFz27KW01Nn9FXU3o4VZq2wKtNoYFR+pBrk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x57E5LfO083766
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 7 Jun 2019 09:05:21 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 7 Jun 2019 09:05:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 7 Jun 2019 09:05:21 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x57E5KXD115509
	for <meta-arago@arago-project.org>; Fri, 7 Jun 2019 09:05:21 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Jun 2019 10:05:02 -0400
Message-ID: <20190607140503.29694-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] packagegroup-arago-tisdk-matrix: remove matrix-gui browser demo tentatively
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
X-List-Received-Date: Fri, 07 Jun 2019 14:06:01 -0000
Content-Type: text/plain

Matrix-gui browser demos depend on qtwebengine which has been disabled for
now


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 100d4070..ad131dca 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r79"
+PR = "r80"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -159,12 +159,14 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-generic-pm           \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
-    ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
-                                \
     ${MATRIX_ARMNN_APPS}            \
     matrix-analytics-pdm-anomaly-detection \
 "
 
+#    ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
+#                                \
+#
+
 MATRIX_APPS_append_k3 = "           \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-audiocapture \
-- 
2.17.1


