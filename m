Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0675552AA9
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 21:47:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DLleFh013815
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 16:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536875260;
	bh=vRDl4UTSipTq/H2MYbEcB1gEPzmLMKa7V+/wzsnCaUE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=UlDfdK3+KnTygtLXEePt2vJR223q+kK5d/OSY34Lbl7IwhZ1mGnRWwUrl3X1WHSQM
	lmtYUMXxqFrPTBZpf7aZOoazzNkIFMuUht7WSzcuB4nwLVm6T1IjzXv1TSq/hFAbeJ
	1Co14GEjUSlrBBHycqe7WZK5iTof+w4iApvwsixs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DLleI7013055
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 16:47:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 16:47:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 16:47:40 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DLlerB010574
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 16:47:40 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Sep 2018 17:47:37 -0400
Message-ID: <1536875257-56734-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1536875257-56734-1-git-send-email-e-ruei1@ti.com>
References: <1536875257-56734-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] packagegroup-arago-tisdk-matrix: replace qt5 demo browser with webkit broswer for K3 devices
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
X-List-Received-Date: Thu, 13 Sep 2018 21:47:50 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb          | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 919bd41..edb7a50 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r73"
+PR = "r74"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -32,7 +32,10 @@ MATRIX_COMMON_APPS = "              \
 "
 
 MATRIX_QT_APPS = " \
-    matrix-gui-qt5-demos \
+    matrix-qt5-demo-animated \
+    matrix-qt5-demo-browser \
+    matrix-qt5-demo-calculator \
+    matrix-qt5-demo-deform \
     matrix-gui-thermostat-demo \
 "
 
@@ -42,6 +45,10 @@ MATRIX_TOUCH_APPS = " \
 
 MATRIX_QT_APPS_keystone = ""
 MATRIX_QT_APPS_omapl138 = ""
+MATRIX_QT_APPS_remove_k3 = "matrix-qt5-demo-browser"
+MATRIX_QT_APPS_append_k3 = " \
+    matrix-qt5-demo-webkit-browser \
+"
 
 MATRIX_SGX_DEMOS = " \
     matrix-3d-demo-chameleon \
-- 
1.9.1


