Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D7C7852090
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 14:47:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AElxvG032552
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 09:47:59 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AElxAJ017562
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 09:47:59 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 09:47:59 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 04/11]
	ti-connectivity/wpa-supplicant-wl18xx:	Add Wilink8 r8.a7.02
Thread-Index: AQHOxUuOXWSDiOE6SUqPZIIE9jFBWZnuBMZA
Date: Thu, 10 Oct 2013 14:47:58 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5718E8@DFLE08.ent.ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
	<1381366658-13630-5-git-send-email-r-monk@ti.com>
In-Reply-To: <1381366658-13630-5-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 04/11] ti-connectivity/wpa-supplicant-wl18xx:	Add Wilink8 r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 14:48:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Monk, Roger
> Sent: Wednesday, October 09, 2013 7:58 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 04/11] ti-connectivity/wpa-supplicant-wl18xx=
:
> Add Wilink8 r8.a7.02
>=20
>    * Add v r8.a7.02 engineering release wpa supplicant
>    * This release supports the omap-a15 devices (omap5-evm/dra7-evm) with=
 ES
> 2.1 WL8
>       * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK 1=
8xx
> module
>       * OMAP5432x-xx-x1-xx
>    * Bump PR
>    * Replace defconfig with original wpa-supplicant defconfig
>    * Add back SDK specific defconfig changes
>    * Enable WFD (WiFi Display)
>    * Revert some android patches which prevent WFD
>=20
> Signed-off-by: Roger Monk <r-monk@ti.com>
> ---
>  ...0001-revert-android-patches-to-enable-wfd.patch |   44 ++
>  .../wpa-supplicant-wl18xx-r8.a7.02/defconfig       |  508
> ++++++++++++++++++++
>  .../wpa-supplicant-wl18xx_r8.a7.02.bb              |   29 ++
>  3 files changed, 581 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant-wl18xx-r8.a7.02/0001-revert-android-patches-to-
> enable-wfd.patch
>  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant-wl18xx-r8.a7.02/defconfig
>  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant-wl18xx_r8.a7.02.bb
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx-r8.a7.02/0001-revert-android-patches-to-enable-wfd.patc=
h
> b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> wl18xx-r8.a7.02/0001-revert-android-patches-to-enable-wfd.patch
> new file mode 100644
> index 0000000..29528b4
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt-wl18xx-r8.a7.02/0001-revert-android-patches-to-enable-wfd.patch
> @@ -0,0 +1,44 @@
> +
> +diff -rupN a/src/common/wpa_ctrl.c b/src/common/wpa_ctrl.c
> +--- a/src/common/wpa_ctrl.c	2013-09-02 16:46:22.708023057 +0100
> ++++ b/src/common/wpa_ctrl.c	2013-08-30 10:22:19.811255355 +0100
> +@@ -164,6 +164,10 @@ try_again:
> + 		return NULL;
> + 	}
> +
> ++#if 0
> ++//IH this code is introduced in recent supplicant that appears to make
> ++RMD app calls to wpa_ctrl_recv() fail and // the supplicant fails to wr=
ite to the
> same socket!!!
> ++// Temp fix to remove it, probably solution will be in app set up/usage=
??
> + 	/*
> + 	 * Make socket non-blocking so that we don't hang forever if
> + 	 * target dies unexpectedly.
> +@@ -176,7 +180,7 @@ try_again:
> + 			/* Not fatal, continue on.*/
> + 		}
> + 	}
> +-
> ++#endif
> + 	return ctrl;
> + }
> +
> +diff -rupN a/wpa_supplicant/wpa_supplicant.c
> b/wpa_supplicant/wpa_supplicant.c
> +--- a/wpa_supplicant/wpa_supplicant.c	2013-09-04 16:57:26.000000000
> +0100
> ++++ b/wpa_supplicant/wpa_supplicant.c	2013-09-04
> 17:02:02.256720695 +0100
> +@@ -3025,13 +3025,15 @@ next_driver:
> + 	}
> +
> + #ifdef CONFIG_P2P
> ++ #ifdef ANDROID
> + 	if (os_strncmp(iface->ifname, "wlan0", 4) =3D=3D 0) {
> + 		wpa_printf(MSG_DEBUG, "Disable P2P on wlan0");
> + 		wpa_s->conf->p2p_disabled =3D 1;
> + 	}
> +
> + 	if (os_strncmp(iface->ifname, "p2p0", 4) =3D=3D 0)
> +-		if (wpas_p2p_init(wpa_s->global, wpa_s) < 0) {
> ++#endif
> ++	    if (wpas_p2p_init(wpa_s->global, wpa_s) < 0) {
> + 			wpa_msg(wpa_s, MSG_ERROR, "Failed to init P2P");
> + 			return -1;
> + 		}
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx-r8.a7.02/defconfig b/meta-arago-extras/recipes-
> connectivity/wpa-supplicant/wpa-supplicant-wl18xx-r8.a7.02/defconfig
> new file mode 100644
> index 0000000..80d2f63
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt-wl18xx-r8.a7.02/defconfig
> @@ -0,0 +1,508 @@
> +# Example wpa_supplicant build time configuration # # This file lists
> +the configuration options that are used when building the # hostapd
> +binary. All lines starting with # are ignored. Configuration option #
> +lines must be commented out complete, if they are not to be included,
> +i.e., # just setting VARIABLE=3Dn is not disabling that variable.
> +#
> +# This file is included in Makefile, so variables like CFLAGS and LIBS
> +can also # be modified from here. In most cases, these lines should use
> ++=3D in order not # to override previous values of the variables.
> +
> +
> +# Uncomment following two lines and fix the paths if you have installed
> +OpenSSL # or GnuTLS in non-default location #CFLAGS +=3D
> +-I/usr/local/openssl/include #LIBS +=3D -L/usr/local/openssl/lib
> +
> +# Some Red Hat versions seem to include kerberos header files from
> +OpenSSL, but # the kerberos files are not in the default include path.
> +Following line can be # used to fix build issues on such systems (krb5.h=
 not
> found).
> +#CFLAGS +=3D -I/usr/include/kerberos
> +
> +# Example configuration for various cross-compilation platforms
> +
> +#### sveasoft (e.g., for Linksys WRT54G)
> +######################################
> +#CC=3Dmipsel-uclibc-gcc
> +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> +#CFLAGS +=3D -Os
> +#CPPFLAGS +=3D -I../src/include -I../../src/router/openssl/include
> +#LIBS +=3D -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
> +############################################################
> ###########
> +########
> +
> +#### openwrt (e.g., for Linksys WRT54G)
> +#######################################
> +#CC=3Dmipsel-uclibc-gcc
> +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> +#CFLAGS +=3D -Os
> +#CPPFLAGS=3D-I../src/include -I../openssl-0.9.7d/include \
> +#	-I../WRT54GS/release/src/include
> +#LIBS =3D -lssl
> +############################################################
> ###########
> +########
> +
> +
> +# Driver interface for Host AP driver
> +#CONFIG_DRIVER_HOSTAP=3Dy
> +
> +# Driver interface for Agere driver
> +#CONFIG_DRIVER_HERMES=3Dy
> +# Change include directories to match with the local setup #CFLAGS +=3D
> +-I../../hcf -I../../include -I../../include/hcf #CFLAGS +=3D
> +-I../../include/wireless
> +
> +# Driver interface for madwifi driver
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> +#CONFIG_DRIVER_MADWIFI=3Dy
> +# Set include directory to the madwifi source tree #CFLAGS +=3D
> +-I../../madwifi
> +
> +# Driver interface for ndiswrapper
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> +#CONFIG_DRIVER_NDISWRAPPER=3Dy
> +
> +# Driver interface for Atmel driver
> +#CONFIG_DRIVER_ATMEL=3Dy
> +
> +# Driver interface for old Broadcom driver # Please note that the newer
> +Broadcom driver ("hybrid Linux driver") supports # Linux wireless
> +extensions and does not need (or even work) with the old # driver
> +wrapper. Use CONFIG_DRIVER_WEXT=3Dy with that driver.
> +#CONFIG_DRIVER_BROADCOM=3Dy
> +# Example path for wlioctl.h; change to match your configuration
> +#CFLAGS +=3D -I/opt/WRT54GS/release/src/include
> +
> +# Driver interface for Intel ipw2100/2200 driver # Deprecated; use
> +CONFIG_DRIVER_WEXT=3Dy instead.
> +#CONFIG_DRIVER_IPW=3Dy
> +
> +# Driver interface for Ralink driver
> +#CONFIG_DRIVER_RALINK=3Dy
> +
> +# Driver interface for generic Linux wireless extensions # Note: WEXT
> +is deprecated in the current Linux kernel version and no new #
> +functionality is added to it. nl80211-based interface is the new #
> +replacement for WEXT and its use allows wpa_supplicant to properly
> +control # the driver to improve existing functionality like roaming and
> +to support new # functionality.
> +CONFIG_DRIVER_WEXT=3Dy
> +
> +# Driver interface for Linux drivers using the nl80211 kernel interface
> +CONFIG_DRIVER_NL80211=3Dy CONFIG_LIBNL20=3Dy
> +
> +# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
> +#CONFIG_DRIVER_BSD=3Dy #CFLAGS +=3D -I/usr/local/include #LIBS +=3D
> +-L/usr/local/lib #LIBS_p +=3D -L/usr/local/lib #LIBS_c +=3D
> +-L/usr/local/lib
> +
> +# Driver interface for Windows NDIS
> +#CONFIG_DRIVER_NDIS=3Dy
> +#CFLAGS +=3D -I/usr/include/w32api/ddk
> +#LIBS +=3D -L/usr/local/lib
> +# For native build using mingw
> +#CONFIG_NATIVE_WINDOWS=3Dy
> +# Additional directories for cross-compilation on Linux host for mingw
> +target #CFLAGS +=3D -I/opt/mingw/mingw32/include/ddk #LIBS +=3D
> +-L/opt/mingw/mingw32/lib #CC=3Dmingw32-gcc # By default, driver_ndis use=
s
> +WinPcap for low-level operations. This can be # replaced with the
> +following option which replaces WinPcap calls with NDISUIO.
> +# However, this requires that WZC is disabled (net stop wzcsvc) before
> +starting # wpa_supplicant.
> +# CONFIG_USE_NDISUIO=3Dy
> +
> +# Driver interface for development testing #CONFIG_DRIVER_TEST=3Dy
> +
> +# Driver interface for wired Ethernet drivers CONFIG_DRIVER_WIRED=3Dy
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
> +# Enable IEEE 802.1X Supplicant (automatically included if any EAP
> +method is # included) CONFIG_IEEE8021X_EAPOL=3Dy
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
> +# Note: Default OpenSSL package does not include support for all the #
> +functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL,
> +# the OpenSSL library must be patched
> +(openssl-0.9.8d-tls-extensions.patch)
> +# to add the needed functions.
> +#CONFIG_EAP_FAST=3Dy
> +
> +# EAP-GTC
> +CONFIG_EAP_GTC=3Dy
> +
> +# EAP-OTP
> +CONFIG_EAP_OTP=3Dy
> +
> +# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used) #CONFIG_EAP_SIM=3Dy
> +
> +# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
> +#CONFIG_EAP_PSK=3Dy
> +
> +# EAP-pwd (secure authentication using only a password)
> +#CONFIG_EAP_PWD=3Dy
> +
> +# EAP-PAX
> +#CONFIG_EAP_PAX=3Dy
> +
> +# LEAP
> +CONFIG_EAP_LEAP=3Dy
> +
> +# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used) #CONFIG_EAP_AKA=3Dy
> +
> +# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
> +# This requires CONFIG_EAP_AKA to be enabled, too.
> +#CONFIG_EAP_AKA_PRIME=3Dy
> +
> +# Enable USIM simulator (Milenage) for EAP-AKA
> #CONFIG_USIM_SIMULATOR=3Dy
> +
> +# EAP-SAKE
> +#CONFIG_EAP_SAKE=3Dy
> +
> +# EAP-GPSK
> +#CONFIG_EAP_GPSK=3Dy
> +# Include support for optional SHA256 cipher suite in EAP-GPSK
> +#CONFIG_EAP_GPSK_SHA256=3Dy
> +
> +# EAP-TNC and related Trusted Network Connect support (experimental)
> +#CONFIG_EAP_TNC=3Dy
> +
> +# Wi-Fi Protected Setup (WPS)
> +CONFIG_WPS=3Dy
> +# Enable WSC 2.0 support
> +CONFIG_WPS2=3Dy
> +# Enable WPS external registrar functionality #CONFIG_WPS_ER=3Dy #
> +Disable credentials for an open network by default when acting as a WPS
> +# registrar.
> +#CONFIG_WPS_REG_DISABLE_OPEN=3Dy
> +
> +# EAP-IKEv2
> +#CONFIG_EAP_IKEV2=3Dy
> +
> +# PKCS#12 (PFX) support (used to read private key and certificate file
> +from # a file that usually has extension .p12 or .pfx) CONFIG_PKCS12=3Dy
> +
> +# Smartcard support (i.e., private key on a smartcard), e.g., with
> +openssl # engine.
> +CONFIG_SMARTCARD=3Dy
> +
> +# PC/SC interface for smartcards (USIM, GSM SIM) # Enable this if
> +EAP-SIM or EAP-AKA is included #CONFIG_PCSC=3Dy
> +
> +# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
> +#CONFIG_HT_OVERRIDES=3Dy
> +
> +# Development testing
> +#CONFIG_EAPOL_TEST=3Dy
> +
> +# Select control interface backend for external programs, e.g, wpa_cli:
> +# unix =3D UNIX domain sockets (default for Linux/*BSD) # udp =3D UDP
> +sockets using localhost (127.0.0.1) # named_pipe =3D Windows Named Pipe
> +(default for Windows) # y =3D use default (backwards compatibility) # If
> +this option is commented out, control interface is not included in the
> +# build.
> +CONFIG_CTRL_IFACE=3Dy
> +
> +# Include support for GNU Readline and History Libraries in wpa_cli.
> +# When building a wpa_cli binary for distribution, please note that
> +these # libraries are licensed under GPL and as such, BSD license may
> +not apply for # the resulting binary.
> +#CONFIG_READLINE=3Dy
> +
> +# Include internal line edit mode in wpa_cli. This can be used as a
> +replacement # for GNU Readline to provide limited command line editing a=
nd
> history support.
> +#CONFIG_WPA_CLI_EDIT=3Dy
> +
> +# Remove debugging code that is printing out debug message to stdout.
> +# This can be used to reduce the size of the wpa_supplicant
> +considerably # if debugging code is not needed. The size reduction can
> +be around 35% # (e.g., 90 kB).
> +#CONFIG_NO_STDOUT_DEBUG=3Dy
> +
> +# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to
> +save # 35-50 kB in code size.
> +#CONFIG_NO_WPA=3Dy
> +
> +# Remove WPA2 support. This allows WPA to be used, but removes WPA2
> +code to # save about 1 kB in code size when building only WPA-Personal
> +(no EAP support) # or 6 kB if building for WPA-Enterprise.
> +#CONFIG_NO_WPA2=3Dy
> +
> +# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support # This
> +option can be used to reduce code size by removing support for #
> +converting ASCII passphrases into PSK. If this functionality is
> +removed, the # PSK can only be configured as the 64-octet hexstring
> +(e.g., from # wpa_passphrase). This saves about 0.5 kB in code size.
> +#CONFIG_NO_WPA_PASSPHRASE=3Dy
> +
> +# Disable scan result processing (ap_mode=3D1) to save code size by abou=
t 1 kB.
> +# This can be used if ap_scan=3D1 mode is never enabled.
> +#CONFIG_NO_SCAN_PROCESSING=3Dy
> +
> +# Select configuration backend:
> +# file =3D text file (e.g., wpa_supplicant.conf; note: the configuration=
 file
> +#	path is given on command line, not here; this option is just used to
> +#	select the backend that allows configuration files to be used)
> +# winreg =3D Windows registry (see win_example.reg for an example)
> +CONFIG_BACKEND=3Dfile
> +
> +# Remove configuration write functionality (i.e., to allow the
> +configuration # file to be updated based on runtime configuration
> +changes). The runtime # configuration can still be changed, the changes
> +are just not going to be # persistent over restarts. This option can be
> +used to reduce code size by # about 3.5 kB.
> +#CONFIG_NO_CONFIG_WRITE=3Dy
> +
> +# Remove support for configuration blobs to reduce code size by about 1.=
5 kB.
> +#CONFIG_NO_CONFIG_BLOBS=3Dy
> +
> +# Select program entry point implementation:
> +# main =3D UNIX/POSIX like main() function (default) # main_winsvc =3D
> +Windows service (read parameters from registry) # main_none =3D Very
> +basic example (development use only) #CONFIG_MAIN=3Dmain
> +
> +# Select wrapper for operatins system and C library specific functions
> +# unix =3D UNIX/POSIX like systems (default) # win32 =3D Windows systems=
 #
> +none =3D Empty template CONFIG_OS=3Dunix
> +
> +# Select event loop implementation
> +# eloop =3D select() loop (default)
> +# eloop_win =3D Windows events and WaitForMultipleObject() loop #
> +eloop_none =3D Empty template CONFIG_ELOOP=3Deloop
> +
> +# Should we use poll instead of select? Select is used by default.
> +#CONFIG_ELOOP_POLL=3Dy
> +
> +# Select layer 2 packet implementation
> +# linux =3D Linux packet socket (default) # pcap =3D
> +libpcap/libdnet/WinPcap # freebsd =3D FreeBSD libpcap # winpcap =3D WinP=
cap
> +with receive thread # ndis =3D Windows NDISUIO (note: requires
> +CONFIG_USE_NDISUIO=3Dy) # none =3D Empty template
> CONFIG_L2_PACKET=3Dlinux
> +
> +# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
> +CONFIG_PEERKEY=3Dy
> +
> +# IEEE 802.11w (management frame protection) # This version is an
> +experimental implementation based on IEEE 802.11w/D1.0 # draft and is
> +subject to change since the standard has not yet been finalized.
> +# Driver support is also needed for IEEE 802.11w.
> +#CONFIG_IEEE80211W=3Dy
> +
> +# Select TLS implementation
> +# openssl =3D OpenSSL (default)
> +# gnutls =3D GnuTLS
> +# internal =3D Internal TLSv1 implementation (experimental) # none =3D
> +Empty template #CONFIG_TLS=3Dopenssl
> +
> +# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS
> +(v1.1) # can be enabled to get a stronger construction of messages when
> +block ciphers # are used. It should be noted that some existing TLS
> +v1.0 -based # implementation may not be compatible with TLS v1.1
> +message (ClientHello is # sent prior to negotiating which version will
> +be used) #CONFIG_TLSV11=3Dy
> +
> +# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS
> +(v1.2) # can be enabled to enable use of stronger crypto algorithms. It
> +should be # noted that some existing TLS v1.0 -based implementation may
> +not be compatible # with TLS v1.2 message (ClientHello is sent prior to
> +negotiating which version # will be used) #CONFIG_TLSV12=3Dy
> +
> +# If CONFIG_TLS=3Dinternal is used, additional library and include paths
> +are # needed for LibTomMath. Alternatively, an integrated, minimal
> +version of # LibTomMath can be used. See beginning of libtommath.c for
> +details on benefits # and drawbacks of this option.
> +#CONFIG_INTERNAL_LIBTOMMATH=3Dy
> +#ifndef CONFIG_INTERNAL_LIBTOMMATH
> +#LTM_PATH=3D/usr/src/libtommath-0.39
> +#CFLAGS +=3D -I$(LTM_PATH)
> +#LIBS +=3D -L$(LTM_PATH)
> +#LIBS_p +=3D -L$(LTM_PATH)
> +#endif
> +# At the cost of about 4 kB of additional binary size, the internal
> +LibTomMath # can be configured to include faster routines for exptmod,
> +sqr, and div to # speed up DH and RSA calculation considerably
> +#CONFIG_INTERNAL_LIBTOMMATH_FAST=3Dy
> +
> +# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.
> +# This is only for Windows builds and requires WMI-related header files
> +and # WbemUuid.Lib from Platform SDK even when building with MinGW.
> +#CONFIG_NDIS_EVENTS_INTEGRATED=3Dy
> +#PLATFORMSDKLIB=3D"/opt/Program Files/Microsoft Platform SDK/Lib"
> +
> +# Add support for old DBus control interface #
> +(fi.epitest.hostap.WPASupplicant)
> +CONFIG_CTRL_IFACE_DBUS=3Dy
> +
> +# Add support for new DBus control interface #
> +(fi.w1.hostap.wpa_supplicant1) CONFIG_CTRL_IFACE_DBUS_NEW=3Dy
> +
> +# Add introspection support for new DBus control interface
> +CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy
> +
> +# Add support for loading EAP methods dynamically as shared libraries.
> +# When this option is enabled, each EAP method can be either included #
> +statically (CONFIG_EAP_<method>=3Dy) or dynamically
> (CONFIG_EAP_<method>=3Ddyn).
> +# Dynamic EAP methods are build as shared objects (eap_*.so) and they
> +need to # be loaded in the beginning of the wpa_supplicant
> +configuration file # (see load_dynamic_eap parameter in the example
> +file) before being used in # the network blocks.
> +#
> +# Note that some shared parts of EAP methods are included in the main
> +program # and in order to be able to use dynamic EAP methods using
> +these parts, the # main program must have been build with the EAP method
> enabled (=3Dy or =3Ddyn).
> +# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic
> +libraries # unless at least one of them was included in the main build
> +to force inclusion # of the shared code. Similarly, at least one of
> +EAP-SIM/AKA must be included # in the main build to be able to load thes=
e
> methods dynamically.
> +#
> +# Please also note that using dynamic libraries will increase the total
> +binary # size. Thus, it may not be the best option for targets that
> +have limited # amount of memory/flash.
> +#CONFIG_DYNAMIC_EAP_METHODS=3Dy
> +
> +# IEEE Std 802.11r-2008 (Fast BSS Transition) #CONFIG_IEEE80211R=3Dy
> +
> +# Add support for writing debug log to a file
> +(/tmp/wpa_supplicant-log-#.txt) CONFIG_DEBUG_FILE=3Dy
> +
> +# Send debug messages to syslog instead of stdout
> +#CONFIG_DEBUG_SYSLOG=3Dy # Set syslog facility for debug messages
> +#CONFIG_DEBUG_SYSLOG_FACILITY=3DLOG_DAEMON
> +
> +# Add support for sending all debug messages (regardless of debug
> +verbosity) # to the Linux kernel tracing facility. This helps debug the
> +entire stack by # making it easy to record everything happening from
> +the driver up into the # same file, e.g., using trace-cmd.
> +#CONFIG_DEBUG_LINUX_TRACING=3Dy
> +
> +# Add support for writing debug log to Android logcat instead of
> +standard # output #CONFIG_ANDROID_LOG=3Dy
> +
> +# Enable privilege separation (see README 'Privilege separation' for
> +details) #CONFIG_PRIVSEP=3Dy
> +
> +# Enable mitigation against certain attacks against TKIP by delaying
> +Michael # MIC error reports by a random amount of time between 0 and 60
> +seconds #CONFIG_DELAYED_MIC_ERROR_REPORT=3Dy
> +
> +# Enable tracing code for developer debugging # This tracks use of
> +memory allocations and other registrations and reports # incorrect use
> +with a backtrace of call (or allocation) location.
> +#CONFIG_WPA_TRACE=3Dy
> +# For BSD, uncomment these.
> +#LIBS +=3D -lexecinfo
> +#LIBS_p +=3D -lexecinfo
> +#LIBS_c +=3D -lexecinfo
> +
> +# Use libbfd to get more details for developer debugging # This enables
> +use of libbfd to get more detailed symbols for the backtraces #
> +generated by CONFIG_WPA_TRACE=3Dy.
> +#CONFIG_WPA_TRACE_BFD=3Dy
> +# For BSD, uncomment these.
> +#LIBS +=3D -lbfd -liberty -lz
> +#LIBS_p +=3D -lbfd -liberty -lz
> +#LIBS_c +=3D -lbfd -liberty -lz
> +
> +# wpa_supplicant depends on strong random number generation being
> +available # from the operating system. os_get_random() function is used
> +to fetch random # data when needed, e.g., for key generation. On Linux
> +and BSD systems, this # works by reading /dev/urandom. It should be
> +noted that the OS entropy pool # needs to be properly initialized
> +before wpa_supplicant is started. This is # important especially on
> +embedded devices that do not have a hardware random # number generator
> +and may by default start up with minimal entropy available # for random
> number generation.
> +#
> +# As a safety net, wpa_supplicant is by default trying to internally
> +collect # additional entropy for generating random data to mix in with
> +the data fetched # from the OS. This by itself is not considered to be
> +very strong, but it may # help in cases where the system pool is not
> +initialized properly. However, it # is very strongly recommended that
> +the system pool is initialized with enough # entropy either by using
> +hardware assisted random number generator or by # storing state over dev=
ice
> reboots.
> +#
> +# wpa_supplicant can be configured to maintain its own entropy store
> +over # restarts to enhance random number generation. This is not
> +perfect, but it is # much more secure than using the same sequence of
> +random numbers after every # reboot. This can be enabled with
> +-e<entropy file> command line option. The # specified file needs to be r=
eadable
> and writable by wpa_supplicant.
> +#
> +# If the os_get_random() is known to provide strong random data (e.g.,
> +on # Linux/BSD, the board in question is known to have reliable source
> +of random # data from /dev/urandom), the internal wpa_supplicant random
> +pool can be # disabled. This will save some in binary size and CPU use.
> +However, this # should only be considered for builds that are known to
> +be used on devices # that meet the requirements described above.
> +#CONFIG_NO_RANDOM_POOL=3Dy
> +
> +# IEEE 802.11n (High Throughput) support (mainly for AP mode)
> +CONFIG_IEEE80211N=3Dy
> +
> +# Interworking (IEEE 802.11u)
> +# This can be used to enable functionality to improve interworking with
> +# external networks (GAS/ANQP to learn more about the networks and
> +network # selection based on available credentials).
> +#CONFIG_INTERWORKING=3Dy
> +
> +# Hotspot 2.0
> +#CONFIG_HS20=3Dy
> +
> +# Disable roaming in wpa_supplicant
> +#CONFIG_NO_ROAMING=3Dy
> +
> +# Enable P2P
> +CONFIG_P2P=3Dy
> +CONFIG_AP=3Dy
> +
> +# bgscan
> +NEED_BGSCAN=3Dy
> +CONFIG_BGSCAN_LEARN=3Dy
> +CONFIG_BGSCAN_SIMPLE=3Dy
> +
> +# Enable WIFI Display
> +CONFIG_WIFI_DISPLAY=3Dy
> \ No newline at end of file
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a7.02.bb b/meta-arago-extras/recipes-connectivity/wp=
a-
> supplicant/wpa-supplicant-wl18xx_r8.a7.02.bb
> new file mode 100644
> index 0000000..0ea9ff5
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt-wl18xx_r8.a7.02.bb
> @@ -0,0 +1,29 @@
> +# This is a TI specific version of the wpa-supplicant recipe for use
> +with the # wl18xx wlan module.
> +
> +require wpa-supplicant.inc
> +
> +LICENSE =3D "GPLv2 | BSD"
> +LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e \
> +                    file://../README;md5=3D5cb758942d25f6f61fd4ac388fd44=
6fa \
> +
> file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=3D8835156c8ab8cad6=
356ec
> 7f39ebe3aba"
> +
> +FILESEXTRAPATHS_append :=3D "${THISDIR}/wpa-supplicant:"
> +
> +COMPATIBLE_MACHINE =3D "(omap-a15)"
> +
> +# Tag: ol_r8.a7.02
> +SRCREV =3D "4dda294a5186f3efb437ae0898a6df71655843ef"
> +PR =3D "r4+gitr${SRCPV}"
> +
> +SRC_URI +=3D
> +"file://0001-revert-android-patches-to-enable-wfd.patch;patchdir=3D.. \ =
"
> +
> +# Add ti to the PV to indicate that this is a TI modify version of wpa-s=
upplicant.
> +PV =3D "2.0-devel-ti"
> +
> +PROVIDES +=3D "wpa-supplicant"
> +RPROVIDES_${PN}  +=3D "wpa-supplicant"
> +RREPLACES_${PN}  +=3D "wpa-supplicant"
> +RCONFLICTS_${PN}  +=3D "wpa-supplicant"
> +RDEPENDS_${PN} +=3D "wpa-supplicant-cli wpa-supplicant-passphrase"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

