Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 15DF252A0B
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2013 14:43:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAMEhRTP013300
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2013 08:43:27 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEhRLT002342
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2013 08:43:27 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 22 Nov 2013 08:43:26 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEhFBM030461;
	Fri, 22 Nov 2013 08:43:25 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Nov 2013 09:45:19 -0600
Message-ID: <1385135121-14345-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1385135121-14345-1-git-send-email-fcooper@ti.com>
References: <1385135121-14345-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/6] Revert "packagegroup-arago-tisdk-amsdk.bb, mount-sdcard: Remove mount-sdcard"
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
X-List-Received-Date: Fri, 22 Nov 2013 14:43:28 -0000
Content-Type: text/plain

This reverts commit c304ad98cf74b9781cabeabcbceeec48fdcd27df.

udev for some reason is still not running the udev rule that auto mounts the
specific mmc partition.
---
 .../packagegroup-arago-tisdk-amsdk.bb              |    3 +-
 .../recipes-tisdk/mount-sdcard/mount-sdcard.bb     |   30 ++++++++++++++++++++
 .../recipes-tisdk/mount-sdcard/mount-sdcard/init   |   20 +++++++++++++
 3 files changed, 52 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb
 create mode 100644 meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
index c2eb72b..254caf8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional packages only used in the Arago SDK"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
@@ -23,6 +23,7 @@ EXTRA_APPLICATIONS = "\
 "
 
 RDEPENDS_${PN} = "\
+    mount-sdcard \
     ${OOBE} \
     ${EXTRA_APPLICATIONS} \
 "
diff --git a/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb b/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb
new file mode 100644
index 0000000..29ff489
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb
@@ -0,0 +1,30 @@
+# This recipe is meant to be a temporary fix until we can figure out why
+# the SD card partitions are not automounted anymore.
+
+DESCRIPTION = "Script to mount SD card partitions when available"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# RDEPEND on udev since we re-use the mount.sh script
+RDEPENDS_${PN} += "udev"
+
+PACKAGE_ARCH = "all"
+
+inherit update-rc.d
+
+PR = "r0"
+
+SRC_URI = "file://init"
+
+INITSCRIPT_NAME = "mount-sdcard"
+
+# Mount it early enough that other scripts can find the partitions.
+INITSCRIPT_PARAMS = "defaults 90"
+
+do_install() {
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/mount-sdcard
+}
+
+FILES_${PN} = "${sysconfdir} ${bindir}"
diff --git a/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init b/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init
new file mode 100644
index 0000000..61200b5
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+devices="/dev/mmcblk0p1 /dev/mmcblk0p2 /dev/mmcblk0p3"
+
+case "$1" in
+    start )
+        for d in $devices
+        do
+            DEVNAME=$d ACTION=add /etc/udev/scripts/mount.sh > /dev/null 2>&1
+        done
+    ;;
+    stop )
+        for d in $devices
+        do
+            DEVNAME=$d ACTION=remove /etc/udev/scripts/mount.sh > /dev/null 2>&1
+        done
+    ;;
+esac
+
+exit 0;
-- 
1.7.0.4


