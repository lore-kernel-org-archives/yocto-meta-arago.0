Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877E2C77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 18:11:33 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1266.1684951889047863910
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 May 2023 11:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JZy81JiK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBO7x020818;
	Wed, 24 May 2023 13:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684951884;
	bh=FulnHRnXe9Tkh6BoVmYP1Z5SYPJnf0xz9yE46y5fWs8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JZy81JiKsvidWzULBGaixybfQggibwrHr2GHCuLeZ9RjlZrOfwQcEcEzKWCCrInjZ
	 1g9UasE+MhwrLULecOWO3nrv5QW+SHCh32mU/Cg0YTfAVuH8MLav+uw63rHHSvn8++
	 ds7q3WChDNl4sn20z2ZcxPob8pRe182cUFZoYoME=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34OIBO7j009187
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 13:11:24 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 13:11:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 13:11:24 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOq0005029;
	Wed, 24 May 2023 13:11:24 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [arago][kirkstone][PATCH 1/7] weston-init: drop all the old append logic
Date: Wed, 24 May 2023 13:11:16 -0500
Message-ID: <20230524181122.35202-2-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524181122.35202-1-rs@ti.com>
References: <20230524181122.35202-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 May 2023 18:11:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14462

From: Randolph Sapp <rs@ti.com>

First step in non-root weston.

Drop the following files:
	- weston-init/init
	- weston-init/runWeston
	- weston-init/ti43x/weston.ini
	- weston-init/wayland_env.sh

We previously had some append logic to remove the systemd-service
because people were only updating the sysVinit script, and the sysVinit
script was updated to include touch screen calibration logic. Now we can
drop this as weston now has it's own calibration routine per user.

In addition to this, this append file also introduced a runWeston
wrapper and a wayland_env script to setup environment variables for the
root user weston instance, all of which is now unnecessary as root
weston is generally not a good idea.

This append now only serves to offer a new weston.ini file to the
existing weston-init package with the hooks for libinput to create and
apply touchscreen calibrations for individual users.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../wayland/weston-init.bbappend              |  22 +--
 .../recipes-graphics/wayland/weston-init/init | 129 ------------------
 .../wayland/weston-init/runWeston             |  39 ------
 .../wayland/weston-init/ti43x/weston.ini      |  16 ---
 .../wayland/weston-init/wayland_env.sh        |  12 --
 .../wayland/weston-init/weston.ini            |   4 +
 6 files changed, 7 insertions(+), 215 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/init
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/ti43x/weston.ini
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/wayland_env.sh

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 28e7ae39..a73b669d 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -2,22 +2,6 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 PR:append = ".arago12"
 
-SRC_URI:append = " \
-    file://runWeston \
-    file://wayland_env.sh \
-    file://weston.ini \
-"
-
-do_install:append() {
-    install -d ${D}${bindir}
-    install -m 755 ${WORKDIR}/runWeston ${D}${bindir}
-    rm -rf ${D}${systemd_system_unitdir}
-
-    install -d ${D}${sysconfdir}/profile.d
-    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
-}
-
-FILES:${PN}:remove = "${systemd_system_unitdir}/weston.service ${systemd_system_unitdir}/weston.socket"
-FILES:${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
-SYSTEMD_SERVICE:${PN}:remove = "weston.service weston.socket"
+#SRC_URI:append = " \
+#    file://weston.ini \
+#"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
deleted file mode 100644
index fa3f0372..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ /dev/null
@@ -1,129 +0,0 @@
-#!/bin/sh
-#
-### BEGIN INIT INFO
-# Provides: weston
-# Required-Start: $local_fs $remote_fs
-# Required-Stop: $local_fs $remote_fs
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-### END INIT INFO
-
-killproc() {
-	all_pids=`/bin/pidof $1`
-
-	# busybox pidof doesn't ommit the current pid
-	# as this script is called weston on the target
-	# in thinlinux with a busybox based utility load
-	# later killproc operations end up killing this
-	# script.
-	for pid in $all_pids
-	do
-		if [ "$pid" != "$$" ]; then
-			kill_pids+=$pid
-		fi
-	done
-
-	[ "$kill_pids" != "" ] && kill $kill_pids
-}
-
-read CMDLINE < /proc/cmdline
-for x in $CMDLINE; do
-        case $x in
-        weston=false)
-		echo "Weston disabled"
-		exit 0;
-                ;;
-        esac
-done
-
-case "$1" in
-  start)
-        . /etc/profile
-
-        # Weston for some reason dies if these environment variables are set
-        unset WAYLAND_DISPLAY
-
-        # This is all a nasty hack
-        if test -z "$XDG_RUNTIME_DIR"; then
-            export XDG_RUNTIME_DIR=/run/user/root
-        fi
-
-        if [ ! -d "$XDG_RUNTIME_DIR" ] ; then
-            mkdir --parents $XDG_RUNTIME_DIR
-            chmod 0700 $XDG_RUNTIME_DIR
-        fi
-
-        echo "Starting Weston"
-
-        if [ ! -d "/dev/input" ]; then
-            echo "Waiting for input device..."
-            killproc weston
-            sleep 3
-        fi
-
-        openvt -c 4 -f runWeston
-
-        # If there's no touchscreen device available, done
-        if [ ! -e /dev/input/touchscreen0 ] ; then
-            exit 0
-        fi
-
-        # If it was already calibrated, done
-        if [ -f "$WS_CALUDEV_FILE" ] ; then
-            exit 0
-        fi
-
-        # Check if SD card is mounted
-        mount | grep /run/media/mmcblk0p1 | grep vfat > /dev/null 2>&1
-        if [ "$?" = "0" ] ; then
-            SD_MOUNTED="1"
-        else
-            SD_MOUNTED="0"
-        fi
-
-        # Check if SD card has a calibration rules file
-        SD_CALUDEV_FILE=/run/media/mmcblk0p1/ws-calibrate.rules
-        if [ "$SD_MOUNTED" = "1" -a -f "$SD_CALUDEV_FILE" ] ; then
-            # Copy it over to udev location
-            cp "$SD_CALUDEV_FILE" "$WS_CALUDEV_FILE"
-        else
-            # Run a calibration app and save output to udev rules
-            echo    "Calibrating touchscreen (first time only)"
-            echo
-            echo    "*** To continue, please complete the touchscreen calibration"
-            echo -n "*** by touching the crosshairs on the LCD screen"
-            sleep 2
-            CAL_VALUES=`weston-calibrator|cut -c21-`
-            echo 'SUBSYSTEM=="input", ENV{WL_CALIBRATION}="'$CAL_VALUES'"' > $WS_CALUDEV_FILE
-            echo "."
-            # Copy it back to SD
-            if [ "$SD_MOUNTED" = "1" ] ; then
-                cp "$WS_CALUDEV_FILE" "$SD_CALUDEV_FILE"
-            fi
-        fi
-
-        # Reload and re-run udev rules and restart weston
-        udevadm control --reload
-        udevadm trigger
-        killproc weston
-        sleep 2
-        openvt -c 4 -f runWeston
-  ;;
-
-  stop)
-        echo "Stopping Weston"
-        killproc weston
-  ;;
-
-  restart)
-	$0 stop
-        sleep 2
-        $0 start
-  ;;
-
-  *)
-        echo "usage: $0 { start | stop | restart }"
-  ;;
-esac
-
-exit 0
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
deleted file mode 100644
index aed5d5f9..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
+++ /dev/null
@@ -1,39 +0,0 @@
-#!/bin/sh
-
-clear
-cat << EOF
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-                                        Please wait...
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-EOF
-
-weston --idle-time=0 >> /var/log/weston.log 2>&1
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/ti43x/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init/ti43x/weston.ini
deleted file mode 100644
index 8a9dd998..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/ti43x/weston.ini
+++ /dev/null
@@ -1,16 +0,0 @@
-[core]
-require-input=false
-
-[shell]
-locking=false
-animation=zoom
-panel-position=top
-startup-animation=fade
-
-[screensaver]
-# Uncomment path to disable screensaver
-#path=@libexecdir@/weston-screensaver
-
-[output]
-name=HDMI-A-1
-mode=1024x768
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/wayland_env.sh b/meta-arago-distro/recipes-graphics/wayland/weston-init/wayland_env.sh
deleted file mode 100644
index 50979b30..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/wayland_env.sh
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/bin/sh
-
-### Wayland Environment Variables ###
-
-export XDG_CONFIG_HOME=/etc/
-export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
-export WS_CALUDEV_FILE=/etc/udev/rules.d/ws-calibrate.rules
-
-if ! test -d "${XDG_RUNTIME_DIR}"; then
-       mkdir -p "${XDG_RUNTIME_DIR}"
-       chmod 0700 "${XDG_RUNTIME_DIR}"
-fi
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
index c0ae9f92..4cc2683a 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
@@ -1,4 +1,5 @@
 [core]
+idle-time=0
 require-input=false
 
 [shell]
@@ -7,6 +8,9 @@ animation=zoom
 panel-position=top
 startup-animation=fade
 
+[libinput]
+touchscreen_calibrator=true
+
 [screensaver]
 # Uncomment path to disable screensaver
 #path=@libexecdir@/weston-screensaver
-- 
2.40.1


