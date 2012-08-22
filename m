Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1CC54529FF
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 02:17:31 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7M2HUnv011579
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2012 21:17:30 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7M2HUc2029030
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2012 21:17:30 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 21 Aug 2012 21:17:29 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: qt4-embedded build issue
Thread-Index: Ac2ADEg+W+tvtyGUTzGun262X7eyzA==
Date: Wed, 22 Aug 2012 02:17:29 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2A7E8F@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: qt4-embedded build issue
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
X-List-Received-Date: Wed, 22 Aug 2012 02:17:31 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C2A7E8FDFLE09entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C2A7E8FDFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Bitbaking qt4-embedded seems to build correctly but resulted in many librar=
ies not being built and a lot of broken sym links.  Looking into the do_com=
pile.log I realized that for libQtGuiE I received this error:

/home/franklin/toolchain/gcc-linaro-arm-linux-gnueabi-2012.03-20120326_linu=
x/bin/../lib/gcc/arm-linux-gnueabi/4.6.3/../../../../arm-linux-gnueabi/bin/=
ld: .obj/release-shared-emb-arm/qgrayraster.o: relocation R_ARM_THM_MOVW_AB=
S_NC against `a local symbol' can not be used when making a shared object; =
recompile with -fPIC
.obj/release-shared-emb-arm/qgrayraster.o: could not read symbols: Bad valu=
e
collect2: ld returned 1 exit status
make[1]: [../../lib/libQtGuiE.so.4.8.0] Error 1 (ignored)

QtGuiE is needed by several other libraries which is why a lot of the other=
 libraries were not being built. Based on the suggestion of the error and p=
osts such as this http://industriousone.com/topic/issue-placement-fpic-linu=
x I tried to add -fPIC to either CFLAGS or CXXFLAGS. But then I receive an =
error saying PIC was an invalid option. It seems that fPIC was an option fo=
r older versions of gcc but the external linaro toolchain being used doesn'=
t contain this option. Any suggestions on how to fix this?

FYI building qt4embedded using the built in toolchain doesn't experience th=
is issue.


Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C2A7E8FDFLE09entticom_
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
<p class=3D"MsoNormal">Bitbaking qt4-embedded seems to build correctly but =
resulted in many libraries not being built and a lot of broken sym links. &=
nbsp;Looking into the do_compile.log I realized that for libQtGuiE I receiv=
ed this error:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">/home/franklin/toolchain/gcc-linaro-arm-linux-gnueab=
i-2012.03-20120326_linux/bin/../lib/gcc/arm-linux-gnueabi/4.6.3/../../../..=
/arm-linux-gnueabi/bin/ld: .obj/release-shared-emb-arm/qgrayraster.o: reloc=
ation R_ARM_THM_MOVW_ABS_NC against
 `a local symbol' can not be used when making a shared object; recompile wi=
th -fPIC<o:p></o:p></p>
<p class=3D"MsoNormal">.obj/release-shared-emb-arm/qgrayraster.o: could not=
 read symbols: Bad value<o:p></o:p></p>
<p class=3D"MsoNormal">collect2: ld returned 1 exit status<o:p></o:p></p>
<p class=3D"MsoNormal">make[1]: [../../lib/libQtGuiE.so.4.8.0] Error 1 (ign=
ored)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">QtGuiE is needed by several other libraries which is=
 why a lot of the other libraries were not being built. Based on the sugges=
tion of the error and posts such as this
<a href=3D"http://industriousone.com/topic/issue-placement-fpic-linux">http=
://industriousone.com/topic/issue-placement-fpic-linux</a> I tried to add &=
#8211;fPIC to either CFLAGS or CXXFLAGS. But then I receive an error saying=
 PIC was an invalid option. It seems that
 fPIC was an option for older versions of gcc but the external linaro toolc=
hain being used doesn&#8217;t contain this option. Any suggestions on how t=
o fix this?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">FYI building qt4embedded using the built in toolchai=
n doesn&#8217;t experience this issue.<o:p></o:p></p>
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

--_000_8F29D6B095ED194EA1980491A5E029710C2A7E8FDFLE09entticom_--
