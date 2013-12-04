Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 37C4252A81
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 21:31:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB4LVH5g032188
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 15:31:17 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB4LVHKu006056
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 15:31:17 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Dec 2013 15:31:17 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB4LVE0f007220;
	Wed, 4 Dec 2013 15:31:15 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Dec 2013 16:37:21 -0600
Message-ID: <1386196643-11077-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/3] matrix-gui-tscal: Add init package to run ts_calibrate
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
X-List-Received-Date: Wed, 04 Dec 2013 21:31:18 -0000
Content-Type: text/plain

* Add a package that will run ts_calibrate if needed.  This
  will allow separating this logic from the matrix init script
  since it is not always needed.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/matrix/matrix-gui-tscal/init      |   43 ++++++++++++++++++++
 .../recipes-core/matrix/matrix-gui-tscal_1.0.bb    |   25 +++++++++++
 2 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-tscal/init
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-tscal_1.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tscal/init b/meta-arago-extras/recipes-core/matrix/matrix-gui-tscal/init
new file mode 100644
index 0000000..e8d9197
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tscal/init
@@ -0,0 +1,43 @@
+#!/bin/sh
+# Copyright (C) {2013} Texas Instruments Incorporated - http://www.ti.com/
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License as
+# published by the Free Software Foundation version 2.
+#
+# This program is distributed "as is" WITHOUT ANY WARRANTY of any
+# kind, whether express or implied; without even the implied warranty
+# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+
+tsfile=/etc/pointercal
+
+# Check if the SD card is mounted and the first partition is
+# vfat.  If so let's write the pointercal file there so that if
+# someone messes up calibration they can just delete the file from
+# any system and reboot the board.
+
+#TODO how can we find the SD card and not eMMC?  can we look for a "boot"
+# LABEL?
+mount | grep /media/mmcblk0p1 | grep vfat > /dev/null 2>&1
+if [ "$?" = "0" ]
+then
+    tsfile=/media/mmcblk0p1/pointercal
+    export TSLIB_CALIBFILE=$tsfile
+fi
+
+if [ ! -f $tsfile ] ; then
+    echo -n "Calibrating touchscreen (first time only)"
+    ts_calibrate
+    echo "."
+
+    # If we create a pointercal file and it was not in /etc/pointercal
+    # let's copy it there as well if it does not already exist.  This is so
+    # that running other applications that look for /etc/pointercal and
+    # without TSLIB_CALIBFILE set will still get the right calibration.
+    # TODO: can we just globally export TSLIB_CALIBFILE?
+    if [ ! -f /etc/pointercal -a -f $tsfile ]
+    then
+        cp $tsfile /etc/pointercal
+    fi
+fi
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tscal_1.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-tscal_1.0.bb
new file mode 100644
index 0000000..9156a6a
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tscal_1.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Matrix GUI TS calibration init script"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb7988afdcc6c60"
+
+PR = "r0"
+
+S = "${WORKDIR}"
+
+INITSCRIPT_NAME = "matrix-gui-tscal"
+# Start this init script before the matrix gui launches
+INITSCRIPT_PARAMS = "start 96 2 3 4 5 ."
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit update-rc.d
+
+SRC_URI = "file://init"
+
+do_install(){
+	# Install the init script
+	# TODO: replace init script with systemd files
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-tscal
+}
-- 
1.7.0.4


