Return-Path: <yanivma@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 89D55529E3
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 11:34:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rASBYROh007279
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:34:27 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rASBYRVq013859
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:34:27 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Nov 2013 05:34:26 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rASBYQ9i018997;	Thu, 28 Nov 2013 05:34:26 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Nov 2013 13:32:26 +0200
Message-ID: <1385638346-11618-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 01/14] wpa-supplicant-wl18xx: Update recipe to ol_r8.a8.08 version.
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
X-List-Received-Date: Thu, 28 Nov 2013 11:34:29 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Build wpa-supplicant from TI_Openlink ol_r8.a8.08
- Add missing includes for building with libnl3.
- Adjusted configuration files, and added p2p conf.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../wpa-supplicant/wpa-supplicant-wl18xx/defconfig |  164 ++++--
 ....a6.01.bb => wpa-supplicant-wl18xx_r8.a8.08.bb} |    6 +-
 .../wpa-supplicant/wpa-supplicant.inc              |    3 +
 .../wpa-supplicant/p2p_supplicant.conf             |   14 +
 .../wpa-supplicant/wpa_supplicant.conf             |  674 +-------------------
 5 files changed, 164 insertions(+), 697 deletions(-)
 copy meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-wl18xx_r8.a6.01.bb => wpa-supplicant-wl18xx_r8.a8.08.bb} (89%)
 create mode 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx/defconfig
index b982e2a..f357b79 100755
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx/defconfig
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx/defconfig
@@ -39,18 +39,6 @@
 #LIBS = -lssl
 ###############################################################################
 
-#CC=$(CROSS_COMPILE)gcc
-#CFLAGS += -DCONFIG_LIBNL20
-#CPPFLAGS += -DCONFIG_LIBNL20
-#LIBS += -L$(NFSROOT)/lib -lnl
-#LIBS_p += -L$(NFSROOT)/lib
-#LIBDIR = $(NFSROOT)/lib
-#BINDIR = $(NFSROOT)/usr/sbin
-
-CONFIG_WAPI=y
-CONFIG_LIBNL20=y
-NEED_BGSCAN=y
-CONFIG_BGSCAN_LEARN=y
 
 # Driver interface for Host AP driver
 #CONFIG_DRIVER_HOSTAP=y
@@ -75,7 +63,7 @@ CONFIG_BGSCAN_LEARN=y
 #CONFIG_DRIVER_ATMEL=y
 
 # Driver interface for old Broadcom driver
-# Please note that the newer Broadcom driver ("hybrid Linux driver") supportsBG
+# Please note that the newer Broadcom driver ("hybrid Linux driver") supports
 # Linux wireless extensions and does not need (or even work) with the old
 # driver wrapper. Use CONFIG_DRIVER_WEXT=y with that driver.
 #CONFIG_DRIVER_BROADCOM=y
@@ -90,16 +78,22 @@ CONFIG_BGSCAN_LEARN=y
 #CONFIG_DRIVER_RALINK=y
 
 # Driver interface for generic Linux wireless extensions
-CONFIG_DRIVER_WEXT=y
+# Note: WEXT is deprecated in the current Linux kernel version and no new
+# functionality is added to it. nl80211-based interface is the new
+# replacement for WEXT and its use allows wpa_supplicant to properly control
+# the driver to improve existing functionality like roaming and to support new
+# functionality.
+#CONFIG_DRIVER_WEXT=y
 
 # Driver interface for Linux drivers using the nl80211 kernel interface
 CONFIG_DRIVER_NL80211=y
+CONFIG_LIBNL32=y
 
 # Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
 #CONFIG_DRIVER_BSD=y
 #CFLAGS += -I/usr/local/include
 #LIBS += -L/usr/local/lib
-#LIBS_p += -L/usr/local/libBG
+#LIBS_p += -L/usr/local/lib
 #LIBS_c += -L/usr/local/lib
 
 # Driver interface for Windows NDIS
@@ -121,13 +115,8 @@ CONFIG_DRIVER_NL80211=y
 # Driver interface for development testing
 #CONFIG_DRIVER_TEST=y
 
-# Include client MLME (management frame processing) for test driver
-# This can be used to test MLME operations in hostapd with the test interface.
-# space.
-#CONFIG_CLIENT_MLME=y
-
 # Driver interface for wired Ethernet drivers
-CONFIG_DRIVER_WIRED=y
+#CONFIG_DRIVER_WIRED=y
 
 # Driver interface for the Broadcom RoboSwitch family
 #CONFIG_DRIVER_ROBOSWITCH=y
@@ -163,7 +152,7 @@ CONFIG_EAP_TTLS=y
 # functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL,
 # the OpenSSL library must be patched (openssl-0.9.8d-tls-extensions.patch)
 # to add the needed functions.
-#CONFIG_EAP_FAST=y
+CONFIG_EAP_FAST=y
 
 # EAP-GTC
 CONFIG_EAP_GTC=y
@@ -172,11 +161,14 @@ CONFIG_EAP_GTC=y
 CONFIG_EAP_OTP=y
 
 # EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
-#CONFIG_EAP_SIM=y
+CONFIG_EAP_SIM=y
 
 # EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
 #CONFIG_EAP_PSK=y
 
+# EAP-pwd (secure authentication using only a password)
+CONFIG_EAP_PWD=y
+
 # EAP-PAX
 #CONFIG_EAP_PAX=y
 
@@ -208,6 +200,11 @@ CONFIG_EAP_LEAP=y
 CONFIG_WPS=y
 # Enable WSC 2.0 support
 CONFIG_WPS2=y
+# Enable WPS external registrar functionality
+#CONFIG_WPS_ER=y
+# Disable credentials for an open network by default when acting as a WPS
+# registrar.
+#CONFIG_WPS_REG_DISABLE_OPEN=y
 
 # EAP-IKEv2
 #CONFIG_EAP_IKEV2=y
@@ -224,7 +221,10 @@ CONFIG_SMARTCARD=y
 # Enable this if EAP-SIM or EAP-AKA is included
 #CONFIG_PCSC=y
 
-# Development testingBG
+# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
+#CONFIG_HT_OVERRIDES=y
+
+# Development testing
 #CONFIG_EAPOL_TEST=y
 
 # Select control interface backend for external programs, e.g, wpa_cli:
@@ -242,6 +242,10 @@ CONFIG_CTRL_IFACE=y
 # the resulting binary.
 #CONFIG_READLINE=y
 
+# Include internal line edit mode in wpa_cli. This can be used as a replacement
+# for GNU Readline to provide limited command line editing and history support.
+CONFIG_WPA_CLI_EDIT=y
+
 # Remove debugging code that is printing out debug message to stdout.
 # This can be used to reduce the size of the wpa_supplicant considerably
 # if debugging code is not needed. The size reduction can be around 35%
@@ -295,13 +299,16 @@ CONFIG_BACKEND=file
 # unix = UNIX/POSIX like systems (default)
 # win32 = Windows systems
 # none = Empty template
-#CONFIG_OS=unix
+CONFIG_OS=unix
 
 # Select event loop implementation
 # eloop = select() loop (default)
 # eloop_win = Windows events and WaitForMultipleObject() loop
 # eloop_none = Empty template
-#CONFIG_ELOOP=eloop
+CONFIG_ELOOP=eloop
+
+# Should we use poll instead of select? Select is used by default.
+#CONFIG_ELOOP_POLL=y
 
 # Select layer 2 packet implementation
 # linux = Linux packet socket (default)
@@ -310,7 +317,7 @@ CONFIG_BACKEND=file
 # winpcap = WinPcap with receive thread
 # ndis = Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=y)
 # none = Empty template
-#CONFIG_L2_PACKET=linux
+CONFIG_L2_PACKET=linux
 
 # PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
 CONFIG_PEERKEY=y
@@ -323,18 +330,24 @@ CONFIG_PEERKEY=y
 
 # Select TLS implementation
 # openssl = OpenSSL (default)
-# gnutls = GnuTLS (needed for TLS/IA, see also CONFIG_GNUTLS_EXTRA)
+# gnutls = GnuTLS
 # internal = Internal TLSv1 implementation (experimental)
 # none = Empty template
 #CONFIG_TLS=openssl
 
-# Whether to enable TLS/IA support, which is required for EAP-TTLSv1.
-# You need CONFIG_TLS=gnutls for this to have any effect. Please note that
-# even though the core GnuTLS library is released under LGPL, this extra
-# library uses GPL and as such, the terms of GPL apply to the combination
-# of wpa_supplicant and GnuTLS if this option is enabled. BSD license may not
-# apply for distribution of the resulting binary.
-#CONFIG_GNUTLS_EXTRA=y
+# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.1)
+# can be enabled to get a stronger construction of messages when block ciphers
+# are used. It should be noted that some existing TLS v1.0 -based
+# implementation may not be compatible with TLS v1.1 message (ClientHello is
+# sent prior to negotiating which version will be used)
+#CONFIG_TLSV11=y
+
+# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.2)
+# can be enabled to enable use of stronger crypto algorithms. It should be
+# noted that some existing TLS v1.0 -based implementation may not be compatible
+# with TLS v1.2 message (ClientHello is sent prior to negotiating which version
+# will be used)
+#CONFIG_TLSV12=y
 
 # If CONFIG_TLS=internal is used, additional library and include paths are
 # needed for LibTomMath. Alternatively, an integrated, minimal version of
@@ -360,14 +373,14 @@ CONFIG_PEERKEY=y
 
 # Add support for old DBus control interface
 # (fi.epitest.hostap.WPASupplicant)
-CONFIG_CTRL_IFACE_DBUS=y
+#CONFIG_CTRL_IFACE_DBUS=y
 
 # Add support for new DBus control interface
 # (fi.w1.hostap.wpa_supplicant1)
-CONFIG_CTRL_IFACE_DBUS_NEW=y
+#CONFIG_CTRL_IFACE_DBUS_NEW=y
 
 # Add introspection support for new DBus control interface
-CONFIG_CTRL_IFACE_DBUS_INTRO=y
+#CONFIG_CTRL_IFACE_DBUS_INTRO=y
 
 # Add support for loading EAP methods dynamically as shared libraries.
 # When this option is enabled, each EAP method can be either included
@@ -394,7 +407,22 @@ CONFIG_CTRL_IFACE_DBUS_INTRO=y
 #CONFIG_IEEE80211R=y
 
 # Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#.txt)
-CONFIG_DEBUG_FILE=y
+#CONFIG_DEBUG_FILE=y
+
+# Send debug messages to syslog instead of stdout
+#CONFIG_DEBUG_SYSLOG=y
+# Set syslog facility for debug messages
+#CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
+
+# Add support for sending all debug messages (regardless of debug verbosity)
+# to the Linux kernel tracing facility. This helps debug the entire stack by
+# making it easy to record everything happening from the driver up into the
+# same file, e.g., using trace-cmd.
+#CONFIG_DEBUG_LINUX_TRACING=y
+
+# Add support for writing debug log to Android logcat instead of standard
+# output
+CONFIG_ANDROID_LOG=y
 
 # Enable privilege separation (see README 'Privilege separation' for details)
 #CONFIG_PRIVSEP=y
@@ -407,7 +435,7 @@ CONFIG_DEBUG_FILE=y
 # This tracks use of memory allocations and other registrations and reports
 # incorrect use with a backtrace of call (or allocation) location.
 #CONFIG_WPA_TRACE=y
-# For BSD, comment out these.
+# For BSD, uncomment these.
 #LIBS += -lexecinfo
 #LIBS_p += -lexecinfo
 #LIBS_c += -lexecinfo
@@ -416,15 +444,63 @@ CONFIG_DEBUG_FILE=y
 # This enables use of libbfd to get more detailed symbols for the backtraces
 # generated by CONFIG_WPA_TRACE=y.
 #CONFIG_WPA_TRACE_BFD=y
-# For BSD, comment out these.
+# For BSD, uncomment these.
 #LIBS += -lbfd -liberty -lz
 #LIBS_p += -lbfd -liberty -lz
 #LIBS_c += -lbfd -liberty -lz
 
-# for p2p
+# wpa_supplicant depends on strong random number generation being available
+# from the operating system. os_get_random() function is used to fetch random
+# data when needed, e.g., for key generation. On Linux and BSD systems, this
+# works by reading /dev/urandom. It should be noted that the OS entropy pool
+# needs to be properly initialized before wpa_supplicant is started. This is
+# important especially on embedded devices that do not have a hardware random
+# number generator and may by default start up with minimal entropy available
+# for random number generation.
+#
+# As a safety net, wpa_supplicant is by default trying to internally collect
+# additional entropy for generating random data to mix in with the data fetched
+# from the OS. This by itself is not considered to be very strong, but it may
+# help in cases where the system pool is not initialized properly. However, it
+# is very strongly recommended that the system pool is initialized with enough
+# entropy either by using hardware assisted random number generator or by
+# storing state over device reboots.
+#
+# wpa_supplicant can be configured to maintain its own entropy store over
+# restarts to enhance random number generation. This is not perfect, but it is
+# much more secure than using the same sequence of random numbers after every
+# reboot. This can be enabled with -e<entropy file> command line option. The
+# specified file needs to be readable and writable by wpa_supplicant.
+#
+# If the os_get_random() is known to provide strong random data (e.g., on
+# Linux/BSD, the board in question is known to have reliable source of random
+# data from /dev/urandom), the internal wpa_supplicant random pool can be
+# disabled. This will save some in binary size and CPU use. However, this
+# should only be considered for builds that are known to be used on devices
+# that meet the requirements described above.
+#CONFIG_NO_RANDOM_POOL=y
+
+# IEEE 802.11n (High Throughput) support (mainly for AP mode)
+CONFIG_IEEE80211N=y
+
+# Interworking (IEEE 802.11u)
+# This can be used to enable functionality to improve interworking with
+# external networks (GAS/ANQP to learn more about the networks and network
+# selection based on available credentials).
+CONFIG_INTERWORKING=y
+
+# Hotspot 2.0
+CONFIG_HS20=y
+
+# Disable roaming in wpa_supplicant
+#CONFIG_NO_ROAMING=y
+
+# Enable P2P
 CONFIG_P2P=y
 CONFIG_AP=y
 
-# IEEE 802.11n (High Throughput) support
-CONFIG_IEEE80211N=y
+# bgscan
+NEED_BGSCAN=y
+CONFIG_BGSCAN_LEARN=y
+CONFIG_BGSCAN_SIMPLE=y
 
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.08.bb
similarity index 89%
copy from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb
copy to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.08.bb
index f6c4f70..d9a9fde 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.08.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
 
 FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
 
-# Tag: ol_r8.a6.01
-SRCREV = "7190ff7dbd43243290b626068ded0d61c5019050"
-PR = "r2+gitr${SRCPV}"
+# Tag: ol_r8.a8.08
+SRCREV = "257ab333aad993b4be81808524bc0d939c276058"
+PR = "r0+gitr${SRCPV}"
 
 # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
 PV = "2.0-devel-ti"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 2d8970f..ef40a83 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
            file://defaults-sane \
            file://wpa-supplicant.sh \
            file://wpa_supplicant.conf \
+           file://p2p_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
            file://wpa_supplicant.conf \
@@ -55,6 +56,7 @@ do_install () {
 	install -d ${D}${sysconfdir}/default
 	install -m 600 ${WORKDIR}/defaults-sane ${D}${sysconfdir}/default/wpa
 	install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant.conf
+        install -m 600 ${WORKDIR}/p2p_supplicant.conf ${D}${sysconfdir}/p2p_supplicant.conf
 
 	if grep -q ^CONFIG_CTRL_IFACE_DBUS=y .config || grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=y .config; then
 		install -d ${D}/${sysconfdir}/dbus-1/system.d
@@ -104,6 +106,7 @@ pkg_postinst_wpa-supplicant () {
 do_configure () {
 	install -m 0755 ${WORKDIR}/defconfig .config
 	echo "CFLAGS += -I${STAGING_INCDIR}" >> .config
+        echo "CFLAGS += -I${STAGING_INCDIR}/libnl3/" >> .config
 	echo "LIBS += -L${STAGING_LIBDIR}" >> .config
 	echo "LIBS_p += -L${STAGING_LIBDIR}" >> .config
 	if [ "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0, d)}" = "1" ]; then
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
new file mode 100755
index 0000000..2de8730
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
@@ -0,0 +1,14 @@
+ctrl_interface=/var/run/wpa_supplicant
+update_config=0
+device_name=TI-SITARA-P2P
+device_type=1-0050F204-1
+config_methods=virtual_push_button physical_display keypad
+p2p_go_intent=0
+country=US
+##p2p_pref_chan=115:36 115:40
+driver_param=use_multi_chan_concurrent=1 use_p2p_group_interface=1
+p2p_go_max_inactivity=60
+p2p_go_ht40=1
+p2p_multi_chan=1
+disassoc_low_ack=1
+concurrent_sched_scan=1
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
index f0c993d..f144a38 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
@@ -1,19 +1,4 @@
-##### Example wpa_supplicant configuration file ###############################
-#
-# This file describes configuration file format and lists all available option.
-# Please also take a look at simpler configuration examples in 'examples'
-# subdirectory.
-#
-# Empty lines and lines starting with # are ignored
-
-# NOTE! This file may contain password information and should probably be made
-# readable only by root user on multiuser systems.
-
-# Note: All file paths in this configuration file should use full (absolute,
-# not relative to working directory) path in order to allow working directory
-# to be changed. This can happen if wpa_supplicant is run in the background.
-
-# Whether to allow wpa_supplicant to update (overwrite) configuration
+##### wpa_supplicant configuration file template #####
 #
 # This option can be used to allow wpa_supplicant to overwrite configuration
 # file whenever configuration is changed (e.g., new network block is added with
@@ -21,59 +6,8 @@
 # wpa_cli/wpa_gui to be able to store the configuration changes permanently.
 # Please note that overwriting configuration file will remove the comments from
 # it.
-#update_config=1
-
-# global configuration (shared by all network blocks)
-#
-# Parameters for the control interface. If this is specified, wpa_supplicant
-# will open a control interface that is available for external programs to
-# manage wpa_supplicant. The meaning of this string depends on which control
-# interface mechanism is used. For all cases, the existance of this parameter
-# in configuration is used to determine whether the control interface is
-# enabled.
-#
-# For UNIX domain sockets (default on Linux and BSD): This is a directory that
-# will be created for UNIX domain sockets for listening to requests from
-# external programs (CLI/GUI, etc.) for status information and configuration.
-# The socket file will be named based on the interface name, so multiple
-# wpa_supplicant processes can be run at the same time if more than one
-# interface is used.
-# /var/run/wpa_supplicant is the recommended directory for sockets and by
-# default, wpa_cli will use it when trying to connect with wpa_supplicant.
-#
-# Access control for the control interface can be configured by setting the
-# directory to allow only members of a group to use sockets. This way, it is
-# possible to run wpa_supplicant as root (since it needs to change network
-# configuration and open raw sockets) and still allow GUI/CLI components to be
-# run as non-root users. However, since the control interface can be used to
-# change the network configuration, this access needs to be protected in many
-# cases. By default, wpa_supplicant is configured to use gid 0 (root). If you
-# want to allow non-root users to use the control interface, add a new group
-# and change this value to match with that group. Add users that should have
-# control interface access to this group. If this variable is commented out or
-# not included in the configuration file, group will not be changed from the
-# value it got by default when the directory or socket was created.
-#
-# When configuring both the directory and group, use following format:
-# DIR=/var/run/wpa_supplicant GROUP=wheel
-# DIR=/var/run/wpa_supplicant GROUP=0
-# (group can be either group name or gid)
-#
-# For UDP connections (default on Windows): The value will be ignored. This
-# variable is just used to select that the control interface is to be created.
-# The value can be set to, e.g., udp (ctrl_interface=udp)
-#
-# For Windows Named Pipe: This value can be used to set the security descriptor
-# for controlling access to the control interface. Security descriptor can be
-# set using Security Descriptor String Format (see http://msdn.microsoft.com/
-# library/default.asp?url=/library/en-us/secauthz/security/
-# security_descriptor_string_format.asp). The descriptor string needs to be
-# prefixed with SDDL=. For example, ctrl_interface=SDDL=D: would set an empty
-# DACL (which will reject all connections). See README-Windows.txt for more
-# information about SDDL string format.
-#
+update_config=1
 ctrl_interface=/var/run/wpa_supplicant
-
 # IEEE 802.1X/EAPOL version
 # wpa_supplicant is implemented based on IEEE Std 802.1X-2004 which defines
 # EAPOL version 2. However, there are many APs that do not handle the new
@@ -82,14 +16,15 @@ ctrl_interface=/var/run/wpa_supplicant
 # to 1 by default. This configuration value can be used to set it to the new
 # version (2).
 eapol_version=1
-
 # AP scanning/selection
 # By default, wpa_supplicant requests driver to perform AP scanning and then
 # uses the scan results to select a suitable AP. Another alternative is to
 # allow the driver to take care of AP scanning and selection and use
 # wpa_supplicant just to process EAPOL frames based on IEEE 802.11 association
 # information from the driver.
-# 1: wpa_supplicant initiates scanning and AP selection
+# 1: wpa_supplicant initiates scanning and AP selection; if no APs matching to
+#    the currently enabled networks are found, a new network (IBSS or AP mode
+#    operation) may be initialized (if configured) (default)
 # 0: driver takes care of scanning, AP selection, and IEEE 802.11 association
 #    parameters (e.g., WPA IE generation); this mode can also be used with
 #    non-WPA drivers when using IEEE 802.1X mode; do not try to associate with
@@ -102,589 +37,28 @@ eapol_version=1
 #    the driver reports successful association; each network block should have
 #    explicit security policy (i.e., only one option in the lists) for
 #    key_mgmt, pairwise, group, proto variables
+# When using IBSS or AP mode, ap_scan=2 mode can force the new network to be
+# created immediately regardless of scan results. ap_scan=1 mode will first try
+# to scan for existing networks and only if no matches with the enabled
+# networks are found, a new IBSS or AP mode network is created.
 ap_scan=1
-
 # EAP fast re-authentication
 # By default, fast re-authentication is enabled for all EAP methods that
 # support it. This variable can be used to disable fast re-authentication.
 # Normally, there is no need to disable this.
 fast_reauth=1
-
-# OpenSSL Engine support
-# These options can be used to load OpenSSL engines.
-# The two engines that are supported currently are shown below:
-# They are both from the opensc project (http://www.opensc.org/)
-# By default no engines are loaded.
-# make the opensc engine available
-#opensc_engine_path=/usr/lib/opensc/engine_opensc.so
-# make the pkcs11 engine available
-#pkcs11_engine_path=/usr/lib/opensc/engine_pkcs11.so
-# configure the path to the pkcs11 module required by the pkcs11 engine
-#pkcs11_module_path=/usr/lib/pkcs11/opensc-pkcs11.so
-
-# Dynamic EAP methods
-# If EAP methods were built dynamically as shared object files, they need to be
-# loaded here before being used in the network blocks. By default, EAP methods
-# are included statically in the build, so these lines are not needed
-#load_dynamic_eap=/usr/lib/wpa_supplicant/eap_tls.so
-#load_dynamic_eap=/usr/lib/wpa_supplicant/eap_md5.so
-
-# Driver interface parameters
-# This field can be used to configure arbitrary driver interace parameters. The
-# format is specific to the selected driver interface. This field is not used
-# in most cases.
-#driver_param="field=value"
-
-# Maximum lifetime for PMKSA in seconds; default 43200
-#dot11RSNAConfigPMKLifetime=43200
-# Threshold for reauthentication (percentage of PMK lifetime); default 70
-#dot11RSNAConfigPMKReauthThreshold=70
-# Timeout for security association negotiation in seconds; default 60
-#dot11RSNAConfigSATimeout=60
-
-# network block
-#
-# Each network (usually AP's sharing the same SSID) is configured as a separate
-# block in this configuration file. The network blocks are in preference order
-# (the first match is used).
-#
-# network block fields:
-#
-# disabled:
-#	0 = this network can be used (default)
-#	1 = this network block is disabled (can be enabled through ctrl_iface,
-#	    e.g., with wpa_cli or wpa_gui)
-#
-# id_str: Network identifier string for external scripts. This value is passed
-#	to external action script through wpa_cli as WPA_ID_STR environment
-#	variable to make it easier to do network specific configuration.
-#
-# ssid: SSID (mandatory); either as an ASCII string with double quotation or
-#	as hex string; network name
-#
-# scan_ssid:
-#	0 = do not scan this SSID with specific Probe Request frames (default)
-#	1 = scan with SSID-specific Probe Request frames (this can be used to
-#	    find APs that do not accept broadcast SSID or use multiple SSIDs;
-#	    this will add latency to scanning, so enable this only when needed)
-#
-# bssid: BSSID (optional); if set, this network block is used only when
-#	associating with the AP using the configured BSSID
-#
-# priority: priority group (integer)
-# By default, all networks will get same priority group (0). If some of the
-# networks are more desirable, this field can be used to change the order in
-# which wpa_supplicant goes through the networks when selecting a BSS. The
-# priority groups will be iterated in decreasing priority (i.e., the larger the
-# priority value, the sooner the network is matched against the scan results).
-# Within each priority group, networks will be selected based on security
-# policy, signal strength, etc.
-# Please note that AP scanning with scan_ssid=1 and ap_scan=2 mode are not
-# using this priority to select the order for scanning. Instead, they try the
-# networks in the order that used in the configuration file.
-#
-# mode: IEEE 802.11 operation mode
-# 0 = infrastructure (Managed) mode, i.e., associate with an AP (default)
-# 1 = IBSS (ad-hoc, peer-to-peer)
-# Note: IBSS can only be used with key_mgmt NONE (plaintext and static WEP)
-# and key_mgmt=WPA-NONE (fixed group key TKIP/CCMP). In addition, ap_scan has
-# to be set to 2 for IBSS. WPA-None requires following network block options:
-# proto=WPA, key_mgmt=WPA-NONE, pairwise=NONE, group=TKIP (or CCMP, but not
-# both), and psk must also be set.
-#
-# proto: list of accepted protocols
-# WPA = WPA/IEEE 802.11i/D3.0
-# RSN = WPA2/IEEE 802.11i (also WPA2 can be used as an alias for RSN)
-# If not set, this defaults to: WPA RSN
-#
-# key_mgmt: list of accepted authenticated key management protocols
-# WPA-PSK = WPA pre-shared key (this requires 'psk' field)
-# WPA-EAP = WPA using EAP authentication (this can use an external
-#	program, e.g., Xsupplicant, for IEEE 802.1X EAP Authentication
-# IEEE8021X = IEEE 802.1X using EAP authentication and (optionally) dynamically
-#	generated WEP keys
-# NONE = WPA is not used; plaintext or static WEP could be used
-# If not set, this defaults to: WPA-PSK WPA-EAP
-#
-# auth_alg: list of allowed IEEE 802.11 authentication algorithms
-# OPEN = Open System authentication (required for WPA/WPA2)
-# SHARED = Shared Key authentication (requires static WEP keys)
-# LEAP = LEAP/Network EAP (only used with LEAP)
-# If not set, automatic selection is used (Open System with LEAP enabled if
-# LEAP is allowed as one of the EAP methods).
-#
-# pairwise: list of accepted pairwise (unicast) ciphers for WPA
-# CCMP = AES in Counter mode with CBC-MAC [RFC 3610, IEEE 802.11i/D7.0]
-# TKIP = Temporal Key Integrity Protocol [IEEE 802.11i/D7.0]
-# NONE = Use only Group Keys (deprecated, should not be included if APs support
-#	pairwise keys)
-# If not set, this defaults to: CCMP TKIP
-#
-# group: list of accepted group (broadcast/multicast) ciphers for WPA
-# CCMP = AES in Counter mode with CBC-MAC [RFC 3610, IEEE 802.11i/D7.0]
-# TKIP = Temporal Key Integrity Protocol [IEEE 802.11i/D7.0]
-# WEP104 = WEP (Wired Equivalent Privacy) with 104-bit key
-# WEP40 = WEP (Wired Equivalent Privacy) with 40-bit key [IEEE 802.11]
-# If not set, this defaults to: CCMP TKIP WEP104 WEP40
-#
-# psk: WPA preshared key; 256-bit pre-shared key
-# The key used in WPA-PSK mode can be entered either as 64 hex-digits, i.e.,
-# 32 bytes or as an ASCII passphrase (in which case, the real PSK will be
-# generated using the passphrase and SSID). ASCII passphrase must be between
-# 8 and 63 characters (inclusive).
-# This field is not needed, if WPA-EAP is used.
-# Note: Separate tool, wpa_passphrase, can be used to generate 256-bit keys
-# from ASCII passphrase. This process uses lot of CPU and wpa_supplicant
-# startup and reconfiguration time can be optimized by generating the PSK only
-# only when the passphrase or SSID has actually changed.
-#
-# eapol_flags: IEEE 802.1X/EAPOL options (bit field)
-# Dynamic WEP key required for non-WPA mode
-# bit0 (1): require dynamically generated unicast WEP key
-# bit1 (2): require dynamically generated broadcast WEP key
-# 	(3 = require both keys; default)
-# Note: When using wired authentication, eapol_flags must be set to 0 for the
-# authentication to be completed successfully.
-#
-# proactive_key_caching:
-# Enable/disable opportunistic PMKSA caching for WPA2.
-# 0 = disabled (default)
-# 1 = enabled
-#
-# wep_key0..3: Static WEP key (ASCII in double quotation, e.g. "abcde" or
-# hex without quotation, e.g., 0102030405)
-# wep_tx_keyidx: Default WEP key index (TX) (0..3)
-#
-# peerkey: Whether PeerKey negotiation for direct links (IEEE 802.11e DLS) is
-# allowed. This is only used with RSN/WPA2.
-# 0 = disabled (default)
-# 1 = enabled
-#peerkey=1
-#
-# Following fields are only used with internal EAP implementation.
-# eap: space-separated list of accepted EAP methods
-#	MD5 = EAP-MD5 (unsecure and does not generate keying material ->
-#			cannot be used with WPA; to be used as a Phase 2 method
-#			with EAP-PEAP or EAP-TTLS)
-#       MSCHAPV2 = EAP-MSCHAPv2 (cannot be used separately with WPA; to be used
-#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
-#       OTP = EAP-OTP (cannot be used separately with WPA; to be used
-#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
-#       GTC = EAP-GTC (cannot be used separately with WPA; to be used
-#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
-#	TLS = EAP-TLS (client and server certificate)
-#	PEAP = EAP-PEAP (with tunnelled EAP authentication)
-#	TTLS = EAP-TTLS (with tunnelled EAP or PAP/CHAP/MSCHAP/MSCHAPV2
-#			 authentication)
-#	If not set, all compiled in methods are allowed.
-#
-# identity: Identity string for EAP
-# anonymous_identity: Anonymous identity string for EAP (to be used as the
-#	unencrypted identity with EAP types that support different tunnelled
-#	identity, e.g., EAP-TTLS)
-# password: Password string for EAP
-# ca_cert: File path to CA certificate file (PEM/DER). This file can have one
-#	or more trusted CA certificates. If ca_cert and ca_path are not
-#	included, server certificate will not be verified. This is insecure and
-#	a trusted CA certificate should always be configured when using
-#	EAP-TLS/TTLS/PEAP. Full path should be used since working directory may
-#	change when wpa_supplicant is run in the background.
-#	On Windows, trusted CA certificates can be loaded from the system
-#	certificate store by setting this to cert_store://<name>, e.g.,
-#	ca_cert="cert_store://CA" or ca_cert="cert_store://ROOT".
-#	Note that when running wpa_supplicant as an application, the user
-#	certificate store (My user account) is used, whereas computer store
-#	(Computer account) is used when running wpasvc as a service.
-# ca_path: Directory path for CA certificate files (PEM). This path may
-#	contain multiple CA certificates in OpenSSL format. Common use for this
-#	is to point to system trusted CA list which is often installed into
-#	directory like /etc/ssl/certs. If configured, these certificates are
-#	added to the list of trusted CAs. ca_cert may also be included in that
-#	case, but it is not required.
-# client_cert: File path to client certificate file (PEM/DER)
-#	Full path should be used since working directory may change when
-#	wpa_supplicant is run in the background.
-#	Alternatively, a named configuration blob can be used by setting this
-#	to blob://<blob name>.
-# private_key: File path to client private key file (PEM/DER/PFX)
-#	When PKCS#12/PFX file (.p12/.pfx) is used, client_cert should be
-#	commented out. Both the private key and certificate will be read from
-#	the PKCS#12 file in this case. Full path should be used since working
-#	directory may change when wpa_supplicant is run in the background.
-#	Windows certificate store can be used by leaving client_cert out and
-#	configuring private_key in one of the following formats:
-#	cert://substring_to_match
-#	hash://certificate_thumbprint_in_hex
-#	for example: private_key="hash://63093aa9c47f56ae88334c7b65a4"
-#	Note that when running wpa_supplicant as an application, the user
-#	certificate store (My user account) is used, whereas computer store
-#	(Computer account) is used when running wpasvc as a service.
-#	Alternatively, a named configuration blob can be used by setting this
-#	to blob://<blob name>.
-# private_key_passwd: Password for private key file (if left out, this will be
-#	asked through control interface)
-# dh_file: File path to DH/DSA parameters file (in PEM format)
-#	This is an optional configuration file for setting parameters for an
-#	ephemeral DH key exchange. In most cases, the default RSA
-#	authentication does not use this configuration. However, it is possible
-#	setup RSA to use ephemeral DH key exchange. In addition, ciphers with
-#	DSA keys always use ephemeral DH keys. This can be used to achieve
-#	forward secrecy. If the file is in DSA parameters format, it will be
-#	automatically converted into DH params.
-# subject_match: Substring to be matched against the subject of the
-#	authentication server certificate. If this string is set, the server
-#	sertificate is only accepted if it contains this string in the subject.
-#	The subject string is in following format:
-#	/C=US/ST=CA/L=San Francisco/CN=Test AS/emailAddress=as@example.com
-# altsubject_match: Semicolon separated string of entries to be matched against
-#	the alternative subject name of the authentication server certificate.
-#	If this string is set, the server sertificate is only accepted if it
-#	contains one of the entries in an alternative subject name extension.
-#	altSubjectName string is in following format: TYPE:VALUE
-#	Example: EMAIL:server@example.com
-#	Example: DNS:server.example.com;DNS:server2.example.com
-#	Following types are supported: EMAIL, DNS, URI
-# phase1: Phase1 (outer authentication, i.e., TLS tunnel) parameters
-#	(string with field-value pairs, e.g., "peapver=0" or
-#	"peapver=1 peaplabel=1")
-#	'peapver' can be used to force which PEAP version (0 or 1) is used.
-#	'peaplabel=1' can be used to force new label, "client PEAP encryption",
-#	to be used during key derivation when PEAPv1 or newer. Most existing
-#	PEAPv1 implementation seem to be using the old label, "client EAP
-#	encryption", and wpa_supplicant is now using that as the default value.
-#	Some servers, e.g., Radiator, may require peaplabel=1 configuration to
-#	interoperate with PEAPv1; see eap_testing.txt for more details.
-#	'peap_outer_success=0' can be used to terminate PEAP authentication on
-#	tunneled EAP-Success. This is required with some RADIUS servers that
-#	implement draft-josefsson-pppext-eap-tls-eap-05.txt (e.g.,
-#	Lucent NavisRadius v4.4.0 with PEAP in "IETF Draft 5" mode)
-#	include_tls_length=1 can be used to force wpa_supplicant to include
-#	TLS Message Length field in all TLS messages even if they are not
-#	fragmented.
-#	sim_min_num_chal=3 can be used to configure EAP-SIM to require three
-#	challenges (by default, it accepts 2 or 3)
-# phase2: Phase2 (inner authentication with TLS tunnel) parameters
-#	(string with field-value pairs, e.g., "auth=MSCHAPV2" for EAP-PEAP or
-#	"autheap=MSCHAPV2 autheap=MD5" for EAP-TTLS)
-# Following certificate/private key fields are used in inner Phase2
-# authentication when using EAP-TTLS or EAP-PEAP.
-# ca_cert2: File path to CA certificate file. This file can have one or more
-#	trusted CA certificates. If ca_cert2 and ca_path2 are not included,
-#	server certificate will not be verified. This is insecure and a trusted
-#	CA certificate should always be configured.
-# ca_path2: Directory path for CA certificate files (PEM)
-# client_cert2: File path to client certificate file
-# private_key2: File path to client private key file
-# private_key2_passwd: Password for private key file
-# dh_file2: File path to DH/DSA parameters file (in PEM format)
-# subject_match2: Substring to be matched against the subject of the
-#	authentication server certificate.
-# altsubject_match2: Substring to be matched against the alternative subject
-#	name of the authentication server certificate.
-#
-# fragment_size: Maximum EAP fragment size in bytes (default 1398).
-#	This value limits the fragment size for EAP methods that support
-#	fragmentation (e.g., EAP-TLS and EAP-PEAP). This value should be set
-#	small enough to make the EAP messages fit in MTU of the network
-#	interface used for EAPOL. The default value is suitable for most
-#	cases.
-#
-# EAP-PSK variables:
-# eappsk: 16-byte (128-bit, 32 hex digits) pre-shared key in hex format
-# nai: user NAI
-#
-# EAP-PAX variables:
-# eappsk: 16-byte (128-bit, 32 hex digits) pre-shared key in hex format
-#
-# EAP-SAKE variables:
-# eappsk: 32-byte (256-bit, 64 hex digits) pre-shared key in hex format
-#	(this is concatenation of Root-Secret-A and Root-Secret-B)
-# nai: user NAI (PEERID)
-#
-# EAP-GPSK variables:
-# eappsk: Pre-shared key in hex format (at least 128 bits, i.e., 32 hex digits)
-# nai: user NAI (ID_Client)
-#
-# EAP-FAST variables:
-# pac_file: File path for the PAC entries. wpa_supplicant will need to be able
-#	to create this file and write updates to it when PAC is being
-#	provisioned or refreshed. Full path to the file should be used since
-#	working directory may change when wpa_supplicant is run in the
-#	background. Alternatively, a named configuration blob can be used by
-#	setting this to blob://<blob name>
-# phase1: fast_provisioning=1 option enables in-line provisioning of EAP-FAST
-#	credentials (PAC)
-#
-# wpa_supplicant supports number of "EAP workarounds" to work around
-# interoperability issues with incorrectly behaving authentication servers.
-# These are enabled by default because some of the issues are present in large
-# number of authentication servers. Strict EAP conformance mode can be
-# configured by disabling workarounds with eap_workaround=0.
-
-# Example blocks:
-
-# Simple case: WPA-PSK, PSK as an ASCII passphrase, allow all valid ciphers
-network={
-	ssid="simple"
-	psk="very secret passphrase"
-	priority=5
-}
-
-# Same as previous, but request SSID-specific scanning (for APs that reject
-# broadcast SSID)
-network={
-	ssid="second ssid"
-	scan_ssid=1
-	psk="very secret passphrase"
-	priority=2
-}
-
-# Only WPA-PSK is used. Any valid cipher combination is accepted.
-network={
-	ssid="example"
-	proto=WPA
-	key_mgmt=WPA-PSK
-	pairwise=CCMP TKIP
-	group=CCMP TKIP WEP104 WEP40
-	psk=06b4be19da289f475aa46a33cb793029d4ab3db7a23ee92382eb0106c72ac7bb
-	priority=2
-}
-
-# Only WPA-EAP is used. Both CCMP and TKIP is accepted. An AP that used WEP104
-# or WEP40 as the group cipher will not be accepted.
-network={
-	ssid="example"
-	proto=RSN
-	key_mgmt=WPA-EAP
-	pairwise=CCMP TKIP
-	group=CCMP TKIP
-	eap=TLS
-	identity="user@example.com"
-	ca_cert="/etc/cert/ca.pem"
-	client_cert="/etc/cert/user.pem"
-	private_key="/etc/cert/user.prv"
-	private_key_passwd="password"
-	priority=1
-}
-
-# EAP-PEAP/MSCHAPv2 configuration for RADIUS servers that use the new peaplabel
-# (e.g., Radiator)
-network={
-	ssid="example"
-	key_mgmt=WPA-EAP
-	eap=PEAP
-	identity="user@example.com"
-	password="foobar"
-	ca_cert="/etc/cert/ca.pem"
-	phase1="peaplabel=1"
-	phase2="auth=MSCHAPV2"
-	priority=10
-}
-
-# EAP-TTLS/EAP-MD5-Challenge configuration with anonymous identity for the
-# unencrypted use. Real identity is sent only within an encrypted TLS tunnel.
-network={
-	ssid="example"
-	key_mgmt=WPA-EAP
-	eap=TTLS
-	identity="user@example.com"
-	anonymous_identity="anonymous@example.com"
-	password="foobar"
-	ca_cert="/etc/cert/ca.pem"
-	priority=2
-}
-
-# EAP-TTLS/MSCHAPv2 configuration with anonymous identity for the unencrypted
-# use. Real identity is sent only within an encrypted TLS tunnel.
-network={
-	ssid="example"
-	key_mgmt=WPA-EAP
-	eap=TTLS
-	identity="user@example.com"
-	anonymous_identity="anonymous@example.com"
-	password="foobar"
-	ca_cert="/etc/cert/ca.pem"
-	phase2="auth=MSCHAPV2"
-}
-
-# WPA-EAP, EAP-TTLS with different CA certificate used for outer and inner
-# authentication.
-network={
-	ssid="example"
-	key_mgmt=WPA-EAP
-	eap=TTLS
-	# Phase1 / outer authentication
-	anonymous_identity="anonymous@example.com"
-	ca_cert="/etc/cert/ca.pem"
-	# Phase 2 / inner authentication
-	phase2="autheap=TLS"
-	ca_cert2="/etc/cert/ca2.pem"
-	client_cert2="/etc/cer/user.pem"
-	private_key2="/etc/cer/user.prv"
-	private_key2_passwd="password"
-	priority=2
-}
-
-# Both WPA-PSK and WPA-EAP is accepted. Only CCMP is accepted as pairwise and
-# group cipher.
-network={
-	ssid="example"
-	bssid=00:11:22:33:44:55
-	proto=WPA RSN
-	key_mgmt=WPA-PSK WPA-EAP
-	pairwise=CCMP
-	group=CCMP
-	psk=06b4be19da289f475aa46a33cb793029d4ab3db7a23ee92382eb0106c72ac7bb
-}
-
-# Special characters in SSID, so use hex string. Default to WPA-PSK, WPA-EAP
-# and all valid ciphers.
-network={
-	ssid=00010203
-	psk=000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f
-}
-
-
-# IEEE 802.1X/EAPOL with dynamically generated WEP keys (i.e., no WPA) using
-# EAP-TLS for authentication and key generation; require both unicast and
-# broadcast WEP keys.
-network={
-	ssid="1x-test"
-	key_mgmt=IEEE8021X
-	eap=TLS
-	identity="user@example.com"
-	ca_cert="/etc/cert/ca.pem"
-	client_cert="/etc/cert/user.pem"
-	private_key="/etc/cert/user.prv"
-	private_key_passwd="password"
-	eapol_flags=3
-}
-
-
-# LEAP with dynamic WEP keys
-network={
-	ssid="leap-example"
-	key_mgmt=IEEE8021X
-	eap=LEAP
-	identity="user"
-	password="foobar"
-}
-
-# Plaintext connection (no WPA, no IEEE 802.1X)
-network={
-	ssid="plaintext-test"
-	key_mgmt=NONE
-}
-
-
-# Shared WEP key connection (no WPA, no IEEE 802.1X)
-network={
-	ssid="static-wep-test"
-	key_mgmt=NONE
-	wep_key0="abcde"
-	wep_key1=0102030405
-	wep_key2="1234567890123"
-	wep_tx_keyidx=0
-	priority=5
-}
-
-
-# Shared WEP key connection (no WPA, no IEEE 802.1X) using Shared Key
-# IEEE 802.11 authentication
-network={
-	ssid="static-wep-test2"
-	key_mgmt=NONE
-	wep_key0="abcde"
-	wep_key1=0102030405
-	wep_key2="1234567890123"
-	wep_tx_keyidx=0
-	priority=5
-	auth_alg=SHARED
-}
-
-
-# IBSS/ad-hoc network with WPA-None/TKIP.
-network={
-	ssid="test adhoc"
-	mode=1
-	proto=WPA
-	key_mgmt=WPA-NONE
-	pairwise=NONE
-	group=TKIP
-	psk="secret passphrase"
-}
-
-
-# Catch all example that allows more or less all configuration modes
-network={
-	ssid="example"
-	scan_ssid=1
-	key_mgmt=WPA-EAP WPA-PSK IEEE8021X NONE
-	pairwise=CCMP TKIP
-	group=CCMP TKIP WEP104 WEP40
-	psk="very secret passphrase"
-	eap=TTLS PEAP TLS
-	identity="user@example.com"
-	password="foobar"
-	ca_cert="/etc/cert/ca.pem"
-	client_cert="/etc/cert/user.pem"
-	private_key="/etc/cert/user.prv"
-	private_key_passwd="password"
-	phase1="peaplabel=0"
-}
-
-# Example of EAP-TLS with smartcard (openssl engine)
-network={
-	ssid="example"
-	key_mgmt=WPA-EAP
-	eap=TLS
-	proto=RSN
-	pairwise=CCMP TKIP
-	group=CCMP TKIP
-	identity="user@example.com"
-	ca_cert="/etc/cert/ca.pem"
-	client_cert="/etc/cert/user.pem"
-
-	engine=1
-
-	# The engine configured here must be available. Look at
-	# OpenSSL engine support in the global section.
-	# The key available through the engine must be the private key
-	# matching the client certificate configured above.
-
-	# use the opensc engine
-	#engine_id="opensc"
-	#key_id="45"
-
-	# use the pkcs11 engine
-	engine_id="pkcs11"
-	key_id="id_45"
-
-	# Optional PIN configuration; this can be left out and PIN will be
-	# asked through the control interface
-	pin="1234"
-}
-
-# Example configuration showing how to use an inlined blob as a CA certificate
-# data instead of using external file
-network={
-	ssid="example"
-	key_mgmt=WPA-EAP
-	eap=TTLS
-	identity="user@example.com"
-	anonymous_identity="anonymous@example.com"
-	password="foobar"
-	ca_cert="blob://exampleblob"
-	priority=20
-}
-
-blob-base64-exampleblob={
-SGVsbG8gV29ybGQhCg==
-}
-
-
-# Wildcard match for SSID (plaintext APs only). This example select any
-# open AP regardless of its SSID.
-network={
-	key_mgmt=NONE
-}
+device_name=Blaze
+manufacturer=TI
+model_name=Wilink
+model_number=wl18xx
+serial_number=12345
+driver_param=use_multi_chan_concurrent=1 use_p2p_group_interface=1
+# Timeout in seconds to detect STA inactivity (default: 300 seconds)
+#
+# This timeout value is used in P2P GO mode to clean up
+# inactive stations.
+p2p_go_max_inactivity=60
+p2p_go_ht40=1
+p2p_multi_chan=1
+disassoc_low_ack=1
+concurrent_sched_scan=1
-- 
1.7.9


