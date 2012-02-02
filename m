Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 93ED852978
	for <meta-arago@arago-project.org>;
	Thu,  2 Feb 2012 22:58:45 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q12MwhQn003368
	for <meta-arago@arago-project.org>; Thu, 2 Feb 2012 16:58:43 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q12MwgU1012469
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2012 04:28:42 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 3 Feb 2012 04:28:41 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q12MwcgN008994;
	Fri, 3 Feb 2012 04:28:40 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 Feb 2012 16:58:36 -0600
Message-ID: <1328223516-14451-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] matrix-gui: remove use of config files
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
X-List-Received-Date: Thu, 02 Feb 2012 22:58:46 -0000
Content-Type: text/plain

* Latest sources do not require config files anymore and they
  have been removed from the repository.  This change was added
  to the old arago overlay and is ported here.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/matrix/matrix-gui_2.0.bb          |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 9d9fce8..63e647f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r7"
+PR = "r8"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
@@ -26,12 +26,6 @@ require matrix-gui-paths.inc
 
 S = "${WORKDIR}/git"
 
-MATRIX_CONFIG = "800x480_config.ini"
-MATRIX_CONFIG_am3517-evm = "480x272_config.ini"
-MATRIX_CONFIG_am180x-evm = "480x272_config.ini"
-MATRIX_CONFIG_am37x-evm = "640x480_config.ini"
-MATRIX_CONFIG_beagleboard = "640x480_config.ini"
-
 MATRIX_ROT = ""
 MATRIX_ROT_am37x-evm = "-display transformed:Rot90"
 
@@ -51,9 +45,6 @@ do_install(){
     # TODO: replace init script with systemd files
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-2.0
-
-    # Install the matrix config file to configure the screen resolution
-    install -m 0644 ${S}/matrix_config/${MATRIX_CONFIG} ${D}${MATRIX_WEB_DIR}/matrix_config.ini
 }
 
 RDEPENDS_${PN} += "matrix-lighttpd-config lighttpd lighttpd-module-cgi lighttpd-module-compress lighttpd-module-expire php php-cgi php-cli matrix-gui-browser refresh-screen"
-- 
1.7.0.4


