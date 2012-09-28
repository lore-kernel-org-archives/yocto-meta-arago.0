Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 857EC529A4
	for <meta-arago@arago-project.org>;
	Fri, 28 Sep 2012 01:43:28 +0000 (UTC)
Received: by obblz20 with SMTP id lz20so2447274obb.38
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2012 18:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6vftsjIQF/E57uliWCBBP/QYH6pRS/wYKNDaCgTKQew=;
	b=TM5jy7u95Ng7z2crbqRMz9ZJo8vqBhsQ433PCbRxmez8O83S4fSGcJKkRUsIYsVc5q
	wSLRRJJvSau6LgpBENEUVohPXqSaZs9dZrZOU6OoDHID/rN9ZVJ2PDPOgsldi6xjU8A7
	RM7tsixzXqxF8/okyz54Sp6mvL0pEDO6LmPiOzx8aakDDGpPUWHXCLAJjqwDiVeq3Iwl
	ud6+OBd68p8zZ2IRwAMdAZ2nkuYz8GOLPbIGV0zhSqj0gi8t3uWUbamzCI6nl7UZvfBF
	1vZFOUVv5H56ITJNjKsrFcx/zfseI2JAmXtpM+aRZcPdtUp5GQisfaQusK5FqZYdRSy2
	H0pA==
Received: by 10.60.1.106 with SMTP id 10mr4799179oel.84.1348796607830;
	Thu, 27 Sep 2012 18:43:27 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id kc5sm7174602obb.21.2012.09.27.18.43.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 18:43:26 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 27 Sep 2012 21:09:07 -0500
Message-Id: <1348798147-23878-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] wpa-supplicant: Port TI customized version of wpa-supplicant
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
X-List-Received-Date: Fri, 28 Sep 2012 01:43:28 -0000

* Port TI customized version of wpa-supplicant from arago.
* DEFAULT_PREFERENCE is set to -1 so that this customized version
  isn't accidentally picked up

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
This version addresses the following issues:
Moved recipe from meta-arago-distro to meta-arago-extras.

 ...ant-dbus-AP-Add-support-for-WPS-Internal-.patch |  134 ++++
 .../wpa-supplicant/99_wpa_supplicant               |    1 +
 .../wpa-supplicant/wpa-supplicant/defaults-sane    |    8 +
 .../wpa-supplicant/wpa-supplicant/defconfig        |  426 ++++++++++++
 .../fi.epitest.hostap.WPASupplicant.service        |    4 +
 .../wpa-supplicant/fi.w1.wpa_supplicant1.service   |    4 +
 .../wpa-supplicant/wpa-supplicant.sh               |   85 +++
 .../wpa-supplicant/wpa_supplicant.conf             |  690 ++++++++++++++++++++
 .../wpa-supplicant/wpa_supplicant.conf-sane        |    7 +
 .../wpa-supplicant/wpa-supplicant_git.bb           |  119 ++++
 10 files changed, 1478 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/99_wpa_supplicant
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defaults-sane
 create mode 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf-sane
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
new file mode 100644
index 0000000..15ec6fe
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
@@ -0,0 +1,134 @@
+From 19030351b95f48714007e425eaa2163d9122d788 Mon Sep 17 00:00:00 2001
+From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
+Date: Sun, 18 Dec 2011 17:06:31 +0200
+Subject: [PATCH] wpa_supplicant/dbus AP: Add support for WPS Internal
+ Registrar
+
+When in AP mode, wpa_supplicant is now enabling WPS (only Internal
+Registrar). WPS.Start() call can be used to initiate WPS negotiation
+similarly to how this is done in station mode.
+
+This was done to ctrl_iface by Jouni Malinen on April 21, 2009 (commit
+3ec97afe571f159ea95213262c1c6b89965827d4)
+
+Upstream-Status: Submitted [http://lists.shmoo.com/pipermail/hostap/2011-December/024947.html]
+
+Signed-hostap: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
+---
+ wpa_supplicant/dbus/dbus_new_handlers_wps.c |   72 +++++++++++++++++++++++++--
+ 1 file changed, 67 insertions(+), 5 deletions(-)
+
+diff --git a/wpa_supplicant/dbus/dbus_new_handlers_wps.c b/wpa_supplicant/dbus/dbus_new_handlers_wps.c
+index d8b74d0..a72cfb3 100644
+--- a/wpa_supplicant/dbus/dbus_new_handlers_wps.c
++++ b/wpa_supplicant/dbus/dbus_new_handlers_wps.c
+@@ -19,6 +19,8 @@
+ #include "../config.h"
+ #include "../wpa_supplicant_i.h"
+ #include "../wps_supplicant.h"
++#include "../driver_i.h"
++#include "../ap.h"
+ #include "dbus_new_helpers.h"
+ #include "dbus_new.h"
+ #include "dbus_new_handlers.h"
+@@ -30,6 +32,7 @@ struct wps_start_params {
+	int type; /* 0 - not set, 1 - pin,      2 - pbc       */
+	u8 *bssid;
+	char *pin;
++	u8 *p2p_dev_addr;
+ };
+
+
+@@ -148,6 +151,41 @@ static int wpas_dbus_handler_wps_pin(DBusMessage *message,
+ }
+
+
++#ifdef CONFIG_P2P
++static int wpas_dbus_handler_wps_p2p_dev_addr(DBusMessage *message,
++					      DBusMessageIter *entry_iter,
++					      struct wps_start_params *params,
++					      DBusMessage **reply)
++{
++	DBusMessageIter variant_iter, array_iter;
++	int len;
++
++	dbus_message_iter_recurse(entry_iter, &variant_iter);
++	if (dbus_message_iter_get_arg_type(&variant_iter) != DBUS_TYPE_ARRAY ||
++	    dbus_message_iter_get_element_type(&variant_iter) !=
++	    DBUS_TYPE_BYTE) {
++		wpa_printf(MSG_DEBUG, "dbus: WPS.Start - Wrong "
++			   "P2PDeviceAddress type, byte array required");
++		*reply = wpas_dbus_error_invalid_args(
++			message, "P2PDeviceAddress must be a byte array");
++		return -1;
++	}
++	dbus_message_iter_recurse(&variant_iter, &array_iter);
++	dbus_message_iter_get_fixed_array(&array_iter, &params->p2p_dev_addr,
++					  &len);
++	if (len != ETH_ALEN) {
++		wpa_printf(MSG_DEBUG, "dbus: WPS.Start - Wrong "
++			   "P2PDeviceAddress length %d", len);
++		*reply = wpas_dbus_error_invalid_args(message,
++						      "P2PDeviceAddress "
++						      "has wrong length");
++		return -1;
++	}
++	return 0;
++}
++#endif /* CONFIG_P2P */
++
++
+ static int wpas_dbus_handler_wps_start_entry(DBusMessage *message, char *key,
+					     DBusMessageIter *entry_iter,
+					     struct wps_start_params *params,
+@@ -165,6 +203,11 @@ static int wpas_dbus_handler_wps_start_entry(DBusMessage *message, char *key,
+	else if (os_strcmp(key, "Pin") == 0)
+		return wpas_dbus_handler_wps_pin(message, entry_iter,
+						 params, reply);
++#ifdef CONFIG_P2P
++	else if (os_strcmp(key, "P2PDeviceAddress") == 0)
++		return wpas_dbus_handler_wps_p2p_dev_addr(message, entry_iter,
++							  params, reply);
++#endif /* CONFIG_P2P */
+
+	wpa_printf(MSG_DEBUG, "dbus: WPS.Start - unknown key %s", key);
+	*reply = wpas_dbus_error_invalid_args(message, key);
+@@ -231,12 +274,31 @@ DBusMessage * wpas_dbus_handler_wps_start(DBusMessage *message,
+		ret = wpas_wps_start_reg(wpa_s, params.bssid, params.pin,
+					 NULL);
+	else if (params.type == 1) {
+-		ret = wpas_wps_start_pin(wpa_s, params.bssid, params.pin, 0,
+-					 DEV_PW_DEFAULT);
+-		if (ret > 0)
+-			os_snprintf(npin, sizeof(npin), "%08d", ret);
+-	} else
++#ifdef CONFIG_AP
++		if (wpa_s->ap_iface)
++			ret = wpa_supplicant_ap_wps_pin(wpa_s,
++							params.bssid,
++							params.pin,
++							npin, sizeof(npin));
++		else
++#endif /* CONFIG_AP */
++		{
++			ret = wpas_wps_start_pin(wpa_s, params.bssid,
++						 params.pin, 0,
++						 DEV_PW_DEFAULT);
++			if (ret > 0)
++				os_snprintf(npin, sizeof(npin), "%08d", ret);
++		}
++	} else {
++#ifdef CONFIG_AP
++		if (wpa_s->ap_iface)
++			ret = wpa_supplicant_ap_wps_pbc(wpa_s,
++							params.bssid,
++							params.p2p_dev_addr);
++		else
++#endif /* CONFIG_AP */
+		ret = wpas_wps_start_pbc(wpa_s, params.bssid, 0);
++	}
+
+	if (ret < 0) {
+		wpa_printf(MSG_DEBUG, "dbus: WPS.Start wpas_wps_failed in "
+--
+1.7.10
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/99_wpa_supplicant b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/99_wpa_supplicant
new file mode 100644
index 0000000..6ff4dd8
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/99_wpa_supplicant
@@ -0,0 +1 @@
+d root root 0700 /var/run/wpa_supplicant none
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defaults-sane b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defaults-sane
new file mode 100644
index 0000000..67c4cbd
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defaults-sane
@@ -0,0 +1,8 @@
+# Useful flags:
+#  -i <ifname>          Interface (required, unless specified in config)
+#  -D <driver>          Wireless Driver
+#  -d                   Debugging (-dd for more)
+#  -q                   Quiet (-qq for more)
+
+CONFIG="/etc/wpa_supplicant.conf"
+OPTIONS="-i eth1 -D wext"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
new file mode 100755
index 0000000..9b9882a
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -0,0 +1,426 @@
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
+#CC=$(CROSS_COMPILE)gcc
+#CFLAGS += -DCONFIG_LIBNL20
+#CPPFLAGS += -DCONFIG_LIBNL20
+#LIBS += -L$(NFSROOT)/lib -lnl
+#LIBS_p += -L$(NFSROOT)/lib
+#LIBDIR = $(NFSROOT)/lib
+#BINDIR = $(NFSROOT)/usr/sbin
+
+CONFIG_WAPI=y
+CONFIG_LIBNL20=y
+NEED_BGSCAN=y
+CONFIG_BGSCAN_LEARN=y
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
+# Please note that the newer Broadcom driver ("hybrid Linux driver") supportsBG
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
+CONFIG_DRIVER_WEXT=y
+
+# Driver interface for Linux drivers using the nl80211 kernel interface
+CONFIG_DRIVER_NL80211=y
+
+# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
+#CONFIG_DRIVER_BSD=y
+#CFLAGS += -I/usr/local/include
+#LIBS += -L/usr/local/lib
+#LIBS_p += -L/usr/local/libBG
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
+# Include client MLME (management frame processing) for test driver
+# This can be used to test MLME operations in hostapd with the test interface.
+# space.
+#CONFIG_CLIENT_MLME=y
+
+# Driver interface for wired Ethernet drivers
+CONFIG_DRIVER_WIRED=y
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
+#CONFIG_EAP_FAST=y
+
+# EAP-GTC
+CONFIG_EAP_GTC=y
+
+# EAP-OTP
+CONFIG_EAP_OTP=y
+
+# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
+#CONFIG_EAP_SIM=y
+
+# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
+#CONFIG_EAP_PSK=y
+
+# EAP-PAX
+#CONFIG_EAP_PAX=y
+
+# LEAP
+CONFIG_EAP_LEAP=y
+
+# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
+#CONFIG_EAP_AKA=y
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
+# Development testingBG
+#CONFIG_EAPOL_TEST=y
+
+# Select control interface backend for external programs, e.g, wpa_cli:
+# unix = UNIX domain sockets (default for Linux/*BSD)
+# udp = UDP sockets using localhost (127.0.0.1)
+# named_pipe = Windows Named Pipe (default for Windows)
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
+# Remove WPA2 support. This allows WPA to be used, but removes WPA2 code to
+# save about 1 kB in code size when building only WPA-Personal (no EAP support)
+# or 6 kB if building for WPA-Enterprise.
+#CONFIG_NO_WPA2=y
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
+#CONFIG_OS=unix
+
+# Select event loop implementation
+# eloop = select() loop (default)
+# eloop_win = Windows events and WaitForMultipleObject() loop
+# eloop_none = Empty template
+#CONFIG_ELOOP=eloop
+
+# Select layer 2 packet implementation
+# linux = Linux packet socket (default)
+# pcap = libpcap/libdnet/WinPcap
+# freebsd = FreeBSD libpcap
+# winpcap = WinPcap with receive thread
+# ndis = Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=y)
+# none = Empty template
+#CONFIG_L2_PACKET=linux
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
+# Select TLS implementation
+# openssl = OpenSSL (default)
+# gnutls = GnuTLS (needed for TLS/IA, see also CONFIG_GNUTLS_EXTRA)
+# internal = Internal TLSv1 implementation (experimental)
+# none = Empty template
+#CONFIG_TLS=openssl
+
+# Whether to enable TLS/IA support, which is required for EAP-TTLSv1.
+# You need CONFIG_TLS=gnutls for this to have any effect. Please note that
+# even though the core GnuTLS library is released under LGPL, this extra
+# library uses GPL and as such, the terms of GPL apply to the combination
+# of wpa_supplicant and GnuTLS if this option is enabled. BSD license may not
+# apply for distribution of the resulting binary.
+#CONFIG_GNUTLS_EXTRA=y
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
+CONFIG_CTRL_IFACE_DBUS=y
+
+# Add support for new DBus control interface
+# (fi.w1.hostap.wpa_supplicant1)
+CONFIG_CTRL_IFACE_DBUS_NEW=y
+
+# Add introspection support for new DBus control interface
+CONFIG_CTRL_IFACE_DBUS_INTRO=y
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
+#CONFIG_IEEE80211R=y
+
+# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#.txt)
+CONFIG_DEBUG_FILE=y
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
+
+# for p2p
+CONFIG_P2P=y
+CONFIG_AP=y
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
new file mode 100644
index 0000000..fb3f917
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
@@ -0,0 +1,4 @@
+[D-BUS Service]
+Name=fi.epitest.hostap.WPASupplicant
+Exec=/usr/sbin/wpa_supplicant -d -Dnl80211 -c/etc/wpa_supplicant.conf -iwlan0 -B -u
+User=root
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
new file mode 100644
index 0000000..0bb1056
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
@@ -0,0 +1,4 @@
+[D-BUS Service]
+Name=fi.w1.wpa_supplicant1
+Exec=/usr/sbin/wpa_supplicant -d -Dnl80211 -c/etc/wpa_supplicant.conf -iwlan0 -B -u
+User=root
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
new file mode 100644
index 0000000..4f1001e
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
@@ -0,0 +1,85 @@
+#!/bin/sh
+
+
+WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
+WPA_SUP_PNAME="wpa_supplicant"
+WPA_SUP_PIDFILE="/var/run/wpa_supplicant.$IFACE.pid"
+WPA_SUP_OPTIONS="-B -P $WPA_SUP_PIDFILE -i $IFACE"
+
+VERBOSITY=0
+
+
+if [ -s "$IF_WPA_CONF" ]; then
+	WPA_SUP_CONF="-c $IF_WPA_CONF"
+else
+	exit 0
+fi
+
+if [ ! -x "$WPA_SUP_BIN" ]; then
+
+	if [ "$VERBOSITY" = "1" ]; then
+		echo "$WPA_SUP_PNAME: binaries not executable or missing from $WPA_SUP_BIN"
+	fi
+
+	exit 1
+fi
+
+if [ "$MODE" = "start" ] ; then
+	# driver type of interface, defaults to wext when undefined
+	if [ -s "/etc/wpa_supplicant/driver.$IFACE" ]; then
+		IF_WPA_DRIVER=$(cat "/etc/wpa_supplicant/driver.$IFACE")
+	elif [ -z "$IF_WPA_DRIVER" ]; then
+
+		if [ "$VERBOSITY" = "1" ]; then
+			echo "$WPA_SUP_PNAME: wpa-driver not provided, using \"wext\""
+		fi
+
+		IF_WPA_DRIVER="wext"
+	fi
+
+	# if we have passed the criteria, start wpa_supplicant
+	if [ -n "$WPA_SUP_CONF" ]; then
+
+		if [ "$VERBOSITY" = "1" ]; then
+			echo "$WPA_SUP_PNAME: $WPA_SUP_BIN $WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER"
+		fi
+
+		start-stop-daemon --start --quiet \
+			--name $WPA_SUP_PNAME --startas $WPA_SUP_BIN --pidfile $WPA_SUP_PIDFILE \
+			--  $WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER
+	fi
+
+	# if the interface socket exists, then wpa_supplicant was invoked successfully
+	if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
+
+		if [ "$VERBOSITY" = "1" ]; then
+			echo "$WPA_SUP_PNAME: ctrl_interface socket located at $WPA_COMMON_CTRL_IFACE/$IFACE"
+		fi
+
+		exit 0
+
+	fi
+
+elif [ "$MODE" = "stop" ]; then
+
+	if [ -f "$WPA_SUP_PIDFILE" ]; then
+
+		if [ "$VERBOSITY" = "1" ]; then
+			echo "$WPA_SUP_PNAME: terminating $WPA_SUP_PNAME daemon"
+		fi
+
+		start-stop-daemon --stop --quiet \
+			--name $WPA_SUP_PNAME --pidfile	$WPA_SUP_PIDFILE
+
+		if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
+			rm -f $WPA_COMMON_CTRL_IFACE/$IFACE
+		fi
+
+		if [ -f "$WPA_SUP_PIDFILE" ]; then
+			rm -f $WPA_SUP_PIDFILE
+		fi
+	fi
+
+fi
+
+exit 0
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
new file mode 100644
index 0000000..f0c993d
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
@@ -0,0 +1,690 @@
+##### Example wpa_supplicant configuration file ###############################
+#
+# This file describes configuration file format and lists all available option.
+# Please also take a look at simpler configuration examples in 'examples'
+# subdirectory.
+#
+# Empty lines and lines starting with # are ignored
+
+# NOTE! This file may contain password information and should probably be made
+# readable only by root user on multiuser systems.
+
+# Note: All file paths in this configuration file should use full (absolute,
+# not relative to working directory) path in order to allow working directory
+# to be changed. This can happen if wpa_supplicant is run in the background.
+
+# Whether to allow wpa_supplicant to update (overwrite) configuration
+#
+# This option can be used to allow wpa_supplicant to overwrite configuration
+# file whenever configuration is changed (e.g., new network block is added with
+# wpa_cli or wpa_gui, or a password is changed). This is required for
+# wpa_cli/wpa_gui to be able to store the configuration changes permanently.
+# Please note that overwriting configuration file will remove the comments from
+# it.
+#update_config=1
+
+# global configuration (shared by all network blocks)
+#
+# Parameters for the control interface. If this is specified, wpa_supplicant
+# will open a control interface that is available for external programs to
+# manage wpa_supplicant. The meaning of this string depends on which control
+# interface mechanism is used. For all cases, the existance of this parameter
+# in configuration is used to determine whether the control interface is
+# enabled.
+#
+# For UNIX domain sockets (default on Linux and BSD): This is a directory that
+# will be created for UNIX domain sockets for listening to requests from
+# external programs (CLI/GUI, etc.) for status information and configuration.
+# The socket file will be named based on the interface name, so multiple
+# wpa_supplicant processes can be run at the same time if more than one
+# interface is used.
+# /var/run/wpa_supplicant is the recommended directory for sockets and by
+# default, wpa_cli will use it when trying to connect with wpa_supplicant.
+#
+# Access control for the control interface can be configured by setting the
+# directory to allow only members of a group to use sockets. This way, it is
+# possible to run wpa_supplicant as root (since it needs to change network
+# configuration and open raw sockets) and still allow GUI/CLI components to be
+# run as non-root users. However, since the control interface can be used to
+# change the network configuration, this access needs to be protected in many
+# cases. By default, wpa_supplicant is configured to use gid 0 (root). If you
+# want to allow non-root users to use the control interface, add a new group
+# and change this value to match with that group. Add users that should have
+# control interface access to this group. If this variable is commented out or
+# not included in the configuration file, group will not be changed from the
+# value it got by default when the directory or socket was created.
+#
+# When configuring both the directory and group, use following format:
+# DIR=/var/run/wpa_supplicant GROUP=wheel
+# DIR=/var/run/wpa_supplicant GROUP=0
+# (group can be either group name or gid)
+#
+# For UDP connections (default on Windows): The value will be ignored. This
+# variable is just used to select that the control interface is to be created.
+# The value can be set to, e.g., udp (ctrl_interface=udp)
+#
+# For Windows Named Pipe: This value can be used to set the security descriptor
+# for controlling access to the control interface. Security descriptor can be
+# set using Security Descriptor String Format (see http://msdn.microsoft.com/
+# library/default.asp?url=/library/en-us/secauthz/security/
+# security_descriptor_string_format.asp). The descriptor string needs to be
+# prefixed with SDDL=. For example, ctrl_interface=SDDL=D: would set an empty
+# DACL (which will reject all connections). See README-Windows.txt for more
+# information about SDDL string format.
+#
+ctrl_interface=/var/run/wpa_supplicant
+
+# IEEE 802.1X/EAPOL version
+# wpa_supplicant is implemented based on IEEE Std 802.1X-2004 which defines
+# EAPOL version 2. However, there are many APs that do not handle the new
+# version number correctly (they seem to drop the frames completely). In order
+# to make wpa_supplicant interoperate with these APs, the version number is set
+# to 1 by default. This configuration value can be used to set it to the new
+# version (2).
+eapol_version=1
+
+# AP scanning/selection
+# By default, wpa_supplicant requests driver to perform AP scanning and then
+# uses the scan results to select a suitable AP. Another alternative is to
+# allow the driver to take care of AP scanning and selection and use
+# wpa_supplicant just to process EAPOL frames based on IEEE 802.11 association
+# information from the driver.
+# 1: wpa_supplicant initiates scanning and AP selection
+# 0: driver takes care of scanning, AP selection, and IEEE 802.11 association
+#    parameters (e.g., WPA IE generation); this mode can also be used with
+#    non-WPA drivers when using IEEE 802.1X mode; do not try to associate with
+#    APs (i.e., external program needs to control association). This mode must
+#    also be used when using wired Ethernet drivers.
+# 2: like 0, but associate with APs using security policy and SSID (but not
+#    BSSID); this can be used, e.g., with ndiswrapper and NDIS drivers to
+#    enable operation with hidden SSIDs and optimized roaming; in this mode,
+#    the network blocks in the configuration file are tried one by one until
+#    the driver reports successful association; each network block should have
+#    explicit security policy (i.e., only one option in the lists) for
+#    key_mgmt, pairwise, group, proto variables
+ap_scan=1
+
+# EAP fast re-authentication
+# By default, fast re-authentication is enabled for all EAP methods that
+# support it. This variable can be used to disable fast re-authentication.
+# Normally, there is no need to disable this.
+fast_reauth=1
+
+# OpenSSL Engine support
+# These options can be used to load OpenSSL engines.
+# The two engines that are supported currently are shown below:
+# They are both from the opensc project (http://www.opensc.org/)
+# By default no engines are loaded.
+# make the opensc engine available
+#opensc_engine_path=/usr/lib/opensc/engine_opensc.so
+# make the pkcs11 engine available
+#pkcs11_engine_path=/usr/lib/opensc/engine_pkcs11.so
+# configure the path to the pkcs11 module required by the pkcs11 engine
+#pkcs11_module_path=/usr/lib/pkcs11/opensc-pkcs11.so
+
+# Dynamic EAP methods
+# If EAP methods were built dynamically as shared object files, they need to be
+# loaded here before being used in the network blocks. By default, EAP methods
+# are included statically in the build, so these lines are not needed
+#load_dynamic_eap=/usr/lib/wpa_supplicant/eap_tls.so
+#load_dynamic_eap=/usr/lib/wpa_supplicant/eap_md5.so
+
+# Driver interface parameters
+# This field can be used to configure arbitrary driver interace parameters. The
+# format is specific to the selected driver interface. This field is not used
+# in most cases.
+#driver_param="field=value"
+
+# Maximum lifetime for PMKSA in seconds; default 43200
+#dot11RSNAConfigPMKLifetime=43200
+# Threshold for reauthentication (percentage of PMK lifetime); default 70
+#dot11RSNAConfigPMKReauthThreshold=70
+# Timeout for security association negotiation in seconds; default 60
+#dot11RSNAConfigSATimeout=60
+
+# network block
+#
+# Each network (usually AP's sharing the same SSID) is configured as a separate
+# block in this configuration file. The network blocks are in preference order
+# (the first match is used).
+#
+# network block fields:
+#
+# disabled:
+#	0 = this network can be used (default)
+#	1 = this network block is disabled (can be enabled through ctrl_iface,
+#	    e.g., with wpa_cli or wpa_gui)
+#
+# id_str: Network identifier string for external scripts. This value is passed
+#	to external action script through wpa_cli as WPA_ID_STR environment
+#	variable to make it easier to do network specific configuration.
+#
+# ssid: SSID (mandatory); either as an ASCII string with double quotation or
+#	as hex string; network name
+#
+# scan_ssid:
+#	0 = do not scan this SSID with specific Probe Request frames (default)
+#	1 = scan with SSID-specific Probe Request frames (this can be used to
+#	    find APs that do not accept broadcast SSID or use multiple SSIDs;
+#	    this will add latency to scanning, so enable this only when needed)
+#
+# bssid: BSSID (optional); if set, this network block is used only when
+#	associating with the AP using the configured BSSID
+#
+# priority: priority group (integer)
+# By default, all networks will get same priority group (0). If some of the
+# networks are more desirable, this field can be used to change the order in
+# which wpa_supplicant goes through the networks when selecting a BSS. The
+# priority groups will be iterated in decreasing priority (i.e., the larger the
+# priority value, the sooner the network is matched against the scan results).
+# Within each priority group, networks will be selected based on security
+# policy, signal strength, etc.
+# Please note that AP scanning with scan_ssid=1 and ap_scan=2 mode are not
+# using this priority to select the order for scanning. Instead, they try the
+# networks in the order that used in the configuration file.
+#
+# mode: IEEE 802.11 operation mode
+# 0 = infrastructure (Managed) mode, i.e., associate with an AP (default)
+# 1 = IBSS (ad-hoc, peer-to-peer)
+# Note: IBSS can only be used with key_mgmt NONE (plaintext and static WEP)
+# and key_mgmt=WPA-NONE (fixed group key TKIP/CCMP). In addition, ap_scan has
+# to be set to 2 for IBSS. WPA-None requires following network block options:
+# proto=WPA, key_mgmt=WPA-NONE, pairwise=NONE, group=TKIP (or CCMP, but not
+# both), and psk must also be set.
+#
+# proto: list of accepted protocols
+# WPA = WPA/IEEE 802.11i/D3.0
+# RSN = WPA2/IEEE 802.11i (also WPA2 can be used as an alias for RSN)
+# If not set, this defaults to: WPA RSN
+#
+# key_mgmt: list of accepted authenticated key management protocols
+# WPA-PSK = WPA pre-shared key (this requires 'psk' field)
+# WPA-EAP = WPA using EAP authentication (this can use an external
+#	program, e.g., Xsupplicant, for IEEE 802.1X EAP Authentication
+# IEEE8021X = IEEE 802.1X using EAP authentication and (optionally) dynamically
+#	generated WEP keys
+# NONE = WPA is not used; plaintext or static WEP could be used
+# If not set, this defaults to: WPA-PSK WPA-EAP
+#
+# auth_alg: list of allowed IEEE 802.11 authentication algorithms
+# OPEN = Open System authentication (required for WPA/WPA2)
+# SHARED = Shared Key authentication (requires static WEP keys)
+# LEAP = LEAP/Network EAP (only used with LEAP)
+# If not set, automatic selection is used (Open System with LEAP enabled if
+# LEAP is allowed as one of the EAP methods).
+#
+# pairwise: list of accepted pairwise (unicast) ciphers for WPA
+# CCMP = AES in Counter mode with CBC-MAC [RFC 3610, IEEE 802.11i/D7.0]
+# TKIP = Temporal Key Integrity Protocol [IEEE 802.11i/D7.0]
+# NONE = Use only Group Keys (deprecated, should not be included if APs support
+#	pairwise keys)
+# If not set, this defaults to: CCMP TKIP
+#
+# group: list of accepted group (broadcast/multicast) ciphers for WPA
+# CCMP = AES in Counter mode with CBC-MAC [RFC 3610, IEEE 802.11i/D7.0]
+# TKIP = Temporal Key Integrity Protocol [IEEE 802.11i/D7.0]
+# WEP104 = WEP (Wired Equivalent Privacy) with 104-bit key
+# WEP40 = WEP (Wired Equivalent Privacy) with 40-bit key [IEEE 802.11]
+# If not set, this defaults to: CCMP TKIP WEP104 WEP40
+#
+# psk: WPA preshared key; 256-bit pre-shared key
+# The key used in WPA-PSK mode can be entered either as 64 hex-digits, i.e.,
+# 32 bytes or as an ASCII passphrase (in which case, the real PSK will be
+# generated using the passphrase and SSID). ASCII passphrase must be between
+# 8 and 63 characters (inclusive).
+# This field is not needed, if WPA-EAP is used.
+# Note: Separate tool, wpa_passphrase, can be used to generate 256-bit keys
+# from ASCII passphrase. This process uses lot of CPU and wpa_supplicant
+# startup and reconfiguration time can be optimized by generating the PSK only
+# only when the passphrase or SSID has actually changed.
+#
+# eapol_flags: IEEE 802.1X/EAPOL options (bit field)
+# Dynamic WEP key required for non-WPA mode
+# bit0 (1): require dynamically generated unicast WEP key
+# bit1 (2): require dynamically generated broadcast WEP key
+# 	(3 = require both keys; default)
+# Note: When using wired authentication, eapol_flags must be set to 0 for the
+# authentication to be completed successfully.
+#
+# proactive_key_caching:
+# Enable/disable opportunistic PMKSA caching for WPA2.
+# 0 = disabled (default)
+# 1 = enabled
+#
+# wep_key0..3: Static WEP key (ASCII in double quotation, e.g. "abcde" or
+# hex without quotation, e.g., 0102030405)
+# wep_tx_keyidx: Default WEP key index (TX) (0..3)
+#
+# peerkey: Whether PeerKey negotiation for direct links (IEEE 802.11e DLS) is
+# allowed. This is only used with RSN/WPA2.
+# 0 = disabled (default)
+# 1 = enabled
+#peerkey=1
+#
+# Following fields are only used with internal EAP implementation.
+# eap: space-separated list of accepted EAP methods
+#	MD5 = EAP-MD5 (unsecure and does not generate keying material ->
+#			cannot be used with WPA; to be used as a Phase 2 method
+#			with EAP-PEAP or EAP-TTLS)
+#       MSCHAPV2 = EAP-MSCHAPv2 (cannot be used separately with WPA; to be used
+#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
+#       OTP = EAP-OTP (cannot be used separately with WPA; to be used
+#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
+#       GTC = EAP-GTC (cannot be used separately with WPA; to be used
+#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
+#	TLS = EAP-TLS (client and server certificate)
+#	PEAP = EAP-PEAP (with tunnelled EAP authentication)
+#	TTLS = EAP-TTLS (with tunnelled EAP or PAP/CHAP/MSCHAP/MSCHAPV2
+#			 authentication)
+#	If not set, all compiled in methods are allowed.
+#
+# identity: Identity string for EAP
+# anonymous_identity: Anonymous identity string for EAP (to be used as the
+#	unencrypted identity with EAP types that support different tunnelled
+#	identity, e.g., EAP-TTLS)
+# password: Password string for EAP
+# ca_cert: File path to CA certificate file (PEM/DER). This file can have one
+#	or more trusted CA certificates. If ca_cert and ca_path are not
+#	included, server certificate will not be verified. This is insecure and
+#	a trusted CA certificate should always be configured when using
+#	EAP-TLS/TTLS/PEAP. Full path should be used since working directory may
+#	change when wpa_supplicant is run in the background.
+#	On Windows, trusted CA certificates can be loaded from the system
+#	certificate store by setting this to cert_store://<name>, e.g.,
+#	ca_cert="cert_store://CA" or ca_cert="cert_store://ROOT".
+#	Note that when running wpa_supplicant as an application, the user
+#	certificate store (My user account) is used, whereas computer store
+#	(Computer account) is used when running wpasvc as a service.
+# ca_path: Directory path for CA certificate files (PEM). This path may
+#	contain multiple CA certificates in OpenSSL format. Common use for this
+#	is to point to system trusted CA list which is often installed into
+#	directory like /etc/ssl/certs. If configured, these certificates are
+#	added to the list of trusted CAs. ca_cert may also be included in that
+#	case, but it is not required.
+# client_cert: File path to client certificate file (PEM/DER)
+#	Full path should be used since working directory may change when
+#	wpa_supplicant is run in the background.
+#	Alternatively, a named configuration blob can be used by setting this
+#	to blob://<blob name>.
+# private_key: File path to client private key file (PEM/DER/PFX)
+#	When PKCS#12/PFX file (.p12/.pfx) is used, client_cert should be
+#	commented out. Both the private key and certificate will be read from
+#	the PKCS#12 file in this case. Full path should be used since working
+#	directory may change when wpa_supplicant is run in the background.
+#	Windows certificate store can be used by leaving client_cert out and
+#	configuring private_key in one of the following formats:
+#	cert://substring_to_match
+#	hash://certificate_thumbprint_in_hex
+#	for example: private_key="hash://63093aa9c47f56ae88334c7b65a4"
+#	Note that when running wpa_supplicant as an application, the user
+#	certificate store (My user account) is used, whereas computer store
+#	(Computer account) is used when running wpasvc as a service.
+#	Alternatively, a named configuration blob can be used by setting this
+#	to blob://<blob name>.
+# private_key_passwd: Password for private key file (if left out, this will be
+#	asked through control interface)
+# dh_file: File path to DH/DSA parameters file (in PEM format)
+#	This is an optional configuration file for setting parameters for an
+#	ephemeral DH key exchange. In most cases, the default RSA
+#	authentication does not use this configuration. However, it is possible
+#	setup RSA to use ephemeral DH key exchange. In addition, ciphers with
+#	DSA keys always use ephemeral DH keys. This can be used to achieve
+#	forward secrecy. If the file is in DSA parameters format, it will be
+#	automatically converted into DH params.
+# subject_match: Substring to be matched against the subject of the
+#	authentication server certificate. If this string is set, the server
+#	sertificate is only accepted if it contains this string in the subject.
+#	The subject string is in following format:
+#	/C=US/ST=CA/L=San Francisco/CN=Test AS/emailAddress=as@example.com
+# altsubject_match: Semicolon separated string of entries to be matched against
+#	the alternative subject name of the authentication server certificate.
+#	If this string is set, the server sertificate is only accepted if it
+#	contains one of the entries in an alternative subject name extension.
+#	altSubjectName string is in following format: TYPE:VALUE
+#	Example: EMAIL:server@example.com
+#	Example: DNS:server.example.com;DNS:server2.example.com
+#	Following types are supported: EMAIL, DNS, URI
+# phase1: Phase1 (outer authentication, i.e., TLS tunnel) parameters
+#	(string with field-value pairs, e.g., "peapver=0" or
+#	"peapver=1 peaplabel=1")
+#	'peapver' can be used to force which PEAP version (0 or 1) is used.
+#	'peaplabel=1' can be used to force new label, "client PEAP encryption",
+#	to be used during key derivation when PEAPv1 or newer. Most existing
+#	PEAPv1 implementation seem to be using the old label, "client EAP
+#	encryption", and wpa_supplicant is now using that as the default value.
+#	Some servers, e.g., Radiator, may require peaplabel=1 configuration to
+#	interoperate with PEAPv1; see eap_testing.txt for more details.
+#	'peap_outer_success=0' can be used to terminate PEAP authentication on
+#	tunneled EAP-Success. This is required with some RADIUS servers that
+#	implement draft-josefsson-pppext-eap-tls-eap-05.txt (e.g.,
+#	Lucent NavisRadius v4.4.0 with PEAP in "IETF Draft 5" mode)
+#	include_tls_length=1 can be used to force wpa_supplicant to include
+#	TLS Message Length field in all TLS messages even if they are not
+#	fragmented.
+#	sim_min_num_chal=3 can be used to configure EAP-SIM to require three
+#	challenges (by default, it accepts 2 or 3)
+# phase2: Phase2 (inner authentication with TLS tunnel) parameters
+#	(string with field-value pairs, e.g., "auth=MSCHAPV2" for EAP-PEAP or
+#	"autheap=MSCHAPV2 autheap=MD5" for EAP-TTLS)
+# Following certificate/private key fields are used in inner Phase2
+# authentication when using EAP-TTLS or EAP-PEAP.
+# ca_cert2: File path to CA certificate file. This file can have one or more
+#	trusted CA certificates. If ca_cert2 and ca_path2 are not included,
+#	server certificate will not be verified. This is insecure and a trusted
+#	CA certificate should always be configured.
+# ca_path2: Directory path for CA certificate files (PEM)
+# client_cert2: File path to client certificate file
+# private_key2: File path to client private key file
+# private_key2_passwd: Password for private key file
+# dh_file2: File path to DH/DSA parameters file (in PEM format)
+# subject_match2: Substring to be matched against the subject of the
+#	authentication server certificate.
+# altsubject_match2: Substring to be matched against the alternative subject
+#	name of the authentication server certificate.
+#
+# fragment_size: Maximum EAP fragment size in bytes (default 1398).
+#	This value limits the fragment size for EAP methods that support
+#	fragmentation (e.g., EAP-TLS and EAP-PEAP). This value should be set
+#	small enough to make the EAP messages fit in MTU of the network
+#	interface used for EAPOL. The default value is suitable for most
+#	cases.
+#
+# EAP-PSK variables:
+# eappsk: 16-byte (128-bit, 32 hex digits) pre-shared key in hex format
+# nai: user NAI
+#
+# EAP-PAX variables:
+# eappsk: 16-byte (128-bit, 32 hex digits) pre-shared key in hex format
+#
+# EAP-SAKE variables:
+# eappsk: 32-byte (256-bit, 64 hex digits) pre-shared key in hex format
+#	(this is concatenation of Root-Secret-A and Root-Secret-B)
+# nai: user NAI (PEERID)
+#
+# EAP-GPSK variables:
+# eappsk: Pre-shared key in hex format (at least 128 bits, i.e., 32 hex digits)
+# nai: user NAI (ID_Client)
+#
+# EAP-FAST variables:
+# pac_file: File path for the PAC entries. wpa_supplicant will need to be able
+#	to create this file and write updates to it when PAC is being
+#	provisioned or refreshed. Full path to the file should be used since
+#	working directory may change when wpa_supplicant is run in the
+#	background. Alternatively, a named configuration blob can be used by
+#	setting this to blob://<blob name>
+# phase1: fast_provisioning=1 option enables in-line provisioning of EAP-FAST
+#	credentials (PAC)
+#
+# wpa_supplicant supports number of "EAP workarounds" to work around
+# interoperability issues with incorrectly behaving authentication servers.
+# These are enabled by default because some of the issues are present in large
+# number of authentication servers. Strict EAP conformance mode can be
+# configured by disabling workarounds with eap_workaround=0.
+
+# Example blocks:
+
+# Simple case: WPA-PSK, PSK as an ASCII passphrase, allow all valid ciphers
+network={
+	ssid="simple"
+	psk="very secret passphrase"
+	priority=5
+}
+
+# Same as previous, but request SSID-specific scanning (for APs that reject
+# broadcast SSID)
+network={
+	ssid="second ssid"
+	scan_ssid=1
+	psk="very secret passphrase"
+	priority=2
+}
+
+# Only WPA-PSK is used. Any valid cipher combination is accepted.
+network={
+	ssid="example"
+	proto=WPA
+	key_mgmt=WPA-PSK
+	pairwise=CCMP TKIP
+	group=CCMP TKIP WEP104 WEP40
+	psk=06b4be19da289f475aa46a33cb793029d4ab3db7a23ee92382eb0106c72ac7bb
+	priority=2
+}
+
+# Only WPA-EAP is used. Both CCMP and TKIP is accepted. An AP that used WEP104
+# or WEP40 as the group cipher will not be accepted.
+network={
+	ssid="example"
+	proto=RSN
+	key_mgmt=WPA-EAP
+	pairwise=CCMP TKIP
+	group=CCMP TKIP
+	eap=TLS
+	identity="user@example.com"
+	ca_cert="/etc/cert/ca.pem"
+	client_cert="/etc/cert/user.pem"
+	private_key="/etc/cert/user.prv"
+	private_key_passwd="password"
+	priority=1
+}
+
+# EAP-PEAP/MSCHAPv2 configuration for RADIUS servers that use the new peaplabel
+# (e.g., Radiator)
+network={
+	ssid="example"
+	key_mgmt=WPA-EAP
+	eap=PEAP
+	identity="user@example.com"
+	password="foobar"
+	ca_cert="/etc/cert/ca.pem"
+	phase1="peaplabel=1"
+	phase2="auth=MSCHAPV2"
+	priority=10
+}
+
+# EAP-TTLS/EAP-MD5-Challenge configuration with anonymous identity for the
+# unencrypted use. Real identity is sent only within an encrypted TLS tunnel.
+network={
+	ssid="example"
+	key_mgmt=WPA-EAP
+	eap=TTLS
+	identity="user@example.com"
+	anonymous_identity="anonymous@example.com"
+	password="foobar"
+	ca_cert="/etc/cert/ca.pem"
+	priority=2
+}
+
+# EAP-TTLS/MSCHAPv2 configuration with anonymous identity for the unencrypted
+# use. Real identity is sent only within an encrypted TLS tunnel.
+network={
+	ssid="example"
+	key_mgmt=WPA-EAP
+	eap=TTLS
+	identity="user@example.com"
+	anonymous_identity="anonymous@example.com"
+	password="foobar"
+	ca_cert="/etc/cert/ca.pem"
+	phase2="auth=MSCHAPV2"
+}
+
+# WPA-EAP, EAP-TTLS with different CA certificate used for outer and inner
+# authentication.
+network={
+	ssid="example"
+	key_mgmt=WPA-EAP
+	eap=TTLS
+	# Phase1 / outer authentication
+	anonymous_identity="anonymous@example.com"
+	ca_cert="/etc/cert/ca.pem"
+	# Phase 2 / inner authentication
+	phase2="autheap=TLS"
+	ca_cert2="/etc/cert/ca2.pem"
+	client_cert2="/etc/cer/user.pem"
+	private_key2="/etc/cer/user.prv"
+	private_key2_passwd="password"
+	priority=2
+}
+
+# Both WPA-PSK and WPA-EAP is accepted. Only CCMP is accepted as pairwise and
+# group cipher.
+network={
+	ssid="example"
+	bssid=00:11:22:33:44:55
+	proto=WPA RSN
+	key_mgmt=WPA-PSK WPA-EAP
+	pairwise=CCMP
+	group=CCMP
+	psk=06b4be19da289f475aa46a33cb793029d4ab3db7a23ee92382eb0106c72ac7bb
+}
+
+# Special characters in SSID, so use hex string. Default to WPA-PSK, WPA-EAP
+# and all valid ciphers.
+network={
+	ssid=00010203
+	psk=000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f
+}
+
+
+# IEEE 802.1X/EAPOL with dynamically generated WEP keys (i.e., no WPA) using
+# EAP-TLS for authentication and key generation; require both unicast and
+# broadcast WEP keys.
+network={
+	ssid="1x-test"
+	key_mgmt=IEEE8021X
+	eap=TLS
+	identity="user@example.com"
+	ca_cert="/etc/cert/ca.pem"
+	client_cert="/etc/cert/user.pem"
+	private_key="/etc/cert/user.prv"
+	private_key_passwd="password"
+	eapol_flags=3
+}
+
+
+# LEAP with dynamic WEP keys
+network={
+	ssid="leap-example"
+	key_mgmt=IEEE8021X
+	eap=LEAP
+	identity="user"
+	password="foobar"
+}
+
+# Plaintext connection (no WPA, no IEEE 802.1X)
+network={
+	ssid="plaintext-test"
+	key_mgmt=NONE
+}
+
+
+# Shared WEP key connection (no WPA, no IEEE 802.1X)
+network={
+	ssid="static-wep-test"
+	key_mgmt=NONE
+	wep_key0="abcde"
+	wep_key1=0102030405
+	wep_key2="1234567890123"
+	wep_tx_keyidx=0
+	priority=5
+}
+
+
+# Shared WEP key connection (no WPA, no IEEE 802.1X) using Shared Key
+# IEEE 802.11 authentication
+network={
+	ssid="static-wep-test2"
+	key_mgmt=NONE
+	wep_key0="abcde"
+	wep_key1=0102030405
+	wep_key2="1234567890123"
+	wep_tx_keyidx=0
+	priority=5
+	auth_alg=SHARED
+}
+
+
+# IBSS/ad-hoc network with WPA-None/TKIP.
+network={
+	ssid="test adhoc"
+	mode=1
+	proto=WPA
+	key_mgmt=WPA-NONE
+	pairwise=NONE
+	group=TKIP
+	psk="secret passphrase"
+}
+
+
+# Catch all example that allows more or less all configuration modes
+network={
+	ssid="example"
+	scan_ssid=1
+	key_mgmt=WPA-EAP WPA-PSK IEEE8021X NONE
+	pairwise=CCMP TKIP
+	group=CCMP TKIP WEP104 WEP40
+	psk="very secret passphrase"
+	eap=TTLS PEAP TLS
+	identity="user@example.com"
+	password="foobar"
+	ca_cert="/etc/cert/ca.pem"
+	client_cert="/etc/cert/user.pem"
+	private_key="/etc/cert/user.prv"
+	private_key_passwd="password"
+	phase1="peaplabel=0"
+}
+
+# Example of EAP-TLS with smartcard (openssl engine)
+network={
+	ssid="example"
+	key_mgmt=WPA-EAP
+	eap=TLS
+	proto=RSN
+	pairwise=CCMP TKIP
+	group=CCMP TKIP
+	identity="user@example.com"
+	ca_cert="/etc/cert/ca.pem"
+	client_cert="/etc/cert/user.pem"
+
+	engine=1
+
+	# The engine configured here must be available. Look at
+	# OpenSSL engine support in the global section.
+	# The key available through the engine must be the private key
+	# matching the client certificate configured above.
+
+	# use the opensc engine
+	#engine_id="opensc"
+	#key_id="45"
+
+	# use the pkcs11 engine
+	engine_id="pkcs11"
+	key_id="id_45"
+
+	# Optional PIN configuration; this can be left out and PIN will be
+	# asked through the control interface
+	pin="1234"
+}
+
+# Example configuration showing how to use an inlined blob as a CA certificate
+# data instead of using external file
+network={
+	ssid="example"
+	key_mgmt=WPA-EAP
+	eap=TTLS
+	identity="user@example.com"
+	anonymous_identity="anonymous@example.com"
+	password="foobar"
+	ca_cert="blob://exampleblob"
+	priority=20
+}
+
+blob-base64-exampleblob={
+SGVsbG8gV29ybGQhCg==
+}
+
+
+# Wildcard match for SSID (plaintext APs only). This example select any
+# open AP regardless of its SSID.
+network={
+	key_mgmt=NONE
+}
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf-sane b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf-sane
new file mode 100644
index 0000000..c91ffe0
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf-sane
@@ -0,0 +1,7 @@
+ctrl_interface=/var/run/wpa_supplicant
+ctrl_interface_group=0
+update_config=1
+
+network={
+        key_mgmt=NONE
+}
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
new file mode 100644
index 0000000..6236ab3
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
@@ -0,0 +1,119 @@
+# This is a TI specific version of the wpa-supplicant recipe for use with the
+# wl12xx wlan and bluetooth module.
+
+DESCRIPTION = "A Client for Wi-Fi Protected Access (WPA)."
+HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
+BUGTRACKER = "http://hostap.epitest.fi/bugz/"
+SECTION = "network"
+LICENSE = "GPLv2 | BSD"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
+                    file://../README;md5=79cddd95f8b7539aced400f6aab996e9 \
+                    file://wpa_supplicant.c;beginline=1;endline=17;md5=009c87d612d92175fe8cd1e93137bf42"
+DEPENDS = "gnutls dbus libnl openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
+RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
+
+# To prevent users from accidently picking up this customized version of
+# wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
+DEFAULT_PREFERENCE = "-1"
+
+SRCREV = "ol_R5.00.18"
+PR = "r0+gitr${SRCPV}"
+# Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
+PV = "0.7.3+0.8.0-rc-ti"
+
+SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
+           file://defconfig \
+           file://defaults-sane \
+           file://wpa-supplicant.sh \
+           file://wpa_supplicant.conf \
+           file://wpa_supplicant.conf-sane \
+           file://99_wpa_supplicant \
+           file://0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch;patchdir=.. \
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
-- 
1.7.0.4


