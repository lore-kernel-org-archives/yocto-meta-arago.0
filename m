Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6315152979
	for <meta-arago@arago-project.org>;
	Tue, 22 Sep 2015 14:45:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8MEjV6J005791
	for <meta-arago@arago-project.org>; Tue, 22 Sep 2015 09:45:31 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8MEjVdK017982
	for <meta-arago@arago-project.org>; Tue, 22 Sep 2015 09:45:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 22 Sep 2015 09:45:31 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8MEjV83001093;
	Tue, 22 Sep 2015 09:45:31 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZeOp0-0005Jg-SS; Tue, 22 Sep 2015 10:45:30 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 22 Sep 2015 10:45:27 -0400
Message-ID: <1442933128-20397-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1442933128-20397-1-git-send-email-j-stiffler@ti.com>
References: <1442933128-20397-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] matrix-gui-submenus: Add opencl submenu.
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
X-List-Received-Date: Tue, 22 Sep 2015 14:45:32 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index e23d31c..132b81a 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -7,7 +7,7 @@ require matrix-gui-apps-git.inc
 # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
-PR = "${INC_PR}.13"
+PR = "${INC_PR}.14"
 
 # These packages make submenus in matrix and are not architecture specific
 inherit allarch
@@ -30,6 +30,7 @@ SUBMENUS = " arm_submenu \
              oprofile_submenu \
              utilities_submenu \
              mc_demo_submenu \
+             opencl_submenu \
 "
 
 do_install(){
@@ -58,6 +59,7 @@ PACKAGES += " ${PN}-arm \
               ${PN}-camera \
               ${PN}-utility \
               ${PN}-mc-demo \
+              ${PN}-opencl \
 "
 
 # Make sure app images has been installed
@@ -81,3 +83,4 @@ FILES_${PN}-oprofile = "${MATRIX_APP_DIR}/oprofile_submenu/*"
 FILES_${PN}-camera = "${MATRIX_APP_DIR}/camera_submenu/*"
 FILES_${PN}-utility = "${MATRIX_APP_DIR}/utilities_submenu/*"
 FILES_${PN}-mc-demo = "${MATRIX_APP_DIR}/mc_demo_submenu/*"
+FILES_${PN}-opencl = "${MATRIX_APP_DIR}/opencl_submenu/*"
-- 
1.9.1


