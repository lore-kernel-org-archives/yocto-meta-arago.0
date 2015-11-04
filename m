Return-Path: <h-gou@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 822FA52AB0
	for <meta-arago@arago-project.org>;
	Wed,  4 Nov 2015 20:00:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4K0LNa028796
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:00:21 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4K0LKT018222
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:00:21 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Nov 2015 14:00:22 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA4K0JUw001906;	Wed, 4 Nov 2015 14:00:21 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Nov 2015 15:00:17 -0500
Message-ID: <1446667217-21466-8-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446667217-21466-1-git-send-email-h-gou@ti.com>
References: <1446667217-21466-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] packagegroup-arago-tisdk-matrix: update the SGX demos for ti43x
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
X-List-Received-Date: Wed, 04 Nov 2015 20:00:23 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb           | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index a6d1b39..a63b8ea 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r45"
+PR = "r46"
 
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


