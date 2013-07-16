Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C878152A07
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2013 12:54:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6GCse78010511
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2013 07:54:40 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6GCsell000478
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2013 07:54:40 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 16 Jul 2013 07:54:40 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Saran, Sajesh Kumar" <sajesh@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: Question when building devkit
Thread-Index: Ac6BaabZMJgtq1BeQiKGms3yooMXxgAAVl9AAApU1GAAI76dcA==
Date: Tue, 16 Jul 2013 12:54:39 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015965764F@DLEE11.ent.ti.com>
References: <5DE143D81A65C045A4FF105C9132505F0421839C@DFLE11.ent.ti.com>
	<8EAE6244CE843044A42356038645C8551573575F@DFLE12.ent.ti.com>
In-Reply-To: <8EAE6244CE843044A42356038645C8551573575F@DFLE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Kuttiyam, Prabhu" <pkuttiyam@ti.com>
Subject: Re: Question when building devkit
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
X-List-Received-Date: Tue, 16 Jul 2013 12:54:42 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED1015965764FDLEE11entticom_"

--_000_7D46E86EC0A8354091174257B2FED1015965764FDLEE11entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

The error log says:

* satisfy_dependencies_for: Cannot satisfy the following dependencies for p=
ackagegroup-arago-sc-mcsdk-toolchain-target:
*            ti-trace-framework-staticdev *
 * opkg_install_cmd: Cannot install package packagegroup-arago-sc-mcsdk-too=
lchain-target.

So it looks like the ti-trace-framework-staticdev package is not there.  Ho=
wever, since neither the packagegroup-arago-sc-mcsdk-toolchain-target or ti=
-trace-framework-staticdev recipes seem to be in the mainline git repositor=
ies I can=92t tell you much else.  This could be an mis-used COMPATIBLE_MAC=
HINE setting or something else.


Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/

From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Saran, Sajesh Kumar
Sent: Monday, July 15, 2013 2:50 PM
To: meta-arago@arago-project.org
Cc: Kuttiyam, Prabhu
Subject: [meta-arago] FW: Question when building devkit



From: Kuttiyam, Prabhu
Sent: Monday, July 15, 2013 10:43 AM
To: 'meta-arago@arago-project.org'
Subject: Question when building devkit

Hi:
I have hopefully a quick question while building a devkit for our SDK.

This is what I do:

MACHINE=3Dtci6614-evm TOOLCHAIN_BRAND=3Dlinaro bitbake meta-toolchain-arago=
-sc-mcsdk

And I get this error:

=3D=3D=3D=3D=3D
Parsing of 1538 .bb files complete (1528 cached, 10 parsed). 1902 targets, =
199 skipped, 7 masked, 0 errors.

Build Configuration:
BB_VERSION        =3D "1.17.0"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "tci6614-evm"
DISTRO            =3D "arago"
DISTRO_VERSION    =3D "2013.04"
TUNE_FEATURES     =3D "armv7a vfp neon thumb callconvention-hard cortexa8"
TARGET_FPU        =3D "vfp-neon"
meta-arago-distro
meta-arago-extras =3D "tci6614-evm:d68c33a710b445fdd062c4b6e6cd40b43aee37b7=
"
toolchain-layer
meta-oe           =3D "(nobranch):f00028caf257e386c0f3ae46bd4b3ba53dd0729d"
meta-ti           =3D "tci6614-evm:c764bfc1cc04b376a52cf4fbbce6021f9b990aaa=
"
meta-linaro       =3D "(nobranch):d0558fa4304592622423582f8b464e1c22cfe6f1"
meta              =3D "(nobranch):0785489d558c34cacf5cb349949a15e27084efbf"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: populate_sdk_image (see /home/a0271283/yocto/oe-lay=
ersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-n=
eon-oe-linux-gnueabi/meta-toolchain-arago-sc-mcsdk-1.0-r1/temp/log.do_popul=
ate_sdk.15900 for further information)

I have attached the log file with this email.

Thanks for your reply.
Also let me know if you need more information on my setup/scripts.

Thanks
Prabhu


--_000_7D46E86EC0A8354091174257B2FED1015965764FDLEE11entticom_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle22
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">The error log says:<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">* satisfy_dependencies=
_for: Cannot satisfy the following dependencies for packagegroup-arago-sc-m=
csdk-toolchain-target:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">* &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-trace-framework-staticdev *
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;* opkg_install_c=
md: Cannot install package packagegroup-arago-sc-mcsdk-toolchain-target.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">So it looks like the t=
i-trace-framework-staticdev package is not there.&nbsp; However, since neit=
her the packagegroup-arago-sc-mcsdk-toolchain-target or ti-trace-framework-=
staticdev recipes seem to be in the mainline
 git repositories I can=92t tell you much else.&nbsp; This could be an mis-=
used COMPATIBLE_MACHINE setting or something else.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#1F497D">Since=
rely,<br>
Chase Maupin<br>
Integration Team Manager<br>
Linux Core Product Development<br>
e-mail: chase.maupin@ti.com<br>
phone: (214) 567-2950<br>
<br>
For support:<br>
Forums - <a href=3D"http://community.ti.com/forums/">http://community.ti.co=
m/forums/</a><br>
Wiki - <a href=3D"http://wiki.davincidsp.com/">http://wiki.davincidsp.com/<=
/a></span><span style=3D"color:#1F497D">
<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
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
<b>Sent:</b> Monday, July 15, 2013 2:50 PM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Cc:</b> Kuttiyam, Prabhu<br>
<b>Subject:</b> [meta-arago] FW: Question when building devkit<o:p></o:p></=
span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Kuttiyam=
, Prabhu
<br>
<b>Sent:</b> Monday, July 15, 2013 10:43 AM<br>
<b>To:</b> 'meta-arago@arago-project.org'<br>
<b>Subject:</b> Question when building devkit<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi:<br>
I have hopefully a quick question while building a devkit for our SDK.<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is what I do:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">MACHINE=3Dtci6614-evm TOOLCHAIN_BRAND=3Dlinaro bitba=
ke meta-toolchain-arago-sc-mcsdk<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">And I get this error:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">=3D=3D=3D=3D=3D<o:p></=
o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">Parsing of 1538 .bb fi=
les complete (1528 cached, 10 parsed). 1902 targets, 199 skipped, 7 masked,=
 0 errors.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">Build Configuration:<o=
:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">BB_VERSION&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;1.17.0&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">TARGET_ARCH&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;arm&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">TARGET_OS&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;linux-gnueabi&quot;<o:p></o:p=
></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">MACHINE&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;tci6614-evm&quot;<o=
:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">DISTRO&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;arago&quot;<o:=
p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">DISTRO_VERSION&nbsp;&n=
bsp;&nbsp; =3D &quot;2013.04&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">TUNE_FEATURES&nbsp;&nb=
sp;&nbsp;&nbsp; =3D &quot;armv7a vfp neon thumb callconvention-hard cortexa=
8&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">TARGET_FPU&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;vfp-neon&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">meta-arago-distro<o:p>=
</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">meta-arago-extras =3D =
&quot;tci6614-evm:d68c33a710b445fdd062c4b6e6cd40b43aee37b7&quot;<o:p></o:p>=
</p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">toolchain-layer<o:p></=
o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">meta-oe&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D &quot;(nobranch):f00028ca=
f257e386c0f3ae46bd4b3ba53dd0729d&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">meta-ti&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;tci6614-evm:c764bfc=
1cc04b376a52cf4fbbce6021f9b990aaa&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">meta-linaro&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;(nobranch):d0558fa4304592622423582f8b46=
4e1c22cfe6f1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">meta&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;(nob=
ranch):0785489d558c34cacf5cb349949a15e27084efbf&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">NOTE: Resolving any mi=
ssing task queue dependencies<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">NOTE: Preparing runque=
ue<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">NOTE: Executing SetSce=
ne Tasks<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">NOTE: Executing RunQue=
ue Tasks<o:p></o:p></p>
<div style=3D"border:none;border-bottom:double windowtext 2.25pt;padding:0i=
n 0in 1.0pt 0in">
<p class=3D"MsoNormal">ERROR: Function failed: populate_sdk_image (see /hom=
e/a0271283/yocto/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolch=
ain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/meta-toolchain-arago-sc-mcsdk-1=
.0-r1/temp/log.do_populate_sdk.15900
 for further information)<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have attached the log file with this email.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for your reply.<o:p></o:p></p>
<p class=3D"MsoNormal">Also let me know if you need more information on my =
setup/scripts.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Prabhu<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED1015965764FDLEE11entticom_--
