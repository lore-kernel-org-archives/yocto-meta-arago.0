Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A671152A24
	for <meta-arago@arago-project.org>;
	Thu, 22 Jan 2015 16:42:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0MGgq4Q007798
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 10:42:52 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0MGgpvb017281
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 10:42:51 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 22 Jan 2015 10:42:50 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0MGgoBo003094;	Thu, 22 Jan 2015 10:42:50 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0MGgiaF021460;	Thu, 22 Jan 2015 22:12:48 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jan 2015 10:42:40 -0600
Message-ID: <1421944962-32315-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421944962-32315-1-git-send-email-fcooper@ti.com>
References: <1421944962-32315-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/5] matrix-gui-pm-demos: Use static set PM governor application
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
X-List-Received-Date: Thu, 22 Jan 2015 16:42:59 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Switch from dynamic PM governor applications to static version.
* By default the kernel list only governors that are builtin but your still able
  to request a governor module by asking for it.
* Therefore, depending on the available governor list is miss leading since you
  may actually use governors that aren't on this list.
* So instead of dynamically listing what governors you have, simply create
  Matrix static apps for governors you know you have.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-pm-demos_2.0.bb |   19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
index 8aefde6..f0fad03 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
@@ -3,25 +3,12 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 inherit allarch
 
 S = "${WORKDIR}/git/power_apps"
 
-
-do_install_prepend(){
-   install -d ${D}${MATRIX_BASE_DIR}/html-apps/
-
-   cp -rf ${S}/set_governor/power-set-governor ${D}${MATRIX_BASE_DIR}/html-apps/
-
-}
-
-do_install_append(){
-    rm ${D}${MATRIX_APP_DIR}/set_governor/set-governor.php
-}
-
-
 # Make sure power submenu and app images has been installed
 RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-power matrix-gui-generic-pm"
 
@@ -36,8 +23,8 @@ FILES_${PN}-dump-reg += "${MATRIX_APP_DIR}/pm_dump_reg/*"
 FILES_${PN}-snapshot1 += "${MATRIX_APP_DIR}/pm_snapshot_1/*"
 FILES_${PN}-snapshot2 += "${MATRIX_APP_DIR}/pm_snapshot_2/*"
 FILES_${PN}-suspend += "${MATRIX_APP_DIR}/pm_suspend/*"
-FILES_${PN}-governor += "${MATRIX_APP_DIR}/set_governor/* \
-                         ${MATRIX_BASE_DIR}/html-apps/power-set-governor/*"
+FILES_${PN}-governor += "${MATRIX_APP_DIR}/pm_userspace_governor/* \
+                         ${MATRIX_APP_DIR}/pm_ondemand_governor/*"
 
 # Split the ${bindir} files by PM app
 FILES_${PN}-count += "${bindir}/pm_count.sh"
-- 
1.7.9.5


