Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CB3D0529CB
	for <meta-arago@arago-project.org>;
	Mon, 13 Apr 2015 11:07:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3DB7ExV015524
	for <meta-arago@arago-project.org>; Mon, 13 Apr 2015 06:07:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3DB7Cf7029417
	for <meta-arago@arago-project.org>; Mon, 13 Apr 2015 06:07:12 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Mon, 13 Apr 2015 06:07:12 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: bitbake: Latest 1.24 commit
Thread-Index: AdB12Uo5P9VKiQx8TDCM/KUdDTI4zw==
Date: Mon, 13 Apr 2015 11:07:12 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581411EAC3@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: bitbake: Latest 1.24 commit
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
X-List-Received-Date: Mon, 13 Apr 2015 11:07:15 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4B26FB5A64EBA14C87266869E037F9581411EAC3DFLE09entticom_"

--_000_4B26FB5A64EBA14C87266869E037F9581411EAC3DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It looks like the latest bitbake commit (http://git.openembedded.org/bitbak=
e/commit/?h=3D1.24&id=3D34226a9e02f319a7547967bbdaca3ca918927dd1) on the 1.=
24 branch is breaking at least one recipe (oe-core/meta/recipes-kernel/powe=
rtop/powertop_2.5.bb).

With this latest bitbake, the do_configure stage will fail with the followi=
ng error:

configure:4168: checking whether the C compiler works
configure:4190: arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-int=
erwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 --sysroot=3D/home=
/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolcha=
in/sysroots/am437x-evm  -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/inc=
lude  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types  -isyst=
em/opt/linaro-2013.03/arm-linux-gnueabihf/include  -fstack-protector  -L/op=
t/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2013.0=
3/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu ${EXTRA_LDFLAGS} c=
onftest.c  >&5
arm-linux-gnueabihf-gcc: error: ${EXTRA_LDFLAGS}: No such file or directory
configure:4194: $? =3D 1
configure:4232: result: no


Any help on a solution to this this would be appreciated.

Thanks,
Jake

--_000_4B26FB5A64EBA14C87266869E037F9581411EAC3DFLE09entticom_
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
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
<p class=3D"MsoNormal">It looks like the latest bitbake commit (<a href=3D"=
http://git.openembedded.org/bitbake/commit/?h=3D1.24&amp;id=3D34226a9e02f31=
9a7547967bbdaca3ca918927dd1">http://git.openembedded.org/bitbake/commit/?h=
=3D1.24&amp;id=3D34226a9e02f319a7547967bbdaca3ca918927dd1</a>)
 on the 1.24 branch is breaking at least one recipe (oe-core/meta/recipes-k=
ernel/powertop/powertop_2.5.bb).
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">With this latest bitbake, the do_configure stage wil=
l fail with the following error:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">configure:4168: checking whether the C compiler works<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">configure:4190: arm-linux-gnueabihf-gcc&nbsp; -march=3Darm=
v7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcorte=
x-a9 --sysroot=3D/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-e=
xternal-linaro-toolchain/sysroots/am437x-evm&nbsp;
 -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include&nbsp; -fstack-prot=
ector -O2 -pipe -g -feliminate-unused-debug-types&nbsp; -isystem/opt/linaro=
-2013.03/arm-linux-gnueabihf/include&nbsp; -fstack-protector&nbsp; -L/opt/l=
inaro-2013.03/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2013.03/a=
rm-linux-gnueabihf/lib
 -Wl,-O1 -Wl,--hash-style=3Dgnu ${EXTRA_LDFLAGS} conftest.c&nbsp; &gt;&amp;=
5<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">arm-linux-gnueabihf-gcc: error: ${EXTRA_LDFLAGS}: No such =
file or directory<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">configure:4194: $? =3D 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">configure:4232: result: no<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any help on a solution to this this would be appreci=
ated.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Jake<o:p></o:p></p>
</div>
</body>
</html>

--_000_4B26FB5A64EBA14C87266869E037F9581411EAC3DFLE09entticom_--
