Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 33F165298A
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2014 14:19:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1BEJVpV004716
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2014 08:19:31 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BEJVpk005800
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2014 08:19:31 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 11 Feb 2014 08:19:31 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] libdnet: Add recipe for libdnet library
Thread-Index: AQHPJsPyi8DtEZwgbkiCUyrbR5QBV5qwGvJQ
Date: Tue, 11 Feb 2014 14:19:31 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101599607AA@DLEE11.ent.ti.com>
References: <1392080110-7302-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1392080110-7302-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] libdnet: Add recipe for libdnet library
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
X-List-Received-Date: Tue, 11 Feb 2014 14:19:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Will you be pushing this down to oe-core or meta-openembedded as well?

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Nelson, Sam
>Sent: Monday, February 10, 2014 6:55 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] libdnet: Add recipe for libdnet
>library
>
>- Dumb networking library
>
>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>---
> .../libdnet/files/acinclude.m4                     |  320
>++++++++++++++++++++
> .../recipes-connectivity/libdnet/libdnet_1.12.bb   |   23 ++
> 2 files changed, 343 insertions(+)
> create mode 100755 meta-arago-extras/recipes-
>connectivity/libdnet/files/acinclude.m4
> create mode 100755 meta-arago-extras/recipes-
>connectivity/libdnet/libdnet_1.12.bb
>
>diff --git a/meta-arago-extras/recipes-
>connectivity/libdnet/files/acinclude.m4 b/meta-arago-
>extras/recipes-connectivity/libdnet/files/acinclude.m4
>new file mode 100755
>index 0000000..492da6f
>--- /dev/null
>+++ b/meta-arago-extras/recipes-
>connectivity/libdnet/files/acinclude.m4
>@@ -0,0 +1,320 @@
>+dnl
>+dnl Check for 4.4 BSD sa_len member in sockaddr struct
>+dnl
>+dnl usage:	AC_DNET_SOCKADDR_SA_LEN
>+dnl results:	HAVE_SOCKADDR_SA_LEN (defined)
>+dnl
>+AC_DEFUN(AC_DNET_SOCKADDR_SA_LEN,
>+    [AC_MSG_CHECKING(for sa_len in sockaddr struct)
>+    AC_CACHE_VAL(ac_cv_dnet_sockaddr_has_sa_len,
>+        AC_TRY_COMPILE([
>+# ifndef _SOCKADDR_LEN
>+#	define _SOCKADDR_LEN 1
>+# endif
>+#       include <sys/types.h>
>+#       include <sys/socket.h>],
>+        [u_int i =3D sizeof(((struct sockaddr *)0)->sa_len)],
>+        ac_cv_dnet_sockaddr_has_sa_len=3Dyes,
>+        ac_cv_dnet_sockaddr_has_sa_len=3Dno))
>+    AC_MSG_RESULT($ac_cv_dnet_sockaddr_has_sa_len)
>+    if test $ac_cv_dnet_sockaddr_has_sa_len =3D yes ; then
>+            AC_DEFINE(HAVE_SOCKADDR_SA_LEN, 1,
>+                      [Define if sockaddr struct has sa_len.])
>+    fi])
>+
>+dnl
>+dnl Check for sockaddr_in6 struct in <netinet/in.h>
>+dnl
>+dnl usage:	AC_DNET_SOCKADDR_IN6
>+dnl results:	HAVE_SOCKADDR_IN6
>+dnl
>+AC_DEFUN(AC_DNET_SOCKADDR_IN6,
>+    [AC_MSG_CHECKING(for sockaddr_in6 struct in <netinet/in.h>)
>+    AC_CACHE_VAL(ac_cv_dnet_netinet_in_h_has_sockaddr_in6,
>+        AC_TRY_COMPILE([
>+#       include <sys/types.h>
>+#	include <sys/socket.h>
>+#       include <netinet/in.h>],
>+        [struct sockaddr_in6 sin6; sin6.sin6_family =3D AF_INET6;],
>+	ac_cv_dnet_netinet_in_h_has_sockaddr_in6=3Dyes,
>+	ac_cv_dnet_netinet_in_h_has_sockaddr_in6=3Dno))
>+    AC_MSG_RESULT($ac_cv_dnet_netinet_in_h_has_sockaddr_in6)
>+    if test $ac_cv_dnet_netinet_in_h_has_sockaddr_in6 =3D yes ;
>then
>+        AC_DEFINE(HAVE_SOCKADDR_IN6, 1,
>+	          [Define if <netinet/in.h> has sockaddr_in6
>struct.])
>+    fi])
>+
>+dnl
>+dnl Check for arp_dev member in arpreq struct
>+dnl
>+dnl usage:	AC_DNET_ARPREQ_ARP_DEV
>+dnl results:	HAVE_ARPREQ_ARP_DEV (defined)
>+dnl
>+AC_DEFUN(AC_DNET_ARPREQ_ARP_DEV,
>+    [AC_MSG_CHECKING(for arp_dev in arpreq struct)
>+    AC_CACHE_VAL(ac_cv_dnet_arpreq_has_arp_dev,
>+	AC_TRY_COMPILE([
>+#       include <sys/types.h>
>+#	include <sys/socket.h>
>+#	include <net/if_arp.h>],
>+	[void *p =3D ((struct arpreq *)0)->arp_dev],
>+	ac_cv_dnet_arpreq_has_arp_dev=3Dyes,
>+	ac_cv_dnet_arpreq_has_arp_dev=3Dno))
>+    AC_MSG_RESULT($ac_cv_dnet_arpreq_has_arp_dev)
>+    if test $ac_cv_dnet_arpreq_has_arp_dev =3D yes ; then
>+	AC_DEFINE(HAVE_ARPREQ_ARP_DEV, 1,
>+		[Define if arpreq struct has arp_dev.])
>+    fi])
>+
>+dnl
>+dnl Check for rt_msghdr struct in <net/route.h>
>+dnl
>+dnl usage:	AC_DNET_ROUTE_RT_MSGHDR
>+dnl results:	HAVE_ROUTE_RT_MSGHDR
>+dnl
>+AC_DEFUN(AC_DNET_ROUTE_RT_MSGHDR,
>+    [AC_MSG_CHECKING(for rt_msghdr struct in <net/route.h>)
>+    AC_CACHE_VAL(ac_cv_dnet_route_h_has_rt_msghdr,
>+        AC_TRY_COMPILE([
>+#       include <sys/types.h>
>+#       include <sys/socket.h>
>+#       include <net/if.h>
>+#       include <net/route.h>],
>+        [struct rt_msghdr rtm; rtm.rtm_msglen =3D 0;],
>+	ac_cv_dnet_route_h_has_rt_msghdr=3Dyes,
>+	ac_cv_dnet_route_h_has_rt_msghdr=3Dno))
>+    AC_MSG_RESULT($ac_cv_dnet_route_h_has_rt_msghdr)
>+    if test $ac_cv_dnet_route_h_has_rt_msghdr =3D yes ; then
>+        AC_DEFINE(HAVE_ROUTE_RT_MSGHDR, 1,
>+	          [Define if <net/route.h> has rt_msghdr struct.])
>+    fi])
>+
>+dnl
>+dnl Check for the Berkeley Packet Filter
>+dnl
>+dnl usage:	AC_DNET_BSD_BPF
>+dnl results:	HAVE_BSD_BPF
>+dnl
>+AC_DEFUN(AC_DNET_BSD_BPF,
>+    [AC_MSG_CHECKING(for Berkeley Packet Filter)
>+    AC_CACHE_VAL(ac_cv_dnet_bsd_bpf,
>+	if test -c /dev/bpf0 ; then
>+	    ac_cv_dnet_bsd_bpf=3Dyes
>+	else
>+	    ac_cv_dnet_bsd_bpf=3Dno
>+	fi)
>+    AC_MSG_RESULT($ac_cv_dnet_bsd_bpf)
>+    if test $ac_cv_dnet_bsd_bpf =3D yes ; then
>+	AC_DEFINE(HAVE_BSD_BPF, 1,
>+		  [Define if you have the Berkeley Packet Filter.])
>+    fi])
>+
>+dnl
>+dnl Check for the Linux /proc filesystem
>+dnl
>+dnl usage:	AC_DNET_LINUX_PROCFS
>+dnl results:	HAVE_LINUX_PROCFS
>+dnl
>+AC_DEFUN(AC_DNET_LINUX_PROCFS,
>+    [AC_MSG_CHECKING(for Linux proc filesystem)
>+    AC_CACHE_VAL(ac_cv_dnet_linux_procfs,
>+	if test "x`cat /proc/sys/kernel/ostype 2>&-`" =3D "xLinux" ;
>then
>+	    ac_cv_dnet_linux_procfs=3Dyes
>+        else
>+	    ac_cv_dnet_linux_procfs=3Dno
>+	fi)
>+    AC_MSG_RESULT($ac_cv_dnet_linux_procfs)
>+    if test $ac_cv_dnet_linux_procfs =3D yes ; then
>+	AC_DEFINE(HAVE_LINUX_PROCFS, 1,
>+		  [Define if you have the Linux /proc filesystem.])
>+    fi])
>+
>+dnl
>+dnl Check for Linux PF_PACKET sockets
>+dnl
>+dnl usage:	AC_DNET_LINUX_PF_PACKET
>+dnl results:	HAVE_LINUX_PF_PACKET
>+dnl
>+AC_DEFUN(AC_DNET_LINUX_PF_PACKET,
>+    [AC_MSG_CHECKING(for Linux PF_PACKET sockets)
>+    AC_CACHE_VAL(ac_cv_dnet_linux_pf_packet,
>+	if test -f /usr/include/netpacket/packet.h ; then
>+	    ac_cv_dnet_linux_pf_packet=3Dyes
>+	else
>+	    ac_cv_dnet_linux_pf_packet=3Dno
>+	fi)
>+    AC_MSG_RESULT($ac_cv_dnet_linux_pf_packet)
>+    if test $ac_cv_dnet_linux_pf_packet =3D yes ; then
>+	AC_DEFINE(HAVE_LINUX_PF_PACKET, 1,
>+		  [Define if you have Linux PF_PACKET sockets.])
>+    fi])
>+
>+dnl
>+dnl Check for SNMP MIB2 STREAMS (Solaris only?)
>+dnl
>+dnl usage:      AC_DNET_STREAMS_MIB2
>+dnl results:    HAVE_STREAMS_MIB2
>+dnl
>+AC_DEFUN(AC_DNET_STREAMS_MIB2,
>+    [AC_MSG_CHECKING(for SNMP MIB2 STREAMS)
>+    AC_CACHE_VAL(ac_cv_dnet_streams_mib2,
>+        if test -f /usr/include/inet/mib2.h -a -c /dev/ip ; then
>+            ac_cv_dnet_streams_mib2=3Dyes
>+        else
>+            ac_cv_dnet_streams_mib2=3Dno
>+        fi)
>+    AC_MSG_RESULT($ac_cv_dnet_streams_mib2)
>+    if test $ac_cv_dnet_streams_mib2 =3D yes ; then
>+        AC_DEFINE(HAVE_STREAMS_MIB2, 1,
>+                  [Define if you have SNMP MIB2 STREAMS.])
>+    fi])
>+
>+dnl
>+dnl Check for route(7) STREAMS (UnixWare only?)
>+dnl
>+dnl usage:      AC_DNET_STREAMS_ROUTE
>+dnl results:    HAVE_STREAMS_ROUTE
>+dnl
>+AC_DEFUN(AC_DNET_STREAMS_ROUTE,
>+    [AC_MSG_CHECKING(for route(7) STREAMS)
>+    AC_CACHE_VAL(ac_cv_dnet_streams_route,
>+        if grep RTSTR_SEND /usr/include/net/route.h >/dev/null
>2>&1 ; then
>+            ac_cv_dnet_streams_route=3Dyes
>+        else
>+            ac_cv_dnet_streams_route=3Dno
>+        fi)
>+    AC_MSG_RESULT($ac_cv_dnet_streams_route)
>+    if test $ac_cv_dnet_streams_route =3D yes ; then
>+        AC_DEFINE(HAVE_STREAMS_ROUTE, 1,
>+                  [Define if you have route(7) STREAMS.])
>+    fi])
>+
>+dnl
>+dnl Check for arp(7) ioctls
>+dnl
>+dnl usage:      AC_DNET_IOCTL_ARP
>+dnl results:    HAVE_IOCTL_ARP
>+dnl
>+AC_DEFUN(AC_DNET_IOCTL_ARP,
>+    [AC_MSG_CHECKING(for arp(7) ioctls)
>+    AC_CACHE_VAL(ac_cv_dnet_ioctl_arp,
>+	AC_EGREP_CPP(werd, [
>+#	include <sys/types.h>
>+#	define BSD_COMP
>+#	include <sys/ioctl.h>
>+#	ifdef SIOCGARP
>+	werd
>+#	endif],
>+	ac_cv_dnet_ioctl_arp=3Dyes,
>+	ac_cv_dnet_ioctl_arp=3Dno))
>+    case "$host_os" in
>+    irix*)
>+        ac_cv_dnet_ioctl_arp=3Dno ;;
>+    esac
>+    AC_MSG_RESULT($ac_cv_dnet_ioctl_arp)
>+    if test $ac_cv_dnet_ioctl_arp =3D yes ; then
>+        AC_DEFINE(HAVE_IOCTL_ARP, 1,
>+                  [Define if you have arp(7) ioctls.])
>+    fi])
>+
>+dnl
>+dnl Check for raw IP sockets ip_{len,off} host byte ordering
>+dnl
>+dnl usage:      AC_DNET_RAWIP_HOST_OFFLEN
>+dnl results:    HAVE_RAWIP_HOST_OFFLEN
>+dnl
>+AC_DEFUN(AC_DNET_RAWIP_HOST_OFFLEN,
>+    [AC_MSG_CHECKING([for raw IP sockets ip_{len,off} host byte
>ordering])
>+    AC_CACHE_VAL(ac_cv_dnet_rawip_host_offlen, [
>+	case "$host_os" in
>+	*openbsd*)
>+	    ac_cv_dnet_rawip_host_offlen=3Dno ;;
>+	*bsd*|*darwin*|*osf*|*unixware*)
>+	    ac_cv_dnet_rawip_host_offlen=3Dyes ;;
>+	*)
>+	    ac_cv_dnet_rawip_host_offlen=3Dno ;;
>+	esac])
>+    AC_MSG_RESULT($ac_cv_dnet_rawip_host_offlen)
>+    if test $ac_cv_dnet_rawip_host_offlen =3D yes ; then
>+        AC_DEFINE(HAVE_RAWIP_HOST_OFFLEN, 1,
>+                  [Define if raw IP sockets require host byte
>ordering for ip_off, ip_len.])
>+    fi])
>+
>+dnl
>+dnl Check for cooked raw IP sockets
>+dnl
>+dnl usage:      AC_DNET_RAWIP_COOKED
>+dnl results:    HAVE_RAWIP_COOKED
>+dnl
>+AC_DEFUN(AC_DNET_RAWIP_COOKED,
>+    [AC_MSG_CHECKING(for cooked raw IP sockets)
>+    AC_CACHE_VAL(ac_cv_dnet_rawip_cooked, [
>+	case "$host_os" in
>+	solaris*|irix*)
>+	    ac_cv_dnet_rawip_cooked=3Dyes ;;
>+	*)
>+	    ac_cv_dnet_rawip_cooked=3Dno ;;
>+	esac])
>+    AC_MSG_RESULT($ac_cv_dnet_rawip_cooked)
>+    if test $ac_cv_dnet_rawip_cooked =3D yes ; then
>+        AC_DEFINE(HAVE_RAWIP_COOKED, 1,
>+                  [Define if you have cooked raw IP sockets.])
>+    fi])
>+
>+dnl
>+dnl AC_LBL_LIBRARY_NET
>+dnl
>+dnl This test is for network applications that need socket() and
>+dnl gethostbyname() -ish functions.  Under Solaris, those
>applications
>+dnl need to link with "-lsocket -lnsl".  Under IRIX, they need to
>link
>+dnl with "-lnsl" but should *not* link with "-lsocket" because
>+dnl libsocket.a breaks a number of things (for instance:
>+dnl gethostbyname() under IRIX 5.2, and snoop sockets under most
>+dnl versions of IRIX).
>+dnl
>+dnl Unfortunately, many application developers are not aware of
>this,
>+dnl and mistakenly write tests that cause -lsocket to be used
>under
>+dnl IRIX.  It is also easy to write tests that cause -lnsl to be
>used
>+dnl under operating systems where neither are necessary (or
>useful),
>+dnl such as SunOS 4.1.4, which uses -lnsl for TLI.
>+dnl
>+dnl This test exists so that every application developer does not
>test
>+dnl this in a different, and subtly broken fashion.
>+
>+dnl It has been argued that this test should be broken up into
>two
>+dnl seperate tests, one for the resolver libraries, and one for
>the
>+dnl libraries necessary for using Sockets API. Unfortunately, the
>two
>+dnl are carefully intertwined and allowing the autoconf user to
>use
>+dnl them independantly potentially results in unfortunate
>ordering
>+dnl dependancies -- as such, such component macros would have to
>+dnl carefully use indirection and be aware if the other
>components were
>+dnl executed. Since other autoconf macros do not go to this
>trouble,
>+dnl and almost no applications use sockets without the resolver,
>this
>+dnl complexity has not been implemented.
>+dnl
>+dnl The check for libresolv is in case you are attempting to link
>+dnl statically and happen to have a libresolv.a lying around (and
>no
>+dnl libnsl.a).
>+dnl
>+AC_DEFUN(AC_LBL_LIBRARY_NET, [
>+    # Most operating systems have gethostbyname() in the default
>searched
>+    # libraries (i.e. libc):
>+    AC_CHECK_FUNC(gethostbyname, ,
>+        # Some OSes (eg. Solaris) place it in libnsl:
>+        AC_CHECK_LIB(nsl, gethostbyname, ,
>+            # Some strange OSes (SINIX) have it in libsocket:
>+            AC_CHECK_LIB(socket, gethostbyname, ,
>+                # Unfortunately libsocket sometimes depends on
>libnsl.
>+                # AC_CHECK_LIB's API is essentially broken so the
>+                # following ugliness is necessary:
>+                AC_CHECK_LIB(socket, gethostbyname,
>+                    LIBS=3D"-lsocket -lnsl $LIBS",
>+                    AC_CHECK_LIB(resolv, gethostbyname),
>+                    -lnsl))))
>+    AC_CHECK_FUNC(socket, , AC_CHECK_LIB(socket, socket, ,
>+        AC_CHECK_LIB(socket, socket, LIBS=3D"-lsocket -lnsl $LIBS",
>,
>+            -lnsl)))
>+    # DLPI needs putmsg under HPUX so test for -lstr while we're
>at it
>+    AC_CHECK_LIB(str, putmsg)
>+    ])
>+
>diff --git a/meta-arago-extras/recipes-
>connectivity/libdnet/libdnet_1.12.bb b/meta-arago-extras/recipes-
>connectivity/libdnet/libdnet_1.12.bb
>new file mode 100755
>index 0000000..d2c3eeb
>--- /dev/null
>+++ b/meta-arago-extras/recipes-
>connectivity/libdnet/libdnet_1.12.bb
>@@ -0,0 +1,23 @@
>+DESCRIPTION =3D "dumb networking library"
>+HOMEPAGE =3D "http://code.google.com/p/libdnet/"
>+LICENSE =3D "BSD"
>+SECTION =3D "libs"
>+PRIORITY =3D "optional"
>+
>+LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3D0036c1b155f4e999f3e0a373490b5db9"
>+
>+SRC_URI =3D " \
>+    http://libdnet.googlecode.com/files/libdnet-${PV}.tgz \
>+    file://acinclude.m4 \
>+    "
>+
>+inherit autotools
>+
>+PR =3D "r0"
>+
>+SRC_URI[md5sum] =3D "9253ef6de1b5e28e9c9a62b882e44cc9"
>+SRC_URI[sha256sum] =3D
>"83b33039787cf99990e977cef7f18a5d5e7aaffc4505548a83d31bd3515eb026"
>+
>+do_configure_prepend() {
>+    cp ${WORKDIR}/acinclude.m4 ${S}
>+}
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

