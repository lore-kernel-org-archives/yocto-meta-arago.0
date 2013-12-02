Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 25F6352972
	for <meta-arago@arago-project.org>;
	Mon,  2 Dec 2013 13:09:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB2D92q3023116
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 07:09:02 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2D91xa005790
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 07:09:02 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 2 Dec 2013 07:09:01 -0600
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Thread-Topic: [meta-arago] Header files missing in the image
Thread-Index: AQHO71+rXRCB8z02C0WRThtiD7mp1w==
Date: Mon, 2 Dec 2013 13:09:01 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E970669@DLEE08.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D546DDE1@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D546DDE1@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: Header files missing in the image
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
X-List-Received-Date: Mon, 02 Dec 2013 13:09:03 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E970669DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E970669DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There should not be any headers on the rootfs by default, as it's not meant=
 for development. That is what devkit is for.


Denys


-----Original Message-----
From: Hingolikar, Mrinmayee [mrinmayee@ti.com]
Received: Sunday, 01 Dec 2013, 4:39
To: meta-arago@arago-project.org [meta-arago@arago-project.org]
Subject: [meta-arago] Header files missing in the image

Hi all,

I have faced a strange issue during one of the builds. The generated GLSDK =
image has an empty /usr/include ie no .h files at all.
Is this due to any misconfiguration from my side?

Appreciate any help on this.

Thanks and Regards,
Mrinmayee


--_000_B0581B5571079145BA1CD78C126DBDE72E970669DLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
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
	{}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.WordSection1
	{}
-->
</style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">There should not be any headers on the rootfs by default, =
as it's not meant for development. That is what devkit is for.<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Hingolikar, Mrinmayee [mrinmayee@ti.com]<br>
<b>Received:</b> Sunday, 01 Dec 2013, 4:39<br>
<b>To:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>Subject:</b> [meta-arago] Header files missing in the image<br>
<br>
</span></span>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">I have faced a strange issue during one of the build=
s. The generated GLSDK image has an empty /usr/include ie no .h files at al=
l.</p>
<p class=3D"MsoNormal">Is this due to any misconfiguration from my side?</p=
>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Appreciate any help on this.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Thanks and Regards,</p>
<p class=3D"MsoNormal">Mrinmayee</p>
<p class=3D"MsoNormal">&nbsp;</p>
</div>
</div>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E970669DLEE08entticom_--
