Return-Path: <eyalr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A11BF52981
	for <meta-arago@arago-project.org>;
	Thu, 18 Apr 2013 07:10:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3I7AcD1015008
	for <meta-arago@arago-project.org>; Thu, 18 Apr 2013 02:10:38 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3I7Ac0e019884
	for <meta-arago@arago-project.org>; Thu, 18 Apr 2013 02:10:38 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Thu, 18 Apr 2013 09:10:36 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH v2 1/9] wlconf: configuration utility for wilink8
	wireless driver
Thread-Index: AQHOPAM5HrdhNflJAEuIFrrYK/3w0pjbbX6AgAAh9gA=
Date: Thu, 18 Apr 2013 07:10:36 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C6FFB3@DNCE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [PATCH v2 1/9] wlconf: configuration utility for wilink8 wireless driver
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
X-List-Received-Date: Thu, 18 Apr 2013 07:10:45 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8665E2433BC68541A24DFFCA87B70F5B17C6FFB3DNCE04entticom_"

--_000_8665E2433BC68541A24DFFCA87B70F5B17C6FFB3DNCE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Add a recipe for building and installing the wlconf configuration utility
for TI Wilink8 familily of chips.

Changes in v2:
* Rename to use an actual release name instead of _git
* Line indentation fixes

Signed-off-by: Eyal Reizer <eyalr@ti.com<mailto:eyalr@ti.com>>
---
 .../recipes-connectivity/wlconf/wlconf_r8.a6.01.bb<http://wlconf_r8.a6.01.=
bb> |   37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8=
.a6.01.bb<http://wlconf_r8.a6.01.bb>

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.=
bb<http://wlconf_r8.a6.01.bb> b/meta-arago-extras/recipes-connectivity/wlco=
nf/wlconf_r8.a6.01.bb<http://wlconf_r8.a6.01.bb>
new file mode 100644
index 0000000..ec10d23
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb<http=
://wlconf_r8.a6.01.bb>
@@ -0,0 +1,37 @@
+DESCRIPTION =3D "Configuration utility for TI wireless drivers"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://README;beginline=3D1;endline=3D21;md5=3Dadc05=
a1903d3f107f85c90328e3a9438<file:///\\README;beginline=3D1;endline=3D21;md5=
=3Dadc05a1903d3f107f85c90328e3a9438>"
+
+PR =3D"r1"
+PV =3D"0.0"
+PR_append =3D "+gitr${SRCREV}"
+
+SRCREV =3D "ol_r8.a6.01"
+SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git<http://github.=
com/TI-OpenLink/18xx-ti-utils.git>"
+
+S =3D "${WORKDIR}/git/wlconf"
+
+EXTRA_OEMAKE =3D "CC=3D${TARGET_PREFIX}gcc"
+
+do_install() {
+       install -d ${D}${bindir}
+       install -d ${D}${bindir}/wlconf/
+       install -d ${D}${bindir}/wlconf/official_inis
+
+       install -m 0755 wlconf ${D}${bindir}/wlconf/
+       install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
+       install -m 0755 struct.bin ${D}${bindir}/wlconf/
+       install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
+       install -m 0755 README ${D}${bindir}/wlconf/
+       install -m 0755 example.conf ${D}${bindir}/wlconf/
+       install -m 0755 example.ini ${D}${bindir}/wlconf/
+       install -m 0755 ${S}/official_inis/*
+                       ${D}${bindir}/wlconf/official_inis/
+}
+
+FILES_${PN} +=3D " \
+       ${bindir}/wlconf \
+       ${bindir}/wlconf/official_inis \
+"
+
+FILES_${PN}-dbg +=3D "${bindir}/wlconf/.debug"
--
1.7.9.5


--_000_8665E2433BC68541A24DFFCA87B70F5B17C6FFB3DNCE04entticom_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.hoenzb
	{mso-style-name:hoenzb;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Add a recipe for buil=
ding and installing the wlconf configuration utility<br>
for TI Wilink8 familily of chips.<br>
<br>
Changes in v2:<br>
* Rename to use an actual release name instead of _git<br>
* Line indentation fixes<br>
<br>
Signed-off-by: Eyal Reizer &lt;<a href=3D"mailto:eyalr@ti.com">eyalr@ti.com=
</a>&gt;<br>
---<br>
&nbsp;.../recipes-connectivity/wlconf/<a href=3D"http://wlconf_r8.a6.01.bb"=
 target=3D"_blank">wlconf_r8.a6.01.bb</a> | &nbsp; 37 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;<br>
&nbsp;1 file changed, 37 insertions(&#43;)<br>
&nbsp;create mode 100644 meta-arago-extras/recipes-connectivity/wlconf/<a h=
ref=3D"http://wlconf_r8.a6.01.bb" target=3D"_blank">wlconf_r8.a6.01.bb</a><=
br>
<br>
diff --git a/meta-arago-extras/recipes-connectivity/wlconf/<a href=3D"http:=
//wlconf_r8.a6.01.bb" target=3D"_blank">wlconf_r8.a6.01.bb</a> b/meta-arago=
-extras/recipes-connectivity/wlconf/<a href=3D"http://wlconf_r8.a6.01.bb" t=
arget=3D"_blank">wlconf_r8.a6.01.bb</a><br>
new file mode 100644<br>
index 0000000..ec10d23<br>
--- /dev/null<br>
&#43;&#43;&#43; b/meta-arago-extras/recipes-connectivity/wlconf/<a href=3D"=
http://wlconf_r8.a6.01.bb" target=3D"_blank">wlconf_r8.a6.01.bb</a><br>
@@ -0,0 &#43;1,37 @@<br>
&#43;DESCRIPTION =3D &quot;Configuration utility for TI wireless drivers&qu=
ot;<br>
&#43;LICENSE =3D &quot;GPLv2&quot;<br>
&#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file:///\\README;beginline=3D1;e=
ndline=3D21;md5=3Dadc05a1903d3f107f85c90328e3a9438">file://README;beginline=
=3D1;endline=3D21;md5=3Dadc05a1903d3f107f85c90328e3a9438</a>&quot;<br>
&#43;<br>
&#43;PR =3D&quot;r1&quot;<br>
&#43;PV =3D&quot;0.0&quot;<br>
&#43;PR_append =3D &quot;&#43;gitr${SRCREV}&quot;<br>
&#43;<br>
&#43;SRCREV =3D &quot;ol_r8.a6.01&quot;<br>
&#43;SRC_URI =3D &quot;git://<a href=3D"http://github.com/TI-OpenLink/18xx-=
ti-utils.git" target=3D"_blank">github.com/TI-OpenLink/18xx-ti-utils.git</a=
>&quot;<br>
&#43;<br>
&#43;S =3D &quot;${WORKDIR}/git/wlconf&quot;<br>
&#43;<br>
&#43;EXTRA_OEMAKE =3D &quot;CC=3D${TARGET_PREFIX}gcc&quot;<br>
&#43;<br>
&#43;do_install() {<br>
&#43; &nbsp; &nbsp; &nbsp; install -d ${D}${bindir}<br>
&#43; &nbsp; &nbsp; &nbsp; install -d ${D}${bindir}/wlconf/<br>
&#43; &nbsp; &nbsp; &nbsp; install -d ${D}${bindir}/wlconf/official_inis<br=
>
&#43;<br>
&#43; &nbsp; &nbsp; &nbsp; install -m 0755 wlconf ${D}${bindir}/wlconf/<br>
&#43; &nbsp; &nbsp; &nbsp; install -m 0755 dictionary.txt ${D}${bindir}/wlc=
onf/<br>
&#43; &nbsp; &nbsp; &nbsp; install -m 0755 struct.bin ${D}${bindir}/wlconf/=
<br>
&#43; &nbsp; &nbsp; &nbsp; install -m 0755 wl18xx-conf-default.bin ${D}${bi=
ndir}/wlconf/<br>
&#43; &nbsp; &nbsp; &nbsp; install -m 0755 README ${D}${bindir}/wlconf/<br>
&#43; &nbsp; &nbsp; &nbsp; install -m 0755 example.conf ${D}${bindir}/wlcon=
f/<br>
&#43; &nbsp; &nbsp; &nbsp; install -m 0755 example.ini ${D}${bindir}/wlconf=
/<br>
&#43; &nbsp; &nbsp; &nbsp; install -m 0755 ${S}/official_inis/*<br>
&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ${D}${bindir}/wlconf/official_inis/<br>
&#43;}<br>
&#43;<br>
&#43;FILES_${PN} &#43;=3D &quot; \<br>
&#43; &nbsp; &nbsp; &nbsp; ${bindir}/wlconf \<br>
&#43; &nbsp; &nbsp; &nbsp; ${bindir}/wlconf/official_inis \<br>
&#43;&quot;<br>
&#43;<br>
&#43;FILES_${PN}-dbg &#43;=3D &quot;${bindir}/wlconf/.debug&quot;<br>
<span class=3D"hoenzb"><span style=3D"color:#888888">--</span></span><span =
style=3D"color:#888888"><br>
<span class=3D"hoenzb">1.7.9.5</span></span><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_8665E2433BC68541A24DFFCA87B70F5B17C6FFB3DNCE04entticom_--
