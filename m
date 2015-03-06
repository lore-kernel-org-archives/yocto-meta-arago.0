Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id AFF4452A63
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2015 20:17:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t26KHLmv003786
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2015 14:17:21 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t26KHJwB006744
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2015 14:17:20 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Mar 2015 14:17:19 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t26KHJOC016229;
	Fri, 6 Mar 2015 14:17:19 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YTygR-0000Ek-Fa;
	Fri, 06 Mar 2015 15:17:19 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Mar 2015 15:17:18 -0500
Message-ID: <1425673038-871-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] packagegroup-arago-tisdk-matrix: Add dual-camera-demo.
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
X-List-Received-Date: Fri, 06 Mar 2015 20:17:21 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2: Bump PR

 .../packagegroup-arago-tisdk-matrix.bb             |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 9e00619..d8386f5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r35"
+PR = "r36"
 
 inherit packagegroup
 
@@ -82,9 +82,10 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
+    matrix-gui-apps-dual-camera     \
+    matrix-gui-apps-image-gallery   \
     ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d)} \
 "
-# ${@base_conditional('QT_PROVIDER', 'qt5', '', 'matrix-gui-apps-dual-camera matrix-gui-apps-image-gallery', d)}
 
 MATRIX_APPS_append_omap-a15 = "     \
     matrix-multimedia-demo-aac      \
-- 
1.7.9.5


