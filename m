Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by arago-project.org (Postfix) with ESMTPS id 036AC52A92
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:54 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id i18so5032031oag.32
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=3ns9rmkCz8GbWfiN2nM/D9dnT++ONp6O8aoDjDIq09I=;
	b=SppD5dZFoZ2j0KoOO7RCE/cQmhtey4PtZJxTXhGbvbRwjzNLX46wg/eFjrvODmpiJX
	9Q0e7TE3/2R31BmlFuE6WDo9ErdZN1Fao73JXd7fvVr9ccP/uD5JaKuMpvQjtxf7PHpX
	BZZyAHYhxDOQHA0IXOPoOCf4ZlquGRokLaEPMhn5IEj/ZVlb+JFnG5YXJHcnpJaVivNq
	R4uko8NZPW6EVqiHCVexLNUcU48RWTVE0SHKcpzL/VIc0NHfzOrxK7Y5k9ClAbD8KbAE
	Mkq8YXEAOBYbH7Vh9nZkihJSDgxlKlmSP/E1i1YogK/fj6rRSVkDSDcBQYauyXGNx/ap
	NjBg==
X-Received: by 10.182.43.99 with SMTP id v3mr10236440obl.48.1358632374534;
	Sat, 19 Jan 2013 13:52:54 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.52
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:53 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:55 -0600
Message-Id: <1358632316-12266-30-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 30/31] mount-sdcard: Add recipe that automounts SD Card partitions
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:55 -0000

* This recipe is meant to be a temporary fix until we can figure out why
  the SD card partitions are not automounted anymore.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-tisdk/mount-sdcard/mount-sdcard.bb     |   30 ++++++++++++++++++++
 .../recipes-tisdk/mount-sdcard/mount-sdcard/init   |   20 +++++++++++++
 2 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard.bb
 create mode 100644 meta-arago-distro/recipes-tisdk/mount-sdcard/mount-sdcard/init

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


