Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 43295529EA
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2019 01:45:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4E1iTFK044185
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557798269;
	bh=fN5PNlpZs3xQRrj1kw56I3VmEUZPembbRHVURYWfuu8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BtjMTyBsTSyiBI7fvdV8RUZtHIzM49sxXDSBL7oJMEfBh1weoH3zomvNiV0B2j/p7
	cCgYufsopj4GUoUb1E9vyrKvgnLXjhyi4EDY+jJgdjeqPjGnsR3vz3FRfKQi0VDsBH
	sayQ+EVmEe/QA7ArGRSF+3IiqhPifeneD3cSGpkY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4E1iTJc044690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:29 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 13 May 2019 20:44:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 13 May 2019 20:44:29 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4E1iSuI064750
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:29 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 May 2019 21:44:17 -0400
Message-ID: <20190514014418.20156-5-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514014418.20156-1-e-ruei1@ti.com>
References: <20190514014418.20156-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 4/5] ackagegroup-arago-tisdk-matrix: replace qtwebengine browser with qtwebkit one
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
X-List-Received-Date: Tue, 14 May 2019 01:45:02 -0000
Content-Type: text/plain

- qtwebengine 5.11.3 does not work, replace it with qtwebkit until the
  fix is available

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 1e543616..2b7ee6de 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r77"
+PR = "r78"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -33,7 +33,7 @@ MATRIX_COMMON_APPS = "              \
 
 MATRIX_QT_APPS = " \
     matrix-qt5-demo-animated \
-    matrix-qt5-demo-browser \
+    matrix-qt5-demo-webkit-browser \
     matrix-qt5-demo-calculator \
     matrix-qt5-demo-deform \
     matrix-gui-thermostat-demo \
@@ -45,10 +45,10 @@ MATRIX_TOUCH_APPS = " \
 
 MATRIX_QT_APPS_keystone = ""
 MATRIX_QT_APPS_omapl138 = ""
-MATRIX_QT_APPS_remove_k3 = "matrix-qt5-demo-browser"
-MATRIX_QT_APPS_append_k3 = " \
-    matrix-qt5-demo-webkit-browser \
-"
+#MATRIX_QT_APPS_remove_k3 = "matrix-qt5-demo-browser"
+#MATRIX_QT_APPS_append_k3 = " \
+#    matrix-qt5-demo-webkit-browser \
+#"
 
 MATRIX_SGX_DEMOS = " \
     matrix-3d-demo-chameleon \
-- 
2.17.1


