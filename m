Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 10F3C52974
	for <meta-arago@arago-project.org>;
	Fri, 10 Mar 2017 21:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8C89B20BAB;
	Fri, 10 Mar 2017 21:10:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VPbCdMuylN-A; Fri, 10 Mar 2017 21:10:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 663FA20B7A;
	Fri, 10 Mar 2017 21:10:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1B26A1623B6;
	Fri, 10 Mar 2017 16:10:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 10 Mar 2017 16:10:06 -0500
Message-Id: <1489180211-138519-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489180211-138519-1-git-send-email-denis@denix.org>
References: <1489180211-138519-1-git-send-email-denis@denix.org>
Subject: [PATCH 1/6] wl18xx-firmware: moved to meta-ti as wl18xx-fw, remove here
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
X-List-Received-Date: Fri, 10 Mar 2017 21:10:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/arago-source-ipk.inc       |  4 +--
 .../packagegroup-arago-tisdk-connectivity.bb       |  2 +-
 .../recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb | 35 ----------------------
 .../0001-Add-Makefile-for-SDK.patch                | 33 --------------------
 4 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 5d2796f..8435bc0 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -100,8 +100,8 @@ SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules = "board-support/extra-drivers/sgx-modul
 CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx = "1"
 SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx = "board-support/extra-drivers/${PN}-${PV}"
 
-CREATE_SRCIPK_pn-wl18xx-firmware = "1"
-SRCIPK_INSTALL_DIR_pn-wl18xx-firmware = "board-support/extra-drivers/${PN}-${PV}"
+CREATE_SRCIPK_pn-wl18xx-fw = "1"
+SRCIPK_INSTALL_DIR_pn-wl18xx-fw = "board-support/extra-drivers/${PN}-${PV}"
 
 CREATE_SRCIPK_pn-wl1271-wlan-cli = "1"
 SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli = "example-applications/wlan"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index f64998c..c0652fd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -28,7 +28,7 @@ WLAN_COMMON = "\
 #    netperf
 
 FIRMWARE_AND_DRIVERS = "\
-    wl18xx-firmware \
+    wl18xx-fw \
     bt-firmware \
 "
 
diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
deleted file mode 100644
index 6981702..0000000
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Firmware files for use with TI wl18xx"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
-
-inherit allarch
-
-PV = "R8.6+git${SRCPV}"
-
-PR = "r7"
-
-PROVIDES += "wl12xx-firmware"
-RPROVIDES_${PN} += "wl12xx-firmware"
-RREPLACES_${PN} += "wl12xx-firmware"
-RCONFLICTS_${PN} += "wl12xx-firmware"
-
-# Tag: R8.6
-SRCREV = "c4c0c7943040473bd9aeba2ab9fa99617fa08a4b"
-BRANCH = "ap_dfs"
-SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
-           file://0001-Add-Makefile-for-SDK.patch \
-          "
-
-S = "${WORKDIR}/git"
-
-CLEANBROKEN = "1"
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
diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch
deleted file mode 100644
index 6d44eb1..0000000
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f4968600db760ff46d400c258ed1729d14c70f16 Mon Sep 17 00:00:00 2001
-From: Franklin S. Cooper Jr <fcooper@ti.com>
-Date: Wed, 5 Feb 2014 21:03:08 -0600
-Subject: [PATCH] Add Makefile for SDK
-
-* Add Makefile to sources so it is packaged in the SDK.
-
-Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
----
- Makefile |   11 +++++++++++
- 1 files changed, 11 insertions(+), 0 deletions(-)
- create mode 100644 Makefile
-
-diff --git a/Makefile b/Makefile
-new file mode 100644
-index 0000000..1340c98
---- /dev/null
-+++ b/Makefile
-@@ -0,0 +1,11 @@
-+# Installs the the ti-connectiviy wlan firmware files into the root file system
-+
-+install:
-+	@if [ ! -d $(DESTDIR) ] ; then \
-+		echo "The extracted target filesystem directory doesn't exist."; \
-+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
-+		exit 1; \
-+	fi
-+	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
-+	cp *.bin $(DEST_DIR)/lib/firmware/ti-connectivity/
-+
--- 
-1.7.0.4
-
-- 
2.7.4


