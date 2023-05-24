Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F33C7EE2D
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 18:11:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1294.1684951889169035623
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 May 2023 11:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ozhkzRk3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOIu032085;
	Wed, 24 May 2023 13:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684951884;
	bh=UTSaShfp35SQJi4vbOCDX5SIRpaMV7thKInHbgq6xy0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ozhkzRk3PWp7KbTTGEpfxH/Q2k5h0RfpwEIosTgn8diwOdzjgreiGftL0sN0NMU+F
	 lX4eXsgWC++lwdt4Z6wU99mcdQuTcLgtJPo6CI+U9NFKUIu6YS/jlyEB6+1+jUiEwF
	 JS051CUoT7VDOKr4oAwCTQqF1+cc6O8MMZa2nKfM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34OIBO9R008290
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 13:11:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 13:11:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 13:11:24 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOq6005029;
	Wed, 24 May 2023 13:11:24 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [arago][kirkstone][PATCH 7/7] weston-init: add a simple touchscreen calibration check
Date: Wed, 24 May 2023 13:11:22 -0500
Message-ID: <20230524181122.35202-8-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524181122.35202-1-rs@ti.com>
References: <20230524181122.35202-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 May 2023 18:11:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14463

From: Randolph Sapp <rs@ti.com>

The old touchscreen calibration script created a generic UDEV rule for
all touch devices that applied the LIBINPUT_CALIBRATION_MATRIX of the
last calibrated display. This attempts to replace that to an extent.

This script executes at the start of Weston and if it detects a touch
input device, uses Weston's built in touchscreen calibrator and
touchscreen calibrator interface to apply the current calibration
without restarting Weston. This script does not attempt to make these
calibration values persistent.

If a user wants calibration values to persist for all Weston users they
should add the calibration to /etc/default/weston using the
LIBINPUT_CALIBRATION_MATRIX variable themselves. The script will bypass
calibration if it detects this variable is already set.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/wayland/weston-init.bbappend   | 13 ++++++++++---
 .../wayland/weston-init/weston-launch-calibrator.sh | 13 +++++++++++++
 .../recipes-graphics/wayland/weston-init/weston.ini |  4 ++++
 3 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/weston-launch-calibrator.sh

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index a73b669d..4d5db58c 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -2,6 +2,13 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 PR:append = ".arago12"
 
-#SRC_URI:append = " \
-#    file://weston.ini \
-#"
+SRC_URI:append = " \
+    file://weston.ini \
+    file://weston-launch-calibrator.sh \
+"
+
+do_install:append() {
+    install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
+}
+
+FILES:${PN}:append = "${bindir}/weston-launch-calibrator"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-launch-calibrator.sh b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-launch-calibrator.sh
new file mode 100644
index 00000000..45863ecd
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-launch-calibrator.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+if [ -e /dev/input/touchscreen0 ]; then
+	echo "Touch screen detected..."
+	if [ -n "$LIBINPUT_CALIBRATION_MATRIX" ]; then
+		echo "Calibration matrix already present, skipping calibration..."
+	else
+		echo "Calibrating touchscreen..."
+		exec weston-calibrator
+	fi
+else
+	echo "Touch screen not detected, skipping calibration..."
+fi
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
index 4cc2683a..b9610fa8 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
@@ -11,6 +11,10 @@ startup-animation=fade
 [libinput]
 touchscreen_calibrator=true
 
+[autolaunch]
+# launch the calibrator on startup if a touchscreen is detected
+path=/usr/bin/weston-launch-calibrator
+
 [screensaver]
 # Uncomment path to disable screensaver
 #path=@libexecdir@/weston-screensaver
-- 
2.40.1


