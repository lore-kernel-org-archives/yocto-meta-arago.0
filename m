Return-Path: <eyalr@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 80FD852A51
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 16:01:47 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IG1kVj023893
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 11:01:46 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IG1jiF027575
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 11:01:45 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Mon, 18 Mar 2013 17:01:44 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/9] hostap-daemon-wl18xx: hostap-daemon
	for ti wilink8 release
Thread-Index: AQHOI92djnCUb3jmckOz8HSBaGhc0ZirhxMAgAAB9QCAABJjwA==
Date: Mon, 18 Mar 2013 16:01:44 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C50552@DNCE04.ent.ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
	<1363613762-6537-3-git-send-email-eyalr@ti.com>
	<7D46E86EC0A8354091174257B2FED10159480E8A@DLEE11.ent.ti.com>
	<20130318155342.GC14761@denix.org>
In-Reply-To: <20130318155342.GC14761@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/9] hostap-daemon-wl18xx: hostap-daemon for ti wilink8 release
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
X-List-Received-Date: Mon, 18 Mar 2013 16:01:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, March 18, 2013 5:54 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 3/9] hostap-daemon-wl18xx: hostap-
> daemon for ti wilink8 release
>=20
> On Mon, Mar 18, 2013 at 03:46:42PM +0000, Maupin, Chase wrote:
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Eyal Reizer
> > > Sent: Monday, March 18, 2013 8:36 AM
> > > To: meta-arago@arago-project.org
> > > Subject: [meta-arago] [PATCH 3/9] hostap-daemon-wl18xx: hostap-
> > > daemon for ti wilink8 release
> > >
> > > From: Eyal Reizer <eyalr@ti.com>
> > >
> > > Add a new recipe for building the ti version of hostap-daemon
> > > 2.0-devel from release r8.a6.01
> > >
> > > This package replace the wilink6 package which is provided by the
> > > hostap-daemon recipe. Selection between the two is done using a
> > > "WILINK_VERSION" switch added to arago.conf
> > >
> > > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > > ---
> > >  ...d-change-conf-file-for-better-oob-startup.patch |   40 +++++
> > >  .../hostap/hostap-daemon-wl18xx/defconfig          |  183
> > > ++++++++++++++++++++
> > >  .../hostap/hostap-daemon-wl18xx/init               |   37 ++++
> > >  .../hostap/hostap-daemon-wl18xx_git.bb             |   64
> > > +++++++
> > >  4 files changed, 324 insertions(+)
> > >  create mode 100644 meta-arago-extras/recipes-
> > > connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-
> > > conf-file-for-better-oob-startup.patch
> > >  create mode 100644 meta-arago-extras/recipes-
> > > connectivity/hostap/hostap-daemon-wl18xx/defconfig
> > >  create mode 100644 meta-arago-extras/recipes-
> > > connectivity/hostap/hostap-daemon-wl18xx/init
> > >  create mode 100644 meta-arago-extras/recipes-
> > > connectivity/hostap/hostap-daemon-wl18xx_git.bb
> > >
> > > diff --git a/meta-arago-extras/recipes-
> > > connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-
> > > conf-file-for-better-oob-startup.patch b/meta-arago-
> > > extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-
> > > hostapd-change-conf-file-for-better-oob-startup.patch
> > > new file mode 100644
> > > index 0000000..824d250
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-
> > > daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-
> > > startup.patch
> > > @@ -0,0 +1,40 @@
> > > +From f7c1b9d4e18dc650dd0b9da97a91f27f6a4bb5b7 Mon Sep 17
> > > 00:00:00 2001
> > > +From: Eyal Reizer <eyalr@ti.com>
> > > +Date: Sun, 17 Mar 2013 07:18:55 -0700
> > > +Subject: [PATCH] hostapd: change conf file for better sdk out of
> > > box startup
> > > +
> > > +Change the default channel to 6 and change the ssid to a more
> > > +meaningful name.
> > > +
> > > +Upstream-status: inappropriate [SDK specific patch]
> > > +
> > > +Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > > +---
> > > + hostapd/hostapd.conf |    4 ++--
> > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > +
> > > +diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf index
> > > +f71a881..00843aa 100644
> > > +--- a/hostapd/hostapd.conf
> > > ++++ b/hostapd/hostapd.conf
> > > +@@ -83,7 +83,7 @@ ctrl_interface_group=3D0  ##### IEEE 802.11
> related
> > > +configuration
> > > #######################################
> > > +
> > > + # SSID to be used in IEEE 802.11 management frames -ssid=3Dtest
> > > ++ssid=3DTexasInstruments_0001
> > > +
> > > + # Country code (ISO/IEC 3166-1). Used to set regulatory domain.
> > > + # Set as needed to indicate country in which device is
> > > operating.
> > > +@@ -107,7 +107,7 @@ hw_mode=3Dg
> > > + # channel will need to be configured separately with iwconfig.
> > > + # When set to 0, automatic channel selection will be engaged. A
> > > channel
> > > + # will be selected from the desired hw_mode.
> > > +-channel=3D1
> > > ++channel=3D6
> > > +
> > > + # Automatic channel selection (ACS) whitelist  # (default: not
> > > +set)
> > > +--
> > > +1.7.9.5
> > > +
> > > diff --git a/meta-arago-extras/recipes-
> > > connectivity/hostap/hostap-daemon-wl18xx/defconfig b/meta-arago-
> > > extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/defconfig
> > > new file mode 100644
> > > index 0000000..1ea96c4
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-
> > > daemon-wl18xx/defconfig
> > > @@ -0,0 +1,183 @@
> > > +# Example hostapd build time configuration # # This file lists the
> > > +configuration options that are used when
> > > building the
> > > +# hostapd binary. All lines starting with # are ignored.
> > > Configuration option
> > > +# lines must be commented out complete, if they are not to be
> > > included, i.e.,
> > > +# just setting VARIABLE=3Dn is not disabling that variable.
> > > +#
> > > +# This file is included in Makefile, so variables like CFLAGS
> > > and LIBS can also
> > > +# be modified from here. In most cass, these lines should use +=3D
> > > in order not
> > > +# to override previous values of the variables.
> > > +
> > > +# Driver interface for Host AP driver CONFIG_DRIVER_HOSTAP=3Dy
> > > +
> > > +# Driver interface for wired authenticator #CONFIG_DRIVER_WIRED=3Dy
> > > +
> > > +# Driver interface for madwifi driver #CONFIG_DRIVER_MADWIFI=3Dy
> > > +#CFLAGS +=3D -I../../madwifi # change to the madwifi source
> > > directory
> > > +
> > > +# Driver interface for drivers using the nl80211 kernel
> > > interface
> > > +CONFIG_DRIVER_NL80211=3Dy
> > > +CONFIG_LIBNL20=3Dy
> > > +# driver_nl80211.c requires a rather new libnl (version 1.1)
> > > which may not be
> > > +# shipped with your distribution yet. If that is the case, you
> > > need to build
> > > +# newer libnl version and point the hostapd build to use it.
> > > +#LIBNL=3D/usr/src/libnl
> > > +#CFLAGS +=3D -I$(LIBNL)/include
> > > +#LIBS +=3D -L$(LIBNL)/lib
> > > +
> > > +# Driver interface for FreeBSD net80211 layer (e.g., Atheros
> > > driver)
> > > +#CONFIG_DRIVER_BSD=3Dy
> > > +#CFLAGS +=3D -I/usr/local/include
> > > +#LIBS +=3D -L/usr/local/lib
> > > +#LIBS_p +=3D -L/usr/local/lib
> > > +#LIBS_c +=3D -L/usr/local/lib
> > > +
> > > +# Driver interface for no driver (e.g., RADIUS server only)
> > > +#CONFIG_DRIVER_NONE=3Dy
> > > +
> > > +# IEEE 802.11F/IAPP
> > > +CONFIG_IAPP=3Dy
> > > +
> > > +# WPA2/IEEE 802.11i RSN pre-authentication CONFIG_RSN_PREAUTH=3Dy
> > > +
> > > +# PeerKey handshake for Station to Station Link (IEEE 802.11e
> > > DLS)
> > > +CONFIG_PEERKEY=3Dy
> > > +
> > > +# IEEE 802.11w (management frame protection) # This version is an
> > > +experimental implementation based on IEEE
> > > 802.11w/D1.0
> > > +# draft and is subject to change since the standard has not yet
> > > been finalized.
> > > +# Driver support is also needed for IEEE 802.11w.
> > > +#CONFIG_IEEE80211W=3Dy
> > > +
> > > +# Integrated EAP server
> > > +CONFIG_EAP=3Dy
> > > +
> > > +# EAP-MD5 for the integrated EAP server CONFIG_EAP_MD5=3Dy
> > > +
> > > +# EAP-TLS for the integrated EAP server CONFIG_EAP_TLS=3Dy
> > > +
> > > +# EAP-MSCHAPv2 for the integrated EAP server CONFIG_EAP_MSCHAPV2=3Dy
> > > +
> > > +# EAP-PEAP for the integrated EAP server CONFIG_EAP_PEAP=3Dy
> > > +
> > > +# EAP-GTC for the integrated EAP server CONFIG_EAP_GTC=3Dy
> > > +
> > > +# EAP-TTLS for the integrated EAP server CONFIG_EAP_TTLS=3Dy
> > > +
> > > +# EAP-SIM for the integrated EAP server #CONFIG_EAP_SIM=3Dy
> > > +
> > > +# EAP-AKA for the integrated EAP server #CONFIG_EAP_AKA=3Dy
> > > +
> > > +# EAP-AKA' for the integrated EAP server # This requires
> > > +CONFIG_EAP_AKA to be enabled, too.
> > > +#CONFIG_EAP_AKA_PRIME=3Dy
> > > +
> > > +# EAP-PAX for the integrated EAP server #CONFIG_EAP_PAX=3Dy
> > > +
> > > +# EAP-PSK for the integrated EAP server (this is _not_ needed
> > > for WPA-PSK)
> > > +#CONFIG_EAP_PSK=3Dy
> > > +
> > > +# EAP-SAKE for the integrated EAP server #CONFIG_EAP_SAKE=3Dy
> > > +
> > > +# EAP-GPSK for the integrated EAP server #CONFIG_EAP_GPSK=3Dy #
> > > +Include support for optional SHA256 cipher suite in EAP-GPSK
> > > +#CONFIG_EAP_GPSK_SHA256=3Dy
> > > +
> > > +# EAP-FAST for the integrated EAP server # Note: Default OpenSSL
> > > +package does not include support for all
> > > the
> > > +# functionality needed for EAP-FAST. If EAP-FAST is enabled with
> > > OpenSSL,
> > > +# the OpenSSL library must be patched (openssl-0.9.9-session-
> > > ticket.patch)
> > > +# to add the needed functions.
> > > +#CONFIG_EAP_FAST=3Dy
> > > +
> > > +# Wi-Fi Protected Setup (WPS)
> > > +CONFIG_WPS=3Dy
> > > +# Enable WSC 2.0 support
> > > +CONFIG_WPS2=3Dy
> > > +# Enable UPnP support for external WPS Registrars
> CONFIG_WPS_UPNP=3Dy
> > > +
> > > +# EAP-IKEv2
> > > +#CONFIG_EAP_IKEV2=3Dy
> > > +
> > > +# Trusted Network Connect (EAP-TNC) #CONFIG_EAP_TNC=3Dy
> > > +
> > > +# PKCS#12 (PFX) support (used to read private key and
> > > certificate file from
> > > +# a file that usually has extension .p12 or .pfx) CONFIG_PKCS12=3Dy
> > > +
> > > +# RADIUS authentication server. This provides access to the
> > > integrated EAP
> > > +# server from external hosts using RADIUS.
> > > +#CONFIG_RADIUS_SERVER=3Dy
> > > +
> > > +# Build IPv6 support for RADIUS operations CONFIG_IPV6=3Dy
> > > +
> > > +# IEEE Std 802.11r-2008 (Fast BSS Transition) #CONFIG_IEEE80211R=3Dy
> > > +
> > > +# Use the hostapd's IEEE 802.11 authentication (ACL), but
> > > without
> > > +# the IEEE 802.11 Management capability (e.g., madwifi or
> > > FreeBSD/net80211)
> > > +#CONFIG_DRIVER_RADIUS_ACL=3Dy
> > > +
> > > +# IEEE 802.11n (High Throughput) support CONFIG_IEEE80211N=3Dy
> > > +
> > > +# Remove debugging code that is printing out debug messages to
> > > stdout.
> > > +# This can be used to reduce the size of the hostapd
> > > considerably if debugging
> > > +# code is not needed.
> > > +#CONFIG_NO_STDOUT_DEBUG=3Dy
> > > +
> > > +# Remove support for RADIUS accounting #CONFIG_NO_ACCOUNTING=3Dy
> > > +
> > > +# Remove support for RADIUS
> > > +#CONFIG_NO_RADIUS=3Dy
> > > +
> > > +# Remove support for VLANs
> > > +#CONFIG_NO_VLAN=3Dy
> > > +
> > > +# Remove support for dumping state into a file on SIGUSR1 signal #
> > > +This can be used to reduce binary size at the cost of
> > > disabling a debugging
> > > +# option.
> > > +#CONFIG_NO_DUMP_STATE=3Dy
> > > +
> > > +# Enable tracing code for developer debugging # This tracks use of
> > > +memory allocations and other registrations
> > > and reports
> > > +# incorrect use with a backtrace of call (or allocation)
> > > location.
> > > +#CONFIG_WPA_TRACE=3Dy
> > > +# For BSD, comment out these.
> > > +#LIBS +=3D -lexecinfo
> > > +#LIBS_p +=3D -lexecinfo
> > > +#LIBS_c +=3D -lexecinfo
> > > +
> > > +# Use libbfd to get more details for developer debugging # This
> > > +enables use of libbfd to get more detailed symbols for
> > > the backtraces
> > > +# generated by CONFIG_WPA_TRACE=3Dy.
> > > +#CONFIG_WPA_TRACE_BFD=3Dy
> > > +# For BSD, comment out these.
> > > +#LIBS +=3D -lbfd -liberty -lz
> > > +#LIBS_p +=3D -lbfd -liberty -lz
> > > +#LIBS_c +=3D -lbfd -liberty -lz
> > > +#
> > > +#
> > > +
> > > +CONFIG_NO_RANDOM_POOL=3Dy
> > > +
> >
> > I just eye-balled this here but the config looks the same as the
> > config used in the hostap-daemon recipe.  Same with the init file
> > below.  So then maybe the better way to do this is to add the
> > hostap-daemon directory to the FILESEXTRAPATHS.  i.e. like:
> >
> > FILESEXTRAPATHS_append :=3D "${THISDIR}/hostap-daemon:"
> >
> > I think the above line should work.  Then you do not need to add this
> > config and init files.
> >
> > > diff --git a/meta-arago-extras/recipes-
> > > connectivity/hostap/hostap-daemon-wl18xx/init b/meta-arago-
> > > extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/init
> > > new file mode 100644
> > > index 0000000..79f74b6
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-
> > > daemon-wl18xx/init
> > > @@ -0,0 +1,37 @@
> > > +#!/bin/sh
> > > +DAEMON=3D/usr/sbin/hostapd
> > > +NAME=3Dhostapd
> > > +DESC=3D"HOSTAP Daemon"
> > > +ARGS=3D"/etc/hostapd.conf -B"
> > > +
> > > +test -f $DAEMON || exit 0
> > > +
> > > +set -e
> > > +
> > > +case "$1" in
> > > +    start)
> > > +	echo -n "Starting $DESC: "
> > > +	start-stop-daemon -S -x $DAEMON -- $ARGS
> > > +	echo "$NAME."
> > > +	;;
> > > +    stop)
> > > +	echo -n "Stopping $DESC: "
> > > +	start-stop-daemon -K -x $DAEMON
> > > +	echo "$NAME."
> > > +	;;
> > > +    restart)
> > > +	$0 stop
> > > +	$0 start
> > > +	;;
> > > +    reload)
> > > +	echo -n "Reloading $DESC: "
> > > +	killall -HUP $(basename ${DAEMON})
> > > +	echo "$NAME."
> > > +	;;
> > > +    *)
> > > +	echo "Usage: $0 {start|stop|restart|reload}"
> > > +	exit 1
> > > +	;;
> > > +esac
> > > +
> > > +exit 0
> > > diff --git a/meta-arago-extras/recipes-
> > > connectivity/hostap/hostap-daemon-wl18xx_git.bb b/meta-arago-
> > > extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_git.bb
> >
> > Same question about using the _git version.
> >
> > > new file mode 100644
> > > index 0000000..6d1d5eb
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-
> > > daemon-wl18xx_git.bb
> > > @@ -0,0 +1,64 @@
> > > +# This is a TI specific version of the hostap-daemon recipe for
> > > use with the
> > > +# wl18xx wlan and bluetooth module.
> > > +
> > > +HOMEPAGE =3D "http://hostap.epitest.fi"
> > > +DESCRIPTION =3D "User space daemon for extended IEEE 802.11
> > > management"
> > > +SECTION =3D "kernel/userland"
> > > +LICENSE =3D "GPLv2"
> > > +LIC_FILES_CHKSUM =3D
> > > "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e"
> > > +
> > > +DEPENDS =3D "libnl openssl"
> > > +
> > > +# Since this is a TI customized version of hostap-daemon do not
> > > make this the
> > > +# default
> > > +DEFAULT_PREFERENCE =3D "-1"
> > > +
> > > +inherit update-rc.d
> > > +INITSCRIPT_NAME=3D"hostapd"
> > > +
> > > +CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
> > > +
> > > +# Add TI to the end to make it clear that this is a TI
> > > customized version
> > > +# of hostap
> > > +PV =3D "2.0-devel-ti"
> > > +
> > > +PR =3D "r1+gitr${SRCREV}"
> > > +
> > > +SRCREV =3D "ol_r8.a6.01"
> > > +
> > > +PROVIDES +=3D "hostap-daemon"
> > > +RPROVIDES +=3D "hostap-daemon"
> >
> > If you are using a variable to select between the two versions then
> > why set the PROVIDES and RPROVIDES name?  You are already setting the
> > packagegroups, etc to use hostap-daemon-wl18xx.  Have you tested that
> > this does become the default wl6 version as well?  Although, the PV
> is
> > set to the same between both versions which seems wrong.
>=20
> If this package completely replaces the original hostap-daemon and they
> cannot be installed side by side, then the correct way is to add
> RPROVIDES, RREPLACES, RCONFLICTS and chose one or another with
> PREFERRED_PROVIDER.
>=20

OK, I will add this. Your comment in this case is true for the other recipe=
s as well.
=20

Regards,
Best Eyal

