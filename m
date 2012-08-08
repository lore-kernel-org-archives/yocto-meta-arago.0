Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8A8A852A5A
	for <meta-arago@arago-project.org>;
	Wed,  8 Aug 2012 16:02:53 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q78G2mXq012077
	for <meta-arago@arago-project.org>; Wed, 8 Aug 2012 11:02:48 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q78G2mjA006231
	for <meta-arago@arago-project.org>; Wed, 8 Aug 2012 11:02:48 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 8 Aug 2012 11:02:48 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Issues building Tremor with the Linaro toolchain
Thread-Index: Ac11fz/YVHkMSXv/R1SuOnwtvzWb9w==
Date: Wed, 8 Aug 2012 16:02:47 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C285793@DFLE30.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Issues building Tremor with the Linaro toolchain
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
X-List-Received-Date: Wed, 08 Aug 2012 16:03:02 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C285793DFLE30entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C285793DFLE30entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In our current setup using the configuration settings from arago-linaro-den=
zil-config.txt  I get the following compiler error message "Error: thumb co=
nditional instruction should be in IT block"  when building the tremor reci=
pe. A solution was adding this line to the tremor recipe or into a bbappend=
 for the recipe:
EXTRA_OEMAKE +=3D "-mimplicity-ti=3Dthumb"
The error goes away and building the recipe is successful.

Building this same recipe without using meta-arago, using the denzil branch=
es for both oe-core and meta-openembedded and using the default toolchain  =
from oe-core allowed me to build that same tremor recipe without any issues=
 and without any changes.

This seems to be a fairly common issue and looks like a combination of asse=
mbly issues in various programs that are failing with the above compiler me=
ssage and the default settings used by the toolchain.
Discussions about this issue:
http://patchwork.ozlabs.org/patch/59089/
http://lists.fedoraproject.org/pipermail/arm/2011-September/001992.html

Which approach should we take to fix this issue? Since this error isn't occ=
urring when using the oe toolchain then I am assuming their approach has be=
en to patch the toolchain to enable -mimplicity-ti=3Dthumb as the default.


Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C285793DFLE30entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
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
-->
</style><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">In our current setup using the configuration setting=
s from arago-linaro-denzil-config.txt &nbsp;I get the following compiler er=
ror message &#8220;Error: thumb conditional instruction should be in IT blo=
ck&#8221; &nbsp;when building the tremor recipe. A solution
 was adding this line to the tremor recipe or into a bbappend for the recip=
e:<o:p></o:p></p>
<p class=3D"MsoNormal">EXTRA_OEMAKE &#43;=3D &#8220;-mimplicity-ti=3Dthumb&=
#8221;<o:p></o:p></p>
<p class=3D"MsoNormal">The error goes away and building the recipe is succe=
ssful. <o:p>
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Building this same recipe without using meta-arago, =
using the denzil branches for both oe-core and meta-openembedded and using =
the default toolchain &nbsp;from oe-core allowed me to build that same trem=
or recipe without any issues and without
 any changes.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This seems to be a fairly common issue and looks lik=
e a combination of assembly issues in various programs that are failing wit=
h the above compiler message and the default settings used by the toolchain=
.
<o:p></o:p></p>
<p class=3D"MsoNormal">Discussions about this issue:<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://patchwork.ozlabs.org/patch/59089/"=
>http://patchwork.ozlabs.org/patch/59089/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://lists.fedoraproject.org/pipermail/=
arm/2011-September/001992.html">http://lists.fedoraproject.org/pipermail/ar=
m/2011-September/001992.html</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Which approach should we take to fix this issue? Sin=
ce this error isn&#8217;t occurring when using the oe toolchain then I am a=
ssuming their approach has been to patch the toolchain to enable &#8211;mim=
plicity-ti=3Dthumb as the default.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Franklin Cooper Jr.<o:p></o:p></p>
<p class=3D"MsoNormal">Texas Instruments<o:p></o:p></p>
<p class=3D"MsoNormal">Application Engineer<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"mailto:fcooper@ti.com">fcooper@ti.com</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C285793DFLE30entticom_--
