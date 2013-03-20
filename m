Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 53C2E52A24
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 02:06:00 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K25wwG010321
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 21:05:58 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25v6O022988
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 07:35:57 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 07:35:57 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25epO026167;
	Wed, 20 Mar 2013 07:35:56 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 21:05:32 -0500
Message-ID: <1363745138-10288-11-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363745138-10288-1-git-send-email-fcooper@ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 11/17] ti-wifi-utils: Split recipe
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
X-List-Received-Date: Wed, 20 Mar 2013 02:06:00 -0000
Content-Type: text/plain

* Split recipe to create a generic .inc file to allow support for multiple
  versions of ti-wifi-utils.
* Rename recipe to use the specific version of ti-wifi-utils.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-wifi-utils/ti-wifi-utils.inc                |   29 ++++++++++++++
 .../ti-wifi-utils/ti-wifi-utils/calibrate.sh       |    7 ---
 .../ti-wifi-utils/ti-wifi-utils_git.bb             |   40 --------------------
 .../ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb       |    8 ++++
 4 files changed, 37 insertions(+), 47 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils/calibrate.sh
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb
 create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc
new file mode 100644
index 0000000..4e3f628
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc
@@ -0,0 +1,29 @@
+DESCRIPTION = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
+
+DEPENDS = "libnl"
+RDEPENDS_${PN} = "ti-compat-wireless-wl12xx wl12xx-firmware"
+
+PR ="r1"
+
+SRCREV = "ol_R5.00.18"
+SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+export CROSS_COMPILE = "${TARGET_PREFIX}"
+CFLAGS += " -DCONFIG_LIBNL20"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -d ${D}${datadir}/ti/wifi-utils/ini_files/127x
+	install -d ${D}${datadir}/ti/wifi-utils/ini_files/128x
+
+	install -m 0755 calibrator ${D}${bindir}/
+	install -m 0755 ${S}/hw/ini_files/127x/* ${D}${datadir}/ti/wifi-utils/ini_files/127x
+	install -m 0755 ${S}/hw/ini_files/128x/* ${D}${datadir}/ti/wifi-utils/ini_files/128x
+}
+
+FILES_${PN} += " \
+	${datadir}/ti/wifi-utils/ini_files/127x \
+	${datadir}/ti/wifi-utils/ini_files/128x \
+"
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils/calibrate.sh b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils/calibrate.sh
deleted file mode 100644
index b028435..0000000
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils/calibrate.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-echo "Performing wifi calibration..."
-rm /lib/firmware/ti-connectivity/wl1271-nvs.bin
-rmmod wl12xx_sdio.ko
-calibrator plt autocalibrate wlan0 /lib/modules/$(uname -r)/updates/drivers/net/wireless/wl12xx/wl12xx_sdio.ko /usr/share/ti/wifi-utils/ini_files/127x/TQS_S_2.6.ini /lib/firmware/ti-connectivity/wl1271-nvs.bin 00:00:00:00:00:00
-modprobe wl12xx_sdio
-
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb
deleted file mode 100644
index 142a720..0000000
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
-
-DEPENDS = "libnl"
-RDEPENDS = "ti-compat-wireless-wl12xx wl12xx-firmware"
-
-inherit update-rc.d
-INITSCRIPT_NAME="calibrate.sh"
-INITSCRIPT_PARAMS = "start 20 2 3 4 5 ."
-
-PR ="r2+gitr${SRCPV}"
-PV ="0.0"
-
-SRCREV = "ol_R5.SP3.05"
-SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git \
-           file://calibrate.sh \
-"
-
-S = "${WORKDIR}/git"
-
-export CROSS_COMPILE = "${TARGET_PREFIX}"
-CFLAGS += " -DCONFIG_LIBNL20"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -d ${D}${datadir}/ti/wifi-utils/ini_files/127x
-    install -d ${D}${datadir}/ti/wifi-utils/ini_files/128x
-    install -d ${D}${sysconfdir}/init.d
-
-    install -m 0755 calibrator ${D}${bindir}/
-    install -m 0755 ${S}/hw/ini_files/127x/* ${D}${datadir}/ti/wifi-utils/ini_files/127x
-    install -m 0755 ${S}/hw/ini_files/128x/* ${D}${datadir}/ti/wifi-utils/ini_files/128x
-    install -m 0755 ${WORKDIR}/calibrate.sh ${D}${sysconfdir}/init.d
-}
-
-FILES_${PN} += " \
-    ${datadir}/ti/wifi-utils/ini_files/127x \
-    ${datadir}/ti/wifi-utils/ini_files/128x \
-"
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb
new file mode 100644
index 0000000..e9f5a3c
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb
@@ -0,0 +1,8 @@
+require ti-wifi-utils.inc
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
+
+PR_append ="a+gitr${SRCPV}"
+
+SRCREV = "ol_R5.SP3.05"
-- 
1.7.0.4


