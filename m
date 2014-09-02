Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C4BB952ABE
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 10:55:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82AtBjQ009459
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:11 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AtBxb032088
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:11 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 05:55:10 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AsrZG026077;
	Tue, 2 Sep 2014 05:55:09 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Sep 2014 16:24:35 +0530
Message-ID: <1409655283-4899-5-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409655283-4899-1-git-send-email-a0393906@ti.com>
References: <1409655283-4899-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH 04/12] wpa-supplicant-wl18xx: Update recipe to ol_r8.a9.14 version.
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
X-List-Received-Date: Tue, 02 Sep 2014 10:55:12 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Changed git sources to git.ti.com
        - Adjust configuration to match latest package.
        - Removed redundant files and cleanup.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Tested-by: Karthik Ramanan <a0393906@ti.com>
---
 .../wpa-supplicant/wpa-supplicant-wl18xx/defconfig | 506 -------------------
 .../wpa-supplicant-wl18xx_r8.a8.10.bb              |  25 -
 .../wpa-supplicant-wl18xx_r8.a9.14.bb              |  25 +
 .../wpa-supplicant/wpa-supplicant.inc              |  91 ++--
 .../wpa-supplicant/wpa-supplicant/defaults-sane    |   8 -
 .../wpa-supplicant/wpa-supplicant/defconfig        | 543 +++++++++++++++++++++
 .../fi.epitest.hostap.WPASupplicant.service        |   4 -
 .../wpa-supplicant/fi.w1.wpa_supplicant1.service   |   4 -
 8 files changed, 600 insertions(+), 606 deletions(-)
 delete mode 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx/defconfig
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defaults-sane
 create mode 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx/defconfig
deleted file mode 100755
index f357b79..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx/defconfig
+++ /dev/null
@@ -1,506 +0,0 @@
-# Example wpa_supplicant build time configuration
-#
-# This file lists the configuration options that are used when building the
-# hostapd binary. All lines starting with # are ignored. Configuration option
-# lines must be commented out complete, if they are not to be included, i.e.,
-# just setting VARIABLE=n is not disabling that variable.
-#
-# This file is included in Makefile, so variables like CFLAGS and LIBS can also
-# be modified from here. In most cases, these lines should use += in order not
-# to override previous values of the variables.
-
-
-# Uncomment following two lines and fix the paths if you have installed OpenSSL
-# or GnuTLS in non-default location
-#CFLAGS += -I/usr/local/openssl/include
-#LIBS += -L/usr/local/openssl/lib
-
-# Some Red Hat versions seem to include kerberos header files from OpenSSL, but
-# the kerberos files are not in the default include path. Following line can be
-# used to fix build issues on such systems (krb5.h not found).
-#CFLAGS += -I/usr/include/kerberos
-
-# Example configuration for various cross-compilation platforms
-
-#### sveasoft (e.g., for Linksys WRT54G) ######################################
-#CC=mipsel-uclibc-gcc
-#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
-#CFLAGS += -Os
-#CPPFLAGS += -I../src/include -I../../src/router/openssl/include
-#LIBS += -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
-###############################################################################
-
-#### openwrt (e.g., for Linksys WRT54G) #######################################
-#CC=mipsel-uclibc-gcc
-#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
-#CFLAGS += -Os
-#CPPFLAGS=-I../src/include -I../openssl-0.9.7d/include \
-#	-I../WRT54GS/release/src/include
-#LIBS = -lssl
-###############################################################################
-
-
-# Driver interface for Host AP driver
-#CONFIG_DRIVER_HOSTAP=y
-
-# Driver interface for Agere driver
-#CONFIG_DRIVER_HERMES=y
-# Change include directories to match with the local setup
-#CFLAGS += -I../../hcf -I../../include -I../../include/hcf
-#CFLAGS += -I../../include/wireless
-
-# Driver interface for madwifi driver
-# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
-#CONFIG_DRIVER_MADWIFI=y
-# Set include directory to the madwifi source tree
-#CFLAGS += -I../../madwifi
-
-# Driver interface for ndiswrapper
-# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
-#CONFIG_DRIVER_NDISWRAPPER=y
-
-# Driver interface for Atmel driver
-#CONFIG_DRIVER_ATMEL=y
-
-# Driver interface for old Broadcom driver
-# Please note that the newer Broadcom driver ("hybrid Linux driver") supports
-# Linux wireless extensions and does not need (or even work) with the old
-# driver wrapper. Use CONFIG_DRIVER_WEXT=y with that driver.
-#CONFIG_DRIVER_BROADCOM=y
-# Example path for wlioctl.h; change to match your configuration
-#CFLAGS += -I/opt/WRT54GS/release/src/include
-
-# Driver interface for Intel ipw2100/2200 driver
-# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
-#CONFIG_DRIVER_IPW=y
-
-# Driver interface for Ralink driver
-#CONFIG_DRIVER_RALINK=y
-
-# Driver interface for generic Linux wireless extensions
-# Note: WEXT is deprecated in the current Linux kernel version and no new
-# functionality is added to it. nl80211-based interface is the new
-# replacement for WEXT and its use allows wpa_supplicant to properly control
-# the driver to improve existing functionality like roaming and to support new
-# functionality.
-#CONFIG_DRIVER_WEXT=y
-
-# Driver interface for Linux drivers using the nl80211 kernel interface
-CONFIG_DRIVER_NL80211=y
-CONFIG_LIBNL32=y
-
-# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
-#CONFIG_DRIVER_BSD=y
-#CFLAGS += -I/usr/local/include
-#LIBS += -L/usr/local/lib
-#LIBS_p += -L/usr/local/lib
-#LIBS_c += -L/usr/local/lib
-
-# Driver interface for Windows NDIS
-#CONFIG_DRIVER_NDIS=y
-#CFLAGS += -I/usr/include/w32api/ddk
-#LIBS += -L/usr/local/lib
-# For native build using mingw
-#CONFIG_NATIVE_WINDOWS=y
-# Additional directories for cross-compilation on Linux host for mingw target
-#CFLAGS += -I/opt/mingw/mingw32/include/ddk
-#LIBS += -L/opt/mingw/mingw32/lib
-#CC=mingw32-gcc
-# By default, driver_ndis uses WinPcap for low-level operations. This can be
-# replaced with the following option which replaces WinPcap calls with NDISUIO.
-# However, this requires that WZC is disabled (net stop wzcsvc) before starting
-# wpa_supplicant.
-# CONFIG_USE_NDISUIO=y
-
-# Driver interface for development testing
-#CONFIG_DRIVER_TEST=y
-
-# Driver interface for wired Ethernet drivers
-#CONFIG_DRIVER_WIRED=y
-
-# Driver interface for the Broadcom RoboSwitch family
-#CONFIG_DRIVER_ROBOSWITCH=y
-
-# Driver interface for no driver (e.g., WPS ER only)
-#CONFIG_DRIVER_NONE=y
-
-# Solaris libraries
-#LIBS += -lsocket -ldlpi -lnsl
-#LIBS_c += -lsocket
-
-# Enable IEEE 802.1X Supplicant (automatically included if any EAP method is
-# included)
-CONFIG_IEEE8021X_EAPOL=y
-
-# EAP-MD5
-CONFIG_EAP_MD5=y
-
-# EAP-MSCHAPv2
-CONFIG_EAP_MSCHAPV2=y
-
-# EAP-TLS
-CONFIG_EAP_TLS=y
-
-# EAL-PEAP
-CONFIG_EAP_PEAP=y
-
-# EAP-TTLS
-CONFIG_EAP_TTLS=y
-
-# EAP-FAST
-# Note: Default OpenSSL package does not include support for all the
-# functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL,
-# the OpenSSL library must be patched (openssl-0.9.8d-tls-extensions.patch)
-# to add the needed functions.
-CONFIG_EAP_FAST=y
-
-# EAP-GTC
-CONFIG_EAP_GTC=y
-
-# EAP-OTP
-CONFIG_EAP_OTP=y
-
-# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
-CONFIG_EAP_SIM=y
-
-# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
-#CONFIG_EAP_PSK=y
-
-# EAP-pwd (secure authentication using only a password)
-CONFIG_EAP_PWD=y
-
-# EAP-PAX
-#CONFIG_EAP_PAX=y
-
-# LEAP
-CONFIG_EAP_LEAP=y
-
-# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
-#CONFIG_EAP_AKA=y
-
-# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
-# This requires CONFIG_EAP_AKA to be enabled, too.
-#CONFIG_EAP_AKA_PRIME=y
-
-# Enable USIM simulator (Milenage) for EAP-AKA
-#CONFIG_USIM_SIMULATOR=y
-
-# EAP-SAKE
-#CONFIG_EAP_SAKE=y
-
-# EAP-GPSK
-#CONFIG_EAP_GPSK=y
-# Include support for optional SHA256 cipher suite in EAP-GPSK
-#CONFIG_EAP_GPSK_SHA256=y
-
-# EAP-TNC and related Trusted Network Connect support (experimental)
-#CONFIG_EAP_TNC=y
-
-# Wi-Fi Protected Setup (WPS)
-CONFIG_WPS=y
-# Enable WSC 2.0 support
-CONFIG_WPS2=y
-# Enable WPS external registrar functionality
-#CONFIG_WPS_ER=y
-# Disable credentials for an open network by default when acting as a WPS
-# registrar.
-#CONFIG_WPS_REG_DISABLE_OPEN=y
-
-# EAP-IKEv2
-#CONFIG_EAP_IKEV2=y
-
-# PKCS#12 (PFX) support (used to read private key and certificate file from
-# a file that usually has extension .p12 or .pfx)
-CONFIG_PKCS12=y
-
-# Smartcard support (i.e., private key on a smartcard), e.g., with openssl
-# engine.
-CONFIG_SMARTCARD=y
-
-# PC/SC interface for smartcards (USIM, GSM SIM)
-# Enable this if EAP-SIM or EAP-AKA is included
-#CONFIG_PCSC=y
-
-# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
-#CONFIG_HT_OVERRIDES=y
-
-# Development testing
-#CONFIG_EAPOL_TEST=y
-
-# Select control interface backend for external programs, e.g, wpa_cli:
-# unix = UNIX domain sockets (default for Linux/*BSD)
-# udp = UDP sockets using localhost (127.0.0.1)
-# named_pipe = Windows Named Pipe (default for Windows)
-# y = use default (backwards compatibility)
-# If this option is commented out, control interface is not included in the
-# build.
-CONFIG_CTRL_IFACE=y
-
-# Include support for GNU Readline and History Libraries in wpa_cli.
-# When building a wpa_cli binary for distribution, please note that these
-# libraries are licensed under GPL and as such, BSD license may not apply for
-# the resulting binary.
-#CONFIG_READLINE=y
-
-# Include internal line edit mode in wpa_cli. This can be used as a replacement
-# for GNU Readline to provide limited command line editing and history support.
-CONFIG_WPA_CLI_EDIT=y
-
-# Remove debugging code that is printing out debug message to stdout.
-# This can be used to reduce the size of the wpa_supplicant considerably
-# if debugging code is not needed. The size reduction can be around 35%
-# (e.g., 90 kB).
-#CONFIG_NO_STDOUT_DEBUG=y
-
-# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to save
-# 35-50 kB in code size.
-#CONFIG_NO_WPA=y
-
-# Remove WPA2 support. This allows WPA to be used, but removes WPA2 code to
-# save about 1 kB in code size when building only WPA-Personal (no EAP support)
-# or 6 kB if building for WPA-Enterprise.
-#CONFIG_NO_WPA2=y
-
-# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
-# This option can be used to reduce code size by removing support for
-# converting ASCII passphrases into PSK. If this functionality is removed, the
-# PSK can only be configured as the 64-octet hexstring (e.g., from
-# wpa_passphrase). This saves about 0.5 kB in code size.
-#CONFIG_NO_WPA_PASSPHRASE=y
-
-# Disable scan result processing (ap_mode=1) to save code size by about 1 kB.
-# This can be used if ap_scan=1 mode is never enabled.
-#CONFIG_NO_SCAN_PROCESSING=y
-
-# Select configuration backend:
-# file = text file (e.g., wpa_supplicant.conf; note: the configuration file
-#	path is given on command line, not here; this option is just used to
-#	select the backend that allows configuration files to be used)
-# winreg = Windows registry (see win_example.reg for an example)
-CONFIG_BACKEND=file
-
-# Remove configuration write functionality (i.e., to allow the configuration
-# file to be updated based on runtime configuration changes). The runtime
-# configuration can still be changed, the changes are just not going to be
-# persistent over restarts. This option can be used to reduce code size by
-# about 3.5 kB.
-#CONFIG_NO_CONFIG_WRITE=y
-
-# Remove support for configuration blobs to reduce code size by about 1.5 kB.
-#CONFIG_NO_CONFIG_BLOBS=y
-
-# Select program entry point implementation:
-# main = UNIX/POSIX like main() function (default)
-# main_winsvc = Windows service (read parameters from registry)
-# main_none = Very basic example (development use only)
-#CONFIG_MAIN=main
-
-# Select wrapper for operatins system and C library specific functions
-# unix = UNIX/POSIX like systems (default)
-# win32 = Windows systems
-# none = Empty template
-CONFIG_OS=unix
-
-# Select event loop implementation
-# eloop = select() loop (default)
-# eloop_win = Windows events and WaitForMultipleObject() loop
-# eloop_none = Empty template
-CONFIG_ELOOP=eloop
-
-# Should we use poll instead of select? Select is used by default.
-#CONFIG_ELOOP_POLL=y
-
-# Select layer 2 packet implementation
-# linux = Linux packet socket (default)
-# pcap = libpcap/libdnet/WinPcap
-# freebsd = FreeBSD libpcap
-# winpcap = WinPcap with receive thread
-# ndis = Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=y)
-# none = Empty template
-CONFIG_L2_PACKET=linux
-
-# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
-CONFIG_PEERKEY=y
-
-# IEEE 802.11w (management frame protection)
-# This version is an experimental implementation based on IEEE 802.11w/D1.0
-# draft and is subject to change since the standard has not yet been finalized.
-# Driver support is also needed for IEEE 802.11w.
-#CONFIG_IEEE80211W=y
-
-# Select TLS implementation
-# openssl = OpenSSL (default)
-# gnutls = GnuTLS
-# internal = Internal TLSv1 implementation (experimental)
-# none = Empty template
-#CONFIG_TLS=openssl
-
-# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.1)
-# can be enabled to get a stronger construction of messages when block ciphers
-# are used. It should be noted that some existing TLS v1.0 -based
-# implementation may not be compatible with TLS v1.1 message (ClientHello is
-# sent prior to negotiating which version will be used)
-#CONFIG_TLSV11=y
-
-# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.2)
-# can be enabled to enable use of stronger crypto algorithms. It should be
-# noted that some existing TLS v1.0 -based implementation may not be compatible
-# with TLS v1.2 message (ClientHello is sent prior to negotiating which version
-# will be used)
-#CONFIG_TLSV12=y
-
-# If CONFIG_TLS=internal is used, additional library and include paths are
-# needed for LibTomMath. Alternatively, an integrated, minimal version of
-# LibTomMath can be used. See beginning of libtommath.c for details on benefits
-# and drawbacks of this option.
-#CONFIG_INTERNAL_LIBTOMMATH=y
-#ifndef CONFIG_INTERNAL_LIBTOMMATH
-#LTM_PATH=/usr/src/libtommath-0.39
-#CFLAGS += -I$(LTM_PATH)
-#LIBS += -L$(LTM_PATH)
-#LIBS_p += -L$(LTM_PATH)
-#endif
-# At the cost of about 4 kB of additional binary size, the internal LibTomMath
-# can be configured to include faster routines for exptmod, sqr, and div to
-# speed up DH and RSA calculation considerably
-#CONFIG_INTERNAL_LIBTOMMATH_FAST=y
-
-# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.
-# This is only for Windows builds and requires WMI-related header files and
-# WbemUuid.Lib from Platform SDK even when building with MinGW.
-#CONFIG_NDIS_EVENTS_INTEGRATED=y
-#PLATFORMSDKLIB="/opt/Program Files/Microsoft Platform SDK/Lib"
-
-# Add support for old DBus control interface
-# (fi.epitest.hostap.WPASupplicant)
-#CONFIG_CTRL_IFACE_DBUS=y
-
-# Add support for new DBus control interface
-# (fi.w1.hostap.wpa_supplicant1)
-#CONFIG_CTRL_IFACE_DBUS_NEW=y
-
-# Add introspection support for new DBus control interface
-#CONFIG_CTRL_IFACE_DBUS_INTRO=y
-
-# Add support for loading EAP methods dynamically as shared libraries.
-# When this option is enabled, each EAP method can be either included
-# statically (CONFIG_EAP_<method>=y) or dynamically (CONFIG_EAP_<method>=dyn).
-# Dynamic EAP methods are build as shared objects (eap_*.so) and they need to
-# be loaded in the beginning of the wpa_supplicant configuration file
-# (see load_dynamic_eap parameter in the example file) before being used in
-# the network blocks.
-#
-# Note that some shared parts of EAP methods are included in the main program
-# and in order to be able to use dynamic EAP methods using these parts, the
-# main program must have been build with the EAP method enabled (=y or =dyn).
-# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic libraries
-# unless at least one of them was included in the main build to force inclusion
-# of the shared code. Similarly, at least one of EAP-SIM/AKA must be included
-# in the main build to be able to load these methods dynamically.
-#
-# Please also note that using dynamic libraries will increase the total binary
-# size. Thus, it may not be the best option for targets that have limited
-# amount of memory/flash.
-#CONFIG_DYNAMIC_EAP_METHODS=y
-
-# IEEE Std 802.11r-2008 (Fast BSS Transition)
-#CONFIG_IEEE80211R=y
-
-# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#.txt)
-#CONFIG_DEBUG_FILE=y
-
-# Send debug messages to syslog instead of stdout
-#CONFIG_DEBUG_SYSLOG=y
-# Set syslog facility for debug messages
-#CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
-
-# Add support for sending all debug messages (regardless of debug verbosity)
-# to the Linux kernel tracing facility. This helps debug the entire stack by
-# making it easy to record everything happening from the driver up into the
-# same file, e.g., using trace-cmd.
-#CONFIG_DEBUG_LINUX_TRACING=y
-
-# Add support for writing debug log to Android logcat instead of standard
-# output
-CONFIG_ANDROID_LOG=y
-
-# Enable privilege separation (see README 'Privilege separation' for details)
-#CONFIG_PRIVSEP=y
-
-# Enable mitigation against certain attacks against TKIP by delaying Michael
-# MIC error reports by a random amount of time between 0 and 60 seconds
-#CONFIG_DELAYED_MIC_ERROR_REPORT=y
-
-# Enable tracing code for developer debugging
-# This tracks use of memory allocations and other registrations and reports
-# incorrect use with a backtrace of call (or allocation) location.
-#CONFIG_WPA_TRACE=y
-# For BSD, uncomment these.
-#LIBS += -lexecinfo
-#LIBS_p += -lexecinfo
-#LIBS_c += -lexecinfo
-
-# Use libbfd to get more details for developer debugging
-# This enables use of libbfd to get more detailed symbols for the backtraces
-# generated by CONFIG_WPA_TRACE=y.
-#CONFIG_WPA_TRACE_BFD=y
-# For BSD, uncomment these.
-#LIBS += -lbfd -liberty -lz
-#LIBS_p += -lbfd -liberty -lz
-#LIBS_c += -lbfd -liberty -lz
-
-# wpa_supplicant depends on strong random number generation being available
-# from the operating system. os_get_random() function is used to fetch random
-# data when needed, e.g., for key generation. On Linux and BSD systems, this
-# works by reading /dev/urandom. It should be noted that the OS entropy pool
-# needs to be properly initialized before wpa_supplicant is started. This is
-# important especially on embedded devices that do not have a hardware random
-# number generator and may by default start up with minimal entropy available
-# for random number generation.
-#
-# As a safety net, wpa_supplicant is by default trying to internally collect
-# additional entropy for generating random data to mix in with the data fetched
-# from the OS. This by itself is not considered to be very strong, but it may
-# help in cases where the system pool is not initialized properly. However, it
-# is very strongly recommended that the system pool is initialized with enough
-# entropy either by using hardware assisted random number generator or by
-# storing state over device reboots.
-#
-# wpa_supplicant can be configured to maintain its own entropy store over
-# restarts to enhance random number generation. This is not perfect, but it is
-# much more secure than using the same sequence of random numbers after every
-# reboot. This can be enabled with -e<entropy file> command line option. The
-# specified file needs to be readable and writable by wpa_supplicant.
-#
-# If the os_get_random() is known to provide strong random data (e.g., on
-# Linux/BSD, the board in question is known to have reliable source of random
-# data from /dev/urandom), the internal wpa_supplicant random pool can be
-# disabled. This will save some in binary size and CPU use. However, this
-# should only be considered for builds that are known to be used on devices
-# that meet the requirements described above.
-#CONFIG_NO_RANDOM_POOL=y
-
-# IEEE 802.11n (High Throughput) support (mainly for AP mode)
-CONFIG_IEEE80211N=y
-
-# Interworking (IEEE 802.11u)
-# This can be used to enable functionality to improve interworking with
-# external networks (GAS/ANQP to learn more about the networks and network
-# selection based on available credentials).
-CONFIG_INTERWORKING=y
-
-# Hotspot 2.0
-CONFIG_HS20=y
-
-# Disable roaming in wpa_supplicant
-#CONFIG_NO_ROAMING=y
-
-# Enable P2P
-CONFIG_P2P=y
-CONFIG_AP=y
-
-# bgscan
-NEED_BGSCAN=y
-CONFIG_BGSCAN_LEARN=y
-CONFIG_BGSCAN_SIMPLE=y
-
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
deleted file mode 100644
index bfe617e..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-# This is a TI specific version of the wpa-supplicant recipe for use with the
-# wl18xx wlan module.
-
-require wpa-supplicant.inc
-
-LICENSE = "GPLv2 | BSD"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
-                    file://../README;md5=5cb758942d25f6f61fd4ac388fd446fa \
-                    file://wpa_supplicant.c;beginline=1;endline=17;md5=8835156c8ab8cad6356ec7f39ebe3aba"
-
-FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
-
-# Tag: ol_r8.a8.10
-SRCREV = "257ab333aad993b4be81808524bc0d939c276058"
-BRANCH = "mbss_suspend"
-PR_append = "b+gitr${SRCPV}"
-
-# Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
-PV = "2.0-devel-ti"
-
-PROVIDES += "wpa-supplicant"
-RPROVIDES_${PN}  += "wpa-supplicant"
-RREPLACES_${PN}  += "wpa-supplicant"
-RCONFLICTS_${PN}  += "wpa-supplicant"
-RDEPENDS_${PN} += "wpa-supplicant-cli wpa-supplicant-passphrase"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb
new file mode 100644
index 0000000..203364f
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb
@@ -0,0 +1,25 @@
+# This is a TI specific version of the wpa-supplicant recipe for use with the
+# wl18xx wlan module.
+
+require wpa-supplicant.inc
+
+LICENSE = "GPLv2 | BSD"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
+                    file://../README;md5=ba46b65db36e3c82244a3815b3738d63 \
+                    file://wpa_supplicant.c;beginline=1;endline=17;md5=8835156c8ab8cad6356ec7f39ebe3aba"
+
+FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
+
+# Tag: ol_r8.a9.14
+SRCREV = "281f5adb8eb7ee9e9220546c0227696b02aab332"
+BRANCH = "single_hostap_dfs_dynamic"
+PR_append = "c+gitr${SRCPV}"
+
+# Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
+PV = "2.0-devel-ti"
+
+PROVIDES += "wpa-supplicant"
+RPROVIDES_${PN}  += "wpa-supplicant"
+RREPLACES_${PN}  += "wpa-supplicant"
+RCONFLICTS_${PN}  += "wpa-supplicant"
+RDEPENDS_${PN} += "wpa-supplicant-cli wpa-supplicant-passphrase"
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
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defaults-sane
+++ /dev/null
@@ -1,8 +0,0 @@
-# Useful flags:
-#  -i <ifname>          Interface (required, unless specified in config)
-#  -D <driver>          Wireless Driver
-#  -d                   Debugging (-dd for more)
-#  -q                   Quiet (-qq for more)
-
-CONFIG="/etc/wpa_supplicant.conf"
-OPTIONS="-i eth1 -D wext"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
new file mode 100755
index 0000000..fcbe06d
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -0,0 +1,543 @@
+# Example wpa_supplicant build time configuration
+#
+# This file lists the configuration options that are used when building the
+# hostapd binary. All lines starting with # are ignored. Configuration option
+# lines must be commented out complete, if they are not to be included, i.e.,
+# just setting VARIABLE=n is not disabling that variable.
+#
+# This file is included in Makefile, so variables like CFLAGS and LIBS can also
+# be modified from here. In most cases, these lines should use += in order not
+# to override previous values of the variables.
+
+
+# Uncomment following two lines and fix the paths if you have installed OpenSSL
+# or GnuTLS in non-default location
+#CFLAGS += -I/usr/local/openssl/include
+#LIBS += -L/usr/local/openssl/lib
+
+# Some Red Hat versions seem to include kerberos header files from OpenSSL, but
+# the kerberos files are not in the default include path. Following line can be
+# used to fix build issues on such systems (krb5.h not found).
+#CFLAGS += -I/usr/include/kerberos
+
+# Example configuration for various cross-compilation platforms
+
+#### sveasoft (e.g., for Linksys WRT54G) ######################################
+#CC=mipsel-uclibc-gcc
+#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
+#CFLAGS += -Os
+#CPPFLAGS += -I../src/include -I../../src/router/openssl/include
+#LIBS += -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
+###############################################################################
+
+#### openwrt (e.g., for Linksys WRT54G) #######################################
+#CC=mipsel-uclibc-gcc
+#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
+#CFLAGS += -Os
+#CPPFLAGS=-I../src/include -I../openssl-0.9.7d/include \
+#	-I../WRT54GS/release/src/include
+#LIBS = -lssl
+###############################################################################
+
+
+# Driver interface for Host AP driver
+#CONFIG_DRIVER_HOSTAP=y
+
+# Driver interface for Agere driver
+#CONFIG_DRIVER_HERMES=y
+# Change include directories to match with the local setup
+#CFLAGS += -I../../hcf -I../../include -I../../include/hcf
+#CFLAGS += -I../../include/wireless
+
+# Driver interface for madwifi driver
+# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
+#CONFIG_DRIVER_MADWIFI=y
+# Set include directory to the madwifi source tree
+#CFLAGS += -I../../madwifi
+
+# Driver interface for ndiswrapper
+# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
+#CONFIG_DRIVER_NDISWRAPPER=y
+
+# Driver interface for Atmel driver
+#CONFIG_DRIVER_ATMEL=y
+
+# Driver interface for old Broadcom driver
+# Please note that the newer Broadcom driver ("hybrid Linux driver") supports
+# Linux wireless extensions and does not need (or even work) with the old
+# driver wrapper. Use CONFIG_DRIVER_WEXT=y with that driver.
+#CONFIG_DRIVER_BROADCOM=y
+# Example path for wlioctl.h; change to match your configuration
+#CFLAGS += -I/opt/WRT54GS/release/src/include
+
+# Driver interface for Intel ipw2100/2200 driver
+# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
+#CONFIG_DRIVER_IPW=y
+
+# Driver interface for Ralink driver
+#CONFIG_DRIVER_RALINK=y
+
+# Driver interface for generic Linux wireless extensions
+# Note: WEXT is deprecated in the current Linux kernel version and no new
+# functionality is added to it. nl80211-based interface is the new
+# replacement for WEXT and its use allows wpa_supplicant to properly control
+# the driver to improve existing functionality like roaming and to support new
+# functionality.
+#CONFIG_DRIVER_WEXT=y
+
+# Driver interface for Linux drivers using the nl80211 kernel interface
+CONFIG_DRIVER_NL80211=y
+CONFIG_LIBNL32=y
+
+# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
+#CONFIG_DRIVER_BSD=y
+#CFLAGS += -I/usr/local/include
+#LIBS += -L/usr/local/lib
+#LIBS_p += -L/usr/local/lib
+#LIBS_c += -L/usr/local/lib
+
+# Driver interface for Windows NDIS
+#CONFIG_DRIVER_NDIS=y
+#CFLAGS += -I/usr/include/w32api/ddk
+#LIBS += -L/usr/local/lib
+# For native build using mingw
+#CONFIG_NATIVE_WINDOWS=y
+# Additional directories for cross-compilation on Linux host for mingw target
+#CFLAGS += -I/opt/mingw/mingw32/include/ddk
+#LIBS += -L/opt/mingw/mingw32/lib
+#CC=mingw32-gcc
+# By default, driver_ndis uses WinPcap for low-level operations. This can be
+# replaced with the following option which replaces WinPcap calls with NDISUIO.
+# However, this requires that WZC is disabled (net stop wzcsvc) before starting
+# wpa_supplicant.
+# CONFIG_USE_NDISUIO=y
+
+# Driver interface for development testing
+#CONFIG_DRIVER_TEST=y
+
+# Driver interface for wired Ethernet drivers
+#CONFIG_DRIVER_WIRED=y
+
+# Driver interface for the Broadcom RoboSwitch family
+#CONFIG_DRIVER_ROBOSWITCH=y
+
+# Driver interface for no driver (e.g., WPS ER only)
+#CONFIG_DRIVER_NONE=y
+
+# Solaris libraries
+#LIBS += -lsocket -ldlpi -lnsl
+#LIBS_c += -lsocket
+
+# Enable IEEE 802.1X Supplicant (automatically included if any EAP method is
+# included)
+CONFIG_IEEE8021X_EAPOL=y
+
+# EAP-MD5
+CONFIG_EAP_MD5=y
+
+# EAP-MSCHAPv2
+CONFIG_EAP_MSCHAPV2=y
+
+# EAP-TLS
+CONFIG_EAP_TLS=y
+
+# EAL-PEAP
+CONFIG_EAP_PEAP=y
+
+# EAP-TTLS
+CONFIG_EAP_TTLS=y
+
+# EAP-FAST
+# Note: Default OpenSSL package does not include support for all the
+# functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL,
+# the OpenSSL library must be patched (openssl-0.9.8d-tls-extensions.patch)
+# to add the needed functions.
+CONFIG_EAP_FAST=y
+
+# EAP-GTC
+CONFIG_EAP_GTC=y
+
+# EAP-OTP
+CONFIG_EAP_OTP=y
+
+# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
+CONFIG_EAP_SIM=y
+
+# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
+#CONFIG_EAP_PSK=y
+
+# EAP-pwd (secure authentication using only a password)
+CONFIG_EAP_PWD=y
+
+# EAP-PAX
+#CONFIG_EAP_PAX=y
+
+# LEAP
+CONFIG_EAP_LEAP=y
+
+# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
+CONFIG_EAP_AKA=y
+
+# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
+# This requires CONFIG_EAP_AKA to be enabled, too.
+#CONFIG_EAP_AKA_PRIME=y
+
+# Enable USIM simulator (Milenage) for EAP-AKA
+#CONFIG_USIM_SIMULATOR=y
+
+# EAP-SAKE
+#CONFIG_EAP_SAKE=y
+
+# EAP-GPSK
+#CONFIG_EAP_GPSK=y
+# Include support for optional SHA256 cipher suite in EAP-GPSK
+#CONFIG_EAP_GPSK_SHA256=y
+
+# EAP-TNC and related Trusted Network Connect support (experimental)
+#CONFIG_EAP_TNC=y
+
+# Wi-Fi Protected Setup (WPS)
+CONFIG_WPS=y
+# Enable WSC 2.0 support
+CONFIG_WPS2=y
+# Enable WPS external registrar functionality
+CONFIG_WPS_ER=y
+# Disable credentials for an open network by default when acting as a WPS
+# registrar.
+#CONFIG_WPS_REG_DISABLE_OPEN=y
+# Enable WPS support with NFC config method
+#CONFIG_WPS_NFC=y
+
+# EAP-IKEv2
+#CONFIG_EAP_IKEV2=y
+
+# PKCS#12 (PFX) support (used to read private key and certificate file from
+# a file that usually has extension .p12 or .pfx)
+CONFIG_PKCS12=y
+
+# Smartcard support (i.e., private key on a smartcard), e.g., with openssl
+# engine.
+CONFIG_SMARTCARD=y
+
+# PC/SC interface for smartcards (USIM, GSM SIM)
+# Enable this if EAP-SIM or EAP-AKA is included
+#CONFIG_PCSC=y
+
+# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
+#CONFIG_HT_OVERRIDES=y
+
+# Support VHT overrides (disable VHT, mask MCS rates, etc.)
+#CONFIG_VHT_OVERRIDES=y
+
+# Development testing
+#CONFIG_EAPOL_TEST=y
+
+# Select control interface backend for external programs, e.g, wpa_cli:
+# unix = UNIX domain sockets (default for Linux/*BSD)
+# udp = UDP sockets using localhost (127.0.0.1)
+# named_pipe = Windows Named Pipe (default for Windows)
+# udp-remote = UDP sockets with remote access (only for tests systems/purpose)
+# y = use default (backwards compatibility)
+# If this option is commented out, control interface is not included in the
+# build.
+CONFIG_CTRL_IFACE=y
+
+# Include support for GNU Readline and History Libraries in wpa_cli.
+# When building a wpa_cli binary for distribution, please note that these
+# libraries are licensed under GPL and as such, BSD license may not apply for
+# the resulting binary.
+#CONFIG_READLINE=y
+
+# Include internal line edit mode in wpa_cli. This can be used as a replacement
+# for GNU Readline to provide limited command line editing and history support.
+CONFIG_WPA_CLI_EDIT=y
+
+# Remove debugging code that is printing out debug message to stdout.
+# This can be used to reduce the size of the wpa_supplicant considerably
+# if debugging code is not needed. The size reduction can be around 35%
+# (e.g., 90 kB).
+#CONFIG_NO_STDOUT_DEBUG=y
+
+# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to save
+# 35-50 kB in code size.
+#CONFIG_NO_WPA=y
+
+# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
+# This option can be used to reduce code size by removing support for
+# converting ASCII passphrases into PSK. If this functionality is removed, the
+# PSK can only be configured as the 64-octet hexstring (e.g., from
+# wpa_passphrase). This saves about 0.5 kB in code size.
+#CONFIG_NO_WPA_PASSPHRASE=y
+
+# Disable scan result processing (ap_mode=1) to save code size by about 1 kB.
+# This can be used if ap_scan=1 mode is never enabled.
+#CONFIG_NO_SCAN_PROCESSING=y
+
+# Select configuration backend:
+# file = text file (e.g., wpa_supplicant.conf; note: the configuration file
+#	path is given on command line, not here; this option is just used to
+#	select the backend that allows configuration files to be used)
+# winreg = Windows registry (see win_example.reg for an example)
+CONFIG_BACKEND=file
+
+# Remove configuration write functionality (i.e., to allow the configuration
+# file to be updated based on runtime configuration changes). The runtime
+# configuration can still be changed, the changes are just not going to be
+# persistent over restarts. This option can be used to reduce code size by
+# about 3.5 kB.
+#CONFIG_NO_CONFIG_WRITE=y
+
+# Remove support for configuration blobs to reduce code size by about 1.5 kB.
+#CONFIG_NO_CONFIG_BLOBS=y
+
+# Select program entry point implementation:
+# main = UNIX/POSIX like main() function (default)
+# main_winsvc = Windows service (read parameters from registry)
+# main_none = Very basic example (development use only)
+#CONFIG_MAIN=main
+
+# Select wrapper for operatins system and C library specific functions
+# unix = UNIX/POSIX like systems (default)
+# win32 = Windows systems
+# none = Empty template
+CONFIG_OS=unix
+
+# Select event loop implementation
+# eloop = select() loop (default)
+# eloop_win = Windows events and WaitForMultipleObject() loop
+CONFIG_ELOOP=eloop
+
+# Should we use poll instead of select? Select is used by default.
+#CONFIG_ELOOP_POLL=y
+
+# Select layer 2 packet implementation
+# linux = Linux packet socket (default)
+# pcap = libpcap/libdnet/WinPcap
+# freebsd = FreeBSD libpcap
+# winpcap = WinPcap with receive thread
+# ndis = Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=y)
+# none = Empty template
+CONFIG_L2_PACKET=linux
+
+# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
+CONFIG_PEERKEY=y
+
+# IEEE 802.11w (management frame protection), also known as PMF
+# Driver support is also needed for IEEE 802.11w.
+CONFIG_IEEE80211W=y
+
+# Select TLS implementation
+# openssl = OpenSSL (default)
+# gnutls = GnuTLS
+# internal = Internal TLSv1 implementation (experimental)
+# none = Empty template
+#CONFIG_TLS=openssl
+
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
+
+# If CONFIG_TLS=internal is used, additional library and include paths are
+# needed for LibTomMath. Alternatively, an integrated, minimal version of
+# LibTomMath can be used. See beginning of libtommath.c for details on benefits
+# and drawbacks of this option.
+#CONFIG_INTERNAL_LIBTOMMATH=y
+#ifndef CONFIG_INTERNAL_LIBTOMMATH
+#LTM_PATH=/usr/src/libtommath-0.39
+#CFLAGS += -I$(LTM_PATH)
+#LIBS += -L$(LTM_PATH)
+#LIBS_p += -L$(LTM_PATH)
+#endif
+# At the cost of about 4 kB of additional binary size, the internal LibTomMath
+# can be configured to include faster routines for exptmod, sqr, and div to
+# speed up DH and RSA calculation considerably
+#CONFIG_INTERNAL_LIBTOMMATH_FAST=y
+
+# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.
+# This is only for Windows builds and requires WMI-related header files and
+# WbemUuid.Lib from Platform SDK even when building with MinGW.
+#CONFIG_NDIS_EVENTS_INTEGRATED=y
+#PLATFORMSDKLIB="/opt/Program Files/Microsoft Platform SDK/Lib"
+
+# Add support for old DBus control interface
+# (fi.epitest.hostap.WPASupplicant)
+#CONFIG_CTRL_IFACE_DBUS=y
+
+# Add support for new DBus control interface
+# (fi.w1.hostap.wpa_supplicant1)
+#CONFIG_CTRL_IFACE_DBUS_NEW=y
+
+# Add introspection support for new DBus control interface
+#CONFIG_CTRL_IFACE_DBUS_INTRO=y
+
+# Add support for loading EAP methods dynamically as shared libraries.
+# When this option is enabled, each EAP method can be either included
+# statically (CONFIG_EAP_<method>=y) or dynamically (CONFIG_EAP_<method>=dyn).
+# Dynamic EAP methods are build as shared objects (eap_*.so) and they need to
+# be loaded in the beginning of the wpa_supplicant configuration file
+# (see load_dynamic_eap parameter in the example file) before being used in
+# the network blocks.
+#
+# Note that some shared parts of EAP methods are included in the main program
+# and in order to be able to use dynamic EAP methods using these parts, the
+# main program must have been build with the EAP method enabled (=y or =dyn).
+# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic libraries
+# unless at least one of them was included in the main build to force inclusion
+# of the shared code. Similarly, at least one of EAP-SIM/AKA must be included
+# in the main build to be able to load these methods dynamically.
+#
+# Please also note that using dynamic libraries will increase the total binary
+# size. Thus, it may not be the best option for targets that have limited
+# amount of memory/flash.
+#CONFIG_DYNAMIC_EAP_METHODS=y
+
+# IEEE Std 802.11r-2008 (Fast BSS Transition)
+CONFIG_IEEE80211R=y
+
+# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#.txt)
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
+
+# Enable privilege separation (see README 'Privilege separation' for details)
+#CONFIG_PRIVSEP=y
+
+# Enable mitigation against certain attacks against TKIP by delaying Michael
+# MIC error reports by a random amount of time between 0 and 60 seconds
+#CONFIG_DELAYED_MIC_ERROR_REPORT=y
+
+# Enable tracing code for developer debugging
+# This tracks use of memory allocations and other registrations and reports
+# incorrect use with a backtrace of call (or allocation) location.
+#CONFIG_WPA_TRACE=y
+# For BSD, uncomment these.
+#LIBS += -lexecinfo
+#LIBS_p += -lexecinfo
+#LIBS_c += -lexecinfo
+
+# Use libbfd to get more details for developer debugging
+# This enables use of libbfd to get more detailed symbols for the backtraces
+# generated by CONFIG_WPA_TRACE=y.
+#CONFIG_WPA_TRACE_BFD=y
+# For BSD, uncomment these.
+#LIBS += -lbfd -liberty -lz
+#LIBS_p += -lbfd -liberty -lz
+#LIBS_c += -lbfd -liberty -lz
+
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
+# Wireless Network Management (IEEE Std 802.11v-2011)
+# Note: This is experimental and not complete implementation.
+CONFIG_WNM=y
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
+# AP mode operations with wpa_supplicant
+# This can be used for controlling AP mode operations with wpa_supplicant. It
+# should be noted that this is mainly aimed at simple cases like
+# WPA2-Personal while more complex configurations like WPA2-Enterprise with an
+# external RADIUS server can be supported with hostapd.
+CONFIG_AP=y
+
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
+# bgscan
+NEED_BGSCAN=y
+CONFIG_BGSCAN_LEARN=y
+CONFIG_BGSCAN_SIMPLE=y
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
deleted file mode 100644
index fb3f917..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
+++ /dev/null
@@ -1,4 +0,0 @@
-[D-BUS Service]
-Name=fi.epitest.hostap.WPASupplicant
-Exec=/usr/sbin/wpa_supplicant -d -Dnl80211 -c/etc/wpa_supplicant.conf -iwlan0 -B -u
-User=root
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
deleted file mode 100644
index 0bb1056..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
+++ /dev/null
@@ -1,4 +0,0 @@
-[D-BUS Service]
-Name=fi.w1.wpa_supplicant1
-Exec=/usr/sbin/wpa_supplicant -d -Dnl80211 -c/etc/wpa_supplicant.conf -iwlan0 -B -u
-User=root
-- 
2.0.1


