Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DEA4252A77
	for <meta-arago@arago-project.org>;
	Wed, 17 Jul 2013 13:06:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6HD6nW3007681
	for <meta-arago@arago-project.org>; Wed, 17 Jul 2013 08:06:49 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6HD6ndr029962
	for <meta-arago@arago-project.org>; Wed, 17 Jul 2013 08:06:49 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 17 Jul 2013 08:06:48 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Saran, Sajesh Kumar" <sajesh@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: Linux kernel headers in devkit
Thread-Index: Ac6CbZanwD+jVx3xQqSynQYTwrspJAAgHixg
Date: Wed, 17 Jul 2013 13:06:47 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015965BAE4@DLEE11.ent.ti.com>
References: <8EAE6244CE843044A42356038645C855157360F8@DFLE12.ent.ti.com>
In-Reply-To: <8EAE6244CE843044A42356038645C855157360F8@DFLE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: Linux kernel headers in devkit
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
X-List-Received-Date: Wed, 17 Jul 2013 13:06:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED1015965BAE4DLEE11entticom_"

--_000_7D46E86EC0A8354091174257B2FED1015965BAE4DLEE11entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Saran, Sajesh Kumar
Sent: Tuesday, July 16, 2013 4:46 PM
To: meta-arago@arago-project.org
Subject: [meta-arago] Linux kernel headers in devkit

Hi,

We want to package kernel header files in the devkit.
Is there any recipe/package which could pull in usr/src of the sysroot to a=
 package?

[CEM] Any particular reason why?  Do you not already have the kernel source=
s packaged in your sdk?  The kernel-dev package has the headers so you coul=
d play with installing that, but I=92m not sure why you want to tie your to=
olchain and libraries to the kernel headers.



Regards,
Sajesh


--_000_7D46E86EC0A8354091174257B2FED1015965BAE4DLEE11entticom_
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
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ara=
go-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org]
<b>On Behalf Of </b>Saran, Sajesh Kumar<br>
<b>Sent:</b> Tuesday, July 16, 2013 4:46 PM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> [meta-arago] Linux kernel headers in devkit<o:p></o:p></spa=
n></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We want to package kernel header files in the devkit=
.<o:p></o:p></p>
<p class=3D"MsoNormal">Is there any recipe/package which could pull in usr/=
src of the sysroot to a package?<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">[CEM] Any particular r=
eason why?&nbsp; Do you not already have the kernel sources packaged in you=
r sdk?&nbsp; The kernel-dev package has the headers so you could play with =
installing that, but I=92m not sure why you want
 to tie your toolchain and libraries to the kernel headers.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Sajesh<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED1015965BAE4DLEE11entticom_--
