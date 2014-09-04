Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2AF4552A72
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 15:21:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84FLsn1011533
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 10:21:54 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84FLsth021281
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 10:21:54 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 10:21:54 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84FLfTc019403;
	Thu, 4 Sep 2014 10:21:52 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 20:51:38 +0530
Message-ID: <1409844098-16836-4-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409844098-16836-1-git-send-email-a0393906@ti.com>
References: <1409844098-16836-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for dora] [PATCH 3/3] bt-firmware: Override Makefile to handle UNKNOWN platform
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
X-List-Received-Date: Thu, 04 Sep 2014 15:21:55 -0000
Content-Type: text/plain

* By default the Makefile supports only am335x targets
* This is required to support dra7xx and other devices

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...-Remove-platform-check-and-install-defaul.patch | 41 ++++++++++++++++++++++
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |  5 +--
 2 files changed, 44 insertions(+), 2 deletions(-)
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
index 780519b..aa99686 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -11,13 +11,14 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 RCONFLICTS_${PN} = "linux-firmware-wl12xx"
 RREPLACES_${PN}  = "linux-firmware-wl12xx"
 
-PR = "r5+gitr${SRCPV}"
+PR = "r6+gitr${SRCPV}"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 
 SRCREV = "e08f59b41b6145b6baf1cb68bca018233ab5e93a"
 SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
-           file://0001-Makefile-allow-building-within-the-OE.patch"
+           file://0001-Makefile-allow-building-within-the-OE.patch \
+           file://0001-bt-firmware-Remove-platform-check-and-install-defaul.patch"
 
 PLATFORM = "unknown"
 PLATFORM_ti33x = "am335x-evm"
-- 
2.0.1


