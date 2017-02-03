Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id CC9AF52A69
	for <meta-arago@arago-project.org>;
	Fri,  3 Feb 2017 22:22:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v13MMabc009569
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2017 16:22:36 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v13MMVBp005409
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2017 16:22:31 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Feb 2017 16:22:30 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v13MMTL2025786;	Fri, 3 Feb 2017 16:22:31 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Feb 2017 17:22:18 -0500
Message-ID: <1486160539-23523-6-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1486160539-23523-1-git-send-email-h-gou@ti.com>
References: <1486160539-23523-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH 5/6] packagegroup-arago-tisdk-matrix: add barcode-roi demo
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
X-List-Received-Date: Fri, 03 Feb 2017 22:22:47 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb   | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index a851ed5..7358da4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r61"
+PR = "r62"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -76,6 +76,7 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-pm-demos-governor    \
                                     \
     matrix-gui-ethernet-demos       \
+    matrix-machinevision-demo-barcoderoi \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -91,6 +92,7 @@ MATRIX_APPS_append_ti43x = "        \
                                     \
     matrix-gui-apps-dual-camera     \
     matrix-gui-apps-image-gallery   \
+    matrix-machinevision-demo-barcoderoi \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
@@ -105,6 +107,7 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-generic-pm           \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
+    matrix-machinevision-demo-barcoderoi \
 "
 
 MATRIX_APPS_append_dra7xx += " \
@@ -116,6 +119,7 @@ MATRIX_APPS_append_keystone = " \
     matrix-gui-utility-demos    \
     matrix-mc-demo-ipc          \
     matrix-multimedia-demo-dsp66imgproc-f2f \
+    matrix-machinevision-demo-barcoderoi-f2f \
 "
 
 RDEPENDS_${PN} = "        \
-- 
1.9.1


