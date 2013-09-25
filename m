Return-Path: <Sixten.Sjoestroem.Thames@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by arago-project.org (Postfix) with SMTP id 8001A5296F
	for <meta-arago@arago-project.org>;
	Wed, 25 Sep 2013 12:47:59 +0000 (UTC)
Received: from SESTOEX09.enea.se ([fe80::cc12:dcdc:d521:97f8]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.02.0318.001; Wed, 25 Sep 2013 14:47:58 +0200
From: =?iso-8859-1?Q?Sixten_Sj=F6str=F6m_Thames?=
	<Sixten.Sjoestroem.Thames@enea.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: NO_HZ and TI MCSDK 3.8.4 kernel for Keystone 2
Thread-Index: Ac652tmV75OC3SqSRN+dR5gKp9O5ow==
Date: Wed, 25 Sep 2013 12:47:58 +0000
Message-ID: <B0B361514883EA47B19C4FC8275640D125BC8137@sestoex09.enea.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.141.148]
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Sep 2013 17:32:34 +0000
Cc: "santosh.shilimkar@ti.com" <santosh.shilimkar@ti.com>
Subject: NO_HZ and TI MCSDK 3.8.4 kernel for Keystone 2
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
X-List-Received-Date: Wed, 25 Sep 2013 12:48:00 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0B361514883EA47B19C4FC8275640D125BC8137sestoex09enease_"

--_000_B0B361514883EA47B19C4FC8275640D125BC8137sestoex09enease_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm interested in getting the CONFIG_NO_HZ_FULL kernel configuration (http:=
//lwn.net/Articles/549580/) to work with the MCSDK kernel for Keystone 2 (h=
ttp://arago-project.org/git/projects/?p=3Dlinux-keystone.git).

Some questions:
Are there any plans to rebase the Keystone 2 BSP against a newer Linux kern=
el version that supports NO_HZ_FULL (3.10 or later) in the near future?
Are there any available patches that enable the NO_HZ_FULL configuration fo=
r the MCSDK 3.8.4 Linux kernel?

Best Regards,
Sixten Sj=F6str=F6m Thames

--_000_B0B361514883EA47B19C4FC8275640D125BC8137sestoex09enease_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
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
<p class=3D"MsoNormal">I&#8217;m interested in getting the CONFIG_NO_HZ_FUL=
L kernel configuration (http://lwn.net/Articles/549580/) to work with the M=
CSDK kernel for Keystone 2 (<a href=3D"http://arago-project.org/git/project=
s/?p=3Dlinux-keystone.git">http://arago-project.org/git/projects/?p=3Dlinux=
-keystone.git</a>).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Some questions:<o:p></o:p></p>
<p class=3D"MsoNormal">Are there any plans to rebase the Keystone 2 BSP aga=
inst a newer Linux kernel version that supports NO_HZ_FULL (3.10 or later) =
in the near future?<o:p></o:p></p>
<p class=3D"MsoNormal">Are there any available patches that enable the NO_H=
Z_FULL configuration for the MCSDK 3.8.4 Linux kernel?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Sixten Sj=F6str=F6m Thames<o:p></o:p></p>
</div>
</body>
</html>

--_000_B0B361514883EA47B19C4FC8275640D125BC8137sestoex09enease_--
