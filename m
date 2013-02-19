Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id EBDED52A47
	for <meta-arago@arago-project.org>;
	Tue, 19 Feb 2013 03:32:09 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1J3W8sV010498
	for <meta-arago@arago-project.org>; Mon, 18 Feb 2013 21:32:08 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1J3W8Ad020677
	for <meta-arago@arago-project.org>; Mon, 18 Feb 2013 21:32:08 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 18 Feb 2013 21:32:08 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: libdnet recipe review
Thread-Index: Ac4OS3m42MxPQs1KQRq7HFwWOrY1OQABaeSw
Date: Tue, 19 Feb 2013 03:32:08 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C395393@DFLE09.ent.ti.com>
References: <3C08AEEB3C731745938BC83D029FE5E391A172@DFLE09.ent.ti.com>
In-Reply-To: <3C08AEEB3C731745938BC83D029FE5E391A172@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: libdnet recipe review
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
X-List-Received-Date: Tue, 19 Feb 2013 03:32:10 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C395393DFLE09entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C395393DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Zhou, Jingting
Sent: Monday, February 18, 2013 8:48 PM
To: meta-arago@arago-project.org
Subject: [meta-arago] libdnet recipe review

From aa3305b2ebeaaa8a291f86606b4d3a1eb4c43c41 Mon Sep 17 00:00:00 2001
From: Jingting Zhou <a0221004@ares-ubuntu>
Date: Mon, 18 Feb 2013 17:56:28 -0500
Subject: [PATCH] added libdnet recipe

---
.../libdnet/files/acinclude.m4                     |  320 +++++++++++++++++=
+++
.../recipes-connectivity/libdnet/libdnet_1.12.bb   |   25 ++
2 files changed, 345 insertions(+)
create mode 100755 meta-arago-distro/recipes-connectivity/libdnet/files/aci=
nclude.m4
create mode 100755 meta-arago-distro/recipes-connectivity/libdnet/libdnet_1=
.12.bb

diff --git a/meta-arago-distro/recipes-connectivity/libdnet/files/acinclude=
.m4 b/meta-arago-distro/recipes-connectivity/libdnet/files/acinclude.m4
new file mode 100755
index 0000000..492da6f
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/libdnet/files/acinclude.m4
@@ -0,0 +1,320 @@
+dnl
+dnl Check for 4.4 BSD sa_len member in sockaddr struct
+dnl
+dnl usage:         AC_DNET_SOCKADDR_SA_LEN
+dnl results:       HAVE_SOCKADDR_SA_LEN (defined)
+dnl
+AC_DEFUN(AC_DNET_SOCKADDR_SA_LEN,
+    [AC_MSG_CHECKING(for sa_len in sockaddr struct)
+    AC_CACHE_VAL(ac_cv_dnet_sockaddr_has_sa_len,
+        AC_TRY_COMPILE([
+# ifndef _SOCKADDR_LEN
+#           define _SOCKADDR_LEN 1
+# endif
+#       include <sys/types.h>
+#       include <sys/socket.h>],
+        [u_int i =3D sizeof(((struct sockaddr *)0)->sa_len)],
+        ac_cv_dnet_sockaddr_has_sa_len=3Dyes,
+        ac_cv_dnet_sockaddr_has_sa_len=3Dno))
+    AC_MSG_RESULT($ac_cv_dnet_sockaddr_has_sa_len)
+    if test $ac_cv_dnet_sockaddr_has_sa_len =3D yes ; then
+            AC_DEFINE(HAVE_SOCKADDR_SA_LEN, 1,
+                      [Define if sockaddr struct has sa_len.])
+    fi])
+
+dnl
+dnl Check for sockaddr_in6 struct in <netinet/in.h>
+dnl
+dnl usage:         AC_DNET_SOCKADDR_IN6
+dnl results:       HAVE_SOCKADDR_IN6
+dnl
+AC_DEFUN(AC_DNET_SOCKADDR_IN6,
+    [AC_MSG_CHECKING(for sockaddr_in6 struct in <netinet/in.h>)
+    AC_CACHE_VAL(ac_cv_dnet_netinet_in_h_has_sockaddr_in6,
+        AC_TRY_COMPILE([
+#       include <sys/types.h>
+#           include <sys/socket.h>
+#       include <netinet/in.h>],
+        [struct sockaddr_in6 sin6; sin6.sin6_family =3D AF_INET6;],
+              ac_cv_dnet_netinet_in_h_has_sockaddr_in6=3Dyes,
+              ac_cv_dnet_netinet_in_h_has_sockaddr_in6=3Dno))
+    AC_MSG_RESULT($ac_cv_dnet_netinet_in_h_has_sockaddr_in6)
+    if test $ac_cv_dnet_netinet_in_h_has_sockaddr_in6 =3D yes ; then
+        AC_DEFINE(HAVE_SOCKADDR_IN6, 1,
+                        [Define if <netinet/in.h> has sockaddr_in6 struct.=
])
+    fi])
+
+dnl
+dnl Check for arp_dev member in arpreq struct
+dnl
+dnl usage:         AC_DNET_ARPREQ_ARP_DEV
+dnl results:       HAVE_ARPREQ_ARP_DEV (defined)
+dnl
+AC_DEFUN(AC_DNET_ARPREQ_ARP_DEV,
+    [AC_MSG_CHECKING(for arp_dev in arpreq struct)
+    AC_CACHE_VAL(ac_cv_dnet_arpreq_has_arp_dev,
+              AC_TRY_COMPILE([
+#       include <sys/types.h>
+#           include <sys/socket.h>
+#           include <net/if_arp.h>],
+              [void *p =3D ((struct arpreq *)0)->arp_dev],
+              ac_cv_dnet_arpreq_has_arp_dev=3Dyes,
+              ac_cv_dnet_arpreq_has_arp_dev=3Dno))
+    AC_MSG_RESULT($ac_cv_dnet_arpreq_has_arp_dev)
+    if test $ac_cv_dnet_arpreq_has_arp_dev =3D yes ; then
+              AC_DEFINE(HAVE_ARPREQ_ARP_DEV, 1,
+                              [Define if arpreq struct has arp_dev.])
+    fi])
+
+dnl
+dnl Check for rt_msghdr struct in <net/route.h>
+dnl
+dnl usage:         AC_DNET_ROUTE_RT_MSGHDR
+dnl results:       HAVE_ROUTE_RT_MSGHDR
+dnl
+AC_DEFUN(AC_DNET_ROUTE_RT_MSGHDR,
+    [AC_MSG_CHECKING(for rt_msghdr struct in <net/route.h>)
+    AC_CACHE_VAL(ac_cv_dnet_route_h_has_rt_msghdr,
+        AC_TRY_COMPILE([
+#       include <sys/types.h>
+#       include <sys/socket.h>
+#       include <net/if.h>
+#       include <net/route.h>],
+        [struct rt_msghdr rtm; rtm.rtm_msglen =3D 0;],
+              ac_cv_dnet_route_h_has_rt_msghdr=3Dyes,
+              ac_cv_dnet_route_h_has_rt_msghdr=3Dno))
+    AC_MSG_RESULT($ac_cv_dnet_route_h_has_rt_msghdr)
+    if test $ac_cv_dnet_route_h_has_rt_msghdr =3D yes ; then
+        AC_DEFINE(HAVE_ROUTE_RT_MSGHDR, 1,
+                        [Define if <net/route.h> has rt_msghdr struct.])
+    fi])
+
+dnl
+dnl Check for the Berkeley Packet Filter
+dnl
+dnl usage:         AC_DNET_BSD_BPF
+dnl results:       HAVE_BSD_BPF
+dnl
+AC_DEFUN(AC_DNET_BSD_BPF,
+    [AC_MSG_CHECKING(for Berkeley Packet Filter)
+    AC_CACHE_VAL(ac_cv_dnet_bsd_bpf,
+              if test -c /dev/bpf0 ; then
+                  ac_cv_dnet_bsd_bpf=3Dyes
+              else
+                  ac_cv_dnet_bsd_bpf=3Dno
+              fi)
+    AC_MSG_RESULT($ac_cv_dnet_bsd_bpf)
+    if test $ac_cv_dnet_bsd_bpf =3D yes ; then
+              AC_DEFINE(HAVE_BSD_BPF, 1,
+                                [Define if you have the Berkeley Packet Fi=
lter.])
+    fi])
+
+dnl
+dnl Check for the Linux /proc filesystem
+dnl
+dnl usage:         AC_DNET_LINUX_PROCFS
+dnl results:       HAVE_LINUX_PROCFS
+dnl
+AC_DEFUN(AC_DNET_LINUX_PROCFS,
+    [AC_MSG_CHECKING(for Linux proc filesystem)
+    AC_CACHE_VAL(ac_cv_dnet_linux_procfs,
+              if test "x`cat /proc/sys/kernel/ostype 2>&-`" =3D "xLinux" ;=
 then
+                  ac_cv_dnet_linux_procfs=3Dyes
+        else
+                  ac_cv_dnet_linux_procfs=3Dno
+              fi)
+    AC_MSG_RESULT($ac_cv_dnet_linux_procfs)
+    if test $ac_cv_dnet_linux_procfs =3D yes ; then
+              AC_DEFINE(HAVE_LINUX_PROCFS, 1,
+                                [Define if you have the Linux /proc filesy=
stem.])
+    fi])
+
+dnl
+dnl Check for Linux PF_PACKET sockets
+dnl
+dnl usage:         AC_DNET_LINUX_PF_PACKET
+dnl results:       HAVE_LINUX_PF_PACKET
+dnl
+AC_DEFUN(AC_DNET_LINUX_PF_PACKET,
+    [AC_MSG_CHECKING(for Linux PF_PACKET sockets)
+    AC_CACHE_VAL(ac_cv_dnet_linux_pf_packet,
+              if test -f /usr/include/netpacket/packet.h ; then
+                  ac_cv_dnet_linux_pf_packet=3Dyes
+              else
+                  ac_cv_dnet_linux_pf_packet=3Dno
+              fi)
+    AC_MSG_RESULT($ac_cv_dnet_linux_pf_packet)
+    if test $ac_cv_dnet_linux_pf_packet =3D yes ; then
+              AC_DEFINE(HAVE_LINUX_PF_PACKET, 1,
+                                [Define if you have Linux PF_PACKET socket=
s.])
+    fi])
+
+dnl
+dnl Check for SNMP MIB2 STREAMS (Solaris only?)
+dnl
+dnl usage:      AC_DNET_STREAMS_MIB2
+dnl results:    HAVE_STREAMS_MIB2
+dnl
+AC_DEFUN(AC_DNET_STREAMS_MIB2,
+    [AC_MSG_CHECKING(for SNMP MIB2 STREAMS)
+    AC_CACHE_VAL(ac_cv_dnet_streams_mib2,
+        if test -f /usr/include/inet/mib2.h -a -c /dev/ip ; then
+            ac_cv_dnet_streams_mib2=3Dyes
+        else
+            ac_cv_dnet_streams_mib2=3Dno
+        fi)
+    AC_MSG_RESULT($ac_cv_dnet_streams_mib2)
+    if test $ac_cv_dnet_streams_mib2 =3D yes ; then
+        AC_DEFINE(HAVE_STREAMS_MIB2, 1,
+                  [Define if you have SNMP MIB2 STREAMS.])
+    fi])
+
+dnl
+dnl Check for route(7) STREAMS (UnixWare only?)
+dnl
+dnl usage:      AC_DNET_STREAMS_ROUTE
+dnl results:    HAVE_STREAMS_ROUTE
+dnl
+AC_DEFUN(AC_DNET_STREAMS_ROUTE,
+    [AC_MSG_CHECKING(for route(7) STREAMS)
+    AC_CACHE_VAL(ac_cv_dnet_streams_route,
+        if grep RTSTR_SEND /usr/include/net/route.h >/dev/null 2>&1 ; then
+            ac_cv_dnet_streams_route=3Dyes
+        else
+            ac_cv_dnet_streams_route=3Dno
+        fi)
+    AC_MSG_RESULT($ac_cv_dnet_streams_route)
+    if test $ac_cv_dnet_streams_route =3D yes ; then
+        AC_DEFINE(HAVE_STREAMS_ROUTE, 1,
+                  [Define if you have route(7) STREAMS.])
+    fi])
+
+dnl
+dnl Check for arp(7) ioctls
+dnl
+dnl usage:      AC_DNET_IOCTL_ARP
+dnl results:    HAVE_IOCTL_ARP
+dnl
+AC_DEFUN(AC_DNET_IOCTL_ARP,
+    [AC_MSG_CHECKING(for arp(7) ioctls)
+    AC_CACHE_VAL(ac_cv_dnet_ioctl_arp,
+              AC_EGREP_CPP(werd, [
+#           include <sys/types.h>
+#           define BSD_COMP
+#           include <sys/ioctl.h>
+#           ifdef SIOCGARP
+              werd
+#           endif],
+              ac_cv_dnet_ioctl_arp=3Dyes,
+              ac_cv_dnet_ioctl_arp=3Dno))
+    case "$host_os" in
+    irix*)
+        ac_cv_dnet_ioctl_arp=3Dno ;;
+    esac
+    AC_MSG_RESULT($ac_cv_dnet_ioctl_arp)
+    if test $ac_cv_dnet_ioctl_arp =3D yes ; then
+        AC_DEFINE(HAVE_IOCTL_ARP, 1,
+                  [Define if you have arp(7) ioctls.])
+    fi])
+
+dnl
+dnl Check for raw IP sockets ip_{len,off} host byte ordering
+dnl
+dnl usage:      AC_DNET_RAWIP_HOST_OFFLEN
+dnl results:    HAVE_RAWIP_HOST_OFFLEN
+dnl
+AC_DEFUN(AC_DNET_RAWIP_HOST_OFFLEN,
+    [AC_MSG_CHECKING([for raw IP sockets ip_{len,off} host byte ordering])
+    AC_CACHE_VAL(ac_cv_dnet_rawip_host_offlen, [
+              case "$host_os" in
+              *openbsd*)
+                  ac_cv_dnet_rawip_host_offlen=3Dno ;;
+              *bsd*|*darwin*|*osf*|*unixware*)
+                  ac_cv_dnet_rawip_host_offlen=3Dyes ;;
+              *)
+                  ac_cv_dnet_rawip_host_offlen=3Dno ;;
+              esac])
+    AC_MSG_RESULT($ac_cv_dnet_rawip_host_offlen)
+    if test $ac_cv_dnet_rawip_host_offlen =3D yes ; then
+        AC_DEFINE(HAVE_RAWIP_HOST_OFFLEN, 1,
+                  [Define if raw IP sockets require host byte ordering for=
 ip_off, ip_len.])
+    fi])
+
+dnl
+dnl Check for cooked raw IP sockets
+dnl
+dnl usage:      AC_DNET_RAWIP_COOKED
+dnl results:    HAVE_RAWIP_COOKED
+dnl
+AC_DEFUN(AC_DNET_RAWIP_COOKED,
+    [AC_MSG_CHECKING(for cooked raw IP sockets)
+    AC_CACHE_VAL(ac_cv_dnet_rawip_cooked, [
+              case "$host_os" in
+              solaris*|irix*)
+                  ac_cv_dnet_rawip_cooked=3Dyes ;;
+              *)
+                  ac_cv_dnet_rawip_cooked=3Dno ;;
+              esac])
+    AC_MSG_RESULT($ac_cv_dnet_rawip_cooked)
+    if test $ac_cv_dnet_rawip_cooked =3D yes ; then
+        AC_DEFINE(HAVE_RAWIP_COOKED, 1,
+                  [Define if you have cooked raw IP sockets.])
+    fi])
+
+dnl
+dnl AC_LBL_LIBRARY_NET
+dnl
+dnl This test is for network applications that need socket() and
+dnl gethostbyname() -ish functions.  Under Solaris, those applications
+dnl need to link with "-lsocket -lnsl".  Under IRIX, they need to link
+dnl with "-lnsl" but should *not* link with "-lsocket" because
+dnl libsocket.a breaks a number of things (for instance:
+dnl gethostbyname() under IRIX 5.2, and snoop sockets under most
+dnl versions of IRIX).
+dnl
+dnl Unfortunately, many application developers are not aware of this,
+dnl and mistakenly write tests that cause -lsocket to be used under
+dnl IRIX.  It is also easy to write tests that cause -lnsl to be used
+dnl under operating systems where neither are necessary (or useful),
+dnl such as SunOS 4.1.4, which uses -lnsl for TLI.
+dnl
+dnl This test exists so that every application developer does not test
+dnl this in a different, and subtly broken fashion.
+
+dnl It has been argued that this test should be broken up into two
+dnl seperate tests, one for the resolver libraries, and one for the
+dnl libraries necessary for using Sockets API. Unfortunately, the two
+dnl are carefully intertwined and allowing the autoconf user to use
+dnl them independantly potentially results in unfortunate ordering
+dnl dependancies -- as such, such component macros would have to
+dnl carefully use indirection and be aware if the other components were
+dnl executed. Since other autoconf macros do not go to this trouble,
+dnl and almost no applications use sockets without the resolver, this
+dnl complexity has not been implemented.
+dnl
+dnl The check for libresolv is in case you are attempting to link
+dnl statically and happen to have a libresolv.a lying around (and no
+dnl libnsl.a).
+dnl
+AC_DEFUN(AC_LBL_LIBRARY_NET, [
+    # Most operating systems have gethostbyname() in the default searched
+    # libraries (i.e. libc):
+    AC_CHECK_FUNC(gethostbyname, ,
+        # Some OSes (eg. Solaris) place it in libnsl:
+        AC_CHECK_LIB(nsl, gethostbyname, ,
+            # Some strange OSes (SINIX) have it in libsocket:
+            AC_CHECK_LIB(socket, gethostbyname, ,
+                # Unfortunately libsocket sometimes depends on libnsl.
+                # AC_CHECK_LIB's API is essentially broken so the
+                # following ugliness is necessary:
+                AC_CHECK_LIB(socket, gethostbyname,
+                    LIBS=3D"-lsocket -lnsl $LIBS",
+                    AC_CHECK_LIB(resolv, gethostbyname),
+                    -lnsl))))
+    AC_CHECK_FUNC(socket, , AC_CHECK_LIB(socket, socket, ,
+        AC_CHECK_LIB(socket, socket, LIBS=3D"-lsocket -lnsl $LIBS", ,
+            -lnsl)))
+    # DLPI needs putmsg under HPUX so test for -lstr while we're at it
+    AC_CHECK_LIB(str, putmsg)
+    ])
+
diff --git a/meta-arago-distro/recipes-connectivity/libdnet/libdnet_1.12.bb=
 b/meta-arago-distro/recipes-connectivity/libdnet/libdnet_1.12.bb
new file mode 100755
index 0000000..ad84d90
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/libdnet/libdnet_1.12.bb
@@ -0,0 +1,25 @@
+DESCRIPTION =3D "dumb networking library"
+HOMEPAGE =3D "http://code.google.com/p/libdnet/"
+LICENSE =3D "BSD"
+SECTION =3D "libs"
+PRIORITY =3D "optional"
+
+LIC_FILES_CHKSUM =3D "file://Makefile.in;endline=3D14;md5=3D764d2275f40f1a=
67205558dd2af91708<file:///\\Makefile.in;endline=3D14;md5=3D764d2275f40f1a6=
7205558dd2af91708>"
Similar comment as my previous email. I wouldn't use a Makefile.in to grab =
license information especially now that you have a LICENSE file to use.
+
+SRC_URI =3D " \
+    http://libdnet.googlecode.com/files/libdnet-${PV}.tgz<http://libdnet.g=
ooglecode.com/files/libdnet-$%7bPV%7d.tgz> \
+    file://acinclude.m4<file:///\\acinclude.m4> \
+    "
+
+inherit autotools
+
+PR =3D "r1"
+
+SRC_URI[md5sum] =3D "9253ef6de1b5e28e9c9a62b882e44cc9"
+SRC_URI[sha256sum] =3D "83b33039787cf99990e977cef7f18a5d5e7aaffc4505548a83=
d31bd3515eb026"
+
+do_configure_prepend() {
+    cp ${WORKDIR}/acinclude.m4 ${S}
+}
+
\ No newline at end of file
--
1.7.9.5


--_000_8F29D6B095ED194EA1980491A5E029710C395393DFLE09entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ara=
go-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org]
<b>On Behalf Of </b>Zhou, Jingting<br>
<b>Sent:</b> Monday, February 18, 2013 8:48 PM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> [meta-arago] libdnet recipe review<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">From aa3305b2ebeaaa8a291f86606b4d3a1eb4c43c41 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Jingting Zhou &lt;a0221004@ares-ubuntu&gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">Date: Mon, 18 Feb 2013 17:56:28 -0500<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] added libdnet recipe<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../libdnet/files/acinclude.m4&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 320 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p=
>
<p class=3D"MsoNormal">.../recipes-connectivity/libdnet/libdnet_1.12.bb&nbs=
p;&nbsp; |&nbsp;&nbsp; 25 &#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">2 files changed, 345 insertions(&#43;)<o:p></o:p></p=
>
<p class=3D"MsoNormal">create mode 100755 meta-arago-distro/recipes-connect=
ivity/libdnet/files/acinclude.m4<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-distro/recipes-connect=
ivity/libdnet/libdnet_1.12.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-connectivity/=
libdnet/files/acinclude.m4 b/meta-arago-distro/recipes-connectivity/libdnet=
/files/acinclude.m4<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..492da6f<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-distro/recipes-connecti=
vity/libdnet/files/acinclude.m4<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,320 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Check for 4.4 BSD sa_len member in sockaddr=
 struct<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl usage:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; AC_DNET_SOCKADDR_SA_LEN<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl results:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; HAVE_SOCKADDR_SA_LEN (defined)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_DNET_SOCKADDR_SA_LEN,<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [AC_MSG_CHECKING(for sa_len =
in sockaddr struct)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CACHE_VAL(ac_cv_dnet_sock=
addr_has_sa_len,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_T=
RY_COMPILE([<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# ifndef _SOCKADDR_LEN<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; define _SOCKADDR_LEN 1 <o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# endif<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; include &=
lt;sys/types.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; include &=
lt;sys/socket.h&gt;],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [u_i=
nt i =3D sizeof(((struct sockaddr *)0)-&gt;sa_len)],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ac_c=
v_dnet_sockaddr_has_sa_len=3Dyes,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ac_c=
v_dnet_sockaddr_has_sa_len=3Dno))<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT($ac_cv_dnet_so=
ckaddr_has_sa_len)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; if test $ac_cv_dnet_sockaddr=
_has_sa_len =3D yes ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; AC_DEFINE(HAVE_SOCKADDR_SA_LEN, 1,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; [Define if sockaddr struct has sa_len.])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; fi])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Check for sockaddr_in6 struct in &lt;netine=
t/in.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl usage:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; AC_DNET_SOCKADDR_IN6<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl results:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; HAVE_SOCKADDR_IN6<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_DNET_SOCKADDR_IN6,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [AC_MSG_CHECKING(for sockadd=
r_in6 struct in &lt;netinet/in.h&gt;)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; &nbsp;&nbsp;AC_CACHE_VAL(ac_cv_dnet_neti=
net_in_h_has_sockaddr_in6,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_T=
RY_COMPILE([<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; include &=
lt;sys/types.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; include &lt;sys/socket.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; include &=
lt;netinet/in.h&gt;],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [str=
uct sockaddr_in6 sin6; sin6.sin6_family =3D AF_INET6;],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ac_cv_dnet_netinet_in_h_has_sockaddr_in6=3D=
yes,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ac_cv_dnet_netinet_in_h_has_sockaddr_in6=3D=
no))<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT($ac_cv_dnet_ne=
tinet_in_h_has_sockaddr_in6)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; if test $ac_cv_dnet_netinet_=
in_h_has_sockaddr_in6 =3D yes ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_D=
EFINE(HAVE_SOCKADDR_IN6, 1,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; [Define if &lt;netinet/in.h&gt; has sockaddr_in6 struct.])<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; fi])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Check for arp_dev member in arpreq struct<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl usage:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; AC_DNET_ARPREQ_ARP_DEV<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl results:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; HAVE_ARPREQ_ARP_DEV (defined)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_DNET_ARPREQ_ARP_DEV,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp; &nbsp;[AC_MSG_CHECKING(for arp_dev=
 in arpreq struct)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CACHE_VAL(ac_cv_dnet_arpr=
eq_has_arp_dev,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_TRY_COMPILE([<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; include &=
lt;sys/types.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; include &lt;sys/socket.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; include &lt;net/if_arp.h&gt;],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [void *p =3D ((struct arpreq *)0)-&gt;arp_d=
ev],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ac_cv_dnet_arpreq_has_arp_dev=3Dyes,<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ac_cv_dnet_arpreq_has_arp_dev=3Dno))<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT($ac_cv_dnet_ar=
preq_has_arp_dev)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; if test $ac_cv_dnet_arpreq_h=
as_arp_dev =3D yes ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_DEFINE(HAVE_ARPREQ_ARP_DEV, 1,<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Define if arpreq stru=
ct has arp_dev.])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; fi])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Check for rt_msghdr struct in &lt;net/route=
.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl usage:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; AC_DNET_ROUTE_RT_MSGHDR<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl results:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; HAVE_ROUTE_RT_MSGHDR<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_DNET_ROUTE_RT_MSGHDR,<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [AC_MSG_CHECKING(for rt_msgh=
dr struct in &lt;net/route.h&gt;)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CACHE_VAL(ac_cv_dnet_rout=
e_h_has_rt_msghdr,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_T=
RY_COMPILE([<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; include &=
lt;sys/types.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; include &=
lt;sys/socket.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; include &=
lt;net/if.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; include &=
lt;net/route.h&gt;],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [str=
uct rt_msghdr rtm; rtm.rtm_msglen =3D 0;],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ac_cv_dnet_route_h_has_rt_msghdr=3Dyes,<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ac_cv_dnet_route_h_has_rt_msghdr=3Dno))<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT($ac_cv_dnet_ro=
ute_h_has_rt_msghdr)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; if test $ac_cv_dnet_route_h_=
has_rt_msghdr =3D yes ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_D=
EFINE(HAVE_ROUTE_RT_MSGHDR, 1,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; [Define if &lt;net/route.h&gt; has rt_msghdr struct.])<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; fi])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Check for the Berkeley Packet Filter<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl usage:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; AC_DNET_BSD_BPF<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl results:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; HAVE_BSD_BPF<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_DNET_BSD_BPF,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [AC_MSG_CHECKING(for Berkele=
y Packet Filter)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CACHE_VAL(ac_cv_dnet_bsd_=
bpf,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if test -c /dev/bpf0 ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ac_cv_dnet_bsd_bpf=3Dyes=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ac_cv_dnet_bsd_bpf=3Dno<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT($ac_cv_dnet_bs=
d_bpf)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; if test $ac_cv_dnet_bsd_bpf =
=3D yes ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_DEFINE(HAVE_BSD_BPF, 1,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; [Define if you =
have the Berkeley Packet Filter.])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; fi])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Check for the Linux /proc filesystem<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl usage:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; AC_DNET_LINUX_PROCFS<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl results:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; HAVE_LINUX_PROCFS<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_DNET_LINUX_PROCFS,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [AC_MSG_CHECKING(for Linux p=
roc filesystem)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CACHE_VAL(ac_cv_dnet_linu=
x_procfs,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if test &quot;x`cat /proc/sys/kernel/ostype=
 2&gt;&amp;-`&quot; =3D &quot;xLinux&quot; ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ac_cv_dnet_linux_procfs=
=3Dyes<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ac_cv_dnet_linux_procfs=
=3Dno<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT($ac_cv_dnet_li=
nux_procfs)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp; &nbsp;if test $ac_cv_dnet_linux_pr=
ocfs =3D yes ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_DEFINE(HAVE_LINUX_PROCFS, 1,<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; [Define if you =
have the Linux /proc filesystem.])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; fi])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Check for Linux PF_PACKET sockets<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl usage:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; AC_DNET_LINUX_PF_PACKET<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl results:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; HAVE_LINUX_PF_PACKET<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_DNET_LINUX_PF_PACKET,<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [AC_MSG_CHECKING(for Linux P=
F_PACKET sockets)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CACHE_VAL(ac_cv_dnet_linu=
x_pf_packet,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if test -f /usr/include/netpacket/packet.h =
; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ac_cv_dnet_linux_pf_pack=
et=3Dyes<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ac_cv_dnet_linux_pf_pack=
et=3Dno<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT($ac_cv_dnet_li=
nux_pf_packet)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; if test $ac_cv_dnet_linux_pf=
_packet =3D yes ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_DEFINE(HAVE_LINUX_PF_PACKET, 1,<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; [Define if you =
have Linux PF_PACKET sockets.])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; fi])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Check for SNMP MIB2 STREAMS (Solaris only?)=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl usage:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_DNE=
T_STREAMS_MIB2<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl results:&nbsp;&nbsp;&nbsp; HAVE_STREAMS_MIB=
2<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_DNET_STREAMS_MIB2,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [AC_MSG_CHECKING(for SNMP MI=
B2 STREAMS)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CACHE_VAL(ac_cv_dnet_stre=
ams_mib2,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if t=
est -f /usr/include/inet/mib2.h -a -c /dev/ip ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ac_cv_dnet_streams_mib2=3Dyes<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ac_cv_dnet_streams_mib2=3Dno<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi)<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT($ac_cv_dnet_st=
reams_mib2)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; if test $ac_cv_dnet_streams_=
mib2 =3D yes ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_D=
EFINE(HAVE_STREAMS_MIB2, 1,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Define if you have=
 SNMP MIB2 STREAMS.])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; fi])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Check for route(7) STREAMS (UnixWare only?)=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl usage:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_DNE=
T_STREAMS_ROUTE<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl results:&nbsp;&nbsp;&nbsp; HAVE_STREAMS_ROU=
TE<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_DNET_STREAMS_ROUTE,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [AC_MSG_CHECKING(for route(7=
) STREAMS)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CACHE_VAL(ac_cv_dnet_stre=
ams_route,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if g=
rep RTSTR_SEND /usr/include/net/route.h &gt;/dev/null 2&gt;&amp;1 ; then<o:=
p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;ac_cv_dnet_streams_route=3Dyes<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ac_cv_dnet_streams_route=3Dno<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi)<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT($ac_cv_dnet_st=
reams_route)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; if test $ac_cv_dnet_streams_=
route =3D yes ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_D=
EFINE(HAVE_STREAMS_ROUTE, 1,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Define if you have=
 route(7) STREAMS.])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; fi])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Check for arp(7) ioctls<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl usage:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_DNE=
T_IOCTL_ARP<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl results:&nbsp;&nbsp;&nbsp; HAVE_IOCTL_ARP<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_DNET_IOCTL_ARP,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [AC_MSG_CHECKING(for arp(7) =
ioctls)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp; &nbsp;AC_CACHE_VAL(ac_cv_dnet_ioct=
l_arp,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_EGREP_CPP(werd, [<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; include &lt;sys/types.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; define BSD_COMP<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; include &lt;sys/ioctl.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ifdef SIOCGARP<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; werd<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; endif],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ac_cv_dnet_ioctl_arp=3Dyes,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ac_cv_dnet_ioctl_arp=3Dno))<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; case &quot;$host_os&quot; in=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; irix*)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ac_c=
v_dnet_ioctl_arp=3Dno ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; esac<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT($ac_cv_dnet_io=
ctl_arp)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; if test $ac_cv_dnet_ioctl_ar=
p =3D yes ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_D=
EFINE(HAVE_IOCTL_ARP, 1,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Define if you have=
 arp(7) ioctls.])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; fi])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Check for raw IP sockets ip_{len,off} host =
byte ordering<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl usage:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_DNE=
T_RAWIP_HOST_OFFLEN<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl results:&nbsp;&nbsp;&nbsp; HAVE_RAWIP_HOST_=
OFFLEN<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_DNET_RAWIP_HOST_OFFLEN,<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [AC_MSG_CHECKING([for raw IP=
 sockets ip_{len,off} host byte ordering])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CACHE_VAL(ac_cv_dnet_rawi=
p_host_offlen, [<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case &quot;$host_os&quot; in<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *openbsd*)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ac_cv_dnet_rawip_host_of=
flen=3Dno ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *bsd*|*darwin*|*osf*|*unixware*)<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ac_cv_dnet_rawip_host_of=
flen=3Dyes ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ac_cv_dnet_rawip_host_of=
flen=3Dno ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; esac])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT($ac_cv_dnet_ra=
wip_host_offlen)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; if test $ac_cv_dnet_rawip_ho=
st_offlen =3D yes ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_D=
EFINE(HAVE_RAWIP_HOST_OFFLEN, 1,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Define if raw IP s=
ockets require host byte ordering for ip_off, ip_len.])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; fi])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Check for cooked raw IP sockets<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl usage:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_DNE=
T_RAWIP_COOKED<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl results:&nbsp;&nbsp;&nbsp; HAVE_RAWIP_COOKE=
D<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_DNET_RAWIP_COOKED,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [AC_MSG_CHECKING(for cooked =
raw IP sockets)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CACHE_VAL(ac_cv_dnet_rawi=
p_cooked, [<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case &quot;$host_os&quot; in<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; solaris*|irix*)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ac_cv_dnet_rawip_cooked=
=3Dyes ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ac_cv_dnet_rawip_cooked=
=3Dno ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; esac])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT($ac_cv_dnet_ra=
wip_cooked)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; if test $ac_cv_dnet_rawip_co=
oked =3D yes ; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_D=
EFINE(HAVE_RAWIP_COOKED, 1,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Define if you have=
 cooked raw IP sockets.])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; fi])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl AC_LBL_LIBRARY_NET<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl This test is for network applications that =
need socket() and<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl gethostbyname() -ish functions.&nbsp; Under=
 Solaris, those applications<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl need to link with &quot;-lsocket -lnsl&quot=
;.&nbsp; Under IRIX, they need to link<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl with &quot;-lnsl&quot; but should *not* lin=
k with &quot;-lsocket&quot; because<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl libsocket.a breaks a number of things (for =
instance:<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl gethostbyname() under IRIX 5.2, and snoop s=
ockets under most<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl versions of IRIX).<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Unfortunately, many application developers =
are not aware of this,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl and mistakenly write tests that cause -lsoc=
ket to be used under<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl IRIX.&nbsp; It is also easy to write tests =
that cause -lnsl to be used<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl under operating systems where neither are n=
ecessary (or useful),<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl such as SunOS 4.1.4, which uses -lnsl for T=
LI.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl This test exists so that every application =
developer does not test<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl this in a different, and subtly broken fash=
ion.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl It has been argued that this test should be=
 broken up into two<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl seperate tests, one for the resolver librar=
ies, and one for the<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl libraries necessary for using Sockets API. =
Unfortunately, the two<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl are carefully intertwined and allowing the =
autoconf user to use<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl them independantly potentially results in u=
nfortunate ordering<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl dependancies -- as such, such component mac=
ros would have to<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl carefully use indirection and be aware if t=
he other components were<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl executed. Since other autoconf macros do no=
t go to this trouble,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl and almost no applications use sockets with=
out the resolver, this<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl complexity has not been implemented.<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl The check for libresolv is in case you are =
attempting to link<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl statically and happen to have a libresolv.a=
 lying around (and no<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl libnsl.a).<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN(AC_LBL_LIBRARY_NET, [<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; # Most operating systems hav=
e gethostbyname() in the default searched<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; # libraries (i.e. libc):<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CHECK_FUNC(gethostbyname,=
 ,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # So=
me OSes (eg. Solaris) place it in libnsl:<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_C=
HECK_LIB(nsl, gethostbyname, , <o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; # Some strange OSes (SINIX) have it in libsocket:<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; AC_CHECK_LIB(socket, gethostbyname, ,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Unfortunately libsocket somet=
imes depends on libnsl.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # AC_CHECK_LIB's API is essenti=
ally broken so the<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # following ugliness is necessa=
ry:<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;AC_CHECK_LIB(socket, gethostbyn=
ame,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBS=3D=
&quot;-lsocket -lnsl $LIBS&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_CHEC=
K_LIB(resolv, gethostbyname),<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -lnsl))=
))<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CHECK_FUNC(socket, , AC_C=
HECK_LIB(socket, socket, ,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_C=
HECK_LIB(socket, socket, LIBS=3D&quot;-lsocket -lnsl $LIBS&quot;, ,<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; -lnsl)))<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; # DLPI needs putmsg under HP=
UX so test for -lstr while we're at it<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_CHECK_LIB(str, putmsg)<o:=
p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-connectivity/=
libdnet/libdnet_1.12.bb b/meta-arago-distro/recipes-connectivity/libdnet/li=
bdnet_1.12.bb<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..ad84d90<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-distro/recipes-connecti=
vity/libdnet/libdnet_1.12.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,25 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DESCRIPTION =3D &quot;dumb networking library&q=
uot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;HOMEPAGE =3D &quot;<a href=3D"http://code.googl=
e.com/p/libdnet/">http://code.google.com/p/libdnet/</a>&quot;<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;LICENSE =3D &quot;BSD&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SECTION =3D &quot;libs&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PRIORITY =3D &quot;optional&quot;<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file:///\=
\Makefile.in;endline=3D14;md5=3D764d2275f40f1a67205558dd2af91708">file://Ma=
kefile.in;endline=3D14;md5=3D764d2275f40f1a67205558dd2af91708</a>&quot;<o:p=
></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Similar comment as my =
previous email. I wouldn&#8217;t use a Makefile.in to grab license informat=
ion especially now that you have a LICENSE file to use.<o:p></o:p></span></=
p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI =3D &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; <a href=3D"http://libdnet.go=
oglecode.com/files/libdnet-$%7bPV%7d.tgz">
http://libdnet.googlecode.com/files/libdnet-${PV}.tgz</a> \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\acinclu=
de.m4">file://acinclude.m4</a> \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; &quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;inherit autotools<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PR =3D &quot;r1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[md5sum] =3D &quot;9253ef6de1b5e28e9c9a6=
2b882e44cc9&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[sha256sum] =3D &quot;83b33039787cf99990=
e977cef7f18a5d5e7aaffc4505548a83d31bd3515eb026&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do_configure_prepend() {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; cp ${WORKDIR}/acinclude.m4 $=
{S}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">\ No newline at end of file<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.9.5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C395393DFLE09entticom_--
