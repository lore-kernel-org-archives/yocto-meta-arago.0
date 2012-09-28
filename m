Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 18A28529A4
	for <meta-arago@arago-project.org>;
	Fri, 28 Sep 2012 01:45:26 +0000 (UTC)
Received: by obblz20 with SMTP id lz20so2448384obb.38
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2012 18:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=M/UEE+ubkih8fcP3eVJAcEkvYYuoAqLWYDkAqKd7Js0=;
	b=mjigK9abjW+6HMPFy3tVFgdBLyVOwz8rX8J/OVtUHB0EVbOJfeKyNgioFapR6zKL/V
	bpu4r4S5u07LUtX2SNay6nB75tD+R4drU9wsNXYv8JOZZah0xReSpeCefaTORh2v0vK4
	WrNvWq+LoLibNx7vOWlbnzEBGBSxp5EYSqiv4Dx9PecxNY1BeVWYR9MRGtCBZyu8StwL
	VJ6Tp4KUOwmwkU2VkmEragV/wGmgYterduje8vKrmET8BpGBjHxm3NOqvDUrdT7mx1sp
	Qb+38XslS6fX3tRpux3pzkCHsGYMrJ2xuOK1BNwyMDYccKwCcMEOx16h2xl/emQx8tch
	Laeg==
Received: by 10.60.172.42 with SMTP id az10mr4687829oec.1.1348796725468;
	Thu, 27 Sep 2012 18:45:25 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id rg10sm7187140obc.14.2012.09.27.18.45.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 18:45:25 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 27 Sep 2012 21:11:05 -0500
Message-Id: <1348798265-24068-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] recipes: Add license to Wifi and Bluetooth demo applications license
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
X-List-Received-Date: Fri, 28 Sep 2012 01:45:26 -0000

* battleship_git temporarily using one of the source files as a checksum
  for the license.
* wifi-direct-demo doesn't include any kind of license. Using one of the source
  files as a checksum temporarily.
* bluetooth-gui checksumming the proper license within main.cpp

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../battleship/battleship_git.bb                   |    3 ++-
 .../bluetooth-gui/bluetooth-gui.bb                 |   13 ++++++-------
 .../wifi-direct-demo/wifi-direct-demo_git.bb       |    9 +++++----
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb b/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
index 43c7421..aed0572 100644
--- a/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
+++ b/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "Battleship game with wifi direct"
 SECTION = "network"
 LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://src/kgamecanvas.cpp;beginline=1;endline=25;md5=b4fc9c236e9a19cfaeaca80abbb29032"
 RDEPENDS += "wpa-supplicant"
 
-PR = "r0"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
diff --git a/meta-arago-extras/recipes-connectivity/bluetooth-gui/bluetooth-gui.bb b/meta-arago-extras/recipes-connectivity/bluetooth-gui/bluetooth-gui.bb
index 3c35d89..1e54122 100644
--- a/meta-arago-extras/recipes-connectivity/bluetooth-gui/bluetooth-gui.bb
+++ b/meta-arago-extras/recipes-connectivity/bluetooth-gui/bluetooth-gui.bb
@@ -1,15 +1,15 @@
 DESCRIPTION = "Bluetooth GUI Application"
 SECTION = "network"
 LICENSE = "BSD"
-RDEPENDS += "pulseaudio"
-
-PR = "r10"
-
+LIC_FILES_CHKSUM = "file://src/main.cpp;beginline=1;endline=37;md5=83d75e9470fc1ba29e6f494fdef321be"
 COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
+RDEPENDS += "pulseaudio"
+
 BRANCH = "master"
 SRCREV = "d9fc6f1ab023230170672d5243cbee58d740e7fe"
-PR_append = "+gitr${SRCREV}"
+
+PR = "r11"
 
 SRC_URI = "git://git.profusion.mobi/users/lucas/BT_Demo.git;protocol=git;branch=${BRANCH} \
            file://bluetooth-icon.png \
@@ -18,7 +18,6 @@ SRC_URI = "git://git.profusion.mobi/users/lucas/BT_Demo.git;protocol=git;branch=
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-
 S = "${WORKDIR}/git"
 
 inherit qt4e
@@ -39,7 +38,7 @@ do_install () {
        install -m 644 ${WORKDIR}/bluetooth-icon.png ${D}${MATRIX_APP_DIR}/bt_demo
 }
 
-PACKAGES += "${PN} matrix-gui-bluetooth-demos"
+PACKAGES += "matrix-gui-bluetooth-demos"
 
 FILES_${PN} +=" \
 	${bindir}/bluetooth-gui \
diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
index 2e235ec..13306ba 100644
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
@@ -1,15 +1,16 @@
 DESCRIPTION = "Wifi Direct Demo"
 SECTION = "network"
 LICENSE = "BSD"
-RDEPENDS += "wpa-supplicant"
-
-PR = "r0"
+LIC_FILES_CHKSUM = "file://src/main.cpp;md5=cf285050f56a20d116b026c9f8ded4f7"
 
 COMPATIBLE_MACHINE = "(am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
+RDEPENDS += "wpa-supplicant"
+
+PR = "r1"
+
 BRANCH = "dbus"
 SRCREV = "0950a67d9fe9a70668a993774e65ba9d457d750c"
-PR_append = "+gitr${SRCREV}"
 
 SRC_URI = "git://git.profusion.mobi/users/lucas/wifi-direct-demo.git;protocol=git;branch=${BRANCH} \
            file://wifi-direct-demo.desktop"
-- 
1.7.0.4


