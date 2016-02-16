Return-Path: <thomas.kaufmann@duagon.com>
Received: from antispamrelay01.bull-services.ch
	(antispamrelay01.bull-services.ch [62.12.170.131])
	by arago-project.org (Postfix) with ESMTPS id 8E6A152A60
	for <meta-arago@arago-project.org>;
	Tue, 16 Feb 2016 08:45:16 +0000 (UTC)
Received: from 220.158.14.46.static.wline.lns.sme.cust.swisscom.ch
	([46.14.158.220]) by mx-gate01-zrh.antispameurope.com; 
	Tue, 16 Feb 2016 09:45:14 +0100
Received: from chdua14.duagon.ads (192.168.0.83) by chdua14.duagon.ads
	(192.168.0.83) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Tue, 16 Feb 2016 09:45:08 +0100
Received: from chdua14.duagon.ads ([fe80::11cc:5f18:bf89:c528]) by
	chdua14.duagon.ads ([fe80::11cc:5f18:bf89:c528%12]) with mapi id
	15.00.1104.000; Tue, 16 Feb 2016 09:45:08 +0100
From: Thomas Kaufmann <Thomas.Kaufmann@duagon.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: How to deploy an SDK package using arago
Thread-Index: AdFolWNdmp9C/4Z2QJiPM7w//NozhQ==
Date: Tue, 16 Feb 2016 08:45:07 +0000
Message-ID: <54bfc5c11ec349ca93289f2f22643cb0@chdua14.duagon.ads>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.0.189]
MIME-Version: 1.0
X-cloud-security-sender: thomas.kaufmann@duagon.com
X-cloud-security-recipient: meta-arago@arago-project.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
	mx-gate01-zrh with E7A7F395C079
X-cloud-security-connect: 220.158.14.46.static.wline.lns.sme.cust.swisscom.ch[46.14.158.220],
	TLS=1, IP=46.14.158.220
X-cloud-security: scantime:4.816
Subject: How to deploy an SDK package using arago
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
X-List-Received-Date: Tue, 16 Feb 2016 08:45:17 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_54bfc5c11ec349ca93289f2f22643cb0chdua14duagonads_"

--_000_54bfc5c11ec349ca93289f2f22643cb0chdua14duagonads_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

I started creating an won distro based on arago. I setup the environment ac=
cording to the arago wiki.
I plan to add packages for own applications and libraries, the platform is =
based on the am335x-evm.
The system compiles and runs on the target.
Now I want to generate an SDK package. What is the proper way to do this?

When I try this the "yocto" way:

MACHINE=3Dam335x-evm bitbake -c populate_sdk core-image-minimal

It fails with this message in the last task:

Collected errors:
* satisfy_dependencies_for: Cannot satisfy the following dependencies for p=
ackagegroup-core-standalone-sdk-target:
*            libgcov-dev *
 * opkg_install_cmd: Cannot install package packagegroup-core-standalone-sd=
k-target.

I am using the linaro toolchain 2015.05 according to the recipe libgcov-dev=
 is provided by the external-linaro-toolchain recipe.

Or is there another way, that I have to bitbake a recipe such as tisdk-root=
fs-image.bb? And in this case how to use the SDK afterwards?
I have also seen, there is a possibility to brand the SDK, is there some de=
scription for this process?

Regards Thomas

--_000_54bfc5c11ec349ca93289f2f22643cb0chdua14duagonads_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE-CH" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I started creating an won distr=
o based on arago. I setup the environment according to the arago wiki.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I plan to add packages for own =
applications and libraries, the platform is based on the am335x-evm.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The system compiles and runs on=
 the target.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Now I want to generate an SDK p=
ackage. What is the proper way to do this?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">When I try this the &quot;yocto=
&quot; way:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">MACHINE=3Dam335x-evm bitbake -c=
 populate_sdk core-image-minimal<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">It fails with this message in t=
he last task:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Collected errors:<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">* satisfy_dependencies_for: Can=
not satisfy the following dependencies for packagegroup-core-standalone-sdk=
-target:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">* &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libgcov-dev * <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;* opkg_install_cmd: Canno=
t install package packagegroup-core-standalone-sdk-target.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am using the linaro toolchain=
 2015.05 according to the recipe libgcov-dev is provided by the external-li=
naro-toolchain recipe.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Or is there another way, that I=
 have to bitbake a recipe such as tisdk-rootfs-image.bb? And in this case h=
ow to use the SDK afterwards?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have also seen, there is a po=
ssibility to brand the SDK, is there some description for this process?<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards Thomas<o:p></o:p></span=
></p>
</div>
</body>
</html>

--_000_54bfc5c11ec349ca93289f2f22643cb0chdua14duagonads_--
