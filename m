Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 3C01D529A1
	for <meta-arago@arago-project.org>;
	Sat, 22 Sep 2012 00:21:47 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so3675356obb.38
	for <meta-arago@arago-project.org>;
	Fri, 21 Sep 2012 17:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2DIhiqNoiG27L+HULMUL9Q3xVuTNDg4tlhE6kpo4QWI=;
	b=oRgTxBM9XKkLsngzFc+tXBtqrt3VJHI6Fwq1dz5nlbXwGVkfWj2Xuyp2ZyrTNITqoK
	oBWCDR05Gt7Iq4Cyuxs623btb+0R0TeasfbURGha8x3mSwNRFo8g4oAe7v5t9kzQ0AbF
	mS0Kto1PTSX5CXowUvJ+TX4p8uuVwAMQzqcVt+CF6nkWqluCn37eZkfdvm/BCO7RP2Bt
	ZedWeBHLLiI8aL4jThmRCXhmcItC/OY+MyO7B0DfZPnCdxJNLLw7vLh6xtxW0xmox007
	mSB6LsAk5lAsgP2vA0z+MUfZIbUza2gn1U0fqKt4O8827eV9iqo2npHoJrwvhHqhyAWC
	s6xQ==
Received: by 10.60.20.8 with SMTP id j8mr5056275oee.127.1348273306574;
	Fri, 21 Sep 2012 17:21:46 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id bp7sm9288097obc.12.2012.09.21.17.21.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 17:21:46 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 21 Sep 2012 19:45:10 -0500
Message-Id: <1348274710-27514-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-extras][PATCH] gadget-init: Overlay gadget-init recipe.
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
X-List-Received-Date: Sat, 22 Sep 2012 00:21:47 -0000

* Grabbed gadget-init recipe from arago which is based on a recipe
  with the same name in meta-ti. This version however is based on
  sysvinit while the meta-ti version is based on systemd.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-tisdk/gadget-init/gadget-init.bb       |   24 +++++++++++++++++++
 .../recipes-tisdk/gadget-init/gadget-init/init     |   25 ++++++++++++++++++++
 2 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
 create mode 100644 meta-arago-distro/recipes-tisdk/gadget-init/gadget-init/init

diff --git a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
new file mode 100644
index 0000000..773dd49
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
@@ -0,0 +1,24 @@
+# This recipe is based on the recipe by Koen in meta-texasinstruments
+DESCRIPTION = "Scripts to initialize usb gadgets"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+COMPATIBLE_MACHINE = "ti33x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r0"
+
+SRC_URI = "file://init"
+
+INITSCRIPT_NAME = "storage-gadget-init"
+INITSCRIPT_PARAMS = "defaults 98"
+
+inherit update-rc.d
+
+do_install() {
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/storage-gadget-init
+}
+
+FILES_${PN} = "${sysconfdir} ${bindir}"
+RDEPENDS += "kernel-module-g-ether kernel-module-g-mass-storage"
diff --git a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init/init b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init/init
new file mode 100644
index 0000000..872f7f5
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init/init
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+
+case "$1" in
+    start )
+        # If this is a 3 partition card mount the first and third
+        # partition.  Else only mount the first one.
+        if [ -e /dev/mmcblk0p1 -a -e /dev/mmcblk0p3 ]
+        then
+            modprobe g_mass_storage file=/dev/mmcblk0p1,/dev/mmcblk0p3
+        elif [ -e /dev/mmcblk0p1 ]
+        then
+            modprobe g_mass_storage file=/dev/mmcblk0p1
+        fi
+    ;;
+    stop )
+        lsmod | grep g_mass_storage > /dev/null
+        if [ "$?" == "0" ]
+        then
+            rmmod g_mass_storage
+        fi
+    ;;
+esac
+
+exit 0
-- 
1.7.0.4


