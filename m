Return-Path: <zhoujt@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BA5ED52A1B
	for <meta-arago@arago-project.org>;
	Thu, 21 Feb 2013 17:59:43 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1LHxhLF020909
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2013 11:59:43 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1LHxgTR005156
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2013 11:59:42 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Thu, 21 Feb 2013 11:59:40 -0600
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Cruickshank, Brian" <bcruickshank@ti.com>
Thread-Topic: ti-cuia recipe review
Thread-Index: Ac4QXTvTSeSeO2HVSGG2dYoiJWYjIg==
Date: Thu, 21 Feb 2013 17:59:41 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E391A8BB@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: ti-cuia recipe review
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
X-List-Received-Date: Thu, 21 Feb 2013 17:59:44 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3C08AEEB3C731745938BC83D029FE5E391A8BBDFLE09entticom_"

--_000_3C08AEEB3C731745938BC83D029FE5E391A8BBDFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From 7b8d537fd40bf40e2de7967735605f9063881c43 Mon Sep 17 00:00:00 2001
From: Jingting Zhou <a0221004@ares-ubuntu>
Date: Thu, 21 Feb 2013 12:19:06 -0500
Subject: [PATCH] added ti cuia recipe

---
.../recipes-bsp/ti-cuia/ti-cuia_1.0.0.9.bb         |   31 +++++++++++++++++=
+++
1 file changed, 31 insertions(+)
create mode 100755 meta-arago-extras/recipes-bsp/ti-cuia/ti-cuia_1.0.0.9.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-cuia/ti-cuia_1.0.0.9.bb b/met=
a-arago-extras/recipes-bsp/ti-cuia/ti-cuia_1.0.0.9.bb
new file mode 100755
index 0000000..80df989
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-cuia/ti-cuia_1.0.0.9.bb
@@ -0,0 +1,31 @@
+DESCRIPTION =3D "TI Unified Instrumentation Architecture in C (cUIA)"
+LICENSE =3D "TI BSD"
+LIC_FILES_CHKSUM =3D "file://cuia_${CUIA_PV}_manifest.html;md5=3D2e966033d=
6d89202fb7c2ffa9733c161"
+
+CUIA_PV =3D "1_00_00_09"
+CUIA_PVExtra =3D ""
+
+PR =3D "r1"
+SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_ccstudio/UI=
A/SCMCSDK/cuia_${CUIA_PV}${CUIA_PVExtra}.tar.gz;name=3Dcuia"
+SRC_URI[cuia.md5sum] =3D "f023de122956176a3794299293bd38e2"
+SRC_URI[cuia.sha256sum] =3D "815df31dfcac933af81db761b81cc42b23f670e7783f6=
4dc9fd50d3bd50df3c8"
+
+S =3D "${WORKDIR}/cuia_${CUIA_PV}${CUIA_PVExtra}"
+SRCREV =3D "${AUTOREV}"
+
+do_compile () {
+        cd ${S}
+        make DESTDIR=3D${D}${bindir} libdir=3D${D}${libdir}     includedir=
=3D${D}${includedir} clean
+        make DESTDIR=3D${D}${bindir} libdir=3D${D}${libdir}     includedir=
=3D${D}${includedir} all
+}
+
+do_install() {
+        cd ${S}
+        make DESTDIR=3D${D} libdir=3D${libdir} includedir=3D${includedir} =
install
+        install -d ${D}${libdir}/
+        install -d ${D}${includedir}/
+}
+
+FILES_${PN} +=3D " ${libdir}/ti/uiaplus/loggers/stream/lib*.so \
+                                                             ${libdir}/ti/=
uia/runtime/lib*.so"
+
--
1.7.9.5


--_000_3C08AEEB3C731745938BC83D029FE5E391A8BBDFLE09entticom_
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
<p class=3D"MsoNormal">From 7b8d537fd40bf40e2de7967735605f9063881c43 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Jingting Zhou &lt;a0221004@ares-ubuntu&gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">Date: Thu, 21 Feb 2013 12:19:06 -0500<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] added ti cuia recipe<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../recipes-bsp/ti-cuia/ti-cuia_1.0.0.9.bb&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;|&nbsp;&nbsp; 31 &#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 31 insertions(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-extras/recipes-bsp/ti-=
cuia/ti-cuia_1.0.0.9.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-extras/recipes-bsp/ti-cuia/t=
i-cuia_1.0.0.9.bb b/meta-arago-extras/recipes-bsp/ti-cuia/ti-cuia_1.0.0.9.b=
b<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..80df989<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-extras/recipes-bsp/ti-c=
uia/ti-cuia_1.0.0.9.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,31 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DESCRIPTION =3D &quot;TI Unified Instrumentatio=
n Architecture in C (cUIA)&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LICENSE =3D &quot;TI BSD&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LIC_FILES_CHKSUM =3D &quot;file://cuia_${CUIA_P=
V}_manifest.html;md5=3D2e966033d6d89202fb7c2ffa9733c161&quot;<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;CUIA_PV =3D &quot;1_00_00_09&quot;<o:p></o:p></=
p>
<p class=3D"MsoNormal">&#43;CUIA_PVExtra =3D &quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PR =3D &quot;r1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI =3D &quot;http://software-dl.ti.com/dsp=
s/dsps_public_sw/sdo_ccstudio/UIA/SCMCSDK/cuia_${CUIA_PV}${CUIA_PVExtra}.ta=
r.gz;name=3Dcuia&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[cuia.md5sum] =3D &quot;f023de122956176a=
3794299293bd38e2&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[cuia.sha256sum] =3D &quot;815df31dfcac9=
33af81db761b81cc42b23f670e7783f64dc9fd50d3bd50df3c8&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;S =3D &quot;${WORKDIR}/cuia_${CUIA_PV}${CUIA_PV=
Extra}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRCREV =3D &quot;${AUTOREV}&quot;<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do_compile () {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd $=
{S}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make=
 DESTDIR=3D${D}${bindir} libdir=3D${D}${libdir}&nbsp;&nbsp;&nbsp;&nbsp; inc=
ludedir=3D${D}${includedir} clean
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make=
 DESTDIR=3D${D}${bindir} libdir=3D${D}${libdir}&nbsp;&nbsp;&nbsp;&nbsp; inc=
ludedir=3D${D}${includedir} all<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do_install() {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd $=
{S}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make=
 DESTDIR=3D${D} libdir=3D${libdir} includedir=3D${includedir} install<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inst=
all -d ${D}${libdir}/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inst=
all -d ${D}${includedir}/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN} &#43;=3D &quot; ${libdir}/ti/uiaplu=
s/loggers/stream/lib*.so \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; ${libdir}/ti/uia/runtime/lib*.so&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.9.5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3C08AEEB3C731745938BC83D029FE5E391A8BBDFLE09entticom_--
