Return-Path: <eyalreizer@gmail.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by arago-project.org (Postfix) with ESMTPS id E2F1152A64
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 13:36:26 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id bs12so1680787qab.0
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=7p3EnAfv7nC0gXgzkG7zJWbyQJwFV563BOyejZX6gnc=;
	b=Wwkv6EIyH+Ow4RkKV+D7DbGC2OIT0wf6dUzqh7ZMLn05FHlgc8Os5CIEJ8Oe2WbPWx
	LR/3MJ73ih+zIMW2N1XecHYaj+fwD7aa1hiv/EM/bVm90BTomjhd34l62yyGtG4k1b7a
	toUqATdrbU3GiifylskKYhkLfrTjFccrgEO+MIqVzq1qku0UUNbfq9ARa1jxQjt6li7X
	2XWb6yZ3tHsFMrHGJSlVaBhh1HTciEYf5lA+959ThoKgYb5wneJNytKbr1bvRd4Zujrl
	SIHXdYAVcYPgTS/OjRDxIgNP4tKxCDYkj6LcrIsDMeTBqF1fWHYl6glM65fkKslLq9KE
	oCsA==
X-Received: by 10.49.85.34 with SMTP id e2mr22809452qez.1.1363613786684;
	Mon, 18 Mar 2013 06:36:26 -0700 (PDT)
Received: from user-VirtualBox.emea.dhcp.ti.com (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ku2sm32421520qeb.4.2013.03.18.06.36.25
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 06:36:26 -0700 (PDT)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 18 Mar 2013 15:35:55 +0200
Message-Id: <1363613762-6537-3-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363613762-6537-1-git-send-email-eyalr@ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
Subject: [PATCH 3/9] hostap-daemon-wl18xx: hostap-daemon for ti wilink8 release
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
X-List-Received-Date: Mon, 18 Mar 2013 13:36:27 -0000

From: Eyal Reizer <eyalr@ti.com>

Add a new recipe for building the ti version of hostap-daemon
2.0-devel from release r8.a6.01

This package replace the wilink6 package which is provided by the
hostap-daemon recipe. Selection between the two is done using a 
"WILINK_VERSION" switch added to arago.conf

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 ...d-change-conf-file-for-better-oob-startup.patch |   40 +++++
 .../hostap/hostap-daemon-wl18xx/defconfig          |  183 ++++++++++++++++++++
 .../hostap/hostap-daemon-wl18xx/init               |   37 ++++
 .../hostap/hostap-daemon-wl18xx_git.bb             |   64 +++++++
 4 files changed, 324 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/defconfig
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/init
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_git.bb

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
new file mode 100644
index 0000000..824d250
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
@@ -0,0 +1,40 @@
+From f7c1b9d4e18dc650dd0b9da97a91f27f6a4bb5b7 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Sun, 17 Mar 2013 07:18:55 -0700
+Subject: [PATCH] hostapd: change conf file for better sdk out of box startup
+
+Change the default channel to 6 and change the ssid to a more
+meaningful name.
+
+Upstream-status: inappropriate [SDK specific patch]
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ hostapd/hostapd.conf |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
+index f71a881..00843aa 100644
+--- a/hostapd/hostapd.conf
++++ b/hostapd/hostapd.conf
+@@ -83,7 +83,7 @@ ctrl_interface_group=0
+ ##### IEEE 802.11 related configuration #######################################
+ 
+ # SSID to be used in IEEE 802.11 management frames
+-ssid=test
++ssid=TexasInstruments_0001
+ 
+ # Country code (ISO/IEC 3166-1). Used to set regulatory domain.
+ # Set as needed to indicate country in which device is operating.
+@@ -107,7 +107,7 @@ hw_mode=g
+ # channel will need to be configured separately with iwconfig.
+ # When set to 0, automatic channel selection will be engaged. A channel
+ # will be selected from the desired hw_mode.
+-channel=1
++channel=6
+ 
+ # Automatic channel selection (ACS) whitelist
+ # (default: not set)
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/defconfig b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/defconfig
new file mode 100644
index 0000000..1ea96c4
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/defconfig
@@ -0,0 +1,183 @@
+# Example hostapd build time configuration
+#
+# This file lists the configuration options that are used when building the
+# hostapd binary. All lines starting with # are ignored. Configuration option
+# lines must be commented out complete, if they are not to be included, i.e.,
+# just setting VARIABLE=n is not disabling that variable.
+#
+# This file is included in Makefile, so variables like CFLAGS and LIBS can also
+# be modified from here. In most cass, these lines should use += in order not
+# to override previous values of the variables.
+
+# Driver interface for Host AP driver
+CONFIG_DRIVER_HOSTAP=y
+
+# Driver interface for wired authenticator
+#CONFIG_DRIVER_WIRED=y
+
+# Driver interface for madwifi driver
+#CONFIG_DRIVER_MADWIFI=y
+#CFLAGS += -I../../madwifi # change to the madwifi source directory
+
+# Driver interface for drivers using the nl80211 kernel interface
+CONFIG_DRIVER_NL80211=y
+CONFIG_LIBNL20=y
+# driver_nl80211.c requires a rather new libnl (version 1.1) which may not be
+# shipped with your distribution yet. If that is the case, you need to build
+# newer libnl version and point the hostapd build to use it.
+#LIBNL=/usr/src/libnl
+#CFLAGS += -I$(LIBNL)/include
+#LIBS += -L$(LIBNL)/lib
+
+# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
+#CONFIG_DRIVER_BSD=y
+#CFLAGS += -I/usr/local/include
+#LIBS += -L/usr/local/lib
+#LIBS_p += -L/usr/local/lib
+#LIBS_c += -L/usr/local/lib
+
+# Driver interface for no driver (e.g., RADIUS server only)
+#CONFIG_DRIVER_NONE=y
+
+# IEEE 802.11F/IAPP
+CONFIG_IAPP=y
+
+# WPA2/IEEE 802.11i RSN pre-authentication
+CONFIG_RSN_PREAUTH=y
+
+# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
+CONFIG_PEERKEY=y
+
+# IEEE 802.11w (management frame protection)
+# This version is an experimental implementation based on IEEE 802.11w/D1.0
+# draft and is subject to change since the standard has not yet been finalized.
+# Driver support is also needed for IEEE 802.11w.
+#CONFIG_IEEE80211W=y
+
+# Integrated EAP server
+CONFIG_EAP=y
+
+# EAP-MD5 for the integrated EAP server
+CONFIG_EAP_MD5=y
+
+# EAP-TLS for the integrated EAP server
+CONFIG_EAP_TLS=y
+
+# EAP-MSCHAPv2 for the integrated EAP server
+CONFIG_EAP_MSCHAPV2=y
+
+# EAP-PEAP for the integrated EAP server
+CONFIG_EAP_PEAP=y
+
+# EAP-GTC for the integrated EAP server
+CONFIG_EAP_GTC=y
+
+# EAP-TTLS for the integrated EAP server
+CONFIG_EAP_TTLS=y
+
+# EAP-SIM for the integrated EAP server
+#CONFIG_EAP_SIM=y
+
+# EAP-AKA for the integrated EAP server
+#CONFIG_EAP_AKA=y
+
+# EAP-AKA' for the integrated EAP server
+# This requires CONFIG_EAP_AKA to be enabled, too.
+#CONFIG_EAP_AKA_PRIME=y
+
+# EAP-PAX for the integrated EAP server
+#CONFIG_EAP_PAX=y
+
+# EAP-PSK for the integrated EAP server (this is _not_ needed for WPA-PSK)
+#CONFIG_EAP_PSK=y
+
+# EAP-SAKE for the integrated EAP server
+#CONFIG_EAP_SAKE=y
+
+# EAP-GPSK for the integrated EAP server
+#CONFIG_EAP_GPSK=y
+# Include support for optional SHA256 cipher suite in EAP-GPSK
+#CONFIG_EAP_GPSK_SHA256=y
+
+# EAP-FAST for the integrated EAP server
+# Note: Default OpenSSL package does not include support for all the
+# functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL,
+# the OpenSSL library must be patched (openssl-0.9.9-session-ticket.patch)
+# to add the needed functions.
+#CONFIG_EAP_FAST=y
+
+# Wi-Fi Protected Setup (WPS)
+CONFIG_WPS=y
+# Enable WSC 2.0 support
+CONFIG_WPS2=y
+# Enable UPnP support for external WPS Registrars
+CONFIG_WPS_UPNP=y
+
+# EAP-IKEv2
+#CONFIG_EAP_IKEV2=y
+
+# Trusted Network Connect (EAP-TNC)
+#CONFIG_EAP_TNC=y
+
+# PKCS#12 (PFX) support (used to read private key and certificate file from
+# a file that usually has extension .p12 or .pfx)
+CONFIG_PKCS12=y
+
+# RADIUS authentication server. This provides access to the integrated EAP
+# server from external hosts using RADIUS.
+#CONFIG_RADIUS_SERVER=y
+
+# Build IPv6 support for RADIUS operations
+CONFIG_IPV6=y
+
+# IEEE Std 802.11r-2008 (Fast BSS Transition)
+#CONFIG_IEEE80211R=y
+
+# Use the hostapd's IEEE 802.11 authentication (ACL), but without
+# the IEEE 802.11 Management capability (e.g., madwifi or FreeBSD/net80211)
+#CONFIG_DRIVER_RADIUS_ACL=y
+
+# IEEE 802.11n (High Throughput) support
+CONFIG_IEEE80211N=y
+
+# Remove debugging code that is printing out debug messages to stdout.
+# This can be used to reduce the size of the hostapd considerably if debugging
+# code is not needed.
+#CONFIG_NO_STDOUT_DEBUG=y
+
+# Remove support for RADIUS accounting
+#CONFIG_NO_ACCOUNTING=y
+
+# Remove support for RADIUS
+#CONFIG_NO_RADIUS=y
+
+# Remove support for VLANs
+#CONFIG_NO_VLAN=y
+
+# Remove support for dumping state into a file on SIGUSR1 signal
+# This can be used to reduce binary size at the cost of disabling a debugging
+# option.
+#CONFIG_NO_DUMP_STATE=y
+
+# Enable tracing code for developer debugging
+# This tracks use of memory allocations and other registrations and reports
+# incorrect use with a backtrace of call (or allocation) location.
+#CONFIG_WPA_TRACE=y
+# For BSD, comment out these.
+#LIBS += -lexecinfo
+#LIBS_p += -lexecinfo
+#LIBS_c += -lexecinfo
+
+# Use libbfd to get more details for developer debugging
+# This enables use of libbfd to get more detailed symbols for the backtraces
+# generated by CONFIG_WPA_TRACE=y.
+#CONFIG_WPA_TRACE_BFD=y
+# For BSD, comment out these.
+#LIBS += -lbfd -liberty -lz
+#LIBS_p += -lbfd -liberty -lz
+#LIBS_c += -lbfd -liberty -lz
+#
+#
+
+CONFIG_NO_RANDOM_POOL=y
+
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/init b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/init
new file mode 100644
index 0000000..79f74b6
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/init
@@ -0,0 +1,37 @@
+#!/bin/sh
+DAEMON=/usr/sbin/hostapd
+NAME=hostapd
+DESC="HOSTAP Daemon"
+ARGS="/etc/hostapd.conf -B"
+
+test -f $DAEMON || exit 0
+
+set -e
+
+case "$1" in
+    start)
+	echo -n "Starting $DESC: "
+	start-stop-daemon -S -x $DAEMON -- $ARGS
+	echo "$NAME."
+	;;
+    stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon -K -x $DAEMON
+	echo "$NAME."
+	;;
+    restart)
+	$0 stop
+	$0 start
+	;;
+    reload)
+	echo -n "Reloading $DESC: "
+	killall -HUP $(basename ${DAEMON})
+	echo "$NAME."
+	;;
+    *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_git.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_git.bb
new file mode 100644
index 0000000..6d1d5eb
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_git.bb
@@ -0,0 +1,64 @@
+# This is a TI specific version of the hostap-daemon recipe for use with the
+# wl18xx wlan and bluetooth module.
+
+HOMEPAGE = "http://hostap.epitest.fi"
+DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
+SECTION = "kernel/userland"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
+
+DEPENDS = "libnl openssl"
+
+# Since this is a TI customized version of hostap-daemon do not make this the
+# default
+DEFAULT_PREFERENCE = "-1"
+
+inherit update-rc.d
+INITSCRIPT_NAME="hostapd"
+
+CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
+
+# Add TI to the end to make it clear that this is a TI customized version
+# of hostap
+PV = "2.0-devel-ti"
+
+PR = "r1+gitr${SRCREV}"
+
+SRCREV = "ol_r8.a6.01"
+
+PROVIDES += "hostap-daemon"
+RPROVIDES += "hostap-daemon" 
+
+SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
+	file://0001-hostapd-change-conf-file-for-better-oob-startup.patch;patchdir=.. \
+	file://defconfig \
+	file://init"
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
-- 
1.7.9.5


