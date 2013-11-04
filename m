Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by arago-project.org (Postfix) with ESMTPS id 048F5529CE
	for <meta-arago@arago-project.org>;
	Mon,  4 Nov 2013 16:11:43 +0000 (UTC)
Received: from usnygrcas2.raymondcorp.local (nothing.attdns.com
	[130.1.155.195] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id rA4GBgP0008122
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 4 Nov 2013 10:11:42 -0600
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.106]) by usnygrcas2
	([130.1.155.199]) with mapi id 14.03.0158.001;
	Mon, 4 Nov 2013 11:11:42 -0500
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: wpa-supplicant failure
Thread-Index: Ac7ZeIHx2OirDY54TVWg/k9zV6EWzw==
Date: Mon, 4 Nov 2013 16:11:41 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622BA0132E@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [130.1.155.15]
MIME-Version: 1.0
X-MessageScreenMessageID: 1383581502.825263.1642.1056964615
X-MessageScreenContentScore: Score of 0 assigned to Content
X-MessageScreenUCEScore: Score of 0 assigned to UCE
X-MessageScreen: Analyzed by IntelliReach MessageScreen(tm)
Subject: wpa-supplicant failure
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
X-List-Received-Date: Mon, 04 Nov 2013 16:11:44 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA0132EUSNYGRMBX4raymo_"

--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA0132EUSNYGRMBX4raymo_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am using the instructions from http://arago-project.org/wiki/index.php/=
Setting_Up_Build_Environment
And using the branding-amsdk.inc with some items added from the arago-pre=
fs.inc to include qt5 and the wifi items.

Build Configuration:
BB_VERSION        =3D "1.18.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-12.04"
TARGET_SYS        =3D "arm-oe-linux-gnueabi"
MACHINE           =3D "am335x-evm"
DISTRO            =3D "arago"
DISTRO_VERSION    =3D "2013.10"
TUNE_FEATURES     =3D "armv7a vfp thumb neon callconvention-hard cortexa8=
"
TARGET_FPU        =3D "vfp-neon"
meta-arago-distro
meta-arago-extras =3D "master:370c6ed8e738eb3066160f133897a14eb3af1955"
meta-qt5          =3D "master:a6753fa646f714bd0a794d270bd77e951d8204ac"
toolchain-layer
meta-networking
meta-ruby
meta-oe           =3D "dylan:a108b2203a997634f87ac687e81712badaf3c546"
meta-ti           =3D "dylan:7e054d1277cfe3b8d59725930cd42177cef1d9f0"
meta-linaro-toolchain =3D "dylan:c9f78d6eff14ada3f2bc960e81883b27a10afecc=
"
meta              =3D "dylan:3549f5f203363302256848bb33c05c4fd4871948"


Log data follows:
| DEBUG: Executing shell function do_compile
| ../src/drivers/driver_nl80211.c:19:31: fatal error: netlink/genl/genl.h=
: No such file or directory
| compilation terminated.
| make: *** [../src/drivers/driver_nl80211.o] Error 1
| ERROR: Function failed: do_compile (see /home/joshua/tisdk/build/arago-=
tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-3.2-oe-linux-gnuea=
bi/wpa-supplicant/r5.sp4.01-r6b+gitrAUTOINC+7190ff7dbd43243290b626068ded0=
d61c5019050-arago0/temp/log.do_compile.33324 for further information)
ERROR: Task 1257 (/home/joshua/tisdk/sources/meta-arago/meta-arago-extras=
/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb, do_comp=
ile) failed with exit code '1'

Josh Vanderpool
Electrical Engineer
Control Systems
________________________________
The Raymond Corporation
20 South Canal Street
Greene, New York 13778-0130
Phone: 607-656-2617
Fax: 607-656-4845
joshua.vanderpool@raymondcorp.com<mailto:joshua.vanderpool@raymondcorp.co=
m>
http://www.raymondcorp.com<http://www.raymondcorp.com/>



Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.



--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA0132EUSNYGRMBX4raymo_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-mi=
crosoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:wo=
rd" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D=
"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-asci=
i">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">=

<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
=2Eshape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
=2EMsoChpDefault
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
<p class=3D"MsoNormal">I am using the instructions from <a href=3D"http:/=
/arago-project.org/wiki/index.php/Setting_Up_Build_Environment">
http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment</a><=
o:p></o:p></p>
<p class=3D"MsoNormal">And using the branding-amsdk.inc with some items a=
dded from the arago-prefs.inc to include qt5 and the wifi items.<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Build Configuration:<o:p></o:p></p>
<p class=3D"MsoNormal">BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; =3D &quot;1.18.0&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; =3D &quot;x86_64-linux&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">NATIVELSBSTRING&nbsp;&nbsp; =3D &quot;Ubuntu-12.04=
&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; =3D &quot;arm-oe-linux-gnueabi&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; =3D &quot;am335x-evm&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; =3D &quot;arago&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D &quot;2013.10=
&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;ar=
mv7a vfp thumb neon callconvention-hard cortexa8&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; =3D &quot;vfp-neon&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">meta-arago-distro <o:p></o:p></p>
<p class=3D"MsoNormal">meta-arago-extras =3D &quot;master:370c6ed8e738eb3=
066160f133897a14eb3af1955&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">meta-qt5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; =3D &quot;master:a6753fa646f714bd0a794d270bd77e951d8204ac&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoNormal">toolchain-layer&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">meta-networking&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">meta-ruby&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; =3D &quot;dylan:a108b2203a997634f87ac687e81712badaf3c54=
6&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; =3D &quot;dylan:7e054d1277cfe3b8d59725930cd42177cef1d9f=
0&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">meta-linaro-toolchain =3D &quot;dylan:c9f78d6eff14=
ada3f2bc960e81883b27a10afecc&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;dylan:3549f5f203363302256848bb=
33c05c4fd4871948&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Log data follows:<o:p></o:p></p>
<p class=3D"MsoNormal">| DEBUG: Executing shell function do_compile<o:p><=
/o:p></p>
<p class=3D"MsoNormal">| ../src/drivers/driver_nl80211.c:19:31: fatal err=
or: netlink/genl/genl.h: No such file or directory<o:p></o:p></p>
<p class=3D"MsoNormal">| compilation terminated.<o:p></o:p></p>
<p class=3D"MsoNormal">| make: *** [../src/drivers/driver_nl80211.o] Erro=
r 1<o:p></o:p></p>
<p class=3D"MsoNormal">| ERROR: Function failed: do_compile (see /home/jo=
shua/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-=
neon-3.2-oe-linux-gnueabi/wpa-supplicant/r5.sp4.01-r6b&#43;gitrAUTOINC&#4=
3;7190ff7dbd43243290b626068ded0d61c5019050-arago0/temp/log.do_compile.333=
24
 for further information)<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Task 1257 (/home/joshua/tisdk/sources/meta-=
arago/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t_r5.sp4.01.bb, do_compile) failed with exit code '1'<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&qu=
ot;Arial&quot;,&quot;sans-serif&quot;;color:navy">Josh Vanderpool<br>
</span></b><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,=
&quot;sans-serif&quot;;color:gray">Electrical Engineer</span><b><span sty=
le=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quo=
t;;color:navy"><o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;=
Arial&quot;,&quot;sans-serif&quot;;color:gray">Control Systems</span><spa=
n style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-seri=
f&quot;;color:#999999"><o:p></o:p></span></p>
<div>
<div class=3D"MsoNormal"><span style=3D"color:navy">
<hr size=3D"2" width=3D"300" style=3D"width:225.0pt" noshade=3D"" style=3D=
"color:red" align=3D"left">
</span></div>
</div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&qu=
ot;Arial&quot;,&quot;sans-serif&quot;;color:black">The Raymond Corporatio=
n</span></b><span style=3D"color:navy"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quo=
t;sans-serif&quot;;color:#999999">20 South Canal Street</span><br>
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-=
serif&quot;;color:#999999">Greene, New York 13778-0130</span><br>
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-=
serif&quot;;color:#999999">Phone: 607-656-2617</span><span style=3D"color=
:navy"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:10.0pt;font-f=
amily:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#999999">Fax: 607-65=
6-4845</span><span lang=3D"FR" style=3D"color:navy"><br>
</span><span lang=3D"FR" style=3D"font-size:10.0pt;font-family:&quot;Aria=
l&quot;,&quot;sans-serif&quot;;color:navy"><a href=3D"mailto:joshua.vande=
rpool@raymondcorp.com"><span style=3D"color:blue">joshua.vanderpool@raymo=
ndcorp.com</span></a></span><span lang=3D"FR" style=3D"color:navy"><br>
</span><span style=3D"color:navy"><a href=3D"http://www.raymondcorp.com/"=
><span lang=3D"FR" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:blue">http://www.raymondcorp.com</span></a=
>
</span><span lang=3D"FR"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p>
Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.

<p>

</body>
</html>

--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA0132EUSNYGRMBX4raymo_--
