Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A4C5C529AD
	for <meta-arago@arago-project.org>;
	Tue, 21 Jan 2014 15:51:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0LFpGnO005441
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 09:51:16 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0LFpGXd018923
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 09:51:16 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 21 Jan 2014 09:51:16 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0LFp8J0010155;
	Tue, 21 Jan 2014 09:51:15 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Jan 2014 11:14:18 -0600
Message-ID: <1390324458-29919-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1390324458-29919-1-git-send-email-Chase.Maupin@ti.com>
References: <1390324458-29919-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] matrix-gui: remove ts_calibrate from init
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
X-List-Received-Date: Tue, 21 Jan 2014 15:51:17 -0000
Content-Type: text/plain

* touchscreen calibration has been moved to a separate package
  since it is not required for all devices.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/matrix/matrix-gui/init            |   25 +-------------------
 .../recipes-core/matrix/matrix-gui_2.0.bb          |    2 +-
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
index 5e1f741..dab7dc6 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
@@ -9,7 +9,6 @@ test -x "$matrixgui" || exit 0
 
 export TSLIB_TSDEVICE=/dev/input/touchscreen0
 export QWS_MOUSE_PROTO=Auto
-tsfile=/etc/pointercal
 
 case "$1" in
   start)
@@ -24,32 +23,10 @@ case "$1" in
     # in the kernel.  This should have no impact on cortex-A8 devices.
     echo 2 > /proc/cpu/alignment
 
-    # Do not try to calibrate the touchscreen if it doesn't exist.
+    # Set the QWS_MOUSE_PROTO for touchscreen if it exists
     if [ -e /dev/input/touchscreen0 ]
     then
         export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
-        # Check if the SD card is mounted and the first partition is
-        # vfat.  If so let's write the pointercal file there so that if
-        # someone messes up calibration they can just delete the file from
-        # any system and reboot the board.
-        mount | grep /media/mmcblk0p1 | grep vfat > /dev/null 2>&1
-        if [ "$?" = "0" ]
-        then
-            tsfile=/media/mmcblk0p1/pointercal
-            export TSLIB_CALIBFILE=$tsfile
-        fi
-
-        if [ ! -f $tsfile ] ; then
-            echo -n "Calibrating touchscreen (first time only)"
-            ts_calibrate
-            echo "."
-            # If we create a pointercal file and it was not in /etc/pointercal
-            # let's copy it there as well if it does not already exist.
-            if [ ! -f /etc/pointercal -a -f $tsfile ]
-            then
-                cp $tsfile /etc/pointercal
-            fi
-        fi
     fi
 
     #Clear out the the tmp and lock directory
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 54359e5..fa1f1e0 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r13"
+PR = "r14"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
-- 
1.7.0.4


