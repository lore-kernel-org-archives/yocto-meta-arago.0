Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4EAFF52A20
	for <meta-arago@arago-project.org>;
	Fri, 24 Jan 2014 17:02:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0OH2GO4011503
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 11:02:16 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OH2G5P012801
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 11:02:16 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 24 Jan 2014 11:02:16 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OH2D8R005027;
	Fri, 24 Jan 2014 11:02:15 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Jan 2014 12:26:28 -0600
Message-ID: <1390587989-27547-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/2] bt-firmware: Add back recipe
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
X-List-Received-Date: Fri, 24 Jan 2014 17:02:17 -0000
Content-Type: text/plain

* Apparently this recipe is still needed.
* Bring back this recipe that was deleted by commit:
  297f2481a463ab93f8c849b68d8093b33019a5da

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
index 0000000..2b320da
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
+PR = "r2+gitr${SRCPV}"
+
+COMPATIBLE_MACHINE = "omap3|omapl138|da850-omapl138-evm|ti33x"
+
+SRCREV = "adbc27c11d5c5c8c20a93a8beca647b4a6aaa03b"
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


