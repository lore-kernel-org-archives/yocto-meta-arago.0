Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id D373B52A78
	for <meta-arago@arago-project.org>;
	Tue, 11 Nov 2014 01:09:08 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEU004NCOIKXAB0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 10 Nov 2014 19:08:45 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=GYGgRrTO c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=G9keBX9r1eqIWEeHIWYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A2067200A9;	Mon,
	10 Nov 2014 20:08:44 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 10 Nov 2014 20:08:43 -0500
Message-id: <1415668123-31862-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
In-reply-to: <1415668123-31862-1-git-send-email-denis@denix.org>
References: <1415668123-31862-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] weston-init: handle first time screen calibration
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
X-List-Received-Date: Tue, 11 Nov 2014 01:09:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/weston-init.bbappend      |  2 +-
 .../recipes-graphics/wayland/weston-init/init          | 18 ++++++++++++++++++
 .../recipes-graphics/wayland/weston/wayland_env.sh     |  1 +
 .../recipes-graphics/wayland/weston_1.6.0.bbappend     |  2 +-
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 1b427fe..0d76e3b 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,3 +1,3 @@
-PR_append = "-arago1"
+PR_append = "-arago2"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
index cf02490..834de4d 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
@@ -41,6 +41,24 @@ case "$1" in
         fi
 
         openvt -s weston
+
+        # Handle touchscreen calibration
+        if [ ! -e /dev/input/touchscreen0 ] ; then
+                exit 0
+        fi
+
+        if [ ! -f $WS_CALUDEV_FILE ] ; then
+            echo -n "Calibrating touchscreen (first time only)"
+            sleep 1
+            CAL_VALUES=`weston-calibrator|cut -c21-`
+            echo 'SUBSYSTEM=="input", ENV{WL_CALIBRATION}="'$CAL_VALUES'"' > $WS_CALUDEV_FILE
+            echo "."
+            udevadm control --reload
+            udevadm trigger
+            killproc weston
+            sleep 1
+            openvt -s weston
+        fi
   ;;
 
   stop)
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh b/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
index 788024f..a0e3b90 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
@@ -5,3 +5,4 @@
 export XDG_CONFIG_HOME=/etc/
 export XDG_RUNTIME_DIR=/run/user/root
 export WAYLAND_DISPLAY=wayland-0
+export WS_CALUDEV_FILE=/etc/udev/rules.d/ws-calibrate.rules
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
index 5d39575..e636ffd 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -1,7 +1,7 @@
 # When configured for fbdev compositor, make it the default
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
2.1.2


