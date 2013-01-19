Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by arago-project.org (Postfix) with ESMTPS id 5DF2252AC0
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:16 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id dn14so4821411obc.30
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=k39ZgRhsP8+zhIoghpG//887NXdQznbP9njAnXfsGcs=;
	b=lrL49bBJWz6vfra92/TMZwKG4zGp8A4wvbHUmb604MijzGJAitknEcQbcmKfL3+5LI
	PT+SOx4P4tuSgvoVyGvMNpbQ6p98YoWXCGPQfxfPk/KaNgwdJzo4lWXQYkYAdZeySeIJ
	oMx+lQKLJu7gikrCLPOdX2UIx2cF/BfwBF/vPBKINGv3GMgUdFLuwnpKAMlqpEIY877a
	1UMqaXKUIrxtPllYilXI2GHpNZzG6bbWHXecfgje5uloG6sjrFyylBp+tsqK3GSVURhS
	gYDrAePasikrKaLoGcpOg+JgfrsvvnSjKzcMiWIdOlZ14wv050VkPq47KrDayi2av1vd
	NDZg==
X-Received: by 10.60.29.70 with SMTP id i6mr10818973oeh.38.1358632335860;
	Sat, 19 Jan 2013 13:52:15 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.14
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:14 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:33 -0600
Message-Id: <1358632316-12266-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 08/31] bt-firmware: Port bt-firmware recipe
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:16 -0000

* Port bt-firmware recipe from arago.
* Bt-firmware provides the bluetooth firmware for the TI wl12xx
  Wi+Fi + Bluetooth module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...001-Makefile-allow-building-within-the-OE.patch |   49 ++++++++++++++++++++
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |   41 ++++++++++++++++
 2 files changed, 90 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
 create mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb

diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
new file mode 100644
index 0000000..49caa85
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
@@ -0,0 +1,49 @@
+From 8f226ccc9d2cbd10d454e131376c35f502a45e3b Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Wed, 7 Mar 2012 14:11:42 -0600
+Subject: [PATCH] Makefile: allow building with OE
+
+* Use defaults and source values that allow building this
+  component with OE.
+
+Upstread-Status: Pending
+    * Will be accepted into next release
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ Makefile |   21 +++++++++++++++++++++
+ 1 files changed, 21 insertions(+), 0 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9035e40..bd94881 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,5 +1,26 @@
+ # Installs the the Bluetooth firmware files into the root file system
+
++-include ../../../Rules.make
++
++# If KERNEL_DIR is not set then use the default in Rules.make
++DEST_DIR ?= ${DESTDIR}
++
++PLATFORM ?= "unknown"
++MACHINE_NAME ?= "unknown"
++
++ifeq ($(PLATFORM), am335x-evm)
++    MACHINE_NAME := am335x
++endif
++ifeq ($(PLATFORM), am180x-evm)
++    MACHINE_NAME := am1808
++endif
++ifeq ($(PLATFORM), da850-omapl138-evm)
++    MACHINE_NAME := am1808
++endif
++ifeq ($(PLATFORM), am37x-evm)
++    MACHINE_NAME := omap3evm
++endif
++
+ install:
+	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
+	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
+--
+1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
new file mode 100644
index 0000000..569c690
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Firmware files for Bluetooth"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
+                    file://am1808/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
+                    file://omap3evm/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# This recipe provides the latest firmware files for wl12xx.
+# Therefore, use the contents of this recipe instead of the contents
+# of linux-firmware-wl12xx.
+RCONFLICTS_${PN} = "linux-firmware-wl12xx"
+RREPLACES_${PN}  = "linux-firmware-wl12xx"
+
+PR = "r0+gitr${SRCREV}"
+
+COMPATIBLE_MACHINE = "omap3|omapl138|da850-omapl138-evm|ti33x"
+
+SRCREV = "db43d1f05efda9777d7ac1ac366637e29e21f77f"
+SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
+           file://0001-Makefile-allow-building-within-the-OE.patch"
+
+PLATFORM = "unknown"
+PLATFORM_ti33x = "am335x-evm"
+PLATFORM_omap3 = "am37x-evm"
+PLATFORM_omapl138 = "am180x-evm"
+PLATFORM_da850-omapl138-evm = "am180x-evm"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    install -d ${D}${base_libdir}/firmware
+    oe_runmake 'DEST_DIR=${D}' 'BASE_LIB_DIR=${base_libdir}' 'PLATFORM=${PLATFORM}' install
+}
+
+FILES_${PN} += "${base_libdir}/firmware"
-- 
1.7.0.4


