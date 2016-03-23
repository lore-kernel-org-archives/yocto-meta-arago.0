Return-Path: <thomas.kaufmann@duagon.com>
Received: from antispamrelay01.bull-services.ch
	(antispamrelay01.bull-services.ch [62.12.170.131])
	by arago-project.org (Postfix) with ESMTPS id 846C852A85
	for <meta-arago@arago-project.org>;
	Wed, 23 Mar 2016 12:12:30 +0000 (UTC)
Received: from 220.158.14.46.static.wline.lns.sme.cust.swisscom.ch
	([46.14.158.220]) by mx-gate01-zrh.antispameurope.com; 
	Wed, 23 Mar 2016 13:12:23 +0100
Received: from chdua14.duagon.ads (192.168.0.83) by chdua14.duagon.ads
	(192.168.0.83) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Wed, 23 Mar 2016 13:12:08 +0100
Received: from chdua14.duagon.ads ([fe80::11cc:5f18:bf89:c528]) by
	chdua14.duagon.ads ([fe80::11cc:5f18:bf89:c528%12]) with mapi id
	15.00.1104.000; Wed, 23 Mar 2016 13:12:08 +0100
From: Thomas Kaufmann <Thomas.Kaufmann@duagon.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: sdk created with arago fido contains hardcoded paths to build
	system in setup script
Thread-Index: AdGE/L2mSD49ZUE5RwaYG0D7c2UiiQ==
Date: Wed, 23 Mar 2016 12:12:08 +0000
Message-ID: <87f35714305b4138b6523b1f5d7f04f4@chdua14.duagon.ads>
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
	mx-gate01-zrh with BFFDD395C079
X-cloud-security-connect: 220.158.14.46.static.wline.lns.sme.cust.swisscom.ch[46.14.158.220],
	TLS=1, IP=46.14.158.220
X-cloud-security: scantime:2.825
Subject: sdk created with arago fido contains hardcoded paths to build system in setup script
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
X-List-Received-Date: Wed, 23 Mar 2016 12:12:31 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_87f35714305b4138b6523b1f5d7f04f4chdua14duagonads_"

--_000_87f35714305b4138b6523b1f5d7f04f4chdua14duagonads_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi I tried to get an answer to this from the TI e2e community, but so far w=
ithout luck:

https://e2e.ti.com/support/embedded/linux/f/354/p/500188/1811754#1811754

My issue is this:

When I create a SDK for my target platform using arago with the populate_sd=
k command in bitbake. I receive a self extracting shell script, which unpac=
ks all the rootfs, compilers, libraries and everything. Basically the SDK i=
s working and I am able to develop for my target with it.

One thing bothers me:

in the environment-setup-cortexa8hf-vfp-non-linux-gnueabi file which needs =
to be sourced before using the SDK, there are some hardcoded paths which po=
int to the linaro toolchain as it is installed on the original system, wher=
e I actually build the SDK,

e.g.: export CFLAGS=3D" -isystem/home/tkaufmann/gcc-linaro-4.9-2015.05-x86_=
64_arm-linux-gnueabihf/arm-linux-gnueabihf/include  -fstack-protector -O2 -=
pipe -g -feliminate-unused-debug-types"

similar things are in CFLAGS, CXXFLAGS, LDFLAGS and CPPFLAGS

The plan was to use the compiler and sysroot as it is available in the SDK.=
 This is working so far for sinple projects without separately installing t=
he linaro toolchain. Why are these linaro based paths in the environment-se=
tup script and how do I get rid of this to not confuse the users of the SDK=
?

I appreciate your feedback

Regards Thomas

--_000_87f35714305b4138b6523b1f5d7f04f4chdua14duagonads_
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
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi I tried to get an answer to =
this from the TI e2e community, but so far without luck:<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://e2e.ti.com/s=
upport/embedded/linux/f/354/p/500188/1811754#1811754">https://e2e.ti.com/su=
pport/embedded/linux/f/354/p/500188/1811754#1811754</a><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">My issue is this:<o:p></o:p></s=
pan></p>
<p><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif;mso-fareast-language:EN-US">When I create a SDK for my ta=
rget platform using arago with the populate_sdk command in bitbake. I recei=
ve a self extracting shell script, which unpacks
 all the rootfs, compilers, libraries and everything. Basically the SDK is =
working and I am able to develop for my target with it.<o:p></o:p></span></=
p>
<p><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif;mso-fareast-language:EN-US">One thing bothers me:<o:p></o=
:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif;mso-fareast-language:EN-US">in the environment-setup-cort=
exa8hf-vfp-non-linux-gnueabi file which needs to be sourced before using th=
e SDK, there are some hardcoded paths which point
 to the linaro toolchain as it is installed on the original system, where I=
 actually build the SDK,<o:p></o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif;mso-fareast-language:EN-US">e.g.: export CFLAGS=3D&quot; =
-isystem<b>/home/tkaufmann/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabih=
f/arm-linux-gnueabihf/include</b>&nbsp; -fstack-protector
 -O2 -pipe -g -feliminate-unused-debug-types&quot;<o:p></o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif;mso-fareast-language:EN-US">similar things are in CFLAGS,=
 CXXFLAGS, LDFLAGS and CPPFLAGS<o:p></o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif;mso-fareast-language:EN-US">The plan was to use the compi=
ler and sysroot as it is available in the SDK. This is working so far for s=
inple projects without separately installing the
 linaro toolchain. Why are these linaro based paths in the environment-setu=
p script and how do I get rid of this to not confuse the users of the SDK?<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I appreciate your feedback<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards Thomas<o:p></o:p></span=
></p>
</div>
</body>
</html>

--_000_87f35714305b4138b6523b1f5d7f04f4chdua14duagonads_--
