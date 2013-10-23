Return-Path: <tom.rini@gmail.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by arago-project.org (Postfix) with ESMTPS id 5ECB55299B
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 18:26:31 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id j15so745955qaq.20
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=yXOFKbjbwG2TFMHRtz/Zw0z4/2bQ/V8CM7GW2B4ZFYs=;
	b=mIT+FrM3H1GUIjC9CclEunnyUj+A6akIon3KkFd4dE0V917qpFOm06uXkJo1aNQJ2A
	aSrDXi7nre9z2r49fyjHWMszGVeuSq1lPUFIl3PY8w3IaLaDmIkSnJiqQp+wi7Wo/kPS
	ZvD4o6lSHfZA1FtALVAJxs+7n0e7QjVIzPBRDte8sfZaZZUaKZqGWrjRRLr0A1fw7/Bl
	uxpvlBb7tpdOqj+FJ+KMBLPfwFXGMh7C81epO/OIap+APoLPnv/X7YdOUVw5T3uaQjIE
	oAbeFTXycEoZJ+EcGpFGkY4KlSXiZS1ol7BrnjMnp5gx+Pg+aU0P4kYiKKd6gL0Znvte
	Fl1Q==
X-Received: by 10.229.101.136 with SMTP id c8mr4087034qco.17.1382552791202;
	Wed, 23 Oct 2013 11:26:31 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-216-211.ec.res.rr.com.
	[174.106.216.211])
	by mx.google.com with ESMTPSA id 5sm63987969qao.3.2013.10.23.11.26.29
	for <meta-arago@arago-project.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Oct 2013 11:26:30 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 23 Oct 2013 14:26:17 -0400
Message-Id: <1382552778-29138-4-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1382552778-29138-1-git-send-email-trini@ti.com>
References: <1382552778-29138-1-git-send-email-trini@ti.com>
Subject: [PATCH 3/3] packagegroup-arago-tisdk-amsdk.bb, mount-sdcard: Remove mount-sdcard
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
X-List-Received-Date: Wed, 23 Oct 2013 18:26:31 -0000

With a udev rule to invoke /etc/udev/scripts/mount.sh we no longer need
the mount-sdcard package to handle this for us, so remove it.

Signed-off-by: Tom Rini <trini@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk.bb              |    3 +-
 .../recipes-tisdk/mount-sdcard/mount-sdcard.bb     |   30 --------------------
 .../recipes-tisdk/mount-sdcard/mount-sdcard/init   |   20 -------------
 3 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
index ad32656..c2eb72b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional packages only used in the Arago SDK"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 inherit packagegroup
 
@@ -23,7 +23,6 @@ EXTRA_APPLICATIONS = "\
 "
 
 RDEPENDS_${PN} = "\
-    mount-sdcard \
     ${OOBE} \
     ${EXTRA_APPLICATIONS} \
 "
diff --git a/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb b/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb
deleted file mode 100644
index 29ff489..0000000
--- a/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-# This recipe is meant to be a temporary fix until we can figure out why
-# the SD card partitions are not automounted anymore.
-
-DESCRIPTION = "Script to mount SD card partitions when available"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-# RDEPEND on udev since we re-use the mount.sh script
-RDEPENDS_${PN} += "udev"
-
-PACKAGE_ARCH = "all"
-
-inherit update-rc.d
-
-PR = "r0"
-
-SRC_URI = "file://init"
-
-INITSCRIPT_NAME = "mount-sdcard"
-
-# Mount it early enough that other scripts can find the partitions.
-INITSCRIPT_PARAMS = "defaults 90"
-
-do_install() {
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/mount-sdcard
-}
-
-FILES_${PN} = "${sysconfdir} ${bindir}"
diff --git a/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init b/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init
deleted file mode 100644
index 61200b5..0000000
--- a/meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-
-devices="/dev/mmcblk0p1 /dev/mmcblk0p2 /dev/mmcblk0p3"
-
-case "$1" in
-    start )
-        for d in $devices
-        do
-            DEVNAME=$d ACTION=add /etc/udev/scripts/mount.sh > /dev/null 2>&1
-        done
-    ;;
-    stop )
-        for d in $devices
-        do
-            DEVNAME=$d ACTION=remove /etc/udev/scripts/mount.sh > /dev/null 2>&1
-        done
-    ;;
-esac
-
-exit 0;
-- 
1.7.9.5


