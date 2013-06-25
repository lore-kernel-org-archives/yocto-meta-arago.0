Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 44E5052995
	for <meta-arago@arago-project.org>;
	Tue, 25 Jun 2013 11:44:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5PBiHeX025838
	for <meta-arago@arago-project.org>; Tue, 25 Jun 2013 06:44:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5PBiH8X005402
	for <meta-arago@arago-project.org>; Tue, 25 Jun 2013 06:44:17 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 25 Jun 2013 06:44:16 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Tue, 25 Jun 2013 06:44:16 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Failures with nbench
Thread-Index: Ac5xmMX3KhDqf0uzRx2GN4V9AxTsTA==
Date: Tue, 25 Jun 2013 11:44:15 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49054935824@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Failures with nbench
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
X-List-Received-Date: Tue, 25 Jun 2013 11:44:18 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4F9216F96E5DF9428610502835A9F49054935824DLEE11entticom_"

--_000_4F9216F96E5DF9428610502835A9F49054935824DLEE11entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,
We are encountering the following error very often in our nightly builds.
The reason seems to be due to the make process trying to compile before the=
 touch pointer.h succeeds.
Not sure if this is because of the -j 4.
Anybody else has seen this issue.  Appreciate your comments and help in res=
olving this issue.

With regards,
Sam

NOTE: recipe nbench-byte-2.2.3-r0: task do_compile: Started
ERROR: Function failed: do_compile (see /home/gtbldadm/yocto/mcsdk-3_00_00_=
11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7=
ahf-vfp-neon-oe-linux-gnueabi/nbench-byte-2.2.3-r0/temp/log.do_compile.2834=
6 for further information)
ERROR: Logfile of failure stored in: /home/gtbldadm/yocto/mcsdk-3_00_00_11/=
oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf=
-vfp-neon-oe-linux-gnueabi/nbench-byte-2.2.3-r0/temp/log.do_compile.28346
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 4 -e MAKEFLAGS=3D
| touch pointer.h ;
| arm-linux-gnueabihf-gcc  -march=3Darmv7-a    -marm -mthumb-interwork -mfl=
oat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15  -isystem/opt/linaro-2013.0=
3/arm-linux-gnueabihf/include  -fstack-protector -D_FORTIFY_SOURCE=3D1 -O2 =
-pipe -g -feliminate-unused-debug-types  -L/opt/linaro-2013.03/arm-linux-gn=
ueabihf/lib -Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl=
,-O1 -Wl,--hash-style=3Dgnu --sysroot=3D/home/gtbldadm/yocto/mcsdk-3_00_00_=
11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/sysroots/k=
eystone-evm  -DLINUX  -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/inclu=
de  -fstack-protector -D_FORTIFY_SOURCE=3D1 -O2 -pipe -g -feliminate-unused=
-debug-types\
|              -c misc.c
| ./sysinfo.sh arm-linux-gnueabihf-gcc  -march=3Darmv7-a    -marm -mthumb-i=
nterwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15  -isystem/opt/=
linaro-2013.03/arm-linux-gnueabihf/include  -fstack-protector -D_FORTIFY_SO=
URCE=3D1 -O2 -pipe -g -feliminate-unused-debug-types  -L/opt/linaro-2013.03=
/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gnue=
abihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu --sysroot=3D/home/gtbldadm/yocto/m=
csdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolcha=
in/sysroots/keystone-evm  -DLINUX  -isystem/opt/linaro-2013.03/arm-linux-gn=
ueabihf/include  -fstack-protector -D_FORTIFY_SOURCE=3D1 -O2 -pipe -g -feli=
minate-unused-debug-types
| ./sysinfo.sh arm-linux-gnueabihf-gcc  -march=3Darmv7-a    -marm -mthumb-i=
nterwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15  -isystem/opt/=
linaro-2013.03/arm-linux-gnueabihf/include  -fstack-protector -D_FORTIFY_SO=
URCE=3D1 -O2 -pipe -g -feliminate-unused-debug-types  -L/opt/linaro-2013.03=
/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gnue=
abihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu --sysroot=3D/home/gtbldadm/yocto/m=
csdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolcha=
in/sysroots/keystone-evm  -DLINUX  -isystem/opt/linaro-2013.03/arm-linux-gn=
ueabihf/include  -fstack-protector -D_FORTIFY_SOURCE=3D1 -O2 -pipe -g -feli=
minate-unused-debug-types
| In file included from misc.h:36:0,
|                  from misc.c:23:
| nmglobal.h:29:21: fatal error: pointer.h: No such file or directory
| compilation terminated.
| make: *** [misc.o] Error 1
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /home/gtbldadm/yocto/mcsdk-3_00_0=
0_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/arm=
v7ahf-vfp-neon-oe-linux-gnueabi/nbench-byte-2.2.3-r0/temp/log.do_compile.28=
346 for further information)
NOTE: recipe nbench-byte-2.2.3-r0: task do_compile: Failed
ERROR: Task 2812 (/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk=
/sources/meta-openembedded/meta-oe/recipes-benchmark/nbench-byte/nbench-byt=
e_2.2.3.bb, do_compile) failed with exit code '1'
WARNING: QA Issue: syslog-ng: Files/directories were installed but not ship=
ped


--_000_4F9216F96E5DF9428610502835A9F49054935824DLEE11entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
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
<p class=3D"MsoNormal">Hello all,<o:p></o:p></p>
<p class=3D"MsoNormal">We are encountering the following error very often i=
n our nightly builds.<o:p></o:p></p>
<p class=3D"MsoNormal">The reason seems to be due to the make process tryin=
g to compile before the touch pointer.h succeeds.
<o:p></o:p></p>
<p class=3D"MsoNormal">Not sure if this is because of the &#8211;j 4. <o:p>=
</o:p></p>
<p class=3D"MsoNormal">Anybody else has seen this issue.&nbsp; Appreciate y=
our comments and help in resolving this issue.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">With regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Sam<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">NOTE: recipe nbench-byte-2.2.3-r0: task do_compile: Starte=
d<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">ERROR: Function failed: do_compile (see /home/gtbldadm/yoc=
to/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-too=
lchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/nbench-byte-2.2.3-r0/temp/lo=
g.do_compile.28346
 for further information)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">ERROR: Logfile of failure stored in: /home/gtbldadm/yocto/=
mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolch=
ain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/nbench-byte-2.2.3-r0/temp/log.d=
o_compile.28346<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Log data follows:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| DEBUG: Executing shell function do_compile<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| NOTE: make -j 4 -e MAKEFLAGS=3D<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| touch pointer.h ;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| arm-linux-gnueabihf-gcc&nbsp; -march=3Darmv7-a&nbsp;&nbs=
p;&nbsp; -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dc=
ortex-a15&nbsp; -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include&nbs=
p; -fstack-protector
 -D_FORTIFY_SOURCE=3D1 -O2 -pipe -g -feliminate-unused-debug-types&nbsp; -L=
/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-201=
3.03/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu --sysroot=3D/ho=
me/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-exte=
rnal-linaro-toolchain/sysroots/keystone-evm&nbsp;
 -DLINUX&nbsp; -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include&nbsp=
; -fstack-protector -D_FORTIFY_SOURCE=3D1 -O2 -pipe -g -feliminate-unused-d=
ebug-types\<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; -c misc.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| ./sysinfo.sh arm-linux-gnueabihf-gcc&nbsp; -march=3Darmv=
7-a&nbsp;&nbsp;&nbsp; -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dne=
on -mtune=3Dcortex-a15&nbsp; -isystem/opt/linaro-2013.03/arm-linux-gnueabih=
f/include&nbsp;
 -fstack-protector -D_FORTIFY_SOURCE=3D1 -O2 -pipe -g -feliminate-unused-de=
bug-types&nbsp; -L/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-rpath-li=
nk,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dg=
nu --sysroot=3D/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/bu=
ild/arago-tmp-external-linaro-toolchain/sysroots/keystone-evm&nbsp;
 -DLINUX&nbsp; -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include&nbsp=
; -fstack-protector -D_FORTIFY_SOURCE=3D1 -O2 -pipe -g -feliminate-unused-d=
ebug-types<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| ./sysinfo.sh arm-linux-gnueabihf-gcc&nbsp; -march=3Darmv=
7-a&nbsp;&nbsp;&nbsp; -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dne=
on -mtune=3Dcortex-a15&nbsp; -isystem/opt/linaro-2013.03/arm-linux-gnueabih=
f/include&nbsp;
 -fstack-protector -D_FORTIFY_SOURCE=3D1 -O2 -pipe -g -feliminate-unused-de=
bug-types&nbsp; -L/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-rpath-li=
nk,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dg=
nu --sysroot=3D/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/bu=
ild/arago-tmp-external-linaro-toolchain/sysroots/keystone-evm&nbsp;
 -DLINUX&nbsp; -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include&nbsp=
; -fstack-protector -D_FORTIFY_SOURCE=3D1 -O2 -pipe -g -feliminate-unused-d=
ebug-types<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| In file included from misc.h:36:0,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from misc.c:23:<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| nmglobal.h:29:21: fatal error: pointer.h: No such file o=
r directory<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| compilation terminated.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| make: *** [misc.o] Error 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| make: *** Waiting for unfinished jobs....<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| ERROR: oe_runmake failed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">| ERROR: Function failed: do_compile (see /home/gtbldadm/y=
octo/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-t=
oolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/nbench-byte-2.2.3-r0/temp/=
log.do_compile.28346
 for further information)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">NOTE: recipe nbench-byte-2.2.3-r0: task do_compile: Failed=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">ERROR: Task 2812 (/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe=
-layersetup-mcsdk/sources/meta-openembedded/meta-oe/recipes-benchmark/nbenc=
h-byte/nbench-byte_2.2.3.bb, do_compile) failed
 with exit code '1'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: QA Issue: syslog-ng: Files/directories were insta=
lled but not shipped<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_4F9216F96E5DF9428610502835A9F49054935824DLEE11entticom_--
