Return-Path: <sajesh@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A7A0252A30
	for <meta-arago@arago-project.org>;
	Wed, 24 Jul 2013 18:26:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6OIQmTx021577
	for <meta-arago@arago-project.org>; Wed, 24 Jul 2013 13:26:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6OIQmwx016455
	for <meta-arago@arago-project.org>; Wed, 24 Jul 2013 13:26:48 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 24 Jul 2013 13:26:48 -0500
From: "Saran, Sajesh Kumar" <sajesh@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: compiling a native (x86) application using Yocto
Thread-Index: Ac6ImMQDGnryB0yHRnSnNiDIqcHy8w==
Date: Wed, 24 Jul 2013 18:26:48 +0000
Message-ID: <8EAE6244CE843044A42356038645C8551573CB16@DFLE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: compiling a native (x86) application using Yocto
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
X-List-Received-Date: Wed, 24 Jul 2013 18:26:52 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8EAE6244CE843044A42356038645C8551573CB16DFLE12entticom_"

--_000_8EAE6244CE843044A42356038645C8551573CB16DFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to compile a native tool/application using Yocto.

I have added BBCLASSEXTEND =3D "native" to the recipe. The compilation goes=
 thru fine. But, in do_package_qa it is running a strip command using arm-l=
inux-gnueabihf-strip, which is failing because the application is compiled =
using gcc. Do I have to anything else to fix of this issue?

Regards,
Sajesh


--_000_8EAE6244CE843044A42356038645C8551573CB16DFLE12entticom_
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to compile a native tool/application usi=
ng Yocto.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have added BBCLASSEXTEND =3D &quot;native&quot; to=
 the recipe. The compilation goes thru fine. But, in do_package_qa it is ru=
nning a strip command using arm-linux-gnueabihf-strip, which is failing bec=
ause the application is compiled using gcc. Do
 I have to anything else to fix of this issue?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Sajesh<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_8EAE6244CE843044A42356038645C8551573CB16DFLE12entticom_--
