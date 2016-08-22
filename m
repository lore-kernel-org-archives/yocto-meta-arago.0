Return-Path: <e-ruei1@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 88C33529DA
	for <meta-arago@arago-project.org>;
	Mon, 22 Aug 2016 20:26:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7MKQeJQ009712
	for <meta-arago@arago-project.org>; Mon, 22 Aug 2016 15:26:40 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7MKQd1v013279
	for <meta-arago@arago-project.org>; Mon, 22 Aug 2016 15:26:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 22 Aug 2016 15:26:38 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7MKQatn027787	for <meta-arago@arago-project.org>;
	Mon, 22 Aug 2016 15:26:38 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Aug 2016 16:19:07 -0400
Message-ID: <1471897150-34179-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1471897150-34179-1-git-send-email-e-ruei1@ti.com>
References: <1471897150-34179-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] matrix-gui-submenu: add touch submenu
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
X-List-Received-Date: Mon, 22 Aug 2016 20:26:40 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index 71d76f8..7e1f7d1 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -7,7 +7,7 @@ require matrix-gui-apps-git.inc
 # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
-PR = "${INC_PR}.16"
+PR = "${INC_PR}.17"
 
 # These packages make submenus in matrix and are not architecture specific
 inherit allarch
@@ -33,6 +33,7 @@ SUBMENUS = " arm_submenu \
              opencl_submenu \
              videoanalytics_submenu \
              machinevision_submenu \
+             touch_submenu \
 "
 
 do_install(){
@@ -64,6 +65,7 @@ PACKAGES += " ${PN}-arm \
               ${PN}-opencl \
               ${PN}-videoanalytics \
               ${PN}-machinevision \
+              ${PN}-touch \
 "
 
 # Make sure app images has been installed
@@ -90,3 +92,4 @@ FILES_${PN}-mc-demo = "${MATRIX_APP_DIR}/mc_demo_submenu/*"
 FILES_${PN}-opencl = "${MATRIX_APP_DIR}/opencl_submenu/*"
 FILES_${PN}-videoanalytics = "${MATRIX_APP_DIR}/videoanalytics_submenu/*"
 FILES_${PN}-machinevision = "${MATRIX_APP_DIR}/machinevision_submenu/*"
+FILES_${PN}-touch = "${MATRIX_APP_DIR}/touch_submenu/*"
-- 
1.9.1


