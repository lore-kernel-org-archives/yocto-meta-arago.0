Return-Path: <zhoujt@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9AD7C52A6D
	for <meta-arago@arago-project.org>;
	Wed, 21 May 2014 22:58:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4LMwkBP007778
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 17:58:47 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4LMwk9S029254
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 17:58:46 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Wed, 21 May 2014 17:58:46 -0500
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "'meta-arago@arago-project.org'" <meta-arago@arago-project.org>, "Nelson,
	Sam" <sam.nelson@ti.com>
Thread-Topic: patch to upgrade libnl to version 3.2.24
Thread-Index: Ac91SCFwq5+bwIG/Qkq4W+gO1NfZuw==
Date: Wed, 21 May 2014 22:58:46 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E39C14BC@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: patch to upgrade libnl to version 3.2.24
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
X-List-Received-Date: Wed, 21 May 2014 22:58:48 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3C08AEEB3C731745938BC83D029FE5E39C14BCDFLE08entticom_"

--_000_3C08AEEB3C731745938BC83D029FE5E39C14BCDFLE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From 2597ee553110251bf6413b4216ea400eb0167426 Mon Sep 17 00:00:00 2001
From: Jingting Zhou <jingtinglocal@uda0221004>
Date: Wed, 21 May 2014 17:52:25 -0500
Subject: [PATCH] updated the libnl to version 3.2.24

---
.../recipes-connectivity/libnl/libnl_3.2.11.bb     |   54 -----------------=
--
.../recipes-connectivity/libnl/libnl_3.2.24.bb     |   55 +++++++++++++++++=
+++
2 files changed, 55 insertions(+), 54 deletions(-)
delete mode 100755 meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.1=
1.bb
create mode 100755 meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.2=
4.bb

diff --git a/meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.11.bb b=
/meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.11.bb
deleted file mode 100755
index e67b67e..0000000
--- a/meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.11.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-DESCRIPTION =3D "libnl is a library for applications dealing with netlink =
sockets."
-HOMEPAGE =3D "http://www.infradead.org/~tgr/libnl/"
-SECTION =3D "libs/network"
-
-PE =3D "1"
-
-LICENSE =3D "LGPLv2.1"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
-
-DEPENDS =3D "flex-native bison-native"
-
-
-SRC_URI[md5sum] =3D "7a35f3a17b52f41ee120dceb99b2ef72"
-SRC_URI[sha256sum] =3D "9750409c0fec8b27966a65d94c040647ee01753e0947b0d595=
77b815ee0e710d"
-
-SRC_URI =3D "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
-                    file://fix_for_masking_addr.patch"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-    # make wpa-supplicant happy
-    # TODO: when moving to oe-core fix at wpa-supplicant
-    # (e.g src/drivers/drivers.mak)
-    cd ${D}${includedir}
-    ln -sf libnl3/netlink netlink
-    cd ${D}${libdir}
-    ln -sf libnl-3.so.200 libnl.so
-    ln -sf libnl-3.so.200 libnl.so.3
-    ln -sf libnl-genl-3.so.200 libnl-genl.so
-    ln -sf libnl-genl-3.so.200 libnl-genl.so.3
-}
-
-FILES_${PN} =3D "${libdir}/libnl-3.so.* \
-               ${libdir}/libnl.so.* \
-               ${sysconfdir}"
-RREPLACES_${PN} =3D "libnl2"
-RCONFLICTS_${PN} =3D "libnl2"
-FILES_${PN}-dbg +=3D "${libdir}/libnl/cli/*/.debug"
-FILES_${PN}-dev +=3D "${libdir}/libnl/cli/*/*.so \
-                    ${libdir}/libnl/cli/*/*.la"
-FILES_${PN}-staticdev +=3D "${libdir}/libnl/cli/*/*.a"
-
-PACKAGES +=3D "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl"
-FILES_${PN}-cli   =3D "${libdir}/libnl-cli-3.so.* \
-                     ${libdir}/libnl/cli/*/*.so.* \
-                     ${sbindir}/nl-*"
-FILES_${PN}-route =3D "${libdir}/libnl-route-3.so.*"
-FILES_${PN}-nf    =3D "${libdir}/libnl-nf-3.so.*"
-FILES_${PN}-genl  =3D "${libdir}/libnl-genl-3.so.* \
-                     ${libdir}/libnl-genl.so.* \
-                     ${sbindir}/genl-ctrl-list"
-RREPLACES_${PN}-genl =3D "libnl-genl2 libnl-genl-3-200"
-RCONFLICTS_${PN}-genl =3D "libnl-genl2 libnl-genl-3-200"
diff --git a/meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.24.bb b=
/meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.24.bb
new file mode 100755
index 0000000..e89246d
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.24.bb
@@ -0,0 +1,55 @@
+DESCRIPTION =3D "libnl is a library for applications dealing with netlink =
sockets."
+HOMEPAGE =3D "http://www.infradead.org/~tgr/libnl/"
+SECTION =3D "libs/network"
+
+PE =3D "1"
+PR =3D "r1"
+
+LICENSE =3D "LGPLv2.1"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
+
+DEPENDS =3D "flex-native bison-native"
+
+SRC_URI[md5sum] =3D "6e0e7bad0674749d930dd9f285343d55"
+SRC_URI[sha256sum] =3D "fb8d6e5dc8af5b85bc6d00a71582a68a01e6a3f7d1664d4a64=
6e289a99dd6816"
+SRC_URI =3D "http://www.carisma.slowglass.com/~tgr/libnl/files/${BP}.tar.g=
z"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+    # make wpa-supplicant happy
+    # TODO: when moving to oe-core fix at wpa-supplicant
+    # (e.g src/drivers/drivers.mak)
+    cd ${D}${includedir}
+    ln -sf libnl3/netlink netlink
+    cd ${D}${libdir}
+    ln -sf libnl-3.so.200 libnl.so
+    ln -sf libnl-3.so.200 libnl.so.3
+    ln -sf libnl-genl-3.so.200 libnl-genl.so
+    ln -sf libnl-genl-3.so.200 libnl-genl.so.3
+            install -d ${D}${includedir}/netlink-private
+            cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedi=
r}/netlink-private/
+            cp -r ${S}/include/netlink-private/object-api.h ${D}${included=
ir}/netlink-private/
+}
+
+FILES_${PN} =3D "${libdir}/libnl-3.so.* \
+               ${libdir}/libnl.so.* \
+               ${sysconfdir}"
+RREPLACES_${PN} =3D "libnl2"
+RCONFLICTS_${PN} =3D "libnl2"
+FILES_${PN}-dbg +=3D "${libdir}/libnl/cli/*/.debug"
+FILES_${PN}-dev +=3D "${libdir}/libnl/cli/*/*.so \
+                    ${libdir}/libnl/cli/*/*.la"
+FILES_${PN}-staticdev +=3D "${libdir}/libnl/cli/*/*.a"
+
+PACKAGES +=3D "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl"
+FILES_${PN}-cli   =3D "${libdir}/libnl-cli-3.so.* \
+                     ${libdir}/libnl/cli/*/*.so.* \
+                     ${sbindir}/nl-*"
+FILES_${PN}-route =3D "${libdir}/libnl-route-3.so.*"
+FILES_${PN}-nf    =3D "${libdir}/libnl-nf-3.so.*"
+FILES_${PN}-genl  =3D "${libdir}/libnl-genl-3.so.* \
+                     ${libdir}/libnl-genl.so.* \
+                     ${sbindir}/genl-ctrl-list"
+RREPLACES_${PN}-genl =3D "libnl-genl2 libnl-genl-3-200"
+RCONFLICTS_${PN}-genl =3D "libnl-genl2 libnl-genl-3-200"
--
1.7.9.5


--_000_3C08AEEB3C731745938BC83D029FE5E39C14BCDFLE08entticom_
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
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@\5B8B\4F53";
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
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
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
<p class=3D"MsoNormal">From 2597ee553110251bf6413b4216ea400eb0167426 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Jingting Zhou &lt;jingtinglocal@uda0221004&gt;=
<o:p></o:p></p>
<p class=3D"MsoNormal">Date: Wed, 21 May 2014 17:52:25 -0500<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] updated the libnl to version 3.2.24=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../recipes-connectivity/libnl/libnl_3.2.11.bb&nbsp;=
&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 54 -------------------<o:p></o:p></p>
<p class=3D"MsoNormal">.../recipes-connectivity/libnl/libnl_3.2.24.bb&nbsp;=
&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;55 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p=
>
<p class=3D"MsoNormal">2 files changed, 55 insertions(&#43;), 54 deletions(=
-)<o:p></o:p></p>
<p class=3D"MsoNormal">delete mode 100755 meta-arago-distro/recipes-connect=
ivity/libnl/libnl_3.2.11.bb<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-distro/recipes-connect=
ivity/libnl/libnl_3.2.24.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-connectivity/=
libnl/libnl_3.2.11.bb b/meta-arago-distro/recipes-connectivity/libnl/libnl_=
3.2.11.bb<o:p></o:p></p>
<p class=3D"MsoNormal">deleted file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index e67b67e..0000000<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-arago-distro/recipes-connectivity/libnl/l=
ibnl_3.2.11.bb<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -1,54 &#43;0,0 @@<o:p></o:p></p>
<p class=3D"MsoNormal">-DESCRIPTION =3D &quot;libnl is a library for applic=
ations dealing with netlink sockets.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-HOMEPAGE =3D &quot;http://www.infradead.org/~tgr/li=
bnl/&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-SECTION =3D &quot;libs/network&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-PE =3D &quot;1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-LICENSE =3D &quot;LGPLv2.1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fb=
d65380cdd255951079008b364516c&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-DEPENDS =3D &quot;flex-native bison-native&quot;<o:=
p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[md5sum] =3D &quot;7a35f3a17b52f41ee120dceb9=
9b2ef72&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[sha256sum] =3D &quot;9750409c0fec8b27966a65=
d94c040647ee01753e0947b0d59577b815ee0e710d&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI =3D &quot;http://www.infradead.org/~tgr/${B=
PN}/files/${BP}.tar.gz \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://fix_for_m=
asking_addr.patch&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-inherit autotools pkgconfig<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-do_install_append() {<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; # make wpa-supplicant happy<o:p>=
</o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; # TODO: when moving to oe-core f=
ix at wpa-supplicant<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; # (e.g src/drivers/drivers.mak)<=
o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; cd ${D}${includedir}<o:p></o:p><=
/p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; ln -sf libnl3/netlink netlink<o:=
p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; cd ${D}${libdir}<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; ln -sf libnl-3.so.200 libnl.so<o=
:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; ln -sf libnl-3.so.200 libnl.so.3=
<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; ln -sf libnl-genl-3.so.200 libnl=
-genl.so<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; ln -sf libnl-genl-3.so.200 libnl=
-genl.so.3<o:p></o:p></p>
<p class=3D"MsoNormal">-}<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-FILES_${PN} =3D &quot;${libdir}/libnl-3.so.* \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${libdir}/libnl.so.* \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sysconfdir}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-RREPLACES_${PN} =3D &quot;libnl2&quot;<o:p></o:p></=
p>
<p class=3D"MsoNormal">-RCONFLICTS_${PN} =3D &quot;libnl2&quot;<o:p></o:p><=
/p>
<p class=3D"MsoNormal">-FILES_${PN}-dbg &#43;=3D &quot;${libdir}/libnl/cli/=
*/.debug&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-FILES_${PN}-dev &#43;=3D &quot;${libdir}/libnl/cli/=
*/*.so \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${libdir}/l=
ibnl/cli/*/*.la&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-FILES_${PN}-staticdev &#43;=3D &quot;${libdir}/libn=
l/cli/*/*.a&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-PACKAGES &#43;=3D &quot;${PN}-cli ${PN}-route ${PN}=
-nf ${PN}-genl&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-FILES_${PN}-cli&nbsp;&nbsp; =3D &quot;${libdir}/lib=
nl-cli-3.so.* \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${lib=
dir}/libnl/cli/*/*.so.* \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sbi=
ndir}/nl-*&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-FILES_${PN}-route =3D &quot;${libdir}/libnl-route-3=
.so.*&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-FILES_${PN}-nf&nbsp;&nbsp;&nbsp; =3D &quot;${libdir=
}/libnl-nf-3.so.*&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-FILES_${PN}-genl&nbsp; =3D &quot;${libdir}/libnl-ge=
nl-3.so.* \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${lib=
dir}/libnl-genl.so.* \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sbi=
ndir}/genl-ctrl-list&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-RREPLACES_${PN}-genl =3D &quot;libnl-genl2 libnl-ge=
nl-3-200&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-RCONFLICTS_${PN}-genl =3D &quot;libnl-genl2 libnl-g=
enl-3-200&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-connectivity/=
libnl/libnl_3.2.24.bb b/meta-arago-distro/recipes-connectivity/libnl/libnl_=
3.2.24.bb<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..e89246d<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-distro/recipes-connecti=
vity/libnl/libnl_3.2.24.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,55 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DESCRIPTION =3D &quot;libnl is a library for ap=
plications dealing with netlink sockets.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;HOMEPAGE =3D &quot;http://www.infradead.org/~tg=
r/libnl/&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SECTION =3D &quot;libs/network&quot;<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PE =3D &quot;1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PR =3D &quot;r1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LICENSE =3D &quot;LGPLv2.1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=
=3D4fbd65380cdd255951079008b364516c&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DEPENDS =3D &quot;flex-native bison-native&quot=
;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[md5sum] =3D &quot;6e0e7bad0674749d930dd=
9f285343d55&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[sha256sum] =3D &quot;fb8d6e5dc8af5b85bc=
6d00a71582a68a01e6a3f7d1664d4a646e289a99dd6816&quot;
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI =3D &quot;http://www.carisma.slowglass.=
com/~tgr/libnl/files/${BP}.tar.gz&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;inherit autotools pkgconfig<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do_install_append() {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; # make wpa-supplicant happy<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; # TODO: when moving to oe-co=
re fix at wpa-supplicant<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; # (e.g src/drivers/drivers.m=
ak)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; cd ${D}${includedir}<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ln -sf libnl3/netlink netlin=
k<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; cd ${D}${libdir}<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ln -sf libnl-3.so.200 libnl.=
so<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ln -sf libnl-3.so.200 libnl.=
so.3<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ln -sf libnl-genl-3.so.200 l=
ibnl-genl.so<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ln -sf libnl-genl-3.so.200 l=
ibnl-genl.so.3 <o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; install -d ${D}${includedir}/netlink-private<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; cp -r ${S}/include/netlink-private/cache-api.h ${D}${in=
cludedir}/netlink-private/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; cp -r ${S}/include/netlink-private/object-api.h ${D}${i=
ncludedir}/netlink-private/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN} =3D &quot;${libdir}/libnl-3.so.* \<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${libdir}/libnl.so.* \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sysconfdir}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;RREPLACES_${PN} =3D &quot;libnl2&quot;<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;RCONFLICTS_${PN} =3D &quot;libnl2&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-dbg &#43;=3D &quot;${libdir}/libnl/=
cli/*/.debug&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-dev &#43;=3D &quot;${libdir}/libnl/=
cli/*/*.so \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${libdi=
r}/libnl/cli/*/*.la&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-staticdev &#43;=3D &quot;${libdir}/=
libnl/cli/*/*.a&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PACKAGES &#43;=3D &quot;${PN}-cli ${PN}-route $=
{PN}-nf ${PN}-genl&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-cli&nbsp;&nbsp; =3D &quot;${libdir}=
/libnl-cli-3.so.* \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $=
{libdir}/libnl/cli/*/*.so.* \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$=
{sbindir}/nl-*&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-route =3D &quot;${libdir}/libnl-rou=
te-3.so.*&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-nf&nbsp;&nbsp;&nbsp; =3D &quot;${li=
bdir}/libnl-nf-3.so.*&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-genl&nbsp; =3D &quot;${libdir}/libn=
l-genl-3.so.* \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $=
{libdir}/libnl-genl.so.* \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $=
{sbindir}/genl-ctrl-list&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;RREPLACES_${PN}-genl =3D &quot;libnl-genl2 libn=
l-genl-3-200&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;RCONFLICTS_${PN}-genl =3D &quot;libnl-genl2 lib=
nl-genl-3-200&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.9.5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3C08AEEB3C731745938BC83D029FE5E39C14BCDFLE08entticom_--
