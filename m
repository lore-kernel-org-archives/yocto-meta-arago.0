Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8A81F529BF
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2013 14:43:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAMEhTeS026494
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2013 08:43:29 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEhTUJ012651
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2013 08:43:29 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 22 Nov 2013 08:43:29 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEhFBN030461;
	Fri, 22 Nov 2013 08:43:28 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Nov 2013 09:45:20 -0600
Message-ID: <1385135121-14345-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1385135121-14345-1-git-send-email-fcooper@ti.com>
References: <1385135121-14345-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/6] mount-sdcard: Update to use new udev entry
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
X-List-Received-Date: Fri, 22 Nov 2013 14:43:31 -0000
Content-Type: text/plain

* Patch 1c1b695310309ec3526f1b6b415c5e1b74a567e1 added a udev entry to
  automatically mount sd card partition.
* For some reason that udev entry isn't automatically ran.
* As a workaround manually trigger udev to run twice (not sure why thats needed)
  for the udev rule to run correctly.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-tisdk/mount-sdcard/mount-sdcard.bb     |    2 +-
 .../recipes-tisdk/mount-sdcard/mount-sdcard/init   |   14 ++++----------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb b/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb
index 29ff489..699c255 100644
--- a/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb
+++ b/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb
@@ -13,7 +13,7 @@ PACKAGE_ARCH = "all"
 
 inherit update-rc.d
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "file://init"
 
diff --git a/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init b/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init
index 61200b5..6634c55 100644
--- a/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init
+++ b/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init
@@ -1,19 +1,13 @@
 #!/bin/sh
 
-devices="/dev/mmcblk0p1 /dev/mmcblk0p2 /dev/mmcblk0p3"
-
 case "$1" in
     start )
-        for d in $devices
-        do
-            DEVNAME=$d ACTION=add /etc/udev/scripts/mount.sh > /dev/null 2>&1
-        done
+        udevadm trigger --action=add --subsystem-match=block
+        udevadm trigger --action=add --subsystem-match=block
     ;;
     stop )
-        for d in $devices
-        do
-            DEVNAME=$d ACTION=remove /etc/udev/scripts/mount.sh > /dev/null 2>&1
-        done
+        udevadm trigger --action=remove --subsystem-match=block
+        udevadm trigger --action=remove --subsystem-match=block
     ;;
 esac
 
-- 
1.7.0.4


