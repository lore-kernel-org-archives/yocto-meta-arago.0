Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 677DD52A6A
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 14:05:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16E5uwB018044
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 08:05:56 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16E5uAx016290
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 08:05:56 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 08:05:56 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16E5p5T011240;
	Thu, 6 Feb 2014 08:05:55 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Feb 2014 09:34:44 -0600
Message-ID: <1391700887-26166-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1391700887-26166-1-git-send-email-fcooper@ti.com>
References: <1391700887-26166-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/5] wl18xx-firmware: Add Makefile as a patch
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 14:05:58 -0000
Content-Type: text/plain

* Add the Makefile as a patch so it is incorporated in the sources packaged by
  sourceipk.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../0001-Add-Makefile-for-SDK.patch                |   34 ++++++++++++++++++++
 .../wl18xx-firmware/wl18xx-firmware/Makefile       |    7 ----
 .../wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb    |    5 +--
 3 files changed, 36 insertions(+), 10 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch
new file mode 100644
index 0000000..a7011b0
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch
@@ -0,0 +1,34 @@
+From 5f21057d483ba622a4de7075348548540c82a480 Mon Sep 17 00:00:00 2001
+From: Franklin S. Cooper Jr <fcooper@ti.com>
+Date: Wed, 5 Feb 2014 21:03:08 -0600
+Subject: [PATCH] Add Makefile for SDK
+
+* Add Makefile to sources so it is packaged in the SDK.
+
+Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+---
+ Makefile |   12 ++++++++++++
+ 1 files changed, 12 insertions(+), 0 deletions(-)
+ create mode 100644 Makefile
+
+diff --git a/Makefile b/Makefile
+new file mode 100644
+index 0000000..62f4783
+--- /dev/null
++++ b/Makefile
+@@ -0,0 +1,12 @@
++# Installs the the ti-connectiviy wlan firmware files into the root file system
++
++install:
++	@if [ ! -d $(DESTDIR) ] ; then \
++		echo "The extracted target filesystem directory doesn't exist."; \
++		echo "Please run setup.sh in the SDK's root directory and then try again."; \
++		exit 1; \
++	fi
++	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
++	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
++	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
++
+-- 
+1.7.0.4
+
diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile
deleted file mode 100644
index 0bb7ab8..0000000
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile
+++ /dev/null
@@ -1,7 +0,0 @@
-# Installs the the ti-connectiviy wlan firmware files into the root file system
-
-install:
-	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
-	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
-	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
-
diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
index ba698ff..6d559f6 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
 
 PACKAGE_ARCH = "all"
 
-PR = "r1+gitr${SRCPV}"
+PR = "r2+gitr${SRCPV}"
 
 PROVIDES += "wl12xx-firmware"
 RPROVIDES_${PN} += "wl12xx-firmware"
@@ -14,7 +14,7 @@ RCONFLICTS_${PN} += "wl12xx-firmware"
 # Tag: ol_r8.a8.10
 SRCREV = "89dc93a5c23fd69ebacd64c936ba5aabf173c29b"
 SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
-           file://Makefile \
+           file://0001-Add-Makefile-for-SDK.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -24,7 +24,6 @@ do_compile() {
 }
 
 do_install() {
-    cp ${WORKDIR}/Makefile ${S}
     oe_runmake 'DEST_DIR=${D}' install
 }
 
-- 
1.7.0.4


