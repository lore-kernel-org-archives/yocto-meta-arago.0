Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 34A6652986
	for <meta-arago@arago-project.org>;
	Sat, 30 Nov 2013 17:28:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAUHS7NP017227
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:28:07 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAUHS7Du010762
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:28:07 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Sat, 30 Nov 2013 11:28:07 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 01/14] wpa-supplicant-wl18xx: Update
	recipe to	ol_r8.a8.08 version.
Thread-Index: AQHO7C3SB3ZH2auipUK8FoPdZ9E7PJo+CSxA
Date: Sat, 30 Nov 2013 17:28:06 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C8368@DFLE08.ent.ti.com>
References: <1385638346-11618-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385638346-11618-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 01/14] wpa-supplicant-wl18xx: Update recipe to	ol_r8.a8.08 version.
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
X-List-Received-Date: Sat, 30 Nov 2013 17:28:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I was initial confused why the below was needed but looking at the wpa-supp=
licant-2.0.inc I see that the same was done.
echo "CFLAGS +=3D -I${STAGING_INCDIR}/libnl3/" >> .config

As long as there are no spacing issues this patch looks good to me
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Thursday, November 28, 2013 5:32 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 01/14] wpa-supplicant-wl18xx: Update recipe =
to
> ol_r8.a8.08 version.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Build wpa-supplicant from TI_Openlink ol_r8.a8.08
> - Add missing includes for building with libnl3.
> - Adjusted configuration files, and added p2p conf.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../wpa-supplicant/wpa-supplicant-wl18xx/defconfig |  164 ++++--
>  ....a6.01.bb =3D> wpa-supplicant-wl18xx_r8.a8.08.bb} |    6 +-
>  .../wpa-supplicant/wpa-supplicant.inc              |    3 +
>  .../wpa-supplicant/p2p_supplicant.conf             |   14 +
>  .../wpa-supplicant/wpa_supplicant.conf             |  674 +-------------=
------
>  5 files changed, 164 insertions(+), 697 deletions(-)  copy meta-arago-
> extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-
> wl18xx_r8.a6.01.bb =3D> wpa-supplicant-wl18xx_r8.a8.08.bb} (89%)  create
> mode 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/p2p_supplicant.conf
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx/defconfig b/meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant-wl18xx/defconfig
> index b982e2a..f357b79 100755
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t-
> wl18xx/defconfig
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt-wl18xx/defconfig
> @@ -39,18 +39,6 @@
>  #LIBS =3D -lssl
>=20
> #############################################################
> ##################
>=20
> -#CC=3D$(CROSS_COMPILE)gcc
> -#CFLAGS +=3D -DCONFIG_LIBNL20
> -#CPPFLAGS +=3D -DCONFIG_LIBNL20
> -#LIBS +=3D -L$(NFSROOT)/lib -lnl
> -#LIBS_p +=3D -L$(NFSROOT)/lib
> -#LIBDIR =3D $(NFSROOT)/lib
> -#BINDIR =3D $(NFSROOT)/usr/sbin
> -
> -CONFIG_WAPI=3Dy
> -CONFIG_LIBNL20=3Dy
> -NEED_BGSCAN=3Dy
> -CONFIG_BGSCAN_LEARN=3Dy
>=20
>  # Driver interface for Host AP driver
>  #CONFIG_DRIVER_HOSTAP=3Dy
> @@ -75,7 +63,7 @@ CONFIG_BGSCAN_LEARN=3Dy
>  #CONFIG_DRIVER_ATMEL=3Dy
>=20
>  # Driver interface for old Broadcom driver -# Please note that the newer
> Broadcom driver ("hybrid Linux driver") supportsBG
> +# Please note that the newer Broadcom driver ("hybrid Linux driver")
> +supports
>  # Linux wireless extensions and does not need (or even work) with the ol=
d  #
> driver wrapper. Use CONFIG_DRIVER_WEXT=3Dy with that driver.
>  #CONFIG_DRIVER_BROADCOM=3Dy
> @@ -90,16 +78,22 @@ CONFIG_BGSCAN_LEARN=3Dy
> #CONFIG_DRIVER_RALINK=3Dy
>=20
>  # Driver interface for generic Linux wireless extensions -
> CONFIG_DRIVER_WEXT=3Dy
> +# Note: WEXT is deprecated in the current Linux kernel version and no
> +new # functionality is added to it. nl80211-based interface is the new
> +# replacement for WEXT and its use allows wpa_supplicant to properly
> +control # the driver to improve existing functionality like roaming and
> +to support new # functionality.
> +#CONFIG_DRIVER_WEXT=3Dy
>=20
>  # Driver interface for Linux drivers using the nl80211 kernel interface
> CONFIG_DRIVER_NL80211=3Dy
> +CONFIG_LIBNL32=3Dy
>=20
>  # Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
> #CONFIG_DRIVER_BSD=3Dy  #CFLAGS +=3D -I/usr/local/include  #LIBS +=3D -
> L/usr/local/lib -#LIBS_p +=3D -L/usr/local/libBG
> +#LIBS_p +=3D -L/usr/local/lib
>  #LIBS_c +=3D -L/usr/local/lib
>=20
>  # Driver interface for Windows NDIS
> @@ -121,13 +115,8 @@ CONFIG_DRIVER_NL80211=3Dy  # Driver interface for
> development testing  #CONFIG_DRIVER_TEST=3Dy
>=20
> -# Include client MLME (management frame processing) for test driver -# T=
his
> can be used to test MLME operations in hostapd with the test interface.
> -# space.
> -#CONFIG_CLIENT_MLME=3Dy
> -
>  # Driver interface for wired Ethernet drivers -CONFIG_DRIVER_WIRED=3Dy
> +#CONFIG_DRIVER_WIRED=3Dy
>=20
>  # Driver interface for the Broadcom RoboSwitch family
> #CONFIG_DRIVER_ROBOSWITCH=3Dy @@ -163,7 +152,7 @@
> CONFIG_EAP_TTLS=3Dy  # functionality needed for EAP-FAST. If EAP-FAST is
> enabled with OpenSSL,  # the OpenSSL library must be patched (openssl-0.9=
.8d-
> tls-extensions.patch)
>  # to add the needed functions.
> -#CONFIG_EAP_FAST=3Dy
> +CONFIG_EAP_FAST=3Dy
>=20
>  # EAP-GTC
>  CONFIG_EAP_GTC=3Dy
> @@ -172,11 +161,14 @@ CONFIG_EAP_GTC=3Dy
>  CONFIG_EAP_OTP=3Dy
>=20
>  # EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used) -#CONFIG_EAP_SIM=3Dy
> +CONFIG_EAP_SIM=3Dy
>=20
>  # EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
> #CONFIG_EAP_PSK=3Dy
>=20
> +# EAP-pwd (secure authentication using only a password)
> +CONFIG_EAP_PWD=3Dy
> +
>  # EAP-PAX
>  #CONFIG_EAP_PAX=3Dy
>=20
> @@ -208,6 +200,11 @@ CONFIG_EAP_LEAP=3Dy
>  CONFIG_WPS=3Dy
>  # Enable WSC 2.0 support
>  CONFIG_WPS2=3Dy
> +# Enable WPS external registrar functionality #CONFIG_WPS_ER=3Dy #
> +Disable credentials for an open network by default when acting as a WPS
> +# registrar.
> +#CONFIG_WPS_REG_DISABLE_OPEN=3Dy
>=20
>  # EAP-IKEv2
>  #CONFIG_EAP_IKEV2=3Dy
> @@ -224,7 +221,10 @@ CONFIG_SMARTCARD=3Dy
>  # Enable this if EAP-SIM or EAP-AKA is included  #CONFIG_PCSC=3Dy
>=20
> -# Development testingBG
> +# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
> +#CONFIG_HT_OVERRIDES=3Dy
> +
> +# Development testing
>  #CONFIG_EAPOL_TEST=3Dy
>=20
>  # Select control interface backend for external programs, e.g, wpa_cli:
> @@ -242,6 +242,10 @@ CONFIG_CTRL_IFACE=3Dy  # the resulting binary.
>  #CONFIG_READLINE=3Dy
>=20
> +# Include internal line edit mode in wpa_cli. This can be used as a
> +replacement # for GNU Readline to provide limited command line editing a=
nd
> history support.
> +CONFIG_WPA_CLI_EDIT=3Dy
> +
>  # Remove debugging code that is printing out debug message to stdout.
>  # This can be used to reduce the size of the wpa_supplicant considerably=
  # if
> debugging code is not needed. The size reduction can be around 35% @@ -
> 295,13 +299,16 @@ CONFIG_BACKEND=3Dfile  # unix =3D UNIX/POSIX like syste=
ms
> (default)  # win32 =3D Windows systems  # none =3D Empty template -
> #CONFIG_OS=3Dunix
> +CONFIG_OS=3Dunix
>=20
>  # Select event loop implementation
>  # eloop =3D select() loop (default)
>  # eloop_win =3D Windows events and WaitForMultipleObject() loop  #
> eloop_none =3D Empty template -#CONFIG_ELOOP=3Deloop
> +CONFIG_ELOOP=3Deloop
> +
> +# Should we use poll instead of select? Select is used by default.
> +#CONFIG_ELOOP_POLL=3Dy
>=20
>  # Select layer 2 packet implementation
>  # linux =3D Linux packet socket (default) @@ -310,7 +317,7 @@
> CONFIG_BACKEND=3Dfile  # winpcap =3D WinPcap with receive thread  # ndis =
=3D
> Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=3Dy)  # none =3D Empty
> template -#CONFIG_L2_PACKET=3Dlinux
> +CONFIG_L2_PACKET=3Dlinux
>=20
>  # PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
> CONFIG_PEERKEY=3Dy @@ -323,18 +330,24 @@ CONFIG_PEERKEY=3Dy
>=20
>  # Select TLS implementation
>  # openssl =3D OpenSSL (default)
> -# gnutls =3D GnuTLS (needed for TLS/IA, see also CONFIG_GNUTLS_EXTRA)
> +# gnutls =3D GnuTLS
>  # internal =3D Internal TLSv1 implementation (experimental)  # none =3D =
Empty
> template  #CONFIG_TLS=3Dopenssl
>=20
> -# Whether to enable TLS/IA support, which is required for EAP-TTLSv1.
> -# You need CONFIG_TLS=3Dgnutls for this to have any effect. Please note =
that -#
> even though the core GnuTLS library is released under LGPL, this extra -#=
 library
> uses GPL and as such, the terms of GPL apply to the combination -# of
> wpa_supplicant and GnuTLS if this option is enabled. BSD license may not =
-#
> apply for distribution of the resulting binary.
> -#CONFIG_GNUTLS_EXTRA=3Dy
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
>=20
>  # If CONFIG_TLS=3Dinternal is used, additional library and include paths=
 are  #
> needed for LibTomMath. Alternatively, an integrated, minimal version of @=
@ -
> 360,14 +373,14 @@ CONFIG_PEERKEY=3Dy
>=20
>  # Add support for old DBus control interface  #
> (fi.epitest.hostap.WPASupplicant) -CONFIG_CTRL_IFACE_DBUS=3Dy
> +#CONFIG_CTRL_IFACE_DBUS=3Dy
>=20
>  # Add support for new DBus control interface  #
> (fi.w1.hostap.wpa_supplicant1) -CONFIG_CTRL_IFACE_DBUS_NEW=3Dy
> +#CONFIG_CTRL_IFACE_DBUS_NEW=3Dy
>=20
>  # Add introspection support for new DBus control interface -
> CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy
> +#CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy
>=20
>  # Add support for loading EAP methods dynamically as shared libraries.
>  # When this option is enabled, each EAP method can be either included @@=
 -
> 394,7 +407,22 @@ CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy
> #CONFIG_IEEE80211R=3Dy
>=20
>  # Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#=
.txt) -
> CONFIG_DEBUG_FILE=3Dy
> +#CONFIG_DEBUG_FILE=3Dy
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
> +standard # output CONFIG_ANDROID_LOG=3Dy
>=20
>  # Enable privilege separation (see README 'Privilege separation' for det=
ails)
> #CONFIG_PRIVSEP=3Dy @@ -407,7 +435,7 @@ CONFIG_DEBUG_FILE=3Dy  # This
> tracks use of memory allocations and other registrations and reports  # i=
ncorrect
> use with a backtrace of call (or allocation) location.
>  #CONFIG_WPA_TRACE=3Dy
> -# For BSD, comment out these.
> +# For BSD, uncomment these.
>  #LIBS +=3D -lexecinfo
>  #LIBS_p +=3D -lexecinfo
>  #LIBS_c +=3D -lexecinfo
> @@ -416,15 +444,63 @@ CONFIG_DEBUG_FILE=3Dy  # This enables use of libbfd
> to get more detailed symbols for the backtraces  # generated by
> CONFIG_WPA_TRACE=3Dy.
>  #CONFIG_WPA_TRACE_BFD=3Dy
> -# For BSD, comment out these.
> +# For BSD, uncomment these.
>  #LIBS +=3D -lbfd -liberty -lz
>  #LIBS_p +=3D -lbfd -liberty -lz
>  #LIBS_c +=3D -lbfd -liberty -lz
>=20
> -# for p2p
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
> +CONFIG_INTERWORKING=3Dy
> +
> +# Hotspot 2.0
> +CONFIG_HS20=3Dy
> +
> +# Disable roaming in wpa_supplicant
> +#CONFIG_NO_ROAMING=3Dy
> +
> +# Enable P2P
>  CONFIG_P2P=3Dy
>  CONFIG_AP=3Dy
>=20
> -# IEEE 802.11n (High Throughput) support -CONFIG_IEEE80211N=3Dy
> +# bgscan
> +NEED_BGSCAN=3Dy
> +CONFIG_BGSCAN_LEARN=3Dy
> +CONFIG_BGSCAN_SIMPLE=3Dy
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/wp=
a-
> supplicant/wpa-supplicant-wl18xx_r8.a8.08.bb
> similarity index 89%
> copy from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a6.01.bb
> copy to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a8.08.bb
> index f6c4f70..d9a9fde 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t-
> wl18xx_r8.a6.01.bb
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt-wl18xx_r8.a8.08.bb
> @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e \
>=20
>  FILESEXTRAPATHS_append :=3D "${THISDIR}/wpa-supplicant:"
>=20
> -# Tag: ol_r8.a6.01
> -SRCREV =3D "7190ff7dbd43243290b626068ded0d61c5019050"
> -PR =3D "r2+gitr${SRCPV}"
> +# Tag: ol_r8.a8.08
> +SRCREV =3D "257ab333aad993b4be81808524bc0d939c276058"
> +PR =3D "r0+gitr${SRCPV}"
>=20
>  # Add ti to the PV to indicate that this is a TI modify version of wpa-s=
upplicant.
>  PV =3D "2.0-devel-ti"
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wp=
a-
> supplicant.inc
> index 2d8970f..ef40a83 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant.inc
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt.inc
> @@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/TI-
> OpenLink/hostap.git;protocol=3Dgit \
>             file://defaults-sane \
>             file://wpa-supplicant.sh \
>             file://wpa_supplicant.conf \
> +           file://p2p_supplicant.conf \
>             file://wpa_supplicant.conf-sane \
>             file://99_wpa_supplicant \
>             file://wpa_supplicant.conf \ @@ -55,6 +56,7 @@ do_install () =
{
>  	install -d ${D}${sysconfdir}/default
>  	install -m 600 ${WORKDIR}/defaults-sane
> ${D}${sysconfdir}/default/wpa
>  	install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane
> ${D}${sysconfdir}/wpa_supplicant.conf
> +        install -m 600 ${WORKDIR}/p2p_supplicant.conf
> + ${D}${sysconfdir}/p2p_supplicant.conf
>=20
>  	if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy .config || grep -q
> ^CONFIG_CTRL_IFACE_DBUS_NEW=3Dy .config; then
>  		install -d ${D}/${sysconfdir}/dbus-1/system.d
> @@ -104,6 +106,7 @@ pkg_postinst_wpa-supplicant () {  do_configure () {
>  	install -m 0755 ${WORKDIR}/defconfig .config
>  	echo "CFLAGS +=3D -I${STAGING_INCDIR}" >> .config
> +        echo "CFLAGS +=3D -I${STAGING_INCDIR}/libnl3/" >> .config
>  	echo "LIBS +=3D -L${STAGING_LIBDIR}" >> .config
>  	echo "LIBS_p +=3D -L${STAGING_LIBDIR}" >> .config
>  	if [ "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0, d)}" =3D
> "1" ]; then diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant/p2p_supplicant.conf b/meta-arago-extras/recipes=
-
> connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
> new file mode 100755
> index 0000000..2de8730
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt/p2p_supplicant.conf
> @@ -0,0 +1,14 @@
> +ctrl_interface=3D/var/run/wpa_supplicant
> +update_config=3D0
> +device_name=3DTI-SITARA-P2P
> +device_type=3D1-0050F204-1
> +config_methods=3Dvirtual_push_button physical_display keypad
> +p2p_go_intent=3D0
> +country=3DUS
> +##p2p_pref_chan=3D115:36 115:40
> +driver_param=3Duse_multi_chan_concurrent=3D1 use_p2p_group_interface=3D1
> +p2p_go_max_inactivity=3D60
> +p2p_go_ht40=3D1
> +p2p_multi_chan=3D1
> +disassoc_low_ack=3D1
> +concurrent_sched_scan=3D1
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/wpa_supplicant.conf b/meta-arago-extras/recipes-
> connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
> index f0c993d..f144a38 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/wpa_supplicant.conf
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt/wpa_supplicant.conf
> @@ -1,19 +1,4 @@
> -##### Example wpa_supplicant configuration file
> ############################### -# -# This file describes configuration
> file format and lists all available option.
> -# Please also take a look at simpler configuration examples in 'examples=
'
> -# subdirectory.
> -#
> -# Empty lines and lines starting with # are ignored
> -
> -# NOTE! This file may contain password information and should probably b=
e
> made -# readable only by root user on multiuser systems.
> -
> -# Note: All file paths in this configuration file should use full (absol=
ute, -# not
> relative to working directory) path in order to allow working directory -=
# to be
> changed. This can happen if wpa_supplicant is run in the background.
> -
> -# Whether to allow wpa_supplicant to update (overwrite) configuration
> +##### wpa_supplicant configuration file template #####
>  #
>  # This option can be used to allow wpa_supplicant to overwrite configura=
tion  #
> file whenever configuration is changed (e.g., new network block is added =
with
> @@ -21,59 +6,8 @@  # wpa_cli/wpa_gui to be able to store the configuratio=
n
> changes permanently.
>  # Please note that overwriting configuration file will remove the commen=
ts
> from  # it.
> -#update_config=3D1
> -
> -# global configuration (shared by all network blocks) -# -# Parameters f=
or the
> control interface. If this is specified, wpa_supplicant -# will open a co=
ntrol
> interface that is available for external programs to -# manage wpa_suppli=
cant.
> The meaning of this string depends on which control -# interface mechanis=
m is
> used. For all cases, the existance of this parameter -# in configuration =
is used to
> determine whether the control interface is -# enabled.
> -#
> -# For UNIX domain sockets (default on Linux and BSD): This is a director=
y that -
> # will be created for UNIX domain sockets for listening to requests from =
-#
> external programs (CLI/GUI, etc.) for status information and configuratio=
n.
> -# The socket file will be named based on the interface name, so multiple=
 -#
> wpa_supplicant processes can be run at the same time if more than one -#
> interface is used.
> -# /var/run/wpa_supplicant is the recommended directory for sockets and b=
y -#
> default, wpa_cli will use it when trying to connect with wpa_supplicant.
> -#
> -# Access control for the control interface can be configured by setting =
the -#
> directory to allow only members of a group to use sockets. This way, it i=
s -#
> possible to run wpa_supplicant as root (since it needs to change network =
-#
> configuration and open raw sockets) and still allow GUI/CLI components to=
 be -#
> run as non-root users. However, since the control interface can be used t=
o -#
> change the network configuration, this access needs to be protected in ma=
ny -#
> cases. By default, wpa_supplicant is configured to use gid 0 (root). If y=
ou -#
> want to allow non-root users to use the control interface, add a new grou=
p -#
> and change this value to match with that group. Add users that should hav=
e -#
> control interface access to this group. If this variable is commented out=
 or -# not
> included in the configuration file, group will not be changed from the -#=
 value it
> got by default when the directory or socket was created.
> -#
> -# When configuring both the directory and group, use following format:
> -# DIR=3D/var/run/wpa_supplicant GROUP=3Dwheel -#
> DIR=3D/var/run/wpa_supplicant GROUP=3D0 -# (group can be either group nam=
e or
> gid) -# -# For UDP connections (default on Windows): The value will be ig=
nored.
> This -# variable is just used to select that the control interface is to =
be created.
> -# The value can be set to, e.g., udp (ctrl_interface=3Dudp) -# -# For Wi=
ndows
> Named Pipe: This value can be used to set the security descriptor -# for
> controlling access to the control interface. Security descriptor can be -=
# set using
> Security Descriptor String Format (see http://msdn.microsoft.com/ -#
> library/default.asp?url=3D/library/en-us/secauthz/security/
> -# security_descriptor_string_format.asp). The descriptor string needs to=
 be -#
> prefixed with SDDL=3D. For example, ctrl_interface=3DSDDL=3DD: would set =
an empty
> -# DACL (which will reject all connections). See README-Windows.txt for m=
ore -
> # information about SDDL string format.
> -#
> +update_config=3D1
>  ctrl_interface=3D/var/run/wpa_supplicant
> -
>  # IEEE 802.1X/EAPOL version
>  # wpa_supplicant is implemented based on IEEE Std 802.1X-2004 which defi=
nes
> # EAPOL version 2. However, there are many APs that do not handle the new
> @@ -82,14 +16,15 @@ ctrl_interface=3D/var/run/wpa_supplicant
>  # to 1 by default. This configuration value can be used to set it to the=
 new  #
> version (2).
>  eapol_version=3D1
> -
>  # AP scanning/selection
>  # By default, wpa_supplicant requests driver to perform AP scanning and =
then
> # uses the scan results to select a suitable AP. Another alternative is t=
o  # allow
> the driver to take care of AP scanning and selection and use  # wpa_suppl=
icant
> just to process EAPOL frames based on IEEE 802.11 association  # informat=
ion
> from the driver.
> -# 1: wpa_supplicant initiates scanning and AP selection
> +# 1: wpa_supplicant initiates scanning and AP selection; if no APs match=
ing to
> +#    the currently enabled networks are found, a new network (IBSS or AP
> mode
> +#    operation) may be initialized (if configured) (default)
>  # 0: driver takes care of scanning, AP selection, and IEEE 802.11 associ=
ation
>  #    parameters (e.g., WPA IE generation); this mode can also be used wi=
th
>  #    non-WPA drivers when using IEEE 802.1X mode; do not try to associat=
e with
> @@ -102,589 +37,28 @@ eapol_version=3D1
>  #    the driver reports successful association; each network block shoul=
d have
>  #    explicit security policy (i.e., only one option in the lists) for
>  #    key_mgmt, pairwise, group, proto variables
> +# When using IBSS or AP mode, ap_scan=3D2 mode can force the new network
> +to be # created immediately regardless of scan results. ap_scan=3D1 mode
> +will first try # to scan for existing networks and only if no matches
> +with the enabled # networks are found, a new IBSS or AP mode network is
> created.
>  ap_scan=3D1
> -
>  # EAP fast re-authentication
>  # By default, fast re-authentication is enabled for all EAP methods that=
  #
> support it. This variable can be used to disable fast re-authentication.
>  # Normally, there is no need to disable this.
>  fast_reauth=3D1
> -
> -# OpenSSL Engine support
> -# These options can be used to load OpenSSL engines.
> -# The two engines that are supported currently are shown below:
> -# They are both from the opensc project (http://www.opensc.org/) -# By
> default no engines are loaded.
> -# make the opensc engine available
> -#opensc_engine_path=3D/usr/lib/opensc/engine_opensc.so
> -# make the pkcs11 engine available
> -#pkcs11_engine_path=3D/usr/lib/opensc/engine_pkcs11.so
> -# configure the path to the pkcs11 module required by the pkcs11 engine =
-
> #pkcs11_module_path=3D/usr/lib/pkcs11/opensc-pkcs11.so
> -
> -# Dynamic EAP methods
> -# If EAP methods were built dynamically as shared object files, they nee=
d to be -
> # loaded here before being used in the network blocks. By default, EAP me=
thods
> -# are included statically in the build, so these lines are not needed -
> #load_dynamic_eap=3D/usr/lib/wpa_supplicant/eap_tls.so
> -#load_dynamic_eap=3D/usr/lib/wpa_supplicant/eap_md5.so
> -
> -# Driver interface parameters
> -# This field can be used to configure arbitrary driver interace paramete=
rs. The -
> # format is specific to the selected driver interface. This field is not =
used -# in
> most cases.
> -#driver_param=3D"field=3Dvalue"
> -
> -# Maximum lifetime for PMKSA in seconds; default 43200
> -#dot11RSNAConfigPMKLifetime=3D43200
> -# Threshold for reauthentication (percentage of PMK lifetime); default 7=
0
> -#dot11RSNAConfigPMKReauthThreshold=3D70
> -# Timeout for security association negotiation in seconds; default 60
> -#dot11RSNAConfigSATimeout=3D60
> -
> -# network block
> -#
> -# Each network (usually AP's sharing the same SSID) is configured as a s=
eparate
> -# block in this configuration file. The network blocks are in preference=
 order -#
> (the first match is used).
> -#
> -# network block fields:
> -#
> -# disabled:
> -#	0 =3D this network can be used (default)
> -#	1 =3D this network block is disabled (can be enabled through ctrl_ifac=
e,
> -#	    e.g., with wpa_cli or wpa_gui)
> -#
> -# id_str: Network identifier string for external scripts. This value is =
passed
> -#	to external action script through wpa_cli as WPA_ID_STR environment
> -#	variable to make it easier to do network specific configuration.
> -#
> -# ssid: SSID (mandatory); either as an ASCII string with double quotatio=
n or
> -#	as hex string; network name
> -#
> -# scan_ssid:
> -#	0 =3D do not scan this SSID with specific Probe Request frames (defaul=
t)
> -#	1 =3D scan with SSID-specific Probe Request frames (this can be used t=
o
> -#	    find APs that do not accept broadcast SSID or use multiple SSIDs;
> -#	    this will add latency to scanning, so enable this only when needed=
)
> -#
> -# bssid: BSSID (optional); if set, this network block is used only when
> -#	associating with the AP using the configured BSSID
> -#
> -# priority: priority group (integer)
> -# By default, all networks will get same priority group (0). If some of =
the -#
> networks are more desirable, this field can be used to change the order i=
n -#
> which wpa_supplicant goes through the networks when selecting a BSS. The =
-#
> priority groups will be iterated in decreasing priority (i.e., the larger=
 the -#
> priority value, the sooner the network is matched against the scan result=
s).
> -# Within each priority group, networks will be selected based on securit=
y -#
> policy, signal strength, etc.
> -# Please note that AP scanning with scan_ssid=3D1 and ap_scan=3D2 mode a=
re not -
> # using this priority to select the order for scanning. Instead, they try=
 the -#
> networks in the order that used in the configuration file.
> -#
> -# mode: IEEE 802.11 operation mode
> -# 0 =3D infrastructure (Managed) mode, i.e., associate with an AP (defau=
lt) -# 1 =3D
> IBSS (ad-hoc, peer-to-peer) -# Note: IBSS can only be used with key_mgmt
> NONE (plaintext and static WEP) -# and key_mgmt=3DWPA-NONE (fixed group k=
ey
> TKIP/CCMP). In addition, ap_scan has -# to be set to 2 for IBSS. WPA-None
> requires following network block options:
> -# proto=3DWPA, key_mgmt=3DWPA-NONE, pairwise=3DNONE, group=3DTKIP (or CC=
MP,
> but not -# both), and psk must also be set.
> -#
> -# proto: list of accepted protocols
> -# WPA =3D WPA/IEEE 802.11i/D3.0
> -# RSN =3D WPA2/IEEE 802.11i (also WPA2 can be used as an alias for RSN) =
-# If
> not set, this defaults to: WPA RSN -# -# key_mgmt: list of accepted
> authenticated key management protocols -# WPA-PSK =3D WPA pre-shared key
> (this requires 'psk' field) -# WPA-EAP =3D WPA using EAP authentication (=
this can
> use an external
> -#	program, e.g., Xsupplicant, for IEEE 802.1X EAP Authentication
> -# IEEE8021X =3D IEEE 802.1X using EAP authentication and (optionally)
> dynamically
> -#	generated WEP keys
> -# NONE =3D WPA is not used; plaintext or static WEP could be used -# If =
not set,
> this defaults to: WPA-PSK WPA-EAP -# -# auth_alg: list of allowed IEEE 80=
2.11
> authentication algorithms -# OPEN =3D Open System authentication (require=
d for
> WPA/WPA2) -# SHARED =3D Shared Key authentication (requires static WEP ke=
ys)
> -# LEAP =3D LEAP/Network EAP (only used with LEAP) -# If not set, automat=
ic
> selection is used (Open System with LEAP enabled if -# LEAP is allowed as=
 one of
> the EAP methods).
> -#
> -# pairwise: list of accepted pairwise (unicast) ciphers for WPA -# CCMP =
=3D AES in
> Counter mode with CBC-MAC [RFC 3610, IEEE 802.11i/D7.0] -# TKIP =3D Tempo=
ral
> Key Integrity Protocol [IEEE 802.11i/D7.0] -# NONE =3D Use only Group Key=
s
> (deprecated, should not be included if APs support
> -#	pairwise keys)
> -# If not set, this defaults to: CCMP TKIP -# -# group: list of accepted =
group
> (broadcast/multicast) ciphers for WPA -# CCMP =3D AES in Counter mode wit=
h
> CBC-MAC [RFC 3610, IEEE 802.11i/D7.0] -# TKIP =3D Temporal Key Integrity
> Protocol [IEEE 802.11i/D7.0] -# WEP104 =3D WEP (Wired Equivalent Privacy)=
 with
> 104-bit key -# WEP40 =3D WEP (Wired Equivalent Privacy) with 40-bit key [=
IEEE
> 802.11] -# If not set, this defaults to: CCMP TKIP WEP104 WEP40 -# -# psk=
:
> WPA preshared key; 256-bit pre-shared key -# The key used in WPA-PSK mode
> can be entered either as 64 hex-digits, i.e., -# 32 bytes or as an ASCII =
passphrase
> (in which case, the real PSK will be -# generated using the passphrase an=
d SSID).
> ASCII passphrase must be between -# 8 and 63 characters (inclusive).
> -# This field is not needed, if WPA-EAP is used.
> -# Note: Separate tool, wpa_passphrase, can be used to generate 256-bit k=
eys -
> # from ASCII passphrase. This process uses lot of CPU and wpa_supplicant =
-#
> startup and reconfiguration time can be optimized by generating the PSK o=
nly -#
> only when the passphrase or SSID has actually changed.
> -#
> -# eapol_flags: IEEE 802.1X/EAPOL options (bit field) -# Dynamic WEP key
> required for non-WPA mode -# bit0 (1): require dynamically generated unic=
ast
> WEP key -# bit1 (2): require dynamically generated broadcast WEP key
> -# 	(3 =3D require both keys; default)
> -# Note: When using wired authentication, eapol_flags must be set to 0 fo=
r the -
> # authentication to be completed successfully.
> -#
> -# proactive_key_caching:
> -# Enable/disable opportunistic PMKSA caching for WPA2.
> -# 0 =3D disabled (default)
> -# 1 =3D enabled
> -#
> -# wep_key0..3: Static WEP key (ASCII in double quotation, e.g. "abcde" o=
r -#
> hex without quotation, e.g., 0102030405) -# wep_tx_keyidx: Default WEP ke=
y
> index (TX) (0..3) -# -# peerkey: Whether PeerKey negotiation for direct l=
inks
> (IEEE 802.11e DLS) is -# allowed. This is only used with RSN/WPA2.
> -# 0 =3D disabled (default)
> -# 1 =3D enabled
> -#peerkey=3D1
> -#
> -# Following fields are only used with internal EAP implementation.
> -# eap: space-separated list of accepted EAP methods
> -#	MD5 =3D EAP-MD5 (unsecure and does not generate keying material ->
> -#			cannot be used with WPA; to be used as a Phase 2
> method
> -#			with EAP-PEAP or EAP-TTLS)
> -#       MSCHAPV2 =3D EAP-MSCHAPv2 (cannot be used separately with WPA; t=
o be
> used
> -#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
> -#       OTP =3D EAP-OTP (cannot be used separately with WPA; to be used
> -#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
> -#       GTC =3D EAP-GTC (cannot be used separately with WPA; to be used
> -#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
> -#	TLS =3D EAP-TLS (client and server certificate)
> -#	PEAP =3D EAP-PEAP (with tunnelled EAP authentication)
> -#	TTLS =3D EAP-TTLS (with tunnelled EAP or
> PAP/CHAP/MSCHAP/MSCHAPV2
> -#			 authentication)
> -#	If not set, all compiled in methods are allowed.
> -#
> -# identity: Identity string for EAP
> -# anonymous_identity: Anonymous identity string for EAP (to be used as t=
he
> -#	unencrypted identity with EAP types that support different tunnelled
> -#	identity, e.g., EAP-TTLS)
> -# password: Password string for EAP
> -# ca_cert: File path to CA certificate file (PEM/DER). This file can hav=
e one
> -#	or more trusted CA certificates. If ca_cert and ca_path are not
> -#	included, server certificate will not be verified. This is insecure an=
d
> -#	a trusted CA certificate should always be configured when using
> -#	EAP-TLS/TTLS/PEAP. Full path should be used since working directory
> may
> -#	change when wpa_supplicant is run in the background.
> -#	On Windows, trusted CA certificates can be loaded from the system
> -#	certificate store by setting this to cert_store://<name>, e.g.,
> -#	ca_cert=3D"cert_store://CA" or ca_cert=3D"cert_store://ROOT".
> -#	Note that when running wpa_supplicant as an application, the user
> -#	certificate store (My user account) is used, whereas computer store
> -#	(Computer account) is used when running wpasvc as a service.
> -# ca_path: Directory path for CA certificate files (PEM). This path may
> -#	contain multiple CA certificates in OpenSSL format. Common use for thi=
s
> -#	is to point to system trusted CA list which is often installed into
> -#	directory like /etc/ssl/certs. If configured, these certificates are
> -#	added to the list of trusted CAs. ca_cert may also be included in that
> -#	case, but it is not required.
> -# client_cert: File path to client certificate file (PEM/DER)
> -#	Full path should be used since working directory may change when
> -#	wpa_supplicant is run in the background.
> -#	Alternatively, a named configuration blob can be used by setting this
> -#	to blob://<blob name>.
> -# private_key: File path to client private key file (PEM/DER/PFX)
> -#	When PKCS#12/PFX file (.p12/.pfx) is used, client_cert should be
> -#	commented out. Both the private key and certificate will be read from
> -#	the PKCS#12 file in this case. Full path should be used since working
> -#	directory may change when wpa_supplicant is run in the background.
> -#	Windows certificate store can be used by leaving client_cert out and
> -#	configuring private_key in one of the following formats:
> -#	cert://substring_to_match
> -#	hash://certificate_thumbprint_in_hex
> -#	for example: private_key=3D"hash://63093aa9c47f56ae88334c7b65a4"
> -#	Note that when running wpa_supplicant as an application, the user
> -#	certificate store (My user account) is used, whereas computer store
> -#	(Computer account) is used when running wpasvc as a service.
> -#	Alternatively, a named configuration blob can be used by setting this
> -#	to blob://<blob name>.
> -# private_key_passwd: Password for private key file (if left out, this w=
ill be
> -#	asked through control interface)
> -# dh_file: File path to DH/DSA parameters file (in PEM format)
> -#	This is an optional configuration file for setting parameters for an
> -#	ephemeral DH key exchange. In most cases, the default RSA
> -#	authentication does not use this configuration. However, it is possibl=
e
> -#	setup RSA to use ephemeral DH key exchange. In addition, ciphers with
> -#	DSA keys always use ephemeral DH keys. This can be used to achieve
> -#	forward secrecy. If the file is in DSA parameters format, it will be
> -#	automatically converted into DH params.
> -# subject_match: Substring to be matched against the subject of the
> -#	authentication server certificate. If this string is set, the server
> -#	sertificate is only accepted if it contains this string in the subject=
.
> -#	The subject string is in following format:
> -#	/C=3DUS/ST=3DCA/L=3DSan Francisco/CN=3DTest
> AS/emailAddress=3Das@example.com
> -# altsubject_match: Semicolon separated string of entries to be matched
> against
> -#	the alternative subject name of the authentication server certificate.
> -#	If this string is set, the server sertificate is only accepted if it
> -#	contains one of the entries in an alternative subject name extension.
> -#	altSubjectName string is in following format: TYPE:VALUE
> -#	Example: EMAIL:server@example.com
> -#	Example: DNS:server.example.com;DNS:server2.example.com
> -#	Following types are supported: EMAIL, DNS, URI
> -# phase1: Phase1 (outer authentication, i.e., TLS tunnel) parameters
> -#	(string with field-value pairs, e.g., "peapver=3D0" or
> -#	"peapver=3D1 peaplabel=3D1")
> -#	'peapver' can be used to force which PEAP version (0 or 1) is used.
> -#	'peaplabel=3D1' can be used to force new label, "client PEAP encryptio=
n",
> -#	to be used during key derivation when PEAPv1 or newer. Most existing
> -#	PEAPv1 implementation seem to be using the old label, "client EAP
> -#	encryption", and wpa_supplicant is now using that as the default value=
.
> -#	Some servers, e.g., Radiator, may require peaplabel=3D1 configuration =
to
> -#	interoperate with PEAPv1; see eap_testing.txt for more details.
> -#	'peap_outer_success=3D0' can be used to terminate PEAP authentication
> on
> -#	tunneled EAP-Success. This is required with some RADIUS servers that
> -#	implement draft-josefsson-pppext-eap-tls-eap-05.txt (e.g.,
> -#	Lucent NavisRadius v4.4.0 with PEAP in "IETF Draft 5" mode)
> -#	include_tls_length=3D1 can be used to force wpa_supplicant to include
> -#	TLS Message Length field in all TLS messages even if they are not
> -#	fragmented.
> -#	sim_min_num_chal=3D3 can be used to configure EAP-SIM to require
> three
> -#	challenges (by default, it accepts 2 or 3)
> -# phase2: Phase2 (inner authentication with TLS tunnel) parameters
> -#	(string with field-value pairs, e.g., "auth=3DMSCHAPV2" for EAP-PEAP o=
r
> -#	"autheap=3DMSCHAPV2 autheap=3DMD5" for EAP-TTLS)
> -# Following certificate/private key fields are used in inner Phase2 -#
> authentication when using EAP-TTLS or EAP-PEAP.
> -# ca_cert2: File path to CA certificate file. This file can have one or =
more
> -#	trusted CA certificates. If ca_cert2 and ca_path2 are not included,
> -#	server certificate will not be verified. This is insecure and a truste=
d
> -#	CA certificate should always be configured.
> -# ca_path2: Directory path for CA certificate files (PEM) -# client_cert=
2: File
> path to client certificate file -# private_key2: File path to client priv=
ate key file -#
> private_key2_passwd: Password for private key file -# dh_file2: File path=
 to
> DH/DSA parameters file (in PEM format) -# subject_match2: Substring to be
> matched against the subject of the
> -#	authentication server certificate.
> -# altsubject_match2: Substring to be matched against the alternative sub=
ject
> -#	name of the authentication server certificate.
> -#
> -# fragment_size: Maximum EAP fragment size in bytes (default 1398).
> -#	This value limits the fragment size for EAP methods that support
> -#	fragmentation (e.g., EAP-TLS and EAP-PEAP). This value should be set
> -#	small enough to make the EAP messages fit in MTU of the network
> -#	interface used for EAPOL. The default value is suitable for most
> -#	cases.
> -#
> -# EAP-PSK variables:
> -# eappsk: 16-byte (128-bit, 32 hex digits) pre-shared key in hex format =
-# nai:
> user NAI -# -# EAP-PAX variables:
> -# eappsk: 16-byte (128-bit, 32 hex digits) pre-shared key in hex format =
-# -#
> EAP-SAKE variables:
> -# eappsk: 32-byte (256-bit, 64 hex digits) pre-shared key in hex format
> -#	(this is concatenation of Root-Secret-A and Root-Secret-B)
> -# nai: user NAI (PEERID)
> -#
> -# EAP-GPSK variables:
> -# eappsk: Pre-shared key in hex format (at least 128 bits, i.e., 32 hex =
digits) -#
> nai: user NAI (ID_Client) -# -# EAP-FAST variables:
> -# pac_file: File path for the PAC entries. wpa_supplicant will need to b=
e able
> -#	to create this file and write updates to it when PAC is being
> -#	provisioned or refreshed. Full path to the file should be used since
> -#	working directory may change when wpa_supplicant is run in the
> -#	background. Alternatively, a named configuration blob can be used by
> -#	setting this to blob://<blob name>
> -# phase1: fast_provisioning=3D1 option enables in-line provisioning of E=
AP-FAST
> -#	credentials (PAC)
> -#
> -# wpa_supplicant supports number of "EAP workarounds" to work around -#
> interoperability issues with incorrectly behaving authentication servers.
> -# These are enabled by default because some of the issues are present in=
 large -
> # number of authentication servers. Strict EAP conformance mode can be -#
> configured by disabling workarounds with eap_workaround=3D0.
> -
> -# Example blocks:
> -
> -# Simple case: WPA-PSK, PSK as an ASCII passphrase, allow all valid ciph=
ers -
> network=3D{
> -	ssid=3D"simple"
> -	psk=3D"very secret passphrase"
> -	priority=3D5
> -}
> -
> -# Same as previous, but request SSID-specific scanning (for APs that rej=
ect -#
> broadcast SSID) -network=3D{
> -	ssid=3D"second ssid"
> -	scan_ssid=3D1
> -	psk=3D"very secret passphrase"
> -	priority=3D2
> -}
> -
> -# Only WPA-PSK is used. Any valid cipher combination is accepted.
> -network=3D{
> -	ssid=3D"example"
> -	proto=3DWPA
> -	key_mgmt=3DWPA-PSK
> -	pairwise=3DCCMP TKIP
> -	group=3DCCMP TKIP WEP104 WEP40
> -
> 	psk=3D06b4be19da289f475aa46a33cb793029d4ab3db7a23ee92382eb
> 0106c72ac7bb
> -	priority=3D2
> -}
> -
> -# Only WPA-EAP is used. Both CCMP and TKIP is accepted. An AP that used
> WEP104 -# or WEP40 as the group cipher will not be accepted.
> -network=3D{
> -	ssid=3D"example"
> -	proto=3DRSN
> -	key_mgmt=3DWPA-EAP
> -	pairwise=3DCCMP TKIP
> -	group=3DCCMP TKIP
> -	eap=3DTLS
> -	identity=3D"user@example.com"
> -	ca_cert=3D"/etc/cert/ca.pem"
> -	client_cert=3D"/etc/cert/user.pem"
> -	private_key=3D"/etc/cert/user.prv"
> -	private_key_passwd=3D"password"
> -	priority=3D1
> -}
> -
> -# EAP-PEAP/MSCHAPv2 configuration for RADIUS servers that use the new
> peaplabel -# (e.g., Radiator) -network=3D{
> -	ssid=3D"example"
> -	key_mgmt=3DWPA-EAP
> -	eap=3DPEAP
> -	identity=3D"user@example.com"
> -	password=3D"foobar"
> -	ca_cert=3D"/etc/cert/ca.pem"
> -	phase1=3D"peaplabel=3D1"
> -	phase2=3D"auth=3DMSCHAPV2"
> -	priority=3D10
> -}
> -
> -# EAP-TTLS/EAP-MD5-Challenge configuration with anonymous identity for t=
he
> -# unencrypted use. Real identity is sent only within an encrypted TLS tu=
nnel.
> -network=3D{
> -	ssid=3D"example"
> -	key_mgmt=3DWPA-EAP
> -	eap=3DTTLS
> -	identity=3D"user@example.com"
> -	anonymous_identity=3D"anonymous@example.com"
> -	password=3D"foobar"
> -	ca_cert=3D"/etc/cert/ca.pem"
> -	priority=3D2
> -}
> -
> -# EAP-TTLS/MSCHAPv2 configuration with anonymous identity for the
> unencrypted -# use. Real identity is sent only within an encrypted TLS tu=
nnel.
> -network=3D{
> -	ssid=3D"example"
> -	key_mgmt=3DWPA-EAP
> -	eap=3DTTLS
> -	identity=3D"user@example.com"
> -	anonymous_identity=3D"anonymous@example.com"
> -	password=3D"foobar"
> -	ca_cert=3D"/etc/cert/ca.pem"
> -	phase2=3D"auth=3DMSCHAPV2"
> -}
> -
> -# WPA-EAP, EAP-TTLS with different CA certificate used for outer and inn=
er -#
> authentication.
> -network=3D{
> -	ssid=3D"example"
> -	key_mgmt=3DWPA-EAP
> -	eap=3DTTLS
> -	# Phase1 / outer authentication
> -	anonymous_identity=3D"anonymous@example.com"
> -	ca_cert=3D"/etc/cert/ca.pem"
> -	# Phase 2 / inner authentication
> -	phase2=3D"autheap=3DTLS"
> -	ca_cert2=3D"/etc/cert/ca2.pem"
> -	client_cert2=3D"/etc/cer/user.pem"
> -	private_key2=3D"/etc/cer/user.prv"
> -	private_key2_passwd=3D"password"
> -	priority=3D2
> -}
> -
> -# Both WPA-PSK and WPA-EAP is accepted. Only CCMP is accepted as pairwis=
e
> and -# group cipher.
> -network=3D{
> -	ssid=3D"example"
> -	bssid=3D00:11:22:33:44:55
> -	proto=3DWPA RSN
> -	key_mgmt=3DWPA-PSK WPA-EAP
> -	pairwise=3DCCMP
> -	group=3DCCMP
> -
> 	psk=3D06b4be19da289f475aa46a33cb793029d4ab3db7a23ee92382eb
> 0106c72ac7bb
> -}
> -
> -# Special characters in SSID, so use hex string. Default to WPA-PSK, WPA=
-EAP -
> # and all valid ciphers.
> -network=3D{
> -	ssid=3D00010203
> -
> 	psk=3D000102030405060708090a0b0c0d0e0f10111213141516171819
> 1a1b1c1d1e1f
> -}
> -
> -
> -# IEEE 802.1X/EAPOL with dynamically generated WEP keys (i.e., no WPA)
> using -# EAP-TLS for authentication and key generation; require both unic=
ast
> and -# broadcast WEP keys.
> -network=3D{
> -	ssid=3D"1x-test"
> -	key_mgmt=3DIEEE8021X
> -	eap=3DTLS
> -	identity=3D"user@example.com"
> -	ca_cert=3D"/etc/cert/ca.pem"
> -	client_cert=3D"/etc/cert/user.pem"
> -	private_key=3D"/etc/cert/user.prv"
> -	private_key_passwd=3D"password"
> -	eapol_flags=3D3
> -}
> -
> -
> -# LEAP with dynamic WEP keys
> -network=3D{
> -	ssid=3D"leap-example"
> -	key_mgmt=3DIEEE8021X
> -	eap=3DLEAP
> -	identity=3D"user"
> -	password=3D"foobar"
> -}
> -
> -# Plaintext connection (no WPA, no IEEE 802.1X) -network=3D{
> -	ssid=3D"plaintext-test"
> -	key_mgmt=3DNONE
> -}
> -
> -
> -# Shared WEP key connection (no WPA, no IEEE 802.1X) -network=3D{
> -	ssid=3D"static-wep-test"
> -	key_mgmt=3DNONE
> -	wep_key0=3D"abcde"
> -	wep_key1=3D0102030405
> -	wep_key2=3D"1234567890123"
> -	wep_tx_keyidx=3D0
> -	priority=3D5
> -}
> -
> -
> -# Shared WEP key connection (no WPA, no IEEE 802.1X) using Shared Key -#
> IEEE 802.11 authentication -network=3D{
> -	ssid=3D"static-wep-test2"
> -	key_mgmt=3DNONE
> -	wep_key0=3D"abcde"
> -	wep_key1=3D0102030405
> -	wep_key2=3D"1234567890123"
> -	wep_tx_keyidx=3D0
> -	priority=3D5
> -	auth_alg=3DSHARED
> -}
> -
> -
> -# IBSS/ad-hoc network with WPA-None/TKIP.
> -network=3D{
> -	ssid=3D"test adhoc"
> -	mode=3D1
> -	proto=3DWPA
> -	key_mgmt=3DWPA-NONE
> -	pairwise=3DNONE
> -	group=3DTKIP
> -	psk=3D"secret passphrase"
> -}
> -
> -
> -# Catch all example that allows more or less all configuration modes -ne=
twork=3D{
> -	ssid=3D"example"
> -	scan_ssid=3D1
> -	key_mgmt=3DWPA-EAP WPA-PSK IEEE8021X NONE
> -	pairwise=3DCCMP TKIP
> -	group=3DCCMP TKIP WEP104 WEP40
> -	psk=3D"very secret passphrase"
> -	eap=3DTTLS PEAP TLS
> -	identity=3D"user@example.com"
> -	password=3D"foobar"
> -	ca_cert=3D"/etc/cert/ca.pem"
> -	client_cert=3D"/etc/cert/user.pem"
> -	private_key=3D"/etc/cert/user.prv"
> -	private_key_passwd=3D"password"
> -	phase1=3D"peaplabel=3D0"
> -}
> -
> -# Example of EAP-TLS with smartcard (openssl engine) -network=3D{
> -	ssid=3D"example"
> -	key_mgmt=3DWPA-EAP
> -	eap=3DTLS
> -	proto=3DRSN
> -	pairwise=3DCCMP TKIP
> -	group=3DCCMP TKIP
> -	identity=3D"user@example.com"
> -	ca_cert=3D"/etc/cert/ca.pem"
> -	client_cert=3D"/etc/cert/user.pem"
> -
> -	engine=3D1
> -
> -	# The engine configured here must be available. Look at
> -	# OpenSSL engine support in the global section.
> -	# The key available through the engine must be the private key
> -	# matching the client certificate configured above.
> -
> -	# use the opensc engine
> -	#engine_id=3D"opensc"
> -	#key_id=3D"45"
> -
> -	# use the pkcs11 engine
> -	engine_id=3D"pkcs11"
> -	key_id=3D"id_45"
> -
> -	# Optional PIN configuration; this can be left out and PIN will be
> -	# asked through the control interface
> -	pin=3D"1234"
> -}
> -
> -# Example configuration showing how to use an inlined blob as a CA certi=
ficate -
> # data instead of using external file -network=3D{
> -	ssid=3D"example"
> -	key_mgmt=3DWPA-EAP
> -	eap=3DTTLS
> -	identity=3D"user@example.com"
> -	anonymous_identity=3D"anonymous@example.com"
> -	password=3D"foobar"
> -	ca_cert=3D"blob://exampleblob"
> -	priority=3D20
> -}
> -
> -blob-base64-exampleblob=3D{
> -SGVsbG8gV29ybGQhCg=3D=3D
> -}
> -
> -
> -# Wildcard match for SSID (plaintext APs only). This example select any =
-# open
> AP regardless of its SSID.
> -network=3D{
> -	key_mgmt=3DNONE
> -}
> +device_name=3DBlaze
> +manufacturer=3DTI
> +model_name=3DWilink
> +model_number=3Dwl18xx
> +serial_number=3D12345
> +driver_param=3Duse_multi_chan_concurrent=3D1 use_p2p_group_interface=3D1=
 #
> +Timeout in seconds to detect STA inactivity (default: 300 seconds) # #
> +This timeout value is used in P2P GO mode to clean up # inactive
> +stations.
> +p2p_go_max_inactivity=3D60
> +p2p_go_ht40=3D1
> +p2p_multi_chan=3D1
> +disassoc_low_ack=3D1
> +concurrent_sched_scan=3D1
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

