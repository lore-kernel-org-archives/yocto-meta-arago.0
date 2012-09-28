Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 5E7A0529A4
	for <meta-arago@arago-project.org>;
	Fri, 28 Sep 2012 01:41:51 +0000 (UTC)
Received: by oagn12 with SMTP id n12so2473771oag.38
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2012 18:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1R/kd0PAnjOkTjq3pmFn/EBemzqKDog8hamIQi+hV/U=;
	b=DSWRBUh12WcqAvPezXNaO5TetjtebdqVu16R/uCn2oSABZNEDrV3vVn1CjaL5zDTBk
	fWhOzagwIfPJ8q9eIPvMRfhZBly0iIlgESdpifWkwwJBYAAq+t1mVn+jtE0FrtnRgO/+
	vb5e0WGsdzuj1uOst8jDN0Xf+Gw9VcgV5NdgjT1mReFbxrmtAL6WmQi+TN7+1JcIQteT
	UrTRJ752CvKXEU8XV+weiGmJM+ejswN7BskguDzJv0zq/0kE5vlFS79Du2Ug64QIQvst
	FdY3QLOydd4/w/VrEG7SCQRXMN+tEBycyE6Qn6nZkh8eaZW8sN3UcBiaLz27hYViUw72
	y4Nw==
Received: by 10.60.172.107 with SMTP id bb11mr4743598oec.96.1348796510487;
	Thu, 27 Sep 2012 18:41:50 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id o4sm5610002oef.11.2012.09.27.18.41.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 18:41:49 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 27 Sep 2012 21:07:27 -0500
Message-Id: <1348798047-23793-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] hostap-daemon: Port TI customized hostap-daemon recipe
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
X-List-Received-Date: Fri, 28 Sep 2012 01:41:51 -0000

* Port TI customized hostap-daemon recipe from arago to meta-arago
* DEFAULT_PREFERENCE set to -1 to ensure that this customized version
  isn't accidently picked up.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...d-change-conf-file-for-better-oob-startup.patch |   49 ++++++
 .../hostap/hostap-daemon/defconfig                 |  182 ++++++++++++++++++++
 .../recipes-connectivity/hostap/hostap-daemon/init |   37 ++++
 .../hostap/hostap-daemon_git.bb                    |   62 +++++++
 4 files changed, 330 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/defconfig
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/init
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch
new file mode 100644
index 0000000..fa68357
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch
@@ -0,0 +1,49 @@
+From 4c5fe9901219956fb754306a2093e78fb460bbdd Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Thu, 23 Jun 2011 10:13:44 +0300
+Subject: [PATCH] hostapd: change conf file for better sdk out of box startup
+
+The default hostapd.conf file that is fetched from upstream is using
+a band which is not supported by the 1271 chip.
+I am using this amend.inc in order to modify it to use g band and default
+channel 6 and change the ssid to a more meaningful name.
+
+Upstream-status: inappropriate [SDK specific patch]
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ hostapd/hostapd.conf |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
+index 6d7263a..bb27beb 100644
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
+@@ -99,14 +99,14 @@ ssid=test
+
+ # Operation mode (a = IEEE 802.11a, b = IEEE 802.11b, g = IEEE 802.11g,
+ # Default: IEEE 802.11b
+-hw_mode=a
++hw_mode=g
+
+ # Channel number (IEEE 802.11)
+ # (default: 0, i.e., not set)
+ # Please note that some drivers (e.g., madwifi) do not use this value from
+ # hostapd and the channel will need to be configuration separately with
+ # iwconfig.
+-channel=60
++channel=6
+
+ # Beacon interval in kus (1.024 ms) (default: 100; range 15..65535)
+ beacon_int=100
+--
+1.7.0.4
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/defconfig b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/defconfig
new file mode 100644
index 0000000..6a654c9
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/defconfig
@@ -0,0 +1,182 @@
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
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/init b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/init
new file mode 100644
index 0000000..79f74b6
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/init
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
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb
new file mode 100644
index 0000000..6e46405
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb
@@ -0,0 +1,62 @@
+# This is a TI specific version of the hostap-daemon recipe for use with the
+# wl12xx wlan and bluetooth module.
+
+HOMEPAGE = "http://hostap.epitest.fi"
+DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
+SECTION = "kernel/userland"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58"
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
+PV = "0.7.3+0.8.0-rc-ti"
+
+PR = "r0+gitr${SRCPV}"
+
+SRCREV = "ol_R5.00.18"
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
1.7.0.4


