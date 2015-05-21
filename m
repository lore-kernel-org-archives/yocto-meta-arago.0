Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 9130B5297F
	for <meta-arago@arago-project.org>;
	Thu, 21 May 2015 01:57:17 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOO00JP4G33GO10@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 May 2015 20:57:04 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=AawGxMSu c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8 a=HihYlcsHAAAA:8	a=a98Lv7fMbrjOQ88mXMIA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6739E20099;	Wed,
	20 May 2015 21:57:03 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 May 2015 21:56:58 -0400
Message-id: <1432173422-9519-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/5] recipes: move SRCPV from PR to PV, so PRServ can package AUTOINC after patching
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
X-List-Received-Date: Thu, 21 May 2015 01:57:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb        | 6 +++---
 .../recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb     | 4 ++--
 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb    | 4 ++--
 .../recipes-connectivity/hostap/hostap-daemon-wl18xx.bb             | 4 ++--
 .../wl18xx-target-scripts/wl18xx-target-scripts.bb                  | 5 ++---
 meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb             | 5 ++---
 .../recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bb            | 4 ++--
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb    | 4 ++--
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant.inc          | 3 ---
 .../ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb            | 3 ++-
 .../ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb        | 3 ++-
 .../recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb   | 3 ++-
 meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb       | 3 ++-
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb         | 3 ++-
 .../recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb          | 4 ++--
 meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb           | 4 ++--
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb      | 2 +-
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc             | 2 +-
 18 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
index ab52178..f17863e 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "Firmware files for Bluetooth"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=1c9961176d6529283e0d0c983be41b45 \
-"
+LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=1c9961176d6529283e0d0c983be41b45"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,7 +10,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 RCONFLICTS_${PN} = "linux-firmware-wl12xx"
 RREPLACES_${PN}  = "linux-firmware-wl12xx"
 
-PR = "r8+gitr${SRCPV}"
+PV = "R8.5+git${SRCPV}"
+PR = "r8"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|dra7xx"
 
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
index bb1d4e3..2498c70 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://../backports/COPYING;md5=d7810fab7487fb0aad327b76f1be
 
 RDEPENDS_${PN} = "wireless-tools"
 
-PV = "R8.5"
+PV = "R8.5+git${SRCPV}"
 inherit module
 
-PR = "${MACHINE_KERNEL_PR}+g+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}+g"
 
 # Tags: R8.5
 SRCREV_wl18xx = "ad69b45b9a670ee7f76be4def03895ac9b3a6d4a"
diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
index 1c821f9..411db44 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
 
 inherit allarch
 
-PV = "R8.5"
+PV = "R8.5+git${SRCPV}"
 
-PR = "r6+gitr${SRCPV}"
+PR = "r6"
 
 PROVIDES += "wl12xx-firmware"
 RPROVIDES_${PN} += "wl12xx-firmware"
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
index d67bf53..4eadeac 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
@@ -6,13 +6,13 @@ require hostap.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
 
-PR_append = "c+gitr${SRCPV}"
+PR_append = "c"
 
 FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
 
 # Add TI to the end to make it clear that this is a TI customized version
 # of hostap
-PV = "R8.5-devel-ti"
+PV = "R8.5-devel-ti+git${SRCPV}"
 
 # Tag: R8.5
 SRCREV = "2710d0ae31fa2dc31f653f346a985268d8d7795c"
diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb
index 89433e7..86862ee 100644
--- a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb
+++ b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
 
-PV = "R8.5"
+PV = "R8.5+git${SRCPV}"
 
-PR ="r6+gitr${SRCPV}"
+PR = "r6"
 
 # Tag: Almost R8.5
 SRCREV = "0e64b3096c3c05a53465cf4e09fa0a1c8cf54c60"
@@ -24,4 +24,3 @@ do_install() {
 		install -m 0755 $s ${D}${datadir}/wl18xx/
 	done
 }
-
diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
index 71f191f..586339f 100644
--- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
+++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
@@ -2,10 +2,9 @@ DESCRIPTION = "Configuration utility for TI wireless drivers"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
 
-PV = "R8.5"
+PV = "R8.5+git${SRCPV}"
 
-PR ="r3"
-PR_append = "+gitr${SRCPV}"
+PR = "r3"
 
 # Tag: R8.5
 SRCREV = "dcf0800f30ba449cd7f3a20f8b3f4853dc829652"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bb
index 3e7415f..07da836 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://../../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://../../README;md5=ac69bb94677a5725da586adce7406526 \
 "
 
-PV = "0.7.3+0.8.0-rc"
-PR = "r1+gitr${SRCPV}"
+PV = "0.7.3+0.8.0-rc+git${SRCPV}"
+PR = "r1"
 
 SRCREV = "653c4893be17d12ef7bc6e941b765c92c1e4a161"
 
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
index efdf0d0..81ea8fa 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
@@ -13,10 +13,10 @@ FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
 # Tag: R8.5
 SRCREV = "2710d0ae31fa2dc31f653f346a985268d8d7795c"
 BRANCH = "ap_p2p"
-PR_append = "c+gitr${SRCPV}"
+PR_append = "c"
 
 # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
-PV = "R8.5-devel-ti"
+PV = "R8.5-devel-ti+git${SRCPV}"
 
 PROVIDES += "wpa-supplicant"
 RPROVIDES_${PN}  += "wpa-supplicant"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index e4be180..f743ac1 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -84,6 +84,3 @@ pkg_postinst_wpa-supplicant () {
 		killall -q -HUP dbus-daemon || true
 	fi
 }
-
-
-
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb
index 59e7562..d531324 100644
--- a/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb
@@ -4,7 +4,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://interface/prussdrv.c;beginline=1;endline=47;md5=6012fea45c1fbced663277bc90d2163a"
 
 RRECOMMENDS_${PN} = "kernel-module-uio-pru"
-PR = "r0+svnr${SRCPV}"
+PR = "r0"
+PV_append = "+svn${SRCPV}"
 
 COMPATIBLE_MACHINE = "omapl138"
 
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb
index 613962e..6b6d585 100644
--- a/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb
@@ -11,8 +11,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 COMPATIBLE_MACHINE = "omapl138"
 
-MACHINE_KERNEL_PR_append = "a+svnr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
+PV_append = "+svn${SRCPV}"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
 
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb
index ee62d89..c661fe4 100644
--- a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb
@@ -4,7 +4,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=c4fd8ee7443c1b2b6238b4b5df796481"
 DEPENDS = "ti-pru-sw-app-loader ti-pru-sw-edma-library"
 RDEPENDS_${PN} = "ti-pru-sw-edma-driver"
-PR = "r0+svnr${SRCPV}"
+PR = "r0"
+PV_append = "+svn${SRCPV}"
 
 COMPATIBLE_MACHINE = "am180x-evm"
 
diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
index 7995250..c4bb15e 100644
--- a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
+++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "Utility for parsing system events"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://eventdump.c;beginline=1;endline=34;md5=23b59be24a88ddc407b553035f3fd3e9"
 
-PR = "r1+gitr${SRCPV}"
+PR = "r1"
+PV = "1.0+git${SRCPV}"
 
 SRCREV = "5db45a36a05a78ea44a4cb25312ed5ee3c2bd76d"
 
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index 8f4393e..2ecad32 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -4,7 +4,8 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PR = "r2+gitr${SRCPV}"
+PR = "r2"
+PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
 DEPENDS += "zip-native virtual/kernel alsa-lib"
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb
index b6aee3f..cd4efe7 100644
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
 DEPENDS = "libnl"
 RDEPENDS_${PN} = "wl18xx-firmware"
 
-PV = "R8.5"
+PV = "R8.5+git${SRCPV}"
 
-PR ="r3+gitr${SRCPV}"
+PR ="r3"
 
 #Tag: R8.5
 SRCREV = "dcf0800f30ba449cd7f3a20f8b3f4853dc829652"
diff --git a/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb b/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
index 1512e47..76539f4 100644
--- a/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
+++ b/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31
 
 inherit autotools pkgconfig
 
-PR = "r2+gitr${SRCPV}"
-PV = "2.0"
+PR = "r2"
+PV = "2.0+git${SRCPV}"
 
 DEPENDS = "libdrm ti-ipc"
 
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
index b00da58..7bb760a 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://../../ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7e
 
 include ipsecmgr.inc
 
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 EXTRA_OEMAKE += "KDIR="${STAGING_KERNEL_DIR}""
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
index 2aafa57..0844420 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
@@ -3,4 +3,4 @@ BRANCH="master"
 SRC_URI = "git://arago-project.org/git/projects/ipsecmgr.git;protocol=git;branch=${BRANCH}"
 #Commit ID corresponding to DEV.IPSECMGR.01.01.00.03
 SRCREV = "1ea8355ae9142311901c842c97a58d2846b308e6"
-PV     = "01.01.00.03"
+PV     = "01.01.00.03+git${SRCPV}"
-- 
2.2.0


