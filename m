Return-Path: <mrinmayee@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D39875296F
	for <meta-arago@arago-project.org>;
	Thu,  9 Jan 2014 08:09:50 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0989l5c021314
	for <meta-arago@arago-project.org>; Thu, 9 Jan 2014 02:09:48 -0600
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0989jOn018955
	for <meta-arago@arago-project.org>; Thu, 9 Jan 2014 13:39:46 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Thu, 9 Jan 2014 16:09:45 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Openssl build failure
Thread-Index: Ac8COfvK5lQ+DQayTaeAR2Ix/TewyAJNsnBQAGhOZlA=
Date: Thu, 9 Jan 2014 08:09:44 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D5478FAA@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Openssl build failure
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
X-List-Received-Date: Thu, 09 Jan 2014 08:09:52 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CF956B779D819D41BBC043B7082161D5478FAADBDE04entticom_"

--_000_CF956B779D819D41BBC043B7082161D5478FAADBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi all,

I am facing a openssl build failure on some of the 64-bit machines . In the=
 recipe the dependency "ocf-linux " is replaced by null for dra7xx-evm.
However, on certain machines, it adds a dependency ocf-linux-native that co=
nflicts with cryptodev, resulting in these errors:

WARNING: The recipe ocf-linux is trying to install files into a shared area=
 when those files already exist. Those files and their manifest location ar=
e:
   /home/x0161644/glsdk/ti-glsdk_dra7xx-evm_6_03_00_01/yocto-layers/build/a=
rago-tmp-external-linaro-toolchain/sysroots/dra7xx-evm/usr/include/crypto/c=
ryptodev.h
   Matched in manifest-dra7xx-evm-cryptodev
Please verify which package should provide the above files.
ERROR: Function failed: do_compile (see /home/x0161644/glsdk/ti-glsdk_dra7x=
x-evm_6_03_00_01/yocto-layers/build/arago-tmp-external-linaro-toolchain/wor=
k/dra7xx_evm-oe-linux-gnueabi/openssl/1.0.1e-r15.0-arago8/temp/log.do_compi=
le.29620 for further information)
ERROR: Logfile of failure stored in: /home/x0161644/glsdk/ti-glsdk_dra7xx-e=
vm_6_03_00_01/yocto-layers/build/arago-tmp-external-linaro-toolchain/work/d=
ra7xx_evm-oe-linux-gnueabi/openssl/1.0.1e-r15.0-arago8/temp/log.do_compile.=
29620


To circumvent these, I have added the following line in -arago-extras/recip=
es-kernel/cryptodev/cryptodev_1.6.bb:
RREPLACES_${PN}_append_dra7xx-evm =3D "ocf-linux"

Is this the correct approach?

Regards,
Mrinmayee


--_000_CF956B779D819D41BBC043B7082161D5478FAADBDE04entticom_
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
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle19
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am facing a openssl build failure on some of the 6=
4-bit machines . In the recipe the dependency &#8220;ocf-linux &#8221; is r=
eplaced by null for dra7xx-evm.<o:p></o:p></p>
<p class=3D"MsoNormal">However, on certain machines, it adds a dependency o=
cf-linux-native that conflicts with cryptodev, resulting in these errors:<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><u><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;;color:red">WARNING: The recipe ocf-linux is trying to ins=
tall files into a shared area when those files already exist. Those files a=
nd their manifest location are:<o:p></o:p></span></u></p>
<p class=3D"MsoNormal"><u><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;;color:red">&nbsp;&nbsp; /home/x0161644/glsdk/ti-glsdk_dra=
7xx-evm_6_03_00_01/yocto-layers/build/arago-tmp-external-linaro-toolchain/s=
ysroots/dra7xx-evm/usr/include/crypto/cryptodev.h<o:p></o:p></span></u></p>
<p class=3D"MsoNormal"><u><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;;color:red">&nbsp;&nbsp; Matched in manifest-dra7xx-evm-cr=
yptodev<o:p></o:p></span></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;;color:red">Please verify which package should provide the ab=
ove files.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;;color:red">ERROR: Function failed: do_compile (see /home/x01=
61644/glsdk/ti-glsdk_dra7xx-evm_6_03_00_01/yocto-layers/build/arago-tmp-ext=
ernal-linaro-toolchain/work/dra7xx_evm-oe-linux-gnueabi/openssl/1.0.1e-r15.=
0-arago8/temp/log.do_compile.29620
 for further information)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;;color:red">ERROR: Logfile of failure stored in: /home/x01616=
44/glsdk/ti-glsdk_dra7xx-evm_6_03_00_01/yocto-layers/build/arago-tmp-extern=
al-linaro-toolchain/work/dra7xx_evm-oe-linux-gnueabi/openssl/1.0.1e-r15.0-a=
rago8/temp/log.do_compile.29620<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">To circumvent these, I have added the following line=
 in -arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb:<o:p></o:p></p>
<p class=3D"MsoNormal"><b>RREPLACES_${PN}_append_dra7xx-evm =3D &quot;ocf-l=
inux&quot;<o:p></o:p></b></p>
<p class=3D"MsoNormal"><b><o:p>&nbsp;</o:p></b></p>
<p class=3D"MsoNormal">Is this the correct approach?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Mrinmayee<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CF956B779D819D41BBC043B7082161D5478FAADBDE04entticom_--
