Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTP id 02B8A52972
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 06:41:44 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MW500GAF19DCX30@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 12 Nov 2013 00:41:43 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A01892008E; Tue,
	12 Nov 2013 01:41:37 -0500 (EST)
Date: Tue, 12 Nov 2013 01:41:37 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Monk, Roger" <r-monk@ti.com>
Message-id: <20131112064137.GJ24766@denix.org>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
	<1381420942-16810-5-git-send-email-r-monk@ti.com>
	<7D46E86EC0A8354091174257B2FED1015979BA46@DLEE11.ent.ti.com>
	<20131017223255.GI30989@edge>
	<4C82F39BABFE6A429733A300DEBF52240C013FA3@DNCE05.ent.ti.com>
MIME-version: 1.0
In-reply-to: <4C82F39BABFE6A429733A300DEBF52240C013FA3@DNCE05.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Tue, 12 Nov 2013 06:41:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 18, 2013 at 01:47:01PM +0000, Monk, Roger wrote:
> On Thu, Oct 17, 2013 at 23:32:56, Dmytriyenko, Denys wrote:
> > Subject: Re: [meta-arago] [PATCHv2 04/11] 
> > ti-connectivity/wpa-supplicant-
> > wl18xx: Add Wilink8 r8.a7.02
> > 
> > Ping.
> 
> Thanks.  Based on the good feedback from Franklin/Chase, I'll rework the includes a bit and resubmit.  

Roger,

Ping on this one. Thanks.


> > On Thu, Oct 10, 2013 at 03:10:56PM +0000, Maupin, Chase wrote:
> > >
> > >
> > > >-----Original Message-----
> > > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago- 
> > > >bounces@arago-project.org] On Behalf Of Monk, Roger
> > > >Sent: Thursday, October 10, 2013 11:02 AM
> > > >To: meta-arago@arago-project.org
> > > >Subject: [meta-arago] [PATCHv2 04/11] ti-connectivity/wpa-
> > > >supplicant-wl18xx: Add Wilink8 r8.a7.02
> > > >
> > > >   * Add v r8.a7.02 engineering release wpa supplicant
> > > >   * This release supports the omap-a15 devices (omap5-evm/dra7-
> > > >evm) with ES 2.1 WL8
> > > >      * OMAP5432 UEVMs with the following SKU contain ES2.1
> > > >Wilink8 TDK 18xx module
> > > >      * OMAP5432x-xx-x1-xx
> > > >   * Bump PR
> > > >   * Replace defconfig with original wpa-supplicant defconfig
> > > >   * Add back SDK specific defconfig changes
> > > >   * Enable WFD (WiFi Display)
> > > >   * Revert some android patches which prevent WFD
> > > >
> > > >Signed-off-by: Roger Monk <r-monk@ti.com>
> > > >---
> > > > ...0001-revert-android-patches-to-enable-wfd.patch |   44 ++++++
> > > > .../defconfig                                      |  150
> > > >+++++++++++++++-----
> > > > ....a6.01.bb => wpa-supplicant-wl18xx_r8.a7.02.bb} |   11 +-
> > > > 3 files changed, 166 insertions(+), 39 deletions(-)  create mode
> > > >100644 meta-arago-extras/recipes-connectivity/wpa-
> > > >supplicant/wpa-supplicant-wl18xx-r8.a7.02/0001-revert-android-
> > > >patches-to-enable-wfd.patch
> > > > copy meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-
> > > >supplicant-r5.sp4.01 => wpa-supplicant-wl18xx-r8.a7.02}/defconfig
> > > >(74%)
> > > > mode change 100755 => 100644
> > > > copy meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-
> > > >supplicant-wl18xx_r8.a6.01.bb => wpa-supplicant- 
> > > >wl18xx_r8.a7.02.bb}
> > > >(78%)
> > > >
> > > >diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > >supplicant/wpa-supplicant-wl18xx-r8.a7.02/0001-revert-android-
> > > >patches-to-enable-wfd.patch b/meta-arago-extras/recipes-
> > > >connectivity/wpa-supplicant/wpa-supplicant-wl18xx-r8.a7.02/0001-
> > > >revert-android-patches-to-enable-wfd.patch
> > > >new file mode 100644
> > > >index 0000000..29528b4
> > > >--- /dev/null
> > > >+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > >supplicant-wl18xx-r8.a7.02/0001-revert-android-patches-to-enable-
> > > >wfd.patch
> > > >@@ -0,0 +1,44 @@
> > > >+
> > > >+diff -rupN a/src/common/wpa_ctrl.c b/src/common/wpa_ctrl.c
> > > >+--- a/src/common/wpa_ctrl.c	2013-09-02 16:46:22.708023057 +0100
> > > >++++ b/src/common/wpa_ctrl.c	2013-08-30 10:22:19.811255355 +0100
> > > >+@@ -164,6 +164,10 @@ try_again:
> > > >+ 		return NULL;
> > > >+ 	}
> > > >+
> > > >++#if 0
> > > >++//IH this code is introduced in recent supplicant that appears
> > > >to make RMD app calls to wpa_ctrl_recv() fail and
> > > >++// the supplicant fails to write to the same socket!!!
> > > >++// Temp fix to remove it, probably solution will be in app set
> > > >up/usage??
> > > >+ 	/*
> > > >+ 	 * Make socket non-blocking so that we don't hang forever if
> > > >+ 	 * target dies unexpectedly.
> > > >+@@ -176,7 +180,7 @@ try_again:
> > > >+ 			/* Not fatal, continue on.*/
> > > >+ 		}
> > > >+ 	}
> > > >+-
> > > >++#endif
> > > >+ 	return ctrl;
> > > >+ }
> > > >+
> > > >+diff -rupN a/wpa_supplicant/wpa_supplicant.c
> > > >b/wpa_supplicant/wpa_supplicant.c
> > > >+--- a/wpa_supplicant/wpa_supplicant.c	2013-09-04
> > > >16:57:26.000000000 +0100
> > > >++++ b/wpa_supplicant/wpa_supplicant.c	2013-09-04
> > > >17:02:02.256720695 +0100
> > > >+@@ -3025,13 +3025,15 @@ next_driver:
> > > >+ 	}
> > > >+
> > > >+ #ifdef CONFIG_P2P
> > > >++ #ifdef ANDROID
> > > >+ 	if (os_strncmp(iface->ifname, "wlan0", 4) == 0) {
> > > >+ 		wpa_printf(MSG_DEBUG, "Disable P2P on wlan0");
> > > >+ 		wpa_s->conf->p2p_disabled = 1;
> > > >+ 	}
> > > >+
> > > >+ 	if (os_strncmp(iface->ifname, "p2p0", 4) == 0)
> > > >+-		if (wpas_p2p_init(wpa_s->global, wpa_s) < 0) {
> > > >++#endif
> > > >++	    if (wpas_p2p_init(wpa_s->global, wpa_s) < 0) {
> > > >+ 			wpa_msg(wpa_s, MSG_ERROR, "Failed to init P2P");
> > > >+ 			return -1;
> > > >+ 		}
> > > >diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > >supplicant/wpa-supplicant-r5.sp4.01/defconfig b/meta-arago-
> > > >extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx-
> > > >r8.a7.02/defconfig
> > > >old mode 100755
> > > >new mode 100644
> > > >similarity index 74%
> > > >copy from meta-arago-extras/recipes-connectivity/wpa-
> > > >supplicant/wpa-supplicant-r5.sp4.01/defconfig
> > > >copy to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > >supplicant-wl18xx-r8.a7.02/defconfig
> > > >index b982e2a..80d2f63
> > > >--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > >supplicant-r5.sp4.01/defconfig
> > > >+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > >supplicant-wl18xx-r8.a7.02/defconfig
> > > >@@ -39,18 +39,6 @@
> > > > #LIBS = -lssl
> > > >
> > >
> > >###############################################################
> > ###
> > > >#############
> > > >
> > > >-#CC=$(CROSS_COMPILE)gcc
> > > >-#CFLAGS += -DCONFIG_LIBNL20
> > > >-#CPPFLAGS += -DCONFIG_LIBNL20
> > > >-#LIBS += -L$(NFSROOT)/lib -lnl
> > > >-#LIBS_p += -L$(NFSROOT)/lib
> > > >-#LIBDIR = $(NFSROOT)/lib
> > > >-#BINDIR = $(NFSROOT)/usr/sbin
> > > >-
> > > >-CONFIG_WAPI=y
> > > >-CONFIG_LIBNL20=y
> > > >-NEED_BGSCAN=y
> > > >-CONFIG_BGSCAN_LEARN=y
> > > >
> > > > # Driver interface for Host AP driver  #CONFIG_DRIVER_HOSTAP=y @@
> > > >-75,7 +63,7 @@ CONFIG_BGSCAN_LEARN=y  #CONFIG_DRIVER_ATMEL=y
> > > >
> > > > # Driver interface for old Broadcom driver -# Please note that the 
> > > >newer Broadcom driver ("hybrid Linux
> > > >driver") supportsBG
> > > >+# Please note that the newer Broadcom driver ("hybrid Linux
> > > >driver") supports
> > > > # Linux wireless extensions and does not need (or even work) with 
> > > >the old  # driver wrapper. Use CONFIG_DRIVER_WEXT=y with that driver.
> > > > #CONFIG_DRIVER_BROADCOM=y
> > > >@@ -90,16 +78,22 @@ CONFIG_BGSCAN_LEARN=y
> > #CONFIG_DRIVER_RALINK=y
> > > >
> > > > # Driver interface for generic Linux wireless extensions
> > > >+# Note: WEXT is deprecated in the current Linux kernel version
> > > >and no new
> > > >+# functionality is added to it. nl80211-based interface is the
> > > >new
> > > >+# replacement for WEXT and its use allows wpa_supplicant to
> > > >properly control
> > > >+# the driver to improve existing functionality like roaming and
> > > >to support new
> > > >+# functionality.
> > > > CONFIG_DRIVER_WEXT=y
> > > >
> > > > # Driver interface for Linux drivers using the nl80211 kernel 
> > > >interface  CONFIG_DRIVER_NL80211=y
> > > >+CONFIG_LIBNL20=y
> > > >
> > > > # Driver interface for FreeBSD net80211 layer (e.g., Atheros
> > > >driver)
> > > > #CONFIG_DRIVER_BSD=y
> > > > #CFLAGS += -I/usr/local/include
> > > > #LIBS += -L/usr/local/lib
> > > >-#LIBS_p += -L/usr/local/libBG
> > > >+#LIBS_p += -L/usr/local/lib
> > > > #LIBS_c += -L/usr/local/lib
> > > >
> > > > # Driver interface for Windows NDIS @@ -121,11 +115,6 @@ 
> > > >CONFIG_DRIVER_NL80211=y  # Driver interface
> > for
> > > >development testing  #CONFIG_DRIVER_TEST=y
> > > >
> > > >-# Include client MLME (management frame processing) for test 
> > > >driver -# This can be used to test MLME operations in hostapd with 
> > > >the test interface.
> > > >-# space.
> > > >-#CONFIG_CLIENT_MLME=y
> > > >-
> > > > # Driver interface for wired Ethernet drivers  
> > > >CONFIG_DRIVER_WIRED=y
> > > >
> > > >@@ -177,6 +166,9 @@ CONFIG_EAP_OTP=y  # EAP-PSK (experimental; this 
> > > >is _not_ needed for WPA-PSK) #CONFIG_EAP_PSK=y
> > > >
> > > >+# EAP-pwd (secure authentication using only a password) 
> > > >+#CONFIG_EAP_PWD=y
> > > >+
> > > > # EAP-PAX
> > > > #CONFIG_EAP_PAX=y
> > > >
> > > >@@ -208,6 +200,11 @@ CONFIG_EAP_LEAP=y  CONFIG_WPS=y  # Enable
> > WSC
> > > >2.0 support  CONFIG_WPS2=y
> > > >+# Enable WPS external registrar functionality #CONFIG_WPS_ER=y # 
> > > >+Disable credentials for an open network by default when acting
> > > >as a WPS
> > > >+# registrar.
> > > >+#CONFIG_WPS_REG_DISABLE_OPEN=y
> > > >
> > > > # EAP-IKEv2
> > > > #CONFIG_EAP_IKEV2=y
> > > >@@ -224,7 +221,10 @@ CONFIG_SMARTCARD=y  # Enable this if EAP-SIM
> > or
> > > >EAP-AKA is included  #CONFIG_PCSC=y
> > > >
> > > >-# Development testingBG
> > > >+# Support HT overrides (disable HT/HT40, mask MCS rates, etc.) 
> > > >+#CONFIG_HT_OVERRIDES=y
> > > >+
> > > >+# Development testing
> > > > #CONFIG_EAPOL_TEST=y
> > > >
> > > > # Select control interface backend for external programs, e.g,
> > > >wpa_cli:
> > > >@@ -242,6 +242,10 @@ CONFIG_CTRL_IFACE=y  # the resulting binary.
> > > > #CONFIG_READLINE=y
> > > >
> > > >+# Include internal line edit mode in wpa_cli. This can be used as
> > > >a replacement
> > > >+# for GNU Readline to provide limited command line editing and
> > > >history support.
> > > >+#CONFIG_WPA_CLI_EDIT=y
> > > >+
> > > > # Remove debugging code that is printing out debug message to 
> > > >stdout.
> > > > # This can be used to reduce the size of the wpa_supplicant 
> > > >considerably  # if debugging code is not needed. The size reduction 
> > > >can be around 35% @@ -295,13 +299,16 @@ CONFIG_BACKEND=file  # unix
> > =
> > > >UNIX/POSIX like systems (default)  # win32 = Windows systems  # 
> > > >none = Empty template -#CONFIG_OS=unix
> > > >+CONFIG_OS=unix
> > > >
> > > > # Select event loop implementation  # eloop = select() loop 
> > > >(default)  # eloop_win = Windows events and WaitForMultipleObject() 
> > > >loop  # eloop_none = Empty template -#CONFIG_ELOOP=eloop
> > > >+CONFIG_ELOOP=eloop
> > > >+
> > > >+# Should we use poll instead of select? Select is used by
> > > >default.
> > > >+#CONFIG_ELOOP_POLL=y
> > > >
> > > > # Select layer 2 packet implementation  # linux = Linux packet 
> > > >socket (default) @@ -310,7 +317,7 @@ CONFIG_BACKEND=file  # winpcap 
> > > >= WinPcap with receive thread  # ndis = Windows NDISUIO (note: 
> > > >requires
> > > >CONFIG_USE_NDISUIO=y)  # none = Empty template 
> > > >-#CONFIG_L2_PACKET=linux
> > > >+CONFIG_L2_PACKET=linux
> > > >
> > > > # PeerKey handshake for Station to Station Link (IEEE 802.11e
> > > >DLS)
> > > > CONFIG_PEERKEY=y
> > > >@@ -323,18 +330,24 @@ CONFIG_PEERKEY=y
> > > >
> > > > # Select TLS implementation
> > > > # openssl = OpenSSL (default)
> > > >-# gnutls = GnuTLS (needed for TLS/IA, see also
> > > >CONFIG_GNUTLS_EXTRA)
> > > >+# gnutls = GnuTLS
> > > > # internal = Internal TLSv1 implementation (experimental) # none = 
> > > > Empty template #CONFIG_TLS=openssl
> > > >
> > > >-# Whether to enable TLS/IA support, which is required for EAP- 
> > > >TTLSv1.
> > > >-# You need CONFIG_TLS=gnutls for this to have any effect. Please 
> > > >note that -# even though the core GnuTLS library is released under 
> > > >LGPL, this extra -# library uses GPL and as such, the terms of GPL 
> > > >apply to the combination -# of wpa_supplicant and GnuTLS if this 
> > > >option is enabled. BSD license may not -# apply for distribution of 
> > > >the resulting binary.
> > > >-#CONFIG_GNUTLS_EXTRA=y
> > > >+# TLS-based EAP methods require at least TLS v1.0. Newer version
> > > >of TLS (v1.1)
> > > >+# can be enabled to get a stronger construction of messages when
> > > >block ciphers
> > > >+# are used. It should be noted that some existing TLS v1.0 -based 
> > > >+# implementation may not be compatible with TLS v1.1 message
> > > >(ClientHello is
> > > >+# sent prior to negotiating which version will be used) 
> > > >+#CONFIG_TLSV11=y
> > > >+
> > > >+# TLS-based EAP methods require at least TLS v1.0. Newer version
> > > >of TLS (v1.2)
> > > >+# can be enabled to enable use of stronger crypto algorithms. It
> > > >should be
> > > >+# noted that some existing TLS v1.0 -based implementation may not
> > > >be compatible
> > > >+# with TLS v1.2 message (ClientHello is sent prior to negotiating
> > > >which version
> > > >+# will be used)
> > > >+#CONFIG_TLSV12=y
> > > >
> > > > # If CONFIG_TLS=internal is used, additional library and include 
> > > >paths are  # needed for LibTomMath. Alternatively, an integrated, 
> > > >minimal version of @@ -396,6 +409,21 @@ 
> > > >CONFIG_CTRL_IFACE_DBUS_INTRO=y  # Add support for writing debug log 
> > > >to a file
> > > >(/tmp/wpa_supplicant-log-#.txt)
> > > > CONFIG_DEBUG_FILE=y
> > > >
> > > >+# Send debug messages to syslog instead of stdout 
> > > >+#CONFIG_DEBUG_SYSLOG=y # Set syslog facility for debug messages 
> > > >+#CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
> > > >+
> > > >+# Add support for sending all debug messages (regardless of debug
> > > >verbosity)
> > > >+# to the Linux kernel tracing facility. This helps debug the
> > > >entire stack by
> > > >+# making it easy to record everything happening from the driver
> > > >up into the
> > > >+# same file, e.g., using trace-cmd.
> > > >+#CONFIG_DEBUG_LINUX_TRACING=y
> > > >+
> > > >+# Add support for writing debug log to Android logcat instead of
> > > >standard
> > > >+# output
> > > >+#CONFIG_ANDROID_LOG=y
> > > >+
> > > > # Enable privilege separation (see README 'Privilege separation'
> > > >for details)
> > > > #CONFIG_PRIVSEP=y
> > > >
> > > >@@ -407,7 +435,7 @@ CONFIG_DEBUG_FILE=y  # This tracks use of
> > memory
> > > >allocations and other registrations and reports  # incorrect use 
> > > >with a backtrace of call (or allocation) location.
> > > > #CONFIG_WPA_TRACE=y
> > > >-# For BSD, comment out these.
> > > >+# For BSD, uncomment these.
> > > > #LIBS += -lexecinfo
> > > > #LIBS_p += -lexecinfo
> > > > #LIBS_c += -lexecinfo
> > > >@@ -416,15 +444,65 @@ CONFIG_DEBUG_FILE=y  # This enables use of 
> > > >libbfd to get more detailed symbols for the backtraces  # generated 
> > > >by CONFIG_WPA_TRACE=y.
> > > > #CONFIG_WPA_TRACE_BFD=y
> > > >-# For BSD, comment out these.
> > > >+# For BSD, uncomment these.
> > > > #LIBS += -lbfd -liberty -lz
> > > > #LIBS_p += -lbfd -liberty -lz
> > > > #LIBS_c += -lbfd -liberty -lz
> > > >
> > > >-# for p2p
> > > >+# wpa_supplicant depends on strong random number generation being
> > > >available
> > > >+# from the operating system. os_get_random() function is used to
> > > >fetch random
> > > >+# data when needed, e.g., for key generation. On Linux and BSD
> > > >systems, this
> > > >+# works by reading /dev/urandom. It should be noted that the OS
> > > >entropy pool
> > > >+# needs to be properly initialized before wpa_supplicant is
> > > >started. This is
> > > >+# important especially on embedded devices that do not have a
> > > >hardware random
> > > >+# number generator and may by default start up with minimal
> > > >entropy available
> > > >+# for random number generation.
> > > >+#
> > > >+# As a safety net, wpa_supplicant is by default trying to
> > > >internally collect
> > > >+# additional entropy for generating random data to mix in with
> > > >the data fetched
> > > >+# from the OS. This by itself is not considered to be very
> > > >strong, but it may
> > > >+# help in cases where the system pool is not initialized
> > > >properly. However, it
> > > >+# is very strongly recommended that the system pool is
> > > >initialized with enough
> > > >+# entropy either by using hardware assisted random number
> > > >generator or by
> > > >+# storing state over device reboots.
> > > >+#
> > > >+# wpa_supplicant can be configured to maintain its own entropy
> > > >store over
> > > >+# restarts to enhance random number generation. This is not
> > > >perfect, but it is
> > > >+# much more secure than using the same sequence of random numbers
> > > >after every
> > > >+# reboot. This can be enabled with -e<entropy file> command line
> > > >option. The
> > > >+# specified file needs to be readable and writable by
> > > >wpa_supplicant.
> > > >+#
> > > >+# If the os_get_random() is known to provide strong random data
> > > >(e.g., on
> > > >+# Linux/BSD, the board in question is known to have reliable
> > > >source of random
> > > >+# data from /dev/urandom), the internal wpa_supplicant random
> > > >pool can be
> > > >+# disabled. This will save some in binary size and CPU use.
> > > >However, this
> > > >+# should only be considered for builds that are known to be used
> > > >on devices
> > > >+# that meet the requirements described above.
> > > >+#CONFIG_NO_RANDOM_POOL=y
> > > >+
> > > >+# IEEE 802.11n (High Throughput) support (mainly for AP mode) 
> > > >+CONFIG_IEEE80211N=y
> > > >+
> > > >+# Interworking (IEEE 802.11u)
> > > >+# This can be used to enable functionality to improve
> > > >interworking with
> > > >+# external networks (GAS/ANQP to learn more about the networks
> > > >and network
> > > >+# selection based on available credentials).
> > > >+#CONFIG_INTERWORKING=y
> > > >+
> > > >+# Hotspot 2.0
> > > >+#CONFIG_HS20=y
> > > >+
> > > >+# Disable roaming in wpa_supplicant #CONFIG_NO_ROAMING=y
> > > >+
> > > >+# Enable P2P
> > > > CONFIG_P2P=y
> > > > CONFIG_AP=y
> > > >
> > > >-# IEEE 802.11n (High Throughput) support -CONFIG_IEEE80211N=y
> > > >+# bgscan
> > > >+NEED_BGSCAN=y
> > > >+CONFIG_BGSCAN_LEARN=y
> > > >+CONFIG_BGSCAN_SIMPLE=y
> > > >
> > > >+# Enable WIFI Display
> > > >+CONFIG_WIFI_DISPLAY=y
> > > >\ No newline at end of file
> > > >diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > > >supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb b/meta-arago-
> > > >extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> > > >wl18xx_r8.a7.02.bb
> > > >similarity index 78%
> > > >copy from meta-arago-extras/recipes-connectivity/wpa-
> > > >supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb
> > > >copy to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > >supplicant-wl18xx_r8.a7.02.bb
> > > >index f6c4f70..0ea9ff5 100644
> > > >--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > >supplicant-wl18xx_r8.a6.01.bb
> > > >+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > > >supplicant-wl18xx_r8.a7.02.bb
> > > >@@ -10,9 +10,14 @@ LIC_FILES_CHKSUM = 
> > > >"file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
> > > >
> > > > FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
> > > >
> > > >-# Tag: ol_r8.a6.01
> > > >-SRCREV = "7190ff7dbd43243290b626068ded0d61c5019050"
> > > >-PR = "r2+gitr${SRCPV}"
> > > >+COMPATIBLE_MACHINE = "(omap-a15)"
> > > >+
> > > >+# Tag: ol_r8.a7.02
> > > >+SRCREV = "4dda294a5186f3efb437ae0898a6df71655843ef"
> > > >+PR = "r4+gitr${SRCPV}"
> > >
> > > Why not reset the PR?  Is there no corresponding PV bump for this release?
> > >
> > > >+
> > > >+SRC_URI += "file://0001-revert-android-patches-to-enable-
> > > >wfd.patch;patchdir=.. \
> > > >+"
> > > >
> > > > # Add ti to the PV to indicate that this is a TI modify version of 
> > > >wpa-supplicant.
> > > > PV = "2.0-devel-ti"
> > > >--
> > > >1.7.9.5
> > > >
> > > >_______________________________________________
> > > >meta-arago mailing list
> > > >meta-arago@arago-project.org
> > > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

