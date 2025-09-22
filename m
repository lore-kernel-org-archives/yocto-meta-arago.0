Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5761BCA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 18:47:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.60486.1758566812910069080
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 11:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=k6e10pUK;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MIkotx1294619;
	Mon, 22 Sep 2025 13:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758566810;
	bh=aTpZQyqfbWh13XdtDRO2ZdAcaYbP7NhtmTJRcVVKHFk=;
	h=From:To:CC:Subject:Date;
	b=k6e10pUK3ZaLz2/acGkdVyUlJrz1e78TIZxd+rclfFS+62fp351MWOcvGiPOcHVD4
	 sAez0Q5Pm+0PsZfl2pDaeX69hty6+d2okwvhUTE9+8/LolADoIttmnShiihuPVjtNW
	 0uXVOcZFS0zE339AeKlKkdmFHMZjfdjcKOoM+LhY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MIkonv1084945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 13:46:50 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 13:46:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 13:46:49 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MIknKN2987799;
	Mon, 22 Sep 2025 13:46:49 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] emptty: 0.13.0 -> 0.14.0
Date: Mon, 22 Sep 2025 13:45:57 -0500
Message-ID: <20250922184556.3586969-2-rs@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Sep 2025 18:47:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16610

From: Randolph Sapp <rs@ti.com>

Update the current version of emptty to include useful upstream fixes
for the retry count function and permission issues with XDG_RUNTIME_DIR.

Additionally, fix the sysvinit service to use the proper inittab entry
instead of a separate init process which won't have the proper
permissions to take control of the target virtual console.

This is functionally a sync with the latest proposal to oe-core/master.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Only applicable to scarthgap at the moment. Still working on the oe-core series
for master.

 .../recipes-graphics/emptty/emptty-conf.bb    | 14 ++++
 .../recipes-graphics/emptty/emptty.inc        | 26 ++++++
 .../recipes-graphics/emptty/emptty/emptty.tab |  1 +
 .../recipes-graphics/emptty/emptty/init       | 40 ----------
 .../recipes-graphics/emptty/emptty_0.13.0.bb  | 79 -------------------
 .../recipes-graphics/emptty/emptty_0.14.0.bb  | 53 +++++++++++++
 6 files changed, 94 insertions(+), 119 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
 create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty.inc
 create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty/emptty.tab
 delete mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty/init
 delete mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
 create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty_0.14.0.bb

diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
new file mode 100644
index 00000000..0aacb086
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
@@ -0,0 +1,14 @@
+require emptty.inc
+
+SUMMARY += " (Default config)"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install () {
+    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-config
+}
+
+FILES:${PN}-conf = "${sysconfdir}/emptty/conf"
+CONFFILES:${PN}-conf = "${sysconfdir}/emptty/conf"
+RPROVIDES:${PN}-conf += "virtual-emptty-conf"
diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty.inc b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
new file mode 100644
index 00000000..b452d403
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
@@ -0,0 +1,26 @@
+SUMMARY = "Dead simple CLI Display Manager on TTY"
+DESCRIPTION = "Emptty is a simple display manager with a command line greeter \
+It supports both X11 and Wayland sessions, exporting required variables and \
+creating user paths as necessary."
+
+HOMEPAGE = "https://github.com/tvrzna/emptty"
+BUGTRACKER = "https://github.com/tvrzna/emptty/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=d1e4d12c7d1d17367ba5668706a405ba"
+
+S = "${WORKDIR}"
+
+FILESEXTRAPATHS:append = ":${THISDIR}/emptty"
+
+GO_IMPORT = "github.com/tvrzna/emptty"
+GO_IMPORT_pam = "github.com/msteinert/pam"
+SRC_URI = "\
+    git://${GO_IMPORT}.git;protocol=https;branch=master;destsuffix=src/${GO_IMPORT} \
+    git://${GO_IMPORT_pam}.git;protocol=https;branch=master;name=pam;destsuffix=src/${GO_IMPORT_pam} \
+    file://pamconf \
+    file://emptty.tab \
+    "
+SRCREV = "d162bef75fadc8ae1d8e33dbb3de5e2795a196e0"
+SRCREV_pam = "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
+
+SRCREV_FORMAT .= "_pam"
diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty/emptty.tab b/meta-arago-distro/recipes-graphics/emptty/emptty/emptty.tab
new file mode 100644
index 00000000..6359c722
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty/emptty.tab
@@ -0,0 +1 @@
+7:5:respawn:/usr/bin/emptty -t 7 -d
diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty/init b/meta-arago-distro/recipes-graphics/emptty/emptty/init
deleted file mode 100644
index 114177c8..00000000
--- a/meta-arago-distro/recipes-graphics/emptty/emptty/init
+++ /dev/null
@@ -1,40 +0,0 @@
-#!/bin/sh
-#
-### BEGIN INIT INFO
-# Provides: emptty
-# Required-Start: $local_fs $remote_fs
-# Required-Stop: $local_fs $remote_fs
-# Default-Start:     5
-# Default-Stop:      0 1 2 3 6
-# X-Interactive: true
-### END INIT INFO
-
-PIDFILE=/var/run/emptty.pid
-
-# source function library
-. /etc/init.d/functions
-
-case "$1" in
-	start)
-		echo "Starting display manager: emptty"
-		start-stop-daemon -b -S -p $PIDFILE -x /usr/bin/emptty -- -d
-		;;
-	stop)
-		echo "Stopping display manager: emptty"
-		start-stop-daemon -K -p $PIDFILE -x /usr/bin/emptty
-		;;
-	restart)
-		start-stop-daemon -K -p $PIDFILE --oknodo -x /usr/bin/emptty -- -d
-		sleep 2
-		start-stop-daemon -b -S -p $PIDFILE -x /usr/bin/emptty
-		;;
-	reload|force-reload)
-		start-stop-daemon -K -p $PIDFILE -s 1 -x /usr/bin/emptty
-		;;
-	status)
-		status /usr/bin/emptty
-		;;
-	*)
-		echo "usage: $0 { start | stop | restart }"
-		;;
-esac
diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb b/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
deleted file mode 100644
index 412ad729..00000000
--- a/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
+++ /dev/null
@@ -1,79 +0,0 @@
-SUMMARY = "Dead simple CLI Display Manager on TTY"
-HOMEPAGE = "https://github.com/tvrzna/emptty"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=d1e4d12c7d1d17367ba5668706a405ba"
-
-GO_IMPORT = "github.com/tvrzna/emptty"
-GO_IMPORT_pam = "github.com/msteinert/pam"
-SRC_URI = "\
-    git://${GO_IMPORT}.git;protocol=https;branch=master \
-    git://${GO_IMPORT_pam}.git;protocol=https;branch=master;name=pam;destsuffix=${S}/src/${GO_IMPORT_pam} \
-    file://pamconf \
-    file://init \
-    "
-SRCREV = "4046552b6f5cc1cf76ce8bf333e04e16c59febca"
-SRCREV_pam = "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
-
-SRCREV_FORMAT .= "_pam"
-
-PACKAGES += "${PN}-conf"
-
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
-PACKAGECONFIG[pam] = ",,libpam,pam-plugin-succeed-if"
-PACKAGECONFIG[x11] = ",,virtual/libx11"
-
-DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'libxcrypt', d)}"
-
-GO_TAGS = ""
-GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
-GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
-
-GOBUILDFLAGS:append = " -tags=${GO_TAGS}"
-
-export GO111MODULE="off"
-
-inherit go update-rc.d systemd
-
-DEPENDS += "gzip-native"
-
-do_install () {
-    # general collateral
-    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
-    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-config
-    install -d ${D}${mandir}/man1
-    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/emptty.1.gz
-
-    # pam config
-    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
-    then
-        install -Dm644 ${WORKDIR}/pamconf ${D}${sysconfdir}/pam.d/emptty
-    fi
-
-    # init services
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
-    then
-        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-systemd
-    else
-        install -Dm755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/emptty
-    fi
-}
-
-FILES:${PN} = "\
-    ${systemd_system_unitdir}/emptty.service \
-    ${sysconfdir}/init.d/emptty \
-    ${bindir}/emptty \
-    ${mandir}/man1/emptty.1.gz \
-    ${sysconfdir}/pam.d/emptty \
-"
-
-FILES:${PN}-conf += "${sysconfdir}/emptty/conf"
-CONFFILES:${PN}-conf += "${sysconfdir}/emptty/conf"
-RPROVIDES:${PN}-conf += "virtual-emptty-conf"
-
-RDEPENDS:${PN} += "virtual-emptty-conf"
-
-SYSTEMD_SERVICE:${PN} = "emptty.service"
-
-INITSCRIPT_NAME = "emptty"
-INITSCRIPT_PARAMS = "start 10 5 2 . stop 20 0 1 6 ."
-INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty_0.14.0.bb b/meta-arago-distro/recipes-graphics/emptty/emptty_0.14.0.bb
new file mode 100644
index 00000000..11d306a5
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty_0.14.0.bb
@@ -0,0 +1,53 @@
+require emptty.inc
+
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
+PACKAGECONFIG[pam] = ",,libpam,pam-plugin-succeed-if"
+PACKAGECONFIG[x11] = ",,virtual/libx11"
+
+DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'virtual/crypt', d)}"
+
+GO_TAGS = ""
+GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
+GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
+
+GOBUILDFLAGS:append = " -tags=${GO_TAGS}"
+
+export GO111MODULE = "off"
+
+inherit go
+
+DEPENDS += "gzip"
+
+do_install () {
+    # general collateral
+    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
+    install -d ${D}${mandir}/man1
+    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/emptty.1.gz
+
+    # pam config
+    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
+    then
+        install -Dm644 ${S}/pamconf ${D}${sysconfdir}/pam.d/emptty
+    fi
+
+    # init services
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
+    then
+        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-systemd
+    else
+        install -Dm644 ${S}/emptty.tab ${D}${sysconfdir}/inittab.d/emptty.tab
+    fi
+}
+
+FILES:${PN} = "\
+    ${systemd_system_unitdir}/emptty.service \
+    ${sysconfdir}/inittab.d/emptty.tab \
+    ${bindir}/emptty \
+    ${mandir}/man1/emptty.1.gz \
+    ${sysconfdir}/pam.d/emptty \
+"
+
+RDEPENDS:${PN} += "virtual-emptty-conf"
+SYSTEMD_SERVICE:${PN} = "emptty.service"
+
+inherit systemd
-- 
2.51.0


