Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 85533529F2
	for <meta-arago@arago-project.org>;
	Mon, 15 Apr 2013 20:03:19 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3FK3IQf029820
	for <meta-arago@arago-project.org>; Mon, 15 Apr 2013 15:03:18 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3FK3IbP032368
	for <meta-arago@arago-project.org>; Mon, 15 Apr 2013 15:03:18 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 15 Apr 2013 15:03:18 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3FK3FGZ010527;
	Mon, 15 Apr 2013 15:03:16 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Apr 2013 15:03:11 -0500
Message-ID: <1366056193-22892-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/3] linux-ti-staging: overlay dtb symlinks
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
X-List-Received-Date: Mon, 15 Apr 2013 20:03:19 -0000
Content-Type: text/plain

* Overlay the dtb symlinks change until it can be merged into
  the oe-core danny branch

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../linux/linux-ti-staging_3.8.bbappend            |   24 +++++++++++++++++++-
 1 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
index 4eafeb8..39f0d75 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
@@ -1,4 +1,4 @@
-MACHINE_KERNEL_PR_append = "-arago3"
+MACHINE_KERNEL_PR_append = "-arago4"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
@@ -7,3 +7,25 @@ require copy-defconfig.inc
 SRCREV = "${AUTOREV}"
 
 KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
+
+# The below lines are overlayed in this append until the dtb symlinks change
+# is merged into the oe-core danny branch
+pkg_postinst_kernel-devicetree () {
+    cd /${KERNEL_IMAGEDEST}
+    for DTS_FILE in ${KERNEL_DEVICETREE}
+    do
+        DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+        DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+        update-alternatives --install /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+    done
+}
+
+pkg_postrm_kernel-devicetree () {
+    cd /${KERNEL_IMAGEDEST}
+    for DTS_FILE in ${KERNEL_DEVICETREE}
+    do
+        DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+        DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+        update-alternatives --remove ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+    done
+}
-- 
1.7.0.4


