Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 061A052986
	for <meta-arago@arago-project.org>;
	Tue, 21 Jan 2014 18:26:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0LIQSOT028732
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 12:26:28 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0LIQRW7013528
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 12:26:28 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 21 Jan 2014 12:26:27 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0LIQOMX020644;
	Tue, 21 Jan 2014 12:26:26 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Jan 2014 13:49:36 -0600
Message-ID: <1390333777-32012-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2 1/3] ts-calibrate-init: Add init package to run ts_calibrate
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
X-List-Received-Date: Tue, 21 Jan 2014 18:26:29 -0000
Content-Type: text/plain

* Add a package that will run ts_calibrate if needed.  This
  will allow separating this logic from the matrix init script
  since it is not always needed and allow others to use it for
  their own systems without requiring matrix.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
Updated in version 2
    * Added RDEPENDS for tslib
---
 .../recipes-graphics/tslib/ts-calibrate-init/init  |   50 ++++++++++++++++++++
 .../tslib/ts-calibrate-init_1.0.bb                 |   30 ++++++++++++
 2 files changed, 80 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
 create mode 100644 meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb

diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
new file mode 100644
index 0000000..26ea581
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
@@ -0,0 +1,50 @@
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
+# First let's check if we even see a touchscreen device node.  If not
+# then bail out.
+if [ ! -e /dev/input/touchscreen0 ]
+then
+    exit
+fi
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
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
new file mode 100644
index 0000000..7148034
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -0,0 +1,30 @@
+# This recipe installs an init script that can be used to invoke ts_calibrate
+# on systems that need this done during the boot sequence.
+DESCRIPTION = "TS calibration init script"
+RDEPENDS += "tslib"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb7988afdcc6c60"
+
+PR = "r0"
+
+S = "${WORKDIR}"
+
+INITSCRIPT_NAME = "ts-calibrate"
+
+# Start this init script early enough for other processes to be started later
+# in the init sequence
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
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ts-calibrate
+}
-- 
1.7.0.4


