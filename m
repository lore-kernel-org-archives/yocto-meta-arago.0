Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4B00452AB8
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 14:55:20 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31EtIaU032733
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 09:55:19 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EtHRt011787
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 20:25:17 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 1 Apr 2013 20:25:17 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EsxCk020052;
	Mon, 1 Apr 2013 20:25:16 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Apr 2013 09:54:49 -0500
Message-ID: <1364828095-28755-11-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364828095-28755-1-git-send-email-fcooper@ti.com>
References: <1364828095-28755-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 11/17] wpa-supplicant: Split recipe
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
X-List-Received-Date: Mon, 01 Apr 2013 14:55:20 -0000
Content-Type: text/plain

* Split recipe to allow multiple versions of wpa-supplicant to exist.
* Rename recipe to match the actual version of the TI modified wpa-supplicant.
* Update recipe's bbappend

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Remove "-" from recipe PR_append
Removed references to kill_wpa_supplicant
Add LICENSE field back to common .inc
Add rename of bbappend to this patch.

 ....bbappend => wpa-supplicant_r5.sp4.01.bbappend} |    0
 .../defconfig                                      |    0
 .../wpa-supplicant/wpa-supplicant.inc              |  113 ++++++++++++++++++
 .../wpa-supplicant/kill_wpa_supplicant.sh          |    9 --
 .../wpa-supplicant/wpa-supplicant_git.bb           |  120 --------------------
 .../wpa-supplicant/wpa-supplicant_r5.sp4.01.bb     |   12 ++
 6 files changed, 125 insertions(+), 129 deletions(-)
 rename meta-arago-distro/recipes-connectivity/wpa-supplicant/{wpa-supplicant_git.bbappend => wpa-supplicant_r5.sp4.01.bbappend} (100%)
 rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant => wpa-supplicant-r5.sp4.01}/defconfig (100%)
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/kill_wpa_supplicant.sh
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb

diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bbappend b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bbappend
rename to meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bbappend
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.sp4.01/defconfig
similarity index 100%
rename from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
rename to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.sp4.01/defconfig
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
new file mode 100644
index 0000000..410e6e3
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -0,0 +1,113 @@
+# This is a TI specific version of the wpa-supplicant recipe for use with the
+# wl12xx wlan and bluetooth module.
+
+DESCRIPTION = "A Client for Wi-Fi Protected Access (WPA)."
+HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
+BUGTRACKER = "http://hostap.epitest.fi/bugz/"
+SECTION = "network"
+LICENSE = "GPLv2 | BSD"
+
+DEPENDS = "gnutls dbus libnl openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
+RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
+
+# To prevent users from accidently picking up this customized version of
+# wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
+DEFAULT_PREFERENCE = "-1"
+
+PR = "r5"
+
+SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
+           file://defconfig \
+           file://defaults-sane \
+           file://wpa-supplicant.sh \
+           file://wpa_supplicant.conf \
+           file://wpa_supplicant.conf-sane \
+           file://99_wpa_supplicant \
+           file://wpa_supplicant.conf \
+           file://fi.epitest.hostap.WPASupplicant.service \
+           file://fi.w1.wpa_supplicant1.service \
+          "
+
+S = "${WORKDIR}/git/wpa_supplicant"
+
+PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
+FILES_wpa-supplicant-passphrase = "/usr/sbin/wpa_passphrase"
+FILES_wpa-supplicant-cli = "/usr/sbin/wpa_cli"
+FILES_${PN} += " /usr/share/dbus-1/system-services/*"
+
+#we introduce MY_ARCH to get 'armv5te' as arch instead of the misleading 'arm' on armv5te builds
+MY_ARCH := "${PACKAGE_ARCH}"
+PACKAGE_ARCH = "${@base_contains('COMBINED_FEATURES', 'madwifi', '${MACHINE_ARCH}', '${MY_ARCH}', d)}"
+
+do_compile () {
+	make
+}
+
+do_install () {
+	install -d ${D}${sbindir}
+	install -m 755 wpa_supplicant ${D}${sbindir}
+	install -m 755 wpa_passphrase ${D}${sbindir}
+	install -m 755 wpa_cli        ${D}${sbindir}
+
+	install -d ${D}${docdir}/wpa_supplicant
+	install -m 644 README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
+
+	install -d ${D}${sysconfdir}/default
+	install -m 600 ${WORKDIR}/defaults-sane ${D}${sysconfdir}/default/wpa
+	install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant.conf
+
+	if grep -q ^CONFIG_CTRL_IFACE_DBUS=y .config || grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=y .config; then
+		install -d ${D}/${sysconfdir}/dbus-1/system.d
+		install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
+		install -d ${D}/${datadir}/dbus-1/system-services
+		if grep -q ^CONFIG_CTRL_IFACE_DBUS=y .config; then
+			sed -i -e s:/sbin:${sbindir}:g ${S}/dbus/fi.epitest.hostap.WPASupplicant.service
+			install -m 644 ${S}/dbus/fi.epitest.hostap.WPASupplicant.service ${D}/${datadir}/dbus-1/system-services
+		fi
+		if grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=y .config; then
+			sed -i -e s:/sbin:${sbindir}:g ${S}/dbus/fi.w1.wpa_supplicant1.service
+			install -m 644 ${S}/dbus/fi.w1.wpa_supplicant1.service ${D}/${datadir}/dbus-1/system-services
+		fi
+	fi
+
+	install -d ${D}${sysconfdir}/network/if-pre-up.d/
+	install -d ${D}${sysconfdir}/network/if-post-down.d/
+	install -d ${D}${sysconfdir}/network/if-down.d/
+	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}
+	install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
+	cd ${D}${sysconfdir}/network/ && \
+	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
+
+	install -d ${D}/etc/default/volatiles
+	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
+
+	install -d 2755 ${D}/usr/share/dbus-1/system-services
+	install -d 2755 ${D}/etc
+	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}/etc
+	install -m 644 ${WORKDIR}/fi.epitest.hostap.WPASupplicant.service ${D}/usr/share/dbus-1/system-services
+	install -m 644 ${WORKDIR}/fi.w1.wpa_supplicant1.service ${D}/usr/share/dbus-1/system-services
+}
+
+pkg_postinst_wpa-supplicant () {
+	# can't do this offline
+	if [ "x$D" != "x" ]; then
+		exit 1
+	fi
+
+	DBUSPID=`pidof dbus-daemon`
+
+	if [ "x$DBUSPID" != "x" ]; then
+		/etc/init.d/dbus-1 reload
+	fi
+}
+
+do_configure () {
+	install -m 0755 ${WORKDIR}/defconfig .config
+	echo "CFLAGS += -I${STAGING_INCDIR}" >> .config
+	echo "LIBS += -L${STAGING_LIBDIR}" >> .config
+	echo "LIBS_p += -L${STAGING_LIBDIR}" >> .config
+	if [ "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0, d)}" = "1" ]; then
+		echo "CONFIG_DRIVER_MADWIFI=y" >> .config
+		echo "CFLAGS += -I${STAGING_INCDIR}/madwifi-ng" >> .config
+	fi
+}
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/kill_wpa_supplicant.sh b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/kill_wpa_supplicant.sh
deleted file mode 100644
index aab6474..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/kill_wpa_supplicant.sh
+++ /dev/null
@@ -1,9 +0,0 @@
-#check if the wpa_suppicant is already running
-#if it does, stop it.
-StationRunning=`ps | grep -c wpa_supplicant`
-if [ $StationRunning -eq 2 ]; then
-        killall wpa_supplicant
-fi
-
-# start the application
-$*
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
deleted file mode 100644
index 927a556..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
+++ /dev/null
@@ -1,120 +0,0 @@
-# This is a TI specific version of the wpa-supplicant recipe for use with the
-# wl12xx wlan and bluetooth module.
-
-DESCRIPTION = "A Client for Wi-Fi Protected Access (WPA)."
-HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
-BUGTRACKER = "http://hostap.epitest.fi/bugz/"
-SECTION = "network"
-LICENSE = "GPLv2 | BSD"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
-                    file://../README;md5=5cb758942d25f6f61fd4ac388fd446fa \
-                    file://wpa_supplicant.c;beginline=1;endline=17;md5=8835156c8ab8cad6356ec7f39ebe3aba"
-DEPENDS = "gnutls dbus libnl openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
-RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
-
-# To prevent users from accidently picking up this customized version of
-# wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
-DEFAULT_PREFERENCE = "-1"
-
-SRCREV = "ol_R5.SP4.01"
-PR = "r3+gitr${SRCPV}"
-# Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
-PV = "2.0-devel-ti"
-
-SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
-           file://defconfig \
-           file://defaults-sane \
-           file://wpa-supplicant.sh \
-           file://kill_wpa_supplicant.sh \
-           file://wpa_supplicant.conf \
-           file://wpa_supplicant.conf-sane \
-           file://99_wpa_supplicant \
-           file://wpa_supplicant.conf \
-           file://fi.epitest.hostap.WPASupplicant.service \
-           file://fi.w1.wpa_supplicant1.service \
-          "
-
-S = "${WORKDIR}/git/wpa_supplicant"
-
-PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
-FILES_wpa-supplicant-passphrase = "/usr/sbin/wpa_passphrase"
-FILES_wpa-supplicant-cli = "/usr/sbin/wpa_cli"
-FILES_${PN} += " /usr/share/dbus-1/system-services/* /usr/sbin/kill_wpa_supplicant.sh"
-
-#we introduce MY_ARCH to get 'armv5te' as arch instead of the misleading 'arm' on armv5te builds
-MY_ARCH := "${PACKAGE_ARCH}"
-PACKAGE_ARCH = "${@base_contains('COMBINED_FEATURES', 'madwifi', '${MACHINE_ARCH}', '${MY_ARCH}', d)}"
-
-do_compile () {
-	make
-}
-
-do_install () {
-	install -d ${D}${sbindir}
-	install -m 755 wpa_supplicant ${D}${sbindir}
-	install -m 755 wpa_passphrase ${D}${sbindir}
-	install -m 755 wpa_cli        ${D}${sbindir}
-	install -m 755 ${WORKDIR}/kill_wpa_supplicant.sh ${D}${sbindir}
-
-	install -d ${D}${docdir}/wpa_supplicant
-	install -m 644 README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
-
-	install -d ${D}${sysconfdir}/default
-	install -m 600 ${WORKDIR}/defaults-sane ${D}${sysconfdir}/default/wpa
-	install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant.conf
-
-	if grep -q ^CONFIG_CTRL_IFACE_DBUS=y .config || grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=y .config; then
-		install -d ${D}/${sysconfdir}/dbus-1/system.d
-		install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
-		install -d ${D}/${datadir}/dbus-1/system-services
-		if grep -q ^CONFIG_CTRL_IFACE_DBUS=y .config; then
-			sed -i -e s:/sbin:${sbindir}:g ${S}/dbus/fi.epitest.hostap.WPASupplicant.service
-			install -m 644 ${S}/dbus/fi.epitest.hostap.WPASupplicant.service ${D}/${datadir}/dbus-1/system-services
-		fi
-		if grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=y .config; then
-			sed -i -e s:/sbin:${sbindir}:g ${S}/dbus/fi.w1.wpa_supplicant1.service
-			install -m 644 ${S}/dbus/fi.w1.wpa_supplicant1.service ${D}/${datadir}/dbus-1/system-services
-		fi
-	fi
-
-	install -d ${D}${sysconfdir}/network/if-pre-up.d/
-	install -d ${D}${sysconfdir}/network/if-post-down.d/
-	install -d ${D}${sysconfdir}/network/if-down.d/
-	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}
-	install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
-	cd ${D}${sysconfdir}/network/ && \
-	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
-
-	install -d ${D}/etc/default/volatiles
-	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
-
-	install -d 2755 ${D}/usr/share/dbus-1/system-services
-	install -d 2755 ${D}/etc
-	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}/etc
-	install -m 644 ${WORKDIR}/fi.epitest.hostap.WPASupplicant.service ${D}/usr/share/dbus-1/system-services
-	install -m 644 ${WORKDIR}/fi.w1.wpa_supplicant1.service ${D}/usr/share/dbus-1/system-services
-}
-
-pkg_postinst_wpa-supplicant () {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	DBUSPID=`pidof dbus-daemon`
-
-	if [ "x$DBUSPID" != "x" ]; then
-		/etc/init.d/dbus-1 reload
-	fi
-}
-
-do_configure () {
-	install -m 0755 ${WORKDIR}/defconfig .config
-	echo "CFLAGS += -I${STAGING_INCDIR}" >> .config
-	echo "LIBS += -L${STAGING_LIBDIR}" >> .config
-	echo "LIBS_p += -L${STAGING_LIBDIR}" >> .config
-	if [ "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0, d)}" = "1" ]; then
-		echo "CONFIG_DRIVER_MADWIFI=y" >> .config
-		echo "CFLAGS += -I${STAGING_INCDIR}/madwifi-ng" >> .config
-	fi
-}
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb
new file mode 100644
index 0000000..d1ff079
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb
@@ -0,0 +1,12 @@
+# This is a TI specific version of the wpa-supplicant recipe for use with the
+# wl12xx wlan and bluetooth module.
+
+require wpa-supplicant.inc
+
+LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
+                    file://../README;md5=5cb758942d25f6f61fd4ac388fd446fa \
+                    file://wpa_supplicant.c;beginline=1;endline=17;md5=8835156c8ab8cad6356ec7f39ebe3aba"
+
+
+SRCREV = "ol_R5.SP4.01"
+PR_append = "a+gitr${SRCPV}"
-- 
1.7.0.4


