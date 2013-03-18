Return-Path: <eyalr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 831E552961
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 16:42:25 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IGgOLK018428
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 11:42:24 -0500
Received: from DNCE70.ent.ti.com (dnce70.ent.ti.com [137.167.131.19])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IGgOr7008880
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 11:42:24 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE70.ent.ti.com ([fe80::70c9:b447:24a2:dddc%30]) with mapi id
	14.01.0323.003; Mon, 18 Mar 2013 17:42:23 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH 4/9] wpa-supplicant-wl18xx: build ti
	2.0-devel version for wilink8
Thread-Index: AQHOI928/AflgR+MzEa8dJqA6j+WKZiriKgAgAAB6oCAABwO4A==
Date: Mon, 18 Mar 2013 16:42:23 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C50682@DNCE04.ent.ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
	<1363613762-6537-4-git-send-email-eyalr@ti.com>
	<7D46E86EC0A8354091174257B2FED10159480F8A@DLEE11.ent.ti.com>
	<20130318155913.GD14761@denix.org>
In-Reply-To: <20130318155913.GD14761@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/9] wpa-supplicant-wl18xx: build ti 2.0-devel version for wilink8
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
X-List-Received-Date: Mon, 18 Mar 2013 16:42:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, March 18, 2013 5:59 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 4/9] wpa-supplicant-wl18xx: build ti
> 2.0-devel version for wilink8
>=20
> On Mon, Mar 18, 2013 at 03:52:22PM +0000, Maupin, Chase wrote:
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Eyal Reizer
> > > Sent: Monday, March 18, 2013 8:36 AM
> > > To: meta-arago@arago-project.org
> > > Subject: [meta-arago] [PATCH 4/9] wpa-supplicant-wl18xx: build ti
> > > 2.0-devel version for wilink8
> > >
> > > From: Eyal Reizer <eyalr@ti.com>
> > >
> > > Add a recipe for building a ti specific 2.0-devel version for
> > > Wilink8.
> > >
> > > This package replace the wilink6 package which is provided by the
> > > wpa-supplicant recipe.
> > > Selection between the two is done using a "WILINK_VERSION" switch
> > > added
> > > to arago.conf.
> > >
> > > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> >
> >
> > Overall I have the same questions as for the hostap-daemon recipe.
>=20
> See way below...
>=20
>=20
> > > ---
> > >  .../wpa-supplicant-wl18xx/99_wpa_supplicant        |    1 +
> > >  .../wpa-supplicant-wl18xx/defaults-sane            |    8 +
> > >  .../wpa-supplicant/wpa-supplicant-wl18xx/defconfig |  430
> > > ++++++++++++
> > >  .../fi.epitest.hostap.WPASupplicant.service        |    4 +
> > >  .../fi.w1.wpa_supplicant1.service                  |    4 +
> > >  .../wpa-supplicant-wl18xx/kill_wpa_supplicant.sh   |    9 +
> > >  .../wpa-supplicant-wl18xx/wpa-supplicant.sh        |   85 +++
> > >  .../wpa-supplicant-wl18xx/wpa_supplicant.conf      |  690
> > > ++++++++++++++++++++
> > >  .../wpa-supplicant-wl18xx/wpa_supplicant.conf-sane |    7 +
> > >  .../wpa-supplicant/wpa-supplicant-wl18xx_git.bb    |   23 +
> > >  10 files changed, 1261 insertions(+)
> > >  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/99_wpa_supplicant
> > >  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/defaults-sane
> > >  create mode 100755 meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/defconfig
> > >  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-
> > > wl18xx/fi.epitest.hostap.WPASupplicant.service
> > >  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/fi.w1.wpa_supplicant1.service
> > >  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/kill_wpa_supplicant.sh
> > >  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/wpa-supplicant.sh
> > >  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/wpa_supplicant.conf
> > >  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/wpa_supplicant.conf-sane
> > >  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx_git.bb
> > >
> > > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/99_wpa_supplicant b/meta-arago-
> > > extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > > wl18xx/99_wpa_supplicant
> > > new file mode 100644
> > > index 0000000..6ff4dd8
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > supplicant-wl18xx/99_wpa_supplicant
> > > @@ -0,0 +1 @@
> > > +d root root 0700 /var/run/wpa_supplicant none
> > > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/defaults-sane b/meta-arago-
> > > extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > > wl18xx/defaults-sane
> > > new file mode 100644
> > > index 0000000..67c4cbd
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > supplicant-wl18xx/defaults-sane
> > > @@ -0,0 +1,8 @@
> > > +# Useful flags:
> > > +#  -i <ifname>          Interface (required, unless specified in
> > > config)
> > > +#  -D <driver>          Wireless Driver
> > > +#  -d                   Debugging (-dd for more)
> > > +#  -q                   Quiet (-qq for more)
> > > +
> > > +CONFIG=3D"/etc/wpa_supplicant.conf"
> > > +OPTIONS=3D"-i eth1 -D wext"
> > > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/defconfig b/meta-arago-
> > > extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > > wl18xx/defconfig
> > > new file mode 100755
> > > index 0000000..b982e2a
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > supplicant-wl18xx/defconfig
> > > @@ -0,0 +1,430 @@
> > > +# Example wpa_supplicant build time configuration
> > > +#
> > > +# This file lists the configuration options that are used when
> > > building the
> > > +# hostapd binary. All lines starting with # are ignored.
> > > Configuration option
> > > +# lines must be commented out complete, if they are not to be
> > > included, i.e.,
> > > +# just setting VARIABLE=3Dn is not disabling that variable.
> > > +#
> > > +# This file is included in Makefile, so variables like CFLAGS
> > > and LIBS can also
> > > +# be modified from here. In most cases, these lines should use
> > > +=3D in order not
> > > +# to override previous values of the variables.
> > > +
> > > +
> > > +# Uncomment following two lines and fix the paths if you have
> > > installed OpenSSL
> > > +# or GnuTLS in non-default location
> > > +#CFLAGS +=3D -I/usr/local/openssl/include
> > > +#LIBS +=3D -L/usr/local/openssl/lib
> > > +
> > > +# Some Red Hat versions seem to include kerberos header files
> > > from OpenSSL, but
> > > +# the kerberos files are not in the default include path.
> > > Following line can be
> > > +# used to fix build issues on such systems (krb5.h not found).
> > > +#CFLAGS +=3D -I/usr/include/kerberos
> > > +
> > > +# Example configuration for various cross-compilation platforms
> > > +
> > > +#### sveasoft (e.g., for Linksys WRT54G)
> > > ######################################
> > > +#CC=3Dmipsel-uclibc-gcc
> > > +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> > > +#CFLAGS +=3D -Os
> > > +#CPPFLAGS +=3D -I../src/include -I../../src/router/openssl/include
> > > +#LIBS +=3D -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
> > > +################################################################
> > > ###############
> > > +
> > > +#### openwrt (e.g., for Linksys WRT54G)
> > > #######################################
> > > +#CC=3Dmipsel-uclibc-gcc
> > > +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> > > +#CFLAGS +=3D -Os
> > > +#CPPFLAGS=3D-I../src/include -I../openssl-0.9.7d/include \
> > > +#	-I../WRT54GS/release/src/include
> > > +#LIBS =3D -lssl
> > > +################################################################
> > > ###############
> > > +
> > > +#CC=3D$(CROSS_COMPILE)gcc
> > > +#CFLAGS +=3D -DCONFIG_LIBNL20
> > > +#CPPFLAGS +=3D -DCONFIG_LIBNL20
> > > +#LIBS +=3D -L$(NFSROOT)/lib -lnl
> > > +#LIBS_p +=3D -L$(NFSROOT)/lib
> > > +#LIBDIR =3D $(NFSROOT)/lib
> > > +#BINDIR =3D $(NFSROOT)/usr/sbin
> > > +
> > > +CONFIG_WAPI=3Dy
> > > +CONFIG_LIBNL20=3Dy
> > > +NEED_BGSCAN=3Dy
> > > +CONFIG_BGSCAN_LEARN=3Dy
> > > +
> > > +# Driver interface for Host AP driver
> > > +#CONFIG_DRIVER_HOSTAP=3Dy
> > > +
> > > +# Driver interface for Agere driver
> > > +#CONFIG_DRIVER_HERMES=3Dy
> > > +# Change include directories to match with the local setup
> > > +#CFLAGS +=3D -I../../hcf -I../../include -I../../include/hcf
> > > +#CFLAGS +=3D -I../../include/wireless
> > > +
> > > +# Driver interface for madwifi driver
> > > +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> > > +#CONFIG_DRIVER_MADWIFI=3Dy
> > > +# Set include directory to the madwifi source tree
> > > +#CFLAGS +=3D -I../../madwifi
> > > +
> > > +# Driver interface for ndiswrapper
> > > +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> > > +#CONFIG_DRIVER_NDISWRAPPER=3Dy
> > > +
> > > +# Driver interface for Atmel driver
> > > +#CONFIG_DRIVER_ATMEL=3Dy
> > > +
> > > +# Driver interface for old Broadcom driver
> > > +# Please note that the newer Broadcom driver ("hybrid Linux
> > > driver") supportsBG
> > > +# Linux wireless extensions and does not need (or even work)
> > > with the old
> > > +# driver wrapper. Use CONFIG_DRIVER_WEXT=3Dy with that driver.
> > > +#CONFIG_DRIVER_BROADCOM=3Dy
> > > +# Example path for wlioctl.h; change to match your configuration
> > > +#CFLAGS +=3D -I/opt/WRT54GS/release/src/include
> > > +
> > > +# Driver interface for Intel ipw2100/2200 driver
> > > +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> > > +#CONFIG_DRIVER_IPW=3Dy
> > > +
> > > +# Driver interface for Ralink driver
> > > +#CONFIG_DRIVER_RALINK=3Dy
> > > +
> > > +# Driver interface for generic Linux wireless extensions
> > > +CONFIG_DRIVER_WEXT=3Dy
> > > +
> > > +# Driver interface for Linux drivers using the nl80211 kernel
> > > interface
> > > +CONFIG_DRIVER_NL80211=3Dy
> > > +
> > > +# Driver interface for FreeBSD net80211 layer (e.g., Atheros
> > > driver)
> > > +#CONFIG_DRIVER_BSD=3Dy
> > > +#CFLAGS +=3D -I/usr/local/include
> > > +#LIBS +=3D -L/usr/local/lib
> > > +#LIBS_p +=3D -L/usr/local/libBG
> > > +#LIBS_c +=3D -L/usr/local/lib
> > > +
> > > +# Driver interface for Windows NDIS
> > > +#CONFIG_DRIVER_NDIS=3Dy
> > > +#CFLAGS +=3D -I/usr/include/w32api/ddk
> > > +#LIBS +=3D -L/usr/local/lib
> > > +# For native build using mingw
> > > +#CONFIG_NATIVE_WINDOWS=3Dy
> > > +# Additional directories for cross-compilation on Linux host for
> > > mingw target
> > > +#CFLAGS +=3D -I/opt/mingw/mingw32/include/ddk
> > > +#LIBS +=3D -L/opt/mingw/mingw32/lib
> > > +#CC=3Dmingw32-gcc
> > > +# By default, driver_ndis uses WinPcap for low-level operations.
> > > This can be
> > > +# replaced with the following option which replaces WinPcap
> > > calls with NDISUIO.
> > > +# However, this requires that WZC is disabled (net stop wzcsvc)
> > > before starting
> > > +# wpa_supplicant.
> > > +# CONFIG_USE_NDISUIO=3Dy
> > > +
> > > +# Driver interface for development testing
> > > +#CONFIG_DRIVER_TEST=3Dy
> > > +
> > > +# Include client MLME (management frame processing) for test
> > > driver
> > > +# This can be used to test MLME operations in hostapd with the
> > > test interface.
> > > +# space.
> > > +#CONFIG_CLIENT_MLME=3Dy
> > > +
> > > +# Driver interface for wired Ethernet drivers
> > > +CONFIG_DRIVER_WIRED=3Dy
> > > +
> > > +# Driver interface for the Broadcom RoboSwitch family
> > > +#CONFIG_DRIVER_ROBOSWITCH=3Dy
> > > +
> > > +# Driver interface for no driver (e.g., WPS ER only)
> > > +#CONFIG_DRIVER_NONE=3Dy
> > > +
> > > +# Solaris libraries
> > > +#LIBS +=3D -lsocket -ldlpi -lnsl
> > > +#LIBS_c +=3D -lsocket
> > > +
> > > +# Enable IEEE 802.1X Supplicant (automatically included if any
> > > EAP method is
> > > +# included)
> > > +CONFIG_IEEE8021X_EAPOL=3Dy
> > > +
> > > +# EAP-MD5
> > > +CONFIG_EAP_MD5=3Dy
> > > +
> > > +# EAP-MSCHAPv2
> > > +CONFIG_EAP_MSCHAPV2=3Dy
> > > +
> > > +# EAP-TLS
> > > +CONFIG_EAP_TLS=3Dy
> > > +
> > > +# EAL-PEAP
> > > +CONFIG_EAP_PEAP=3Dy
> > > +
> > > +# EAP-TTLS
> > > +CONFIG_EAP_TTLS=3Dy
> > > +
> > > +# EAP-FAST
> > > +# Note: Default OpenSSL package does not include support for all
> > > the
> > > +# functionality needed for EAP-FAST. If EAP-FAST is enabled with
> > > OpenSSL,
> > > +# the OpenSSL library must be patched (openssl-0.9.8d-tls-
> > > extensions.patch)
> > > +# to add the needed functions.
> > > +#CONFIG_EAP_FAST=3Dy
> > > +
> > > +# EAP-GTC
> > > +CONFIG_EAP_GTC=3Dy
> > > +
> > > +# EAP-OTP
> > > +CONFIG_EAP_OTP=3Dy
> > > +
> > > +# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
> > > +#CONFIG_EAP_SIM=3Dy
> > > +
> > > +# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
> > > +#CONFIG_EAP_PSK=3Dy
> > > +
> > > +# EAP-PAX
> > > +#CONFIG_EAP_PAX=3Dy
> > > +
> > > +# LEAP
> > > +CONFIG_EAP_LEAP=3Dy
> > > +
> > > +# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
> > > +#CONFIG_EAP_AKA=3Dy
> > > +
> > > +# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
> > > +# This requires CONFIG_EAP_AKA to be enabled, too.
> > > +#CONFIG_EAP_AKA_PRIME=3Dy
> > > +
> > > +# Enable USIM simulator (Milenage) for EAP-AKA
> > > +#CONFIG_USIM_SIMULATOR=3Dy
> > > +
> > > +# EAP-SAKE
> > > +#CONFIG_EAP_SAKE=3Dy
> > > +
> > > +# EAP-GPSK
> > > +#CONFIG_EAP_GPSK=3Dy
> > > +# Include support for optional SHA256 cipher suite in EAP-GPSK
> > > +#CONFIG_EAP_GPSK_SHA256=3Dy
> > > +
> > > +# EAP-TNC and related Trusted Network Connect support
> > > (experimental)
> > > +#CONFIG_EAP_TNC=3Dy
> > > +
> > > +# Wi-Fi Protected Setup (WPS)
> > > +CONFIG_WPS=3Dy
> > > +# Enable WSC 2.0 support
> > > +CONFIG_WPS2=3Dy
> > > +
> > > +# EAP-IKEv2
> > > +#CONFIG_EAP_IKEV2=3Dy
> > > +
> > > +# PKCS#12 (PFX) support (used to read private key and
> > > certificate file from
> > > +# a file that usually has extension .p12 or .pfx)
> > > +CONFIG_PKCS12=3Dy
> > > +
> > > +# Smartcard support (i.e., private key on a smartcard), e.g.,
> > > with openssl
> > > +# engine.
> > > +CONFIG_SMARTCARD=3Dy
> > > +
> > > +# PC/SC interface for smartcards (USIM, GSM SIM)
> > > +# Enable this if EAP-SIM or EAP-AKA is included
> > > +#CONFIG_PCSC=3Dy
> > > +
> > > +# Development testingBG
> > > +#CONFIG_EAPOL_TEST=3Dy
> > > +
> > > +# Select control interface backend for external programs, e.g,
> > > wpa_cli:
> > > +# unix =3D UNIX domain sockets (default for Linux/*BSD)
> > > +# udp =3D UDP sockets using localhost (127.0.0.1)
> > > +# named_pipe =3D Windows Named Pipe (default for Windows)
> > > +# y =3D use default (backwards compatibility)
> > > +# If this option is commented out, control interface is not
> > > included in the
> > > +# build.
> > > +CONFIG_CTRL_IFACE=3Dy
> > > +
> > > +# Include support for GNU Readline and History Libraries in
> > > wpa_cli.
> > > +# When building a wpa_cli binary for distribution, please note
> > > that these
> > > +# libraries are licensed under GPL and as such, BSD license may
> > > not apply for
> > > +# the resulting binary.
> > > +#CONFIG_READLINE=3Dy
> > > +
> > > +# Remove debugging code that is printing out debug message to
> > > stdout.
> > > +# This can be used to reduce the size of the wpa_supplicant
> > > considerably
> > > +# if debugging code is not needed. The size reduction can be
> > > around 35%
> > > +# (e.g., 90 kB).
> > > +#CONFIG_NO_STDOUT_DEBUG=3Dy
> > > +
> > > +# Remove WPA support, e.g., for wired-only IEEE 802.1X
> > > supplicant, to save
> > > +# 35-50 kB in code size.
> > > +#CONFIG_NO_WPA=3Dy
> > > +
> > > +# Remove WPA2 support. This allows WPA to be used, but removes
> > > WPA2 code to
> > > +# save about 1 kB in code size when building only WPA-Personal
> > > (no EAP support)
> > > +# or 6 kB if building for WPA-Enterprise.
> > > +#CONFIG_NO_WPA2=3Dy
> > > +
> > > +# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
> > > +# This option can be used to reduce code size by removing
> > > support for
> > > +# converting ASCII passphrases into PSK. If this functionality
> > > is removed, the
> > > +# PSK can only be configured as the 64-octet hexstring (e.g.,
> > > from
> > > +# wpa_passphrase). This saves about 0.5 kB in code size.
> > > +#CONFIG_NO_WPA_PASSPHRASE=3Dy
> > > +
> > > +# Disable scan result processing (ap_mode=3D1) to save code size
> > > by about 1 kB.
> > > +# This can be used if ap_scan=3D1 mode is never enabled.
> > > +#CONFIG_NO_SCAN_PROCESSING=3Dy
> > > +
> > > +# Select configuration backend:
> > > +# file =3D text file (e.g., wpa_supplicant.conf; note: the
> > > configuration file
> > > +#	path is given on command line, not here; this option is
> > > just used to
> > > +#	select the backend that allows configuration files to be
> > > used)
> > > +# winreg =3D Windows registry (see win_example.reg for an example)
> > > +CONFIG_BACKEND=3Dfile
> > > +
> > > +# Remove configuration write functionality (i.e., to allow the
> > > configuration
> > > +# file to be updated based on runtime configuration changes).
> > > The runtime
> > > +# configuration can still be changed, the changes are just not
> > > going to be
> > > +# persistent over restarts. This option can be used to reduce
> > > code size by
> > > +# about 3.5 kB.
> > > +#CONFIG_NO_CONFIG_WRITE=3Dy
> > > +
> > > +# Remove support for configuration blobs to reduce code size by
> > > about 1.5 kB.
> > > +#CONFIG_NO_CONFIG_BLOBS=3Dy
> > > +
> > > +# Select program entry point implementation:
> > > +# main =3D UNIX/POSIX like main() function (default)
> > > +# main_winsvc =3D Windows service (read parameters from registry)
> > > +# main_none =3D Very basic example (development use only)
> > > +#CONFIG_MAIN=3Dmain
> > > +
> > > +# Select wrapper for operatins system and C library specific
> > > functions
> > > +# unix =3D UNIX/POSIX like systems (default)
> > > +# win32 =3D Windows systems
> > > +# none =3D Empty template
> > > +#CONFIG_OS=3Dunix
> > > +
> > > +# Select event loop implementation
> > > +# eloop =3D select() loop (default)
> > > +# eloop_win =3D Windows events and WaitForMultipleObject() loop
> > > +# eloop_none =3D Empty template
> > > +#CONFIG_ELOOP=3Deloop
> > > +
> > > +# Select layer 2 packet implementation
> > > +# linux =3D Linux packet socket (default)
> > > +# pcap =3D libpcap/libdnet/WinPcap
> > > +# freebsd =3D FreeBSD libpcap
> > > +# winpcap =3D WinPcap with receive thread
> > > +# ndis =3D Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=3Dy)
> > > +# none =3D Empty template
> > > +#CONFIG_L2_PACKET=3Dlinux
> > > +
> > > +# PeerKey handshake for Station to Station Link (IEEE 802.11e
> > > DLS)
> > > +CONFIG_PEERKEY=3Dy
> > > +
> > > +# IEEE 802.11w (management frame protection)
> > > +# This version is an experimental implementation based on IEEE
> > > 802.11w/D1.0
> > > +# draft and is subject to change since the standard has not yet
> > > been finalized.
> > > +# Driver support is also needed for IEEE 802.11w.
> > > +#CONFIG_IEEE80211W=3Dy
> > > +
> > > +# Select TLS implementation
> > > +# openssl =3D OpenSSL (default)
> > > +# gnutls =3D GnuTLS (needed for TLS/IA, see also
> > > CONFIG_GNUTLS_EXTRA)
> > > +# internal =3D Internal TLSv1 implementation (experimental)
> > > +# none =3D Empty template
> > > +#CONFIG_TLS=3Dopenssl
> > > +
> > > +# Whether to enable TLS/IA support, which is required for EAP-
> > > TTLSv1.
> > > +# You need CONFIG_TLS=3Dgnutls for this to have any effect. Please
> > > note that
> > > +# even though the core GnuTLS library is released under LGPL,
> > > this extra
> > > +# library uses GPL and as such, the terms of GPL apply to the
> > > combination
> > > +# of wpa_supplicant and GnuTLS if this option is enabled. BSD
> > > license may not
> > > +# apply for distribution of the resulting binary.
> > > +#CONFIG_GNUTLS_EXTRA=3Dy
> > > +
> > > +# If CONFIG_TLS=3Dinternal is used, additional library and include
> > > paths are
> > > +# needed for LibTomMath. Alternatively, an integrated, minimal
> > > version of
> > > +# LibTomMath can be used. See beginning of libtommath.c for
> > > details on benefits
> > > +# and drawbacks of this option.
> > > +#CONFIG_INTERNAL_LIBTOMMATH=3Dy
> > > +#ifndef CONFIG_INTERNAL_LIBTOMMATH
> > > +#LTM_PATH=3D/usr/src/libtommath-0.39
> > > +#CFLAGS +=3D -I$(LTM_PATH)
> > > +#LIBS +=3D -L$(LTM_PATH)
> > > +#LIBS_p +=3D -L$(LTM_PATH)
> > > +#endif
> > > +# At the cost of about 4 kB of additional binary size, the
> > > internal LibTomMath
> > > +# can be configured to include faster routines for exptmod, sqr,
> > > and div to
> > > +# speed up DH and RSA calculation considerably
> > > +#CONFIG_INTERNAL_LIBTOMMATH_FAST=3Dy
> > > +
> > > +# Include NDIS event processing through WMI into
> > > wpa_supplicant/wpasvc.
> > > +# This is only for Windows builds and requires WMI-related
> > > header files and
> > > +# WbemUuid.Lib from Platform SDK even when building with MinGW.
> > > +#CONFIG_NDIS_EVENTS_INTEGRATED=3Dy
> > > +#PLATFORMSDKLIB=3D"/opt/Program Files/Microsoft Platform SDK/Lib"
> > > +
> > > +# Add support for old DBus control interface
> > > +# (fi.epitest.hostap.WPASupplicant)
> > > +CONFIG_CTRL_IFACE_DBUS=3Dy
> > > +
> > > +# Add support for new DBus control interface
> > > +# (fi.w1.hostap.wpa_supplicant1)
> > > +CONFIG_CTRL_IFACE_DBUS_NEW=3Dy
> > > +
> > > +# Add introspection support for new DBus control interface
> > > +CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy
> > > +
> > > +# Add support for loading EAP methods dynamically as shared
> > > libraries.
> > > +# When this option is enabled, each EAP method can be either
> > > included
> > > +# statically (CONFIG_EAP_<method>=3Dy) or dynamically
> > > (CONFIG_EAP_<method>=3Ddyn).
> > > +# Dynamic EAP methods are build as shared objects (eap_*.so) and
> > > they need to
> > > +# be loaded in the beginning of the wpa_supplicant configuration
> > > file
> > > +# (see load_dynamic_eap parameter in the example file) before
> > > being used in
> > > +# the network blocks.
> > > +#
> > > +# Note that some shared parts of EAP methods are included in the
> > > main program
> > > +# and in order to be able to use dynamic EAP methods using these
> > > parts, the
> > > +# main program must have been build with the EAP method enabled
> > > (=3Dy or =3Ddyn).
> > > +# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as
> > > dynamic libraries
> > > +# unless at least one of them was included in the main build to
> > > force inclusion
> > > +# of the shared code. Similarly, at least one of EAP-SIM/AKA
> > > must be included
> > > +# in the main build to be able to load these methods
> > > dynamically.
> > > +#
> > > +# Please also note that using dynamic libraries will increase
> > > the total binary
> > > +# size. Thus, it may not be the best option for targets that
> > > have limited
> > > +# amount of memory/flash.
> > > +#CONFIG_DYNAMIC_EAP_METHODS=3Dy
> > > +
> > > +# IEEE Std 802.11r-2008 (Fast BSS Transition)
> > > +#CONFIG_IEEE80211R=3Dy
> > > +
> > > +# Add support for writing debug log to a file
> > > (/tmp/wpa_supplicant-log-#.txt)
> > > +CONFIG_DEBUG_FILE=3Dy
> > > +
> > > +# Enable privilege separation (see README 'Privilege separation'
> > > for details)
> > > +#CONFIG_PRIVSEP=3Dy
> > > +
> > > +# Enable mitigation against certain attacks against TKIP by
> > > delaying Michael
> > > +# MIC error reports by a random amount of time between 0 and 60
> > > seconds
> > > +#CONFIG_DELAYED_MIC_ERROR_REPORT=3Dy
> > > +
> > > +# Enable tracing code for developer debugging
> > > +# This tracks use of memory allocations and other registrations
> > > and reports
> > > +# incorrect use with a backtrace of call (or allocation)
> > > location.
> > > +#CONFIG_WPA_TRACE=3Dy
> > > +# For BSD, comment out these.
> > > +#LIBS +=3D -lexecinfo
> > > +#LIBS_p +=3D -lexecinfo
> > > +#LIBS_c +=3D -lexecinfo
> > > +
> > > +# Use libbfd to get more details for developer debugging
> > > +# This enables use of libbfd to get more detailed symbols for
> > > the backtraces
> > > +# generated by CONFIG_WPA_TRACE=3Dy.
> > > +#CONFIG_WPA_TRACE_BFD=3Dy
> > > +# For BSD, comment out these.
> > > +#LIBS +=3D -lbfd -liberty -lz
> > > +#LIBS_p +=3D -lbfd -liberty -lz
> > > +#LIBS_c +=3D -lbfd -liberty -lz
> > > +
> > > +# for p2p
> > > +CONFIG_P2P=3Dy
> > > +CONFIG_AP=3Dy
> > > +
> > > +# IEEE 802.11n (High Throughput) support
> > > +CONFIG_IEEE80211N=3Dy
> > > +
> > > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-
> > > wl18xx/fi.epitest.hostap.WPASupplicant.service b/meta-arago-
> > > extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > > wl18xx/fi.epitest.hostap.WPASupplicant.service
> > > new file mode 100644
> > > index 0000000..fb3f917
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > supplicant-wl18xx/fi.epitest.hostap.WPASupplicant.service
> > > @@ -0,0 +1,4 @@
> > > +[D-BUS Service]
> > > +Name=3Dfi.epitest.hostap.WPASupplicant
> > > +Exec=3D/usr/sbin/wpa_supplicant -d -Dnl80211 -
> > > c/etc/wpa_supplicant.conf -iwlan0 -B -u
> > > +User=3Droot
> > > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/fi.w1.wpa_supplicant1.service
> > > b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > supplicant-wl18xx/fi.w1.wpa_supplicant1.service
> > > new file mode 100644
> > > index 0000000..0bb1056
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > supplicant-wl18xx/fi.w1.wpa_supplicant1.service
> > > @@ -0,0 +1,4 @@
> > > +[D-BUS Service]
> > > +Name=3Dfi.w1.wpa_supplicant1
> > > +Exec=3D/usr/sbin/wpa_supplicant -d -Dnl80211 -
> > > c/etc/wpa_supplicant.conf -iwlan0 -B -u
> > > +User=3Droot
> > > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/kill_wpa_supplicant.sh b/meta-
> > > arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > > wl18xx/kill_wpa_supplicant.sh
> > > new file mode 100644
> > > index 0000000..aab6474
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > supplicant-wl18xx/kill_wpa_supplicant.sh
> > > @@ -0,0 +1,9 @@
> > > +#check if the wpa_suppicant is already running
> > > +#if it does, stop it.
> > > +StationRunning=3D`ps | grep -c wpa_supplicant`
> > > +if [ $StationRunning -eq 2 ]; then
> > > +        killall wpa_supplicant
> > > +fi
> > > +
> > > +# start the application
> > > +$*
> > > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/wpa-supplicant.sh b/meta-arago-
> > > extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > > wl18xx/wpa-supplicant.sh
> > > new file mode 100644
> > > index 0000000..4f1001e
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > supplicant-wl18xx/wpa-supplicant.sh
> > > @@ -0,0 +1,85 @@
> > > +#!/bin/sh
> > > +
> > > +
> > > +WPA_SUP_BIN=3D"/usr/sbin/wpa_supplicant"
> > > +WPA_SUP_PNAME=3D"wpa_supplicant"
> > > +WPA_SUP_PIDFILE=3D"/var/run/wpa_supplicant.$IFACE.pid"
> > > +WPA_SUP_OPTIONS=3D"-B -P $WPA_SUP_PIDFILE -i $IFACE"
> > > +
> > > +VERBOSITY=3D0
> > > +
> > > +
> > > +if [ -s "$IF_WPA_CONF" ]; then
> > > +	WPA_SUP_CONF=3D"-c $IF_WPA_CONF"
> > > +else
> > > +	exit 0
> > > +fi
> > > +
> > > +if [ ! -x "$WPA_SUP_BIN" ]; then
> > > +
> > > +	if [ "$VERBOSITY" =3D "1" ]; then
> > > +		echo "$WPA_SUP_PNAME: binaries not executable or
> > > missing from $WPA_SUP_BIN"
> > > +	fi
> > > +
> > > +	exit 1
> > > +fi
> > > +
> > > +if [ "$MODE" =3D "start" ] ; then
> > > +	# driver type of interface, defaults to wext when undefined
> > > +	if [ -s "/etc/wpa_supplicant/driver.$IFACE" ]; then
> > > +		IF_WPA_DRIVER=3D$(cat
> > > "/etc/wpa_supplicant/driver.$IFACE")
> > > +	elif [ -z "$IF_WPA_DRIVER" ]; then
> > > +
> > > +		if [ "$VERBOSITY" =3D "1" ]; then
> > > +			echo "$WPA_SUP_PNAME: wpa-driver not provided,
> > > using \"wext\""
> > > +		fi
> > > +
> > > +		IF_WPA_DRIVER=3D"wext"
> > > +	fi
> > > +
> > > +	# if we have passed the criteria, start wpa_supplicant
> > > +	if [ -n "$WPA_SUP_CONF" ]; then
> > > +
> > > +		if [ "$VERBOSITY" =3D "1" ]; then
> > > +			echo "$WPA_SUP_PNAME: $WPA_SUP_BIN
> > > $WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER"
> > > +		fi
> > > +
> > > +		start-stop-daemon --start --quiet \
> > > +			--name $WPA_SUP_PNAME --startas $WPA_SUP_BIN --
> > > pidfile $WPA_SUP_PIDFILE \
> > > +			--  $WPA_SUP_OPTIONS $WPA_SUP_CONF -D
> > > $IF_WPA_DRIVER
> > > +	fi
> > > +
> > > +	# if the interface socket exists, then wpa_supplicant was
> > > invoked successfully
> > > +	if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
> > > +
> > > +		if [ "$VERBOSITY" =3D "1" ]; then
> > > +			echo "$WPA_SUP_PNAME: ctrl_interface socket
> > > located at $WPA_COMMON_CTRL_IFACE/$IFACE"
> > > +		fi
> > > +
> > > +		exit 0
> > > +
> > > +	fi
> > > +
> > > +elif [ "$MODE" =3D "stop" ]; then
> > > +
> > > +	if [ -f "$WPA_SUP_PIDFILE" ]; then
> > > +
> > > +		if [ "$VERBOSITY" =3D "1" ]; then
> > > +			echo "$WPA_SUP_PNAME: terminating
> > > $WPA_SUP_PNAME daemon"
> > > +		fi
> > > +
> > > +		start-stop-daemon --stop --quiet \
> > > +			--name $WPA_SUP_PNAME --pidfile
> > > 	$WPA_SUP_PIDFILE
> > > +
> > > +		if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
> > > +			rm -f $WPA_COMMON_CTRL_IFACE/$IFACE
> > > +		fi
> > > +
> > > +		if [ -f "$WPA_SUP_PIDFILE" ]; then
> > > +			rm -f $WPA_SUP_PIDFILE
> > > +		fi
> > > +	fi
> > > +
> > > +fi
> > > +
> > > +exit 0
> > > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/wpa_supplicant.conf b/meta-
> > > arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > > wl18xx/wpa_supplicant.conf
> > > new file mode 100644
> > > index 0000000..f0c993d
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > supplicant-wl18xx/wpa_supplicant.conf
> > > @@ -0,0 +1,690 @@
> > > +##### Example wpa_supplicant configuration file
> > > ###############################
> > > +#
> > > +# This file describes configuration file format and lists all
> > > available option.
> > > +# Please also take a look at simpler configuration examples in
> > > 'examples'
> > > +# subdirectory.
> > > +#
> > > +# Empty lines and lines starting with # are ignored
> > > +
> > > +# NOTE! This file may contain password information and should
> > > probably be made
> > > +# readable only by root user on multiuser systems.
> > > +
> > > +# Note: All file paths in this configuration file should use
> > > full (absolute,
> > > +# not relative to working directory) path in order to allow
> > > working directory
> > > +# to be changed. This can happen if wpa_supplicant is run in the
> > > background.
> > > +
> > > +# Whether to allow wpa_supplicant to update (overwrite)
> > > configuration
> > > +#
> > > +# This option can be used to allow wpa_supplicant to overwrite
> > > configuration
> > > +# file whenever configuration is changed (e.g., new network
> > > block is added with
> > > +# wpa_cli or wpa_gui, or a password is changed). This is
> > > required for
> > > +# wpa_cli/wpa_gui to be able to store the configuration changes
> > > permanently.
> > > +# Please note that overwriting configuration file will remove
> > > the comments from
> > > +# it.
> > > +#update_config=3D1
> > > +
> > > +# global configuration (shared by all network blocks)
> > > +#
> > > +# Parameters for the control interface. If this is specified,
> > > wpa_supplicant
> > > +# will open a control interface that is available for external
> > > programs to
> > > +# manage wpa_supplicant. The meaning of this string depends on
> > > which control
> > > +# interface mechanism is used. For all cases, the existance of
> > > this parameter
> > > +# in configuration is used to determine whether the control
> > > interface is
> > > +# enabled.
> > > +#
> > > +# For UNIX domain sockets (default on Linux and BSD): This is a
> > > directory that
> > > +# will be created for UNIX domain sockets for listening to
> > > requests from
> > > +# external programs (CLI/GUI, etc.) for status information and
> > > configuration.
> > > +# The socket file will be named based on the interface name, so
> > > multiple
> > > +# wpa_supplicant processes can be run at the same time if more
> > > than one
> > > +# interface is used.
> > > +# /var/run/wpa_supplicant is the recommended directory for
> > > sockets and by
> > > +# default, wpa_cli will use it when trying to connect with
> > > wpa_supplicant.
> > > +#
> > > +# Access control for the control interface can be configured by
> > > setting the
> > > +# directory to allow only members of a group to use sockets.
> > > This way, it is
> > > +# possible to run wpa_supplicant as root (since it needs to
> > > change network
> > > +# configuration and open raw sockets) and still allow GUI/CLI
> > > components to be
> > > +# run as non-root users. However, since the control interface
> > > can be used to
> > > +# change the network configuration, this access needs to be
> > > protected in many
> > > +# cases. By default, wpa_supplicant is configured to use gid 0
> > > (root). If you
> > > +# want to allow non-root users to use the control interface, add
> > > a new group
> > > +# and change this value to match with that group. Add users that
> > > should have
> > > +# control interface access to this group. If this variable is
> > > commented out or
> > > +# not included in the configuration file, group will not be
> > > changed from the
> > > +# value it got by default when the directory or socket was
> > > created.
> > > +#
> > > +# When configuring both the directory and group, use following
> > > format:
> > > +# DIR=3D/var/run/wpa_supplicant GROUP=3Dwheel
> > > +# DIR=3D/var/run/wpa_supplicant GROUP=3D0
> > > +# (group can be either group name or gid)
> > > +#
> > > +# For UDP connections (default on Windows): The value will be
> > > ignored. This
> > > +# variable is just used to select that the control interface is
> > > to be created.
> > > +# The value can be set to, e.g., udp (ctrl_interface=3Dudp)
> > > +#
> > > +# For Windows Named Pipe: This value can be used to set the
> > > security descriptor
> > > +# for controlling access to the control interface. Security
> > > descriptor can be
> > > +# set using Security Descriptor String Format (see
> > > http://msdn.microsoft.com/
> > > +# library/default.asp?url=3D/library/en-us/secauthz/security/
> > > +# security_descriptor_string_format.asp). The descriptor string
> > > needs to be
> > > +# prefixed with SDDL=3D. For example, ctrl_interface=3DSDDL=3DD: wou=
ld
> > > set an empty
> > > +# DACL (which will reject all connections). See README-
> > > Windows.txt for more
> > > +# information about SDDL string format.
> > > +#
> > > +ctrl_interface=3D/var/run/wpa_supplicant
> > > +
> > > +# IEEE 802.1X/EAPOL version
> > > +# wpa_supplicant is implemented based on IEEE Std 802.1X-2004
> > > which defines
> > > +# EAPOL version 2. However, there are many APs that do not
> > > handle the new
> > > +# version number correctly (they seem to drop the frames
> > > completely). In order
> > > +# to make wpa_supplicant interoperate with these APs, the
> > > version number is set
> > > +# to 1 by default. This configuration value can be used to set
> > > it to the new
> > > +# version (2).
> > > +eapol_version=3D1
> > > +
> > > +# AP scanning/selection
> > > +# By default, wpa_supplicant requests driver to perform AP
> > > scanning and then
> > > +# uses the scan results to select a suitable AP. Another
> > > alternative is to
> > > +# allow the driver to take care of AP scanning and selection and
> > > use
> > > +# wpa_supplicant just to process EAPOL frames based on IEEE
> > > 802.11 association
> > > +# information from the driver.
> > > +# 1: wpa_supplicant initiates scanning and AP selection
> > > +# 0: driver takes care of scanning, AP selection, and IEEE
> > > 802.11 association
> > > +#    parameters (e.g., WPA IE generation); this mode can also be
> > > used with
> > > +#    non-WPA drivers when using IEEE 802.1X mode; do not try to
> > > associate with
> > > +#    APs (i.e., external program needs to control association).
> > > This mode must
> > > +#    also be used when using wired Ethernet drivers.
> > > +# 2: like 0, but associate with APs using security policy and
> > > SSID (but not
> > > +#    BSSID); this can be used, e.g., with ndiswrapper and NDIS
> > > drivers to
> > > +#    enable operation with hidden SSIDs and optimized roaming;
> > > in this mode,
> > > +#    the network blocks in the configuration file are tried one
> > > by one until
> > > +#    the driver reports successful association; each network
> > > block should have
> > > +#    explicit security policy (i.e., only one option in the
> > > lists) for
> > > +#    key_mgmt, pairwise, group, proto variables
> > > +ap_scan=3D1
> > > +
> > > +# EAP fast re-authentication
> > > +# By default, fast re-authentication is enabled for all EAP
> > > methods that
> > > +# support it. This variable can be used to disable fast re-
> > > authentication.
> > > +# Normally, there is no need to disable this.
> > > +fast_reauth=3D1
> > > +
> > > +# OpenSSL Engine support
> > > +# These options can be used to load OpenSSL engines.
> > > +# The two engines that are supported currently are shown below:
> > > +# They are both from the opensc project (http://www.opensc.org/)
> > > +# By default no engines are loaded.
> > > +# make the opensc engine available
> > > +#opensc_engine_path=3D/usr/lib/opensc/engine_opensc.so
> > > +# make the pkcs11 engine available
> > > +#pkcs11_engine_path=3D/usr/lib/opensc/engine_pkcs11.so
> > > +# configure the path to the pkcs11 module required by the pkcs11
> > > engine
> > > +#pkcs11_module_path=3D/usr/lib/pkcs11/opensc-pkcs11.so
> > > +
> > > +# Dynamic EAP methods
> > > +# If EAP methods were built dynamically as shared object files,
> > > they need to be
> > > +# loaded here before being used in the network blocks. By
> > > default, EAP methods
> > > +# are included statically in the build, so these lines are not
> > > needed
> > > +#load_dynamic_eap=3D/usr/lib/wpa_supplicant/eap_tls.so
> > > +#load_dynamic_eap=3D/usr/lib/wpa_supplicant/eap_md5.so
> > > +
> > > +# Driver interface parameters
> > > +# This field can be used to configure arbitrary driver interace
> > > parameters. The
> > > +# format is specific to the selected driver interface. This
> > > field is not used
> > > +# in most cases.
> > > +#driver_param=3D"field=3Dvalue"
> > > +
> > > +# Maximum lifetime for PMKSA in seconds; default 43200
> > > +#dot11RSNAConfigPMKLifetime=3D43200
> > > +# Threshold for reauthentication (percentage of PMK lifetime);
> > > default 70
> > > +#dot11RSNAConfigPMKReauthThreshold=3D70
> > > +# Timeout for security association negotiation in seconds;
> > > default 60
> > > +#dot11RSNAConfigSATimeout=3D60
> > > +
> > > +# network block
> > > +#
> > > +# Each network (usually AP's sharing the same SSID) is
> > > configured as a separate
> > > +# block in this configuration file. The network blocks are in
> > > preference order
> > > +# (the first match is used).
> > > +#
> > > +# network block fields:
> > > +#
> > > +# disabled:
> > > +#	0 =3D this network can be used (default)
> > > +#	1 =3D this network block is disabled (can be enabled through
> > > ctrl_iface,
> > > +#	    e.g., with wpa_cli or wpa_gui)
> > > +#
> > > +# id_str: Network identifier string for external scripts. This
> > > value is passed
> > > +#	to external action script through wpa_cli as WPA_ID_STR
> > > environment
> > > +#	variable to make it easier to do network specific
> > > configuration.
> > > +#
> > > +# ssid: SSID (mandatory); either as an ASCII string with double
> > > quotation or
> > > +#	as hex string; network name
> > > +#
> > > +# scan_ssid:
> > > +#	0 =3D do not scan this SSID with specific Probe Request
> > > frames (default)
> > > +#	1 =3D scan with SSID-specific Probe Request frames (this can
> > > be used to
> > > +#	    find APs that do not accept broadcast SSID or use
> > > multiple SSIDs;
> > > +#	    this will add latency to scanning, so enable this only
> > > when needed)
> > > +#
> > > +# bssid: BSSID (optional); if set, this network block is used
> > > only when
> > > +#	associating with the AP using the configured BSSID
> > > +#
> > > +# priority: priority group (integer)
> > > +# By default, all networks will get same priority group (0). If
> > > some of the
> > > +# networks are more desirable, this field can be used to change
> > > the order in
> > > +# which wpa_supplicant goes through the networks when selecting
> > > a BSS. The
> > > +# priority groups will be iterated in decreasing priority (i.e.,
> > > the larger the
> > > +# priority value, the sooner the network is matched against the
> > > scan results).
> > > +# Within each priority group, networks will be selected based on
> > > security
> > > +# policy, signal strength, etc.
> > > +# Please note that AP scanning with scan_ssid=3D1 and ap_scan=3D2
> > > mode are not
> > > +# using this priority to select the order for scanning. Instead,
> > > they try the
> > > +# networks in the order that used in the configuration file.
> > > +#
> > > +# mode: IEEE 802.11 operation mode
> > > +# 0 =3D infrastructure (Managed) mode, i.e., associate with an AP
> > > (default)
> > > +# 1 =3D IBSS (ad-hoc, peer-to-peer)
> > > +# Note: IBSS can only be used with key_mgmt NONE (plaintext and
> > > static WEP)
> > > +# and key_mgmt=3DWPA-NONE (fixed group key TKIP/CCMP). In
> > > addition, ap_scan has
> > > +# to be set to 2 for IBSS. WPA-None requires following network
> > > block options:
> > > +# proto=3DWPA, key_mgmt=3DWPA-NONE, pairwise=3DNONE, group=3DTKIP (o=
r
> > > CCMP, but not
> > > +# both), and psk must also be set.
> > > +#
> > > +# proto: list of accepted protocols
> > > +# WPA =3D WPA/IEEE 802.11i/D3.0
> > > +# RSN =3D WPA2/IEEE 802.11i (also WPA2 can be used as an alias for
> > > RSN)
> > > +# If not set, this defaults to: WPA RSN
> > > +#
> > > +# key_mgmt: list of accepted authenticated key management
> > > protocols
> > > +# WPA-PSK =3D WPA pre-shared key (this requires 'psk' field)
> > > +# WPA-EAP =3D WPA using EAP authentication (this can use an
> > > external
> > > +#	program, e.g., Xsupplicant, for IEEE 802.1X EAP
> > > Authentication
> > > +# IEEE8021X =3D IEEE 802.1X using EAP authentication and
> > > (optionally) dynamically
> > > +#	generated WEP keys
> > > +# NONE =3D WPA is not used; plaintext or static WEP could be used
> > > +# If not set, this defaults to: WPA-PSK WPA-EAP
> > > +#
> > > +# auth_alg: list of allowed IEEE 802.11 authentication
> > > algorithms
> > > +# OPEN =3D Open System authentication (required for WPA/WPA2)
> > > +# SHARED =3D Shared Key authentication (requires static WEP keys)
> > > +# LEAP =3D LEAP/Network EAP (only used with LEAP)
> > > +# If not set, automatic selection is used (Open System with LEAP
> > > enabled if
> > > +# LEAP is allowed as one of the EAP methods).
> > > +#
> > > +# pairwise: list of accepted pairwise (unicast) ciphers for WPA
> > > +# CCMP =3D AES in Counter mode with CBC-MAC [RFC 3610, IEEE
> > > 802.11i/D7.0]
> > > +# TKIP =3D Temporal Key Integrity Protocol [IEEE 802.11i/D7.0]
> > > +# NONE =3D Use only Group Keys (deprecated, should not be included
> > > if APs support
> > > +#	pairwise keys)
> > > +# If not set, this defaults to: CCMP TKIP
> > > +#
> > > +# group: list of accepted group (broadcast/multicast) ciphers
> > > for WPA
> > > +# CCMP =3D AES in Counter mode with CBC-MAC [RFC 3610, IEEE
> > > 802.11i/D7.0]
> > > +# TKIP =3D Temporal Key Integrity Protocol [IEEE 802.11i/D7.0]
> > > +# WEP104 =3D WEP (Wired Equivalent Privacy) with 104-bit key
> > > +# WEP40 =3D WEP (Wired Equivalent Privacy) with 40-bit key [IEEE
> > > 802.11]
> > > +# If not set, this defaults to: CCMP TKIP WEP104 WEP40
> > > +#
> > > +# psk: WPA preshared key; 256-bit pre-shared key
> > > +# The key used in WPA-PSK mode can be entered either as 64 hex-
> > > digits, i.e.,
> > > +# 32 bytes or as an ASCII passphrase (in which case, the real
> > > PSK will be
> > > +# generated using the passphrase and SSID). ASCII passphrase
> > > must be between
> > > +# 8 and 63 characters (inclusive).
> > > +# This field is not needed, if WPA-EAP is used.
> > > +# Note: Separate tool, wpa_passphrase, can be used to generate
> > > 256-bit keys
> > > +# from ASCII passphrase. This process uses lot of CPU and
> > > wpa_supplicant
> > > +# startup and reconfiguration time can be optimized by
> > > generating the PSK only
> > > +# only when the passphrase or SSID has actually changed.
> > > +#
> > > +# eapol_flags: IEEE 802.1X/EAPOL options (bit field)
> > > +# Dynamic WEP key required for non-WPA mode
> > > +# bit0 (1): require dynamically generated unicast WEP key
> > > +# bit1 (2): require dynamically generated broadcast WEP key
> > > +# 	(3 =3D require both keys; default)
> > > +# Note: When using wired authentication, eapol_flags must be set
> > > to 0 for the
> > > +# authentication to be completed successfully.
> > > +#
> > > +# proactive_key_caching:
> > > +# Enable/disable opportunistic PMKSA caching for WPA2.
> > > +# 0 =3D disabled (default)
> > > +# 1 =3D enabled
> > > +#
> > > +# wep_key0..3: Static WEP key (ASCII in double quotation, e.g.
> > > "abcde" or
> > > +# hex without quotation, e.g., 0102030405)
> > > +# wep_tx_keyidx: Default WEP key index (TX) (0..3)
> > > +#
> > > +# peerkey: Whether PeerKey negotiation for direct links (IEEE
> > > 802.11e DLS) is
> > > +# allowed. This is only used with RSN/WPA2.
> > > +# 0 =3D disabled (default)
> > > +# 1 =3D enabled
> > > +#peerkey=3D1
> > > +#
> > > +# Following fields are only used with internal EAP
> > > implementation.
> > > +# eap: space-separated list of accepted EAP methods
> > > +#	MD5 =3D EAP-MD5 (unsecure and does not generate keying
> > > material ->
> > > +#			cannot be used with WPA; to be used as a Phase
> > > 2 method
> > > +#			with EAP-PEAP or EAP-TTLS)
> > > +#       MSCHAPV2 =3D EAP-MSCHAPv2 (cannot be used separately with
> > > WPA; to be used
> > > +#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
> > > +#       OTP =3D EAP-OTP (cannot be used separately with WPA; to be
> > > used
> > > +#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
> > > +#       GTC =3D EAP-GTC (cannot be used separately with WPA; to be
> > > used
> > > +#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
> > > +#	TLS =3D EAP-TLS (client and server certificate)
> > > +#	PEAP =3D EAP-PEAP (with tunnelled EAP authentication)
> > > +#	TTLS =3D EAP-TTLS (with tunnelled EAP or
> > > PAP/CHAP/MSCHAP/MSCHAPV2
> > > +#			 authentication)
> > > +#	If not set, all compiled in methods are allowed.
> > > +#
> > > +# identity: Identity string for EAP
> > > +# anonymous_identity: Anonymous identity string for EAP (to be
> > > used as the
> > > +#	unencrypted identity with EAP types that support different
> > > tunnelled
> > > +#	identity, e.g., EAP-TTLS)
> > > +# password: Password string for EAP
> > > +# ca_cert: File path to CA certificate file (PEM/DER). This file
> > > can have one
> > > +#	or more trusted CA certificates. If ca_cert and ca_path are
> > > not
> > > +#	included, server certificate will not be verified. This is
> > > insecure and
> > > +#	a trusted CA certificate should always be configured when
> > > using
> > > +#	EAP-TLS/TTLS/PEAP. Full path should be used since working
> > > directory may
> > > +#	change when wpa_supplicant is run in the background.
> > > +#	On Windows, trusted CA certificates can be loaded from the
> > > system
> > > +#	certificate store by setting this to cert_store://<name>,
> > > e.g.,
> > > +#	ca_cert=3D"cert_store://CA" or ca_cert=3D"cert_store://ROOT".
> > > +#	Note that when running wpa_supplicant as an application,
> > > the user
> > > +#	certificate store (My user account) is used, whereas
> > > computer store
> > > +#	(Computer account) is used when running wpasvc as a
> > > service.
> > > +# ca_path: Directory path for CA certificate files (PEM). This
> > > path may
> > > +#	contain multiple CA certificates in OpenSSL format. Common
> > > use for this
> > > +#	is to point to system trusted CA list which is often
> > > installed into
> > > +#	directory like /etc/ssl/certs. If configured, these
> > > certificates are
> > > +#	added to the list of trusted CAs. ca_cert may also be
> > > included in that
> > > +#	case, but it is not required.
> > > +# client_cert: File path to client certificate file (PEM/DER)
> > > +#	Full path should be used since working directory may change
> > > when
> > > +#	wpa_supplicant is run in the background.
> > > +#	Alternatively, a named configuration blob can be used by
> > > setting this
> > > +#	to blob://<blob name>.
> > > +# private_key: File path to client private key file
> > > (PEM/DER/PFX)
> > > +#	When PKCS#12/PFX file (.p12/.pfx) is used, client_cert
> > > should be
> > > +#	commented out. Both the private key and certificate will be
> > > read from
> > > +#	the PKCS#12 file in this case. Full path should be used
> > > since working
> > > +#	directory may change when wpa_supplicant is run in the
> > > background.
> > > +#	Windows certificate store can be used by leaving
> > > client_cert out and
> > > +#	configuring private_key in one of the following formats:
> > > +#	cert://substring_to_match
> > > +#	hash://certificate_thumbprint_in_hex
> > > +#	for example:
> > > private_key=3D"hash://63093aa9c47f56ae88334c7b65a4"
> > > +#	Note that when running wpa_supplicant as an application,
> > > the user
> > > +#	certificate store (My user account) is used, whereas
> > > computer store
> > > +#	(Computer account) is used when running wpasvc as a
> > > service.
> > > +#	Alternatively, a named configuration blob can be used by
> > > setting this
> > > +#	to blob://<blob name>.
> > > +# private_key_passwd: Password for private key file (if left
> > > out, this will be
> > > +#	asked through control interface)
> > > +# dh_file: File path to DH/DSA parameters file (in PEM format)
> > > +#	This is an optional configuration file for setting
> > > parameters for an
> > > +#	ephemeral DH key exchange. In most cases, the default RSA
> > > +#	authentication does not use this configuration. However, it
> > > is possible
> > > +#	setup RSA to use ephemeral DH key exchange. In addition,
> > > ciphers with
> > > +#	DSA keys always use ephemeral DH keys. This can be used to
> > > achieve
> > > +#	forward secrecy. If the file is in DSA parameters format,
> > > it will be
> > > +#	automatically converted into DH params.
> > > +# subject_match: Substring to be matched against the subject of
> > > the
> > > +#	authentication server certificate. If this string is set,
> > > the server
> > > +#	sertificate is only accepted if it contains this string in
> > > the subject.
> > > +#	The subject string is in following format:
> > > +#	/C=3DUS/ST=3DCA/L=3DSan Francisco/CN=3DTest
> > > AS/emailAddress=3Das@example.com
> > > +# altsubject_match: Semicolon separated string of entries to be
> > > matched against
> > > +#	the alternative subject name of the authentication server
> > > certificate.
> > > +#	If this string is set, the server sertificate is only
> > > accepted if it
> > > +#	contains one of the entries in an alternative subject name
> > > extension.
> > > +#	altSubjectName string is in following format: TYPE:VALUE
> > > +#	Example: EMAIL:server@example.com
> > > +#	Example: DNS:server.example.com;DNS:server2.example.com
> > > +#	Following types are supported: EMAIL, DNS, URI
> > > +# phase1: Phase1 (outer authentication, i.e., TLS tunnel)
> > > parameters
> > > +#	(string with field-value pairs, e.g., "peapver=3D0" or
> > > +#	"peapver=3D1 peaplabel=3D1")
> > > +#	'peapver' can be used to force which PEAP version (0 or 1)
> > > is used.
> > > +#	'peaplabel=3D1' can be used to force new label, "client PEAP
> > > encryption",
> > > +#	to be used during key derivation when PEAPv1 or newer. Most
> > > existing
> > > +#	PEAPv1 implementation seem to be using the old label,
> > > "client EAP
> > > +#	encryption", and wpa_supplicant is now using that as the
> > > default value.
> > > +#	Some servers, e.g., Radiator, may require peaplabel=3D1
> > > configuration to
> > > +#	interoperate with PEAPv1; see eap_testing.txt for more
> > > details.
> > > +#	'peap_outer_success=3D0' can be used to terminate PEAP
> > > authentication on
> > > +#	tunneled EAP-Success. This is required with some RADIUS
> > > servers that
> > > +#	implement draft-josefsson-pppext-eap-tls-eap-05.txt (e.g.,
> > > +#	Lucent NavisRadius v4.4.0 with PEAP in "IETF Draft 5" mode)
> > > +#	include_tls_length=3D1 can be used to force wpa_supplicant to
> > > include
> > > +#	TLS Message Length field in all TLS messages even if they
> > > are not
> > > +#	fragmented.
> > > +#	sim_min_num_chal=3D3 can be used to configure EAP-SIM to
> > > require three
> > > +#	challenges (by default, it accepts 2 or 3)
> > > +# phase2: Phase2 (inner authentication with TLS tunnel)
> > > parameters
> > > +#	(string with field-value pairs, e.g., "auth=3DMSCHAPV2" for
> > > EAP-PEAP or
> > > +#	"autheap=3DMSCHAPV2 autheap=3DMD5" for EAP-TTLS)
> > > +# Following certificate/private key fields are used in inner
> > > Phase2
> > > +# authentication when using EAP-TTLS or EAP-PEAP.
> > > +# ca_cert2: File path to CA certificate file. This file can have
> > > one or more
> > > +#	trusted CA certificates. If ca_cert2 and ca_path2 are not
> > > included,
> > > +#	server certificate will not be verified. This is insecure
> > > and a trusted
> > > +#	CA certificate should always be configured.
> > > +# ca_path2: Directory path for CA certificate files (PEM)
> > > +# client_cert2: File path to client certificate file
> > > +# private_key2: File path to client private key file
> > > +# private_key2_passwd: Password for private key file
> > > +# dh_file2: File path to DH/DSA parameters file (in PEM format)
> > > +# subject_match2: Substring to be matched against the subject of
> > > the
> > > +#	authentication server certificate.
> > > +# altsubject_match2: Substring to be matched against the
> > > alternative subject
> > > +#	name of the authentication server certificate.
> > > +#
> > > +# fragment_size: Maximum EAP fragment size in bytes (default
> > > 1398).
> > > +#	This value limits the fragment size for EAP methods that
> > > support
> > > +#	fragmentation (e.g., EAP-TLS and EAP-PEAP). This value
> > > should be set
> > > +#	small enough to make the EAP messages fit in MTU of the
> > > network
> > > +#	interface used for EAPOL. The default value is suitable for
> > > most
> > > +#	cases.
> > > +#
> > > +# EAP-PSK variables:
> > > +# eappsk: 16-byte (128-bit, 32 hex digits) pre-shared key in hex
> > > format
> > > +# nai: user NAI
> > > +#
> > > +# EAP-PAX variables:
> > > +# eappsk: 16-byte (128-bit, 32 hex digits) pre-shared key in hex
> > > format
> > > +#
> > > +# EAP-SAKE variables:
> > > +# eappsk: 32-byte (256-bit, 64 hex digits) pre-shared key in hex
> > > format
> > > +#	(this is concatenation of Root-Secret-A and Root-Secret-B)
> > > +# nai: user NAI (PEERID)
> > > +#
> > > +# EAP-GPSK variables:
> > > +# eappsk: Pre-shared key in hex format (at least 128 bits, i.e.,
> > > 32 hex digits)
> > > +# nai: user NAI (ID_Client)
> > > +#
> > > +# EAP-FAST variables:
> > > +# pac_file: File path for the PAC entries. wpa_supplicant will
> > > need to be able
> > > +#	to create this file and write updates to it when PAC is
> > > being
> > > +#	provisioned or refreshed. Full path to the file should be
> > > used since
> > > +#	working directory may change when wpa_supplicant is run in
> > > the
> > > +#	background. Alternatively, a named configuration blob can
> > > be used by
> > > +#	setting this to blob://<blob name>
> > > +# phase1: fast_provisioning=3D1 option enables in-line
> > > provisioning of EAP-FAST
> > > +#	credentials (PAC)
> > > +#
> > > +# wpa_supplicant supports number of "EAP workarounds" to work
> > > around
> > > +# interoperability issues with incorrectly behaving
> > > authentication servers.
> > > +# These are enabled by default because some of the issues are
> > > present in large
> > > +# number of authentication servers. Strict EAP conformance mode
> > > can be
> > > +# configured by disabling workarounds with eap_workaround=3D0.
> > > +
> > > +# Example blocks:
> > > +
> > > +# Simple case: WPA-PSK, PSK as an ASCII passphrase, allow all
> > > valid ciphers
> > > +network=3D{
> > > +	ssid=3D"simple"
> > > +	psk=3D"very secret passphrase"
> > > +	priority=3D5
> > > +}
> > > +
> > > +# Same as previous, but request SSID-specific scanning (for APs
> > > that reject
> > > +# broadcast SSID)
> > > +network=3D{
> > > +	ssid=3D"second ssid"
> > > +	scan_ssid=3D1
> > > +	psk=3D"very secret passphrase"
> > > +	priority=3D2
> > > +}
> > > +
> > > +# Only WPA-PSK is used. Any valid cipher combination is
> > > accepted.
> > > +network=3D{
> > > +	ssid=3D"example"
> > > +	proto=3DWPA
> > > +	key_mgmt=3DWPA-PSK
> > > +	pairwise=3DCCMP TKIP
> > > +	group=3DCCMP TKIP WEP104 WEP40
> > > +
> > > 	psk=3D06b4be19da289f475aa46a33cb793029d4ab3db7a23ee92382eb010
> > > 6c72ac7bb
> > > +	priority=3D2
> > > +}
> > > +
> > > +# Only WPA-EAP is used. Both CCMP and TKIP is accepted. An AP
> > > that used WEP104
> > > +# or WEP40 as the group cipher will not be accepted.
> > > +network=3D{
> > > +	ssid=3D"example"
> > > +	proto=3DRSN
> > > +	key_mgmt=3DWPA-EAP
> > > +	pairwise=3DCCMP TKIP
> > > +	group=3DCCMP TKIP
> > > +	eap=3DTLS
> > > +	identity=3D"user@example.com"
> > > +	ca_cert=3D"/etc/cert/ca.pem"
> > > +	client_cert=3D"/etc/cert/user.pem"
> > > +	private_key=3D"/etc/cert/user.prv"
> > > +	private_key_passwd=3D"password"
> > > +	priority=3D1
> > > +}
> > > +
> > > +# EAP-PEAP/MSCHAPv2 configuration for RADIUS servers that use
> > > the new peaplabel
> > > +# (e.g., Radiator)
> > > +network=3D{
> > > +	ssid=3D"example"
> > > +	key_mgmt=3DWPA-EAP
> > > +	eap=3DPEAP
> > > +	identity=3D"user@example.com"
> > > +	password=3D"foobar"
> > > +	ca_cert=3D"/etc/cert/ca.pem"
> > > +	phase1=3D"peaplabel=3D1"
> > > +	phase2=3D"auth=3DMSCHAPV2"
> > > +	priority=3D10
> > > +}
> > > +
> > > +# EAP-TTLS/EAP-MD5-Challenge configuration with anonymous
> > > identity for the
> > > +# unencrypted use. Real identity is sent only within an
> > > encrypted TLS tunnel.
> > > +network=3D{
> > > +	ssid=3D"example"
> > > +	key_mgmt=3DWPA-EAP
> > > +	eap=3DTTLS
> > > +	identity=3D"user@example.com"
> > > +	anonymous_identity=3D"anonymous@example.com"
> > > +	password=3D"foobar"
> > > +	ca_cert=3D"/etc/cert/ca.pem"
> > > +	priority=3D2
> > > +}
> > > +
> > > +# EAP-TTLS/MSCHAPv2 configuration with anonymous identity for
> > > the unencrypted
> > > +# use. Real identity is sent only within an encrypted TLS
> > > tunnel.
> > > +network=3D{
> > > +	ssid=3D"example"
> > > +	key_mgmt=3DWPA-EAP
> > > +	eap=3DTTLS
> > > +	identity=3D"user@example.com"
> > > +	anonymous_identity=3D"anonymous@example.com"
> > > +	password=3D"foobar"
> > > +	ca_cert=3D"/etc/cert/ca.pem"
> > > +	phase2=3D"auth=3DMSCHAPV2"
> > > +}
> > > +
> > > +# WPA-EAP, EAP-TTLS with different CA certificate used for outer
> > > and inner
> > > +# authentication.
> > > +network=3D{
> > > +	ssid=3D"example"
> > > +	key_mgmt=3DWPA-EAP
> > > +	eap=3DTTLS
> > > +	# Phase1 / outer authentication
> > > +	anonymous_identity=3D"anonymous@example.com"
> > > +	ca_cert=3D"/etc/cert/ca.pem"
> > > +	# Phase 2 / inner authentication
> > > +	phase2=3D"autheap=3DTLS"
> > > +	ca_cert2=3D"/etc/cert/ca2.pem"
> > > +	client_cert2=3D"/etc/cer/user.pem"
> > > +	private_key2=3D"/etc/cer/user.prv"
> > > +	private_key2_passwd=3D"password"
> > > +	priority=3D2
> > > +}
> > > +
> > > +# Both WPA-PSK and WPA-EAP is accepted. Only CCMP is accepted as
> > > pairwise and
> > > +# group cipher.
> > > +network=3D{
> > > +	ssid=3D"example"
> > > +	bssid=3D00:11:22:33:44:55
> > > +	proto=3DWPA RSN
> > > +	key_mgmt=3DWPA-PSK WPA-EAP
> > > +	pairwise=3DCCMP
> > > +	group=3DCCMP
> > > +
> > > 	psk=3D06b4be19da289f475aa46a33cb793029d4ab3db7a23ee92382eb010
> > > 6c72ac7bb
> > > +}
> > > +
> > > +# Special characters in SSID, so use hex string. Default to WPA-
> > > PSK, WPA-EAP
> > > +# and all valid ciphers.
> > > +network=3D{
> > > +	ssid=3D00010203
> > > +
> > > 	psk=3D000102030405060708090a0b0c0d0e0f101112131415161718191a1
> > > b1c1d1e1f
> > > +}
> > > +
> > > +
> > > +# IEEE 802.1X/EAPOL with dynamically generated WEP keys (i.e.,
> > > no WPA) using
> > > +# EAP-TLS for authentication and key generation; require both
> > > unicast and
> > > +# broadcast WEP keys.
> > > +network=3D{
> > > +	ssid=3D"1x-test"
> > > +	key_mgmt=3DIEEE8021X
> > > +	eap=3DTLS
> > > +	identity=3D"user@example.com"
> > > +	ca_cert=3D"/etc/cert/ca.pem"
> > > +	client_cert=3D"/etc/cert/user.pem"
> > > +	private_key=3D"/etc/cert/user.prv"
> > > +	private_key_passwd=3D"password"
> > > +	eapol_flags=3D3
> > > +}
> > > +
> > > +
> > > +# LEAP with dynamic WEP keys
> > > +network=3D{
> > > +	ssid=3D"leap-example"
> > > +	key_mgmt=3DIEEE8021X
> > > +	eap=3DLEAP
> > > +	identity=3D"user"
> > > +	password=3D"foobar"
> > > +}
> > > +
> > > +# Plaintext connection (no WPA, no IEEE 802.1X)
> > > +network=3D{
> > > +	ssid=3D"plaintext-test"
> > > +	key_mgmt=3DNONE
> > > +}
> > > +
> > > +
> > > +# Shared WEP key connection (no WPA, no IEEE 802.1X)
> > > +network=3D{
> > > +	ssid=3D"static-wep-test"
> > > +	key_mgmt=3DNONE
> > > +	wep_key0=3D"abcde"
> > > +	wep_key1=3D0102030405
> > > +	wep_key2=3D"1234567890123"
> > > +	wep_tx_keyidx=3D0
> > > +	priority=3D5
> > > +}
> > > +
> > > +
> > > +# Shared WEP key connection (no WPA, no IEEE 802.1X) using
> > > Shared Key
> > > +# IEEE 802.11 authentication
> > > +network=3D{
> > > +	ssid=3D"static-wep-test2"
> > > +	key_mgmt=3DNONE
> > > +	wep_key0=3D"abcde"
> > > +	wep_key1=3D0102030405
> > > +	wep_key2=3D"1234567890123"
> > > +	wep_tx_keyidx=3D0
> > > +	priority=3D5
> > > +	auth_alg=3DSHARED
> > > +}
> > > +
> > > +
> > > +# IBSS/ad-hoc network with WPA-None/TKIP.
> > > +network=3D{
> > > +	ssid=3D"test adhoc"
> > > +	mode=3D1
> > > +	proto=3DWPA
> > > +	key_mgmt=3DWPA-NONE
> > > +	pairwise=3DNONE
> > > +	group=3DTKIP
> > > +	psk=3D"secret passphrase"
> > > +}
> > > +
> > > +
> > > +# Catch all example that allows more or less all configuration
> > > modes
> > > +network=3D{
> > > +	ssid=3D"example"
> > > +	scan_ssid=3D1
> > > +	key_mgmt=3DWPA-EAP WPA-PSK IEEE8021X NONE
> > > +	pairwise=3DCCMP TKIP
> > > +	group=3DCCMP TKIP WEP104 WEP40
> > > +	psk=3D"very secret passphrase"
> > > +	eap=3DTTLS PEAP TLS
> > > +	identity=3D"user@example.com"
> > > +	password=3D"foobar"
> > > +	ca_cert=3D"/etc/cert/ca.pem"
> > > +	client_cert=3D"/etc/cert/user.pem"
> > > +	private_key=3D"/etc/cert/user.prv"
> > > +	private_key_passwd=3D"password"
> > > +	phase1=3D"peaplabel=3D0"
> > > +}
> > > +
> > > +# Example of EAP-TLS with smartcard (openssl engine)
> > > +network=3D{
> > > +	ssid=3D"example"
> > > +	key_mgmt=3DWPA-EAP
> > > +	eap=3DTLS
> > > +	proto=3DRSN
> > > +	pairwise=3DCCMP TKIP
> > > +	group=3DCCMP TKIP
> > > +	identity=3D"user@example.com"
> > > +	ca_cert=3D"/etc/cert/ca.pem"
> > > +	client_cert=3D"/etc/cert/user.pem"
> > > +
> > > +	engine=3D1
> > > +
> > > +	# The engine configured here must be available. Look at
> > > +	# OpenSSL engine support in the global section.
> > > +	# The key available through the engine must be the private
> > > key
> > > +	# matching the client certificate configured above.
> > > +
> > > +	# use the opensc engine
> > > +	#engine_id=3D"opensc"
> > > +	#key_id=3D"45"
> > > +
> > > +	# use the pkcs11 engine
> > > +	engine_id=3D"pkcs11"
> > > +	key_id=3D"id_45"
> > > +
> > > +	# Optional PIN configuration; this can be left out and PIN
> > > will be
> > > +	# asked through the control interface
> > > +	pin=3D"1234"
> > > +}
> > > +
> > > +# Example configuration showing how to use an inlined blob as a
> > > CA certificate
> > > +# data instead of using external file
> > > +network=3D{
> > > +	ssid=3D"example"
> > > +	key_mgmt=3DWPA-EAP
> > > +	eap=3DTTLS
> > > +	identity=3D"user@example.com"
> > > +	anonymous_identity=3D"anonymous@example.com"
> > > +	password=3D"foobar"
> > > +	ca_cert=3D"blob://exampleblob"
> > > +	priority=3D20
> > > +}
> > > +
> > > +blob-base64-exampleblob=3D{
> > > +SGVsbG8gV29ybGQhCg=3D=3D
> > > +}
> > > +
> > > +
> > > +# Wildcard match for SSID (plaintext APs only). This example
> > > select any
> > > +# open AP regardless of its SSID.
> > > +network=3D{
> > > +	key_mgmt=3DNONE
> > > +}
> > > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx/wpa_supplicant.conf-sane b/meta-
> > > arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > > wl18xx/wpa_supplicant.conf-sane
> > > new file mode 100644
> > > index 0000000..c91ffe0
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > supplicant-wl18xx/wpa_supplicant.conf-sane
> > > @@ -0,0 +1,7 @@
> > > +ctrl_interface=3D/var/run/wpa_supplicant
> > > +ctrl_interface_group=3D0
> > > +update_config=3D1
> > > +
> > > +network=3D{
> > > +        key_mgmt=3DNONE
> > > +}
> > > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > supplicant/wpa-supplicant-wl18xx_git.bb b/meta-arago-
> > > extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > > wl18xx_git.bb
> > > new file mode 100644
> > > index 0000000..65be767
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > supplicant-wl18xx_git.bb
> > > @@ -0,0 +1,23 @@
> > > +# This is a TI specific version of the wpa-supplicant recipe for
> > > use with the
> > > +# wl18xx wlan module.
> > > +
> > > +require wpa-supplicant.inc
> >
> > I'm not sure where this file is coming from.  Maybe something in
> Franklin's
> > tree?
>=20
> If it's not in the main meta-arago tree or oe-core, then you would need
> to add
> it to the patch series. If the file is pending submission from
> Franklin, then
> you need to specify the dependency. If this series is meant for
> Franklin's
> tree only, then we need to have a serious discussion... :)
>=20
>=20

Yes I guess it is dependent on a set of patches Franklin is about to send A=
s it did use his branch.
I was not aware it was not submitted yet.
Franklin, Are you sending this patch set soon?

> > > +LICENSE =3D "GPLv2 | BSD"
> > > +LIC_FILES_CHKSUM =3D
> > > "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e \
> > > +
> > > file://../README;md5=3D5cb758942d25f6f61fd4ac388fd446fa \
> > > +
> > > file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=3D8835156c8ab8=
ca
> > > d6356ec7f39ebe3aba"
> > > +
> > > +# To prevent users from accidently picking up this customized
> > > version of
> > > +# wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
> > > +DEFAULT_PREFERENCE =3D "-1"
> > > +
> > > +SRCREV =3D "ol_r8.a6.01"
> > > +PR =3D "r3+gitr${SRCREV}"
> > > +# Add ti to the PV to indicate that this is a TI modify version
> > > of wpa-supplicant.
> > > +PV =3D "2.0-devel-ti"
> > > +
> > > +PROVIDES_${PN}+=3D "wpa-supplicant"
> > > +RPROVIDES_${PN} +=3D "wpa-supplicant"
> > > +RRECOMMENDS_${PN} =3D "wpa-supplicant"
> >
> > Why would you RRECOMMENDS wpa-supplicant.  Wouldn't this give you the
> wl6
> > version?
> >
> > > +RDEPENDS_${PN} =3D "wpa-supplicant-cli wpa-supplicant-passphrase"
> >
> > This seems likely to hurt you as well.
>=20
> --
> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

Best Regards,
Eyal

