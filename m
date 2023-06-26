Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B07CEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 17:58:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3239.1687802271359765849
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 10:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cLXQ/tB4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35QHvmW4108951;
	Mon, 26 Jun 2023 12:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687802268;
	bh=B9LaM4vQuGcB/xIvFzlO5rcXtLHOaWEjkryIVh4QtaI=;
	h=From:To:CC:Subject:Date;
	b=cLXQ/tB4vMf/VquxVEtvdpehiYNIeWnYs0Q0EAZvpmSDoTr6psTVVpHVd2BmHxncp
	 AVtLr5dGhSw4m2akkQyvN048bWJqDO+J5wFahtvWXLDdhYnoNl31+QB1mxMAozBciQ
	 cOSyHi+bjKHd8Hg3d4orWZSBwbK3ZM2oqCyA+Ft0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35QHvm3i095661
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Jun 2023 12:57:48 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Jun 2023 12:57:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Jun 2023 12:57:47 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35QHvluT035691;
	Mon, 26 Jun 2023 12:57:47 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <khasim@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] weston-init: add some of my qol patches from oe-core
Date: Mon, 26 Jun 2023 12:57:46 -0500
Message-ID: <20230626175746.3577399-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Jun 2023 17:58:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14687

From: Randolph Sapp <rs@ti.com>

Add some of the patches still pending for oe-core to satisfy release
deadlines and testing requirements.

To be dropped when the following series is accepted:
https://lists.openembedded.org/g/openembedded-core/message/183338

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../wayland/weston-init.bbappend              |  8 ++
 .../wayland/weston-init/weston-socket.sh      | 20 +++++
 .../wayland/weston-init/weston.ini            | 73 ++++++++++++++++++-
 3 files changed, 97 insertions(+), 4 deletions(-)
 create mode 100755 meta-arago-distro/recipes-graphics/wayland/weston-init/weston-socket.sh

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 4d5db58c..be6b534b 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -5,10 +5,18 @@ PR:append = ".arago12"
 SRC_URI:append = " \
     file://weston.ini \
     file://weston-launch-calibrator.sh \
+    file://weston-socket.sh \
 "
 
 do_install:append() {
     install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
+    fi
 }
 
 FILES:${PN}:append = "${bindir}/weston-launch-calibrator"
+
+GROUPADD_PARAM:${PN} = "-r wayland; -r render"
+USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render weston"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-socket.sh b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-socket.sh
new file mode 100755
index 00000000..86389d63
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-socket.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# set weston variables for use with global weston socket
+global_socket="/run/wayland-0"
+if [ -e "$global_socket" ]; then
+	weston_group=$(stat -c "%G" "$global_socket")
+	if [ "$(id -u)" = "0" ]; then
+		export WAYLAND_DISPLAY="$global_socket"
+	else
+		case "$(groups "$USER")" in
+			*"$weston_group"*)
+				export WAYLAND_DISPLAY="$global_socket"
+				;;
+			*)
+				;;
+		esac
+	fi
+	unset weston_group
+fi
+unset global_socket
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
index b9610fa8..8596346a 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
@@ -1,5 +1,10 @@
+# configuration file for Weston
+
 [core]
 idle-time=0
+#modules=xwayland.so,cms-colord.so
+#shell=desktop-shell.so
+#gbm-format=xrgb2101010
 require-input=false
 
 [shell]
@@ -7,14 +12,74 @@ locking=false
 animation=zoom
 panel-position=top
 startup-animation=fade
+#background-image=/usr/share/backgrounds/gnome/Aqua.jpg
+#background-color=0xff002244
+#background-type=tile
+#clock-format=minutes
+#panel-color=0x90ff0000
+#locking=true
+#animation=zoom
+#startup-animation=fade
+#binding-modifier=ctrl
+#num-workspaces=6
+#cursor-theme=whiteglass
+#cursor-size=24
+
+#lockscreen-icon=/usr/share/icons/gnome/256x256/actions/lock.png
+#lockscreen=/usr/share/backgrounds/gnome/Garden.jpg
+#homescreen=/usr/share/backgrounds/gnome/Blinds.jpg
+#animation=fade
+
+#[launcher]
+#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
+#path=/usr/bin/gnome-terminal
+
+#[launcher]
+#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
+#path=/usr/bin/weston-terminal
+
+#[launcher]
+#icon=/usr/share/icons/hicolor/24x24/apps/google-chrome.png
+#path=/usr/bin/google-chrome
+
+#[launcher]
+#icon=/usr/share/icons/gnome/24x24/apps/arts.png
+#path=/build/weston-0lEgCh/weston-1.11.0/weston-flower
+
+#[input-method]
+#path=/usr/libexec/weston-keyboard
+
+#[output]
+#name=LVDS1
+#mode=1680x1050
+#transform=90
+#icc_profile=/usr/share/color/icc/colord/Bluish.icc
+
+#[output]
+#name=VGA1
+#mode=173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
+#transform=flipped
+
+#[output]
+#name=X1
+#mode=1024x768
+#transform=flipped-90
 
 [libinput]
 touchscreen_calibrator=true
+#enable_tap=true
+
+#[touchpad]
+#constant_accel_factor = 50
+#min_accel_factor = 0.16
+#max_accel_factor = 1.0
+
+[screen-share]
+command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
+
+#[xwayland]
+#path=/usr/bin/Xwayland
 
 [autolaunch]
 # launch the calibrator on startup if a touchscreen is detected
 path=/usr/bin/weston-launch-calibrator
-
-[screensaver]
-# Uncomment path to disable screensaver
-#path=@libexecdir@/weston-screensaver
-- 
2.41.0


