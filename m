Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 09E615296D
	for <meta-arago@arago-project.org>;
	Fri, 10 Mar 2017 21:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 98C4C20B7A;
	Fri, 10 Mar 2017 21:10:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Oa76203rOxjV; Fri, 10 Mar 2017 21:10:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 761A620BBC;
	Fri, 10 Mar 2017 21:10:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 26E5B1623B8;
	Fri, 10 Mar 2017 16:10:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 10 Mar 2017 16:10:07 -0500
Message-Id: <1489180211-138519-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489180211-138519-1-git-send-email-denis@denix.org>
References: <1489180211-138519-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/6] bt-firmware: moved to meta-ti as bt-fw, remove here
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
X-List-Received-Date: Fri, 10 Mar 2017 21:10:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       |  2 +-
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     | 35 ----------------------
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index c0652fd..7e95940 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -29,7 +29,7 @@ WLAN_COMMON = "\
 
 FIRMWARE_AND_DRIVERS = "\
     wl18xx-fw \
-    bt-firmware \
+    bt-fw \
 "
 
 DEMO_APPS = "\
diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
deleted file mode 100644
index f82c2a0..0000000
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Firmware files for Bluetooth"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f39eac9f4573be5b012e8313831e72a9"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-# This recipe provides the latest firmware files for wl12xx.
-# Therefore, use the contents of this recipe instead of the contents
-# of linux-firmware-wl12xx.
-RCONFLICTS_${PN} = "linux-firmware-wl12xx"
-RREPLACES_${PN}  = "linux-firmware-wl12xx"
-
-PV = "R8.5+git${SRCPV}"
-PR = "r10"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|dra7xx"
-
-CLEANBROKEN = "1"
-
-SRCREV = "0c0eae241ea8a6e0b33d59f504741c8d5a2587ce"
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/ti-bt/service-packs.git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -d ${D}${base_libdir}/firmware/ti-connectivity
-    oe_runmake 'DEST_DIR=${D}' 'BASE_LIB_DIR=${base_libdir}' install
-}
-
-FILES_${PN} += "${base_libdir}/firmware/ti-connectivity/*"
-- 
2.7.4


