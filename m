Return-Path: <mrinmayee@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BD11C52A67
	for <meta-arago@arago-project.org>;
	Wed,  8 Jan 2014 05:04:27 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0854Pj9015109
	for <meta-arago@arago-project.org>; Tue, 7 Jan 2014 23:04:26 -0600
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0854NhH019229
	for <meta-arago@arago-project.org>; Wed, 8 Jan 2014 10:34:24 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Wed, 8 Jan 2014 13:04:23 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Do_rootfs failure with tools-sdk in EXTRA_IMAGE_FEATURES
Thread-Index: Ac8MLtpvB3o0HfeJRxWFbqiCDrzzOgAACMtw
Date: Wed, 8 Jan 2014 05:04:23 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D5478BBE@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "R, Karthik" <karthik.ramanan@ti.com>
Subject: FW: Do_rootfs failure with tools-sdk in EXTRA_IMAGE_FEATURES
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
X-List-Received-Date: Wed, 08 Jan 2014 05:04:28 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CF956B779D819D41BBC043B7082161D5478BBEDBDE04entticom_"

--_000_CF956B779D819D41BBC043B7082161D5478BBEDBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi all,

I am trying to add development tools in the filesystem. After adding tools-=
sdk in EXTRA_IMAGE_FEATURES, the build failed in the rootfs task. Snapshot =
of the log:
Collected errors:
* satisfy_dependencies_for: Cannot satisfy the following dependencies for p=
ackagegroup-core-sdk:
*      ldd *
* opkg_install_cmd: Cannot install package packagegroup-core-sdk.

Ldd package provided by eglibc is not getting built.

Similar errors was seen when I built arago-console-image with the arago-dyl=
an-config.
Is this a known issue and any pointers to resolve it?

Regards,
Mrinmayee


--_000_CF956B779D819D41BBC043B7082161D5478BBEDBDE04entticom_
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to add development tools in the filesyst=
em. After adding tools-sdk in EXTRA_IMAGE_FEATURES, the build failed in the=
 rootfs task. Snapshot of the log:<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Collected errors:<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">* satisfy_dependencies_for=
: Cannot satisfy the following dependencies for packagegroup-core-sdk:<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">*&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ldd *<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">* opkg_install_cmd: Cannot=
 install package packagegroup-core-sdk.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal">Ldd package provided by eglibc is not getting built.=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Similar errors was seen when I built arago-console-i=
mage with the
<b>arago-dylan-config.<o:p></o:p></b></p>
<p class=3D"MsoNormal">Is this a known issue and any pointers to resolve it=
?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Mrinmayee<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CF956B779D819D41BBC043B7082161D5478BBEDBDE04entticom_--
