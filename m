Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5B0FF52A64
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:03:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AF3l1Q007313
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AF3lh8008957
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 10 Oct 2013 10:03:47 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r9AF3ki1003264	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 10:03:47 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9AG2TVI016905	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 17:02:29 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9AG2Tlv016904	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 17:02:29 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 17:02:21 +0100
Message-ID: <1381420942-16810-11-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381420942-16810-1-git-send-email-r-monk@ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCHv2 10/11] ti-connectivity/bt-firmware: Update to latest BT Firmware + allow more targets
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
X-List-Received-Date: Thu, 10 Oct 2013 15:03:48 -0000
Content-Type: text/plain

       * Add latest BT firmware
       * Add patch to enable unspecifified platforms to pick up default firmware

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 ...-Remove-platform-check-and-install-defaul.patch |   41 ++++++++++++++++++++
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |   10 +++--
 2 files changed, 47 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmware-Remove-platform-check-and-install-defaul.patch

diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmware-Remove-platform-check-and-install-defaul.patch b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmware-Remove-platform-check-and-install-defaul.patch
new file mode 100644
index 0000000..4ad457e
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmware-Remove-platform-check-and-install-defaul.patch
@@ -0,0 +1,41 @@
+From 40bb43c136ec8001d35f6077e5de5f8ac72f4da0 Mon Sep 17 00:00:00 2001
+From: Roger Monk <r-monk@ti.com>
+Date: Thu, 3 Oct 2013 02:59:54 +0100
+Subject: [PATCH] bt-firmware:  Remove platform check and install default
+ firmware
+
+   * For undefined plaforms, install default firmware
+   * Remove configuration of 'unknown' so that install picks
+     firmware from root directory (default)
+
+Signed-off-by: Roger Monk <r-monk@ti.com>
+---
+ Makefile |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index bd94881..ca8280a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,8 +5,8 @@
+ # If KERNEL_DIR is not set then use the default in Rules.make
+ DEST_DIR ?= ${DESTDIR}
+ 
+-PLATFORM ?= "unknown"
+-MACHINE_NAME ?= "unknown"
++#PLATFORM ?= "unknown"
++#MACHINE_NAME ?= "unknown"
+ 
+ ifeq ($(PLATFORM), am335x-evm)
+     MACHINE_NAME := am335x
+@@ -23,6 +23,6 @@ endif
+ 
+ install:
+ 	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
+-	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
++	cp -f ./${MACHINE_NAME}/*.bts $(DEST_DIR)${BASE_LIB_DIR}/firmware
+ 
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
index 2b320da..3a0191e 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -13,13 +13,15 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 RCONFLICTS_${PN} = "linux-firmware-wl12xx"
 RREPLACES_${PN}  = "linux-firmware-wl12xx"
 
-PR = "r2+gitr${SRCPV}"
+PR = "r3+gitr${SRCPV}"
 
-COMPATIBLE_MACHINE = "omap3|omapl138|da850-omapl138-evm|ti33x"
+COMPATIBLE_MACHINE = "omap3|omapl138|da850-omapl138-evm|ti3x|omap-a15"
 
-SRCREV = "adbc27c11d5c5c8c20a93a8beca647b4a6aaa03b"
+SRCREV = "3a020e30a0e28e6b7b7cdd2a8fb37b29e1e58040"
 SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
-           file://0001-Makefile-allow-building-within-the-OE.patch"
+           file://0001-Makefile-allow-building-within-the-OE.patch \
+           file://0001-bt-firmware-Remove-platform-check-and-install-defaul.patch \
+"
 
 PLATFORM = "unknown"
 PLATFORM_ti33x = "am335x-evm"
-- 
1.7.9.5


