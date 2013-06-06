Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7C9E352A76
	for <meta-arago@arago-project.org>;
	Thu,  6 Jun 2013 21:41:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r56LfIsT019174
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2013 16:41:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r56LfIMH027195
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2013 16:41:18 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Jun 2013 16:41:18 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r56LfCIa004073;
	Thu, 6 Jun 2013 16:41:16 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Jun 2013 16:47:47 -0500
Message-ID: <1370555268-22244-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1370555268-22244-1-git-send-email-fcooper@ti.com>
References: <1370555268-22244-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3] wl1271-demo: Fix BT CLI error
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
X-List-Received-Date: Thu, 06 Jun 2013 21:41:19 -0000
Content-Type: text/plain

* After running Bluetooth GUI application Bluetooth CLI fails due to incorrect
  initialization.
* Add patch that fixes this problem.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../wl1271-demo/0001-Add-additional-hci0-up.patch  |   54 ++++++++++++++++++++
 .../wl12xx-demo/wl1271-demo_git.bb                 |    6 ++-
 2 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo/0001-Add-additional-hci0-up.patch

diff --git a/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo/0001-Add-additional-hci0-up.patch b/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo/0001-Add-additional-hci0-up.patch
new file mode 100644
index 0000000..67603dc
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo/0001-Add-additional-hci0-up.patch
@@ -0,0 +1,54 @@
+From 3dd9df41002dd57af0c6ad8e4f6d36156b5bd2e0 Mon Sep 17 00:00:00 2001
+From: Franklin S. Cooper Jr <fcooper@ti.com>
+Date: Fri, 31 May 2013 14:05:29 -0500
+Subject: [PATCH] Add additional hci0 up
+
+* After running the Bluetooth GUI BT CLI wasn't initialized properly.
+* Adding hciconfig hci0 up statement fixes this problem.
+
+Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+---
+ script/am1808/BT_Init.sh   |    1 +
+ script/am335x/BT_Init.sh   |    1 +
+ script/omap3evm/BT_Init.sh |    1 +
+ 3 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/script/am1808/BT_Init.sh b/script/am1808/BT_Init.sh
+index 1645cbf..5620dc5 100755
+--- a/script/am1808/BT_Init.sh
++++ b/script/am1808/BT_Init.sh
+@@ -22,6 +22,7 @@ modprobe gpio_en
+ sleep 2
+ hciattach /dev/ttyS1 texas 2000000 & 
+ sleep 10
++hciconfig hci0 up
+ hciconfig hci0 piscan &> /dev/null
+ agent --path /org/bluez/agent 0000 &> /dev/null &
+ sleep 2
+diff --git a/script/am335x/BT_Init.sh b/script/am335x/BT_Init.sh
+index 0e6f714..873cc30 100755
+--- a/script/am335x/BT_Init.sh
++++ b/script/am335x/BT_Init.sh
+@@ -25,6 +25,7 @@ modprobe gpio_en
+ sleep 2
+ hciattach /dev/ttyO1 texas 3000000 & 
+ sleep 5
++hciconfig hci0 up
+ hciconfig hci0 piscan &> /dev/null
+ agent --path /org/bluez/agent 0000 &> /dev/null &
+ sleep 2
+diff --git a/script/omap3evm/BT_Init.sh b/script/omap3evm/BT_Init.sh
+index 0e6f714..873cc30 100755
+--- a/script/omap3evm/BT_Init.sh
++++ b/script/omap3evm/BT_Init.sh
+@@ -25,6 +25,7 @@ modprobe gpio_en
+ sleep 2
+ hciattach /dev/ttyO1 texas 3000000 & 
+ sleep 5
++hciconfig hci0 up
+ hciconfig hci0 piscan &> /dev/null
+ agent --path /org/bluez/agent 0000 &> /dev/null &
+ sleep 2
+-- 
+1.7.0.4
+
diff --git a/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb b/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
index 88965a3..bd728a4 100644
--- a/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
@@ -9,14 +9,16 @@ RDEPENDS_${PN} += "bluez4 openobex ussp-push obexftp bluez-hcidump obex-client"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGE_STRIP = "no"
 
-PR = "r4+gitr${SRCPV}"
+PR = "r5+gitr${SRCPV}"
 
 BRANCH = "wl12xx"
 SRCREV = "7736f86b8c157ffc3e2a0b9e55a97c093faae14e"
 
 COMPATIBLE_MACHINE = "am37x-evm|am180x-evm|da850-omapl138-evm|am335x-evm"
 
-SRC_URI = "git://github.com/TI-ECS/wl1271-bluetooth.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://github.com/TI-ECS/wl1271-bluetooth.git;protocol=git;branch=${BRANCH} \
+           file://0001-Add-additional-hci0-up.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.0.4


