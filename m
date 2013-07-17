Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9D01752A62
	for <meta-arago@arago-project.org>;
	Wed, 17 Jul 2013 16:35:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6HGZSIf000847
	for <meta-arago@arago-project.org>; Wed, 17 Jul 2013 11:35:28 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6HGZSNY026584
	for <meta-arago@arago-project.org>; Wed, 17 Jul 2013 11:35:28 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 17 Jul 2013 11:35:28 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Nelson,
	Sam" <sam.nelson@ti.com>
Thread-Topic: [meta-arago] Help needed: devkit in tar file form
Thread-Index: AQHOgwul1qy7myuwRUymORt++E9N/Q==
Date: Wed, 17 Jul 2013 16:35:28 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E8375F0@DLEE08.ent.ti.com>
References: <4F9216F96E5DF9428610502835A9F49054939658@DLEE11.ent.ti.com>
In-Reply-To: <4F9216F96E5DF9428610502835A9F49054939658@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: Help needed: devkit in tar file form
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
X-List-Received-Date: Wed, 17 Jul 2013 16:35:29 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E8375F0DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E8375F0DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Because the devkit needs to be installed/relocated to the final destination=
. After that it cannot be moved. Take a look at how it's done in AMSDK to c=
all the devkit installer from InstallJammer. But you can't do it from Windo=
ws.


Denys


-----Original Message-----
From: Nelson, Sam [sam.nelson@ti.com]
Received: Wednesday, 17 Jul 2013, 12:09
To: meta-arago@arago-project.org [meta-arago@arago-project.org]
Subject: [meta-arago] Help needed: devkit in tar file form

Hello all,
Is there a reason why the linux devkit is in a shell script form?

We are thinking about distributing the devkit as part of our windows based =
installer.  It helps customers to download and use the release from a windo=
ws machine.
Appreciate any feedback on this.

With regards,
Sam

--_000_B0581B5571079145BA1CD78C126DBDE72E8375F0DLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style>
<!--
@font-face
	{font-family:Calibri}
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif"}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline}
span.EmailStyle17
	{font-family:"Calibri","sans-serif";
	color:windowtext}
.MsoChpDefault
	{font-family:"Calibri","sans-serif"}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.WordSection1
	{}
-->
</style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Because the devkit needs to be installed/relocated to the =
final destination. After that it cannot be moved. Take a look at how it's d=
one in AMSDK to call the devkit installer
 from InstallJammer. But you can't do it from Windows.<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Nelson, Sam [sam.nelson@ti.com]<br>
<b>Received:</b> Wednesday, 17 Jul 2013, 12:09<br>
<b>To:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>Subject:</b> [meta-arago] Help needed: devkit in tar file form<br>
<br>
</span></span>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello all,</p>
<p class=3D"MsoNormal">Is there a reason why the linux devkit is in a shell=
 script form?</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">We are thinking about distributing the devkit as par=
t of our windows based installer.&nbsp; It helps customers to download and =
use the release from a windows machine. &nbsp;&nbsp;</p>
<p class=3D"MsoNormal">Appreciate any feedback on this.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">With regards,</p>
<p class=3D"MsoNormal">Sam</p>
</div>
</div>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E8375F0DLEE08entticom_--
