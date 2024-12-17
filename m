Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71B6E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 21:03:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.91668.1734469372334016619
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 13:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pNB7hx/G;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BHL2pRr041873;
	Tue, 17 Dec 2024 15:02:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734469371;
	bh=hw+2gtrgfh9ZgM8Xo+iwJ285sSvPGkJYyafJu3k29Dg=;
	h=From:To:CC:Subject:Date;
	b=pNB7hx/GCnSpIzoCRfwizaEeyfGlYHLMAj81XOpiFtBajhf6wSWwKYu2QRIC373Wc
	 l470Sp+3R2uMATtMpqnJVZsCcKvKn6wbJYV/an9THY4HTpobjPEac/qnHDT3X2LlKC
	 vX5/t/fjLUAoQg/4JRlzMWMLyIVoYi0NcesVPcyc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHL2pkN008539
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 15:02:51 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 15:02:50 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 15:02:50 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHL2oZP113310;
	Tue, 17 Dec 2024 15:02:50 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] meta-arago-demos: qt5.bbclass: Remove this transitional class
Date: Tue, 17 Dec 2024 15:02:49 -0600
Message-ID: <20241217210249.47165-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Dec 2024 21:03:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15668

This was used for selecting between QT4 and QT5, this is no longer
needed as everything is QT5. As we start to prepare for QT6 let's
clean out some of these old QT4 migration items.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-demos/classes/qt5.bbclass          | 20 -------------------
 .../recipes-apps/evse-hmi/evse-hmi_git.bb     |  7 ++++++-
 .../mmwavegesture-hmi_git.bb                  |  5 ++++-
 .../pdm-anomaly-detection_git.bb              |  5 ++++-
 .../protection-relays-hmi_git.bb              |  7 ++++++-
 .../examples/qtwebbrowser_5.15.1.bb           |  5 ++++-
 .../conf/distro/include/arago-prefs.inc       |  3 ---
 7 files changed, 24 insertions(+), 28 deletions(-)
 delete mode 100644 meta-arago-demos/classes/qt5.bbclass

diff --git a/meta-arago-demos/classes/qt5.bbclass b/meta-arago-demos/classes/qt5.bbclass
deleted file mode 100644
index a790ac7f..00000000
--- a/meta-arago-demos/classes/qt5.bbclass
+++ /dev/null
@@ -1,20 +0,0 @@
-# Class to mimic the old qt4e to prep recipe for use with Qt5 libraries
-
-QT5EDEPENDS ?= "qtbase "
-DEPENDS:prepend = "${QT5EDEPENDS}"
-
-inherit qmake5
-
-# we don't want conflicts with qt4
-OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
-OE_QMAKE_PATH_ARCHDATA = "${OE_QMAKE_PATH_QT_ARCHDATA}"
-OE_QMAKE_PATH_DATA = "${OE_QMAKE_PATH_QT_DATA}"
-OE_QMAKE_PATH_BINS = "${OE_QMAKE_PATH_QT_BINS}"
-OE_QMAKE_PATH_TRANSLATIONS = "${OE_QMAKE_PATH_QT_TRANSLATIONS}"
-OE_QMAKE_PATH_DOCS = "${OE_QMAKE_PATH_QT_DOCS}"
-OE_QMAKE_PATH_SETTINGS = "${OE_QMAKE_PATH_QT_SETTINGS}"
-OE_QMAKE_PATH_EXAMPLES = "${OE_QMAKE_PATH_QT_EXAMPLES}"
-OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
-
-# Qt uses atomic instructions not supported in thumb mode
-ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-arago-demos/recipes-apps/evse-hmi/evse-hmi_git.bb b/meta-arago-demos/recipes-apps/evse-hmi/evse-hmi_git.bb
index 9adc7363..3550a3e7 100644
--- a/meta-arago-demos/recipes-apps/evse-hmi/evse-hmi_git.bb
+++ b/meta-arago-demos/recipes-apps/evse-hmi/evse-hmi_git.bb
@@ -2,7 +2,12 @@ SUMMARY = "HMI demo for electronic vehicle charging station (EVSE) using QT QWid
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
 
-inherit qt5
+DEPENDS += "qtbase"
+
+inherit qmake5
+
+# Qt uses atomic instructions not supported in thumb mode
+ARM_INSTRUCTION_SET = "arm"
 
 PV = "1.0"
 PR = "r1"
diff --git a/meta-arago-demos/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb b/meta-arago-demos/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
index 127cc2a7..ec7d5c3f 100644
--- a/meta-arago-demos/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
+++ b/meta-arago-demos/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
@@ -2,7 +2,10 @@ SUMMARY = "Gesture baed HMI demo using mmWave IWR1642 chip and Sitara AM device"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=e7e749ff1989b18db836e5d9910a37e9"
 
-inherit qt5
+inherit qmake5
+
+# Qt uses atomic instructions not supported in thumb mode
+ARM_INSTRUCTION_SET = "arm"
 
 PV = "1.0"
 PR = "r0"
diff --git a/meta-arago-demos/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb b/meta-arago-demos/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
index 7a419974..1ed29577 100644
--- a/meta-arago-demos/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
+++ b/meta-arago-demos/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
@@ -2,7 +2,10 @@ SUMMARY = "Predictive maintenance demo for anomaly detection using Recurrent Neu
 LICENSE = "BSD-3-Clause & MIT & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e88016d2cbc82d0d2efbb0865891e9d6"
 
-inherit qt5
+inherit qmake5
+
+# Qt uses atomic instructions not supported in thumb mode
+ARM_INSTRUCTION_SET = "arm"
 
 PV = "1.0"
 PR = "r2"
diff --git a/meta-arago-demos/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb b/meta-arago-demos/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
index 95977162..62770aaa 100644
--- a/meta-arago-demos/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
+++ b/meta-arago-demos/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
@@ -2,7 +2,12 @@ SUMMARY = "HMI demo for Protection Relays using QT  tools"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
 
-inherit qt5
+DEPENDS += "qtbase"
+
+inherit qmake5
+
+# Qt uses atomic instructions not supported in thumb mode
+ARM_INSTRUCTION_SET = "arm"
 
 PV = "1.0"
 PR = "r0"
diff --git a/meta-arago-demos/recipes-qt/examples/qtwebbrowser_5.15.1.bb b/meta-arago-demos/recipes-qt/examples/qtwebbrowser_5.15.1.bb
index 1f52d452..9c84870b 100644
--- a/meta-arago-demos/recipes-qt/examples/qtwebbrowser_5.15.1.bb
+++ b/meta-arago-demos/recipes-qt/examples/qtwebbrowser_5.15.1.bb
@@ -18,7 +18,10 @@ SRCREV = "a09ec269e8b296d39d78b45ae251edb3d7bada41"
 
 S = "${WORKDIR}/git"
 
-inherit qt5
+inherit qmake5
+
+# Qt uses atomic instructions not supported in thumb mode
+ARM_INSTRUCTION_SET = "arm"
 
 do_install() {
     install -d ${D}${bindir}
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index a518a857..e5d59f57 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,6 +1,3 @@
-# Set preferred Qt5 versions. Different namespace from Qt4, so no conflict
-include conf/distro/include/qt5-versions.inc
-
 # Use the latest version of ltp-ddt for kernel versions 3.8+
 PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
 
-- 
2.39.2


