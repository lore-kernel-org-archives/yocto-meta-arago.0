Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E68C852A19
	for <meta-arago@arago-project.org>;
	Mon,  9 Nov 2015 23:01:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA9N1A2H010763
	for <meta-arago@arago-project.org>; Mon, 9 Nov 2015 17:01:10 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA9N194R026625
	for <meta-arago@arago-project.org>; Mon, 9 Nov 2015 17:01:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Nov 2015 17:01:09 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA9N19TR027908;	Mon, 9 Nov 2015 17:01:09 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Nov 2015 18:01:07 -0500
Message-ID: <1447110067-11943-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 7/7 v2] packagegroup-arago-tisdk-matrix: update the SGX demos for ti43x
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
X-List-Received-Date: Mon, 09 Nov 2015 23:01:11 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
v2 changes: rebase the patch with the recent opencl changes

 .../packagegroups/packagegroup-arago-tisdk-matrix.bb           | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index c487d46..fde7c8f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r46"
+PR = "r47"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -49,6 +49,14 @@ MATRIX_SGX_DEMOS_omap-a15 = " \
     matrix-3d-demo-kmscubevideo \
 "
 
+MATRIX_SGX_DEMOS_ti43x = " \
+    matrix-3d-demo-chameleon \
+    matrix-3d-demo-coverflow \
+    matrix-3d-demo-navigation \
+    matrix-3d-demo-exampleui \
+    matrix-3d-demo-kmscube \
+"
+
 MATRIX_QT_APPS_keystone = ""
 
 MATRIX_APPS = ""
-- 
1.9.1


