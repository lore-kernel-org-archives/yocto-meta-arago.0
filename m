Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 03DF2520E3
	for <meta-arago@arago-project.org>;
	Fri, 14 Sep 2018 21:07:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8EL7n1V000801
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 16:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536959269;
	bh=vRDl4UTSipTq/H2MYbEcB1gEPzmLMKa7V+/wzsnCaUE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ra3I3p5nEqDUZEwZtXKH07LdvZy8wgFCS++lE4ueOZKE5b40pkrrzocqFbodRr/UR
	3mHJl0AInKiGHLvEAM1ut5atME+wZV24bZkAz62XVkE+fEWF8MyWjbawIGT6edhrVS
	FXflbkvEGBrWW/Tg51wg7A7mhMCH26SGsqj9w0Mw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EL7nXw007413
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 16:07:49 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 14 Sep 2018 16:07:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 14 Sep 2018 16:07:49 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EL7mCc016015
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 16:07:49 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Sep 2018 17:07:45 -0400
Message-ID: <1536959265-3351-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1536959265-3351-1-git-send-email-e-ruei1@ti.com>
References: <1536959265-3351-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 2/2] packagegroup-arago-tisdk-matrix: replace qt5 demo browser with webkit broswer for K3 devices
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
X-List-Received-Date: Fri, 14 Sep 2018 21:07:59 -0000
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


