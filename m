Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6E290520EA
	for <meta-arago@arago-project.org>;
	Mon, 24 Nov 2014 12:56:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAOCuBlo003123
	for <meta-arago@arago-project.org>; Mon, 24 Nov 2014 06:56:11 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAOCuBQg014789
	for <meta-arago@arago-project.org>; Mon, 24 Nov 2014 06:56:11 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 24 Nov 2014 06:56:11 -0600
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sAOCu7PO025316;	Mon, 24 Nov 2014 06:56:10 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Nov 2014 18:21:05 +0530
Message-ID: <1416833465-19027-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1416833465-19027-1-git-send-email-a0393906@ti.com>
References: <1416833465-19027-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master, v2 3/3] bt-firmware: Override Makefile to handle UNKNOWN platform
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
X-List-Received-Date: Mon, 24 Nov 2014 12:56:12 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...-Remove-platform-check-and-install-defaul.patch |   41 ++++++++++++++++++++
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |    3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
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
index 3c40441..20db8da 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -18,7 +18,8 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|dra7xx-evm"
 SRCREV = "fbcab22449ce930a4192ffeb470c168f4e85e0c6"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/wilink8-bt/ti-bt-firmware.git;branch=${BRANCH} \
-           file://0001-Makefile-allow-building-within-the-OE.patch"
+           file://0001-Makefile-allow-building-within-the-OE.patch \
+           file://0001-bt-firmware-Remove-platform-check-and-install-defaul.patch"
 
 PLATFORM = "unknown"
 PLATFORM_ti33x = "am335x-evm"
-- 
1.7.9.5


