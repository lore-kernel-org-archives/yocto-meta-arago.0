Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 191A052A66
	for <meta-arago@arago-project.org>;
	Thu, 22 May 2014 12:37:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4MCbmYS023479
	for <meta-arago@arago-project.org>; Thu, 22 May 2014 07:37:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MCbmen004648
	for <meta-arago@arago-project.org>; Thu, 22 May 2014 07:37:48 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 22 May 2014 07:37:48 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>, "'meta-arago@arago-project.org'"
	<meta-arago@arago-project.org>, "Nelson, Sam" <sam.nelson@ti.com>
Thread-Topic: patch to upgrade libnl to version 3.2.24
Thread-Index: Ac91SCFwq5+bwIG/Qkq4W+gO1NfZuwAcdVgg
Date: Thu, 22 May 2014 12:37:47 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D03E909@DLEE11.ent.ti.com>
References: <3C08AEEB3C731745938BC83D029FE5E39C14BC@DFLE08.ent.ti.com>
In-Reply-To: <3C08AEEB3C731745938BC83D029FE5E39C14BC@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: patch to upgrade libnl to version 3.2.24
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
X-List-Received-Date: Thu, 22 May 2014 12:37:49 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED1015D03E909DLEE11entticom_"

--_000_7D46E86EC0A8354091174257B2FED1015D03E909DLEE11entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Zhou, Jingting
Sent: Wednesday, May 21, 2014 5:59 PM
To: 'meta-arago@arago-project.org'; Nelson, Sam
Subject: [meta-arago] patch to upgrade libnl to version 3.2.24

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


Use =96m or --find-copies-harder to make this patch easier to read.

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
c<file:///\\COPYING;md5=3D4fbd65380cdd255951079008b364516c>"
-
-DEPENDS =3D "flex-native bison-native"
-
-
-SRC_URI[md5sum] =3D "7a35f3a17b52f41ee120dceb99b2ef72"
-SRC_URI[sha256sum] =3D "9750409c0fec8b27966a65d94c040647ee01753e0947b0d595=
77b815ee0e710d"
-
-SRC_URI =3D "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
-                    file://fix_for_masking_addr.patch<file:///\\fix_for_ma=
sking_addr.patch>"
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

Oe-core already has version 3.2.22.  Would that work?  If so why not use th=
at rather than overlay this recipe.  If not then please also submit a patch=
 to bump the base recipe version in oe-core up to the latest as well so we =
don=92t carry this version forever.

@@ -0,0 +1,55 @@
+DESCRIPTION =3D "libnl is a library for applications dealing with netlink =
sockets."
+HOMEPAGE =3D "http://www.infradead.org/~tgr/libnl/"
+SECTION =3D "libs/network"
+
+PE =3D "1"
+PR =3D "r1"

No need to set PR

+
+LICENSE =3D "LGPLv2.1"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c<file:///\\COPYING;md5=3D4fbd65380cdd255951079008b364516c>"
+
+DEPENDS =3D "flex-native bison-native"
+
+SRC_URI[md5sum] =3D "6e0e7bad0674749d930dd9f285343d55"
+SRC_URI[sha256sum] =3D "fb8d6e5dc8af5b85bc6d00a71582a68a01e6a3f7d1664d4a64=
6e289a99dd6816"
+SRC_URI =3D "http://www.carisma.slowglass.com/~tgr/libnl/files/${BP}.tar.g=
z<http://www.carisma.slowglass.com/~tgr/libnl/files/$%7bBP%7d.tar.gz>"
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

This needs more detail.  The base recipe in oe-core doesn=92t have this so =
what is special about this version that requires this?

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

Something that might be worth investigating would be to inherit the 3.22.22=
 version of the recipe and then tweak the SRC_URI variables, etc.  Denys, i=
f we have to overlay this what would you prefer to see?  We can=92t use a .=
bbappend very well because of the version change.  But most of this code is=
 duplicate from the oe-core code.

--
1.7.9.5


--_000_7D46E86EC0A8354091174257B2FED1015D03E909DLEE11entticom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
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
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<b>Sent:</b> Wednesday, May 21, 2014 5:59 PM<br>
<b>To:</b> 'meta-arago@arago-project.org'; Nelson, Sam<br>
<b>Subject:</b> [meta-arago] patch to upgrade libnl to version 3.2.24<o:p><=
/o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Use =96m or --find-cop=
ies-harder to make this patch easier to read.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
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
<p class=3D"MsoNormal">-HOMEPAGE =3D &quot;<a href=3D"http://www.infradead.=
org/~tgr/libnl/">http://www.infradead.org/~tgr/libnl/</a>&quot;<o:p></o:p><=
/p>
<p class=3D"MsoNormal">-SECTION =3D &quot;libs/network&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-PE =3D &quot;1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-LICENSE =3D &quot;LGPLv2.1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-LIC_FILES_CHKSUM =3D &quot;<a href=3D"file:///\\COP=
YING;md5=3D4fbd65380cdd255951079008b364516c">file://COPYING;md5=3D4fbd65380=
cdd255951079008b364516c</a>&quot;<o:p></o:p></p>
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
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:=
///\\fix_for_masking_addr.patch">
file://fix_for_masking_addr.patch</a>&quot;<o:p></o:p></p>
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Oe-core already has ve=
rsion 3.2.22.&nbsp; Would that work?&nbsp; If so why not use that rather th=
an overlay this recipe.&nbsp; If not then please also submit a patch to bum=
p the base recipe version in oe-core up to the latest
 as well so we don=92t carry this version forever.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,55 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DESCRIPTION =3D &quot;libnl is a library for ap=
plications dealing with netlink sockets.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;HOMEPAGE =3D &quot;<a href=3D"http://www.infrad=
ead.org/~tgr/libnl/">http://www.infradead.org/~tgr/libnl/</a>&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;SECTION =3D &quot;libs/network&quot;<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PE =3D &quot;1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PR =3D &quot;r1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">No need to set PR<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LICENSE =3D &quot;LGPLv2.1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file:///\=
\COPYING;md5=3D4fbd65380cdd255951079008b364516c">file://COPYING;md5=3D4fbd6=
5380cdd255951079008b364516c</a>&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DEPENDS =3D &quot;flex-native bison-native&quot=
;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[md5sum] =3D &quot;6e0e7bad0674749d930dd=
9f285343d55&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[sha256sum] =3D &quot;fb8d6e5dc8af5b85bc=
6d00a71582a68a01e6a3f7d1664d4a646e289a99dd6816&quot;
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI =3D &quot;<a href=3D"http://www.carisma=
.slowglass.com/~tgr/libnl/files/$%7bBP%7d.tar.gz">http://www.carisma.slowgl=
ass.com/~tgr/libnl/files/${BP}.tar.gz</a>&quot;<o:p></o:p></p>
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">This needs more detail=
.&nbsp; The base recipe in oe-core doesn=92t have this so what is special a=
bout this version that requires this?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Something that might b=
e worth investigating would be to inherit the 3.22.22 version of the recipe=
 and then tweak the SRC_URI variables, etc.&nbsp; Denys, if we have to over=
lay this what would you prefer to see?&nbsp; We
 can=92t use a .bbappend very well because of the version change.&nbsp; But=
 most of this code is duplicate from the oe-core code.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.9.5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED1015D03E909DLEE11entticom_--
