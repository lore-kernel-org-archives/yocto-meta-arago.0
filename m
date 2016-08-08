Return-Path: <h-gou@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2540F5209D
	for <meta-arago@arago-project.org>;
	Mon,  8 Aug 2016 16:49:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u78GnlET024240
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 11:49:47 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u78Gnkk1019283
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 11:49:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 8 Aug 2016 11:49:46 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u78Gnk6T011145;	Mon, 8 Aug 2016 11:49:46 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Aug 2016 12:49:41 -0400
Message-ID: <1470674983-6925-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/3] matrix-gui-submenus: add machinevision submenu
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
X-List-Received-Date: Mon, 08 Aug 2016 16:49:48 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index 6fdaccd..71d76f8 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -7,7 +7,7 @@ require matrix-gui-apps-git.inc
 # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
-PR = "${INC_PR}.15"
+PR = "${INC_PR}.16"
 
 # These packages make submenus in matrix and are not architecture specific
 inherit allarch
@@ -32,6 +32,7 @@ SUBMENUS = " arm_submenu \
              mc_demo_submenu \
              opencl_submenu \
              videoanalytics_submenu \
+             machinevision_submenu \
 "
 
 do_install(){
@@ -62,6 +63,7 @@ PACKAGES += " ${PN}-arm \
               ${PN}-mc-demo \
               ${PN}-opencl \
               ${PN}-videoanalytics \
+              ${PN}-machinevision \
 "
 
 # Make sure app images has been installed
@@ -87,3 +89,4 @@ FILES_${PN}-utility = "${MATRIX_APP_DIR}/utilities_submenu/*"
 FILES_${PN}-mc-demo = "${MATRIX_APP_DIR}/mc_demo_submenu/*"
 FILES_${PN}-opencl = "${MATRIX_APP_DIR}/opencl_submenu/*"
 FILES_${PN}-videoanalytics = "${MATRIX_APP_DIR}/videoanalytics_submenu/*"
+FILES_${PN}-machinevision = "${MATRIX_APP_DIR}/machinevision_submenu/*"
-- 
1.9.1


