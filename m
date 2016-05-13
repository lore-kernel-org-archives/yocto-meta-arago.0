Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id 139CC5299F
	for <meta-arago@arago-project.org>;
	Fri, 13 May 2016 20:05:46 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7400LSHT56GS10@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 13 May 2016 15:05:31 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=fN4FZy7ZpA3mBdq0JXwA:9
Received: by 100.15.86.14 with SMTP id 4394ac6b; Fri, 13 May 2016 20:05:31 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3B00916200B;	Fri,
	13 May 2016 16:05:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 13 May 2016 16:05:29 -0400
Message-id: <1463169929-9825-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] weston-init: revive restarting Weston code for new calibration data
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
X-List-Received-Date: Fri, 13 May 2016 20:05:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit b057be5db06e0f2e0ebb649841e64f60a997c2c1.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend | 2 +-
 meta-arago-distro/recipes-graphics/wayland/weston-init/init     | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 4b5ad93..4c41f19 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago5"
+PR_append = "-arago6"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
index 494584f..336e5af 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
@@ -63,9 +63,8 @@ case "$1" in
         # Check if SD card has a calibration rules file
         SD_CALUDEV_FILE=/run/media/mmcblk0p1/ws-calibrate.rules
         if [ "$SD_MOUNTED" = "1" -a -f "$SD_CALUDEV_FILE" ] ; then
-            # Copy it over to udev location, and done
+            # Copy it over to udev location
             cp "$SD_CALUDEV_FILE" "$WS_CALUDEV_FILE"
-            exit 0
         else
             # Run a calibration app and save output to udev rules
             echo    "Calibrating touchscreen (first time only)"
-- 
2.2.0


