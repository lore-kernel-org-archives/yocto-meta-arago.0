Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C616A52960
	for <meta-arago@arago-project.org>;
	Fri, 10 Mar 2017 21:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EAA0F20BBC;
	Fri, 10 Mar 2017 21:10:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AnJe7_uqt6MI; Fri, 10 Mar 2017 21:10:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D187420B7A;
	Fri, 10 Mar 2017 21:10:13 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 55DFD1623BC;
	Fri, 10 Mar 2017 16:10:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 10 Mar 2017 16:10:11 -0500
Message-Id: <1489180211-138519-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489180211-138519-1-git-send-email-denis@denix.org>
References: <1489180211-138519-1-git-send-email-denis@denix.org>
Subject: [PATCH 6/6] wilink-calibrate: remove outdated wl12xx package
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
X-List-Received-Date: Fri, 10 Mar 2017 21:10:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-wifi-utils/wilink-calibrate/calibrate.sh         |  7 -------
 .../ti-wifi-utils/wilink-calibrate_1.0.bb               | 17 -----------------
 2 files changed, 24 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate/calibrate.sh
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate_1.0.bb

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate/calibrate.sh b/meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate/calibrate.sh
deleted file mode 100644
index b028435..0000000
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate/calibrate.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-echo "Performing wifi calibration..."
-rm /lib/firmware/ti-connectivity/wl1271-nvs.bin
-rmmod wl12xx_sdio.ko
-calibrator plt autocalibrate wlan0 /lib/modules/$(uname -r)/updates/drivers/net/wireless/wl12xx/wl12xx_sdio.ko /usr/share/ti/wifi-utils/ini_files/127x/TQS_S_2.6.ini /lib/firmware/ti-connectivity/wl1271-nvs.bin 00:00:00:00:00:00
-modprobe wl12xx_sdio
-
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate_1.0.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate_1.0.bb
deleted file mode 100644
index d0aadfb..0000000
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate_1.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-
-inherit update-rc.d
-INITSCRIPT_NAME="calibrate.sh"
-INITSCRIPT_PARAMS = "start 20 2 3 4 5 ."
-
-PR ="r0"
-
-SRC_URI = "file://calibrate.sh"
-
-S = "${WORKDIR}"
-
-do_install() {
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/calibrate.sh ${D}${sysconfdir}/init.d
-}
-- 
2.7.4


