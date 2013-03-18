Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 5CCA852961
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 15:54:04 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV00HZ65HIYHR0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 18 Mar 2013 10:53:53 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8718F20031; Mon,
	18 Mar 2013 11:53:42 -0400 (EDT)
Date: Mon, 18 Mar 2013 11:53:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20130318155342.GC14761@denix.org>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
	<1363613762-6537-3-git-send-email-eyalr@ti.com>
	<7D46E86EC0A8354091174257B2FED10159480E8A@DLEE11.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED10159480E8A@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Mon, 18 Mar 2013 15:54:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 18, 2013 at 03:46:42PM +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Eyal Reizer
> > Sent: Monday, March 18, 2013 8:36 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 3/9] hostap-daemon-wl18xx: hostap-
> > daemon for ti wilink8 release
> > 
> > From: Eyal Reizer <eyalr@ti.com>
> > 
> > Add a new recipe for building the ti version of hostap-daemon
> > 2.0-devel from release r8.a6.01
> > 
> > This package replace the wilink6 package which is provided by the
> > hostap-daemon recipe. Selection between the two is done using a
> > "WILINK_VERSION" switch added to arago.conf
> > 
> > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > ---
> >  ...d-change-conf-file-for-better-oob-startup.patch |   40 +++++
> >  .../hostap/hostap-daemon-wl18xx/defconfig          |  183
> > ++++++++++++++++++++
> >  .../hostap/hostap-daemon-wl18xx/init               |   37 ++++
> >  .../hostap/hostap-daemon-wl18xx_git.bb             |   64
> > +++++++
> >  4 files changed, 324 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-
> > conf-file-for-better-oob-startup.patch
> >  create mode 100644 meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon-wl18xx/defconfig
> >  create mode 100644 meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon-wl18xx/init
> >  create mode 100644 meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon-wl18xx_git.bb
> > 
> > diff --git a/meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-
> > conf-file-for-better-oob-startup.patch b/meta-arago-
> > extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-
> > hostapd-change-conf-file-for-better-oob-startup.patch
> > new file mode 100644
> > index 0000000..824d250
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-
> > daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-
> > startup.patch
> > @@ -0,0 +1,40 @@
> > +From f7c1b9d4e18dc650dd0b9da97a91f27f6a4bb5b7 Mon Sep 17
> > 00:00:00 2001
> > +From: Eyal Reizer <eyalr@ti.com>
> > +Date: Sun, 17 Mar 2013 07:18:55 -0700
> > +Subject: [PATCH] hostapd: change conf file for better sdk out of
> > box startup
> > +
> > +Change the default channel to 6 and change the ssid to a more
> > +meaningful name.
> > +
> > +Upstream-status: inappropriate [SDK specific patch]
> > +
> > +Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > +---
> > + hostapd/hostapd.conf |    4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
> > +index f71a881..00843aa 100644
> > +--- a/hostapd/hostapd.conf
> > ++++ b/hostapd/hostapd.conf
> > +@@ -83,7 +83,7 @@ ctrl_interface_group=0
> > + ##### IEEE 802.11 related configuration
> > #######################################
> > +
> > + # SSID to be used in IEEE 802.11 management frames
> > +-ssid=test
> > ++ssid=TexasInstruments_0001
> > +
> > + # Country code (ISO/IEC 3166-1). Used to set regulatory domain.
> > + # Set as needed to indicate country in which device is
> > operating.
> > +@@ -107,7 +107,7 @@ hw_mode=g
> > + # channel will need to be configured separately with iwconfig.
> > + # When set to 0, automatic channel selection will be engaged. A
> > channel
> > + # will be selected from the desired hw_mode.
> > +-channel=1
> > ++channel=6
> > +
> > + # Automatic channel selection (ACS) whitelist
> > + # (default: not set)
> > +--
> > +1.7.9.5
> > +
> > diff --git a/meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon-wl18xx/defconfig b/meta-arago-
> > extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/defconfig
> > new file mode 100644
> > index 0000000..1ea96c4
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-
> > daemon-wl18xx/defconfig
> > @@ -0,0 +1,183 @@
> > +# Example hostapd build time configuration
> > +#
> > +# This file lists the configuration options that are used when
> > building the
> > +# hostapd binary. All lines starting with # are ignored.
> > Configuration option
> > +# lines must be commented out complete, if they are not to be
> > included, i.e.,
> > +# just setting VARIABLE=n is not disabling that variable.
> > +#
> > +# This file is included in Makefile, so variables like CFLAGS
> > and LIBS can also
> > +# be modified from here. In most cass, these lines should use +=
> > in order not
> > +# to override previous values of the variables.
> > +
> > +# Driver interface for Host AP driver
> > +CONFIG_DRIVER_HOSTAP=y
> > +
> > +# Driver interface for wired authenticator
> > +#CONFIG_DRIVER_WIRED=y
> > +
> > +# Driver interface for madwifi driver
> > +#CONFIG_DRIVER_MADWIFI=y
> > +#CFLAGS += -I../../madwifi # change to the madwifi source
> > directory
> > +
> > +# Driver interface for drivers using the nl80211 kernel
> > interface
> > +CONFIG_DRIVER_NL80211=y
> > +CONFIG_LIBNL20=y
> > +# driver_nl80211.c requires a rather new libnl (version 1.1)
> > which may not be
> > +# shipped with your distribution yet. If that is the case, you
> > need to build
> > +# newer libnl version and point the hostapd build to use it.
> > +#LIBNL=/usr/src/libnl
> > +#CFLAGS += -I$(LIBNL)/include
> > +#LIBS += -L$(LIBNL)/lib
> > +
> > +# Driver interface for FreeBSD net80211 layer (e.g., Atheros
> > driver)
> > +#CONFIG_DRIVER_BSD=y
> > +#CFLAGS += -I/usr/local/include
> > +#LIBS += -L/usr/local/lib
> > +#LIBS_p += -L/usr/local/lib
> > +#LIBS_c += -L/usr/local/lib
> > +
> > +# Driver interface for no driver (e.g., RADIUS server only)
> > +#CONFIG_DRIVER_NONE=y
> > +
> > +# IEEE 802.11F/IAPP
> > +CONFIG_IAPP=y
> > +
> > +# WPA2/IEEE 802.11i RSN pre-authentication
> > +CONFIG_RSN_PREAUTH=y
> > +
> > +# PeerKey handshake for Station to Station Link (IEEE 802.11e
> > DLS)
> > +CONFIG_PEERKEY=y
> > +
> > +# IEEE 802.11w (management frame protection)
> > +# This version is an experimental implementation based on IEEE
> > 802.11w/D1.0
> > +# draft and is subject to change since the standard has not yet
> > been finalized.
> > +# Driver support is also needed for IEEE 802.11w.
> > +#CONFIG_IEEE80211W=y
> > +
> > +# Integrated EAP server
> > +CONFIG_EAP=y
> > +
> > +# EAP-MD5 for the integrated EAP server
> > +CONFIG_EAP_MD5=y
> > +
> > +# EAP-TLS for the integrated EAP server
> > +CONFIG_EAP_TLS=y
> > +
> > +# EAP-MSCHAPv2 for the integrated EAP server
> > +CONFIG_EAP_MSCHAPV2=y
> > +
> > +# EAP-PEAP for the integrated EAP server
> > +CONFIG_EAP_PEAP=y
> > +
> > +# EAP-GTC for the integrated EAP server
> > +CONFIG_EAP_GTC=y
> > +
> > +# EAP-TTLS for the integrated EAP server
> > +CONFIG_EAP_TTLS=y
> > +
> > +# EAP-SIM for the integrated EAP server
> > +#CONFIG_EAP_SIM=y
> > +
> > +# EAP-AKA for the integrated EAP server
> > +#CONFIG_EAP_AKA=y
> > +
> > +# EAP-AKA' for the integrated EAP server
> > +# This requires CONFIG_EAP_AKA to be enabled, too.
> > +#CONFIG_EAP_AKA_PRIME=y
> > +
> > +# EAP-PAX for the integrated EAP server
> > +#CONFIG_EAP_PAX=y
> > +
> > +# EAP-PSK for the integrated EAP server (this is _not_ needed
> > for WPA-PSK)
> > +#CONFIG_EAP_PSK=y
> > +
> > +# EAP-SAKE for the integrated EAP server
> > +#CONFIG_EAP_SAKE=y
> > +
> > +# EAP-GPSK for the integrated EAP server
> > +#CONFIG_EAP_GPSK=y
> > +# Include support for optional SHA256 cipher suite in EAP-GPSK
> > +#CONFIG_EAP_GPSK_SHA256=y
> > +
> > +# EAP-FAST for the integrated EAP server
> > +# Note: Default OpenSSL package does not include support for all
> > the
> > +# functionality needed for EAP-FAST. If EAP-FAST is enabled with
> > OpenSSL,
> > +# the OpenSSL library must be patched (openssl-0.9.9-session-
> > ticket.patch)
> > +# to add the needed functions.
> > +#CONFIG_EAP_FAST=y
> > +
> > +# Wi-Fi Protected Setup (WPS)
> > +CONFIG_WPS=y
> > +# Enable WSC 2.0 support
> > +CONFIG_WPS2=y
> > +# Enable UPnP support for external WPS Registrars
> > +CONFIG_WPS_UPNP=y
> > +
> > +# EAP-IKEv2
> > +#CONFIG_EAP_IKEV2=y
> > +
> > +# Trusted Network Connect (EAP-TNC)
> > +#CONFIG_EAP_TNC=y
> > +
> > +# PKCS#12 (PFX) support (used to read private key and
> > certificate file from
> > +# a file that usually has extension .p12 or .pfx)
> > +CONFIG_PKCS12=y
> > +
> > +# RADIUS authentication server. This provides access to the
> > integrated EAP
> > +# server from external hosts using RADIUS.
> > +#CONFIG_RADIUS_SERVER=y
> > +
> > +# Build IPv6 support for RADIUS operations
> > +CONFIG_IPV6=y
> > +
> > +# IEEE Std 802.11r-2008 (Fast BSS Transition)
> > +#CONFIG_IEEE80211R=y
> > +
> > +# Use the hostapd's IEEE 802.11 authentication (ACL), but
> > without
> > +# the IEEE 802.11 Management capability (e.g., madwifi or
> > FreeBSD/net80211)
> > +#CONFIG_DRIVER_RADIUS_ACL=y
> > +
> > +# IEEE 802.11n (High Throughput) support
> > +CONFIG_IEEE80211N=y
> > +
> > +# Remove debugging code that is printing out debug messages to
> > stdout.
> > +# This can be used to reduce the size of the hostapd
> > considerably if debugging
> > +# code is not needed.
> > +#CONFIG_NO_STDOUT_DEBUG=y
> > +
> > +# Remove support for RADIUS accounting
> > +#CONFIG_NO_ACCOUNTING=y
> > +
> > +# Remove support for RADIUS
> > +#CONFIG_NO_RADIUS=y
> > +
> > +# Remove support for VLANs
> > +#CONFIG_NO_VLAN=y
> > +
> > +# Remove support for dumping state into a file on SIGUSR1 signal
> > +# This can be used to reduce binary size at the cost of
> > disabling a debugging
> > +# option.
> > +#CONFIG_NO_DUMP_STATE=y
> > +
> > +# Enable tracing code for developer debugging
> > +# This tracks use of memory allocations and other registrations
> > and reports
> > +# incorrect use with a backtrace of call (or allocation)
> > location.
> > +#CONFIG_WPA_TRACE=y
> > +# For BSD, comment out these.
> > +#LIBS += -lexecinfo
> > +#LIBS_p += -lexecinfo
> > +#LIBS_c += -lexecinfo
> > +
> > +# Use libbfd to get more details for developer debugging
> > +# This enables use of libbfd to get more detailed symbols for
> > the backtraces
> > +# generated by CONFIG_WPA_TRACE=y.
> > +#CONFIG_WPA_TRACE_BFD=y
> > +# For BSD, comment out these.
> > +#LIBS += -lbfd -liberty -lz
> > +#LIBS_p += -lbfd -liberty -lz
> > +#LIBS_c += -lbfd -liberty -lz
> > +#
> > +#
> > +
> > +CONFIG_NO_RANDOM_POOL=y
> > +
> 
> I just eye-balled this here but the config looks the same as the config used 
> in the hostap-daemon recipe.  Same with the init file below.  So then maybe 
> the better way to do this is to add the hostap-daemon directory to the 
> FILESEXTRAPATHS.  i.e. like:
> 
> FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
> 
> I think the above line should work.  Then you do not need to add this config 
> and init files.
> 
> > diff --git a/meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon-wl18xx/init b/meta-arago-
> > extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/init
> > new file mode 100644
> > index 0000000..79f74b6
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-
> > daemon-wl18xx/init
> > @@ -0,0 +1,37 @@
> > +#!/bin/sh
> > +DAEMON=/usr/sbin/hostapd
> > +NAME=hostapd
> > +DESC="HOSTAP Daemon"
> > +ARGS="/etc/hostapd.conf -B"
> > +
> > +test -f $DAEMON || exit 0
> > +
> > +set -e
> > +
> > +case "$1" in
> > +    start)
> > +	echo -n "Starting $DESC: "
> > +	start-stop-daemon -S -x $DAEMON -- $ARGS
> > +	echo "$NAME."
> > +	;;
> > +    stop)
> > +	echo -n "Stopping $DESC: "
> > +	start-stop-daemon -K -x $DAEMON
> > +	echo "$NAME."
> > +	;;
> > +    restart)
> > +	$0 stop
> > +	$0 start
> > +	;;
> > +    reload)
> > +	echo -n "Reloading $DESC: "
> > +	killall -HUP $(basename ${DAEMON})
> > +	echo "$NAME."
> > +	;;
> > +    *)
> > +	echo "Usage: $0 {start|stop|restart|reload}"
> > +	exit 1
> > +	;;
> > +esac
> > +
> > +exit 0
> > diff --git a/meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon-wl18xx_git.bb b/meta-arago-
> > extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_git.bb
> 
> Same question about using the _git version.
> 
> > new file mode 100644
> > index 0000000..6d1d5eb
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-
> > daemon-wl18xx_git.bb
> > @@ -0,0 +1,64 @@
> > +# This is a TI specific version of the hostap-daemon recipe for
> > use with the
> > +# wl18xx wlan and bluetooth module.
> > +
> > +HOMEPAGE = "http://hostap.epitest.fi"
> > +DESCRIPTION = "User space daemon for extended IEEE 802.11
> > management"
> > +SECTION = "kernel/userland"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM =
> > "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
> > +
> > +DEPENDS = "libnl openssl"
> > +
> > +# Since this is a TI customized version of hostap-daemon do not
> > make this the
> > +# default
> > +DEFAULT_PREFERENCE = "-1"
> > +
> > +inherit update-rc.d
> > +INITSCRIPT_NAME="hostapd"
> > +
> > +CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
> > +
> > +# Add TI to the end to make it clear that this is a TI
> > customized version
> > +# of hostap
> > +PV = "2.0-devel-ti"
> > +
> > +PR = "r1+gitr${SRCREV}"
> > +
> > +SRCREV = "ol_r8.a6.01"
> > +
> > +PROVIDES += "hostap-daemon"
> > +RPROVIDES += "hostap-daemon"
> 
> If you are using a variable to select between the two versions then why set 
> the PROVIDES and RPROVIDES name?  You are already setting the packagegroups, 
> etc to use hostap-daemon-wl18xx.  Have you tested that this does become the 
> default wl6 version as well?  Although, the PV is set to the same between 
> both versions which seems wrong.

If this package completely replaces the original hostap-daemon and they cannot 
be installed side by side, then the correct way is to add RPROVIDES, 
RREPLACES, RCONFLICTS and chose one or another with PREFERRED_PROVIDER.

-- 
Denys

