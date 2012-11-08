Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id EA25A529EF
	for <meta-arago@arago-project.org>;
	Thu,  8 Nov 2012 03:06:55 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA836tMn012543
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2012 21:06:55 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA836tfm004961
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2012 21:06:55 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 7 Nov 2012 21:06:55 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: meta-toolchain-arago: move LD_LIBRARY_PATH setting into each
	shell stub [issue]
Thread-Index: Ac29XL9r7FdJOoPAQCq8P1ndHtAB8Q==
Date: Thu, 8 Nov 2012 03:06:52 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C31AF50@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: meta-toolchain-arago: move LD_LIBRARY_PATH setting into each shell stub [issue]
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
X-List-Received-Date: Thu, 08 Nov 2012 03:06:56 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C31AF50DFLE09entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C31AF50DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Some more progress being made. Building non Qt applications working again a=
nd qmake works. But make is having issues finding include files

/home/fcooper/sdk/alpha/11_07_8_10_PM/ti-sdk-am335x-evm-05.06.00.00/linux-d=
evkit/arm-arago-linux-gnueabi/usr/include/qtopia/QtCore/qglobal.h:68:21: fa=
tal error: algorithm: No such file or directory
compilation terminated.
make: *** [main.o] Error 1

That header is apart of the C++ standard library and is located at /home/fc=
ooper/sdk/alpha/11_07_8_10_PM/ti-sdk-am335x-evm-05.06.00.00/linux-devkit/ar=
m-arago-linux-gnueabi/usr/include/c++/4.5.3

I am currently fiddling with mkspecs, linux.conf and QMAKE_INCDIR with no l=
uck.

Complete log: pastebin.com/xRh4tWik


Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C31AF50DFLE09entticom_
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
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
<p class=3D"MsoNormal">Some more progress being made. Building non Qt appli=
cations working again and qmake works. But make is having issues finding in=
clude files<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">/home/fcooper/sdk/alpha/11_07_8_10_PM/ti-sdk-am335x-=
evm-05.06.00.00/linux-devkit/arm-arago-linux-gnueabi/usr/include/qtopia/QtC=
ore/qglobal.h:68:21: fatal error: algorithm: No such file or directory<o:p>=
</o:p></p>
<p class=3D"MsoNormal">compilation terminated.<o:p></o:p></p>
<p class=3D"MsoNormal">make: *** [main.o] Error 1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">That header is apart of the C&#43;&#43; standard lib=
rary and is located at /home/fcooper/sdk/alpha/11_07_8_10_PM/ti-sdk-am335x-=
evm-05.06.00.00/linux-devkit/arm-arago-linux-gnueabi/usr/include/c&#43;&#43=
;/4.5.3<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am currently fiddling with mkspecs, linux.conf and=
 QMAKE_INCDIR with no luck.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Complete log: pastebin.com/xRh4tWik<o:p></o:p></p>
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

--_000_8F29D6B095ED194EA1980491A5E029710C31AF50DFLE09entticom_--
