Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7E72E5297F
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2015 12:13:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2DCD5E5019202
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 07:13:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DCD3cv022915
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 07:13:03 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Mar 2015 07:13:03 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DCD3Th024671;
	Fri, 13 Mar 2015 07:13:03 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YWOSd-0007Ra-Dr;
	Fri, 13 Mar 2015 08:13:03 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Mar 2015 08:12:58 -0400
Message-ID: <1426248778-28584-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] matrix-gui-qt5-demos: Remove read_system_env.sh
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
X-List-Received-Date: Fri, 13 Mar 2015 12:13:05 -0000
Content-Type: text/plain

* This script is not needed since the matrix init script sets up the
  appropriate environment.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 .../matrix/matrix-gui-qt5-demos_2.0.bb             |    9 +--------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 6692520..8cef18a 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "7bf902f71af751e879bd1b67dc5197683cdf0e1e"
+SRCREV = "e8edfa25cee38f17523c845607c5de5fdd6d1a50"
 BRANCH = "master"
-INC_PR = "r27"
+INC_PR = "r28"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
index 0ed3707..2dfeba3 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
@@ -9,14 +9,7 @@ inherit allarch
 
 S = "${WORKDIR}/git/qt5_apps"
 
-do_install_prepend(){
-   install -d ${D}${bindir}
-   install -m 0755 ${S}/read_system_env.sh ${D}${bindir}/
-}
-
-
 # Make sure qt5 submenu and app images has been installed
 RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-qt5"
 
-FILES_${PN} += "${MATRIX_BASE_DIR}/* \
-                ${bindir}/read_system_env.sh"
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-- 
1.7.9.5


