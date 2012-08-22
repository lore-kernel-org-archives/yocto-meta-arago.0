Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3E1C252A6F
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 13:58:49 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MDwmxU009301
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 08:58:48 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MDwmdt004650
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 08:58:48 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 22 Aug 2012 08:58:48 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7MDwmY1030390;	Wed, 22 Aug 2012 08:58:48 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T4Be3-0001En-M5; Wed, 22 Aug 2012 09:10:55 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 22 Aug 2012 09:10:52 -0500
Message-ID: <1345644652-4716-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-extras][PATCH] matrix-gui-pm-demos: Update pm demos to the latest version. Add dependency.
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
X-List-Received-Date: Wed, 22 Aug 2012 13:58:49 -0000
Content-Type: text/plain

* Update the pm demos to include additional demos.
* Add a dependency to matrix-gui-generic-pm

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-pm-demos_2.0.bb |   23 +++++++++++++++++--
 1 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
index ceb20c0..74a9c2e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
@@ -4,13 +4,30 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit allarch
 
 S = "${WORKDIR}/git/power_apps"
 
 # Make sure power submenu and app images has been installed
-RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-power"
+RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-power matrix-gui-generic-pm"
 
-FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+# Break out the individual files into separate packages.  That way only the
+# PM features supported for each device can be installed.  Prepend the list
+# so that we can get the files in ${bindir} first.
+PACKAGES =+ "${PN}-count ${PN}-dump-reg ${PN}-snapshot1 ${PN}-snapshot2 ${PN}-suspend"
+
+# Split the matrix files by PM app
+FILES_${PN}-count += "${MATRIX_APP_DIR}/pm_count/*"
+FILES_${PN}-dump-reg += "${MATRIX_APP_DIR}/pm_dump_reg/*"
+FILES_${PN}-snapshot1 += "${MATRIX_APP_DIR}/pm_snapshot_1/*"
+FILES_${PN}-snapshot2 += "${MATRIX_APP_DIR}/pm_snapshot_2/*"
+FILES_${PN}-suspend += "${MATRIX_APP_DIR}/pm_suspend/*"
+
+# Split the ${bindir} files by PM app
+FILES_${PN}-count += "${bindir}/pm_count.sh"
+FILES_${PN}-dump-reg += "${bindir}/pm_dump_reg.sh"
+FILES_${PN}-snapshot1 += "${bindir}/pm_snapshot_1.sh"
+FILES_${PN}-snapshot2 += "${bindir}/pm_snapshot_2.sh"
+FILES_${PN}-suspend += "${bindir}/pm_suspend.sh"
-- 
1.7.0.4


