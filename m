Return-Path: <eyalreizer@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by arago-project.org (Postfix) with ESMTPS id B39FF52A72
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2014 14:05:18 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h10so3761704eak.28
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2014 06:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Qu64qNN1QGYD8GGFRgTmOmWHxRa+cJtVIiyzb+nzkKI=;
	b=OqvpmHSty12QngMufgua8ylyQvbM7md3p+avaNFLaI/3x8f2leskqC0NpXI2dwXYFc
	SZq96OfC/B9MTc3iTSidVQkaGvMEf0TMHx3H72IVzuXhsisc/nYfpNHEQ6q1yATNh7Ef
	4LQtiVZVI5Gk60xP/wEmSXnLMqQoc6S72dWyLQv3lp4tmoGLYXxZP7CDJdS8MCwd1/zR
	ICHcvYKsVxYkznn0w66bydWwSfFl+SuZwtwc1n0u//3gOq22Ay/d+5KIT+xNZN746sMr
	bpwoxh2TUVFS4b/DuVInvFxYMYLvZFZeCmHpE+HQ4C5CmPLRQLJH1K0MRSHXIbQEZBoI
	qhoQ==
X-Received: by 10.14.205.3 with SMTP id i3mr43608355eeo.23.1392127515912;
	Tue, 11 Feb 2014 06:05:15 -0800 (PST)
Received: from localhost.localdomain (93-172-91-221.bb.netvision.net.il.
	[93.172.91.221])
	by mx.google.com with ESMTPSA id d9sm67636142eei.9.2014.02.11.06.05.12
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Feb 2014 06:05:15 -0800 (PST)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 11 Feb 2014 16:04:52 +0200
Message-Id: <1392127492-3220-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] bt-firmware: Add support for am437x
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
X-List-Received-Date: Tue, 11 Feb 2014 14:05:19 -0000

Modify the recipe to allow installing the bluetooth init script for
am437x-evm

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 ...001-Makefile-allow-building-within-the-OE.patch |   29 +++++++++++--------
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |    9 +++---
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
index 49caa85..a8642a9 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
@@ -1,6 +1,6 @@
-From 8f226ccc9d2cbd10d454e131376c35f502a45e3b Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Wed, 7 Mar 2012 14:11:42 -0600
+From 465ffd990e3366732eb5e2271313539b55c4ccb7 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Tue, 11 Feb 2014 15:17:53 +0200
 Subject: [PATCH] Makefile: allow building with OE
 
 * Use defaults and source values that allow building this
@@ -10,17 +10,19 @@ Upstread-Status: Pending
     * Will be accepted into next release
 
 Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+    < adapated for am437x>
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
 ---
- Makefile |   21 +++++++++++++++++++++
- 1 files changed, 21 insertions(+), 0 deletions(-)
+ Makefile |   23 +++++++++++++++++++++++
+ 1 files changed, 23 insertions(+), 0 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 9035e40..bd94881 100644
+index 9035e40..23bc5b6 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -1,5 +1,26 @@
+@@ -1,5 +1,28 @@
  # Installs the the Bluetooth firmware files into the root file system
-
+ 
 +-include ../../../Rules.make
 +
 +# If KERNEL_DIR is not set then use the default in Rules.make
@@ -41,9 +43,12 @@ index 9035e40..bd94881 100644
 +ifeq ($(PLATFORM), am37x-evm)
 +    MACHINE_NAME := omap3evm
 +endif
-+
++ifeq ($(PLATFORM), am437x-evm)
++    MACHINE_NAME := am43xx
++endif
  install:
-	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
-	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
---
+ 	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
+ 	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
+-- 
 1.7.0.4
+
diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
index d788875..9aff61a 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Firmware files for Bluetooth"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=5f67a65df8b40038a3251b2fe5b912df \
+LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=4b46aed2a87412c84f9363a8db053e1b \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -11,16 +11,17 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 RCONFLICTS_${PN} = "linux-firmware-wl12xx"
 RREPLACES_${PN}  = "linux-firmware-wl12xx"
 
-PR = "r3+gitr${SRCPV}"
+PR = "r4+gitr${SRCPV}"
 
-COMPATIBLE_MACHINE = "ti33x"
+COMPATIBLE_MACHINE = "ti33x|ti43x"
 
-SRCREV = "57a8e569575e742c47dc2452c4932dcfff816442"
+SRCREV = "7496df8d130f2db85d5d50b1f703213edf0b54fb"
 SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
            file://0001-Makefile-allow-building-within-the-OE.patch"
 
 PLATFORM = "unknown"
 PLATFORM_ti33x = "am335x-evm"
+PLATFORM_ti43x = "am437x-evm"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.0.4


