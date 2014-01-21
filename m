Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A945B529AD
	for <meta-arago@arago-project.org>;
	Tue, 21 Jan 2014 15:51:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0LFpEwB029925
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 09:51:14 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0LFpD2M018904
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 09:51:14 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 21 Jan 2014 09:51:13 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0LFp8Ix010155;
	Tue, 21 Jan 2014 09:51:12 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Jan 2014 11:14:17 -0600
Message-ID: <1390324458-29919-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1390324458-29919-1-git-send-email-Chase.Maupin@ti.com>
References: <1390324458-29919-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] package-group-tisdk-matrix: add ts-calibrate-init
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
X-List-Received-Date: Tue, 21 Jan 2014 15:51:14 -0000
Content-Type: text/plain

* Add the ts-calibrate-init package for everything except dra7xx
  which does not require calibration for its touchscreen.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 220d77f..8a717ba 100644
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
@@ -78,8 +80,12 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
-                                    \
     matrix-gui-wifi-demos           \
+    ts-calibrate-init \
+"
+
+MATRIX_APPS_append_omap5-evm = "     \
+    ts-calibrate-init \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
-- 
1.7.0.4


