Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B8FE652AC1
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 10:55:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82AtFMG017418
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:15 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AtF5H032110
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 05:55:14 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AsrZI026077;
	Tue, 2 Sep 2014 05:55:13 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Sep 2014 16:24:37 +0530
Message-ID: <1409655283-4899-7-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409655283-4899-1-git-send-email-a0393906@ti.com>
References: <1409655283-4899-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH 06/12] wl18xx : update to ol_r8.a9.14
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
X-List-Received-Date: Tue, 02 Sep 2014 10:55:16 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Changed git sources to git.ti.com
    - Updated to latest release.
Signed-off-by: Yaniv Machani <yanivma@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Tested-by: Karthik Ramanan <a0393906@ti.com>
---
 .../wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb    | 30 ---------------------
 .../wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb    | 31 ++++++++++++++++++++++
 2 files changed, 31 insertions(+), 30 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
deleted file mode 100644
index b59f1c4..0000000
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "Firmware files for use with TI wl18xx"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
-
-PACKAGE_ARCH = "all"
-
-PR = "r3+gitr${SRCPV}"
-
-PROVIDES += "wl12xx-firmware"
-RPROVIDES_${PN} += "wl12xx-firmware"
-RREPLACES_${PN} += "wl12xx-firmware"
-RCONFLICTS_${PN} += "wl12xx-firmware"
-
-# Tag: ol_r8.a8.10
-SRCREV = "89dc93a5c23fd69ebacd64c936ba5aabf173c29b"
-SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git;branch=mbss \
-           file://0001-Add-Makefile-for-SDK.patch \
-          "
-
-S = "${WORKDIR}/git"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    oe_runmake 'DEST_DIR=${D}' install
-}
-
-FILES_${PN} = "/lib/firmware/ti-connectivity/*"
diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb
new file mode 100644
index 0000000..45d4ea7
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Firmware files for use with TI wl18xx"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
+
+PACKAGE_ARCH = "all"
+
+PR = "r4+gitr${SRCPV}"
+
+PROVIDES += "wl12xx-firmware"
+RPROVIDES_${PN} += "wl12xx-firmware"
+RREPLACES_${PN} += "wl12xx-firmware"
+RCONFLICTS_${PN} += "wl12xx-firmware"
+
+# Tag: ol_r8.a9.14
+SRCREV = "2568d8f61fd509eabb112110c20ea31c088ef6b9"
+BRANCH = "ap_dfs"
+SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
+           file://0001-Add-Makefile-for-SDK.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    oe_runmake 'DEST_DIR=${D}' install
+}
+
+FILES_${PN} = "/lib/firmware/ti-connectivity/*"
-- 
2.0.1


