Return-Path: <zhoujt@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 369FA52A1B
	for <meta-arago@arago-project.org>;
	Thu, 21 Feb 2013 17:58:50 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1LHwn9Q026680
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2013 11:58:49 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1LHwnJM004252
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2013 11:58:49 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 21 Feb 2013 11:58:49 -0600
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Zhou,
	Jingting" <zhoujt@ti.com>
Thread-Topic: ti trace framework recipe review
Thread-Index: Ac4O8alQMpFCXvQQT+u9ZK4PJH1lrABaxPJw
Date: Thu, 21 Feb 2013 17:58:48 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E391A8AB@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: ti trace framework recipe review
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
X-List-Received-Date: Thu, 21 Feb 2013 17:58:51 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3C08AEEB3C731745938BC83D029FE5E391A8ABDFLE09entticom_"

--_000_3C08AEEB3C731745938BC83D029FE5E391A8ABDFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I updated the recipe to RDEPENDS on ti-cuia

From d908c04d9a26494cec52f11d4c1d5102b8a70e6f Mon Sep 17 00:00:00 2001
From: Jingting Zhou <a0221004@ares-ubuntu>
Date: Thu, 21 Feb 2013 12:57:40 -0500
Subject: [PATCH] trace framework recipe update

---
.../ti-trace-framework/ti-trace-framework_1.0.bb   |   14 ++++----------
1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-fram=
ework_1.0.bb b/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-fr=
amework_1.0.bb
index 63b3c5d..b7bdbd4 100755
--- a/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_1=
.0.bb
+++ b/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_1=
.0.bb
@@ -3,30 +3,24 @@ LICENSE =3D "TI BSD"
LIC_FILES_CHKSUM =3D "file://include/traceframework.h;md5=3D8d9553efe65fc94=
cd24d255a1f84b2d5"
 COMPATIBLE_MACHINE =3D "keystone-evm"
-
-CUIA_PV =3D "1_00_00_09"
-CUIA_PVExtra =3D ""
+RDEPENDS =3D"ti-cuia"
 PR =3D "r1"
BRANCH=3D"master"
-SRC_URI =3D "git://arago-project.org/git/projects/mcsdk-apps.git;protocol=
=3Dgit;branch=3D${BRANCH} \
-                 http://software-dl.ti.com/dsps/dsps_public_sw/sdo_ccstudi=
o/UIA/SCMCSDK/cuia_${CUIA_PV}${CUIA_PVExtra}.tar.gz;name=3Dcuia"
-
-SRC_URI[cuia.md5sum] =3D "f023de122956176a3794299293bd38e2"
-SRC_URI[cuia.sha256sum] =3D "815df31dfcac933af81db761b81cc42b23f670e7783f6=
4dc9fd50d3bd50df3c8"
+SRC_URI =3D "git://arago-project.org/git/projects/mcsdk-apps.git;protocol=
=3Dgit;branch=3D${BRANCH}"
 S =3D "${WORKDIR}/git/instrumentation/trace_framework"
SRCREV =3D "${AUTOREV}"
 do_install() {
-              make USRBIN_DIR=3D${bindir} USRLIB_DIR=3D${libdir} TARGET_RO=
OT_DIR=3D${D} CUIA_INSTALL_DIR=3D${WORKDIR}/cuia_${CUIA_PV}${CUIA_PVExtra} =
install
+             make USRBIN_DIR=3D${bindir} USRLIB_DIR=3D${libdir} TARGET_ROO=
T_DIR=3D${D} CUIA_INSTALL_DIR=3D${STAGING_INCDIR} install
               install -d ${D}${includedir}/
               install -c -m 755 ${S}/include/* ${D}${includedir}/
}
 do_compile () {
               cd ${S}
-              make CUIA_INSTALL_DIR=3D${WORKDIR}/cuia_${CUIA_PV}${CUIA_PVE=
xtra} clean all
+             make CUIA_INSTALL_DIR=3D${STAGING_INCDIR} CUIA_LIB_DIR=3D${ST=
AGING_LIBDIR} clean all
}
 FILES_${PN} +=3D " ${libdir}/lib*.so"
--
1.7.9.5



From: Zhou, Jingting
Sent: Tuesday, February 19, 2013 5:37 PM
To: meta-arago@arago-project.org
Subject: ti trace framework recipe review

From c7a5baf590359096d2a9d3d97f07bb7bfde42e85 Mon Sep 17 00:00:00 2001
From: Jingting Zhou <a0221004@ares-ubuntu>
Date: Tue, 19 Feb 2013 17:35:31 -0500
Subject: [PATCH] added ti-trace framework recipe

---
.../ti-trace-framework/ti-trace-framework_1.0.bb   |   32 +++++++++++++++++=
+++
1 file changed, 32 insertions(+)
create mode 100755 meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trac=
e-framework_1.0.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-fram=
ework_1.0.bb b/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-fr=
amework_1.0.bb
new file mode 100755
index 0000000..63b3c5d
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_1=
.0.bb
@@ -0,0 +1,32 @@
+DESCRIPTION =3D "TI Trace Framework consumer library"
+LICENSE =3D "TI BSD"
+LIC_FILES_CHKSUM =3D "file://include/traceframework.h;md5=3D8d9553efe65fc9=
4cd24d255a1f84b2d5<file:///\\include\traceframework.h;md5=3D8d9553efe65fc94=
cd24d255a1f84b2d5>"
+
+COMPATIBLE_MACHINE =3D "keystone-evm"
+
+CUIA_PV =3D "1_00_00_09"
+CUIA_PVExtra =3D ""
+
+PR =3D "r1"
+BRANCH=3D"master"
+SRC_URI =3D "git://arago-project.org/git/projects/mcsdk-apps.git;protocol=
=3Dgit;branch=3D${BRANCH} \
+                http://software-dl.ti.com/dsps/dsps_public_sw/sdo_ccstudio=
/UIA/SCMCSDK/cuia_${CUIA_PV}${CUIA_PVExtra}.tar.gz;name=3Dcuia<http://softw=
are-dl.ti.com/dsps/dsps_public_sw/sdo_ccstudio/UIA/SCMCSDK/cuia_$%7bCUIA_PV=
%7d$%7bCUIA_PVExtra%7d.tar.gz;name=3Dcuia>"
+
+SRC_URI[cuia.md5sum] =3D "f023de122956176a3794299293bd38e2"
+SRC_URI[cuia.sha256sum] =3D "815df31dfcac933af81db761b81cc42b23f670e7783f6=
4dc9fd50d3bd50df3c8"
+
+S =3D "${WORKDIR}/git/instrumentation/trace_framework"
+SRCREV =3D "${AUTOREV}"
+
+do_install() {
+             make USRBIN_DIR=3D${bindir} USRLIB_DIR=3D${libdir} TARGET_ROO=
T_DIR=3D${D} CUIA_INSTALL_DIR=3D${WORKDIR}/cuia_${CUIA_PV}${CUIA_PVExtra} i=
nstall
+             install -d ${D}${includedir}/
+             install -c -m 755 ${S}/include/* ${D}${includedir}/
+}
+
+do_compile () {
+             cd ${S}
+             make CUIA_INSTALL_DIR=3D${WORKDIR}/cuia_${CUIA_PV}${CUIA_PVEx=
tra} clean all
+}
+
+FILES_${PN} +=3D " ${libdir}/lib*.so"
--
1.7.9.5


--_000_3C08AEEB3C731745938BC83D029FE5E391A8ABDFLE09entticom_
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
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I updated the recipe t=
o RDEPENDS on ti-cuia<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">From d908c04d9a26494ce=
c52f11d4c1d5102b8a70e6f Mon Sep 17 00:00:00 2001<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">From: Jingting Zhou &l=
t;a0221004@ares-ubuntu&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Date: Thu, 21 Feb 2013=
 12:57:40 -0500<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Subject: [PATCH] trace=
 framework recipe update<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">---<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">.../ti-trace-framework=
/ti-trace-framework_1.0.bb&nbsp;&nbsp; |&nbsp;&nbsp; 14 &#43;&#43;&#43;&#43=
;----------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">1 file changed, 4 inse=
rtions(&#43;), 10 deletions(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">diff --git a/meta-arag=
o-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_1.0.bb b/meta-ar=
ago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_1.0.bb<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">index 63b3c5d..b7bdbd4=
 100755<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">--- a/meta-arago-extra=
s/recipes-bsp/ti-trace-framework/ti-trace-framework_1.0.bb<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&#43;&#43; b/meta=
-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_1.0.bb<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">@@ -3,30 &#43;3,24 @@ =
LICENSE =3D &quot;TI BSD&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">LIC_FILES_CHKSUM =3D &=
quot;file://include/traceframework.h;md5=3D8d9553efe65fc94cd24d255a1f84b2d5=
&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;COMPATIBLE_MACHI=
NE =3D &quot;keystone-evm&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-CUIA_PV =3D &quot;1_0=
0_00_09&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-CUIA_PVExtra =3D &quo=
t;&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;RDEPENDS =3D&quot=
;ti-cuia&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;PR =3D &quot;r1&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">BRANCH=3D&quot;master&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-SRC_URI =3D &quot;git=
://arago-project.org/git/projects/mcsdk-apps.git;protocol=3Dgit;branch=3D${=
BRANCH} \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; http=
://software-dl.ti.com/dsps/dsps_public_sw/sdo_ccstudio/UIA/SCMCSDK/cuia_${C=
UIA_PV}${CUIA_PVExtra}.tar.gz;name=3Dcuia&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-SRC_URI[cuia.md5sum] =
=3D &quot;f023de122956176a3794299293bd38e2&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-SRC_URI[cuia.sha256su=
m] =3D &quot;815df31dfcac933af81db761b81cc42b23f670e7783f64dc9fd50d3bd50df3=
c8&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;SRC_URI =3D &quot=
;git://arago-project.org/git/projects/mcsdk-apps.git;protocol=3Dgit;branch=
=3D${BRANCH}&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;S =3D &quot;${WO=
RKDIR}/git/instrumentation/trace_framework&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">SRCREV =3D &quot;${AUT=
OREV}&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;do_install() {<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make USRBIN_DIR=
=3D${bindir} USRLIB_DIR=3D${libdir} TARGET_ROOT_DIR=3D${D} CUIA_INSTALL_DIR=
=3D${WORKDIR}/cuia_${CUIA_PV}${CUIA_PVExtra} install<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make USRBIN_DIR=3D$=
{bindir} USRLIB_DIR=3D${libdir} TARGET_ROOT_DIR=3D${D} CUIA_INSTALL_DIR=3D$=
{STAGING_INCDIR} install<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d $=
{D}${includedir}/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -c -=
m 755 ${S}/include/* ${D}${includedir}/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">}<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;do_compile () {<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd ${S}<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-&nbsp; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make CUIA_INSTALL_DIR=
=3D${WORKDIR}/cuia_${CUIA_PV}${CUIA_PVExtra} clean all<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp; &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make CUIA_INSTALL_DIR=3D=
${STAGING_INCDIR} CUIA_LIB_DIR=3D${STAGING_LIBDIR} clean all<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">}<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;FILES_${PN} &#43=
;=3D &quot; ${libdir}/lib*.so&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-- <o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">1.7.9.5<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Zhou, Ji=
ngting
<br>
<b>Sent:</b> Tuesday, February 19, 2013 5:37 PM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> ti trace framework recipe review<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">From c7a5baf590359096d2a9d3d97f07bb7bfde42e85 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Jingting Zhou &lt;a0221004@ares-ubuntu&gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">Date: Tue, 19 Feb 2013 17:35:31 -0500<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] added ti-trace framework recipe<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../ti-trace-framework/ti-trace-framework_1.0.bb&nbs=
p;&nbsp; |&nbsp;&nbsp; 32 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 32 insertions(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-extras/recipes-bsp/ti-=
trace-framework/ti-trace-framework_1.0.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-extras/recipes-bsp/ti-trace-=
framework/ti-trace-framework_1.0.bb b/meta-arago-extras/recipes-bsp/ti-trac=
e-framework/ti-trace-framework_1.0.bb<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..63b3c5d<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-extras/recipes-bsp/ti-t=
race-framework/ti-trace-framework_1.0.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,32 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DESCRIPTION =3D &quot;TI Trace Framework consum=
er library&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LICENSE =3D &quot;TI BSD&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file:///\=
\include\traceframework.h;md5=3D8d9553efe65fc94cd24d255a1f84b2d5">file://in=
clude/traceframework.h;md5=3D8d9553efe65fc94cd24d255a1f84b2d5</a>&quot;<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;COMPATIBLE_MACHINE =3D &quot;keystone-evm&quot;=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;CUIA_PV =3D &quot;1_00_00_09&quot;<o:p></o:p></=
p>
<p class=3D"MsoNormal">&#43;CUIA_PVExtra =3D &quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PR =3D &quot;r1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;BRANCH=3D&quot;master&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI =3D &quot;git://arago-project.org/git/p=
rojects/mcsdk-apps.git;protocol=3Dgit;branch=3D${BRANCH} \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <a href=3D"http://software-dl.ti.com=
/dsps/dsps_public_sw/sdo_ccstudio/UIA/SCMCSDK/cuia_$%7bCUIA_PV%7d$%7bCUIA_P=
VExtra%7d.tar.gz;name=3Dcuia">
http://software-dl.ti.com/dsps/dsps_public_sw/sdo_ccstudio/UIA/SCMCSDK/cuia=
_${CUIA_PV}${CUIA_PVExtra}.tar.gz;name=3Dcuia</a>&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[cuia.md5sum] =3D &quot;f023de122956176a=
3794299293bd38e2&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[cuia.sha256sum] =3D &quot;815df31dfcac9=
33af81db761b81cc42b23f670e7783f64dc9fd50d3bd50df3c8&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;S =3D &quot;${WORKDIR}/git/instrumentation/trac=
e_framework&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRCREV =3D &quot;${AUTOREV}&quot;<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do_install() {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; make USRBIN_DIR=3D${bindir} USRLIB_DIR=3D${libdir=
} TARGET_ROOT_DIR=3D${D} CUIA_INSTALL_DIR=3D${WORKDIR}/cuia_${CUIA_PV}${CUI=
A_PVExtra} install<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${includedir}/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 755 ${S}/include/* ${D}${includedir=
}/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do_compile () {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; cd ${S}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; make CUIA_INSTALL_DIR=3D${WORKDIR}/cuia_${CUIA_PV}${CU=
IA_PVExtra} clean all<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN} &#43;=3D &quot; ${libdir}/lib*.so&q=
uot;<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.9.5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3C08AEEB3C731745938BC83D029FE5E391A8ABDFLE09entticom_--
