Return-Path: <r-monk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BB14352A1B
	for <meta-arago@arago-project.org>;
	Fri, 18 Oct 2013 13:47:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9IDl3Kv026847
	for <meta-arago@arago-project.org>; Fri, 18 Oct 2013 08:47:03 -0500
Received: from DNCE70.ent.ti.com (dnce70.ent.ti.com [137.167.131.19])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9IDl2ZI021929
	for <meta-arago@arago-project.org>; Fri, 18 Oct 2013 08:47:03 -0500
Received: from DNCE05.ent.ti.com ([fe80::5dc0:6ff5:718e:785a]) by
	DNCE70.ent.ti.com ([fe80::78db:4901:78e8:69bb%20]) with mapi id
	14.02.0342.003; Fri, 18 Oct 2013 15:47:02 +0200
From: "Monk, Roger" <r-monk@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCHv2 04/11]
	ti-connectivity/wpa-supplicant-wl18xx:	Add Wilink8 r8.a7.02
Thread-Index: AQHOxcnyMpLSqDj+W0Sp/nboUFp0Mpnt6LsAgAt70ACAAR9zoA==
Date: Fri, 18 Oct 2013 13:47:01 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240C013FA3@DNCE05.ent.ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
	<1381420942-16810-5-git-send-email-r-monk@ti.com>
	<7D46E86EC0A8354091174257B2FED1015979BA46@DLEE11.ent.ti.com>
	<20131017223255.GI30989@edge>
In-Reply-To: <20131017223255.GI30989@edge>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv2 04/11] ti-connectivity/wpa-supplicant-wl18xx:	Add Wilink8 r8.a7.02
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
X-List-Received-Date: Fri, 18 Oct 2013 13:47:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2013 at 23:32:56, Dmytriyenko, Denys wrote:
> Subject: Re: [meta-arago] [PATCHv2 04/11]=20
> ti-connectivity/wpa-supplicant-
> wl18xx: Add Wilink8 r8.a7.02
>=20
> Ping.

Thanks.  Based on the good feedback from Franklin/Chase, I'll rework the in=
cludes a bit and resubmit. =20

>=20
>=20
> On Thu, Oct 10, 2013 at 03:10:56PM +0000, Maupin, Chase wrote:
> >
> >
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> > >bounces@arago-project.org] On Behalf Of Monk, Roger
> > >Sent: Thursday, October 10, 2013 11:02 AM
> > >To: meta-arago@arago-project.org
> > >Subject: [meta-arago] [PATCHv2 04/11] ti-connectivity/wpa-
> > >supplicant-wl18xx: Add Wilink8 r8.a7.02
> > >
> > >   * Add v r8.a7.02 engineering release wpa supplicant
> > >   * This release supports the omap-a15 devices (omap5-evm/dra7-
> > >evm) with ES 2.1 WL8
> > >      * OMAP5432 UEVMs with the following SKU contain ES2.1
> > >Wilink8 TDK 18xx module
> > >      * OMAP5432x-xx-x1-xx
> > >   * Bump PR
> > >   * Replace defconfig with original wpa-supplicant defconfig
> > >   * Add back SDK specific defconfig changes
> > >   * Enable WFD (WiFi Display)
> > >   * Revert some android patches which prevent WFD
> > >
> > >Signed-off-by: Roger Monk <r-monk@ti.com>
> > >---
> > > ...0001-revert-android-patches-to-enable-wfd.patch |   44 ++++++
> > > .../defconfig                                      |  150
> > >+++++++++++++++-----
> > > ....a6.01.bb =3D> wpa-supplicant-wl18xx_r8.a7.02.bb} |   11 +-
> > > 3 files changed, 166 insertions(+), 39 deletions(-)  create mode
> > >100644 meta-arago-extras/recipes-connectivity/wpa-
> > >supplicant/wpa-supplicant-wl18xx-r8.a7.02/0001-revert-android-
> > >patches-to-enable-wfd.patch
> > > copy meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-
> > >supplicant-r5.sp4.01 =3D> wpa-supplicant-wl18xx-r8.a7.02}/defconfig
> > >(74%)
> > > mode change 100755 =3D> 100644
> > > copy meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-
> > >supplicant-wl18xx_r8.a6.01.bb =3D> wpa-supplicant-=20
> > >wl18xx_r8.a7.02.bb}
> > >(78%)
> > >
> > >diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > >supplicant/wpa-supplicant-wl18xx-r8.a7.02/0001-revert-android-
> > >patches-to-enable-wfd.patch b/meta-arago-extras/recipes-
> > >connectivity/wpa-supplicant/wpa-supplicant-wl18xx-r8.a7.02/0001-
> > >revert-android-patches-to-enable-wfd.patch
> > >new file mode 100644
> > >index 0000000..29528b4
> > >--- /dev/null
> > >+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > >supplicant-wl18xx-r8.a7.02/0001-revert-android-patches-to-enable-
> > >wfd.patch
> > >@@ -0,0 +1,44 @@
> > >+
> > >+diff -rupN a/src/common/wpa_ctrl.c b/src/common/wpa_ctrl.c
> > >+--- a/src/common/wpa_ctrl.c	2013-09-02 16:46:22.708023057 +0100
> > >++++ b/src/common/wpa_ctrl.c	2013-08-30 10:22:19.811255355 +0100
> > >+@@ -164,6 +164,10 @@ try_again:
> > >+ 		return NULL;
> > >+ 	}
> > >+
> > >++#if 0
> > >++//IH this code is introduced in recent supplicant that appears
> > >to make RMD app calls to wpa_ctrl_recv() fail and
> > >++// the supplicant fails to write to the same socket!!!
> > >++// Temp fix to remove it, probably solution will be in app set
> > >up/usage??
> > >+ 	/*
> > >+ 	 * Make socket non-blocking so that we don't hang forever if
> > >+ 	 * target dies unexpectedly.
> > >+@@ -176,7 +180,7 @@ try_again:
> > >+ 			/* Not fatal, continue on.*/
> > >+ 		}
> > >+ 	}
> > >+-
> > >++#endif
> > >+ 	return ctrl;
> > >+ }
> > >+
> > >+diff -rupN a/wpa_supplicant/wpa_supplicant.c
> > >b/wpa_supplicant/wpa_supplicant.c
> > >+--- a/wpa_supplicant/wpa_supplicant.c	2013-09-04
> > >16:57:26.000000000 +0100
> > >++++ b/wpa_supplicant/wpa_supplicant.c	2013-09-04
> > >17:02:02.256720695 +0100
> > >+@@ -3025,13 +3025,15 @@ next_driver:
> > >+ 	}
> > >+
> > >+ #ifdef CONFIG_P2P
> > >++ #ifdef ANDROID
> > >+ 	if (os_strncmp(iface->ifname, "wlan0", 4) =3D=3D 0) {
> > >+ 		wpa_printf(MSG_DEBUG, "Disable P2P on wlan0");
> > >+ 		wpa_s->conf->p2p_disabled =3D 1;
> > >+ 	}
> > >+
> > >+ 	if (os_strncmp(iface->ifname, "p2p0", 4) =3D=3D 0)
> > >+-		if (wpas_p2p_init(wpa_s->global, wpa_s) < 0) {
> > >++#endif
> > >++	    if (wpas_p2p_init(wpa_s->global, wpa_s) < 0) {
> > >+ 			wpa_msg(wpa_s, MSG_ERROR, "Failed to init P2P");
> > >+ 			return -1;
> > >+ 		}
> > >diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > >supplicant/wpa-supplicant-r5.sp4.01/defconfig b/meta-arago-
> > >extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx-
> > >r8.a7.02/defconfig
> > >old mode 100755
> > >new mode 100644
> > >similarity index 74%
> > >copy from meta-arago-extras/recipes-connectivity/wpa-
> > >supplicant/wpa-supplicant-r5.sp4.01/defconfig
> > >copy to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > >supplicant-wl18xx-r8.a7.02/defconfig
> > >index b982e2a..80d2f63
> > >--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > >supplicant-r5.sp4.01/defconfig
> > >+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > >supplicant-wl18xx-r8.a7.02/defconfig
> > >@@ -39,18 +39,6 @@
> > > #LIBS =3D -lssl
> > >
> >
> >###############################################################
> ###
> > >#############
> > >
> > >-#CC=3D$(CROSS_COMPILE)gcc
> > >-#CFLAGS +=3D -DCONFIG_LIBNL20
> > >-#CPPFLAGS +=3D -DCONFIG_LIBNL20
> > >-#LIBS +=3D -L$(NFSROOT)/lib -lnl
> > >-#LIBS_p +=3D -L$(NFSROOT)/lib
> > >-#LIBDIR =3D $(NFSROOT)/lib
> > >-#BINDIR =3D $(NFSROOT)/usr/sbin
> > >-
> > >-CONFIG_WAPI=3Dy
> > >-CONFIG_LIBNL20=3Dy
> > >-NEED_BGSCAN=3Dy
> > >-CONFIG_BGSCAN_LEARN=3Dy
> > >
> > > # Driver interface for Host AP driver  #CONFIG_DRIVER_HOSTAP=3Dy @@
> > >-75,7 +63,7 @@ CONFIG_BGSCAN_LEARN=3Dy  #CONFIG_DRIVER_ATMEL=3Dy
> > >
> > > # Driver interface for old Broadcom driver -# Please note that the=20
> > >newer Broadcom driver ("hybrid Linux
> > >driver") supportsBG
> > >+# Please note that the newer Broadcom driver ("hybrid Linux
> > >driver") supports
> > > # Linux wireless extensions and does not need (or even work) with=20
> > >the old  # driver wrapper. Use CONFIG_DRIVER_WEXT=3Dy with that driver=
.
> > > #CONFIG_DRIVER_BROADCOM=3Dy
> > >@@ -90,16 +78,22 @@ CONFIG_BGSCAN_LEARN=3Dy
> #CONFIG_DRIVER_RALINK=3Dy
> > >
> > > # Driver interface for generic Linux wireless extensions
> > >+# Note: WEXT is deprecated in the current Linux kernel version
> > >and no new
> > >+# functionality is added to it. nl80211-based interface is the
> > >new
> > >+# replacement for WEXT and its use allows wpa_supplicant to
> > >properly control
> > >+# the driver to improve existing functionality like roaming and
> > >to support new
> > >+# functionality.
> > > CONFIG_DRIVER_WEXT=3Dy
> > >
> > > # Driver interface for Linux drivers using the nl80211 kernel=20
> > >interface  CONFIG_DRIVER_NL80211=3Dy
> > >+CONFIG_LIBNL20=3Dy
> > >
> > > # Driver interface for FreeBSD net80211 layer (e.g., Atheros
> > >driver)
> > > #CONFIG_DRIVER_BSD=3Dy
> > > #CFLAGS +=3D -I/usr/local/include
> > > #LIBS +=3D -L/usr/local/lib
> > >-#LIBS_p +=3D -L/usr/local/libBG
> > >+#LIBS_p +=3D -L/usr/local/lib
> > > #LIBS_c +=3D -L/usr/local/lib
> > >
> > > # Driver interface for Windows NDIS @@ -121,11 +115,6 @@=20
> > >CONFIG_DRIVER_NL80211=3Dy  # Driver interface
> for
> > >development testing  #CONFIG_DRIVER_TEST=3Dy
> > >
> > >-# Include client MLME (management frame processing) for test=20
> > >driver -# This can be used to test MLME operations in hostapd with=20
> > >the test interface.
> > >-# space.
> > >-#CONFIG_CLIENT_MLME=3Dy
> > >-
> > > # Driver interface for wired Ethernet drivers =20
> > >CONFIG_DRIVER_WIRED=3Dy
> > >
> > >@@ -177,6 +166,9 @@ CONFIG_EAP_OTP=3Dy  # EAP-PSK (experimental; this=
=20
> > >is _not_ needed for WPA-PSK) #CONFIG_EAP_PSK=3Dy
> > >
> > >+# EAP-pwd (secure authentication using only a password)=20
> > >+#CONFIG_EAP_PWD=3Dy
> > >+
> > > # EAP-PAX
> > > #CONFIG_EAP_PAX=3Dy
> > >
> > >@@ -208,6 +200,11 @@ CONFIG_EAP_LEAP=3Dy  CONFIG_WPS=3Dy  # Enable
> WSC
> > >2.0 support  CONFIG_WPS2=3Dy
> > >+# Enable WPS external registrar functionality #CONFIG_WPS_ER=3Dy #=20
> > >+Disable credentials for an open network by default when acting
> > >as a WPS
> > >+# registrar.
> > >+#CONFIG_WPS_REG_DISABLE_OPEN=3Dy
> > >
> > > # EAP-IKEv2
> > > #CONFIG_EAP_IKEV2=3Dy
> > >@@ -224,7 +221,10 @@ CONFIG_SMARTCARD=3Dy  # Enable this if EAP-SIM
> or
> > >EAP-AKA is included  #CONFIG_PCSC=3Dy
> > >
> > >-# Development testingBG
> > >+# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)=20
> > >+#CONFIG_HT_OVERRIDES=3Dy
> > >+
> > >+# Development testing
> > > #CONFIG_EAPOL_TEST=3Dy
> > >
> > > # Select control interface backend for external programs, e.g,
> > >wpa_cli:
> > >@@ -242,6 +242,10 @@ CONFIG_CTRL_IFACE=3Dy  # the resulting binary.
> > > #CONFIG_READLINE=3Dy
> > >
> > >+# Include internal line edit mode in wpa_cli. This can be used as
> > >a replacement
> > >+# for GNU Readline to provide limited command line editing and
> > >history support.
> > >+#CONFIG_WPA_CLI_EDIT=3Dy
> > >+
> > > # Remove debugging code that is printing out debug message to=20
> > >stdout.
> > > # This can be used to reduce the size of the wpa_supplicant=20
> > >considerably  # if debugging code is not needed. The size reduction=20
> > >can be around 35% @@ -295,13 +299,16 @@ CONFIG_BACKEND=3Dfile  # unix
> =3D
> > >UNIX/POSIX like systems (default)  # win32 =3D Windows systems  #=20
> > >none =3D Empty template -#CONFIG_OS=3Dunix
> > >+CONFIG_OS=3Dunix
> > >
> > > # Select event loop implementation  # eloop =3D select() loop=20
> > >(default)  # eloop_win =3D Windows events and WaitForMultipleObject()=
=20
> > >loop  # eloop_none =3D Empty template -#CONFIG_ELOOP=3Deloop
> > >+CONFIG_ELOOP=3Deloop
> > >+
> > >+# Should we use poll instead of select? Select is used by
> > >default.
> > >+#CONFIG_ELOOP_POLL=3Dy
> > >
> > > # Select layer 2 packet implementation  # linux =3D Linux packet=20
> > >socket (default) @@ -310,7 +317,7 @@ CONFIG_BACKEND=3Dfile  # winpcap=
=20
> > >=3D WinPcap with receive thread  # ndis =3D Windows NDISUIO (note:=20
> > >requires
> > >CONFIG_USE_NDISUIO=3Dy)  # none =3D Empty template=20
> > >-#CONFIG_L2_PACKET=3Dlinux
> > >+CONFIG_L2_PACKET=3Dlinux
> > >
> > > # PeerKey handshake for Station to Station Link (IEEE 802.11e
> > >DLS)
> > > CONFIG_PEERKEY=3Dy
> > >@@ -323,18 +330,24 @@ CONFIG_PEERKEY=3Dy
> > >
> > > # Select TLS implementation
> > > # openssl =3D OpenSSL (default)
> > >-# gnutls =3D GnuTLS (needed for TLS/IA, see also
> > >CONFIG_GNUTLS_EXTRA)
> > >+# gnutls =3D GnuTLS
> > > # internal =3D Internal TLSv1 implementation (experimental) # none =
=3D=20
> > > Empty template #CONFIG_TLS=3Dopenssl
> > >
> > >-# Whether to enable TLS/IA support, which is required for EAP-=20
> > >TTLSv1.
> > >-# You need CONFIG_TLS=3Dgnutls for this to have any effect. Please=20
> > >note that -# even though the core GnuTLS library is released under=20
> > >LGPL, this extra -# library uses GPL and as such, the terms of GPL=20
> > >apply to the combination -# of wpa_supplicant and GnuTLS if this=20
> > >option is enabled. BSD license may not -# apply for distribution of=20
> > >the resulting binary.
> > >-#CONFIG_GNUTLS_EXTRA=3Dy
> > >+# TLS-based EAP methods require at least TLS v1.0. Newer version
> > >of TLS (v1.1)
> > >+# can be enabled to get a stronger construction of messages when
> > >block ciphers
> > >+# are used. It should be noted that some existing TLS v1.0 -based=20
> > >+# implementation may not be compatible with TLS v1.1 message
> > >(ClientHello is
> > >+# sent prior to negotiating which version will be used)=20
> > >+#CONFIG_TLSV11=3Dy
> > >+
> > >+# TLS-based EAP methods require at least TLS v1.0. Newer version
> > >of TLS (v1.2)
> > >+# can be enabled to enable use of stronger crypto algorithms. It
> > >should be
> > >+# noted that some existing TLS v1.0 -based implementation may not
> > >be compatible
> > >+# with TLS v1.2 message (ClientHello is sent prior to negotiating
> > >which version
> > >+# will be used)
> > >+#CONFIG_TLSV12=3Dy
> > >
> > > # If CONFIG_TLS=3Dinternal is used, additional library and include=20
> > >paths are  # needed for LibTomMath. Alternatively, an integrated,=20
> > >minimal version of @@ -396,6 +409,21 @@=20
> > >CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy  # Add support for writing debug log=
=20
> > >to a file
> > >(/tmp/wpa_supplicant-log-#.txt)
> > > CONFIG_DEBUG_FILE=3Dy
> > >
> > >+# Send debug messages to syslog instead of stdout=20
> > >+#CONFIG_DEBUG_SYSLOG=3Dy # Set syslog facility for debug messages=20
> > >+#CONFIG_DEBUG_SYSLOG_FACILITY=3DLOG_DAEMON
> > >+
> > >+# Add support for sending all debug messages (regardless of debug
> > >verbosity)
> > >+# to the Linux kernel tracing facility. This helps debug the
> > >entire stack by
> > >+# making it easy to record everything happening from the driver
> > >up into the
> > >+# same file, e.g., using trace-cmd.
> > >+#CONFIG_DEBUG_LINUX_TRACING=3Dy
> > >+
> > >+# Add support for writing debug log to Android logcat instead of
> > >standard
> > >+# output
> > >+#CONFIG_ANDROID_LOG=3Dy
> > >+
> > > # Enable privilege separation (see README 'Privilege separation'
> > >for details)
> > > #CONFIG_PRIVSEP=3Dy
> > >
> > >@@ -407,7 +435,7 @@ CONFIG_DEBUG_FILE=3Dy  # This tracks use of
> memory
> > >allocations and other registrations and reports  # incorrect use=20
> > >with a backtrace of call (or allocation) location.
> > > #CONFIG_WPA_TRACE=3Dy
> > >-# For BSD, comment out these.
> > >+# For BSD, uncomment these.
> > > #LIBS +=3D -lexecinfo
> > > #LIBS_p +=3D -lexecinfo
> > > #LIBS_c +=3D -lexecinfo
> > >@@ -416,15 +444,65 @@ CONFIG_DEBUG_FILE=3Dy  # This enables use of=20
> > >libbfd to get more detailed symbols for the backtraces  # generated=20
> > >by CONFIG_WPA_TRACE=3Dy.
> > > #CONFIG_WPA_TRACE_BFD=3Dy
> > >-# For BSD, comment out these.
> > >+# For BSD, uncomment these.
> > > #LIBS +=3D -lbfd -liberty -lz
> > > #LIBS_p +=3D -lbfd -liberty -lz
> > > #LIBS_c +=3D -lbfd -liberty -lz
> > >
> > >-# for p2p
> > >+# wpa_supplicant depends on strong random number generation being
> > >available
> > >+# from the operating system. os_get_random() function is used to
> > >fetch random
> > >+# data when needed, e.g., for key generation. On Linux and BSD
> > >systems, this
> > >+# works by reading /dev/urandom. It should be noted that the OS
> > >entropy pool
> > >+# needs to be properly initialized before wpa_supplicant is
> > >started. This is
> > >+# important especially on embedded devices that do not have a
> > >hardware random
> > >+# number generator and may by default start up with minimal
> > >entropy available
> > >+# for random number generation.
> > >+#
> > >+# As a safety net, wpa_supplicant is by default trying to
> > >internally collect
> > >+# additional entropy for generating random data to mix in with
> > >the data fetched
> > >+# from the OS. This by itself is not considered to be very
> > >strong, but it may
> > >+# help in cases where the system pool is not initialized
> > >properly. However, it
> > >+# is very strongly recommended that the system pool is
> > >initialized with enough
> > >+# entropy either by using hardware assisted random number
> > >generator or by
> > >+# storing state over device reboots.
> > >+#
> > >+# wpa_supplicant can be configured to maintain its own entropy
> > >store over
> > >+# restarts to enhance random number generation. This is not
> > >perfect, but it is
> > >+# much more secure than using the same sequence of random numbers
> > >after every
> > >+# reboot. This can be enabled with -e<entropy file> command line
> > >option. The
> > >+# specified file needs to be readable and writable by
> > >wpa_supplicant.
> > >+#
> > >+# If the os_get_random() is known to provide strong random data
> > >(e.g., on
> > >+# Linux/BSD, the board in question is known to have reliable
> > >source of random
> > >+# data from /dev/urandom), the internal wpa_supplicant random
> > >pool can be
> > >+# disabled. This will save some in binary size and CPU use.
> > >However, this
> > >+# should only be considered for builds that are known to be used
> > >on devices
> > >+# that meet the requirements described above.
> > >+#CONFIG_NO_RANDOM_POOL=3Dy
> > >+
> > >+# IEEE 802.11n (High Throughput) support (mainly for AP mode)=20
> > >+CONFIG_IEEE80211N=3Dy
> > >+
> > >+# Interworking (IEEE 802.11u)
> > >+# This can be used to enable functionality to improve
> > >interworking with
> > >+# external networks (GAS/ANQP to learn more about the networks
> > >and network
> > >+# selection based on available credentials).
> > >+#CONFIG_INTERWORKING=3Dy
> > >+
> > >+# Hotspot 2.0
> > >+#CONFIG_HS20=3Dy
> > >+
> > >+# Disable roaming in wpa_supplicant #CONFIG_NO_ROAMING=3Dy
> > >+
> > >+# Enable P2P
> > > CONFIG_P2P=3Dy
> > > CONFIG_AP=3Dy
> > >
> > >-# IEEE 802.11n (High Throughput) support -CONFIG_IEEE80211N=3Dy
> > >+# bgscan
> > >+NEED_BGSCAN=3Dy
> > >+CONFIG_BGSCAN_LEARN=3Dy
> > >+CONFIG_BGSCAN_SIMPLE=3Dy
> > >
> > >+# Enable WIFI Display
> > >+CONFIG_WIFI_DISPLAY=3Dy
> > >\ No newline at end of file
> > >diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > >supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb b/meta-arago-
> > >extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > >wl18xx_r8.a7.02.bb
> > >similarity index 78%
> > >copy from meta-arago-extras/recipes-connectivity/wpa-
> > >supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb
> > >copy to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > >supplicant-wl18xx_r8.a7.02.bb
> > >index f6c4f70..0ea9ff5 100644
> > >--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > >supplicant-wl18xx_r8.a6.01.bb
> > >+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > >supplicant-wl18xx_r8.a7.02.bb
> > >@@ -10,9 +10,14 @@ LIC_FILES_CHKSUM =3D=20
> > >"file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e \
> > >
> > > FILESEXTRAPATHS_append :=3D "${THISDIR}/wpa-supplicant:"
> > >
> > >-# Tag: ol_r8.a6.01
> > >-SRCREV =3D "7190ff7dbd43243290b626068ded0d61c5019050"
> > >-PR =3D "r2+gitr${SRCPV}"
> > >+COMPATIBLE_MACHINE =3D "(omap-a15)"
> > >+
> > >+# Tag: ol_r8.a7.02
> > >+SRCREV =3D "4dda294a5186f3efb437ae0898a6df71655843ef"
> > >+PR =3D "r4+gitr${SRCPV}"
> >
> > Why not reset the PR?  Is there no corresponding PV bump for this relea=
se?
> >
> > >+
> > >+SRC_URI +=3D "file://0001-revert-android-patches-to-enable-
> > >wfd.patch;patchdir=3D.. \
> > >+"
> > >
> > > # Add ti to the PV to indicate that this is a TI modify version of=20
> > >wpa-supplicant.
> > > PV =3D "2.0-devel-ti"
> > >--
> > >1.7.9.5
> > >
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago



