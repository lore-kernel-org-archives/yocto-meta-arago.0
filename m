Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 82CAA52979
	for <meta-arago@arago-project.org>;
	Wed,  9 Sep 2015 17:52:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t89HqnxI007985
	for <meta-arago@arago-project.org>; Wed, 9 Sep 2015 12:52:49 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t89HqnmV032391
	for <meta-arago@arago-project.org>; Wed, 9 Sep 2015 12:52:49 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 9 Sep 2015 12:52:41 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t89Hqn7T002747;
	Wed, 9 Sep 2015 12:52:49 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZZjY8-0003UV-Uj; Wed, 09 Sep 2015 13:52:49 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 9 Sep 2015 13:52:47 -0400
Message-ID: <1441821167-13385-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-tisdk-matrix: Add 3d demos for omap-a15.
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
X-List-Received-Date: Wed, 09 Sep 2015 17:52:50 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb      | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 92887e6..422e9cd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r43"
+PR = "r44"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -39,6 +39,14 @@ MATRIX_SGX_DEMOS = "                \
     matrix-3d-demo-lantern          \
     matrix-3d-demo-skull            \
 "
+
+MATRIX_SGX_DEMOS_omap-a15 = " \
+    matrix-3d-demo-chameleon \
+    matrix-3d-demo-coverflow \
+    matrix-3d-demo-navigation \
+    matrix-3d-demo-exampleui \
+"
+
 MATRIX_QT_APPS_keystone = ""
 
 MATRIX_APPS = ""
@@ -88,16 +96,19 @@ MATRIX_APPS_append_ti43x = "        \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
+    ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
+                                    \
     matrix-multimedia-demo-aac      \
+    matrix-multimedia-demo-h265dec  \
     ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264dec','matrix-multimedia-demo-h264dec',d)} \
     ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264enc','',d)} \
     ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec','',d)} \
     ${@base_contains('MACHINE_FEATURES','mmip','','matrix-multimedia-demo-mpeg4aacdec',d)} \
     ${@base_contains('MACHINE_FEATURES','mmip','','matrix-multimedia-demo-mpeg4dec',d)} \
+                                    \
     matrix-gui-generic-pm           \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
-    matrix-multimedia-demo-h265dec \
 "
 
 MATRIX_APPS_append_beagleboard = "  \
-- 
1.9.1


