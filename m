Return-Path: <yanivma@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 43DB452A7F
	for <meta-arago@arago-project.org>;
	Sun,  2 Aug 2015 10:05:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t72A5ujb018981
	for <meta-arago@arago-project.org>; Sun, 2 Aug 2015 05:05:56 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t72A5uMG021153
	for <meta-arago@arago-project.org>; Sun, 2 Aug 2015 05:05:56 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 2 Aug 2015 05:05:56 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t72A5tuI016296;	Sun, 2 Aug 2015 05:05:55 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 2 Aug 2015 12:54:05 +0300
Message-ID: <1438509245-22224-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] Wilink8 : Update to latest version
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
X-List-Received-Date: Sun, 02 Aug 2015 10:05:57 -0000
Content-Type: text/plain

Updated recipes to match version R8.6
- Removed compat-wireless, as build is done intree
- Updates sources to the latests.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../ti-compat-wireless-wl18xx.bb                   |   51 --------------------
 .../recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb |    8 ++--
 .../hostap/hostap-daemon-wl18xx.bb                 |   10 ++--
 .../wl18xx-target-scripts/wl18xx-target-scripts.bb |   10 ++--
 .../wpa-supplicant/wpa-supplicant-wl18xx.bb        |    8 ++--
 .../ti-wifi-utils/ti-wifi-utils-wl18xx.bb          |    8 ++--
 6 files changed, 22 insertions(+), 73 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
deleted file mode 100644
index 2498c70..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-# This is a TI specific version of the compat-wireless recipe using a
-# compat-wireless package created from the TI Systems Tested mac80211 releases.
-
-DESCRIPTION = "ti compat-wireless drivers for wl18xx"
-HOMEPAGE = "https://git.ti.com/wilink8-wlan/wl18xx"
-SECTION = "kernel/modules"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://../backports/COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-RDEPENDS_${PN} = "wireless-tools"
-
-PV = "R8.5+git${SRCPV}"
-inherit module
-
-PR = "${MACHINE_KERNEL_PR}+g"
-
-# Tags: R8.5
-SRCREV_wl18xx = "ad69b45b9a670ee7f76be4def03895ac9b3a6d4a"
-BRANCH_wl18xx = "ap_p2p"
-SRCREV_backports = "0d46f43a2f3ccdd53de19eee5b9c674bf8ef09a2"
-BRANCH_backports = "ap_dfs_mbss_all"
-
-SRCREV_FORMAT = "wl18xx"
-
-S = "${WORKDIR}/compat-wireless"
-
-SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx.git;branch=${BRANCH_wl18xx};destsuffix=wl18xx;name=wl18xx \
-           git://git.ti.com/wilink8-wlan/backports.git;branch=${BRANCH_backports};destsuffix=backports;name=backports \
-"
-
-export KLIB_BUILD="${STAGING_KERNEL_DIR}"
-export KLIB="${D}"
-
-do_configure() {
-    cd "${WORKDIR}/backports"
-    unset CC
-    #Generate compat-wireless
-    python ./gentree.py --clean  "${WORKDIR}/wl18xx" "${WORKDIR}/compat-wireless"
-
-    cd ${S}
-
-    # Now generate the sourceipk with the properly configured sources
-    sourceipk_do_create_srcipk
-
-    make defconfig-wl18xx
-}
-
-do_install() {
-    # Install modules
-    oe_runmake modules_install
-}
diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
index 411db44..06ebd25 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
@@ -4,17 +4,17 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
 
 inherit allarch
 
-PV = "R8.5+git${SRCPV}"
+PV = "R8.6+git${SRCPV}"
 
-PR = "r6"
+PR = "r7"
 
 PROVIDES += "wl12xx-firmware"
 RPROVIDES_${PN} += "wl12xx-firmware"
 RREPLACES_${PN} += "wl12xx-firmware"
 RCONFLICTS_${PN} += "wl12xx-firmware"
 
-# Tag: R8.5
-SRCREV = "02df01f8b9557b2cf920d14bdaaabde2373e3d7e"
+# Tag: R8.6
+SRCREV = "c4c0c7943040473bd9aeba2ab9fa99617fa08a4b"
 BRANCH = "ap_dfs"
 SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
            file://0001-Add-Makefile-for-SDK.patch \
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
index 4eadeac..bcd3c9f 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
@@ -6,17 +6,17 @@ require hostap.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
 
-PR_append = "c"
+PR_append = "d"
 
 FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
 
 # Add TI to the end to make it clear that this is a TI customized version
 # of hostap
-PV = "R8.5-devel-ti+git${SRCPV}"
+PV = "R8.6-devel-ti+git${SRCPV}"
 
-# Tag: R8.5
-SRCREV = "2710d0ae31fa2dc31f653f346a985268d8d7795c"
-BRANCH = "ap_p2p"
+# Tag: R8.6
+SRCREV = "f80fe345acf103ba6882ac8396f19584ac184904"
+BRANCH = "upstream_24"
 
 PROVIDES += "hostap-daemon"
 RPROVIDES_${PN} += "hostap-daemon"
diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb
index 86862ee..414ba0c 100644
--- a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb
+++ b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
 
-PV = "R8.5+git${SRCPV}"
+PV = "R8.6+git${SRCPV}"
 
-PR = "r6"
+PR = "r7"
 
-# Tag: Almost R8.5
-SRCREV = "0e64b3096c3c05a53465cf4e09fa0a1c8cf54c60"
-BRANCH = "sitara-mbss"
+# Tag: R8.6
+SRCREV = "693f71c709abcaa9047835cf3903aea26a63fa94"
+BRANCH = "sitara-scripts"
 SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
index 81ea8fa..412c214 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
 
 FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
 
-# Tag: R8.5
-SRCREV = "2710d0ae31fa2dc31f653f346a985268d8d7795c"
-BRANCH = "ap_p2p"
-PR_append = "c"
+# Tag: R8.6
+SRCREV = "f80fe345acf103ba6882ac8396f19584ac184904"
+BRANCH = "upstream_24"
+PR_append = "d"
 
 # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
 PV = "R8.5-devel-ti+git${SRCPV}"
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb
index 6670b5b..1d452f5 100644
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
 DEPENDS = "libnl"
 RDEPENDS_${PN} = "wl18xx-firmware"
 
-PV = "R8.5+git${SRCPV}"
+PV = "R8.6+git${SRCPV}"
 
-PR = "r4"
+PR = "r5"
 
-#Tag: R8.5
-SRCREV = "dcf0800f30ba449cd7f3a20f8b3f4853dc829652"
+#Tag: R8.6
+SRCREV = "cf8965aad73764022669647fa33852558a657930"
 SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git \
 "
 
-- 
1.7.9


