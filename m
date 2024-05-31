Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FCBC27C4F
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 19:45:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.22776.1717184735717125619
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 May 2024 12:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vhWHMDl8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VJjYoc079481;
	Fri, 31 May 2024 14:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717184734;
	bh=S6k/k4legKwLJC6tcjnwvD+Lh/8XSCwJfCykYXygG5c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=vhWHMDl8DgPaBfTLt71d1U6jXj1kEcNbGIfr2GjTZgrH0fvcp3fLS+O0Z4tc+yu0v
	 FksUTVc7Y3jESSIjKyu87SCFSER3iQmYnt7DKRKSHgvpx4Uy7VbRvpVMbflso2HgSH
	 n47TkmVFcBTKbo8RzL/ZuVtVayMltafXWw7GRrh4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VJjY4F119257
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 14:45:34 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 14:45:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 14:45:34 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VJjYgP055172;
	Fri, 31 May 2024 14:45:34 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sD8By-0006Ej-AP; Fri, 31 May 2024 14:45:34 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v3 2/3] recipes: Switch away from S = WORKDIR
Date: Fri, 31 May 2024 14:45:32 -0500
Message-ID: <20240531194533.23925-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531194533.23925-1-reatmon@ti.com>
References: <20240531194533.23925-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 May 2024 19:45:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15346

Follow along with the corresponding patch in upstream. [1]

[1] https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=d9328e3b0b062f0621de3d114584b44f384a1c02

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/matrix/matrix-lighttpd-config.bb            | 5 +++--
 .../recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb     | 3 ++-
 .../recipes-connectivity/bt-enable/bt-enable.bb              | 3 ++-
 .../initscript-telnetd/initscript-telnetd.bb                 | 3 ++-
 .../recipes-connectivity/systemd-telnetd/systemd-telnetd.bb  | 5 +++--
 .../recipes-core/arago-gpl-notice/arago-gpl-notice.bb        | 5 +++--
 .../recipes-core/busybox/softap-udhcpd-config_1.0.bb         | 3 ++-
 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb | 3 ++-
 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb     | 3 ++-
 .../recipes-graphics/tslib/ts-calibrate-init_1.0.bb          | 5 +++--
 .../recipes-sysrepo/nw-configurator/nw-configurator.bb       | 5 +++--
 11 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
index c932e67f..d1c51012 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -12,11 +12,12 @@ SRC_URI = "file://lighttpd.conf.matrix"
 # Grabbed COPYING file from lighttpd_1.4.30
 SRC_URI += "file://COPYING"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
 	install -d ${D}${sysconfdir}/lighttpd
-	install -m 0644 ${WORKDIR}/lighttpd.conf.matrix ${D}${sysconfdir}/lighttpd/lighttpd.conf.matrix
+	install -m 0644 ${S}/lighttpd.conf.matrix ${D}${sysconfdir}/lighttpd/lighttpd.conf.matrix
 }
 
 FILES:${PN} = "${sysconfdir}/lighttpd/lighttpd.conf.matrix"
diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
index 0eaf9314..50cf218e 100644
--- a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
+++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
@@ -6,7 +6,8 @@ CLEANBROKEN = "1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 BOOSTRAP_IMAGE = "tisdk-bootstrap-base-image"
 
diff --git a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
index cb7fa93f..0e7b446d 100644
--- a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
+++ b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
@@ -9,7 +9,8 @@ SRC_URI = " \
 
 PR = "r1"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 INITSCRIPT_NAME = "bt-enable.sh"
 INITSCRIPT_PARAMS = "defaults 99"
diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
index e492119b..c71a3fdb 100644
--- a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
+++ b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
@@ -5,7 +5,8 @@ PR ="r1"
 
 SRC_URI = "file://telnetd"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 INITSCRIPT_NAME = "telnetd"
 INITSCRIPT_PARAMS = "defaults 10"
diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
index 3158da5a..4d84bed4 100644
--- a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
+++ b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://telnetd.service;beginline=1;endline=17;md5=d134d0d385
 
 SRC_URI = "file://telnetd.service"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit systemd
 
@@ -16,5 +17,5 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 do_install:append () {
     # install systemd unit files
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/telnetd.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${S}/telnetd.service ${D}${systemd_system_unitdir}
 }
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
index 6cb428a5..aeb45167 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://print-gplv3-packages.sh;beginline=2;endline=18;md5=d1
 
 PR = "r3"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 INITSCRIPT_NAME = "gplv3-notice"
 INITSCRIPT_PARAMS = "defaults 99"
@@ -24,7 +25,7 @@ do_install(){
 		install -d ${D}${bindir}
 		install -d ${D}${systemd_system_unitdir}
 		install -m 0755 ${S}/print-gplv3-packages.sh ${D}${bindir}/gplv3-notice
-		install -m 0644 ${WORKDIR}/gplv3-notice.service ${D}${systemd_system_unitdir}
+		install -m 0644 ${S}/gplv3-notice.service ${D}${systemd_system_unitdir}
 	fi
 }
 
diff --git a/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb b/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
index 0c896fed..a5a3e1d0 100644
--- a/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
+++ b/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
@@ -8,7 +8,8 @@ PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 # Default configuration file is from the base udhcp package
 SRC_URI = "file://udhcpd.conf \
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
index 59df0c97..157e7354 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
@@ -11,7 +11,8 @@ PV = "1.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install () {
     install -d ${D}/board-support/prebuilt-images
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
index 76c83e7d..7bd601a0 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
@@ -11,7 +11,8 @@ PV = "1.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install () {
     install -d ${D}/board-support/prebuilt-images
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
index db48d746..1694792c 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb79
 
 PR = "r4"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 INITSCRIPT_NAME = "ts-calibrate"
 
@@ -26,5 +27,5 @@ do_install(){
 	# Install the init script
 	# TODO: replace init script with systemd files
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ts-calibrate
+	install -m 0755 ${S}/init ${D}${sysconfdir}/init.d/ts-calibrate
 }
diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
index c5d9a86b..b383571d 100644
--- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
+++ b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://nw-configurator.c;beginline=1;endline=33;md5=3538caaf
 
 SRC_URI = "file://nw-configurator.c"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 FILES_${PN}-dev = "${includedir}"
 
@@ -14,7 +15,7 @@ DEPENDS = "sysrepo"
 inherit autotools pkgconfig
 
 do_compile() {
-	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR}	${WORKDIR}/nw-configurator.c -o nw-configurator -lsysrepo
+	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR}	${S}/nw-configurator.c -o nw-configurator -lsysrepo
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


