Return-Path: <zhoujt@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3F1B852A1D
	for <meta-arago@arago-project.org>;
	Tue, 19 Feb 2013 02:50:54 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1J2oraU024936
	for <meta-arago@arago-project.org>; Mon, 18 Feb 2013 20:50:53 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1J2or7g012513
	for <meta-arago@arago-project.org>; Mon, 18 Feb 2013 20:50:53 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 18 Feb 2013 20:50:53 -0600
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: ndisc6 recipe
Thread-Index: Ac4OS+zDT4WEJvUNQbiuwueF/ldVjQ==
Date: Tue, 19 Feb 2013 02:50:53 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E391A192@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: ndisc6 recipe
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
X-List-Received-Date: Tue, 19 Feb 2013 02:50:54 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3C08AEEB3C731745938BC83D029FE5E391A192DFLE09entticom_"

--_000_3C08AEEB3C731745938BC83D029FE5E391A192DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From 7440716207a84c3a9bd772005155e295c6583f13 Mon Sep 17 00:00:00 2001
From: Jingting Zhou <a0221004@ares-ubuntu>
Date: Mon, 18 Feb 2013 18:00:57 -0500
Subject: [PATCH] added ndisc6 recipe

---
.../recipes-connectivity/ndisc6/files/acinclude.m4 |  197 +++++++++++++++++=
+++
.../ndisc6/files/autoconf-older-version.patch      |   14 ++
.../recipes-connectivity/ndisc6/ndisc6_0.6.7.bb    |   66 +++++++
3 files changed, 277 insertions(+)
create mode 100755 meta-arago-distro/recipes-connectivity/ndisc6/files/acin=
clude.m4
create mode 100755 meta-arago-distro/recipes-connectivity/ndisc6/files/auto=
conf-older-version.patch
create mode 100755 meta-arago-distro/recipes-connectivity/ndisc6/ndisc6_0.6=
.7.bb

diff --git a/meta-arago-distro/recipes-connectivity/ndisc6/files/acinclude.=
m4 b/meta-arago-distro/recipes-connectivity/ndisc6/files/acinclude.m4
new file mode 100755
index 0000000..5360fff
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/ndisc6/files/acinclude.m4
@@ -0,0 +1,197 @@
+# _AC_C_STD_TRY(STANDARD, TEST-PROLOGUE, TEST-BODY, OPTION-LIST,
+#                           ACTION-IF-AVAILABLE, ACTION-IF-UNAVAILABLE)
+# --------------------------------------------------------------
+# Check whether the C compiler accepts features of STANDARD (e.g `c89', `c=
99')
+# by trying to compile a program of TEST-PROLOGUE and TEST-BODY.  If this =
fails,
+# try again with each compiler option in the space-separated OPTION-LIST; =
if one
+# helps, append it to CC.  If eventually successful, run ACTION-IF-AVAILAB=
LE,
+# else ACTION-IF-UNAVAILABLE.
+AC_DEFUN([_AC_C_STD_TRY],
+[AC_MSG_CHECKING([for $CC option to accept ISO ]m4_translit($1, [c], [C]))
+AC_CACHE_VAL(ac_cv_prog_cc_$1,
+[ac_cv_prog_cc_$1=3Dno
+ac_save_CC=3D$CC
+AC_LANG_CONFTEST([AC_LANG_PROGRAM([$2], [$3])])
+for ac_arg in '' $4
+do
+  CC=3D"$ac_save_CC $ac_arg"
+  _AC_COMPILE_IFELSE([], [ac_cv_prog_cc_$1=3D$ac_arg])
+  test "x$ac_cv_prog_cc_$1" !=3D "xno" && break
+done
+rm -f conftest.$ac_ext
+CC=3D$ac_save_CC
+])# AC_CACHE_VAL
+case "x$ac_cv_prog_cc_$1" in
+  x)
+    AC_MSG_RESULT([none needed]) ;;
+  xno)
+    AC_MSG_RESULT([unsupported]) ;;
+  *)
+    CC=3D"$CC $ac_cv_prog_cc_$1"
+    AC_MSG_RESULT([$ac_cv_prog_cc_$1]) ;;
+esac
+AS_IF([test "x$ac_cv_prog_cc_$1" !=3D xno], [$5], [$6])
+])# _AC_C_STD_TRY
+
+# _AC_PROG_CC_C99 ([ACTION-IF-AVAILABLE], [ACTION-IF-UNAVAILABLE])
+# ----------------------------------------------------------------
+# If the C compiler is not in ISO C99 mode by default, try to add an
+# option to output variable CC to make it so.  This macro tries
+# various options that select ISO C99 on some system or another.  It
+# considers the compiler to be in ISO C99 mode if it handles mixed
+# code and declarations, _Bool, inline and restrict.
+AC_DEFUN([_AC_PROG_CC_C99],
+[_AC_C_STD_TRY([c99],
+[[#include <stdarg.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <wchar.h>
+#include <stdio.h>
+
+struct incomplete_array
+{
+  int datasize;
+  double data[];
+};
+
+struct named_init {
+  int number;
+  const wchar_t *name;
+  double average;
+};
+
+typedef const char *ccp;
+
+static inline int
+test_restrict(ccp restrict text)
+{
+  // See if C++-style comments work.
+  // Iterate through items via the restricted pointer.
+  // Also check for declarations in for loops.
+  for (unsigned int i =3D 0; *(text+i) !=3D '\0'; ++i)
+    continue;
+  return 0;
+}
+
+// Check varargs and va_copy work.
+static void
+test_varargs(const char *format, ...)
+{
+  va_list args;
+  va_start(args, format);
+  va_list args_copy;
+  va_copy(args_copy, args);
+
+  const char *str;
+  int number;
+  float fnumber;
+
+  while (*format)
+    {
+      switch (*format++)
+              {
+              case 's': // string
+                str =3D va_arg(args_copy, const char *);
+                break;
+              case 'd': // int
+                number =3D va_arg(args_copy, int);
+                break;
+              case 'f': // float
+                fnumber =3D (float) va_arg(args_copy, double);
+                break;
+              default:
+                break;
+              }
+    }
+  va_end(args_copy);
+  va_end(args);
+}
+]],
+[[
+  // Check bool and long long datatypes.
+  _Bool success =3D false;
+  long long int bignum =3D -1234567890LL;
+  unsigned long long int ubignum =3D 1234567890uLL;
+
+  // Check restrict.
+  if (test_restrict("String literal") !=3D 0)
+    success =3D true;
+  char *restrict newvar =3D "Another string";
+
+  // Check varargs.
+  test_varargs("s, d' f .", "string", 65, 34.234);
+
+  // Check incomplete arrays work.
+  struct incomplete_array *ia =3D
+    malloc(sizeof(struct incomplete_array) + (sizeof(double) * 10));
+  ia->datasize =3D 10;
+  for (int i =3D 0; i < ia->datasize; ++i)
+    ia->data[i] =3D (double) i * 1.234;
+
+  // Check named initialisers.
+  struct named_init ni =3D {
+    .number =3D 34,
+    .name =3D L"Test wide string",
+    .average =3D 543.34343,
+  };
+
+  ni.number =3D 58;
+
+  int dynamic_array[ni.number];
+  dynamic_array[43] =3D 543;
+
+  // work around unused variable warnings
+  return  bignum =3D=3D 0LL || ubignum =3D=3D 0uLL || newvar[0] =3D=3D 'x'=
;
+]],
+dnl Try
+dnl GCC                              -std=3Dgnu99 (unused restrictive mode=
s: -std=3Dc99 -std=3Diso9899:1999)
+dnl AIX                               -qlanglvl=3Dextc99 (unused restricti=
ve mode: -qlanglvl=3Dstdc99)
+dnl Intel ICC     -c99
+dnl IRIX              -c99
+dnl Solaris        (unused because it causes the compiler to assume C99 se=
mantics for
+dnl                       library functions, and this is invalid before So=
laris 10: -xc99)
+dnl Tru64           -c99
+dnl with extended modes being tried first.
+[[-std=3Dgnu99 -c99 -qlanglvl=3Dextc99]], [$1], [$2])[]dnl
+])# _AC_PROG_CC_C99
+
+# AC_PROG_CC_C99
+# --------------
+AC_DEFUN([AC_PROG_CC_C99],
+[ AC_REQUIRE([AC_PROG_CC])dnl
+  _AC_PROG_CC_C99
+])
+
+# AC_USE_SYSTEM_EXTENSIONS
+# ------------------------
+# Enable extensions on systems that normally disable them,
+# typically due to standards-conformance issues.
+AC_DEFUN([AC_USE_SYSTEM_EXTENSIONS],
+[
+  AC_BEFORE([$0], [AC_COMPILE_IFELSE])
+  AC_BEFORE([$0], [AC_RUN_IFELSE])
+
+  AC_REQUIRE([AC_GNU_SOURCE])
+  AC_REQUIRE([AC_AIX])
+  AC_REQUIRE([AC_MINIX])
+
+  AH_VERBATIM([__EXTENSIONS__],
+[/* Enable extensions on Solaris.  */
+#ifndef __EXTENSIONS__
+# undef __EXTENSIONS__
+#endif
+#ifndef _POSIX_PTHREAD_SEMANTICS
+# undef _POSIX_PTHREAD_SEMANTICS
+#endif])
+  AC_CACHE_CHECK([whether it is safe to define __EXTENSIONS__],
+    [ac_cv_safe_to_define___extensions__],
+    [AC_COMPILE_IFELSE(
+       [AC_LANG_PROGRAM([
+#             define __EXTENSIONS__ 1
+                AC_INCLUDES_DEFAULT])],
+       [ac_cv_safe_to_define___extensions__=3Dyes],
+       [ac_cv_safe_to_define___extensions__=3Dno])])
+  test $ac_cv_safe_to_define___extensions__ =3D yes &&
+    AC_DEFINE([__EXTENSIONS__])
+  AC_DEFINE([_POSIX_PTHREAD_SEMANTICS])
+])
diff --git a/meta-arago-distro/recipes-connectivity/ndisc6/files/autoconf-o=
lder-version.patch b/meta-arago-distro/recipes-connectivity/ndisc6/files/au=
toconf-older-version.patch
new file mode 100755
index 0000000..0ab0fd1
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/ndisc6/files/autoconf-older-ve=
rsion.patch
@@ -0,0 +1,14 @@
+Patch the required version back to 2.59
+We'll include the missing macros via acinclude.m4
+
+--- ndisc6-0.6.7/configure.ac~  2006-08-14 16:46:06.000000000 +1000
++++ ndisc6-0.6.7/configure.ac  2006-08-14 16:46:06.000000000 +1000
+@@ -21,7 +21,7 @@
+
+ AC_COPYRIGHT([Copyright (C) 2005-2006 Remi Denis-Courmont])
+ AC_INIT(ndisc6, 0.6.7, rdenis@simphalempin.com)
+-AC_PREREQ(2.59c)
++AC_PREREQ(2.59)
+ INVOCATION=3D"$0 $*"
+
+ AS_MESSAGE(checking system...)
diff --git a/meta-arago-distro/recipes-connectivity/ndisc6/ndisc6_0.6.7.bb =
b/meta-arago-distro/recipes-connectivity/ndisc6/ndisc6_0.6.7.bb
new file mode 100755
index 0000000..5913da5
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/ndisc6/ndisc6_0.6.7.bb
@@ -0,0 +1,66 @@
+SECTION =3D "console/network"
+DESCRIPTION =3D "This package includes some useful diagnostics tools for \
+IPv6 networks, including ndisc6, rdisc6, tcptraceroute6 and traceroute6."
+SECTION =3D "console/network"
+HOMEPAGE =3D "http://www.simphalempin.com/dev/ndisc6/"
+LICENSE =3D "GPL"
+PR =3D "r1"
+
+# The tcptraceroute6 and tracert6 commands depend on rltraceroute6 to
+# perform the actual trace operation.
+RDEPENDS_${PN}-tcptraceroute6 =3D "${PN}-rltraceroute6"
+RDEPENDS_${PN}-tracert6 =3D "${PN}-rltraceroute6"
+
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+SRC_URI =3D "http://www.remlab.net/files/ndisc6/ndisc6-${PV}.tar.bz2 \
+                 file://autoconf-older-version.patch \
+                 file://acinclude.m4"
+
+inherit autotools
+
+# Split into seperate packages since we normal don't want them all
+# The main package is left empty and therefore not created.
+PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
+                   ${PN}-tcptraceroute6 ${PN}-rltraceroute6 ${PN}-tracert6=
"
+FILES_${PN}                                     =3D ""
+FILES_${PN}-ndisc6                       =3D "${bindir}/ndisc6"
+FILES_${PN}-tcpspray6                                =3D "${bindir}/tcpspr=
ay6"
+FILES_${PN}-rdisc6                        =3D "${bindir}/rdisc6"
+FILES_${PN}-tcptraceroute6     =3D "${bindir}/tcptraceroute6"
+FILES_${PN}-rltraceroute6         =3D "${bindir}/rltraceroute6"
+FILES_${PN}-tracert6                    =3D "${bindir}/tracert6"
+
+DESCRIPTION_${PN}-ndisc6      =3D "ICMPv6 Neighbor Discovery tool. \
+Performs IPv6 neighbor discovery in userland. Replaces arping from the \
+IPv4 world."
+DESCRIPTION_${PN}-rdisc6       =3D "ICMPv6 Router Discovery tool. \
+Queries IPv6 routers on the network for advertised prefixes. Can be used \
+to detect rogue IPv6 routers, monitor legitimate IPv6 routers."
+DESCRITPION_${PN}-tcpspray6               =3D "Performs bandwidth measurem=
ents of TCP \
+sessions between the local system and a remote echo server in either IPv6 =
\
+or IPv4."
+
+
+
+# Add some macros from the autoconf 2.60 which to let us build with
+# autoconf 2.59. This can be removed when/if we update to autoconf
+# 2.60
+#do_configure_prepend() {
+#    cp ${WORKDIR}/acinclude.m4 ${S}
+#}
+
+
+# Enable SUID bit for applications that need it
+pkg_postinst_${PN}-rltraceroute6 () {
+              chmod 4555 ${bindir}/rltraceroute6
+}
+pkg_postinst_${PN}-ndisc6 () {
+              chmod 4555 ${bindir}/ndisc6
+}
+pkg_postinst_${PN}-rdisc6 () {
+              chmod 4555 ${bindir}/rdisc6
+}
+
+SRC_URI[md5sum] =3D "77f4154d78304e87698d6da4f5f9ff86"
+SRC_URI[sha256sum] =3D "0b60f1101d49f99111232eb6034ec851a46434bf90a056fd08=
7b4a62451ec9ed"
--
1.7.9.5


--_000_3C08AEEB3C731745938BC83D029FE5E391A192DFLE09entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal">From 7440716207a84c3a9bd772005155e295c6583f13 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Jingting Zhou &lt;a0221004@ares-ubuntu&gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">Date: Mon, 18 Feb 2013 18:00:57 -0500<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] added ndisc6 recipe<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../recipes-connectivity/ndisc6/files/acinclude.m4 |=
&nbsp; 197 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">.../ndisc6/files/autoconf-older-version.patch&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 14 &#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">.../recipes-connectivity/ndisc6/ndisc6_0.6.7.bb&nbsp=
;&nbsp;&nbsp; |&nbsp;&nbsp; 66 &#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:=
p></p>
<p class=3D"MsoNormal">3 files changed, 277 insertions(&#43;)<o:p></o:p></p=
>
<p class=3D"MsoNormal">create mode 100755 meta-arago-distro/recipes-connect=
ivity/ndisc6/files/acinclude.m4<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-distro/recipes-connect=
ivity/ndisc6/files/autoconf-older-version.patch<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-distro/recipes-connect=
ivity/ndisc6/ndisc6_0.6.7.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-connectivity/=
ndisc6/files/acinclude.m4 b/meta-arago-distro/recipes-connectivity/ndisc6/f=
iles/acinclude.m4<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..5360fff<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-distro/recipes-connecti=
vity/ndisc6/files/acinclude.m4<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,197 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# _AC_C_STD_TRY(STANDARD, TEST-PROLOGUE, TEST-B=
ODY, OPTION-LIST,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ACTION-IF-AVAILABLE, ACTION-IF-UNAVAILA=
BLE)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# ---------------------------------------------=
-----------------<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Check whether the C compiler accepts features=
 of STANDARD (e.g `c89', `c99')<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# by trying to compile a program of TEST-PROLOG=
UE and TEST-BODY.&nbsp; If this fails,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# try again with each compiler option in the sp=
ace-separated OPTION-LIST; if one<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# helps, append it to CC.&nbsp; If eventually s=
uccessful, run ACTION-IF-AVAILABLE,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# else ACTION-IF-UNAVAILABLE.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN([_AC_C_STD_TRY],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;[AC_MSG_CHECKING([for $CC option to accept ISO =
]m4_translit($1, [c], [C]))<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_CACHE_VAL(ac_cv_prog_cc_$1,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;[ac_cv_prog_cc_$1=3Dno<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;ac_save_CC=3D$CC<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_LANG_CONFTEST([AC_LANG_PROGRAM([$2], [$3])])=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;for ac_arg in '' $4<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; CC=3D&quot;$ac_save_CC $ac_arg&quot;<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; _AC_COMPILE_IFELSE([], [ac_cv_prog_cc_$1=
=3D$ac_arg])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; test &quot;x$ac_cv_prog_cc_$1&quot; !=3D=
 &quot;xno&quot; &amp;&amp; break<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;done<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;rm -f conftest.$ac_ext<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;CC=3D$ac_save_CC<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;])# AC_CACHE_VAL<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;case &quot;x$ac_cv_prog_cc_$1&quot; in<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;&nbsp; x)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT([none needed])=
 ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; xno)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT([unsupported])=
 ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; *)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; CC=3D&quot;$CC $ac_cv_prog_c=
c_$1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_MSG_RESULT([$ac_cv_prog_c=
c_$1]) ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;esac<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AS_IF([test &quot;x$ac_cv_prog_cc_$1&quot; !=3D=
 xno], [$5], [$6])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;])# _AC_C_STD_TRY<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# _AC_PROG_CC_C99 ([ACTION-IF-AVAILABLE], [ACTI=
ON-IF-UNAVAILABLE])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# ---------------------------------------------=
-------------------<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# If the C compiler is not in ISO C99 mode by d=
efault, try to add an<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# option to output variable CC to make it so.&n=
bsp; This macro tries<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# various options that select ISO C99 on some s=
ystem or another.&nbsp; It<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# considers the compiler to be in ISO C99 mode =
if it handles mixed<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# code and declarations, _Bool, inline and rest=
rict.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN([_AC_PROG_CC_C99],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;[_AC_C_STD_TRY([c99],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;[[#include &lt;stdarg.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#include &lt;stdbool.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#include &lt;stdlib.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#include &lt;wchar.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#include &lt;stdio.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;struct incomplete_array<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; int datasize;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; double data[];<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;struct named_init {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; int number;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; const wchar_t *name;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; double average;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;typedef const char *ccp;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static inline int<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;test_restrict(ccp restrict text)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; // See if C&#43;&#43;-style comments wor=
k.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; // Iterate through items via the restric=
ted pointer.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; // Also check for declarations in for lo=
ops.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; for (unsigned int i =3D 0; *(text&#43;i)=
 !=3D '\0'; &#43;&#43;i)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; continue;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; return 0;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;// Check varargs and va_copy work.<o:p></o:p></=
p>
<p class=3D"MsoNormal">&#43;static void<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;test_varargs(const char *format, ...)<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; va_list args;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; va_start(args, format);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; va_list args_copy;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; va_copy(args_copy, args);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; const char *str;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; int number;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; float fnumber;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; while (*format)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (*format&=
#43;&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 's': // string<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; str =3D va_arg(args_copy, const char=
 *);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 'd': // int<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; number =3D va_arg(args_copy, int);<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 'f': // float<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; fnumber =3D (float) va_arg(args_copy=
, double);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; va_end(args_copy);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; va_end(args);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;]],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;[[<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; // Check bool and long long datatypes.<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; _Bool success =3D false;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; long long int bignum =3D -1234567890LL;<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; unsigned long long int ubignum =3D 12345=
67890uLL;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; // Check restrict.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; if (test_restrict(&quot;String literal&q=
uot;) !=3D 0)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; success =3D true;<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp; char *restrict newvar =3D &quot;Another =
string&quot;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; // Check varargs.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; test_varargs(&quot;s, d' f .&quot;, &quo=
t;string&quot;, 65, 34.234);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; // Check incomplete arrays work.<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; struct incomplete_array *ia =3D<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; malloc(sizeof(struct incompl=
ete_array) &#43; (sizeof(double) * 10));<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ia-&gt;datasize =3D 10;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; for (int i =3D 0; i &lt; ia-&gt;datasize=
; &#43;&#43;i)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ia-&gt;data[i] =3D (double) =
i * 1.234;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; // Check named initialisers.<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;&nbsp; struct named_init ni =3D {<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; .number =3D 34,<o:p></o:p></=
p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; .name =3D L&quot;Test wide s=
tring&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; .average =3D 543.34343,<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ni.number =3D 58;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; int dynamic_array[ni.number];<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp; dynamic_array[43] =3D 543;<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; // work around unused variable warnings<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; return&nbsp; bignum =3D=3D 0LL || ubignu=
m =3D=3D 0uLL || newvar[0] =3D=3D 'x';<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;]],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Try<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl GCC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -std=3Dgnu99 (u=
nused restrictive modes: -std=3Dc99 -std=3Diso9899:1999)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl AIX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -qlanglvl=
=3Dextc99 (unused restrictive mode: -qlanglvl=3Dstdc99)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Intel ICC&nbsp;&nbsp;&nbsp;&nbsp; -c99<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;dnl IRIX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -c99<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Solaris&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; (unused because it causes the compiler to assume C99 semantics for<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; library functions, and this is invalid before Solaris 10: -xc=
99)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl Tru64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; -c99<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;dnl with extended modes being tried first.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;[[-std=3Dgnu99 -c99 -qlanglvl=3Dextc99]], [$1],=
 [$2])[]dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;])# _AC_PROG_CC_C99<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# AC_PROG_CC_C99<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# --------------<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN([AC_PROG_CC_C99],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;[ AC_REQUIRE([AC_PROG_CC])dnl<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; _AC_PROG_CC_C99<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# AC_USE_SYSTEM_EXTENSIONS<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# ------------------------<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Enable extensions on systems that normally di=
sable them,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# typically due to standards-conformance issues=
.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;AC_DEFUN([AC_USE_SYSTEM_EXTENSIONS],<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;[<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; AC_BEFORE([$0], [AC_COMPILE_IFELSE])<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; AC_BEFORE([$0], [AC_RUN_IFELSE])<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; AC_REQUIRE([AC_GNU_SOURCE])<o:p></o:p></=
p>
<p class=3D"MsoNormal">&#43;&nbsp; AC_REQUIRE([AC_AIX])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; AC_REQUIRE([AC_MINIX])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; AH_VERBATIM([__EXTENSIONS__],<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;[/* Enable extensions on Solaris.&nbsp; */<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;#ifndef __EXTENSIONS__<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# undef __EXTENSIONS__<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#endif<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#ifndef _POSIX_PTHREAD_SEMANTICS<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# undef _POSIX_PTHREAD_SEMANTICS<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#endif])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; AC_CACHE_CHECK([whether it is safe to de=
fine __EXTENSIONS__],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [ac_cv_safe_to_define___exte=
nsions__],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; [AC_COMPILE_IFELSE(<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [AC_LANG_P=
ROGRAM([<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &nbsp; define __EXTENSIONS__ 1<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; AC_INCLUDES_DEFAULT])],<o:p></o:p></=
p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ac_cv_saf=
e_to_define___extensions__=3Dyes],<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ac_cv_saf=
e_to_define___extensions__=3Dno])])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; test $ac_cv_safe_to_define___extensions_=
_ =3D yes &amp;&amp;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; AC_DEFINE([__EXTENSIONS__])<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; AC_DEFINE([_POSIX_PTHREAD_SEMANTICS])<o:=
p></o:p></p>
<p class=3D"MsoNormal">&#43;])<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-connectivity/=
ndisc6/files/autoconf-older-version.patch b/meta-arago-distro/recipes-conne=
ctivity/ndisc6/files/autoconf-older-version.patch<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..0ab0fd1<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-distro/recipes-connecti=
vity/ndisc6/files/autoconf-older-version.patch<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,14 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;Patch the required version back to 2.59<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;We'll include the missing macros via acinclude.=
m4<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;--- ndisc6-0.6.7/configure.ac~&nbsp; 2006-08-14=
 16:46:06.000000000 &#43;1000<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43;&#43; ndisc6-0.6.7/configure.ac&nbsp;=
 2006-08-14 16:46:06.000000000 &#43;1000<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;@@ -21,7 &#43;21,7 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; <o:p></o:p></p>
<p class=3D"MsoNormal">&#43; AC_COPYRIGHT([Copyright (C) 2005-2006 Remi Den=
is-Courmont])<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; AC_INIT(ndisc6, 0.6.7, rdenis@simphalempin.com=
)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;-AC_PREREQ(2.59c)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;AC_PREREQ(2.59)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; INVOCATION=3D&quot;$0 $*&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; <o:p></o:p></p>
<p class=3D"MsoNormal">&#43; AS_MESSAGE(checking system...)<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-connectivity/=
ndisc6/ndisc6_0.6.7.bb b/meta-arago-distro/recipes-connectivity/ndisc6/ndis=
c6_0.6.7.bb<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..5913da5<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-distro/recipes-connecti=
vity/ndisc6/ndisc6_0.6.7.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,66 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SECTION =3D &quot;console/network&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;DESCRIPTION =3D &quot;This package includes som=
e useful diagnostics tools for \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;IPv6 networks, including ndisc6, rdisc6, tcptra=
ceroute6 and traceroute6.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SECTION =3D &quot;console/network&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;HOMEPAGE =3D &quot;http://www.simphalempin.com/=
dev/ndisc6/&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LICENSE =3D &quot;GPL&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PR =3D &quot;r1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# The tcptraceroute6 and tracert6 commands depe=
nd on rltraceroute6 to<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# perform the actual trace operation.<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;RDEPENDS_${PN}-tcptraceroute6 =3D &quot;${PN}-r=
ltraceroute6&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;RDEPENDS_${PN}-tracert6 =3D &quot;${PN}-rltrace=
route6&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/m=
eta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI =3D &quot;http://www.remlab.net/files/n=
disc6/ndisc6-${PV}.tar.bz2 \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; file://autoconf-older-version.=
patch \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; file://acinclude.m4&quot;<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;inherit autotools<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Split into seperate packages since we normal =
don't want them all<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# The main package is left empty and therefore =
not created.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PACKAGES &#43;=3D &quot;${PN}-ndisc6 ${PN}-tcps=
pray6 ${PN}-rdisc6 \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; ${PN}-tcptracerout=
e6 ${PN}-rltraceroute6 ${PN}-tracert6&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-ndisc6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${bindir}/ndisc6&quot;<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;FILES_${PN}-tcpspray6 &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; =3D &quot;${bindir}/tcpspray6&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-rdisc6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${bindir}/rdisc6&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-tcptraceroute6&nbsp;&nbsp;&nbsp;&nb=
sp; =3D &quot;${bindir}/tcptraceroute6&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-rltraceroute6&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${bindir}/rltraceroute6&quot;<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-tracert6&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; =3D &quot;${bindir}/tracert6&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DESCRIPTION_${PN}-ndisc6&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; =3D &quot;ICMPv6 Neighbor Discovery tool. \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;Performs IPv6 neighbor discovery in userland. R=
eplaces arping from the \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;IPv4 world.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DESCRIPTION_${PN}-rdisc6&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; =3D &quot;ICMPv6 Router Discovery tool. \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;Queries IPv6 routers on the network for adverti=
sed prefixes. Can be used \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;to detect rogue IPv6 routers, monitor legitimat=
e IPv6 routers.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DESCRITPION_${PN}-tcpspray6&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;=
Performs bandwidth measurements of TCP \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;sessions between the local system and a remote =
echo server in either IPv6 \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;or IPv4.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Add some macros from the autoconf 2.60 which =
to let us build with<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# autoconf 2.59. This can be removed when/if we=
 update to autoconf<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# 2.60<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#do_configure_prepend() {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp; cp ${WORKDIR}/acinclude.m4 =
${S}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Enable SUID bit for applications that need it=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;pkg_postinst_${PN}-rltraceroute6 () {<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chmod 4555 ${bindir}/rltraceroute6<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;pkg_postinst_${PN}-ndisc6 () {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chmod 4555 ${bindir}/ndisc6<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;pkg_postinst_${PN}-rdisc6 () {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chmod 4555 ${bindir}/rdisc6<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[md5sum] =3D &quot;77f4154d78304e87698d6=
da4f5f9ff86&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[sha256sum] =3D &quot;0b60f1101d49f99111=
232eb6034ec851a46434bf90a056fd087b4a62451ec9ed&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.9.5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3C08AEEB3C731745938BC83D029FE5E391A192DFLE09entticom_--
