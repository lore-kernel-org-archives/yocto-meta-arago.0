Return-Path: <eyalr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4B7C952A7A
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 13:56:41 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2KDueQW016074
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2013 08:56:40 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2KDud7x032411
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2013 08:56:40 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Wed, 20 Mar 2013 14:56:38 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv3 4/9] wpa-supplicant-wl18xx: build ti
	2.0-devel version for wilink8
Thread-Index: AQHOJXIhf42PVQBEKEGKnqopdJ077JiumahQ
Date: Wed, 20 Mar 2013 13:56:37 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C5262C@DNCE04.ent.ti.com>
References: <1363771816-4022-2-git-send-email-eyalr@ti.com>
	<1363771816-4022-4-git-send-email-eyalr@ti.com>
	<7D46E86EC0A8354091174257B2FED1015948AB33@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015948AB33@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: [PATCHv3 4/9] wpa-supplicant-wl18xx: build ti	2.0-devel version for wilink8
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
X-List-Received-Date: Wed, 20 Mar 2013 13:56:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Maupin, Chase
> Sent: Wednesday, March 20, 2013 3:52 PM
> To: Reizer, Eyal; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCHv3 4/9] wpa-supplicant-wl18xx: build ti
> 2.0-devel version for wilink8
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Reizer, Eyal
> > Sent: Wednesday, March 20, 2013 4:30 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCHv3 4/9] wpa-supplicant-wl18xx: build ti
> > 2.0-devel version for wilink8
> >
> > Add a recipe for building a ti specific 2.0-devel version for
> Wilink8.
> >
> > This package replace the wilink6 package which is provided by the
> > wpa-supplicant recipe.
> > Selection between the two is done using a "WILINK_VERSION" switch
> > added to arago.conf.
> >
> > Changes in v2:
> > * Use an actual release name in the recipe name instead of _git
> > * Add RPROVIDES, RREPLACES, RCONFLICTS as this recipe completely
> >   replace the wilink6 one.
> > * Use the wpa-supplicant.inc file added lately by Franklin and
> >   therefore depends on his series of patches for selecting between
> >   different versions of wilink6 releases.
> >
> > Changes in v3:
> > * Add _${PN} to all runtime variables
> >
> > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > ---
> >  .../wpa-supplicant/wpa-supplicant-wl18xx/defconfig |  430
> > ++++++++++++++++++++
> >  .../wpa-supplicant-wl18xx_r8.a6.01.bb              |   23 ++
> >  .../wpa-supplicant/wpa-supplicant.inc              |    2 +-
> >  3 files changed, 454 insertions(+), 1 deletion(-)  create mode
> 100755
> > meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant-wl18xx/defconfig
> >  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb
> >
> > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant-wl18xx/defconfig b/meta-arago-
> > extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > wl18xx/defconfig
> > new file mode 100755
> > index 0000000..b982e2a
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > supplicant-wl18xx/defconfig
>=20
> Is the duplication of this config file necessary?  See my previous
> feedback.  I'm thinking something like what you did for hostap-daemon
>=20

Yes, it is needed. There are some difference between the settings in one of=
 the defconfigs for WL6 and the one for WL8 as there are new features added=
 to the supplicant.

>=20
> > @@ -0,0 +1,430 @@
> > +# Example wpa_supplicant build time configuration # # This file
> lists
> > +the configuration options that are used when
> > building the
> > +# hostapd binary. All lines starting with # are ignored.
> > Configuration option
> > +# lines must be commented out complete, if they are not to be
> > included, i.e.,
> > +# just setting VARIABLE=3Dn is not disabling that variable.
> > +#
> > +# This file is included in Makefile, so variables like CFLAGS
> > and LIBS can also
> > +# be modified from here. In most cases, these lines should use =3D in
> > +order not # to override previous values of the variables.
> > +
> > +
> > +# Uncomment following two lines and fix the paths if you have
> > installed OpenSSL
> > +# or GnuTLS in non-default location
> > +#CFLAGS +=3D -I/usr/local/openssl/include #LIBS +=3D
> > +-L/usr/local/openssl/lib
> > +
> > +# Some Red Hat versions seem to include kerberos header files
> > from OpenSSL, but
> > +# the kerberos files are not in the default include path.
> > Following line can be
> > +# used to fix build issues on such systems (krb5.h not found).
> > +#CFLAGS +=3D -I/usr/include/kerberos
> > +
> > +# Example configuration for various cross-compilation platforms
> > +
> > +#### sveasoft (e.g., for Linksys WRT54G)
> > ######################################
> > +#CC=3Dmipsel-uclibc-gcc
> > +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> > +#CFLAGS +=3D -Os
> > +#CPPFLAGS +=3D -I../src/include -I../../src/router/openssl/include
> > +#LIBS +=3D -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
> > +################################################################
> > ###############
> > +
> > +#### openwrt (e.g., for Linksys WRT54G)
> > #######################################
> > +#CC=3Dmipsel-uclibc-gcc
> > +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> > +#CFLAGS +=3D -Os
> > +#CPPFLAGS=3D-I../src/include -I../openssl-0.9.7d/include \
> > +#	-I../WRT54GS/release/src/include
> > +#LIBS =3D -lssl
> > +################################################################
> > ###############
> > +
> > +#CC=3D$(CROSS_COMPILE)gcc
> > +#CFLAGS +=3D -DCONFIG_LIBNL20
> > +#CPPFLAGS +=3D -DCONFIG_LIBNL20
> > +#LIBS +=3D -L$(NFSROOT)/lib -lnl
> > +#LIBS_p +=3D -L$(NFSROOT)/lib
> > +#LIBDIR =3D $(NFSROOT)/lib
> > +#BINDIR =3D $(NFSROOT)/usr/sbin
> > +
> > +CONFIG_WAPI=3Dy
> > +CONFIG_LIBNL20=3Dy
> > +NEED_BGSCAN=3Dy
> > +CONFIG_BGSCAN_LEARN=3Dy
> > +
> > +# Driver interface for Host AP driver #CONFIG_DRIVER_HOSTAP=3Dy
> > +
> > +# Driver interface for Agere driver
> > +#CONFIG_DRIVER_HERMES=3Dy
> > +# Change include directories to match with the local setup #CFLAGS
> +=3D
> > +-I../../hcf -I../../include -I../../include/hcf #CFLAGS +=3D
> > +-I../../include/wireless
> > +
> > +# Driver interface for madwifi driver # Deprecated; use
> > +CONFIG_DRIVER_WEXT=3Dy instead.
> > +#CONFIG_DRIVER_MADWIFI=3Dy
> > +# Set include directory to the madwifi source tree #CFLAGS +=3D
> > +-I../../madwifi
> > +
> > +# Driver interface for ndiswrapper
> > +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> > +#CONFIG_DRIVER_NDISWRAPPER=3Dy
> > +
> > +# Driver interface for Atmel driver
> > +#CONFIG_DRIVER_ATMEL=3Dy
> > +
> > +# Driver interface for old Broadcom driver # Please note that the
> > +newer Broadcom driver ("hybrid Linux
> > driver") supportsBG
> > +# Linux wireless extensions and does not need (or even work)
> > with the old
> > +# driver wrapper. Use CONFIG_DRIVER_WEXT=3Dy with that driver.
> > +#CONFIG_DRIVER_BROADCOM=3Dy
> > +# Example path for wlioctl.h; change to match your configuration
> > +#CFLAGS +=3D -I/opt/WRT54GS/release/src/include
> > +
> > +# Driver interface for Intel ipw2100/2200 driver # Deprecated; use
> > +CONFIG_DRIVER_WEXT=3Dy instead.
> > +#CONFIG_DRIVER_IPW=3Dy
> > +
> > +# Driver interface for Ralink driver
> > +#CONFIG_DRIVER_RALINK=3Dy
> > +
> > +# Driver interface for generic Linux wireless extensions
> > +CONFIG_DRIVER_WEXT=3Dy
> > +
> > +# Driver interface for Linux drivers using the nl80211 kernel
> > interface
> > +CONFIG_DRIVER_NL80211=3Dy
> > +
> > +# Driver interface for FreeBSD net80211 layer (e.g., Atheros
> > driver)
> > +#CONFIG_DRIVER_BSD=3Dy
> > +#CFLAGS +=3D -I/usr/local/include
> > +#LIBS +=3D -L/usr/local/lib
> > +#LIBS_p +=3D -L/usr/local/libBG
> > +#LIBS_c +=3D -L/usr/local/lib
> > +
> > +# Driver interface for Windows NDIS
> > +#CONFIG_DRIVER_NDIS=3Dy
> > +#CFLAGS +=3D -I/usr/include/w32api/ddk
> > +#LIBS +=3D -L/usr/local/lib
> > +# For native build using mingw
> > +#CONFIG_NATIVE_WINDOWS=3Dy
> > +# Additional directories for cross-compilation on Linux host for
> > mingw target
> > +#CFLAGS +=3D -I/opt/mingw/mingw32/include/ddk #LIBS +=3D
> > +-L/opt/mingw/mingw32/lib #CC=3Dmingw32-gcc # By default, driver_ndis
> > +uses WinPcap for low-level operations.
> > This can be
> > +# replaced with the following option which replaces WinPcap
> > calls with NDISUIO.
> > +# However, this requires that WZC is disabled (net stop wzcsvc)
> > before starting
> > +# wpa_supplicant.
> > +# CONFIG_USE_NDISUIO=3Dy
> > +
> > +# Driver interface for development testing #CONFIG_DRIVER_TEST=3Dy
> > +
> > +# Include client MLME (management frame processing) for test
> > driver
> > +# This can be used to test MLME operations in hostapd with the
> > test interface.
> > +# space.
> > +#CONFIG_CLIENT_MLME=3Dy
> > +
> > +# Driver interface for wired Ethernet drivers CONFIG_DRIVER_WIRED=3Dy
> > +
> > +# Driver interface for the Broadcom RoboSwitch family
> > +#CONFIG_DRIVER_ROBOSWITCH=3Dy
> > +
> > +# Driver interface for no driver (e.g., WPS ER only)
> > +#CONFIG_DRIVER_NONE=3Dy
> > +
> > +# Solaris libraries
> > +#LIBS +=3D -lsocket -ldlpi -lnsl
> > +#LIBS_c +=3D -lsocket
> > +
> > +# Enable IEEE 802.1X Supplicant (automatically included if any
> > EAP method is
> > +# included)
> > +CONFIG_IEEE8021X_EAPOL=3Dy
> > +
> > +# EAP-MD5
> > +CONFIG_EAP_MD5=3Dy
> > +
> > +# EAP-MSCHAPv2
> > +CONFIG_EAP_MSCHAPV2=3Dy
> > +
> > +# EAP-TLS
> > +CONFIG_EAP_TLS=3Dy
> > +
> > +# EAL-PEAP
> > +CONFIG_EAP_PEAP=3Dy
> > +
> > +# EAP-TTLS
> > +CONFIG_EAP_TTLS=3Dy
> > +
> > +# EAP-FAST
> > +# Note: Default OpenSSL package does not include support for all
> > the
> > +# functionality needed for EAP-FAST. If EAP-FAST is enabled with
> > OpenSSL,
> > +# the OpenSSL library must be patched (openssl-0.9.8d-tls-
> > extensions.patch)
> > +# to add the needed functions.
> > +#CONFIG_EAP_FAST=3Dy
> > +
> > +# EAP-GTC
> > +CONFIG_EAP_GTC=3Dy
> > +
> > +# EAP-OTP
> > +CONFIG_EAP_OTP=3Dy
> > +
> > +# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used) #CONFIG_EAP_SIM=3Dy
> > +
> > +# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
> > +#CONFIG_EAP_PSK=3Dy
> > +
> > +# EAP-PAX
> > +#CONFIG_EAP_PAX=3Dy
> > +
> > +# LEAP
> > +CONFIG_EAP_LEAP=3Dy
> > +
> > +# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used) #CONFIG_EAP_AKA=3Dy
> > +
> > +# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
> > +# This requires CONFIG_EAP_AKA to be enabled, too.
> > +#CONFIG_EAP_AKA_PRIME=3Dy
> > +
> > +# Enable USIM simulator (Milenage) for EAP-AKA
> > +#CONFIG_USIM_SIMULATOR=3Dy
> > +
> > +# EAP-SAKE
> > +#CONFIG_EAP_SAKE=3Dy
> > +
> > +# EAP-GPSK
> > +#CONFIG_EAP_GPSK=3Dy
> > +# Include support for optional SHA256 cipher suite in EAP-GPSK
> > +#CONFIG_EAP_GPSK_SHA256=3Dy
> > +
> > +# EAP-TNC and related Trusted Network Connect support
> > (experimental)
> > +#CONFIG_EAP_TNC=3Dy
> > +
> > +# Wi-Fi Protected Setup (WPS)
> > +CONFIG_WPS=3Dy
> > +# Enable WSC 2.0 support
> > +CONFIG_WPS2=3Dy
> > +
> > +# EAP-IKEv2
> > +#CONFIG_EAP_IKEV2=3Dy
> > +
> > +# PKCS#12 (PFX) support (used to read private key and
> > certificate file from
> > +# a file that usually has extension .p12 or .pfx) CONFIG_PKCS12=3Dy
> > +
> > +# Smartcard support (i.e., private key on a smartcard), e.g.,
> > with openssl
> > +# engine.
> > +CONFIG_SMARTCARD=3Dy
> > +
> > +# PC/SC interface for smartcards (USIM, GSM SIM) # Enable this if
> > +EAP-SIM or EAP-AKA is included #CONFIG_PCSC=3Dy
> > +
> > +# Development testingBG
> > +#CONFIG_EAPOL_TEST=3Dy
> > +
> > +# Select control interface backend for external programs, e.g,
> > wpa_cli:
> > +# unix =3D UNIX domain sockets (default for Linux/*BSD) # udp =3D UDP
> > +sockets using localhost (127.0.0.1) # named_pipe =3D Windows Named
> Pipe
> > +(default for Windows) # y =3D use default (backwards compatibility) #
> > +If this option is commented out, control interface is not
> > included in the
> > +# build.
> > +CONFIG_CTRL_IFACE=3Dy
> > +
> > +# Include support for GNU Readline and History Libraries in
> > wpa_cli.
> > +# When building a wpa_cli binary for distribution, please note
> > that these
> > +# libraries are licensed under GPL and as such, BSD license may
> > not apply for
> > +# the resulting binary.
> > +#CONFIG_READLINE=3Dy
> > +
> > +# Remove debugging code that is printing out debug message to
> > stdout.
> > +# This can be used to reduce the size of the wpa_supplicant
> > considerably
> > +# if debugging code is not needed. The size reduction can be
> > around 35%
> > +# (e.g., 90 kB).
> > +#CONFIG_NO_STDOUT_DEBUG=3Dy
> > +
> > +# Remove WPA support, e.g., for wired-only IEEE 802.1X
> > supplicant, to save
> > +# 35-50 kB in code size.
> > +#CONFIG_NO_WPA=3Dy
> > +
> > +# Remove WPA2 support. This allows WPA to be used, but removes
> > WPA2 code to
> > +# save about 1 kB in code size when building only WPA-Personal
> > (no EAP support)
> > +# or 6 kB if building for WPA-Enterprise.
> > +#CONFIG_NO_WPA2=3Dy
> > +
> > +# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support # This
> > +option can be used to reduce code size by removing
> > support for
> > +# converting ASCII passphrases into PSK. If this functionality
> > is removed, the
> > +# PSK can only be configured as the 64-octet hexstring (e.g.,
> > from
> > +# wpa_passphrase). This saves about 0.5 kB in code size.
> > +#CONFIG_NO_WPA_PASSPHRASE=3Dy
> > +
> > +# Disable scan result processing (ap_mode=3D1) to save code size
> > by about 1 kB.
> > +# This can be used if ap_scan=3D1 mode is never enabled.
> > +#CONFIG_NO_SCAN_PROCESSING=3Dy
> > +
> > +# Select configuration backend:
> > +# file =3D text file (e.g., wpa_supplicant.conf; note: the
> > configuration file
> > +#	path is given on command line, not here; this option is
> > just used to
> > +#	select the backend that allows configuration files to be
> > used)
> > +# winreg =3D Windows registry (see win_example.reg for an example)
> > +CONFIG_BACKEND=3Dfile
> > +
> > +# Remove configuration write functionality (i.e., to allow the
> > configuration
> > +# file to be updated based on runtime configuration changes).
> > The runtime
> > +# configuration can still be changed, the changes are just not
> > going to be
> > +# persistent over restarts. This option can be used to reduce
> > code size by
> > +# about 3.5 kB.
> > +#CONFIG_NO_CONFIG_WRITE=3Dy
> > +
> > +# Remove support for configuration blobs to reduce code size by
> > about 1.5 kB.
> > +#CONFIG_NO_CONFIG_BLOBS=3Dy
> > +
> > +# Select program entry point implementation:
> > +# main =3D UNIX/POSIX like main() function (default) # main_winsvc =3D
> > +Windows service (read parameters from registry) # main_none =3D Very
> > +basic example (development use only) #CONFIG_MAIN=3Dmain
> > +
> > +# Select wrapper for operatins system and C library specific
> > functions
> > +# unix =3D UNIX/POSIX like systems (default) # win32 =3D Windows syste=
ms
> > +# none =3D Empty template #CONFIG_OS=3Dunix
> > +
> > +# Select event loop implementation
> > +# eloop =3D select() loop (default)
> > +# eloop_win =3D Windows events and WaitForMultipleObject() loop #
> > +eloop_none =3D Empty template #CONFIG_ELOOP=3Deloop
> > +
> > +# Select layer 2 packet implementation # linux =3D Linux packet socket
> > +(default) # pcap =3D libpcap/libdnet/WinPcap # freebsd =3D FreeBSD
> > +libpcap # winpcap =3D WinPcap with receive thread # ndis =3D Windows
> > +NDISUIO (note: requires CONFIG_USE_NDISUIO=3Dy) # none =3D Empty
> template
> > +#CONFIG_L2_PACKET=3Dlinux
> > +
> > +# PeerKey handshake for Station to Station Link (IEEE 802.11e
> > DLS)
> > +CONFIG_PEERKEY=3Dy
> > +
> > +# IEEE 802.11w (management frame protection) # This version is an
> > +experimental implementation based on IEEE
> > 802.11w/D1.0
> > +# draft and is subject to change since the standard has not yet
> > been finalized.
> > +# Driver support is also needed for IEEE 802.11w.
> > +#CONFIG_IEEE80211W=3Dy
> > +
> > +# Select TLS implementation
> > +# openssl =3D OpenSSL (default)
> > +# gnutls =3D GnuTLS (needed for TLS/IA, see also
> > CONFIG_GNUTLS_EXTRA)
> > +# internal =3D Internal TLSv1 implementation (experimental) # none =3D
> > +Empty template #CONFIG_TLS=3Dopenssl
> > +
> > +# Whether to enable TLS/IA support, which is required for EAP-
> > TTLSv1.
> > +# You need CONFIG_TLS=3Dgnutls for this to have any effect. Please
> > note that
> > +# even though the core GnuTLS library is released under LGPL,
> > this extra
> > +# library uses GPL and as such, the terms of GPL apply to the
> > combination
> > +# of wpa_supplicant and GnuTLS if this option is enabled. BSD
> > license may not
> > +# apply for distribution of the resulting binary.
> > +#CONFIG_GNUTLS_EXTRA=3Dy
> > +
> > +# If CONFIG_TLS=3Dinternal is used, additional library and include
> > paths are
> > +# needed for LibTomMath. Alternatively, an integrated, minimal
> > version of
> > +# LibTomMath can be used. See beginning of libtommath.c for
> > details on benefits
> > +# and drawbacks of this option.
> > +#CONFIG_INTERNAL_LIBTOMMATH=3Dy
> > +#ifndef CONFIG_INTERNAL_LIBTOMMATH
> > +#LTM_PATH=3D/usr/src/libtommath-0.39
> > +#CFLAGS +=3D -I$(LTM_PATH)
> > +#LIBS +=3D -L$(LTM_PATH)
> > +#LIBS_p +=3D -L$(LTM_PATH)
> > +#endif
> > +# At the cost of about 4 kB of additional binary size, the
> > internal LibTomMath
> > +# can be configured to include faster routines for exptmod, sqr,
> > and div to
> > +# speed up DH and RSA calculation considerably
> > +#CONFIG_INTERNAL_LIBTOMMATH_FAST=3Dy
> > +
> > +# Include NDIS event processing through WMI into
> > wpa_supplicant/wpasvc.
> > +# This is only for Windows builds and requires WMI-related
> > header files and
> > +# WbemUuid.Lib from Platform SDK even when building with MinGW.
> > +#CONFIG_NDIS_EVENTS_INTEGRATED=3Dy
> > +#PLATFORMSDKLIB=3D"/opt/Program Files/Microsoft Platform SDK/Lib"
> > +
> > +# Add support for old DBus control interface #
> > +(fi.epitest.hostap.WPASupplicant)
> > +CONFIG_CTRL_IFACE_DBUS=3Dy
> > +
> > +# Add support for new DBus control interface #
> > +(fi.w1.hostap.wpa_supplicant1) CONFIG_CTRL_IFACE_DBUS_NEW=3Dy
> > +
> > +# Add introspection support for new DBus control interface
> > +CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy
> > +
> > +# Add support for loading EAP methods dynamically as shared
> > libraries.
> > +# When this option is enabled, each EAP method can be either
> > included
> > +# statically (CONFIG_EAP_<method>=3Dy) or dynamically
> > (CONFIG_EAP_<method>=3Ddyn).
> > +# Dynamic EAP methods are build as shared objects (eap_*.so) and
> > they need to
> > +# be loaded in the beginning of the wpa_supplicant configuration
> > file
> > +# (see load_dynamic_eap parameter in the example file) before
> > being used in
> > +# the network blocks.
> > +#
> > +# Note that some shared parts of EAP methods are included in the
> > main program
> > +# and in order to be able to use dynamic EAP methods using these
> > parts, the
> > +# main program must have been build with the EAP method enabled
> > (=3Dy or =3Ddyn).
> > +# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as
> > dynamic libraries
> > +# unless at least one of them was included in the main build to
> > force inclusion
> > +# of the shared code. Similarly, at least one of EAP-SIM/AKA
> > must be included
> > +# in the main build to be able to load these methods
> > dynamically.
> > +#
> > +# Please also note that using dynamic libraries will increase
> > the total binary
> > +# size. Thus, it may not be the best option for targets that
> > have limited
> > +# amount of memory/flash.
> > +#CONFIG_DYNAMIC_EAP_METHODS=3Dy
> > +
> > +# IEEE Std 802.11r-2008 (Fast BSS Transition) #CONFIG_IEEE80211R=3Dy
> > +
> > +# Add support for writing debug log to a file
> > (/tmp/wpa_supplicant-log-#.txt)
> > +CONFIG_DEBUG_FILE=3Dy
> > +
> > +# Enable privilege separation (see README 'Privilege separation'
> > for details)
> > +#CONFIG_PRIVSEP=3Dy
> > +
> > +# Enable mitigation against certain attacks against TKIP by
> > delaying Michael
> > +# MIC error reports by a random amount of time between 0 and 60
> > seconds
> > +#CONFIG_DELAYED_MIC_ERROR_REPORT=3Dy
> > +
> > +# Enable tracing code for developer debugging # This tracks use of
> > +memory allocations and other registrations
> > and reports
> > +# incorrect use with a backtrace of call (or allocation)
> > location.
> > +#CONFIG_WPA_TRACE=3Dy
> > +# For BSD, comment out these.
> > +#LIBS +=3D -lexecinfo
> > +#LIBS_p +=3D -lexecinfo
> > +#LIBS_c +=3D -lexecinfo
> > +
> > +# Use libbfd to get more details for developer debugging # This
> > +enables use of libbfd to get more detailed symbols for
> > the backtraces
> > +# generated by CONFIG_WPA_TRACE=3Dy.
> > +#CONFIG_WPA_TRACE_BFD=3Dy
> > +# For BSD, comment out these.
> > +#LIBS +=3D -lbfd -liberty -lz
> > +#LIBS_p +=3D -lbfd -liberty -lz
> > +#LIBS_c +=3D -lbfd -liberty -lz
> > +
> > +# for p2p
> > +CONFIG_P2P=3Dy
> > +CONFIG_AP=3Dy
> > +
> > +# IEEE 802.11n (High Throughput) support CONFIG_IEEE80211N=3Dy
> > +
> > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb b/meta-arago-
> > extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > wl18xx_r8.a6.01.bb
> > new file mode 100644
> > index 0000000..8e17de3
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > supplicant-wl18xx_r8.a6.01.bb
> > @@ -0,0 +1,23 @@
> > +# This is a TI specific version of the wpa-supplicant recipe for
> > use with the
> > +# wl18xx wlan module.
> > +
> > +require wpa-supplicant.inc
> > +
> > +LICENSE =3D "GPLv2 | BSD"
> > +LIC_FILES_CHKSUM =3D
> > "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e \
> > +
> > file://../README;md5=3D5cb758942d25f6f61fd4ac388fd446fa \
> > +
> > file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=3D8835156c8ab8ca
> > d6356ec7f39ebe3aba"
> > +
> > +FILESEXTRAPATHS_append :=3D "${THISDIR}/wpa-supplicant:"
> > +
> > +SRCREV =3D "ol_r8.a6.01"
> > +PR =3D "r1+gitr${SRCREV}"
> > +
> > +# Add ti to the PV to indicate that this is a TI modify version
> > of wpa-supplicant.
> > +PV =3D "2.0-devel-ti"
> > +
> > +PROVIDES +=3D "wpa-supplicant"
> > +RPROVIDES_${PN}  +=3D "wpa-supplicant"
> > +RREPLACES_${PN}  +=3D "wpa-supplicant"
> > +RCONFLICTS_${PN}  +=3D "wpa-supplicant"
> > +RDEPENDS_${PN} +=3D "wpa-supplicant-cli wpa-supplicant-passphrase"
> > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-
> > connectivity/wpa-supplicant/wpa-supplicant.inc
> > index ec09d9e..96289d6 100644
> > --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > supplicant.inc
> > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > supplicant.inc
> > @@ -13,7 +13,7 @@ RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase
> > wpa-supplicant-cli"
> >  # wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
> >  DEFAULT_PREFERENCE =3D "-1"
> >
> > -PR =3D "r4"
> > +PR =3D "r5"
> >
> >  SRC_URI =3D "git://github.com/TI-OpenLink/hostap.git;protocol=3Dgit
> > \
> >             file://defconfig \
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

