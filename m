Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2FE9952ACE
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 10:55:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82AtNrh017438
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:23 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AtNom010429
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:23 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 05:55:23 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AsrZM026077;
	Tue, 2 Sep 2014 05:55:21 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Sep 2014 16:24:41 +0530
Message-ID: <1409655283-4899-11-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409655283-4899-1-git-send-email-a0393906@ti.com>
References: <1409655283-4899-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH 10/12] wl18xx-compat: version update
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
X-List-Received-Date: Tue, 02 Sep 2014 10:55:24 -0000
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
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
+++ /dev/null
@@ -1,61 +0,0 @@
-# This is a TI specific version of the compat-wireless recipe using a
-# compat-wireless package created from the TI Systems Tested mac80211 releases.
-
-DESCRIPTION = "ti compat-wireless drivers for wl18xx"
-HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
-SECTION = "kernel/modules"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-RDEPENDS_${PN} = "wireless-tools"
-
-PROVIDES += "ti-compat-wireless-wl12xx"
-RPROVIDES_${PN} += "ti-compat-wireless-wl12xx"
-RREPLACES_${PN} += "ti-compat-wireless-wl12xx"
-RCONFLICTS_${PN} += "ti-compat-wireless-wl12xx"
-
-COMPATIBLE_MACHINE = "(omap-a15)"
-
-PV = "r8.a8.08"
-inherit module
-
-PR = "${MACHINE_KERNEL_PR}"
-PR_append = "b"
-
-# Tags: ol_r8.a8.10
-SRCREV_wl18xx = "eaa1820c02dc076e6ad9254e9cb7a3bb0c17471b"
-SRCREV_compat = "5d80865281795f962e1400a95202bbd07dd763c0"
-SRCREV_compat-wireless = "23a0d62ea1a57327709a77f08d6265ec807a909f"
-
-SRCREV_FORMAT = "compat-wireless"
-
-S = "${WORKDIR}/compat-wireless"
-
-SRC_URI = "git://github.com/TI-OpenLink/compat-wireless.git;destsuffix=compat-wireless;name=compat-wireless \
-           git://github.com/TI-OpenLink/compat.git;destsuffix=compat;name=compat \
-           git://github.com/TI-OpenLink/wl18xx.git;destsuffix=wl18xx;name=wl18xx \
-"
-
-EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
-
-do_configure() {
-    cd ${S}
-    GIT_TREE="${WORKDIR}/wl18xx" GIT_COMPAT_TREE="${WORKDIR}/compat" ./scripts/admin-refresh.sh network
-    ./scripts/driver-select wl18xx
-
-    # Now generate the sourceipk with the properly configured sources
-    sourceipk_do_create_srcipk
-}
-
-do_configure_append() {
-    sed -i "s#@./scripts/update-initramfs## " Makefile
-}
-
-do_install() {
-    # Remove hardcoded references to host depmod
-    sed -i "s#@/sbin/depmod -a## " Makefile
-    sed -i "s#@/sbin/depmod -ae## " Makefile
-
-    # Install modules
-    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
-}
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


