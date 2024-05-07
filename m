Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C530CC10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 15:13:26 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.14321.1715094797839858371
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 07 May 2024 08:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pd9RJ3YK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 447FDGRl094728;
	Tue, 7 May 2024 10:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715094796;
	bh=a0CyDL6u2MNZD8Sh2AkntGBc6/pYCqxC8HGwDJa/K4k=;
	h=From:To:Subject:Date;
	b=pd9RJ3YKwX8pbdjQsD8W2g0cd1g03tYFbvMnjX2YeP1bAAAyrkXxTX+w6m75pHlRC
	 nwSeDwFmppXnpDEd+036umCFrj3L0PVunX7XH/AlRiMINa0b5St19zSRGIrvU6aigm
	 t3II6Ene5p7DJccubHgr4Ts0lzzB5WZpSXp6KYsU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 447FDGIP100580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 May 2024 10:13:16 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 May 2024 10:13:15 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 May 2024 10:13:15 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 447FDFvU020942;
	Tue, 7 May 2024 10:13:15 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s4MVH-0006Ww-O1; Tue, 07 May 2024 10:13:15 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] recipes: Remove S = WORKDIR
Date: Tue, 7 May 2024 10:13:15 -0500
Message-ID: <20240507151315.25062-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 07 May 2024 15:13:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15330

Since S = "${WORKDIR}" is the default setting for S it is not needed to
override S in this way.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb  | 2 --
 .../recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb        | 2 --
 meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb   | 2 --
 .../initscript-telnetd/initscript-telnetd.bb                    | 2 --
 .../recipes-connectivity/systemd-telnetd/systemd-telnetd.bb     | 2 --
 .../recipes-core/arago-gpl-notice/arago-gpl-notice.bb           | 2 --
 .../recipes-core/busybox/softap-udhcpd-config_1.0.bb            | 2 --
 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb    | 2 --
 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb        | 2 --
 .../recipes-graphics/tslib/ts-calibrate-init_1.0.bb             | 2 --
 .../recipes-sysrepo/nw-configurator/nw-configurator.bb          | 2 --
 11 files changed, 22 deletions(-)

diff --git a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
index f9ef7881..68e5b578 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -12,8 +12,6 @@ SRC_URI = "file://lighttpd.conf.matrix"
 # Grabbed COPYING file from lighttpd_1.4.30
 SRC_URI += "file://COPYING"
 
-S = "${WORKDIR}"
-
 do_install() {
 	install -d ${D}${sysconfdir}/lighttpd
 	install -m 0644 ${S}/lighttpd.conf.matrix ${D}${sysconfdir}/lighttpd/lighttpd.conf.matrix
diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
index 0eaf9314..091ccad1 100644
--- a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
+++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
@@ -6,8 +6,6 @@ CLEANBROKEN = "1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}"
-
 BOOSTRAP_IMAGE = "tisdk-bootstrap-base-image"
 
 TARGET = "bootstrap-rootfs-${MACHINE}.cpio"
diff --git a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
index cb7fa93f..3b910204 100644
--- a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
+++ b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
@@ -9,8 +9,6 @@ SRC_URI = " \
 
 PR = "r1"
 
-S = "${WORKDIR}"
-
 INITSCRIPT_NAME = "bt-enable.sh"
 INITSCRIPT_PARAMS = "defaults 99"
 
diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
index e492119b..15d158b7 100644
--- a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
+++ b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
@@ -5,8 +5,6 @@ PR ="r1"
 
 SRC_URI = "file://telnetd"
 
-S = "${WORKDIR}"
-
 INITSCRIPT_NAME = "telnetd"
 INITSCRIPT_PARAMS = "defaults 10"
 
diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
index 471e2c78..ac056dac 100644
--- a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
+++ b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://telnetd.service;beginline=1;endline=17;md5=d134d0d385
 
 SRC_URI = "file://telnetd.service"
 
-S = "${WORKDIR}"
-
 inherit systemd
 
 SYSTEMD_PACKAGES = "${PN}"
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
index 309e72df..a130f9cb 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM = "file://print-gplv3-packages.sh;beginline=2;endline=18;md5=d1
 
 PR = "r3"
 
-S = "${WORKDIR}"
-
 INITSCRIPT_NAME = "gplv3-notice"
 INITSCRIPT_PARAMS = "defaults 99"
 
diff --git a/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb b/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
index 0c896fed..a3365df6 100644
--- a/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
+++ b/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
@@ -8,8 +8,6 @@ PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}"
-
 # Default configuration file is from the base udhcp package
 SRC_URI = "file://udhcpd.conf \
            file://LICENSE"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
index 59df0c97..3aaa3d31 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
@@ -11,8 +11,6 @@ PV = "1.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}"
-
 do_install () {
     install -d ${D}/board-support/prebuilt-images
 
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
index 76c83e7d..3ae27171 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
@@ -11,8 +11,6 @@ PV = "1.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}"
-
 do_install () {
     install -d ${D}/board-support/prebuilt-images
 
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
index f67ba558..7ce58d87 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM = "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb79
 
 PR = "r4"
 
-S = "${WORKDIR}"
-
 INITSCRIPT_NAME = "ts-calibrate"
 
 # Start this init script early enough for other processes to be started later
diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
index 65dff2cc..dbe05681 100644
--- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
+++ b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://nw-configurator.c;beginline=1;endline=33;md5=3538caaf
 
 SRC_URI = "file://nw-configurator.c"
 
-S = "${WORKDIR}"
-
 FILES_${PN}-dev = "${includedir}"
 
 DEPENDS = "sysrepo"
-- 
2.17.1


