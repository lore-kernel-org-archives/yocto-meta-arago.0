Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 145FA52A12
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 12:13:19 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LCDIVk009968
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:13:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LCDI4G024074
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:13:18 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 21 Mar 2013 07:13:18 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 10/17] wpa-supplicant: Pull back in old
	r5-00-18 recipe.
Thread-Index: AQHOJRb1yQXCYg3EtU+J4aV5QiqYApiwELuw
Date: Thu, 21 Mar 2013 12:13:18 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948EBCA@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-10-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-10-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 10/17] wpa-supplicant: Pull back in old	r5-00-18 recipe.
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
X-List-Received-Date: Thu, 21 Mar 2013 12:13:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:06 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 10/17] wpa-supplicant: Pull back in
> old r5-00-18 recipe.
>=20
> * Current am180x-evm ships with a PG 2 wilink 6 module that isn't
> supported in
>   newer wilink 6 releases.
> * A newer PG 3 wilink 6 module is available for am180x-evm but
> needs to be
>   purchased separately..
> * Bring old r5.00.18 wpa-supplicant recipe with updated recipe
> name
>   to add support for am180x-evm default wilink 6 module.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  ...ant-dbus-AP-Add-support-for-WPS-Internal-.patch |  134 ++++++
>  .../wpa-supplicant-r5.00.18/defconfig              |  426
> ++++++++++++++++++++
>  .../wpa-supplicant/wpa-supplicant_r5.00.18.bb      |   14 +
>  3 files changed, 574 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant-r5.00.18/0001-wpa_supplicant-dbus-AP-
> Add-support-for-WPS-Internal-.patch
>  create mode 100755 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant-r5.00.18/defconfig
>  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant_r5.00.18.bb
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant-r5.00.18/0001-wpa_supplicant-dbus-AP-
> Add-support-for-WPS-Internal-.patch b/meta-arago-extras/recipes-
> connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/0001-
> wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
> new file mode 100644
> index 0000000..15ec6fe
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-r5.00.18/0001-wpa_supplicant-dbus-AP-Add-support-for-
> WPS-Internal-.patch
> @@ -0,0 +1,134 @@
> +From 19030351b95f48714007e425eaa2163d9122d788 Mon Sep 17
> 00:00:00 2001
> +From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> +Date: Sun, 18 Dec 2011 17:06:31 +0200
> +Subject: [PATCH] wpa_supplicant/dbus AP: Add support for WPS
> Internal
> + Registrar
> +
> +When in AP mode, wpa_supplicant is now enabling WPS (only
> Internal
> +Registrar). WPS.Start() call can be used to initiate WPS
> negotiation
> +similarly to how this is done in station mode.
> +
> +This was done to ctrl_iface by Jouni Malinen on April 21, 2009
> (commit
> +3ec97afe571f159ea95213262c1c6b89965827d4)
> +
> +Upstream-Status: Submitted
> [http://lists.shmoo.com/pipermail/hostap/2011-
> December/024947.html]
> +
> +Signed-hostap: Gustavo Sverzut Barbieri
> <barbieri@profusion.mobi>
> +---
> + wpa_supplicant/dbus/dbus_new_handlers_wps.c |   72
> +++++++++++++++++++++++++--
> + 1 file changed, 67 insertions(+), 5 deletions(-)
> +
> +diff --git a/wpa_supplicant/dbus/dbus_new_handlers_wps.c
> b/wpa_supplicant/dbus/dbus_new_handlers_wps.c
> +index d8b74d0..a72cfb3 100644
> +--- a/wpa_supplicant/dbus/dbus_new_handlers_wps.c
> ++++ b/wpa_supplicant/dbus/dbus_new_handlers_wps.c
> +@@ -19,6 +19,8 @@
> + #include "../config.h"
> + #include "../wpa_supplicant_i.h"
> + #include "../wps_supplicant.h"
> ++#include "../driver_i.h"
> ++#include "../ap.h"
> + #include "dbus_new_helpers.h"
> + #include "dbus_new.h"
> + #include "dbus_new_handlers.h"
> +@@ -30,6 +32,7 @@ struct wps_start_params {
> +	int type; /* 0 - not set, 1 - pin,      2 - pbc       */
> +	u8 *bssid;
> +	char *pin;
> ++	u8 *p2p_dev_addr;
> + };
> +
> +
> +@@ -148,6 +151,41 @@ static int
> wpas_dbus_handler_wps_pin(DBusMessage *message,
> + }
> +
> +
> ++#ifdef CONFIG_P2P
> ++static int wpas_dbus_handler_wps_p2p_dev_addr(DBusMessage
> *message,
> ++					      DBusMessageIter *entry_iter,
> ++					      struct wps_start_params
> *params,
> ++					      DBusMessage **reply)
> ++{
> ++	DBusMessageIter variant_iter, array_iter;
> ++	int len;
> ++
> ++	dbus_message_iter_recurse(entry_iter, &variant_iter);
> ++	if (dbus_message_iter_get_arg_type(&variant_iter) !=3D
> DBUS_TYPE_ARRAY ||
> ++	    dbus_message_iter_get_element_type(&variant_iter) !=3D
> ++	    DBUS_TYPE_BYTE) {
> ++		wpa_printf(MSG_DEBUG, "dbus: WPS.Start - Wrong "
> ++			   "P2PDeviceAddress type, byte array
> required");
> ++		*reply =3D wpas_dbus_error_invalid_args(
> ++			message, "P2PDeviceAddress must be a byte
> array");
> ++		return -1;
> ++	}
> ++	dbus_message_iter_recurse(&variant_iter, &array_iter);
> ++	dbus_message_iter_get_fixed_array(&array_iter, &params-
> >p2p_dev_addr,
> ++					  &len);
> ++	if (len !=3D ETH_ALEN) {
> ++		wpa_printf(MSG_DEBUG, "dbus: WPS.Start - Wrong "
> ++			   "P2PDeviceAddress length %d", len);
> ++		*reply =3D wpas_dbus_error_invalid_args(message,
> ++						      "P2PDeviceAddress "
> ++						      "has wrong length");
> ++		return -1;
> ++	}
> ++	return 0;
> ++}
> ++#endif /* CONFIG_P2P */
> ++
> ++
> + static int wpas_dbus_handler_wps_start_entry(DBusMessage
> *message, char *key,
> +					     DBusMessageIter *entry_iter,
> +					     struct wps_start_params
> *params,
> +@@ -165,6 +203,11 @@ static int
> wpas_dbus_handler_wps_start_entry(DBusMessage *message, char
> *key,
> +	else if (os_strcmp(key, "Pin") =3D=3D 0)
> +		return wpas_dbus_handler_wps_pin(message, entry_iter,
> +						 params, reply);
> ++#ifdef CONFIG_P2P
> ++	else if (os_strcmp(key, "P2PDeviceAddress") =3D=3D 0)
> ++		return wpas_dbus_handler_wps_p2p_dev_addr(message,
> entry_iter,
> ++							  params, reply);
> ++#endif /* CONFIG_P2P */
> +
> +	wpa_printf(MSG_DEBUG, "dbus: WPS.Start - unknown key %s",
> key);
> +	*reply =3D wpas_dbus_error_invalid_args(message, key);
> +@@ -231,12 +274,31 @@ DBusMessage *
> wpas_dbus_handler_wps_start(DBusMessage *message,
> +		ret =3D wpas_wps_start_reg(wpa_s, params.bssid,
> params.pin,
> +					 NULL);
> +	else if (params.type =3D=3D 1) {
> +-		ret =3D wpas_wps_start_pin(wpa_s, params.bssid,
> params.pin, 0,
> +-					 DEV_PW_DEFAULT);
> +-		if (ret > 0)
> +-			os_snprintf(npin, sizeof(npin), "%08d", ret);
> +-	} else
> ++#ifdef CONFIG_AP
> ++		if (wpa_s->ap_iface)
> ++			ret =3D wpa_supplicant_ap_wps_pin(wpa_s,
> ++							params.bssid,
> ++							params.pin,
> ++							npin, sizeof(npin));
> ++		else
> ++#endif /* CONFIG_AP */
> ++		{
> ++			ret =3D wpas_wps_start_pin(wpa_s, params.bssid,
> ++						 params.pin, 0,
> ++						 DEV_PW_DEFAULT);
> ++			if (ret > 0)
> ++				os_snprintf(npin, sizeof(npin), "%08d",
> ret);
> ++		}
> ++	} else {
> ++#ifdef CONFIG_AP
> ++		if (wpa_s->ap_iface)
> ++			ret =3D wpa_supplicant_ap_wps_pbc(wpa_s,
> ++							params.bssid,
> ++							params.p2p_dev_addr);
> ++		else
> ++#endif /* CONFIG_AP */
> +		ret =3D wpas_wps_start_pbc(wpa_s, params.bssid, 0);
> ++	}
> +
> +	if (ret < 0) {
> +		wpa_printf(MSG_DEBUG, "dbus: WPS.Start
> wpas_wps_failed in "
> +--
> +1.7.10
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant-r5.00.18/defconfig b/meta-arago-
> extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> r5.00.18/defconfig
> new file mode 100755
> index 0000000..9b9882a
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-r5.00.18/defconfig
> @@ -0,0 +1,426 @@
> +# Example wpa_supplicant build time configuration
> +#
> +# This file lists the configuration options that are used when
> building the
> +# hostapd binary. All lines starting with # are ignored.
> Configuration option
> +# lines must be commented out complete, if they are not to be
> included, i.e.,
> +# just setting VARIABLE=3Dn is not disabling that variable.
> +#
> +# This file is included in Makefile, so variables like CFLAGS
> and LIBS can also
> +# be modified from here. In most cases, these lines should use
> +=3D in order not
> +# to override previous values of the variables.
> +
> +
> +# Uncomment following two lines and fix the paths if you have
> installed OpenSSL
> +# or GnuTLS in non-default location
> +#CFLAGS +=3D -I/usr/local/openssl/include
> +#LIBS +=3D -L/usr/local/openssl/lib
> +
> +# Some Red Hat versions seem to include kerberos header files
> from OpenSSL, but
> +# the kerberos files are not in the default include path.
> Following line can be
> +# used to fix build issues on such systems (krb5.h not found).
> +#CFLAGS +=3D -I/usr/include/kerberos
> +
> +# Example configuration for various cross-compilation platforms
> +
> +#### sveasoft (e.g., for Linksys WRT54G)
> ######################################
> +#CC=3Dmipsel-uclibc-gcc
> +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> +#CFLAGS +=3D -Os
> +#CPPFLAGS +=3D -I../src/include -I../../src/router/openssl/include
> +#LIBS +=3D -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
> +################################################################
> ###############
> +
> +#### openwrt (e.g., for Linksys WRT54G)
> #######################################
> +#CC=3Dmipsel-uclibc-gcc
> +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> +#CFLAGS +=3D -Os
> +#CPPFLAGS=3D-I../src/include -I../openssl-0.9.7d/include \
> +#	-I../WRT54GS/release/src/include
> +#LIBS =3D -lssl
> +################################################################
> ###############
> +
> +#CC=3D$(CROSS_COMPILE)gcc
> +#CFLAGS +=3D -DCONFIG_LIBNL20
> +#CPPFLAGS +=3D -DCONFIG_LIBNL20
> +#LIBS +=3D -L$(NFSROOT)/lib -lnl
> +#LIBS_p +=3D -L$(NFSROOT)/lib
> +#LIBDIR =3D $(NFSROOT)/lib
> +#BINDIR =3D $(NFSROOT)/usr/sbin
> +
> +CONFIG_WAPI=3Dy
> +CONFIG_LIBNL20=3Dy
> +NEED_BGSCAN=3Dy
> +CONFIG_BGSCAN_LEARN=3Dy
> +
> +# Driver interface for Host AP driver
> +#CONFIG_DRIVER_HOSTAP=3Dy
> +
> +# Driver interface for Agere driver
> +#CONFIG_DRIVER_HERMES=3Dy
> +# Change include directories to match with the local setup
> +#CFLAGS +=3D -I../../hcf -I../../include -I../../include/hcf
> +#CFLAGS +=3D -I../../include/wireless
> +
> +# Driver interface for madwifi driver
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> +#CONFIG_DRIVER_MADWIFI=3Dy
> +# Set include directory to the madwifi source tree
> +#CFLAGS +=3D -I../../madwifi
> +
> +# Driver interface for ndiswrapper
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> +#CONFIG_DRIVER_NDISWRAPPER=3Dy
> +
> +# Driver interface for Atmel driver
> +#CONFIG_DRIVER_ATMEL=3Dy
> +
> +# Driver interface for old Broadcom driver
> +# Please note that the newer Broadcom driver ("hybrid Linux
> driver") supportsBG
> +# Linux wireless extensions and does not need (or even work)
> with the old
> +# driver wrapper. Use CONFIG_DRIVER_WEXT=3Dy with that driver.
> +#CONFIG_DRIVER_BROADCOM=3Dy
> +# Example path for wlioctl.h; change to match your configuration
> +#CFLAGS +=3D -I/opt/WRT54GS/release/src/include
> +
> +# Driver interface for Intel ipw2100/2200 driver
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> +#CONFIG_DRIVER_IPW=3Dy
> +
> +# Driver interface for Ralink driver
> +#CONFIG_DRIVER_RALINK=3Dy
> +
> +# Driver interface for generic Linux wireless extensions
> +CONFIG_DRIVER_WEXT=3Dy
> +
> +# Driver interface for Linux drivers using the nl80211 kernel
> interface
> +CONFIG_DRIVER_NL80211=3Dy
> +
> +# Driver interface for FreeBSD net80211 layer (e.g., Atheros
> driver)
> +#CONFIG_DRIVER_BSD=3Dy
> +#CFLAGS +=3D -I/usr/local/include
> +#LIBS +=3D -L/usr/local/lib
> +#LIBS_p +=3D -L/usr/local/libBG
> +#LIBS_c +=3D -L/usr/local/lib
> +
> +# Driver interface for Windows NDIS
> +#CONFIG_DRIVER_NDIS=3Dy
> +#CFLAGS +=3D -I/usr/include/w32api/ddk
> +#LIBS +=3D -L/usr/local/lib
> +# For native build using mingw
> +#CONFIG_NATIVE_WINDOWS=3Dy
> +# Additional directories for cross-compilation on Linux host for
> mingw target
> +#CFLAGS +=3D -I/opt/mingw/mingw32/include/ddk
> +#LIBS +=3D -L/opt/mingw/mingw32/lib
> +#CC=3Dmingw32-gcc
> +# By default, driver_ndis uses WinPcap for low-level operations.
> This can be
> +# replaced with the following option which replaces WinPcap
> calls with NDISUIO.
> +# However, this requires that WZC is disabled (net stop wzcsvc)
> before starting
> +# wpa_supplicant.
> +# CONFIG_USE_NDISUIO=3Dy
> +
> +# Driver interface for development testing
> +#CONFIG_DRIVER_TEST=3Dy
> +
> +# Include client MLME (management frame processing) for test
> driver
> +# This can be used to test MLME operations in hostapd with the
> test interface.
> +# space.
> +#CONFIG_CLIENT_MLME=3Dy
> +
> +# Driver interface for wired Ethernet drivers
> +CONFIG_DRIVER_WIRED=3Dy
> +
> +# Driver interface for the Broadcom RoboSwitch family
> +#CONFIG_DRIVER_ROBOSWITCH=3Dy
> +
> +# Driver interface for no driver (e.g., WPS ER only)
> +#CONFIG_DRIVER_NONE=3Dy
> +
> +# Solaris libraries
> +#LIBS +=3D -lsocket -ldlpi -lnsl
> +#LIBS_c +=3D -lsocket
> +
> +# Enable IEEE 802.1X Supplicant (automatically included if any
> EAP method is
> +# included)
> +CONFIG_IEEE8021X_EAPOL=3Dy
> +
> +# EAP-MD5
> +CONFIG_EAP_MD5=3Dy
> +
> +# EAP-MSCHAPv2
> +CONFIG_EAP_MSCHAPV2=3Dy
> +
> +# EAP-TLS
> +CONFIG_EAP_TLS=3Dy
> +
> +# EAL-PEAP
> +CONFIG_EAP_PEAP=3Dy
> +
> +# EAP-TTLS
> +CONFIG_EAP_TTLS=3Dy
> +
> +# EAP-FAST
> +# Note: Default OpenSSL package does not include support for all
> the
> +# functionality needed for EAP-FAST. If EAP-FAST is enabled with
> OpenSSL,
> +# the OpenSSL library must be patched (openssl-0.9.8d-tls-
> extensions.patch)
> +# to add the needed functions.
> +#CONFIG_EAP_FAST=3Dy
> +
> +# EAP-GTC
> +CONFIG_EAP_GTC=3Dy
> +
> +# EAP-OTP
> +CONFIG_EAP_OTP=3Dy
> +
> +# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
> +#CONFIG_EAP_SIM=3Dy
> +
> +# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
> +#CONFIG_EAP_PSK=3Dy
> +
> +# EAP-PAX
> +#CONFIG_EAP_PAX=3Dy
> +
> +# LEAP
> +CONFIG_EAP_LEAP=3Dy
> +
> +# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
> +#CONFIG_EAP_AKA=3Dy
> +
> +# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
> +# This requires CONFIG_EAP_AKA to be enabled, too.
> +#CONFIG_EAP_AKA_PRIME=3Dy
> +
> +# Enable USIM simulator (Milenage) for EAP-AKA
> +#CONFIG_USIM_SIMULATOR=3Dy
> +
> +# EAP-SAKE
> +#CONFIG_EAP_SAKE=3Dy
> +
> +# EAP-GPSK
> +#CONFIG_EAP_GPSK=3Dy
> +# Include support for optional SHA256 cipher suite in EAP-GPSK
> +#CONFIG_EAP_GPSK_SHA256=3Dy
> +
> +# EAP-TNC and related Trusted Network Connect support
> (experimental)
> +#CONFIG_EAP_TNC=3Dy
> +
> +# Wi-Fi Protected Setup (WPS)
> +CONFIG_WPS=3Dy
> +# Enable WSC 2.0 support
> +CONFIG_WPS2=3Dy
> +
> +# EAP-IKEv2
> +#CONFIG_EAP_IKEV2=3Dy
> +
> +# PKCS#12 (PFX) support (used to read private key and
> certificate file from
> +# a file that usually has extension .p12 or .pfx)
> +CONFIG_PKCS12=3Dy
> +
> +# Smartcard support (i.e., private key on a smartcard), e.g.,
> with openssl
> +# engine.
> +CONFIG_SMARTCARD=3Dy
> +
> +# PC/SC interface for smartcards (USIM, GSM SIM)
> +# Enable this if EAP-SIM or EAP-AKA is included
> +#CONFIG_PCSC=3Dy
> +
> +# Development testingBG
> +#CONFIG_EAPOL_TEST=3Dy
> +
> +# Select control interface backend for external programs, e.g,
> wpa_cli:
> +# unix =3D UNIX domain sockets (default for Linux/*BSD)
> +# udp =3D UDP sockets using localhost (127.0.0.1)
> +# named_pipe =3D Windows Named Pipe (default for Windows)
> +# y =3D use default (backwards compatibility)
> +# If this option is commented out, control interface is not
> included in the
> +# build.
> +CONFIG_CTRL_IFACE=3Dy
> +
> +# Include support for GNU Readline and History Libraries in
> wpa_cli.
> +# When building a wpa_cli binary for distribution, please note
> that these
> +# libraries are licensed under GPL and as such, BSD license may
> not apply for
> +# the resulting binary.
> +#CONFIG_READLINE=3Dy
> +
> +# Remove debugging code that is printing out debug message to
> stdout.
> +# This can be used to reduce the size of the wpa_supplicant
> considerably
> +# if debugging code is not needed. The size reduction can be
> around 35%
> +# (e.g., 90 kB).
> +#CONFIG_NO_STDOUT_DEBUG=3Dy
> +
> +# Remove WPA support, e.g., for wired-only IEEE 802.1X
> supplicant, to save
> +# 35-50 kB in code size.
> +#CONFIG_NO_WPA=3Dy
> +
> +# Remove WPA2 support. This allows WPA to be used, but removes
> WPA2 code to
> +# save about 1 kB in code size when building only WPA-Personal
> (no EAP support)
> +# or 6 kB if building for WPA-Enterprise.
> +#CONFIG_NO_WPA2=3Dy
> +
> +# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
> +# This option can be used to reduce code size by removing
> support for
> +# converting ASCII passphrases into PSK. If this functionality
> is removed, the
> +# PSK can only be configured as the 64-octet hexstring (e.g.,
> from
> +# wpa_passphrase). This saves about 0.5 kB in code size.
> +#CONFIG_NO_WPA_PASSPHRASE=3Dy
> +
> +# Disable scan result processing (ap_mode=3D1) to save code size
> by about 1 kB.
> +# This can be used if ap_scan=3D1 mode is never enabled.
> +#CONFIG_NO_SCAN_PROCESSING=3Dy
> +
> +# Select configuration backend:
> +# file =3D text file (e.g., wpa_supplicant.conf; note: the
> configuration file
> +#	path is given on command line, not here; this option is
> just used to
> +#	select the backend that allows configuration files to be
> used)
> +# winreg =3D Windows registry (see win_example.reg for an example)
> +CONFIG_BACKEND=3Dfile
> +
> +# Remove configuration write functionality (i.e., to allow the
> configuration
> +# file to be updated based on runtime configuration changes).
> The runtime
> +# configuration can still be changed, the changes are just not
> going to be
> +# persistent over restarts. This option can be used to reduce
> code size by
> +# about 3.5 kB.
> +#CONFIG_NO_CONFIG_WRITE=3Dy
> +
> +# Remove support for configuration blobs to reduce code size by
> about 1.5 kB.
> +#CONFIG_NO_CONFIG_BLOBS=3Dy
> +
> +# Select program entry point implementation:
> +# main =3D UNIX/POSIX like main() function (default)
> +# main_winsvc =3D Windows service (read parameters from registry)
> +# main_none =3D Very basic example (development use only)
> +#CONFIG_MAIN=3Dmain
> +
> +# Select wrapper for operatins system and C library specific
> functions
> +# unix =3D UNIX/POSIX like systems (default)
> +# win32 =3D Windows systems
> +# none =3D Empty template
> +#CONFIG_OS=3Dunix
> +
> +# Select event loop implementation
> +# eloop =3D select() loop (default)
> +# eloop_win =3D Windows events and WaitForMultipleObject() loop
> +# eloop_none =3D Empty template
> +#CONFIG_ELOOP=3Deloop
> +
> +# Select layer 2 packet implementation
> +# linux =3D Linux packet socket (default)
> +# pcap =3D libpcap/libdnet/WinPcap
> +# freebsd =3D FreeBSD libpcap
> +# winpcap =3D WinPcap with receive thread
> +# ndis =3D Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=3Dy)
> +# none =3D Empty template
> +#CONFIG_L2_PACKET=3Dlinux
> +
> +# PeerKey handshake for Station to Station Link (IEEE 802.11e
> DLS)
> +CONFIG_PEERKEY=3Dy
> +
> +# IEEE 802.11w (management frame protection)
> +# This version is an experimental implementation based on IEEE
> 802.11w/D1.0
> +# draft and is subject to change since the standard has not yet
> been finalized.
> +# Driver support is also needed for IEEE 802.11w.
> +#CONFIG_IEEE80211W=3Dy
> +
> +# Select TLS implementation
> +# openssl =3D OpenSSL (default)
> +# gnutls =3D GnuTLS (needed for TLS/IA, see also
> CONFIG_GNUTLS_EXTRA)
> +# internal =3D Internal TLSv1 implementation (experimental)
> +# none =3D Empty template
> +#CONFIG_TLS=3Dopenssl
> +
> +# Whether to enable TLS/IA support, which is required for EAP-
> TTLSv1.
> +# You need CONFIG_TLS=3Dgnutls for this to have any effect. Please
> note that
> +# even though the core GnuTLS library is released under LGPL,
> this extra
> +# library uses GPL and as such, the terms of GPL apply to the
> combination
> +# of wpa_supplicant and GnuTLS if this option is enabled. BSD
> license may not
> +# apply for distribution of the resulting binary.
> +#CONFIG_GNUTLS_EXTRA=3Dy
> +
> +# If CONFIG_TLS=3Dinternal is used, additional library and include
> paths are
> +# needed for LibTomMath. Alternatively, an integrated, minimal
> version of
> +# LibTomMath can be used. See beginning of libtommath.c for
> details on benefits
> +# and drawbacks of this option.
> +#CONFIG_INTERNAL_LIBTOMMATH=3Dy
> +#ifndef CONFIG_INTERNAL_LIBTOMMATH
> +#LTM_PATH=3D/usr/src/libtommath-0.39
> +#CFLAGS +=3D -I$(LTM_PATH)
> +#LIBS +=3D -L$(LTM_PATH)
> +#LIBS_p +=3D -L$(LTM_PATH)
> +#endif
> +# At the cost of about 4 kB of additional binary size, the
> internal LibTomMath
> +# can be configured to include faster routines for exptmod, sqr,
> and div to
> +# speed up DH and RSA calculation considerably
> +#CONFIG_INTERNAL_LIBTOMMATH_FAST=3Dy
> +
> +# Include NDIS event processing through WMI into
> wpa_supplicant/wpasvc.
> +# This is only for Windows builds and requires WMI-related
> header files and
> +# WbemUuid.Lib from Platform SDK even when building with MinGW.
> +#CONFIG_NDIS_EVENTS_INTEGRATED=3Dy
> +#PLATFORMSDKLIB=3D"/opt/Program Files/Microsoft Platform SDK/Lib"
> +
> +# Add support for old DBus control interface
> +# (fi.epitest.hostap.WPASupplicant)
> +CONFIG_CTRL_IFACE_DBUS=3Dy
> +
> +# Add support for new DBus control interface
> +# (fi.w1.hostap.wpa_supplicant1)
> +CONFIG_CTRL_IFACE_DBUS_NEW=3Dy
> +
> +# Add introspection support for new DBus control interface
> +CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy
> +
> +# Add support for loading EAP methods dynamically as shared
> libraries.
> +# When this option is enabled, each EAP method can be either
> included
> +# statically (CONFIG_EAP_<method>=3Dy) or dynamically
> (CONFIG_EAP_<method>=3Ddyn).
> +# Dynamic EAP methods are build as shared objects (eap_*.so) and
> they need to
> +# be loaded in the beginning of the wpa_supplicant configuration
> file
> +# (see load_dynamic_eap parameter in the example file) before
> being used in
> +# the network blocks.
> +#
> +# Note that some shared parts of EAP methods are included in the
> main program
> +# and in order to be able to use dynamic EAP methods using these
> parts, the
> +# main program must have been build with the EAP method enabled
> (=3Dy or =3Ddyn).
> +# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as
> dynamic libraries
> +# unless at least one of them was included in the main build to
> force inclusion
> +# of the shared code. Similarly, at least one of EAP-SIM/AKA
> must be included
> +# in the main build to be able to load these methods
> dynamically.
> +#
> +# Please also note that using dynamic libraries will increase
> the total binary
> +# size. Thus, it may not be the best option for targets that
> have limited
> +# amount of memory/flash.
> +#CONFIG_DYNAMIC_EAP_METHODS=3Dy
> +
> +# IEEE Std 802.11r-2008 (Fast BSS Transition)
> +#CONFIG_IEEE80211R=3Dy
> +
> +# Add support for writing debug log to a file
> (/tmp/wpa_supplicant-log-#.txt)
> +CONFIG_DEBUG_FILE=3Dy
> +
> +# Enable privilege separation (see README 'Privilege separation'
> for details)
> +#CONFIG_PRIVSEP=3Dy
> +
> +# Enable mitigation against certain attacks against TKIP by
> delaying Michael
> +# MIC error reports by a random amount of time between 0 and 60
> seconds
> +#CONFIG_DELAYED_MIC_ERROR_REPORT=3Dy
> +
> +# Enable tracing code for developer debugging
> +# This tracks use of memory allocations and other registrations
> and reports
> +# incorrect use with a backtrace of call (or allocation)
> location.
> +#CONFIG_WPA_TRACE=3Dy
> +# For BSD, comment out these.
> +#LIBS +=3D -lexecinfo
> +#LIBS_p +=3D -lexecinfo
> +#LIBS_c +=3D -lexecinfo
> +
> +# Use libbfd to get more details for developer debugging
> +# This enables use of libbfd to get more detailed symbols for
> the backtraces
> +# generated by CONFIG_WPA_TRACE=3Dy.
> +#CONFIG_WPA_TRACE_BFD=3Dy
> +# For BSD, comment out these.
> +#LIBS +=3D -lbfd -liberty -lz
> +#LIBS_p +=3D -lbfd -liberty -lz
> +#LIBS_c +=3D -lbfd -liberty -lz
> +
> +# for p2p
> +CONFIG_P2P=3Dy
> +CONFIG_AP=3Dy
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant_r5.00.18.bb b/meta-arago-
> extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant_r5.00.18.bb
> new file mode 100644
> index 0000000..063c653
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant_r5.00.18.bb
> @@ -0,0 +1,14 @@
> +# This is a TI specific version of the wpa-supplicant recipe for
> use with the
> +# wl12xx wlan and bluetooth module.
> +
> +require wpa-supplicant.inc
> +
> +LICENSE =3D "GPLv2 | BSD"
> +LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dc54ce9345727175ff66d17b67ff51f58 \
> +
> file://../README;md5=3D79cddd95f8b7539aced400f6aab996e9 \
> +
> file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=3D009c87d612d921
> 75fe8cd1e93137bf42"
> +
> +SRCREV =3D "ol_R5.00.18"
> +PR_append =3D "-a+gitr${SRCPV}"
> +
> +SRC_URI +=3D "file://0001-wpa_supplicant-dbus-AP-Add-support-for-
> WPS-Internal-.patch;patchdir=3D.. "
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

