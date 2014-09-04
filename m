Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8D7DC52A9A
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 15:34:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84FYKtW019061
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 10:34:20 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84FYKtP031899
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 10:34:20 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 10:34:20 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84FYFkb029950;
	Thu, 4 Sep 2014 10:34:19 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 21:04:12 +0530
Message-ID: <1409844854-17247-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409844854-17247-1-git-send-email-a0393906@ti.com>
References: <1409844854-17247-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master] [PATCH 1/3] tisdk-connectivity: Add support for omap-a15 based targets
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
X-List-Received-Date: Thu, 04 Sep 2014 15:34:21 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb       | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index f6c8660..7c5c565 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r29"
+PR = "r30"
 
 inherit packagegroup
 
@@ -63,6 +63,13 @@ CONNECTIVITY_RDEPENDS_ti43x = "\
     ${FIRMWARE_AND_DRIVERS} \
 "
 
+CONNECTIVITY_RDEPENDS_omap-a15 = "\
+    ${WLAN_COMMON} \
+    ${BLUETOOTH_STACK} \
+    ${@base_contains('ARAGO_BRAND','glsdk','${FIRMWARE_AND_DRIVERS}','',d)} \
+    bt-firmware \
+"
+
 RDEPENDS_${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
 "
-- 
2.0.1


