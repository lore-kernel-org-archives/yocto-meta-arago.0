Return-Path: <zhoujt@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 40F4752A1D
	for <meta-arago@arago-project.org>;
	Tue, 19 Feb 2013 02:45:41 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1J2jeiC020918
	for <meta-arago@arago-project.org>; Mon, 18 Feb 2013 20:45:40 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1J2jefC007086
	for <meta-arago@arago-project.org>; Mon, 18 Feb 2013 20:45:40 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 18 Feb 2013 20:45:40 -0600
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: packagegroup-arago-console review
Thread-Index: Ac4OSzDnKWDcsCPGRF6Wd1uY0rWQLQ==
Date: Tue, 19 Feb 2013 02:45:39 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E391A160@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: packagegroup-arago-console review
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
X-List-Received-Date: Tue, 19 Feb 2013 02:45:41 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3C08AEEB3C731745938BC83D029FE5E391A160DFLE09entticom_"

--_000_3C08AEEB3C731745938BC83D029FE5E391A160DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From e61b6649e26215ccda2d392ef84dbb23b182d460 Mon Sep 17 00:00:00 2001
From: Jingting Zhou <a0221004@ares-ubuntu>
Date: Mon, 18 Feb 2013 21:42:00 -0500
Subject: [PATCH] added several packages to packagegroup-arago-console

---
.../packagegroups/packagegroup-arago-console.bb    |   74 +++++++++++++++++=
+++
1 file changed, 74 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-console.bb
index 1fbe17a..a1ea755 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb
@@ -67,9 +67,83 @@ ARAGO_CONSOLE =3D "\
     ${ARAGO_UTILS} \
     ${ARAGO_SDK_PREREQ} \
     "
+
+ARAGO_LIBNL =3D "\
+    libnl-route \
+    libnl-nf \
+    libnl-genl \
+    libnl-cli \
+    "
+
+ARAGO_PERL =3D "\
+    perl \
+    perl-module-carp \
+    perl-module-class-struct \
+    perl-module-errno \
+    perl-module-exporter \
+    perl-module-exporter-heavy \
+    perl-module-fcntl \
+    perl-module-file-spec \
+    perl-module-file-spec-unix \
+    perl-module-file-stat \
+    perl-module-io-dir \
+    perl-module-io-file \
+    perl-module-io-handle \
+    perl-module-io-pipe \
+    perl-module-io-poll \
+    perl-module-io-seekable \
+    perl-module-io-select \
+    perl-module-io-socket-inet \
+    perl-module-io-socket-unix \
+    perl-module-io-socket \
+    perl-module-io \
+    perl-module-list-util \
+    perl-module-selectsaver \
+    perl-module-socket \
+    perl-module-strict \
+    perl-module-symbol \
+    perl-module-tie-handle \
+    perl-module-tie-hash \
+    perl-module-tie-stdhandle \
+    perl-module-vars \
+    perl-module-warnings-register \
+    perl-module-warnings \
+    perl-module-xsloader \
+              "
+
+ARAGO_NDISC6 =3D "\
+    ndisc6-ndisc6 \
+    ndisc6-rdisc6 \
+    ndisc6-rltraceroute6 \
+    ndisc6-tcpspray6 \
+    ndisc6-tcptraceroute6 \
+    ndisc6-tracert6 \
+              "
 RDEPENDS_${PN} =3D "\
     ${ARAGO_CONSOLE} \
+    ${ARAGO_LIBNL} \
+    ${ARAGO_PERL} \
+    ${ARAGO_NDISC6} \
+    ptpd \
+    vsftpd \
+    syslog-ng \
+    base-files \
+    base-passwd \
+    busybox \
+    initscripts \
+    modutils-initscripts \
+    netbase \
+    dtc \
+    strongswan \
+    procps \
+    dhcp-client \
+    ipsec-tools \
+    kexec \
+    kdump \
+    tzdata \
+    lksctp-tools \
+    libdnet \
     "
 RRECOMMENDS_${PN} =3D "\
--
1.7.9.5


--_000_3C08AEEB3C731745938BC83D029FE5E391A160DFLE09entticom_
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
<p class=3D"MsoNormal">From e61b6649e26215ccda2d392ef84dbb23b182d460 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Jingting Zhou &lt;a0221004@ares-ubuntu&gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">Date: Mon, 18 Feb 2013 21:42:00 -0500<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] added several packages to packagegr=
oup-arago-console<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../packagegroups/packagegroup-arago-console.bb&nbsp=
;&nbsp;&nbsp; |&nbsp;&nbsp; 74 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 74 insertions(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-core/packageg=
roups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packag=
egroups/packagegroup-arago-console.bb<o:p></o:p></p>
<p class=3D"MsoNormal">index 1fbe17a..a1ea755 100755<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-arago-distro/recipes-core/packagegroups/p=
ackagegroup-arago-console.bb<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-distro/recipes-core/pac=
kagegroups/packagegroup-arago-console.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -67,9 &#43;67,83 @@ ARAGO_CONSOLE =3D &quot;\<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; ${ARAGO_UTILS} \<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; ${ARAGO_SDK_PREREQ} \<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; &quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&#43;ARAGO_LIBNL =3D &quot;\<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; libnl-route \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; libnl-nf \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; libnl-genl \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; libnl-cli \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; &quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&#43;ARAGO_PERL =3D &quot;\<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-carp \<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-class-struct \<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-errno \<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-exporter \<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-exporter-heavy \=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-fcntl \<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-file-spec \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-file-spec-unix \=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-file-stat \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-io-dir \<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-io-file \<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-io-handle \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-io-pipe \<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-io-poll \<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-io-seekable \<o:=
p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-io-select \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-io-socket-inet \=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-io-socket-unix \=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-io-socket \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-io \<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-list-util \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-selectsaver \<o:=
p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-socket \<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-strict \<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-symbol \<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-tie-handle \<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-tie-hash \<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-tie-stdhandle \<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-vars \<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-warnings-registe=
r \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-warnings \<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; perl-module-xsloader \<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&#43;ARAGO_NDISC6 =3D &quot;\<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ndisc6-ndisc6 \<o:p></o:p></=
p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ndisc6-rdisc6 \ <o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ndisc6-rltraceroute6 \ <o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ndisc6-tcpspray6 \<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ndisc6-tcptraceroute6 \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ndisc6-tracert6 \<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;RDEPENDS_${PN} =3D &quot;\<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; ${ARAGO_CONSOLE} \<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ${ARAGO_LIBNL} \<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ${ARAGO_PERL} \<o:p></o:p></=
p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ${ARAGO_NDISC6} \<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ptpd \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; vsftpd \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; syslog-ng \&nbsp;&nbsp; <o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; base-files \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; base-passwd \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; busybox \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; initscripts \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; modutils-initscripts \<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; netbase \ &nbsp;&nbsp;&nbsp;=
&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; dtc \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; strongswan \ <o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; procps \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; dhcp-client \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ipsec-tools \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; kexec \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; kdump \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; tzdata \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; lksctp-tools \<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; libdnet \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; &quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;RRECOMMENDS_${PN} =3D &quot;\<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.9.5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3C08AEEB3C731745938BC83D029FE5E391A160DFLE09entticom_--
