Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DA64B52A7C
	for <meta-arago@arago-project.org>;
	Fri,  7 Jun 2013 20:26:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r57KQE5W026667
	for <meta-arago@arago-project.org>; Fri, 7 Jun 2013 15:26:14 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r57KQEj7004176
	for <meta-arago@arago-project.org>; Fri, 7 Jun 2013 15:26:14 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 7 Jun 2013 15:26:14 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r57KQ2sn025009;
	Fri, 7 Jun 2013 15:26:12 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Jun 2013 15:32:57 -0500
Message-ID: <1370637177-13018-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1370637177-13018-1-git-send-email-fcooper@ti.com>
References: <1370637177-13018-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] packagegroup-arago-tisdk-matrix: Remove unneeded matrix-gui-clocks-<frequency>
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
X-List-Received-Date: Fri, 07 Jun 2013 20:26:15 -0000
Content-Type: text/plain

* New matrix-gui-clocks package replaces all the individual packages for the
  different frequencies.
* This new package should work on all platforms and is dynamic so make it a
  "default" Matrix application.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 8ff69cb..5c04359 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
 inherit packagegroup
 
@@ -23,6 +23,7 @@ MATRIX_COMMON_APPS = "              \
     matrix-gui-settings-demos       \
     matrix-gui-usb-demos            \
     matrix-gui-submenus-ethernet    \
+    matrix-gui-clocks               \
 "
 
 MATRIX_QT_APPS = "                  \
@@ -58,11 +59,6 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-multimedia-demo-mpeg4aacdec   \
     matrix-multimedia-demo-mpeg4dec     \
                                     \
-    matrix-gui-clocks-275mhz        \
-    matrix-gui-clocks-500mhz        \
-    matrix-gui-clocks-600mhz        \
-    matrix-gui-clocks-720mhz        \
-                                    \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
                                     \
@@ -88,10 +84,6 @@ MATRIX_APPS_append_am3517-evm = "   \
 "
 
 MATRIX_APPS_append_am37x-evm = "    \
-    matrix-gui-clocks-300mhz        \
-    matrix-gui-clocks-600mhz        \
-    matrix-gui-clocks-800mhz        \
-    matrix-gui-clocks-1ghz          \
                                     \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-count       \
-- 
1.7.0.4


