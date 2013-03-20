Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B2EA7529AF
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 02:05:54 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K25qT7010313
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 21:05:53 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25qd8022966
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 07:35:52 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 07:35:52 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25epK026167;
	Wed, 20 Mar 2013 07:35:51 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 21:05:28 -0500
Message-ID: <1363745138-10288-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363745138-10288-1-git-send-email-fcooper@ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 07/17] hostap-daemon: Split recipe
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
X-List-Received-Date: Wed, 20 Mar 2013 02:05:55 -0000
Content-Type: text/plain

* Split recipe to allow multiple hostap-daemon recipes to share a common .inc

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...d-change-conf-file-for-better-oob-startup.patch |    0
 .../hostap/hostap-daemon_git.bb                    |   61 --------------------
 .../hostap/hostap-daemon_r5.sp4.01.bb              |   11 ++++
 .../recipes-connectivity/hostap/hostap.inc         |   54 +++++++++++++++++
 4 files changed, 65 insertions(+), 61 deletions(-)
 rename meta-arago-extras/recipes-connectivity/hostap/{hostap-daemon => hostap-daemon-r5.sp4.01}/0001-hostapd-change-conf-file-for-better-oob-startup.patch (100%)
 delete mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.sp4.01.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap.inc

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.sp4.01/0001-hostapd-change-conf-file-for-better-oob-startup.patch
similarity index 100%
rename from meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch
rename to meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.sp4.01/0001-hostapd-change-conf-file-for-better-oob-startup.patch
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb
deleted file mode 100644
index 424d55d..0000000
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb
+++ /dev/null
@@ -1,61 +0,0 @@
-# This is a TI specific version of the hostap-daemon recipe for use with the
-# wl12xx wlan and bluetooth module.
-
-HOMEPAGE = "http://hostap.epitest.fi"
-DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
-SECTION = "kernel/userland"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
-
-DEPENDS = "libnl openssl"
-
-# Since this is a TI customized version of hostap-daemon do not make this the
-# default
-DEFAULT_PREFERENCE = "-1"
-
-inherit update-rc.d
-INITSCRIPT_NAME="hostapd"
-
-CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
-
-# Add TI to the end to make it clear that this is a TI customized version
-# of hostap
-PV = "2.0-devel-ti"
-
-PR = "r2+gitr${SRCPV}"
-
-SRCREV = "ol_R5.SP4.01"
-
-SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
-	file://0001-hostapd-change-conf-file-for-better-oob-startup.patch;patchdir=.. \
-	file://defconfig \
-	file://init"
-
-S = "${WORKDIR}/git/hostapd"
-
-do_configure() {
-	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
-	echo "CFLAGS += -I${STAGING_INCDIR}" >> .config
-	echo "LIBS += -L${STAGING_LIBDIR}" >> .config
-}
-
-do_compile() {
-	make
-}
-
-do_install() {
-	install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
-	install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
-	install -m 0755 ${S}/hostapd ${D}${sbindir}
-	install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
-	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
-}
-
-# The default hostapd.conf file that is fetched from upstream is using
-# "a" band which is not supported by the 1271 chip.
-# modify it to use "g" band and default channel 6 and change the ssid from
-# "test" to a more meaningful name.
-
-updatercd_postinst () {
-:
-}
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.sp4.01.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.sp4.01.bb
new file mode 100644
index 0000000..a84c333
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.sp4.01.bb
@@ -0,0 +1,11 @@
+# This is a TI specific version of the hostap-daemon recipe for use with the
+# wl12xx wlan and bluetooth module.
+
+require hostap.inc
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
+
+PR_append = "a+gitr${SRCPV}"
+
+SRCREV = "ol_R5.SP4.01"
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
new file mode 100644
index 0000000..17d18a8
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
@@ -0,0 +1,54 @@
+# This is a TI specific version of the hostap-daemon recipe for use with the
+# wl12xx wlan and bluetooth module.
+
+HOMEPAGE = "http://hostap.epitest.fi"
+DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
+SECTION = "kernel/userland"
+
+DEPENDS = "libnl openssl"
+
+# Since this is a TI customized version of hostap-daemon do not make this the
+# default
+DEFAULT_PREFERENCE = "-1"
+
+PR = "r3"
+
+inherit update-rc.d
+INITSCRIPT_NAME="hostapd"
+
+CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
+
+SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
+           file://0001-hostapd-change-conf-file-for-better-oob-startup.patch;patchdir=.. \
+           file://defconfig \
+	       file://init"
+
+S = "${WORKDIR}/git/hostapd"
+
+do_configure() {
+	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
+	echo "CFLAGS += -I${STAGING_INCDIR}" >> .config
+	echo "LIBS += -L${STAGING_LIBDIR}" >> .config
+}
+
+do_compile() {
+	make
+}
+
+do_install() {
+	install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
+	install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
+	install -m 0755 ${S}/hostapd ${D}${sbindir}
+	install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
+	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
+}
+
+# The default hostapd.conf file that is fetched from upstream is using
+# "a" band which is not supported by the 1271 chip.
+# modify it to use "g" band and default channel 6 and change the ssid from
+# "test" to a more meaningful name.
+
+updatercd_postinst () {
+:
+}
+
-- 
1.7.0.4


