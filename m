Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 30C7E52A62
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 02:23:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C2NkUl028532
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 21:23:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C2Nj9Q031544
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 21:23:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 21:23:45 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2C2NcZp013371;	Wed, 11 Mar 2015 21:23:45 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Mar 2015 22:23:36 -0400
Message-ID: <1426127016-21527-5-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426127016-21527-1-git-send-email-sam.nelson@ti.com>
References: <1426127016-21527-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] crash-recovery: initial script to recover kernel crash
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
X-List-Received-Date: Thu, 12 Mar 2015 02:23:47 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

- In the case of a kernel crash, the script make the dump file from
kdump and reboot the system.

Signed-off-by: Hao Zhang <hzhang@ti.com>
Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../crash-recover/crash-recovery.bb                |   18 +++++++++++++++
 .../crash-recover/files/recoveryfs.sh              |   24 ++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/crash-recover/crash-recovery.bb
 create mode 100755 meta-arago-extras/recipes-support/crash-recover/files/recoveryfs.sh

diff --git a/meta-arago-extras/recipes-support/crash-recover/crash-recovery.bb b/meta-arago-extras/recipes-support/crash-recover/crash-recovery.bb
new file mode 100644
index 0000000..3ee7cc1
--- /dev/null
+++ b/meta-arago-extras/recipes-support/crash-recover/crash-recovery.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Initscripts for kdump recovery mechanism"
+LICENSE = "BSD-3-Clause"
+
+COMPATIBLE_MACHINE = "keystone"
+LIC_FILES_CHKSUM = "file://recoveryfs.sh;md5=e1cea7fe03a879dfe71592798e89ed0d"
+
+S = "${WORKDIR}"
+SRC_URI = "file://recoveryfs.sh"
+
+INITSCRIPT_NAME = "recoveryfs.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
+inherit update-rc.d
+
+do_install_append() {
+        install -d ${D}${sysconfdir}/init.d/
+        install -c -m 755 ${WORKDIR}/recoveryfs.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+}
diff --git a/meta-arago-extras/recipes-support/crash-recover/files/recoveryfs.sh b/meta-arago-extras/recipes-support/crash-recover/files/recoveryfs.sh
new file mode 100755
index 0000000..665b95e
--- /dev/null
+++ b/meta-arago-extras/recipes-support/crash-recover/files/recoveryfs.sh
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+if [ -f /proc/vmcore ] ; then
+  mkdir -p /mnt/boot2
+  mount -t ubifs /dev/ubi0_2 /mnt/boot2
+  if [ $? -eq 0 ] ; then
+     if [ -f /usr/bin/makedumpfile ] ; then
+       makedumpfile -E -d 31 /proc/vmcore /mnt/boot2/home/root/coredump.elf
+       gzip -c /mnt/boot2/home/root/coredump.elf > \
+           /mnt/boot2/home/root/coredump.elf.gz
+       rm -rf /mnt/boot2/home/root/coredump.elf
+       sync
+       reboot
+     else
+       echo "makedumpfile not found"
+       exit 1
+     fi
+  else
+    echo "mount unsuccessful"
+    exit 1
+  fi
+fi
+
+exit 0
-- 
1.7.9.5


