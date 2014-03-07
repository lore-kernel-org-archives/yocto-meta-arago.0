Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4224A529CE
	for <meta-arago@arago-project.org>;
	Fri,  7 Mar 2014 22:24:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s27MOvur028807
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 16:24:57 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27MOvxh006306
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 16:24:57 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Mar 2014 16:24:57 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27MOsId028039;
	Fri, 7 Mar 2014 16:24:55 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Mar 2014 16:24:52 -0600
Message-ID: <1394231092-13150-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] wl18xx-firmware: Only install binaries via Makefile
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
X-List-Received-Date: Fri, 07 Mar 2014 22:24:58 -0000
Content-Type: text/plain

* The makefile currently unnecessary copies everything when only the firmware
  files are needed on the target.
* Update the patch to only copy the bare minimal which also avoids make install
  errors due to the patches directory being copied.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../0001-Add-Makefile-for-SDK.patch                |   13 ++++++-------
 .../wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb    |    2 +-
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch
index a7011b0..6d44eb1 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch
@@ -1,4 +1,4 @@
-From 5f21057d483ba622a4de7075348548540c82a480 Mon Sep 17 00:00:00 2001
+From f4968600db760ff46d400c258ed1729d14c70f16 Mon Sep 17 00:00:00 2001
 From: Franklin S. Cooper Jr <fcooper@ti.com>
 Date: Wed, 5 Feb 2014 21:03:08 -0600
 Subject: [PATCH] Add Makefile for SDK
@@ -7,16 +7,16 @@ Subject: [PATCH] Add Makefile for SDK
 
 Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
 ---
- Makefile |   12 ++++++++++++
- 1 files changed, 12 insertions(+), 0 deletions(-)
+ Makefile |   11 +++++++++++
+ 1 files changed, 11 insertions(+), 0 deletions(-)
  create mode 100644 Makefile
 
 diff --git a/Makefile b/Makefile
 new file mode 100644
-index 0000000..62f4783
+index 0000000..1340c98
 --- /dev/null
 +++ b/Makefile
-@@ -0,0 +1,12 @@
+@@ -0,0 +1,11 @@
 +# Installs the the ti-connectiviy wlan firmware files into the root file system
 +
 +install:
@@ -26,8 +26,7 @@ index 0000000..62f4783
 +		exit 1; \
 +	fi
 +	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
-+	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
-+	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
++	cp *.bin $(DEST_DIR)/lib/firmware/ti-connectivity/
 +
 -- 
 1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
index 6d559f6..5db1c99 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
 
 PACKAGE_ARCH = "all"
 
-PR = "r2+gitr${SRCPV}"
+PR = "r3+gitr${SRCPV}"
 
 PROVIDES += "wl12xx-firmware"
 RPROVIDES_${PN} += "wl12xx-firmware"
-- 
1.7.0.4


