Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2F57F52A3F
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 01:59:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7M1x04b029036
	for <meta-arago@arago-project.org>; Thu, 21 Aug 2014 20:59:00 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7M1x0a0014905
	for <meta-arago@arago-project.org>; Thu, 21 Aug 2014 20:59:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 21 Aug 2014 20:58:59 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7M1wwbQ025357;	Thu, 21 Aug 2014 20:58:59 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7M1wqCk002753;	Fri, 22 Aug 2014 07:28:57 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Aug 2014 20:58:46 -0500
Message-ID: <1408672731-19277-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408672731-19277-1-git-send-email-fcooper@ti.com>
References: <1408672731-19277-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/9] packagegroup-arago-tisdk-matrix: Add new PM Governor HTML App
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
X-List-Received-Date: Fri, 22 Aug 2014 01:59:01 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-pm-demos_2.0.bb |   20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
index e174574..8aefde6 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
@@ -3,19 +3,32 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 inherit allarch
 
 S = "${WORKDIR}/git/power_apps"
 
+
+do_install_prepend(){
+   install -d ${D}${MATRIX_BASE_DIR}/html-apps/
+
+   cp -rf ${S}/set_governor/power-set-governor ${D}${MATRIX_BASE_DIR}/html-apps/
+
+}
+
+do_install_append(){
+    rm ${D}${MATRIX_APP_DIR}/set_governor/set-governor.php
+}
+
+
 # Make sure power submenu and app images has been installed
 RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-power matrix-gui-generic-pm"
 
 # Break out the individual files into separate packages.  That way only the
 # PM features supported for each device can be installed.  Prepend the list
 # so that we can get the files in ${bindir} first.
-PACKAGES =+ "${PN}-count ${PN}-dump-reg ${PN}-snapshot1 ${PN}-snapshot2 ${PN}-suspend"
+PACKAGES =+ "${PN}-count ${PN}-dump-reg ${PN}-snapshot1 ${PN}-snapshot2 ${PN}-suspend ${PN}-governor"
 
 # Split the matrix files by PM app
 FILES_${PN}-count += "${MATRIX_APP_DIR}/pm_count/*"
@@ -23,6 +36,8 @@ FILES_${PN}-dump-reg += "${MATRIX_APP_DIR}/pm_dump_reg/*"
 FILES_${PN}-snapshot1 += "${MATRIX_APP_DIR}/pm_snapshot_1/*"
 FILES_${PN}-snapshot2 += "${MATRIX_APP_DIR}/pm_snapshot_2/*"
 FILES_${PN}-suspend += "${MATRIX_APP_DIR}/pm_suspend/*"
+FILES_${PN}-governor += "${MATRIX_APP_DIR}/set_governor/* \
+                         ${MATRIX_BASE_DIR}/html-apps/power-set-governor/*"
 
 # Split the ${bindir} files by PM app
 FILES_${PN}-count += "${bindir}/pm_count.sh"
@@ -30,3 +45,4 @@ FILES_${PN}-dump-reg += "${bindir}/pm_dump_reg.sh"
 FILES_${PN}-snapshot1 += "${bindir}/pm_snapshot_1.sh"
 FILES_${PN}-snapshot2 += "${bindir}/pm_snapshot_2.sh"
 FILES_${PN}-suspend += "${bindir}/pm_suspend.sh"
+FILES_${PN}-governor += "${bindir}/setgovernor.sh"
-- 
1.7.9.5


