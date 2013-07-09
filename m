Return-Path: <firat.kasmis@steinbeis-stg.de>
Received: from smtprelay05.ispgateway.de (smtprelay05.ispgateway.de
	[80.67.31.94])
	by arago-project.org (Postfix) with ESMTPS id 3093C52A55
	for <meta-arago@arago-project.org>;
	Tue,  9 Jul 2013 15:00:50 +0000 (UTC)
Received: from [10.128.0.2] (helo=exchange.df.eu)
	by smtprelay05.ispgateway.de with esmtps (TLSv1:RC4-MD5:128)
	(Exim 4.68) (envelope-from <firat.kasmis@steinbeis-stg.de>)
	id 1UwZPM-0006mA-8E; Tue, 09 Jul 2013 17:00:48 +0200
Received: from ECCR11PUBLIC.exchange.local ([10.128.2.94]) by
	efe02.exchange.local ([10.128.0.2]) with mapi;
	Tue, 9 Jul 2013 17:00:48 +0200
From: Firat Kasmis <firat.kasmis@steinbeis-stg.de>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Date: Tue, 9 Jul 2013 17:01:15 +0200
Thread-Topic: [meta-arago] Building am180x-evm
Thread-Index: Ac58tShhreASAwlPSSu3LJoKk3Y2lw==
Message-ID: <766D943268E37941B447D0C68B4D7048115BE2822B@ECCR11PUBLIC.exchange.local>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Re: Building am180x-evm
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
X-List-Received-Date: Tue, 09 Jul 2013 15:00:51 -0000
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_766D943268E37941B447D0C68B4D7048115BE2822BECCR11PUBLICe_"

--_000_766D943268E37941B447D0C68B4D7048115BE2822BECCR11PUBLICe_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks. It works now. Where do I get the information that am180x is not com=
patible with Linaro toolchain?

Changes I made:
1. Install arago-2011.09-armv5te-linux-gnueabi-sdk from http://software-dl.=
ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/index_FDS.html
2. Add it to PATH
3. export TOOLCHAIN_BRAND=3Darago

Von: Dmytriyenko, Denys [mailto:denys@ti.com]
Gesendet: Dienstag, 9. Juli 2013 14:39
An: meta-arago@arago-project.org; Firat Kasmis
Betreff: RE: [meta-arago] Building am180x-evm

am180x cannot be built with Linaro toolchain - it has still to be built wit=
h Arago toolchain.


Denys


-----Original Message-----
From: Firat Kasmis [firat.kasmis@steinbeis-stg.de]
Received: Tuesday, 09 Jul 2013, 4:58
To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org> [meta=
-arago@arago-project.org]
Subject: [meta-arago] Building am180x-evm
Hi,

I just saw that http://arago-project.org/wiki/index.php/Setting_Up_Build_En=
vironment has been changed, so I tried building a file system and kernel fo=
r da850-omapl138-evm board like before following the new instructions.

Unfortunately this board is not available in meta-ti/conf/machine/ anymore.=
 Since am180x-evm is the same, I tried:

> MACHINE=3Dam180x-evm bitbake virtual/kernel
ERROR: No valid toolchain in PATH

Linaro is of course in my path. So after a bit of googling I tried:

> export TOOLCHAIN_BRAND=3Dlinaro
> MACHINE=3Dam180x-evm bitbake virtual/kernel
Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (armv5).Too=
lchain tunings invalid:
Tuning 'cortexa8thf-neon' has no defined features, and cannot be used.

I could solve the first one by doing in tune-arm926ejs.inc:

+TUNE_FEATURES =3D "${TUNE_FEATURES_tune-armv5te} arm926ejs"
-TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} arm926ejs"

+PACKAGE_EXTRA_ARCHS =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
-PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5te=
}"

But the second one with 'cortexa8thf-neon' still exists but I don't know wh=
ere it is exactly been set. toolchain-linaro/gcc.inc is using this as DEFAU=
LTUNE . Shouldn't this be arm926ejs for my machine?

Regards,
Firat


_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_766D943268E37941B447D0C68B4D7048115BE2822BECCR11PUBLICe_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><META HTTP-EQUIV=3D"Content-Type" CONTENT=
=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D"Micros=
oft Word 14 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	border:none;
	padding:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.E-MailFormatvorlage18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DDE link=3Dblue vlink=
=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US=
 style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D=
'>Thanks. It works now. Where do I get the information that am180x is not c=
ompatible with Linaro toolchain?<o:p></o:p></span></p><p class=3DMsoNormal>=
<span lang=3DEN-US style=3D'font-size:11.0pt;font-family:"Calibri","sans-se=
rif";color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";c=
olor:#1F497D'>Changes I made:<o:p></o:p></span></p><p class=3DMsoNormal><sp=
an lang=3DEN-US style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif=
";color:#1F497D'>1. Install arago-2011.09-armv5te-linux-gnueabi-sdk from <a=
 href=3D"http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/=
2011_09/index_FDS.html">http://software-dl.ti.com/sdoemb/sdoemb_public_sw/a=
rago_toolchain/2011_09/index_FDS.html</a><o:p></o:p></span></p><p class=3DM=
soNormal><span lang=3DEN-US style=3D'font-size:11.0pt;font-family:"Calibri"=
,"sans-serif";color:#1F497D'>2. Add it to PATH<o:p></o:p></span></p><p clas=
s=3DMsoNormal><span lang=3DEN-US style=3D'font-size:11.0pt;font-family:"Cal=
ibri","sans-serif";color:#1F497D'>3. export TOOLCHAIN_BRAND=3Darago<o:p></o=
:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:11=
.0pt;font-family:"Calibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></s=
pan></p><div><div style=3D'border:none;border-top:solid #B5C4DF 1.0pt;paddi=
ng:3.0pt 0cm 0cm 0cm'><p class=3DMsoNormal><b><span style=3D'font-size:10.0=
pt;font-family:"Tahoma","sans-serif"'>Von:</span></b><span style=3D'font-si=
ze:10.0pt;font-family:"Tahoma","sans-serif"'> Dmytriyenko, Denys [mailto:de=
nys@ti.com] <br><b>Gesendet:</b> Dienstag, 9. Juli 2013 14:39<br><b>An:</b>=
 meta-arago@arago-project.org; Firat Kasmis<br><b>Betreff:</b> RE: [meta-ar=
ago] Building am180x-evm<o:p></o:p></span></p></div></div><p class=3DMsoNor=
mal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal style=3D'margin-bottom:1=
2.0pt'><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";c=
olor:black'>am180x cannot be built with Linaro toolchain - it has still to =
be built with Arago toolchain.<br><br><br></span><span lang=3DEN-US style=
=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:black'>Denys<=
br><br><br>-----Original Message----- <br><b>From:</b> Firat Kasmis [firat.=
kasmis@steinbeis-stg.de]<br><b>Received:</b> Tuesday, 09 Jul 2013, 4:58<br>=
<b>To:</b> </span><span style=3D'font-size:11.0pt;font-family:"Calibri","sa=
ns-serif";color:black'><a href=3D"mailto:meta-arago@arago-project.org"><spa=
n lang=3DEN-US>meta-arago@arago-project.org</span></a></span><span lang=3DE=
N-US style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:bla=
ck'> [meta-arago@arago-project.org]<br><b>Subject:</b> [meta-arago] Buildin=
g am180x-evm<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span sty=
le=3D'font-size:10.0pt'>Hi,<br><br>I just saw that <a href=3D"http://arago-=
project.org/wiki/index.php/Setting_Up_Build_Environment">http://arago-proje=
ct.org/wiki/index.php/Setting_Up_Build_Environment</a> has been changed, so=
 I tried building a file system and kernel for da850-omapl138-evm board lik=
e before following the new instructions.<br><br>Unfortunately this board is=
 not available in meta-ti/conf/machine/ anymore. Since am180x-evm is the sa=
me, I tried:<br><br>&gt; MACHINE=3Dam180x-evm bitbake virtual/kernel<br>ERR=
OR: No valid toolchain in PATH<br><br>Linaro is of course in my path. So af=
ter a bit of googling I tried:<br><br>&gt; export TOOLCHAIN_BRAND=3Dlinaro<=
br>&gt; MACHINE=3Dam180x-evm bitbake virtual/kernel<br>Error, the PACKAGE_A=
RCHS variable does not contain TUNE_PKGARCH (armv5).Toolchain tunings inval=
id:<br>Tuning 'cortexa8thf-neon' has no defined features, and cannot be use=
d.<br><br>I could solve the first one by doing in tune-arm926ejs.inc:<br><b=
r>+TUNE_FEATURES =3D &quot;${TUNE_FEATURES_tune-armv5te} arm926ejs&quot;<br=
>-TUNE_FEATURES_tune-arm926ejs =3D &quot;${TUNE_FEATURES_tune-armv5te} arm9=
26ejs&quot;<br><br>+PACKAGE_EXTRA_ARCHS =3D &quot;${PACKAGE_EXTRA_ARCHS_tun=
e-armv5te}&quot;<br>-PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D &quot;${PACKAGE=
_EXTRA_ARCHS_tune-armv5te}&quot;<br><br>But the second one with 'cortexa8th=
f-neon' still exists but I don't know where it is exactly been set. toolcha=
in-linaro/gcc.inc is using this as DEFAULTUNE . Shouldn't this be arm926ejs=
 for my machine?<br><br></span><span lang=3DEN-US style=3D'font-size:10.0pt=
'>Regards,<br>Firat<br><br><br>____________________________________________=
___<br>meta-arago mailing list<br></span><span style=3D'font-size:10.0pt'><=
a href=3D"mailto:meta-arago@arago-project.org"><span lang=3DEN-US>meta-arag=
o@arago-project.org</span></a></span><span lang=3DEN-US style=3D'font-size:=
10.0pt'><br></span><span style=3D'font-size:10.0pt'><a href=3D"http://arago=
-project.org/cgi-bin/mailman/listinfo/meta-arago"><span lang=3DEN-US>http:/=
/arago-project.org/cgi-bin/mailman/listinfo/meta-arago</span></a></span><sp=
an lang=3DEN-US style=3D'font-size:10.0pt'><o:p></o:p></span></p></div></di=
v></body></html>=

--_000_766D943268E37941B447D0C68B4D7048115BE2822BECCR11PUBLICe_--
