Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id CB3FD529D5
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 12:42:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83CgCtX013473
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:12 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CgCtb015113
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 07:42:12 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CfZho031656;
	Wed, 3 Sep 2014 07:42:10 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Sep 2014 18:11:29 +0530
Message-ID: <1409748091-12617-11-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409748091-12617-1-git-send-email-a0393906@ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for dora] [PATCH v2 10/12] wl18xx-compat: version update
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
X-List-Received-Date: Wed, 03 Sep 2014 12:42:13 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Update to latest version tag - ol_r8.a9.14
- move to git.ti.com and use backports module.
- clean some unused commands.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Conflicts:

	meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       |  3 +-
 .../ti-compat-wireless-wl18xx_r8.a8.10.bb          | 61 ----------------------
 .../ti-compat-wireless-wl18xx_r8.a9.14.bb          | 51 ++++++++++++++++++
 3 files changed, 53 insertions(+), 62 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index fa82e7e..6a51fdb 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r25"
+PR = "r27"
 
 inherit packagegroup
 
@@ -31,6 +31,7 @@ WLAN_COMMON = "\
 #    netperf
 
 FIRMWARE_AND_DRIVERS = "\
+    ti-compat-wireless-wl18xx \
     wl18xx-firmware \
 "
 
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
deleted file mode 100644
index 0e7281a..0000000
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
new file mode 100644
index 0000000..dca2edb
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
@@ -0,0 +1,51 @@
+# This is a TI specific version of the compat-wireless recipe using a
+# compat-wireless package created from the TI Systems Tested mac80211 releases.
+
+DESCRIPTION = "ti compat-wireless drivers for wl18xx"
+HOMEPAGE = "https://git.ti.com/wilink8-wlan/wl18xx"
+SECTION = "kernel/modules"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+RDEPENDS_${PN} = "wireless-tools"
+
+PV = "r8.a9.14"
+inherit module
+
+PR = "${MACHINE_KERNEL_PR}+a+gitr${SRCPV}"
+
+# Tags: ol_r8.a9.14
+SRCREV_wl18xx = "0e48c4b55cfa0d557a098cbe92b1f092f1a9ad67"
+BRANCH_wl18xx = "ap_p2p"
+SRCREV_backports = "0d46f43a2f3ccdd53de19eee5b9c674bf8ef09a2"
+BRANCH_backports = "ap_dfs_mbss_all"
+
+SRCREV_FORMAT = "wl18xx"
+
+S = "${WORKDIR}/compat-wireless"
+
+SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx.git;branch=${BRANCH_wl18xx};destsuffix=wl18xx;name=wl18xx \
+           git://git.ti.com/wilink8-wlan/backports.git;branch=${BRANCH_backports};destsuffix=backports;name=backports \
+ "
+
+export KLIB_BUILD="${STAGING_KERNEL_DIR}"
+export KLIB="${D}"
+
+do_configure() {
+    cd "${WORKDIR}/backports"
+    unset CC
+    #Generate compat-wireless
+    python ./gentree.py --clean  "${WORKDIR}/wl18xx" "${WORKDIR}/compat-wireless"
+
+    cd ${S}
+    make defconfig-wl18xx
+
+    # Now generate the sourceipk with the properly configured sources
+	sourceipk_do_create_srcipk
+}
+
+do_install() {
+    # Install modules
+    oe_runmake modules_install
+}
+
-- 
2.0.1


