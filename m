Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC84C25B4F
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 16:01:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.674.1715184070095703576
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 May 2024 09:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NDmlgCzB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 448G18Rh078486;
	Wed, 8 May 2024 11:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715184068;
	bh=boznNGbvZMvHrknD/djIk8gLt1Ll9Yc0a/PATJhRoVQ=;
	h=From:To:Subject:Date;
	b=NDmlgCzBXJLQtajBxNuE3zb5v+9sLEO28RH14zq6K5h3s07Osiq5uwYK8T8TWdamn
	 FWJ2VnCZ+ogglsu2TIBYfQ8QGpmeiwUUReaUkfktuz6rHB8U0s5q8aRd8Jw4ljYIKy
	 gVjOER0rJaoSBcUbQxL5acH1dm7y6uu1VNPpP8Dk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 448G18Ri096420
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 May 2024 11:01:08 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 May 2024 11:01:08 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 May 2024 11:01:08 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 448G18v7059055;
	Wed, 8 May 2024 11:01:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s4jj9-0004TZ-P9; Wed, 08 May 2024 11:01:07 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 1/2] recipes: Remove S = WORKDIR
Date: Wed, 8 May 2024 11:01:06 -0500
Message-ID: <20240508160107.17164-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 May 2024 16:01:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15331

Since S = "${WORKDIR}" is the default setting for S it is not needed to
override S in this way.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: After reviewing what all was being changed, I decided to make
smaller changes for this patch series while the whole UNPACKDIR
change is worked out upstream.

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
index c932e67f..314f1510 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -12,8 +12,6 @@ SRC_URI = "file://lighttpd.conf.matrix"
 # Grabbed COPYING file from lighttpd_1.4.30
 SRC_URI += "file://COPYING"
 
-S = "${WORKDIR}"
-
 do_install() {
 	install -d ${D}${sysconfdir}/lighttpd
 	install -m 0644 ${WORKDIR}/lighttpd.conf.matrix ${D}${sysconfdir}/lighttpd/lighttpd.conf.matrix
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
index 3158da5a..b6575118 100644
--- a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
+++ b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://telnetd.service;beginline=1;endline=17;md5=d134d0d385
 
 SRC_URI = "file://telnetd.service"
 
-S = "${WORKDIR}"
-
 inherit systemd
 
 SYSTEMD_PACKAGES = "${PN}"
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
index 6cb428a5..885123b4 100644
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
index db48d746..fe30919f 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM = "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb79
 
 PR = "r4"
 
-S = "${WORKDIR}"
-
 INITSCRIPT_NAME = "ts-calibrate"
 
 # Start this init script early enough for other processes to be started later
diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
index c5d9a86b..13f07750 100644
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


