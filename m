Return-Path: <zhoujt@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DEB0852A1D
	for <meta-arago@arago-project.org>;
	Tue, 19 Feb 2013 02:51:40 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1J2peeM007151
	for <meta-arago@arago-project.org>; Mon, 18 Feb 2013 20:51:40 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1J2pep3013396
	for <meta-arago@arago-project.org>; Mon, 18 Feb 2013 20:51:40 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 18 Feb 2013 20:51:40 -0600
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: vtun recipe review
Thread-Index: Ac4OTAg8qENO/MmZQnmLRfSnfHYCtA==
Date: Tue, 19 Feb 2013 02:51:38 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E391A1A4@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: vtun recipe review
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
X-List-Received-Date: Tue, 19 Feb 2013 02:51:41 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3C08AEEB3C731745938BC83D029FE5E391A1A4DFLE09entticom_"

--_000_3C08AEEB3C731745938BC83D029FE5E391A1A4DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From 7f175836ab1c4a02f1b35322fff7ece88abbd34e Mon Sep 17 00:00:00 2001
From: Jingting Zhou <a0221004@ares-ubuntu>
Date: Mon, 18 Feb 2013 21:26:17 -0500
Subject: [PATCH] added vtun recipe

---
.../recipes-connectivity/vtun/vtun_3.0.3.bb        |   22 +++++++++++++++++=
+++
1 file changed, 22 insertions(+)
create mode 100755 meta-arago-distro/recipes-connectivity/vtun/vtun_3.0.3.b=
b

diff --git a/meta-arago-distro/recipes-connectivity/vtun/vtun_3.0.3.bb b/me=
ta-arago-distro/recipes-connectivity/vtun/vtun_3.0.3.bb
new file mode 100755
index 0000000..8b3b1a9
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "Virtual Tunnels over TCP/IP networks with traffic shaping=
, compression and encryption."
+HOMEPAGE =3D "http://vtun.sourceforge.net/"
+SECTION =3D "console/network"
+PRIORITY =3D "optional"
+LICENSE =3D "GPL"
+DEPENDS =3D "zlib lzo"
+PR =3D "r1"
+LIC_FILES_CHKSUM =3D "file://Makefile.in;endline=3D14;md5=3D79e41e827b3240=
b63ab8b5810e903742"
+
+SRC_URI =3D "http://downloads.sourceforge.net/project/vtun/vtun/${PV}/vtun=
-${PV}.tar.gz"
+
+SRC_URI[md5sum] =3D "f3becf2a0270910a841060c08d1db824"
+SRC_URI[sha256sum] =3D "69dcbe4f8c5ce7d91b4150a6309e536d03b61841169746ca57=
88413ac7edb9cb"
+
+inherit autotools
+
+do_configure() {
+              oe_runconf --with-lzo-headers=3D${STAGING_INCDIR}/lzo --with=
-lzo-lib=3D${STAGING_LIBDIR} --with-ssl-headers=3D${STAGING_INCDIR}/openssl=
 --with-ssl-lib=3D${STAGING_LIBDIR}
+              sed '102d' Makefile > Makefile.new
+              mv Makefile.new Makefile
+}
+
--
1.7.9.5


--_000_3C08AEEB3C731745938BC83D029FE5E391A1A4DFLE09entticom_
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
<p class=3D"MsoNormal">From 7f175836ab1c4a02f1b35322fff7ece88abbd34e Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Jingting Zhou &lt;a0221004@ares-ubuntu&gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">Date: Mon, 18 Feb 2013 21:26:17 -0500<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] added vtun recipe<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../recipes-connectivity/vtun/vtun_3.0.3.bb&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 22 &#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 22 insertions(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-distro/recipes-connect=
ivity/vtun/vtun_3.0.3.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-connectivity/=
vtun/vtun_3.0.3.bb b/meta-arago-distro/recipes-connectivity/vtun/vtun_3.0.3=
.bb<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..8b3b1a9<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-distro/recipes-connecti=
vity/vtun/vtun_3.0.3.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,22 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DESCRIPTION =3D &quot;Virtual Tunnels over TCP/=
IP networks with traffic shaping, compression and encryption.&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;HOMEPAGE =3D &quot;http://vtun.sourceforge.net/=
&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SECTION =3D &quot;console/network&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;PRIORITY =3D &quot;optional&quot;<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;LICENSE =3D &quot;GPL&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DEPENDS =3D &quot;zlib lzo&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PR =3D &quot;r1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LIC_FILES_CHKSUM =3D &quot;file://Makefile.in;e=
ndline=3D14;md5=3D79e41e827b3240b63ab8b5810e903742&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI =3D &quot;http://downloads.sourceforge.=
net/project/vtun/vtun/${PV}/vtun-${PV}.tar.gz&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[md5sum] =3D &quot;f3becf2a0270910a84106=
0c08d1db824&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[sha256sum] =3D &quot;69dcbe4f8c5ce7d91b=
4150a6309e536d03b61841169746ca5788413ac7edb9cb&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;inherit autotools<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do_configure() {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runconf --with-lzo-headers=3D${STAGING_I=
NCDIR}/lzo --with-lzo-lib=3D${STAGING_LIBDIR} --with-ssl-headers=3D${STAGIN=
G_INCDIR}/openssl --with-ssl-lib=3D${STAGING_LIBDIR}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed '102d' Makefile &gt; Makefile.new<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv Makefile.new Makefile<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.9.5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3C08AEEB3C731745938BC83D029FE5E391A1A4DFLE09entticom_--
