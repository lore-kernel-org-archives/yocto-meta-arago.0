Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D3F3F52AB7
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 14:55:18 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31EtG8Z028472
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 09:55:17 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EtGp3011775
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 20:25:16 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 1 Apr 2013 20:25:16 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EsxCj020052;
	Mon, 1 Apr 2013 20:25:15 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Apr 2013 09:54:48 -0500
Message-ID: <1364828095-28755-10-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364828095-28755-1-git-send-email-fcooper@ti.com>
References: <1364828095-28755-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 10/17 v2] wifi direct demos: Update to use new wifi-direct-launcher script
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
X-List-Received-Date: Mon, 01 Apr 2013 14:55:19 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Brand new patch. Apart of new patchset.

 .../battleship/battleship_git.bb                   |    4 ++--
 .../battleship/files/battleship.desktop            |    2 +-
 .../files/wifi-direct-demo.desktop                 |    2 +-
 .../wifi-direct-demo/wifi-direct-demo_git.bb       |    4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb b/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
index 47cffea..7f64eb1 100644
--- a/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
+++ b/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
@@ -3,7 +3,7 @@ SECTION = "network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=75859989545e37968a99b631ef42722e"
 
-PR = "r5"
+PR = "r6"
 
 COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
@@ -39,7 +39,7 @@ FILES_${PN} +=" \
 	${bindir}/battleship \
 	"
 
-RDEPENDS_${PN} += "wpa-supplicant"
+RDEPENDS_${PN} += "wpa-supplicant wifi-direct-launcher"
 
 FILES_matrix-gui-wifi-battleship-demo += " \
 	${MATRIX_APP_DIR}/battleship/* \
diff --git a/meta-arago-extras/recipes-connectivity/battleship/files/battleship.desktop b/meta-arago-extras/recipes-connectivity/battleship/files/battleship.desktop
index da368cc..c6da1a5 100644
--- a/meta-arago-extras/recipes-connectivity/battleship/files/battleship.desktop
+++ b/meta-arago-extras/recipes-connectivity/battleship/files/battleship.desktop
@@ -4,6 +4,6 @@ Name=Battleship
 GenericName=Demo App
 Icon=/usr/share/matrix-gui-2.0/apps/battleship/battleship-icon.png
 Type=Application
-Exec=/usr/sbin/kill_wpa_supplicant.sh battleship
+Exec=/usr/sbin/wifi-direct-launcher.sh battleship
 Categories=wifi
 X-ProgramType=gui
diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi-direct-demo.desktop b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi-direct-demo.desktop
index 3873e6b..431c956 100644
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi-direct-demo.desktop
+++ b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi-direct-demo.desktop
@@ -4,6 +4,6 @@ Name=WiFi-Direct Demo
 GenericName=Demo App
 Icon=/usr/share/matrix-gui-2.0/apps/wifi-direct-demo/wifi-direct-icon.png
 Type=Application
-Exec=/usr/sbin/kill_wpa_supplicant.sh wifi-direct-demo
+Exec=/usr/sbin/wifi-direct-launcher.sh wifi-direct-demo
 Categories=wifi
 X-ProgramType=gui
diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
index 984df9d..a36b4d1 100644
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=75859989545e37968a99b631ef42722e"
 
 COMPATIBLE_MACHINE = "(am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
-PR = "r6"
+PR = "r7"
 
 BRANCH = "master"
 SRCREV = "1d41618cded6d82b285e14b85b59f3320fb22469"
@@ -43,7 +43,7 @@ FILES_${PN} +=" \
 	${bindir}/wifi_exit.sh \
 	"
 
-RDEPENDS_${PN} += "wpa-supplicant"
+RDEPENDS_${PN} += "wpa-supplicant wifi-direct-launcher"
 
 FILES_matrix-gui-wifi-direct-demo += " \
 	${MATRIX_APP_DIR}/wifi-direct-demo/* \
-- 
1.7.0.4


