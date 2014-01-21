Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E727852A22
	for <meta-arago@arago-project.org>;
	Tue, 21 Jan 2014 18:26:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0LIQUqP012831
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 12:26:30 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0LIQUFC013549
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 12:26:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 21 Jan 2014 12:26:30 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0LIQOMY020644;
	Tue, 21 Jan 2014 12:26:28 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Jan 2014 13:49:37 -0600
Message-ID: <1390333777-32012-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1390333777-32012-1-git-send-email-Chase.Maupin@ti.com>
References: <1390333777-32012-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCHv2 2/3] packagegroup-tisdk-matrix: add ts-calibrate-init
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
X-List-Received-Date: Tue, 21 Jan 2014 18:26:31 -0000
Content-Type: text/plain

* Add the ts-calibrate-init package for everything except dra7xx
  which does not require calibration for its touchscreen.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
Updated in version 2
    * Do not add calibration for OMAP5 platform which has no
      touchscreen.
---
 .../packagegroup-arago-tisdk-matrix.bb             |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 220d77f..95ecb2a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r26"
+PR = "r27"
 
 inherit packagegroup
 
@@ -49,6 +49,7 @@ MATRIX_APPS_append_omap3 = "        \
     matrix-multimedia-demo-h264dec      \
     matrix-multimedia-demo-mpeg4aacdec   \
     matrix-multimedia-demo-mpeg4dec     \
+    ts-calibrate-init \
 "
 
 MATRIX_APPS_append_ti33x = "        \
@@ -65,6 +66,7 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-clocks               \
                                     \
     matrix-gui-wifi-demos           \
+    ts-calibrate-init \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -78,8 +80,8 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
-                                    \
     matrix-gui-wifi-demos           \
+    ts-calibrate-init \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
-- 
1.7.0.4


