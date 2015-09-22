Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A5BD452979
	for <meta-arago@arago-project.org>;
	Tue, 22 Sep 2015 14:45:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8MEjUVI005788
	for <meta-arago@arago-project.org>; Tue, 22 Sep 2015 09:45:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8MEjUwW022633
	for <meta-arago@arago-project.org>; Tue, 22 Sep 2015 09:45:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 22 Sep 2015 09:45:30 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8MEjUsA016888;
	Tue, 22 Sep 2015 09:45:30 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZeOoz-0005Jb-Sy; Tue, 22 Sep 2015 10:45:29 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 22 Sep 2015 10:45:26 -0400
Message-ID: <1442933128-20397-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/3] matrix-gui-submenus: Clean up very long lines
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
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb | 36 ++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index 240ff74..e23d31c 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -15,7 +15,22 @@ inherit allarch
 S = "${WORKDIR}/git"
 
 # List of submenus to build packages for
-SUBMENUS = "arm_submenu 3d_submenu cryptos_submenu display_submenu ethernet_submenu multimedia_submenu power_submenu pru_submenu qt4_submenu settings_submenu usb_submenu wifi_submenu oprofile_submenu utilities_submenu mc_demo_submenu"
+SUBMENUS = " arm_submenu \
+             3d_submenu \
+             cryptos_submenu \
+             display_submenu \
+             ethernet_submenu \
+             multimedia_submenu \
+             power_submenu \
+             pru_submenu \
+             qt4_submenu \
+             settings_submenu \
+             usb_submenu \
+             wifi_submenu \
+             oprofile_submenu \
+             utilities_submenu \
+             mc_demo_submenu \
+"
 
 do_install(){
     install -d ${D}${MATRIX_APP_DIR}
@@ -26,7 +41,24 @@ do_install(){
     done
 }
 
-PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display ${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4 ${PN}-qt5 ${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile ${PN}-camera  ${PN}-utility ${PN}-mc-demo"
+PACKAGES += " ${PN}-arm \
+              ${PN}-3d \
+              ${PN}-cryptos \
+              ${PN}-display \
+              ${PN}-ethernet \
+              ${PN}-multimedia \
+              ${PN}-power \
+              ${PN}-pru \
+              ${PN}-qt4 \
+              ${PN}-qt5 \
+              ${PN}-settings \
+              ${PN}-usb \
+              ${PN}-wifi \
+              ${PN}-oprofile \
+              ${PN}-camera \
+              ${PN}-utility \
+              ${PN}-mc-demo \
+"
 
 # Make sure app images has been installed
 RDEPENDS_${PN} += "matrix-gui-apps-images"
-- 
1.9.1


