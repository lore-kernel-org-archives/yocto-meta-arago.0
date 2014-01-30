Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8FC72529C3
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 22:26:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UMQ441010597
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:26:04 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UMQ4ui019843
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:26:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 16:26:04 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UMQ1YX002862;
	Thu, 30 Jan 2014 16:26:02 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 17:52:32 -0600
Message-ID: <1391125952-5569-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] Update sd card partition mount location
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
X-List-Received-Date: Thu, 30 Jan 2014 22:26:07 -0000
Content-Type: text/plain

* The location where the mmc partitions will be mounted has changed from /media/
   to /run/media/ (/var/run/media).
* Update the various scripts that care about the location of the mmc partitions
  that are mounted in /media.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-tisdk/parse-ip/parse-ip.bb             |    2 +-
 .../recipes-tisdk/parse-ip/parse-ip/init           |    4 ++--
 .../recipes-graphics/tslib/ts-calibrate-init/init  |    4 ++--
 .../tslib/ts-calibrate-init_1.0.bb                 |    2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
index cf3ad89..f20db31 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
@@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "file://init"
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}"
 
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
index 0020ea2..4050efb 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
@@ -32,9 +32,9 @@
 
 case "$1" in
     start )
-        if [ -e /media/mmcblk0p1 ]
+        if [ -e /run/media/mmcblk0p1 ]
         then
-            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > /media/mmcblk0p1/.ipaddr
+            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > /run/media/mmcblk0p1/.ipaddr
             sync
 	    sync
 	fi
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
index ab19da3..db5c278 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
@@ -27,10 +27,10 @@ fi
 
 #TODO how can we find the SD card and not eMMC?  can we look for a "boot"
 # LABEL?
-mount | grep /media/mmcblk0p1 | grep vfat > /dev/null 2>&1
+mount | grep /run/media/mmcblk0p1 | grep vfat > /dev/null 2>&1
 if [ "$?" = "0" ]
 then
-    tsfile=/media/mmcblk0p1/pointercal
+    tsfile=/run/media/mmcblk0p1/pointercal
 fi
 
 export TSLIB_CALIBFILE=$tsfile
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
index 0915941..747a9ef 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -6,7 +6,7 @@ RDEPENDS_${PN} += "tslib"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb7988afdcc6c60"
 
-PR = "r3"
+PR = "r4"
 
 S = "${WORKDIR}"
 
-- 
1.7.0.4


