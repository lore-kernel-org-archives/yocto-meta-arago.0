Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C167D52A81
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 21:31:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB4LVKbR008883
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 15:31:20 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB4LVKF7013408
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 15:31:20 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Dec 2013 15:31:19 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB4LVE0g007220;
	Wed, 4 Dec 2013 15:31:18 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Dec 2013 16:37:22 -0600
Message-ID: <1386196643-11077-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1386196643-11077-1-git-send-email-Chase.Maupin@ti.com>
References: <1386196643-11077-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] package-group-tisdk-matrix: add matrix-gui-tscal
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
X-List-Received-Date: Wed, 04 Dec 2013 21:31:21 -0000
Content-Type: text/plain

* Add the matrix-gui-tscal package for everything except dra7xx
  which does not require calibration for its touchscreen.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index c3143d3..f6d2495 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r23"
+PR = "r24"
 
 inherit packagegroup
 
@@ -49,6 +49,7 @@ MATRIX_APPS_append_omap3 = "        \
     matrix-multimedia-demo-h264dec      \
     matrix-multimedia-demo-mpeg4aacdec   \
     matrix-multimedia-demo-mpeg4dec     \
+    matrix-gui-tscal \
 "
 
 MATRIX_APPS_append_ti33x = "        \
@@ -66,6 +67,7 @@ MATRIX_APPS_append_ti33x = "        \
                                     \
     matrix-gui-wifi-demos           \
     matrix-gui-bluetooth-demos      \
+    matrix-gui-tscal \
 "
 
 #    matrix-gui-wifi-battleship-demo
@@ -82,6 +84,11 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
+    matrix-gui-tscal \
+"
+
+MATRIX_APPS_append_omap5-evm = "     \
+    matrix-gui-tscal \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
-- 
1.7.0.4


