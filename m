Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D1331529D5
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 12:42:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83Cg0XC011769
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CfxLW020011
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:41:59 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 07:41:59 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CfZhi031656;
	Wed, 3 Sep 2014 07:41:58 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Sep 2014 18:11:23 +0530
Message-ID: <1409748091-12617-5-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409748091-12617-1-git-send-email-a0393906@ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for dora] [PATCH v2 04/12] wpa-supplicant-wl18xx: Update recipe to ol_r8.a9.14 version.
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
X-List-Received-Date: Wed, 03 Sep 2014 12:42:01 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Changed git sources to git.ti.com
        - Adjust configuration to match latest package.
        - Removed redundant files and cleanup.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Tested-by: Karthik Ramanan <a0393906@ti.com>
---
 ....a8.10.bb => wpa-supplicant-wl18xx_r8.a9.14.bb} | 10 +--
 .../wpa-supplicant/wpa-supplicant.inc              | 91 ++++++++--------------
 .../wpa-supplicant/wpa-supplicant/defaults-sane    |  8 --
 .../defconfig                                      | 69 ++++++++++++----
 .../fi.epitest.hostap.WPASupplicant.service        |  4 -
 .../wpa-supplicant/fi.w1.wpa_supplicant1.service   |  4 -
 6 files changed, 90 insertions(+), 96 deletions(-)
 rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-wl18xx_r8.a8.10.bb => wpa-supplicant-wl18xx_r8.a9.14.bb} (76%)
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defaults-sane
 rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-wl18xx => wpa-supplicant}/defconfig (90%)
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb
similarity index 76%
rename from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
rename to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb
index bfe617e..203364f 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb
@@ -5,15 +5,15 @@ require wpa-supplicant.inc
 
 LICENSE = "GPLv2 | BSD"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
-                    file://../README;md5=5cb758942d25f6f61fd4ac388fd446fa \
+                    file://../README;md5=ba46b65db36e3c82244a3815b3738d63 \
                     file://wpa_supplicant.c;beginline=1;endline=17;md5=8835156c8ab8cad6356ec7f39ebe3aba"
 
 FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
 
-# Tag: ol_r8.a8.10
-SRCREV = "257ab333aad993b4be81808524bc0d939c276058"
-BRANCH = "mbss_suspend"
-PR_append = "b+gitr${SRCPV}"
+# Tag: ol_r8.a9.14
+SRCREV = "281f5adb8eb7ee9e9220546c0227696b02aab332"
+BRANCH = "single_hostap_dfs_dynamic"
+PR_append = "c+gitr${SRCPV}"
 
 # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
 PV = "2.0-devel-ti"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index e0bda11..c8611ea 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -1,47 +1,47 @@
 # This is a TI specific version of the wpa-supplicant recipe for use with the
-# wl12xx wlan and bluetooth module.
+# wl18xx wlan.
 
-DESCRIPTION = "A Client for Wi-Fi Protected Access (WPA)."
+SUMMARY = "Client for Wi-Fi Protected Access (WPA)"
 HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
 BUGTRACKER = "http://hostap.epitest.fi/bugz/"
 SECTION = "network"
 LICENSE = "GPLv2 | BSD"
 
-DEPENDS = "gnutls dbus libnl openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
+DEPENDS = "gnutls dbus libnl openssl libgcrypt"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
 # To prevent users from accidently picking up this customized version of
 # wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r6"
+PR = "r7"
 
-SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/wilink8-wlan/hostap.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
-           file://defaults-sane \
            file://wpa-supplicant.sh \
            file://wpa_supplicant.conf \
            file://p2p_supplicant.conf \
-           file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
-           file://wpa_supplicant.conf \
-           file://fi.epitest.hostap.WPASupplicant.service \
-           file://fi.w1.wpa_supplicant1.service \
           "
 
 S = "${WORKDIR}/git/wpa_supplicant"
 
 PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
-FILES_wpa-supplicant-passphrase = "/usr/sbin/wpa_passphrase"
-FILES_wpa-supplicant-cli = "/usr/sbin/wpa_cli"
-FILES_${PN} += " /usr/share/dbus-1/system-services/*"
+FILES_wpa-supplicant-passphrase = "${sbindir}/wpa_passphrase"
+FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
+FILES_${PN} += "${datadir}/dbus-1/system-services/*"
 
-#we introduce MY_ARCH to get 'armv5te' as arch instead of the misleading 'arm' on armv5te builds
-MY_ARCH := "${PACKAGE_ARCH}"
-PACKAGE_ARCH = "${@base_contains('COMBINED_FEATURES', 'madwifi', '${MACHINE_ARCH}', '${MY_ARCH}', d)}"
+do_configure () {
+	install -m 0755 ${WORKDIR}/defconfig .config
+	echo "CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> .config
+}
 
+export EXTRA_CFLAGS = "${CFLAGS}"
+export BINDIR = "${sbindir}"
 do_compile () {
-	make
+	unset CFLAGS CPPFLAGS CXXFLAGS
+	sed -e "s:CFLAGS\ =.*:& \$(EXTRA_CFLAGS):g" -i ${S}/src/lib.rules
+	oe_runmake
 }
 
 do_install () {
@@ -54,63 +54,36 @@ do_install () {
 	install -m 644 README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
 
 	install -d ${D}${sysconfdir}/default
-	install -m 600 ${WORKDIR}/defaults-sane ${D}${sysconfdir}/default/wpa
-	install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant.conf
+	install -m 600 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}/wpa_supplicant.conf
 	install -m 600 ${WORKDIR}/p2p_supplicant.conf ${D}${sysconfdir}/p2p_supplicant.conf
 
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
 	install -d ${D}${sysconfdir}/network/if-pre-up.d/
 	install -d ${D}${sysconfdir}/network/if-post-down.d/
 	install -d ${D}${sysconfdir}/network/if-down.d/
-	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}
 	install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
 	cd ${D}${sysconfdir}/network/ && \
 	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
 
+	install -d ${D}/${sysconfdir}/dbus-1/system.d
+	install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
+	install -d ${D}/${datadir}/dbus-1/system-services
+	install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
+
+	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}/${systemd_unitdir}/system
+		install -m 644 ${S}/systemd/*.service ${D}/${systemd_unitdir}/system
+	fi
+
 	install -d ${D}/etc/default/volatiles
 	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
-
-	install -d 2755 ${D}/usr/share/dbus-1/system-services
-	install -d 2755 ${D}/etc
-	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}/etc
-	install -m 644 ${WORKDIR}/fi.epitest.hostap.WPASupplicant.service ${D}/usr/share/dbus-1/system-services
-	install -m 644 ${WORKDIR}/fi.w1.wpa_supplicant1.service ${D}/usr/share/dbus-1/system-services
 }
 
 pkg_postinst_wpa-supplicant () {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
+	# If we're offline, we don't need to do this.
+	if [ "x$D" = "x" ]; then
+		killall -q -HUP dbus-daemon || true
 	fi
+}
 
-	DBUSPID=`pidof dbus-daemon`
 
-	if [ "x$DBUSPID" != "x" ]; then
-		/etc/init.d/dbus-1 reload
-	fi
-}
 
-do_configure () {
-	install -m 0755 ${WORKDIR}/defconfig .config
-	echo "CFLAGS += -I${STAGING_INCDIR}" >> .config
-	echo "CFLAGS += -I${STAGING_INCDIR}/libnl3/" >> .config
-	echo "LIBS += -L${STAGING_LIBDIR}" >> .config
-	echo "LIBS_p += -L${STAGING_LIBDIR}" >> .config
-	if [ "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0, d)}" = "1" ]; then
-		echo "CONFIG_DRIVER_MADWIFI=y" >> .config
-		echo "CFLAGS += -I${STAGING_INCDIR}/madwifi-ng" >> .config
-	fi
-}
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defaults-sane b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defaults-sane
deleted file mode 100644
index 67c4cbd..0000000
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
similarity index 90%
rename from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx/defconfig
rename to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
index f357b79..fcbe06d 100755
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx/defconfig
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -176,7 +176,7 @@ CONFIG_EAP_PWD=y
 CONFIG_EAP_LEAP=y
 
 # EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
-#CONFIG_EAP_AKA=y
+CONFIG_EAP_AKA=y
 
 # EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
 # This requires CONFIG_EAP_AKA to be enabled, too.
@@ -201,10 +201,12 @@ CONFIG_WPS=y
 # Enable WSC 2.0 support
 CONFIG_WPS2=y
 # Enable WPS external registrar functionality
-#CONFIG_WPS_ER=y
+CONFIG_WPS_ER=y
 # Disable credentials for an open network by default when acting as a WPS
 # registrar.
 #CONFIG_WPS_REG_DISABLE_OPEN=y
+# Enable WPS support with NFC config method
+#CONFIG_WPS_NFC=y
 
 # EAP-IKEv2
 #CONFIG_EAP_IKEV2=y
@@ -224,6 +226,9 @@ CONFIG_SMARTCARD=y
 # Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
 #CONFIG_HT_OVERRIDES=y
 
+# Support VHT overrides (disable VHT, mask MCS rates, etc.)
+#CONFIG_VHT_OVERRIDES=y
+
 # Development testing
 #CONFIG_EAPOL_TEST=y
 
@@ -231,6 +236,7 @@ CONFIG_SMARTCARD=y
 # unix = UNIX domain sockets (default for Linux/*BSD)
 # udp = UDP sockets using localhost (127.0.0.1)
 # named_pipe = Windows Named Pipe (default for Windows)
+# udp-remote = UDP sockets with remote access (only for tests systems/purpose)
 # y = use default (backwards compatibility)
 # If this option is commented out, control interface is not included in the
 # build.
@@ -256,11 +262,6 @@ CONFIG_WPA_CLI_EDIT=y
 # 35-50 kB in code size.
 #CONFIG_NO_WPA=y
 
-# Remove WPA2 support. This allows WPA to be used, but removes WPA2 code to
-# save about 1 kB in code size when building only WPA-Personal (no EAP support)
-# or 6 kB if building for WPA-Enterprise.
-#CONFIG_NO_WPA2=y
-
 # Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
 # This option can be used to reduce code size by removing support for
 # converting ASCII passphrases into PSK. If this functionality is removed, the
@@ -304,7 +305,6 @@ CONFIG_OS=unix
 # Select event loop implementation
 # eloop = select() loop (default)
 # eloop_win = Windows events and WaitForMultipleObject() loop
-# eloop_none = Empty template
 CONFIG_ELOOP=eloop
 
 # Should we use poll instead of select? Select is used by default.
@@ -322,11 +322,9 @@ CONFIG_L2_PACKET=linux
 # PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
 CONFIG_PEERKEY=y
 
-# IEEE 802.11w (management frame protection)
-# This version is an experimental implementation based on IEEE 802.11w/D1.0
-# draft and is subject to change since the standard has not yet been finalized.
+# IEEE 802.11w (management frame protection), also known as PMF
 # Driver support is also needed for IEEE 802.11w.
-#CONFIG_IEEE80211W=y
+CONFIG_IEEE80211W=y
 
 # Select TLS implementation
 # openssl = OpenSSL (default)
@@ -404,7 +402,7 @@ CONFIG_PEERKEY=y
 #CONFIG_DYNAMIC_EAP_METHODS=y
 
 # IEEE Std 802.11r-2008 (Fast BSS Transition)
-#CONFIG_IEEE80211R=y
+CONFIG_IEEE80211R=y
 
 # Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#.txt)
 #CONFIG_DEBUG_FILE=y
@@ -483,6 +481,10 @@ CONFIG_ANDROID_LOG=y
 # IEEE 802.11n (High Throughput) support (mainly for AP mode)
 CONFIG_IEEE80211N=y
 
+# Wireless Network Management (IEEE Std 802.11v-2011)
+# Note: This is experimental and not complete implementation.
+CONFIG_WNM=y
+
 # Interworking (IEEE 802.11u)
 # This can be used to enable functionality to improve interworking with
 # external networks (GAS/ANQP to learn more about the networks and network
@@ -495,12 +497,47 @@ CONFIG_HS20=y
 # Disable roaming in wpa_supplicant
 #CONFIG_NO_ROAMING=y
 
-# Enable P2P
-CONFIG_P2P=y
+# AP mode operations with wpa_supplicant
+# This can be used for controlling AP mode operations with wpa_supplicant. It
+# should be noted that this is mainly aimed at simple cases like
+# WPA2-Personal while more complex configurations like WPA2-Enterprise with an
+# external RADIUS server can be supported with hostapd.
 CONFIG_AP=y
 
+# P2P (Wi-Fi Direct)
+# This can be used to enable P2P support in wpa_supplicant. See README-P2P for
+# more information on P2P operations.
+CONFIG_P2P=y
+
+# Enable TDLS support
+CONFIG_TDLS=y
+
+# Wi-Fi Direct
+# This can be used to enable Wi-Fi Direct extensions for P2P using an external
+# program to control the additional information exchanges in the messages.
+CONFIG_WIFI_DISPLAY=y
+
+# Autoscan
+# This can be used to enable automatic scan support in wpa_supplicant.
+# See wpa_supplicant.conf for more information on autoscan usage.
+#
+# Enabling directly a module will enable autoscan support.
+# For exponential module:
+#CONFIG_AUTOSCAN_EXPONENTIAL=y
+# For periodic module:
+#CONFIG_AUTOSCAN_PERIODIC=y
+
+# Password (and passphrase, etc.) backend for external storage
+# These optional mechanisms can be used to add support for storing passwords
+# and other secrets in external (to wpa_supplicant) location. This allows, for
+# example, operating system specific key storage to be used
+#
+# External password backend for testing purposes (developer use)
+#CONFIG_EXT_PASSWORD_TEST=y
+
+include $(wildcard $(LOCAL_PATH)/android_config_*.inc)
+
 # bgscan
 NEED_BGSCAN=y
 CONFIG_BGSCAN_LEARN=y
 CONFIG_BGSCAN_SIMPLE=y
-
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
deleted file mode 100644
index fb3f917..0000000
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
deleted file mode 100644
index 0bb1056..0000000
-- 
2.0.1


