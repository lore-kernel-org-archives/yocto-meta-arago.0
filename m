Return-Path: <sajesh@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 35EE252A55
	for <meta-arago@arago-project.org>;
	Wed, 17 Jul 2013 14:58:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6HEwd1e022577
	for <meta-arago@arago-project.org>; Wed, 17 Jul 2013 09:58:39 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6HEwdes014170
	for <meta-arago@arago-project.org>; Wed, 17 Jul 2013 09:58:39 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 17 Jul 2013 09:58:39 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Wed, 17 Jul 2013 09:58:39 -0500
From: "Saran, Sajesh Kumar" <sajesh@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: Linux kernel headers in devkit
Thread-Index: Ac6CbZanwD+jVx3xQqSynQYTwrspJAAgHixgAAOfncA=
Date: Wed, 17 Jul 2013 14:58:38 +0000
Message-ID: <8EAE6244CE843044A42356038645C85515736400@DFLE12.ent.ti.com>
References: <8EAE6244CE843044A42356038645C855157360F8@DFLE12.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015965BAE4@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015965BAE4@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
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
X-List-Received-Date: Wed, 17 Jul 2013 14:58:47 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8EAE6244CE843044A42356038645C85515736400DFLE12entticom_"

--_000_8EAE6244CE843044A42356038645C85515736400DFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Chase,

The kernel source is not packaged in the release. Moreover, the Yocto/Arago=
 puts the header files in an src directory of sysroot. Sometimes applicatio=
ns want to include kernel header files to get IOCTL definitions and develop=
 kernel objects. If we add kernel source in devkit it will be similar devel=
opment environment.

I will try out kernel-dev package.

Regards,
Sajesh

From: Maupin, Chase
Sent: Wednesday, July 17, 2013 9:07 AM
To: Saran, Sajesh Kumar; meta-arago@arago-project.org
Subject: RE: Linux kernel headers in devkit

From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago-=
project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Sar=
an, Sajesh Kumar
Sent: Tuesday, July 16, 2013 4:46 PM
To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
Subject: [meta-arago] Linux kernel headers in devkit

Hi,

We want to package kernel header files in the devkit.
Is there any recipe/package which could pull in usr/src of the sysroot to a=
 package?

[CEM] Any particular reason why?  Do you not already have the kernel source=
s packaged in your sdk?  The kernel-dev package has the headers so you coul=
d play with installing that, but I'm not sure why you want to tie your tool=
chain and libraries to the kernel headers.



Regards,
Sajesh


--_000_8EAE6244CE843044A42356038645C85515736400DFLE12entticom_
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
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle19
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Chase,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">The kernel source is n=
ot packaged in the release. Moreover, the Yocto/Arago puts the header files=
 in an src directory of sysroot. Sometimes applications want to include ker=
nel header files to get IOCTL definitions
 and develop kernel objects. If we add kernel source in devkit it will be s=
imilar development environment.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I will try out kernel-=
dev package.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Regards,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Sajesh<o:p></o:p></spa=
n></p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Maupin, =
Chase
<br>
<b>Sent:</b> Wednesday, July 17, 2013 9:07 AM<br>
<b>To:</b> Saran, Sajesh Kumar; meta-arago@arago-project.org<br>
<b>Subject:</b> RE: Linux kernel headers in devkit<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
<b>On Behalf Of </b>Saran, Sajesh Kumar<br>
<b>Sent:</b> Tuesday, July 16, 2013 4:46 PM<br>
<b>To:</b> <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago=
-project.org</a><br>
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
installing that, but I&#8217;m not sure why you want
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

--_000_8EAE6244CE843044A42356038645C85515736400DFLE12entticom_--
