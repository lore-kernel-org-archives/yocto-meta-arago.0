Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by arago-project.org (Postfix) with ESMTPS id 6AE4852ADE
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:12 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id wp18so1047429obc.15
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=aU6fWM8hXe+nu9K69M/U4B+q7iNFOTBhG0e2vwzYHAk=;
	b=f0qswrNd4rZVoem4KH/kYFlDszvHm1OJsO20wg8rSiiZq5atha6Cunq0fO+2NLapUm
	ls6gURFUsfK4jJS835iwx6mvhWn/E7jyfZYkU6LkOA7tsP6TqsY+vi06bzHpYxiReXVq
	zfS+LnVqU6hc7VzdTs1v2a/pTU5a5y1hP3LBIxeKyTrzYTrX9yEY40ZH4Wayq9hS8ALR
	qa49bPv+of8Um1M+DjSOFnCn7/vZhbTLt6GLta0yyXTOBSZ9iYNNdx6IfRPiJacZ3AIF
	oI1H1pYXB3WPeCptBQNajokpkaoyss6T6YC9QxvvHuqBU9HkfslSQaEaY2V3FEXOmhwD
	UUNQ==
X-Received: by 10.182.152.65 with SMTP id uw1mr2462756obb.102.1359151091880;
	Fri, 25 Jan 2013 13:58:11 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.10
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:10 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:48 -0600
Message-Id: <1359150851-23602-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 08/31] ti-wifi-utils: update based on wlan r5_sp3 release
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:12 -0000

From: Eyal Reizer <eyalr@ti.com>

* Update to use the new version released with wlan r5_sp3 release
* Perform wlan calibration on every boot.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../ti-wifi-utils/ti-wifi-utils/calibrate.sh       |    7 ++++
 .../ti-wifi-utils/ti-wifi-utils_git.bb             |   32 ++++++++++++-------
 2 files changed, 27 insertions(+), 12 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils/calibrate.sh

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils/calibrate.sh b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils/calibrate.sh
new file mode 100644
index 0000000..b028435
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils/calibrate.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+echo "Performing wifi calibration..."
+rm /lib/firmware/ti-connectivity/wl1271-nvs.bin
+rmmod wl12xx_sdio.ko
+calibrator plt autocalibrate wlan0 /lib/modules/$(uname -r)/updates/drivers/net/wireless/wl12xx/wl12xx_sdio.ko /usr/share/ti/wifi-utils/ini_files/127x/TQS_S_2.6.ini /lib/firmware/ti-connectivity/wl1271-nvs.bin 00:00:00:00:00:00
+modprobe wl12xx_sdio
+
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb
index 77af0b9..9bcfa81 100644
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb
@@ -3,12 +3,18 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
 
 DEPENDS = "libnl"
+RDEPENDS = "ti-compat-wireless-wl12xx wl12xx-firmware"
 
-PR ="r0+gitr${SRCPV}"
+inherit update-rc.d
+INITSCRIPT_NAME="calibrate.sh"
+
+PR ="r1+gitr${SRCPV}"
 PV ="0.0"
 
-SRCREV = "ol_R5.00.18"
-SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git"
+SRCREV = "ol_R5.SP3.05"
+SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git \
+           file://calibrate.sh \
+"
 
 S = "${WORKDIR}/git"
 
@@ -16,16 +22,18 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
 CFLAGS += " -DCONFIG_LIBNL20"
 
 do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${datadir}/ti/wifi-utils/ini_files/127x
-	install -d ${D}${datadir}/ti/wifi-utils/ini_files/128x
-
-	install -m 0755 calibrator ${D}${bindir}/
-	install -m 0755 ${S}/hw/ini_files/127x/* ${D}${datadir}/ti/wifi-utils/ini_files/127x
-	install -m 0755 ${S}/hw/ini_files/128x/* ${D}${datadir}/ti/wifi-utils/ini_files/128x
+    install -d ${D}${bindir}
+    install -d ${D}${datadir}/ti/wifi-utils/ini_files/127x
+    install -d ${D}${datadir}/ti/wifi-utils/ini_files/128x
+    install -d ${D}${sysconfdir}/init.d
+
+    install -m 0755 calibrator ${D}${bindir}/
+    install -m 0755 ${S}/hw/ini_files/127x/* ${D}${datadir}/ti/wifi-utils/ini_files/127x
+    install -m 0755 ${S}/hw/ini_files/128x/* ${D}${datadir}/ti/wifi-utils/ini_files/128x
+    install -m 0755 ${WORKDIR}/calibrate.sh ${D}${sysconfdir}/init.d
 }
 
 FILES_${PN} += " \
-	${datadir}/ti/wifi-utils/ini_files/127x \
-	${datadir}/ti/wifi-utils/ini_files/128x \
+    ${datadir}/ti/wifi-utils/ini_files/127x \
+    ${datadir}/ti/wifi-utils/ini_files/128x \
 "
-- 
1.7.0.4


