Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 189A5529AF
	for <meta-arago@arago-project.org>;
	Fri, 10 Apr 2015 19:58:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3AJwm7C001895
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 14:58:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AJwlNS004487
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 14:58:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 14:58:47 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3AJwkpf025162;	Fri, 10 Apr 2015 14:58:46 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 Apr 2015 15:58:45 -0400
Message-ID: <1428695925-22569-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] crash-recovery: add rw,sync mount option
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
X-List-Received-Date: Fri, 10 Apr 2015 19:58:49 -0000
Content-Type: text/plain

- This patch adds rw-sync option when mounting the main root filesystem
from the recovery root filesystem, which fixes the rcovery kernel
crash problem
- Add license header to recvoverfs.sh

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../crash-recovery/crash-recovery.bb               |    3 ++-
 .../crash-recovery/files/recoveryfs.sh             |   26 +++++++++++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-support/crash-recovery/crash-recovery.bb b/meta-arago-extras/recipes-support/crash-recovery/crash-recovery.bb
index 3ee7cc1..9595909 100644
--- a/meta-arago-extras/recipes-support/crash-recovery/crash-recovery.bb
+++ b/meta-arago-extras/recipes-support/crash-recovery/crash-recovery.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "Initscripts for kdump recovery mechanism"
 LICENSE = "BSD-3-Clause"
 
 COMPATIBLE_MACHINE = "keystone"
-LIC_FILES_CHKSUM = "file://recoveryfs.sh;md5=e1cea7fe03a879dfe71592798e89ed0d"
+LIC_FILES_CHKSUM = "file://recoveryfs.sh;beginline=1;endline=20;md5=83e9f5412fd9a0db2aee516b52c24535"
+PR ="r1"
 
 S = "${WORKDIR}"
 SRC_URI = "file://recoveryfs.sh"
diff --git a/meta-arago-extras/recipes-support/crash-recovery/files/recoveryfs.sh b/meta-arago-extras/recipes-support/crash-recovery/files/recoveryfs.sh
index 665b95e..d1b15e4 100755
--- a/meta-arago-extras/recipes-support/crash-recovery/files/recoveryfs.sh
+++ b/meta-arago-extras/recipes-support/crash-recovery/files/recoveryfs.sh
@@ -1,13 +1,33 @@
+#*
+#* Copyright (C) 2012-2014 Texas Instruments Incorporated - http://www.ti.com/
+#*
+#*
+#*  Redistribution and use in source and binary forms, with or without
+#*  modification, are permitted provided that the following conditions
+#*  are met:
+#*
+#*    Redistributions of source code must retain the above copyright
+#*    notice, this list of conditions and the following disclaimer.
+#*
+#*    Redistributions in binary form must reproduce the above copyright
+#*    notice, this list of conditions and the following disclaimer in the
+#*    documentation and/or other materials provided with the
+#*    distribution.
+#*
+#*    Neither the name of Texas Instruments Incorporated nor the names of
+#*    its contributors may be used to endorse or promote products derived
+#*    from this software without specific prior written permission.
+#*
+
 #!/bin/sh
 
 if [ -f /proc/vmcore ] ; then
   mkdir -p /mnt/boot2
-  mount -t ubifs /dev/ubi0_2 /mnt/boot2
+  mount -o rw,sync -t ubifs /dev/ubi0_2 /mnt/boot2
   if [ $? -eq 0 ] ; then
      if [ -f /usr/bin/makedumpfile ] ; then
        makedumpfile -E -d 31 /proc/vmcore /mnt/boot2/home/root/coredump.elf
-       gzip -c /mnt/boot2/home/root/coredump.elf > \
-           /mnt/boot2/home/root/coredump.elf.gz
+       gzip -c /mnt/boot2/home/root/coredump.elf > /mnt/boot2/home/root/coredump.elf.gz
        rm -rf /mnt/boot2/home/root/coredump.elf
        sync
        reboot
-- 
1.7.9.5


