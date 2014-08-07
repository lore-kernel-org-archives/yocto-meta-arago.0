Return-Path: <yanivma@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BC04552972
	for <meta-arago@arago-project.org>;
	Thu,  7 Aug 2014 16:35:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s77GYwTF023332
	for <meta-arago@arago-project.org>; Thu, 7 Aug 2014 11:34:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s77GYwbc027725
	for <meta-arago@arago-project.org>; Thu, 7 Aug 2014 11:34:58 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 11:34:57 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s77GYuDY000475;	Thu, 7 Aug 2014 11:34:57 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 7 Aug 2014 19:29:55 +0300
Message-ID: <1407428995-23585-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH 1/2] wl18xx-compat: version update
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
X-List-Received-Date: Thu, 07 Aug 2014 16:35:04 -0000
Content-Type: text/plain

- Update to latest version tag - ol_r8.a9.14
- move to git.ti.com and use backports module.
- clean some unused commands.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       |    3 +-
 .../ti-compat-wireless-wl18xx_r8.a8.10.bb          |   61 --------------------
 .../ti-compat-wireless-wl18xx_r8.a9.14.bb          |   51 ++++++++++++++++
 3 files changed, 53 insertions(+), 62 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index fa82e7e..7dadca2 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r25"
+PR = "r26"
 
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
1.7.9


