Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 246E5529B3
	for <meta-arago@arago-project.org>;
	Tue,  9 Dec 2014 02:20:33 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGA006RGMHRZJ30@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 08 Dec 2014 20:20:16 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=F/vgrRlI c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8	a=ugM86v3qyv8qYlMYNN0A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BF1A420015;	Mon,
	8 Dec 2014 21:20:15 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 08 Dec 2014 21:20:15 -0500
Message-id: <1418091615-28779-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] weston-init: update initscript to store calibration on SD card
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
X-List-Received-Date: Tue, 09 Dec 2014 02:20:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/weston-init.bbappend  |  2 +-
 .../recipes-graphics/wayland/weston-init/init      | 43 +++++++++++++++++-----
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 0d76e3b..7825618 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,3 +1,3 @@
-PR_append = "-arago2"
+PR_append = "-arago3"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
index 834de4d..b2a2567 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
@@ -32,7 +32,7 @@ case "$1" in
 
         # This is all a nasty hack
         if test -z "$XDG_RUNTIME_DIR"; then
-                export XDG_RUNTIME_DIR=/run/user/root
+            export XDG_RUNTIME_DIR=/run/user/root
         fi
 
         if [ ! -d "$XDG_RUNTIME_DIR" ] ; then
@@ -42,23 +42,48 @@ case "$1" in
 
         openvt -s weston
 
-        # Handle touchscreen calibration
+        # If there's no touchscreen device available, done
         if [ ! -e /dev/input/touchscreen0 ] ; then
-                exit 0
+            exit 0
         fi
 
-        if [ ! -f $WS_CALUDEV_FILE ] ; then
+        # If it was already calibrated, done
+        if [ -f "$WS_CALUDEV_FILE" ] ; then
+            exit 0
+        fi
+
+        # Check if SD card is mounted
+        mount | grep /run/media/mmcblk0p1 | grep vfat > /dev/null 2>&1
+        if [ "$?" = "0" ] ; then
+            SD_MOUNTED="1"
+        else
+            SD_MOUNTED="0"
+        fi
+
+        # Check if SD card has a calibration rules file
+        SD_CALUDEV_FILE=/run/media/mmcblk0p1/ws-calibrate.rules
+        if [ "$SD_MOUNTED" = "1" -a -f "$SD_CALUDEV_FILE" ] ; then
+            # Copy it over to udev location
+            cp "$SD_CALUDEV_FILE" "$WS_CALUDEV_FILE"
+        else
+            # Run a calibration app and save output to udev rules
             echo -n "Calibrating touchscreen (first time only)"
             sleep 1
             CAL_VALUES=`weston-calibrator|cut -c21-`
             echo 'SUBSYSTEM=="input", ENV{WL_CALIBRATION}="'$CAL_VALUES'"' > $WS_CALUDEV_FILE
             echo "."
-            udevadm control --reload
-            udevadm trigger
-            killproc weston
-            sleep 1
-            openvt -s weston
+            # Copy it back to SD
+            if [ "$SD_MOUNTED" = "1" ] ; then
+                cp "$WS_CALUDEV_FILE" "$SD_CALUDEV_FILE"
+            fi
         fi
+
+        # Reload and re-run udev rules and restart weston
+        udevadm control --reload
+        udevadm trigger
+        killproc weston
+        sleep 1
+        openvt -s weston
   ;;
 
   stop)
-- 
2.1.2


