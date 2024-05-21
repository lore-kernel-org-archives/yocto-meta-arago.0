Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBABFC41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 23:53:22 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3080.1716335601215809475
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 May 2024 16:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jsRfydut;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44LNrHqY043085;
	Tue, 21 May 2024 18:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716335597;
	bh=uApBXh5Hb8QFn7+1AFYNobNaiPJFYD31ZtaoGSPjVqk=;
	h=From:To:CC:Subject:Date;
	b=jsRfydutPqKcC+dibw6As6FWOsOXREvjGwkIr9CKSUFwzhyb9ZpQBoCt4vo7JL3/K
	 03GL/RI7Jsau6hzD9fJmw6RnGVGwVhVbCuZ+m/3ND2WMTb/JvI/aOoGdIhFptGQv9q
	 EVZ7+pXDdKP8PXpQBVwvW76HTr2s2At3FOZn1+KA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44LNrGS5012963
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 May 2024 18:53:16 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 May 2024 18:53:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 May 2024 18:53:16 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44LNrGn0124940;
	Tue, 21 May 2024 18:53:16 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] thermal-init: remove the thermal-init script
Date: Tue, 21 May 2024 18:53:04 -0500
Message-ID: <20240521235304.1467376-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 May 2024 23:53:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15339

From: Randolph Sapp <rs@ti.com>

Thermal zones defined in dt are enabled by default. This script just
adds a service that can be disabled to switch all thermal zones to
kernel unmanaged.

We should not attempt to do that ourselves, as we could potentially
interfere with other userspace tools like thermald.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../packagegroups/packagegroup-arago-base.bb  |  1 -
 .../recipes-core/thermal-init/thermal-init.bb | 19 ----------------
 .../thermal-init/thermal-init/init            | 22 -------------------
 3 files changed, 42 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
 delete mode 100644 meta-arago-distro/recipes-core/thermal-init/thermal-init/init

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 1971d45c..8b37aab9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -19,7 +19,6 @@ ARAGO_BASE = "\
     initscript-telnetd \
     systemd-telnetd \
     ethtool \
-    thermal-init \
     bash \
     opkg-bash-completion \
     udev-extraconf \
diff --git a/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb b/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
deleted file mode 100644
index 56f1ba1a..00000000
--- a/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Init script to enable cpu_thermal zones"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-PR = "r1"
-
-SRC_URI = "file://init"
-
-INITSCRIPT_NAME = "thermal-zone-init"
-INITSCRIPT_PARAMS = "defaults 98"
-
-inherit update-rc.d
-
-do_install() {
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
-}
-
-FILES:${PN} = "${sysconfdir} ${bindir}"
diff --git a/meta-arago-distro/recipes-core/thermal-init/thermal-init/init b/meta-arago-distro/recipes-core/thermal-init/thermal-init/init
deleted file mode 100644
index b7e8a36a..00000000
--- a/meta-arago-distro/recipes-core/thermal-init/thermal-init/init
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/sh
-
-if [ ! -d /sys/class/thermal ]; then
-    exit 0
-fi
-
-case "$1" in
-    start )
-        echo "Enabling thermal zones..."
-        for i in /sys/class/thermal/thermal_zone*/mode; do
-            echo enabled > $i
-        done
-    ;;
-    stop )
-        echo "Disabling thermal zones..."
-        for i in /sys/class/thermal/thermal_zone*/mode; do
-            echo disabled > $i
-        done
-    ;;
-esac
-
-exit 0
-- 
2.45.1


