Return-Path: <h-gou@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E8B30529B5
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 19:48:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RJm8Tq004103
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:48:08 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJm8Ri016933
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:48:08 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 13:48:07 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0RJm7eZ031798;	Wed, 27 Jan 2016 13:48:07 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jan 2016 14:48:05 -0500
Message-ID: <1453924085-16748-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] weston-init: update init scripts related to restarting Weston
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
X-List-Received-Date: Wed, 27 Jan 2016 19:48:09 -0000
Content-Type: text/plain

* Bypass restarting Weston if SD card has calibration file already

* Increase the sleep time before Weston is restarted
  It takes some time to complete the Weston termination procedure.
  If Weston is restarted before the previous instance is fully
  terminated, the restart of Weston will fail.

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend | 2 +-
 meta-arago-distro/recipes-graphics/wayland/weston-init/init     | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index d9e15b6..4b5ad93 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago4"
+PR_append = "-arago5"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
index 2e2ae36..494584f 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
@@ -63,8 +63,9 @@ case "$1" in
         # Check if SD card has a calibration rules file
         SD_CALUDEV_FILE=/run/media/mmcblk0p1/ws-calibrate.rules
         if [ "$SD_MOUNTED" = "1" -a -f "$SD_CALUDEV_FILE" ] ; then
-            # Copy it over to udev location
+            # Copy it over to udev location, and done
             cp "$SD_CALUDEV_FILE" "$WS_CALUDEV_FILE"
+            exit 0
         else
             # Run a calibration app and save output to udev rules
             echo    "Calibrating touchscreen (first time only)"
@@ -85,7 +86,7 @@ case "$1" in
         udevadm control --reload
         udevadm trigger
         killproc weston
-        sleep 1
+        sleep 2
         openvt -c 4 -f runWeston
   ;;
 
@@ -96,7 +97,7 @@ case "$1" in
 
   restart)
 	$0 stop
-        sleep 1
+        sleep 2
         $0 start
   ;;
 
-- 
1.9.1


