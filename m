Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9EA1652A6A
	for <meta-arago@arago-project.org>;
	Thu, 11 Jul 2013 20:05:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6BK5cPV010782
	for <meta-arago@arago-project.org>; Thu, 11 Jul 2013 15:05:38 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6BK5cYZ023459
	for <meta-arago@arago-project.org>; Thu, 11 Jul 2013 15:05:38 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 11 Jul 2013 15:05:38 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6BK5O0M012445;
	Thu, 11 Jul 2013 15:05:37 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 11 Jul 2013 15:23:30 -0500
Message-ID: <1373574210-4398-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1373574210-4398-1-git-send-email-fcooper@ti.com>
References: <1373574210-4398-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [master & danny][PATCH 5/5] packagegroup-arago-tisdk-matrix: Clock app doesnt work on older boards.
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
X-List-Received-Date: Thu, 11 Jul 2013 20:05:39 -0000
Content-Type: text/plain

* Don't install by default since some older boards don't support the Clock demo.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index f52eb4a..287baf9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r19"
+PR = "r20"
 
 inherit packagegroup
 
@@ -23,7 +23,6 @@ MATRIX_COMMON_APPS = "              \
     matrix-gui-settings-demos       \
     matrix-gui-usb-demos            \
     matrix-gui-submenus-ethernet    \
-    matrix-gui-clocks               \
 "
 
 MATRIX_QT_APPS = "                  \
@@ -61,6 +60,7 @@ MATRIX_APPS_append_ti33x = "        \
                                     \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
+    matrix-gui-clocks               \
                                     \
     matrix-gui-wifi-demos           \
     matrix-gui-bluetooth-demos      \
@@ -97,6 +97,7 @@ MATRIX_APPS_append_am37x-evm = "    \
     matrix-gui-camera-loopback      \
     matrix-gui-v4l2-demos           \
     matrix-gui-display-control      \
+    matrix-gui-clocks               \
                                     \
     matrix-gui-wifi-demos           \
     matrix-gui-bluetooth-demos      \
-- 
1.7.0.4


