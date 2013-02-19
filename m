Return-Path: <zhoujt@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BB9EC52A29
	for <meta-arago@arago-project.org>;
	Tue, 19 Feb 2013 21:54:25 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1JLsOYU023944
	for <meta-arago@arago-project.org>; Tue, 19 Feb 2013 15:54:24 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1JLsOhG009817
	for <meta-arago@arago-project.org>; Tue, 19 Feb 2013 15:54:24 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 19 Feb 2013 15:54:24 -0600
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: packagegroup-arago-console review
Thread-Index: Ac4OSzDnKWDcsCPGRF6Wd1uY0rWQLQABIXlQACV8IWA=
Date: Tue, 19 Feb 2013 21:54:24 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E391A42A@DFLE09.ent.ti.com>
References: <3C08AEEB3C731745938BC83D029FE5E391A160@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C395358@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C395358@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: packagegroup-arago-console review
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
X-List-Received-Date: Tue, 19 Feb 2013 21:54:26 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3C08AEEB3C731745938BC83D029FE5E391A42ADFLE09entticom_"

--_000_3C08AEEB3C731745938BC83D029FE5E391A42ADFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Here's the updated patch. Created a new package group, added it to the desi=
red image, removed extra packages.

From 115f64f705e29743a3a0e8be36f66a0a8ecc31b3 Mon Sep 17 00:00:00 2001
From: Jingting Zhou <a0221004@ares-ubuntu>
Date: Tue, 19 Feb 2013 16:10:05 -0500
Subject: [PATCH] added a new package group

---
.../images/tisdk-server-rootfs-image.bb            |    1 +
.../packagegroup-arago-base-tisdk-server-extra.bb  |   79 +++++++++++++++++=
+++
2 files changed, 80 insertions(+)
mode change 100644 =3D> 100755 meta-arago-distro/recipes-core/images/tisdk-=
server-rootfs-image.bb
create mode 100755 meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-arago-base-tisdk-server-extra.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-imag=
e.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
old mode 100644
new mode 100755
index e5ce2b5..c6eb1ca
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -10,6 +10,7 @@ IMAGE_INSTALL +=3D "\
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-matrix \
+   packagegroup-arago-base-tisdk-server-extra \
     gdb \
"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups=
/packagegroup-arago-base-tisdk-server-extra.bb
new file mode 100755
index 0000000..aa82e46
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-=
tisdk-server-extra.bb
@@ -0,0 +1,79 @@
+DESCRIPTION =3D "Additional packages beyond console packages shared by TI =
SDKs"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+PR =3D "r1"
+
+inherit packagegroup
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
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
+    "
+
+ARAGO_NDISC6 =3D "\
+    ndisc6-ndisc6 \
+    ndisc6-rdisc6 \
+    ndisc6-rltraceroute6 \
+    ndisc6-tcpspray6 \
+    ndisc6-tcptraceroute6 \
+    ndisc6-tracert6 \
+    "
+
+RDEPENDS_${PN} =3D "\
+    ${ARAGO_LIBNL} \
+    ${ARAGO_PERL} \
+    ${ARAGO_NDISC6} \
+    ptpd \
+    vsftpd \
+    syslog-ng \
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
+    "
--
1.7.9.5


From: Cooper Jr., Franklin
Sent: Monday, February 18, 2013 10:27 PM
To: Zhou, Jingting; meta-arago@arago-project.org
Subject: RE: packagegroup-arago-console review

Packagegroup-arago-console should be kept really at a bare minimum really t=
o provide a minimal bootable filesystem. Adding perl and all these networki=
ng packages shouldn't be included. Also if you look at arago-base-image whi=
ch includes arago-image.inc which then adds packagegroup-core-boot (in oe-c=
ore) you will see that packages like busybox, base-passwd, etc.. are alread=
y being included.

I am assuming you need these files for a more full fledge filesystem rather=
 than an extremely minimal filesystem. Any reason you can't  create your ow=
n packagegroup that include these packages and add it to your custom image =
recipe?

From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago-=
project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Zho=
u, Jingting
Sent: Monday, February 18, 2013 8:46 PM
To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
Subject: [meta-arago] packagegroup-arago-console review

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


--_000_3C08AEEB3C731745938BC83D029FE5E391A42ADFLE09entticom_
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
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle21
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Here&#8217;s the updat=
ed patch. Created a new package group, added it to the desired image, remov=
ed extra packages.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">From 115f64f705e29743a=
3a0e8be36f66a0a8ecc31b3 Mon Sep 17 00:00:00 2001<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">From: Jingting Zhou &l=
t;a0221004@ares-ubuntu&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Date: Tue, 19 Feb 2013=
 16:10:05 -0500<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Subject: [PATCH] added=
 a new package group<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">---<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">.../images/tisdk-serve=
r-rootfs-image.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |&nbsp;&nbsp;&nbsp; 1 &#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">.../packagegroup-arago=
-base-tisdk-server-extra.bb&nbsp; |&nbsp;&nbsp; 79 &#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">2 files changed, 80 in=
sertions(&#43;)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">mode change 100644 =3D=
&gt; 100755 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image=
.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">create mode 100755 met=
a-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-ser=
ver-extra.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">diff --git a/meta-arag=
o-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-dist=
ro/recipes-core/images/tisdk-server-rootfs-image.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">old mode 100644<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">new mode 100755<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">index e5ce2b5..c6eb1ca=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">--- a/meta-arago-distr=
o/recipes-core/images/tisdk-server-rootfs-image.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&#43;&#43; b/meta=
-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">@@ -10,6 &#43;10,7 @@ =
IMAGE_INSTALL &#43;=3D &quot;\<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p; packagegroup-arago-tisdk-addons \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p; packagegroup-arago-tisdk-crypto \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p; packagegroup-arago-tisdk-matrix \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp; pack=
agegroup-arago-base-tisdk-server-extra \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p; gdb \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&quot;<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">diff --git a/meta-arag=
o-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-ex=
tra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ba=
se-tisdk-server-extra.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">new file mode 100755<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">index 0000000..aa82e46=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">--- /dev/null<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&#43;&#43; b/meta=
-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-serv=
er-extra.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">@@ -0,0 &#43;1,79 @@<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;DESCRIPTION =3D &=
quot;Additional packages beyond console packages shared by TI SDKs&quot;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;LICENSE =3D &quot=
;MIT&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;LIC_FILES_CHKSUM =
=3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361=
b4de20420&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;PR =3D &quot;r1&q=
uot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;inherit packagegr=
oup<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;PACKAGE_ARCH =3D =
&quot;${MACHINE_ARCH}&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;ARAGO_LIBNL =3D &=
quot;\<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; libnl-route \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; libnl-nf \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; libnl-genl \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; libnl-cli \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; &quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;ARAGO_PERL =3D &q=
uot;\<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-carp \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-class-struct \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-errno \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-exporter \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-exporter-heavy \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-fcntl \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-file-spec \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-file-spec-unix \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-file-stat \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-io-dir \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-io-file \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-io-handle \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-io-pipe \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-io-poll \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp; &nbsp;&nbs=
p;perl-module-io-seekable \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-io-select \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-io-socket-inet \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-io-socket-unix \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-io-socket \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-io \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-list-util \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-selectsaver \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-socket \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-strict \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-symbol \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-tie-handle \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-tie-hash \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-tie-stdhandle \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-vars \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-warnings-register \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-warnings \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; perl-module-xsloader \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; &quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;ARAGO_NDISC6 =3D =
&quot;\<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; ndisc6-ndisc6 \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; ndisc6-rdisc6 \ <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; ndisc6-rltraceroute6 \ <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; ndisc6-tcpspray6 \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; ndisc6-tcptraceroute6 \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; ndisc6-tracert6 \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; &quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;RDEPENDS_${PN} =
=3D &quot;\<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; ${ARAGO_LIBNL} \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; ${ARAGO_PERL} \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; ${ARAGO_NDISC6} \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; ptpd \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; vsftpd \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; syslog-ng \&nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; dtc \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; strongswan \ <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; procps \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; dhcp-client \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; ipsec-tools \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; kexec \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; kdump \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; tzdata \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; lksctp-tools \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; libdnet \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; &quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-- <o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">1.7.9.5<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Cooper J=
r., Franklin
<br>
<b>Sent:</b> Monday, February 18, 2013 10:27 PM<br>
<b>To:</b> Zhou, Jingting; meta-arago@arago-project.org<br>
<b>Subject:</b> RE: packagegroup-arago-console review<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Packagegroup-arago-con=
sole should be kept really at a bare minimum really to provide a minimal bo=
otable filesystem. Adding perl and all these networking packages shouldn&#8=
217;t be included. Also if you look at arago-base-image
 which includes arago-image.inc which then adds packagegroup-core-boot (in =
oe-core) you will see that packages like busybox, base-passwd, etc.. are al=
ready being included.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I am assuming you need=
 these files for a more full fledge filesystem rather than an extremely min=
imal filesystem. Any reason you can&#8217;t&nbsp; create your own packagegr=
oup that include these packages and add it to your
 custom image recipe?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">
<a href=3D"mailto:meta-arago-bounces@arago-project.org">meta-arago-bounces@=
arago-project.org</a> [<a href=3D"mailto:meta-arago-bounces@arago-project.o=
rg">mailto:meta-arago-bounces@arago-project.org</a>]
<b>On Behalf Of </b>Zhou, Jingting<br>
<b>Sent:</b> Monday, February 18, 2013 8:46 PM<br>
<b>To:</b> <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago=
-project.org</a><br>
<b>Subject:</b> [meta-arago] packagegroup-arago-console review<o:p></o:p></=
span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;RRECOMMENDS_${PN} =3D &quot;\<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.9.5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_3C08AEEB3C731745938BC83D029FE5E391A42ADFLE09entticom_--
