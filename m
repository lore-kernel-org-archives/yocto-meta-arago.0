Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8524A529CB
	for <meta-arago@arago-project.org>;
	Mon,  4 Nov 2013 03:06:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA436T5Y001103
	for <meta-arago@arago-project.org>; Sun, 3 Nov 2013 21:06:29 -0600
Received: from DFLE72.ent.ti.com ([128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA436Tof013348
	for <meta-arago@arago-project.org>; Sun, 3 Nov 2013 21:06:29 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Sun, 3 Nov 2013 21:06:29 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: help needed: Need pass variable to autotools .configure
Thread-Index: Ac7ZCrpbQteop9yHSxGUg/QBxX0vAA==
Date: Mon, 4 Nov 2013 03:06:28 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49054985DA9@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Ring, Chris" <cring@ti.com>
Subject: help needed: Need pass variable to autotools .configure
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
X-List-Received-Date: Mon, 04 Nov 2013 03:06:32 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4F9216F96E5DF9428610502835A9F49054985DA9DLEE11entticom_"

--_000_4F9216F96E5DF9428610502835A9F49054985DA9DLEE11entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Currently , my recipe inherits autotools.
I would like update recipe to pass an environment variable define like the =
following when executing ./configure command.
VAR_NAME=3D<dir_name>

Appreciate help on how this can be achieved in the recipe.
With regards,
Sam

--_000_4F9216F96E5DF9428610502835A9F49054985DA9DLEE11entticom_
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
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<p class=3D"MsoNormal">Currently , my recipe inherits autotools.<o:p></o:p>=
</p>
<p class=3D"MsoNormal">I would like update recipe to pass an environment va=
riable define like the following when executing ./configure command.<o:p></=
o:p></p>
<p class=3D"MsoNormal">VAR_NAME=3D&lt;dir_name&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Appreciate help on how this can be achieved in the r=
ecipe.<o:p></o:p></p>
<p class=3D"MsoNormal">With regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Sam<o:p></o:p></p>
</div>
</body>
</html>

--_000_4F9216F96E5DF9428610502835A9F49054985DA9DLEE11entticom_--
