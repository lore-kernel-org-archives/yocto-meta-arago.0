Return-Path: <zhoujt@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 11CD852A10
	for <meta-arago@arago-project.org>;
	Thu, 21 Feb 2013 17:49:25 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1LHnMHh019941
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2013 11:49:22 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1LHnMeW025111
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2013 11:49:22 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 21 Feb 2013 11:49:22 -0600
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: vtun recipe review
Thread-Index: Ac4OTAg8qENO/MmZQnmLRfSnfHYCtAAAJlMAACULiSAAJr4TkAA3467w
Date: Thu, 21 Feb 2013 17:49:21 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E391A896@DFLE09.ent.ti.com>
References: <3C08AEEB3C731745938BC83D029FE5E391A1A4@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C395340@DFLE09.ent.ti.com>
	<3C08AEEB3C731745938BC83D029FE5E391A3CE@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C39775B@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C39775B@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: vtun recipe review
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
X-List-Received-Date: Thu, 21 Feb 2013 17:49:28 -0000
X-Groupsio-MsgNum: 941
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_005_3C08AEEB3C731745938BC83D029FE5E391A896DFLE09entticom_"

--_005_3C08AEEB3C731745938BC83D029FE5E391A896DFLE09entticom_
Content-Type: multipart/alternative;
	boundary="_000_3C08AEEB3C731745938BC83D029FE5E391A896DFLE09entticom_"

--_000_3C08AEEB3C731745938BC83D029FE5E391A896DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I attached log.do_configure and run.do_configure.

I don't have the compile files since the compile stage is not initiated. Th=
anks~

From: Cooper Jr., Franklin
Sent: Wednesday, February 20, 2013 10:09 AM
To: Zhou, Jingting; meta-arago@arago-project.org
Subject: RE: vtun recipe review

Please attach the log.do_compile, log.do_configure, run.do_compile and run.=
do_configure files.

From: Zhou, Jingting
Sent: Tuesday, February 19, 2013 2:55 PM
To: Cooper Jr., Franklin; meta-arago@arago-project.org<mailto:meta-arago@ar=
ago-project.org>
Subject: RE: vtun recipe review

Thanks Franklin for the detailed comments~

When I tried to use

EXTRA_OECONF +=3D "\
                                     --with-lzo-headers=3D${STAGING_INCDIR}=
/lzo \
                                     --with-lzo-lib=3D${STAGING_LIBDIR} \
                                     --with-ssl-headers=3D${STAGING_INCDIR}=
/openssl \
                                     --with-ssl-lib=3D${STAGING_LIBDIR}"

do_compile_prepend(){
                sed '102d' Makefile > Makefile.new (102nd line in Makefile:=
 $(BIN_DIR)/strip $(DESTDIR)$(SBIN_DIR)/vtund, and strip is complaining vtu=
nd is not a linux executable file)
                mv Makefile.new Makefile
}

I got the following error, have you seen this before? I tried to "vtun-3.0.=
3$ grep -r AC_SEARCH_HEADERS *" but didn't see it defined anywhere. If you =
don't have the answer either, I'll go with the old do_config.

| autoreconf: configure.in: tracing
| autoreconf: configure.in: not using Libtool
| autoreconf: running: /home/a0221004/yocto/oe-layersetup/build/arago-tmp-e=
xternal-linaro-toolchain/sysroots/x86_64-linux/usr/bin/autoconf --include=
=3D/home/a0221004/yocto/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/sysroots/x86_64-linux/usr/share/aclocal-1.12 --include=3D/home/a022100=
4/yocto/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/armv7a=
-vfp-neon-oe-linux-gnueabi/vtun-3.0.3-r3/vtun-3.0.3/aclocal-copy/ --force
| configure.in:134: error: possibly undefined macro: AC_SEARCH_HEADERS
|       If this token and others are legitimate, please use m4_pattern_allo=
w.
|       See the Autoconf documentation.
| configure.in:268: error: possibly undefined macro: AC_LINK_DRV
| autoreconf: /home/a0221004/yocto/oe-layersetup/build/arago-tmp-external-l=
inaro-toolchain/sysroots/x86_64-linux/usr/bin/autoconf failed with exit sta=
tus: 1
| ERROR: autoreconf execution failed.
| ERROR: Function failed: do_configure (see /home/a0221004/yocto/oe-layerse=
tup/build/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-neon-oe-linux=
-gnueabi/vtun-3.0.3-r3/temp/log.do_configure.12349 for further information)
ERROR: Task 6 (/home/a0221004/yocto/oe-layersetup/sources/meta-arago/meta-a=
rago-distro/recipes-connectivity/vtun/vtun_3.0.3.bb, do_configure) failed w=
ith exit code '1'

From: Cooper Jr., Franklin
Sent: Monday, February 18, 2013 10:16 PM
To: Zhou, Jingting; meta-arago@arago-project.org<mailto:meta-arago@arago-pr=
oject.org>
Subject: RE: vtun recipe review



From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago-=
project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Zho=
u, Jingting
Sent: Monday, February 18, 2013 8:52 PM
To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
Subject: [meta-arago] vtun recipe review

From 7f175836ab1c4a02f1b35322fff7ece88abbd34e Mon Sep 17 00:00:00 2001
From: Jingting Zhou <a0221004@ares-ubuntu>
Date: Mon, 18 Feb 2013 21:26:17 -0500
Subject: [PATCH] added vtun recipe

---
.../recipes-connectivity/vtun/vtun_3.0.3.bb        |   22 +++++++++++++++++=
+++
1 file changed, 22 insertions(+)
create mode 100755 meta-arago-distro/recipes-connectivity/vtun/vtun_3.0.3.b=
b

diff --git a/meta-arago-distro/recipes-connectivity/vtun/vtun_3.0.3.bb b/me=
ta-arago-distro/recipes-connectivity/vtun/vtun_3.0.3.bb
new file mode 100755
index 0000000..8b3b1a9
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "Virtual Tunnels over TCP/IP networks with traffic shaping=
, compression and encryption."
+HOMEPAGE =3D "http://vtun.sourceforge.net/"
+SECTION =3D "console/network"
+PRIORITY =3D "optional"
+LICENSE =3D "GPL"
+DEPENDS =3D "zlib lzo"
+PR =3D "r1"
+LIC_FILES_CHKSUM =3D "file://Makefile.in;endline=3D14;md5=3D79e41e827b3240=
b63ab8b5810e903742<file:///\\Makefile.in;endline=3D14;md5=3D79e41e827b3240b=
63ab8b5810e903742>"

I pretty sure I remember reading somewhere that a generic GPL license shoul=
dn't be used. A specific license should be used instead like GPLv1, GPLv2 e=
tc...
Based on the license text in the Makefile it looks like GPLv2 should be the=
 license you use.

#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.

Is there any file in that package that contains this license information. U=
sually you choose a file to do a license checksum against that the author w=
ould most likely tweak if any license information has been changed. To me a=
 Makefile is something that can easily be overlooked in terms of updating l=
icense information.


+
+SRC_URI =3D "http://downloads.sourceforge.net/project/vtun/vtun/${PV}/vtun=
-${PV}.tar.gz<http://downloads.sourceforge.net/project/vtun/vtun/$%7bPV%7d/=
vtun-$%7bPV%7d.tar.gz>"
+
+SRC_URI[md5sum] =3D "f3becf2a0270910a841060c08d1db824"
+SRC_URI[sha256sum] =3D "69dcbe4f8c5ce7d91b4150a6309e536d03b61841169746ca57=
88413ac7edb9cb"
+
+inherit autotools
+
+do_configure() {
+              oe_runconf --with-lzo-headers=3D${STAGING_INCDIR}/lzo --with=
-lzo-lib=3D${STAGING_LIBDIR} --with-ssl-headers=3D${STAGING_INCDIR}/openssl=
 --with-ssl-lib=3D${STAGING_LIBDIR}

Have you seen the EXTRA_OECONF variable (http://docs.openembedded.org/userm=
anual/usermanual.html)? This variable allows you to set extra configure opt=
ions without having to implement them in the way you're doing it.
So you can do something like

EXTRA_OECONF +=3D "\
--with-lzo-headers=3D${STAGING_INCDIR}/lzo \
--with-lzo-lib=3D${STAGING_LIBDIR} \
--with-ssl-headers=3D${STAGING_INCDIR}/openssl \
--with-ssl-lib=3D${STAGING_LIBDIR}
"

Instead of overriding the default do_configure step.


+              sed '102d' Makefile > Makefile.new
+              mv Makefile.new Makefile
What is the purpose of these lines?

Also you can probably just use the seds in place option (http://joemaller.c=
om/823/quick-note-about-seds-edit-in-place-option/). This way you wouldn't =
need to make a backup of the file.
Also along with my comments about the oe_runconf if you absolutely need to =
make the changes to the Makefile you can remove this do_configure task and =
simply create a do_compile_prepend task that includes your Makefile changes=
.
+}
+
--
1.7.9.5

In general you place a base recipe that is generic for anyone to use in met=
a-arago-extras and if any machine/device specific patches need to be added =
then you create a bbappend in meta-arago-distro to make that change. A perf=
ect example is qt-embedded-gles. I created the baes recipe in meta-arago-ex=
tras and in meta-arago-distro I appended that recipe to add tweaks specific=
 to the Arago distribution.

So a lot of your recipes you submitted tonight should be moved to meta-arag=
o-extras since they are generic.

--_000_3C08AEEB3C731745938BC83D029FE5E391A896DFLE09entticom_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle22
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle23
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle24
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle25
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I attached log.do_conf=
igure and run.do_configure.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I don&#8217;t have the=
 compile files since the compile stage is not initiated. Thanks~
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Cooper J=
r., Franklin
<br>
<b>Sent:</b> Wednesday, February 20, 2013 10:09 AM<br>
<b>To:</b> Zhou, Jingting; meta-arago@arago-project.org<br>
<b>Subject:</b> RE: vtun recipe review<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Please attach the log.=
do_compile, log.do_configure, run.do_compile and run.do_configure files.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Zhou, Ji=
ngting
<br>
<b>Sent:</b> Tuesday, February 19, 2013 2:55 PM<br>
<b>To:</b> Cooper Jr., Franklin; <a href=3D"mailto:meta-arago@arago-project=
.org">meta-arago@arago-project.org</a><br>
<b>Subject:</b> RE: vtun recipe review<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks Franklin for the detailed comments~<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When I tried to use <o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">EXTRA_OECONF &#43;=3D =
&quot;\<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; --with-lzo-headers=3D${STAGING_INCD=
IR}/lzo \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; --with-lzo-lib=3D${STAGING_LIBDIR} =
\<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; --with-ssl-headers=3D${STAGING_INCD=
IR}/openssl \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;--with-ssl-lib=3D${STAGING_LIBDIR}&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">do_compile_prepend(){<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed '1=
02d' Makefile &gt; Makefile.new
</span>(102<sup>nd</sup> line in Makefile: $(BIN_DIR)/strip $(DESTDIR)$(SBI=
N_DIR)/vtund, and strip is complaining vtund is not a linux executable file=
)<span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv Mak=
efile.new Makefile<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">}<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal">I got the following error, have you seen this before=
? I tried to &#8220;vtun-3.0.3$ grep -r AC_SEARCH_HEADERS *&#8221; but didn=
&#8217;t see it defined anywhere. If you don&#8217;t have the answer either=
, I&#8217;ll go with the old do_config.
<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">| autoreconf: configur=
e.in: tracing<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">| autoreconf: configur=
e.in: not using Libtool<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">| autoreconf: running:=
 /home/a0221004/yocto/oe-layersetup/build/arago-tmp-external-linaro-toolcha=
in/sysroots/x86_64-linux/usr/bin/autoconf --include=3D/home/a0221004/yocto/=
oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-lin=
ux/usr/share/aclocal-1.12
 --include=3D/home/a0221004/yocto/oe-layersetup/build/arago-tmp-external-li=
naro-toolchain/work/armv7a-vfp-neon-oe-linux-gnueabi/vtun-3.0.3-r3/vtun-3.0=
.3/aclocal-copy/ --force<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">| configure.in:134: er=
ror: possibly undefined macro: AC_SEARCH_HEADERS<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; If this token and others are legitimate, please use m4_patt=
ern_allow.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; See the Autoconf documentation.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">| configure.in:268: er=
ror: possibly undefined macro: AC_LINK_DRV<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">| autoreconf: /home/a0=
221004/yocto/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroo=
ts/x86_64-linux/usr/bin/autoconf failed with exit status: 1<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">| ERROR: autoreconf ex=
ecution failed.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">| ERROR: Function fail=
ed: do_configure (see /home/a0221004/yocto/oe-layersetup/build/arago-tmp-ex=
ternal-linaro-toolchain/work/armv7a-vfp-neon-oe-linux-gnueabi/vtun-3.0.3-r3=
/temp/log.do_configure.12349 for further
 information)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">ERROR: Task 6 (/home/a=
0221004/yocto/oe-layersetup/sources/meta-arago/meta-arago-distro/recipes-co=
nnectivity/vtun/vtun_3.0.3.bb, do_configure) failed with exit code '1'<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Cooper J=
r., Franklin
<br>
<b>Sent:</b> Monday, February 18, 2013 10:16 PM<br>
<b>To:</b> Zhou, Jingting; <a href=3D"mailto:meta-arago@arago-project.org">=
meta-arago@arago-project.org</a><br>
<b>Subject:</b> RE: vtun recipe review<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">
<a href=3D"mailto:meta-arago-bounces@arago-project.org">meta-arago-bounces@=
arago-project.org</a> [<a href=3D"mailto:meta-arago-bounces@arago-project.o=
rg">mailto:meta-arago-bounces@arago-project.org</a>]
<b>On Behalf Of </b>Zhou, Jingting<br>
<b>Sent:</b> Monday, February 18, 2013 8:52 PM<br>
<b>To:</b> <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago=
-project.org</a><br>
<b>Subject:</b> [meta-arago] vtun recipe review<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">From 7f175836ab1c4a02f1b35322fff7ece88abbd34e Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Jingting Zhou &lt;a0221004@ares-ubuntu&gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">Date: Mon, 18 Feb 2013 21:26:17 -0500<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] added vtun recipe<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../recipes-connectivity/vtun/vtun_3.0.3.bb&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 22 &#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 22 insertions(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-distro/recipes-connect=
ivity/vtun/vtun_3.0.3.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-connectivity/=
vtun/vtun_3.0.3.bb b/meta-arago-distro/recipes-connectivity/vtun/vtun_3.0.3=
.bb<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..8b3b1a9<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-distro/recipes-connecti=
vity/vtun/vtun_3.0.3.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,22 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DESCRIPTION =3D &quot;Virtual Tunnels over TCP/=
IP networks with traffic shaping, compression and encryption.&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;HOMEPAGE =3D &quot;<a href=3D"http://vtun.sourc=
eforge.net/">http://vtun.sourceforge.net/</a>&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SECTION =3D &quot;console/network&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;PRIORITY =3D &quot;optional&quot;<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;LICENSE =3D &quot;GPL&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DEPENDS =3D &quot;zlib lzo&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PR =3D &quot;r1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file:///\=
\Makefile.in;endline=3D14;md5=3D79e41e827b3240b63ab8b5810e903742">file://Ma=
kefile.in;endline=3D14;md5=3D79e41e827b3240b63ab8b5810e903742</a>&quot;<o:p=
></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I pretty sure I rememb=
er reading somewhere that a generic GPL license shouldn&#8217;t be used. A =
specific license should be used instead like GPLv1, GPLv2 etc&#8230;<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Based on the license t=
ext in the Makefile it looks like GPLv2 should be the license you use.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#&nbsp;&nbsp; This pro=
gram is free software; you can redistribute it and/or modify<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#&nbsp;&nbsp; it under=
 the terms of the GNU General Public License as published by<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#&nbsp;&nbsp; the Free=
 Software Foundation; either version 2 of the License, or<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#&nbsp;&nbsp; (at your=
 option) any later version.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Is there any file in t=
hat package that contains this license information. Usually you choose a fi=
le to do a license checksum against that the author would most likely tweak=
 if any license information has been
 changed. To me a Makefile is something that can easily be overlooked in te=
rms of updating license information.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI =3D &quot;<a href=3D"http://downloads.s=
ourceforge.net/project/vtun/vtun/$%7bPV%7d/vtun-$%7bPV%7d.tar.gz">http://do=
wnloads.sourceforge.net/project/vtun/vtun/${PV}/vtun-${PV}.tar.gz</a>&quot;=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[md5sum] =3D &quot;f3becf2a0270910a84106=
0c08d1db824&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[sha256sum] =3D &quot;69dcbe4f8c5ce7d91b=
4150a6309e536d03b61841169746ca5788413ac7edb9cb&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;inherit autotools<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do_configure() {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runconf --with-lzo-headers=3D${STAGING_I=
NCDIR}/lzo --with-lzo-lib=3D${STAGING_LIBDIR} --with-ssl-headers=3D${STAGIN=
G_INCDIR}/openssl --with-ssl-lib=3D${STAGING_LIBDIR}<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Have you seen the EXTR=
A_OECONF variable (<a href=3D"http://docs.openembedded.org/usermanual/userm=
anual.html">http://docs.openembedded.org/usermanual/usermanual.html</a>)? T=
his variable allows you to set extra configure
 options without having to implement them in the way you&#8217;re doing it.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">So you can do somethin=
g like<o:p></o:p></span></p>
<pre>EXTRA_OECONF &#43;=3D &#8220;\<o:p></o:p></pre>
<p class=3D"MsoNormal">--with-lzo-headers=3D${STAGING_INCDIR}/lzo \<o:p></o=
:p></p>
<p class=3D"MsoNormal">--with-lzo-lib=3D${STAGING_LIBDIR} \<o:p></o:p></p>
<p class=3D"MsoNormal">--with-ssl-headers=3D${STAGING_INCDIR}/openssl \<o:p=
></o:p></p>
<p class=3D"MsoNormal">--with-ssl-lib=3D${STAGING_LIBDIR}<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#8220;<o:p></o:p></sp=
an></p>
<pre>Instead of overriding the default do_configure step.<o:p></o:p></pre>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed '102d' Makefile &gt; Makefile.new<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv Makefile.new Makefile<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">What is the purpose of=
 these lines?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Also you can probably =
just use the seds in place option (<a href=3D"http://joemaller.com/823/quic=
k-note-about-seds-edit-in-place-option/">http://joemaller.com/823/quick-not=
e-about-seds-edit-in-place-option/</a>).
 This way you wouldn&#8217;t need to make a backup of the file.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Also along with my com=
ments about the oe_runconf if you absolutely need to make the changes to th=
e Makefile you can remove this do_configure task and simply create a do_com=
pile_prepend task that includes your
 Makefile changes.<o:p></o:p></span></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.9.5<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">In general you place a=
 base recipe that is generic for anyone to use in meta-arago-extras and if =
any machine/device specific patches need to be added then you create a bbap=
pend in meta-arago-distro to make that
 change. A perfect example is qt-embedded-gles. I created the baes recipe i=
n meta-arago-extras and in meta-arago-distro I appended that recipe to add =
tweaks specific to the Arago distribution.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">So a lot of your recip=
es you submitted tonight should be moved to meta-arago-extras since they ar=
e generic.<o:p></o:p></span></p>
</div>
</div>
</div>
</body>
</html>

--_000_3C08AEEB3C731745938BC83D029FE5E391A896DFLE09entticom_--

--_005_3C08AEEB3C731745938BC83D029FE5E391A896DFLE09entticom_
Content-Type: application/octet-stream; name="log.do_configure.18495"
Content-Description: log.do_configure.18495
Content-Disposition: attachment; filename="log.do_configure.18495"; size=3066;
	creation-date="Thu, 21 Feb 2013 17:47:40 GMT";
	modification-date="Thu, 21 Feb 2013 17:45:59 GMT"
Content-Transfer-Encoding: base64

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gc3lzcm9vdF9jbGVhbnNzdGF0ZQpERUJV
RzogUHl0aG9uIGZ1bmN0aW9uIHN5c3Jvb3RfY2xlYW5zc3RhdGUgZmluaXNoZWQKREVCVUc6IFNJ
VEUgZmlsZXMgWydlbmRpYW4tbGl0dGxlJywgJ2JpdC0zMicsICdhcm0tY29tbW9uJywgJ2NvbW1v
bi1saW51eCcsICdjb21tb24tZ2xpYmMnLCAnYXJtLWxpbnV4JywgJ2FybS1saW51eC1nbnVlYWJp
JywgJ2NvbW1vbiddCkRFQlVHOiBFeGVjdXRpbmcgc2hlbGwgZnVuY3Rpb24gYXV0b3Rvb2xzX3By
ZWNvbmZpZ3VyZQpERUJVRzogU2hlbGwgZnVuY3Rpb24gYXV0b3Rvb2xzX3ByZWNvbmZpZ3VyZSBm
aW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHNoZWxsIGZ1bmN0aW9uIGRvX2NvbmZpZ3VyZQphdXRv
bWFrZSAoR05VIGF1dG9tYWtlKSAxLjEyLjMKQ29weXJpZ2h0IChDKSAyMDEyIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbiwgSW5jLgpMaWNlbnNlIEdQTHYyKzogR05VIEdQTCB2ZXJzaW9uIDIgb3Ig
bGF0ZXIgPGh0dHA6Ly9nbnUub3JnL2xpY2Vuc2VzL2dwbC0yLjAuaHRtbD4KVGhpcyBpcyBmcmVl
IHNvZnR3YXJlOiB5b3UgYXJlIGZyZWUgdG8gY2hhbmdlIGFuZCByZWRpc3RyaWJ1dGUgaXQuClRo
ZXJlIGlzIE5PIFdBUlJBTlRZLCB0byB0aGUgZXh0ZW50IHBlcm1pdHRlZCBieSBsYXcuCgpXcml0
dGVuIGJ5IFRvbSBUcm9tZXkgPHRyb21leUByZWRoYXQuY29tPgogICAgICAgYW5kIEFsZXhhbmRy
ZSBEdXJldC1MdXR6IDxhZGxAZ251Lm9yZz4uCkFVVE9WIGlzIDEuMTIKTk9URTogRXhlY3V0aW5n
IGF1dG9yZWNvbmYgLS12ZXJib3NlIC0taW5zdGFsbCAtLWZvcmNlIC0tZXhjbHVkZT1hdXRvcG9p
bnQgLUkvaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdv
LXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3Iv
c2hhcmUvYWNsb2NhbC0xLjEyIC1JIC9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAt
bWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vd29yay9hcm12
N2EtdmZwLW5lb24tb2UtbGludXgtZ251ZWFiaS92dHVuLTMuMC4zLXI1L3Z0dW4tMy4wLjMvYWNs
b2NhbC1jb3B5LwphdXRvcmVjb25mOiBFbnRlcmluZyBkaXJlY3RvcnkgYC4nCmF1dG9yZWNvbmY6
IGNvbmZpZ3VyZS5pbjogbm90IHVzaW5nIEdldHRleHQKYXV0b3JlY29uZjogcnVubmluZzogYWNs
b2NhbCAtSSAvaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2Fy
YWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91
c3Ivc2hhcmUvYWNsb2NhbC0xLjEyIC1JIC9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0
dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vd29yay9h
cm12N2EtdmZwLW5lb24tb2UtbGludXgtZ251ZWFiaS92dHVuLTMuMC4zLXI1L3Z0dW4tMy4wLjMv
YWNsb2NhbC1jb3B5LyAtSSAvaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2Rr
L2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL3g4Nl82
NC1saW51eC91c3Ivc2hhcmUvYWNsb2NhbC0xLjEyIC1JIC9ob21lL2EwMjIxMDA0L3lvY3RvL29l
LWxheWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hh
aW4vd29yay9hcm12N2EtdmZwLW5lb24tb2UtbGludXgtZ251ZWFiaS92dHVuLTMuMC4zLXI1L3Z0
dW4tMy4wLjMvYWNsb2NhbC1jb3B5LyAtLWZvcmNlIAphdXRvcmVjb25mOiBjb25maWd1cmUuaW46
IHRyYWNpbmcKYXV0b3JlY29uZjogY29uZmlndXJlLmluOiBub3QgdXNpbmcgTGlidG9vbAphdXRv
cmVjb25mOiBydW5uaW5nOiAvaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2Rr
L2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL3g4Nl82
NC1saW51eC91c3IvYmluL2F1dG9jb25mIC0taW5jbHVkZT0vaG9tZS9hMDIyMTAwNC95b2N0by9v
ZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNo
YWluL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3Ivc2hhcmUvYWNsb2NhbC0xLjEyIC0taW5jbHVk
ZT0vaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRt
cC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3dvcmsvYXJtdjdhLXZmcC1uZW9uLW9lLWxpbnV4
LWdudWVhYmkvdnR1bi0zLjAuMy1yNS92dHVuLTMuMC4zL2FjbG9jYWwtY29weS8gLS1mb3JjZQpj
b25maWd1cmUuaW46MTM0OiBlcnJvcjogcG9zc2libHkgdW5kZWZpbmVkIG1hY3JvOiBBQ19TRUFS
Q0hfSEVBREVSUwogICAgICBJZiB0aGlzIHRva2VuIGFuZCBvdGhlcnMgYXJlIGxlZ2l0aW1hdGUs
IHBsZWFzZSB1c2UgbTRfcGF0dGVybl9hbGxvdy4KICAgICAgU2VlIHRoZSBBdXRvY29uZiBkb2N1
bWVudGF0aW9uLgpjb25maWd1cmUuaW46MjY4OiBlcnJvcjogcG9zc2libHkgdW5kZWZpbmVkIG1h
Y3JvOiBBQ19MSU5LX0RSVgphdXRvcmVjb25mOiAvaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXll
cnNldHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5
c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvYmluL2F1dG9jb25mIGZhaWxlZCB3aXRoIGV4aXQgc3Rh
dHVzOiAxCkVSUk9SOiBhdXRvcmVjb25mIGV4ZWN1dGlvbiBmYWlsZWQuCkVSUk9SOiBGdW5jdGlv
biBmYWlsZWQ6IGRvX2NvbmZpZ3VyZSAoc2VlIC9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVy
c2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vd29y
ay9hcm12N2EtdmZwLW5lb24tb2UtbGludXgtZ251ZWFiaS92dHVuLTMuMC4zLXI1L3RlbXAvbG9n
LmRvX2NvbmZpZ3VyZS4xODQ5NSBmb3IgZnVydGhlciBpbmZvcm1hdGlvbikK

--_005_3C08AEEB3C731745938BC83D029FE5E391A896DFLE09entticom_
Content-Type: application/octet-stream; name="run.do_configure.18495"
Content-Description: run.do_configure.18495
Content-Disposition: attachment; filename="run.do_configure.18495";
	size=18693; creation-date="Thu, 21 Feb 2013 17:47:40 GMT";
	modification-date="Thu, 21 Feb 2013 17:45:57 GMT"
Content-Transfer-Encoding: base64

IyEvYmluL3NoIC1lCmV4cG9ydCBTVFJJUD0iYXJtLWxpbnV4LWdudWVhYmktc3RyaXAiCmV4cG9y
dCBCVUlMRF9DQz0iZ2NjIgpleHBvcnQgcHJlZml4PSIvdXNyIgpleHBvcnQgbGliZXhlY2Rpcj0i
L3Vzci9saWJleGVjIgpleHBvcnQgZGF0YWRpcj0iL3Vzci9zaGFyZSIKZXhwb3J0IGxvY2Fsc3Rh
dGVkaXI9Ii92YXIiCmV4cG9ydCBCVUlMRF9DWFg9ImcrKyIKZXhwb3J0IExEPSJhcm0tbGludXgt
Z251ZWFiaS1sZCAtLXN5c3Jvb3Q9L2hvbWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1t
Y3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi9zeXNyb290cy9r
ZXlzdG9uZS1ldm0iCmV4cG9ydCBiaW5kaXI9Ii91c3IvYmluIgpleHBvcnQgVEFSR0VUX0NYWEZM
QUdTPSItaXN5c3RlbS9ob21lL2EwMjIxMDA0L215SW5zdGFsbC9nY2MtbGluYXJvLWFybS1saW51
eC1nbnVlYWJpLTIwMTIuMDMtMjAxMjAzMjZfbGludXgvYXJtLWxpbnV4LWdudWVhYmkvaW5jbHVk
ZSAgLWZzdGFjay1wcm90ZWN0b3IgLURfRk9SVElGWV9TT1VSQ0U9MSAtTzIgLXBpcGUgLWcgLWZl
bGltaW5hdGUtdW51c2VkLWRlYnVnLXR5cGVzIC1mcGVybWlzc2l2ZSIKZXhwb3J0IGluY2x1ZGVk
aXI9Ii91c3IvaW5jbHVkZSIKZXhwb3J0IEJVSUxEX0xERkxBR1M9Ii1ML2hvbWUvYTAyMjEwMDQv
eW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJv
LXRvb2xjaGFpbi9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2xpYiAtTC9ob21lL2EwMjIxMDA0
L3lvY3RvL29lLWxheWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFy
by10b29sY2hhaW4vc3lzcm9vdHMveDg2XzY0LWxpbnV4L2xpYiAtV2wsLXJwYXRoLWxpbmssL2hv
bWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0
ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2xpYiAtV2ws
LXJwYXRoLWxpbmssL2hvbWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWls
ZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi9zeXNyb290cy94ODZfNjQtbGlu
dXgvbGliIC1XbCwtcnBhdGgsL2hvbWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nk
ay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi9zeXNyb290cy94ODZf
NjQtbGludXgvdXNyL2xpYiAtV2wsLXJwYXRoLC9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVy
c2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vc3lz
cm9vdHMveDg2XzY0LWxpbnV4L2xpYiAtV2wsLU8xIgpleHBvcnQgQlVJTERfTEQ9ImxkIgpleHBv
cnQgb2xkaW5jbHVkZWRpcj0iL3Vzci9pbmNsdWRlIgpleHBvcnQgQ0M9ImFybS1saW51eC1nbnVl
YWJpLWdjYyAgLW1hcmNoPWFybXY3LWEgICAgIC1tdGh1bWItaW50ZXJ3b3JrIC1tZmxvYXQtYWJp
PXNvZnRmcCAtbWZwdT1uZW9uIC1tdHVuZT1jb3J0ZXgtYTE1IC0tc3lzcm9vdD0vaG9tZS9hMDIy
MTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1s
aW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL2tleXN0b25lLWV2bSIKZXhwb3J0IENQUEZMQUdTPSIt
aXN5c3RlbS9ob21lL2EwMjIxMDA0L215SW5zdGFsbC9nY2MtbGluYXJvLWFybS1saW51eC1nbnVl
YWJpLTIwMTIuMDMtMjAxMjAzMjZfbGludXgvYXJtLWxpbnV4LWdudWVhYmkvaW5jbHVkZSAgLWZz
dGFjay1wcm90ZWN0b3IgLURfRk9SVElGWV9TT1VSQ0U9MSIKZXhwb3J0IFJBTkxJQj0iYXJtLWxp
bnV4LWdudWVhYmktcmFubGliIgpleHBvcnQgQ1hYPSJhcm0tbGludXgtZ251ZWFiaS1nKysgIC1t
YXJjaD1hcm12Ny1hICAgICAtbXRodW1iLWludGVyd29yayAtbWZsb2F0LWFiaT1zb2Z0ZnAgLW1m
cHU9bmVvbiAtbXR1bmU9Y29ydGV4LWExNSAtLXN5c3Jvb3Q9L2hvbWUvYTAyMjEwMDQveW9jdG8v
b2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xj
aGFpbi9zeXNyb290cy9rZXlzdG9uZS1ldm0iCmV4cG9ydCBQS0dfQ09ORklHX0xJQkRJUj0iL2hv
bWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0
ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi9zeXNyb290cy9rZXlzdG9uZS1ldm0vL3Vzci9saWIvcGtn
Y29uZmlnIgpleHBvcnQgQlVJTERfUkFOTElCPSJyYW5saWIiCmV4cG9ydCBCVUlMRF9OTT0ibm0i
CmV4cG9ydCBsdF9jdl9zeXNfbGliX2Rsc2VhcmNoX3BhdGhfc3BlYz0iL3Vzci9saWIgL2xpYiIK
ZXhwb3J0IG1hbmRpcj0iL3Vzci9zaGFyZS9tYW4iCmV4cG9ydCBPQkpDT1BZPSJhcm0tbGludXgt
Z251ZWFiaS1vYmpjb3B5IgpleHBvcnQgc2VydmljZWRpcj0iL3NydiIKZXhwb3J0IExDX0FMTD0i
QyIKZXhwb3J0IFBLR19DT05GSUdfRElSPSIvaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNl
dHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jv
b3RzL2tleXN0b25lLWV2bS8vdXNyL2xpYi9wa2djb25maWciCmV4cG9ydCBDQ0xEPSJhcm0tbGlu
dXgtZ251ZWFiaS1nY2MgIC1tYXJjaD1hcm12Ny1hICAgICAtbXRodW1iLWludGVyd29yayAtbWZs
b2F0LWFiaT1zb2Z0ZnAgLW1mcHU9bmVvbiAtbXR1bmU9Y29ydGV4LWExNSAtLXN5c3Jvb3Q9L2hv
bWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0
ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi9zeXNyb290cy9rZXlzdG9uZS1ldm0iCmV4cG9ydCBiYXNl
X2JpbmRpcj0iL2JpbiIKZXhwb3J0IHNiaW5kaXI9Ii91c3Ivc2JpbiIKZXhwb3J0IENGTEFHUz0i
LWlzeXN0ZW0vaG9tZS9hMDIyMTAwNC9teUluc3RhbGwvZ2NjLWxpbmFyby1hcm0tbGludXgtZ251
ZWFiaS0yMDEyLjAzLTIwMTIwMzI2X2xpbnV4L2FybS1saW51eC1nbnVlYWJpL2luY2x1ZGUgIC1m
c3RhY2stcHJvdGVjdG9yIC1EX0ZPUlRJRllfU09VUkNFPTEgLU8yIC1waXBlIC1nIC1mZWxpbWlu
YXRlLXVudXNlZC1kZWJ1Zy10eXBlcyIKZXhwb3J0IFRBUkdFVF9MREZMQUdTPSItTC9ob21lL2Ew
MjIxMDA0L215SW5zdGFsbC9nY2MtbGluYXJvLWFybS1saW51eC1nbnVlYWJpLTIwMTIuMDMtMjAx
MjAzMjZfbGludXgvYXJtLWxpbnV4LWdudWVhYmkvbGliIC1XbCwtcnBhdGgtbGluaywvaG9tZS9h
MDIyMTAwNC9teUluc3RhbGwvZ2NjLWxpbmFyby1hcm0tbGludXgtZ251ZWFiaS0yMDEyLjAzLTIw
MTIwMzI2X2xpbnV4L2FybS1saW51eC1nbnVlYWJpL2xpYiAtV2wsLU8xIC1XbCwtLWhhc2gtc3R5
bGU9Z251IgpleHBvcnQgUEtHX0NPTkZJR19ESVNBQkxFX1VOSU5TVEFMTEVEPSJ5ZXMiCmV4cG9y
dCBQU0VVRE9fRElTQUJMRUQ9IjEiCmV4cG9ydCBzeXN0ZW1kX3VuaXRkaXI9Ii9saWIvc3lzdGVt
ZCIKZXhwb3J0IFBBVENIX0dFVD0iMCIKZXhwb3J0IE5NPSJhcm0tbGludXgtZ251ZWFiaS1ubSIK
ZXhwb3J0IEY3Nz0iYXJtLWxpbnV4LWdudWVhYmktZzc3ICAtbWFyY2g9YXJtdjctYSAgICAgLW10
aHVtYi1pbnRlcndvcmsgLW1mbG9hdC1hYmk9c29mdGZwIC1tZnB1PW5lb24gLW10dW5lPWNvcnRl
eC1hMTUgLS1zeXNyb290PS9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNzZGsv
YnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vc3lzcm9vdHMva2V5c3Rv
bmUtZXZtIgpleHBvcnQgVVNFUj0iYTAyMjEwMDQiCmV4cG9ydCBMREZMQUdTPSItTC9ob21lL2Ew
MjIxMDA0L215SW5zdGFsbC9nY2MtbGluYXJvLWFybS1saW51eC1nbnVlYWJpLTIwMTIuMDMtMjAx
MjAzMjZfbGludXgvYXJtLWxpbnV4LWdudWVhYmkvbGliIC1XbCwtcnBhdGgtbGluaywvaG9tZS9h
MDIyMTAwNC9teUluc3RhbGwvZ2NjLWxpbmFyby1hcm0tbGludXgtZ251ZWFiaS0yMDEyLjAzLTIw
MTIwMzI2X2xpbnV4L2FybS1saW51eC1nbnVlYWJpL2xpYiAtV2wsLU8xIC1XbCwtLWhhc2gtc3R5
bGU9Z251IgpleHBvcnQgTUFLRT0ibWFrZSIKdW5zZXQgVEFSR0VUX0FSQ0gKZXhwb3J0IEJVSUxE
X0Y3Nz0iZzc3IgpleHBvcnQgQ0NBQ0hFX0RJUj0iL2hvbWUvYTAyMjEwMDQiCmV4cG9ydCBCVUlM
RF9DQ0xEPSJnY2MiCmV4cG9ydCBCVUlMRF9DUFA9ImNwcCIKZXhwb3J0IEJVSUxEX0NGTEFHUz0i
LWlzeXN0ZW0vaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2Fy
YWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91
c3IvaW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBpbmZvZGlyPSIvdXNyL3NoYXJlL2luZm8iCmV4
cG9ydCBURVJNPSJ4dGVybSIKZXhwb3J0IGJhc2Vfc2JpbmRpcj0iL3NiaW4iCmV4cG9ydCBQS0df
Q09ORklHX1NZU1JPT1RfRElSPSIvaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1j
c2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL2tl
eXN0b25lLWV2bSIKZXhwb3J0IFBLR19DT05GSUdfUEFUSD0iL2hvbWUvYTAyMjEwMDQveW9jdG8v
b2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xj
aGFpbi9zeXNyb290cy9rZXlzdG9uZS1ldm0vL3Vzci9saWIvcGtnY29uZmlnOi9ob21lL2EwMjIx
MDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxp
bmFyby10b29sY2hhaW4vc3lzcm9vdHMva2V5c3RvbmUtZXZtL3Vzci9zaGFyZS9wa2djb25maWci
CmV4cG9ydCBBUz0iYXJtLWxpbnV4LWdudWVhYmktYXMiCmV4cG9ydCBBUj0iYXJtLWxpbnV4LWdu
dWVhYmktYXIiCmV4cG9ydCBCVUlMRF9DUFBGTEFHUz0iLWlzeXN0ZW0vaG9tZS9hMDIyMTAwNC95
b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8t
dG9vbGNoYWluL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvaW5jbHVkZSIKZXhwb3J0IENQUD0i
YXJtLWxpbnV4LWdudWVhYmktZ2NjIC1FIC0tc3lzcm9vdD0vaG9tZS9hMDIyMTAwNC95b2N0by9v
ZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNo
YWluL3N5c3Jvb3RzL2tleXN0b25lLWV2bSAgLW1hcmNoPWFybXY3LWEgICAgIC1tdGh1bWItaW50
ZXJ3b3JrIC1tZmxvYXQtYWJpPXNvZnRmcCAtbWZwdT1uZW9uIC1tdHVuZT1jb3J0ZXgtYTE1Igpl
eHBvcnQgQ09ORklHX1NJVEU9Ii9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNz
ZGsvc291cmNlcy9tZXRhLW9wZW5lbWJlZGRlZC9tZXRhLW9lL3NpdGUvZW5kaWFuLWxpdHRsZSAv
aG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL3NvdXJjZXMvb2UtY29yZS9t
ZXRhL3NpdGUvZW5kaWFuLWxpdHRsZSAvaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVw
LW1jc2RrL3NvdXJjZXMvb2UtY29yZS9tZXRhL3NpdGUvYXJtLWNvbW1vbiAvaG9tZS9hMDIyMTAw
NC95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL3NvdXJjZXMvb2UtY29yZS9tZXRhL3NpdGUvY29t
bW9uLWxpbnV4IC9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNzZGsvc291cmNl
cy9vZS1jb3JlL21ldGEvc2l0ZS9jb21tb24tZ2xpYmMgL2hvbWUvYTAyMjEwMDQveW9jdG8vb2Ut
bGF5ZXJzZXR1cC1tY3Nkay9zb3VyY2VzL29lLWNvcmUvbWV0YS9zaXRlL2FybS1saW51eCAvaG9t
ZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL3NvdXJjZXMvb2UtY29yZS9tZXRh
L3NpdGUvY29tbW9uIC9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNzZGsvYnVp
bGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vc3lzcm9vdHMva2V5c3RvbmUt
ZXZtL3Vzci9zaGFyZS9hcm0tb2UtbGludXgtZ251ZWFiaV9jb25maWdfc2l0ZS5kL25jdXJzZXNf
Y29uZmlnIgpleHBvcnQgQlVJTERfQ1hYRkxBR1M9Ii1pc3lzdGVtL2hvbWUvYTAyMjEwMDQveW9j
dG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRv
b2xjaGFpbi9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2luY2x1ZGUgLU8yIC1waXBlIC1mcGVy
bWlzc2l2ZSIKZXhwb3J0IENDQUNIRV9ESVNBQkxFPSIxIgpleHBvcnQgSE9NRT0iL2hvbWUvYTAy
MjEwMDQiCmV4cG9ydCBUQVJHRVRfQ1BQRkxBR1M9Ii1pc3lzdGVtL2hvbWUvYTAyMjEwMDQvbXlJ
bnN0YWxsL2djYy1saW5hcm8tYXJtLWxpbnV4LWdudWVhYmktMjAxMi4wMy0yMDEyMDMyNl9saW51
eC9hcm0tbGludXgtZ251ZWFiaS9pbmNsdWRlICAtZnN0YWNrLXByb3RlY3RvciAtRF9GT1JUSUZZ
X1NPVVJDRT0xIgpleHBvcnQgZXhlY19wcmVmaXg9Ii91c3IiCmV4cG9ydCBDWFhGTEFHUz0iLWlz
eXN0ZW0vaG9tZS9hMDIyMTAwNC9teUluc3RhbGwvZ2NjLWxpbmFyby1hcm0tbGludXgtZ251ZWFi
aS0yMDEyLjAzLTIwMTIwMzI2X2xpbnV4L2FybS1saW51eC1nbnVlYWJpL2luY2x1ZGUgIC1mc3Rh
Y2stcHJvdGVjdG9yIC1EX0ZPUlRJRllfU09VUkNFPTEgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRl
LXVudXNlZC1kZWJ1Zy10eXBlcyAtZnBlcm1pc3NpdmUiCmV4cG9ydCBiYXNlX2xpYmRpcj0iL2xp
YiIKZXhwb3J0IExPR05BTUU9ImEwMjIxMDA0IgpleHBvcnQgUEFUSD0iL2hvbWUvYTAyMjEwMDQv
eW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9zb3VyY2VzL29lLWNvcmUvc2NyaXB0czovaG9tZS9h
MDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5h
bC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvYmluL2FybXY3YS12
ZnAtbmVvbi1vZS1saW51eC1nbnVlYWJpOi9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0
dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vc3lzcm9v
dHMva2V5c3RvbmUtZXZtL3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21lL2EwMjIxMDA0L3lvY3Rv
L29lLWxheWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29s
Y2hhaW4vc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9zYmluOi9ob21lL2EwMjIxMDA0L3lvY3Rv
L29lLWxheWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29s
Y2hhaW4vc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9iaW46L2hvbWUvYTAyMjEwMDQveW9jdG8v
b2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xj
aGFpbi9zeXNyb290cy94ODZfNjQtbGludXgvc2JpbjovaG9tZS9hMDIyMTAwNC95b2N0by9vZS1s
YXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWlu
L3N5c3Jvb3RzL3g4Nl82NC1saW51eC8vYmluOi9ob21lL2EwMjIxMDA0L215SW5zdGFsbC9nY2Mt
bGluYXJvLWFybS1saW51eC1nbnVlYWJpLTIwMTIuMDMtMjAxMjAzMjZfbGludXgvYmluOi9ob21l
L2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNzZGsvc291cmNlcy9vZS1jb3JlL3Njcmlw
dHM6L2hvbWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9zb3VyY2VzL2JpdGJh
a2UvYmluOi9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNzZGsvc291cmNlcy9v
ZS1jb3JlL3NjcmlwdHM6L2hvbWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9z
b3VyY2VzL2JpdGJha2UvYmluOi9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAvc291
cmNlcy9vZS1jb3JlL3NjcmlwdHM6L2hvbWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC9z
b3VyY2VzL2JpdGJha2UvYmluOi9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNz
ZGsvc291cmNlcy9vZS1jb3JlL3NjcmlwdHM6L2hvbWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJz
ZXR1cC1tY3Nkay9zb3VyY2VzL2JpdGJha2UvYmluOi91c3IvbG9jYWwvc2JpbjovdXNyL2xvY2Fs
L2JpbjovdXNyL3NiaW46L3Vzci9iaW46L3NiaW46L2JpbjovdXNyL2dhbWVzOi9ob21lL2EwMjIx
MDA0L215SW5zdGFsbC9nY2MtbGluYXJvLWFybS1saW51eC1nbnVlYWJpLTIwMTIuMDMtMjAxMjAz
MjZfbGludXgvYmluLyIKZXhwb3J0IFRBUkdFVF9DRkxBR1M9Ii1pc3lzdGVtL2hvbWUvYTAyMjEw
MDQvbXlJbnN0YWxsL2djYy1saW5hcm8tYXJtLWxpbnV4LWdudWVhYmktMjAxMi4wMy0yMDEyMDMy
Nl9saW51eC9hcm0tbGludXgtZ251ZWFiaS9pbmNsdWRlICAtZnN0YWNrLXByb3RlY3RvciAtRF9G
T1JUSUZZX1NPVVJDRT0xIC1PMiAtcGlwZSAtZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVidWctdHlw
ZXMiCnVuc2V0IE1BQ0hJTkUKZXhwb3J0IEJVSUxEX0FSPSJhciIKZXhwb3J0IEJVSUxEX0FTPSJh
cyIKZXhwb3J0IHNoYXJlZHN0YXRlZGlyPSIvY29tIgpleHBvcnQgT0JKRFVNUD0iYXJtLWxpbnV4
LWdudWVhYmktb2JqZHVtcCIKdW5zZXQgRElTVFJPCmV4cG9ydCBsaWJkaXI9Ii91c3IvbGliIgpl
eHBvcnQgZG9jZGlyPSIvdXNyL3NoYXJlL2RvYyIKZXhwb3J0IFNIRUxMPSIvYmluL2Jhc2giCmV4
cG9ydCBCVUlMRF9TVFJJUD0ic3RyaXAiCmV4cG9ydCBzeXNjb25mZGlyPSIvZXRjIgpkb19jb25m
aWd1cmUoKSB7CiAgICBhdXRvdG9vbHNfZG9fY29uZmlndXJlCgp9CgphdXRvdG9vbHNfZG9fY29u
ZmlndXJlKCkgewoJIyBXQVJOSU5HOiBncm9zcyBoYWNrIGZvbGxvd3M6CgkjIEFuIGF1dG90b29s
cyBidWlsdCBwYWNrYWdlIGdlbmVyYWxseSBuZWVkcyB0aGVzZSBzY3JpcHRzLCBob3dldmVyIG9u
bHkKCSMgYXV0b21ha2Ugb3IgbGlidG9vbGl6ZSBhY3R1YWxseSBpbnN0YWxsIHRoZSBjdXJyZW50
IHZlcnNpb25zIG9mIHRoZW0uCgkjIFRoaXMgaXMgYSBwcm9ibGVtIGluIGJ1aWxkcyB0aGF0IGRv
IG5vdCB1c2UgbGlidG9vbCBvciBhdXRvbWFrZSwgaW4gdGhlIGNhc2UKCSMgd2hlcmUgd2UgLW5l
ZWQtIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiB0aGVzZSBzY3JpcHRzLiAgZS5nLiBydW5uaW5nIGEg
YnVpbGQKCSMgZm9yIGEgcGFja2FnZSB3aG9zZSBhdXRvdG9vbHMgYXJlIG9sZCwgb24gYW4geDg2
XzY0IG1hY2hpbmUsIHdoaWNoIHRoZSBvbGQKCSMgY29uZmlnLnN1YiBkb2VzIG5vdCBzdXBwb3J0
LiAgV29yayBhcm91bmQgdGhpcyBieSBpbnN0YWxsaW5nIHRoZW0gbWFudWFsbHkKCSMgcmVnYXJk
bGVzcy4KCSggZm9yIGFjIGluIGBmaW5kIC9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0
dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vd29yay9h
cm12N2EtdmZwLW5lb24tb2UtbGludXgtZ251ZWFiaS92dHVuLTMuMC4zLXI1L3Z0dW4tMy4wLjMg
LW5hbWUgY29uZmlndXJlLmluIC1vIC1uYW1lIGNvbmZpZ3VyZS5hY2A7IGRvCgkJcm0gLWYgYGRp
cm5hbWUgJGFjYC9jb25maWd1cmUKCQlkb25lICkKCWlmIFsgLWUgL2hvbWUvYTAyMjEwMDQveW9j
dG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRv
b2xjaGFpbi93b3JrL2FybXY3YS12ZnAtbmVvbi1vZS1saW51eC1nbnVlYWJpL3Z0dW4tMy4wLjMt
cjUvdnR1bi0zLjAuMy9jb25maWd1cmUuaW4gLW8gLWUgL2hvbWUvYTAyMjEwMDQveW9jdG8vb2Ut
bGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xjaGFp
bi93b3JrL2FybXY3YS12ZnAtbmVvbi1vZS1saW51eC1nbnVlYWJpL3Z0dW4tMy4wLjMtcjUvdnR1
bi0zLjAuMy9jb25maWd1cmUuYWMgXTsgdGhlbgoJCW9sZGRpcj1gcHdkYAoJCWNkIC9ob21lL2Ew
MjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFs
LWxpbmFyby10b29sY2hhaW4vd29yay9hcm12N2EtdmZwLW5lb24tb2UtbGludXgtZ251ZWFiaS92
dHVuLTMuMC4zLXI1L3Z0dW4tMy4wLjMKCQkjIFJlbW92ZSBhbnkgcHJldmlvdXMgY29weSBvZiB0
aGUgbTQgbWFjcm9zCgkJcm0gLXJmIC9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAt
bWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vd29yay9hcm12
N2EtdmZwLW5lb24tb2UtbGludXgtZ251ZWFiaS92dHVuLTMuMC4zLXI1L3Z0dW4tMy4wLjMvYWNs
b2NhbC1jb3B5LwoJCWlmIFsgeCJkZWZhdWx0IiA9IHhkZWZhdWx0IF07IHRoZW4KCQkJYWNwYXRo
cz0KCQkJZm9yIGkgaW4gYGZpbmQgL2hvbWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1t
Y3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi93b3JrL2FybXY3
YS12ZnAtbmVvbi1vZS1saW51eC1nbnVlYWJpL3Z0dW4tMy4wLjMtcjUvdnR1bi0zLjAuMyAtbWF4
ZGVwdGggMiAtbmFtZSBcKi5tNHxncmVwIC12ICdhY2xvY2FsLm00J3wgXAoJCQkJZ3JlcCAtdiAn
YWNpbmNsdWRlLm00JyB8IHNlZCAtZSAncyxcKC4qL1wpLiokLFwxLCd8c29ydCAtdWA7IGRvCgkJ
CQlhY3BhdGhzPSIkYWNwYXRocyAtSSAkaSIKCQkJZG9uZQoJCWVsc2UKCQkJYWNwYXRocz0iZGVm
YXVsdCIKCQlmaQoJCUFVVE9WPWBhdXRvbWFrZSAtLXZlcnNpb24gfGhlYWQgLW4gMSB8c2VkICJz
Ly4qIC8vO3MvXC5bMC05XVwrJC8vImAKCQlhdXRvbWFrZSAtLXZlcnNpb24KCQllY2hvICJBVVRP
ViBpcyAkQVVUT1YiCgkJaWYgWyAtZCAvaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVw
LW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3Rz
L3g4Nl82NC1saW51eC91c3Ivc2hhcmUvYWNsb2NhbC0kQVVUT1YgXTsgdGhlbgoJCQlhY3BhdGhz
PSIkYWNwYXRocyAtSS9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNzZGsvYnVp
bGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vc3lzcm9vdHMveDg2XzY0LWxp
bnV4L3Vzci9zaGFyZS9hY2xvY2FsLSRBVVRPViIKCQlmaQoJCSMgVGhlIGFjbG9jYWwgZGlyZWN0
b3J5IGNvdWxkIGdldCBtb2RpZmllZCBieSBvdGhlciBwcm9jZXNzZXMKCQkjIHVuaW5zdGFsbGlu
ZyBkYXRhIGZyb20gdGhlIHN5c3Jvb3QuIFNlZSBZb2N0byAjODYxIGZvciBkZXRhaWxzLgoJCSMg
V2UgYXZvaWQgdGhpcyBieSB0YWtpbmcgYSBjb3B5IGhlcmUgYW5kIHRoZW4gZmlsZXMgY2Fubm90
IGRpc2FwcGVhci4KCQlpZiBbIC1kIC9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAt
bWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vc3lzcm9vdHMv
a2V5c3RvbmUtZXZtL3Vzci9zaGFyZS9hY2xvY2FsIF07IHRoZW4KCQkJIyBmb3Igc2NyYXRjaCBi
dWlsZCB0aGlzIGRpcmVjdG9yeSBjYW4gYmUgZW1wdHkKCQkJIyBzbyBhdm9pZCBjcCdzIG5vIGZp
bGVzIHRvIGNvcHkgZXJyb3IKCQkJY3Atbm9lcnJvciAvaG9tZS9hMDIyMTAwNC95b2N0by9vZS1s
YXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWlu
L3N5c3Jvb3RzL2tleXN0b25lLWV2bS91c3Ivc2hhcmUvYWNsb2NhbCAvaG9tZS9hMDIyMTAwNC95
b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8t
dG9vbGNoYWluL3dvcmsvYXJtdjdhLXZmcC1uZW9uLW9lLWxpbnV4LWdudWVhYmkvdnR1bi0zLjAu
My1yNS92dHVuLTMuMC4zL2FjbG9jYWwtY29weS8KCQkJYWNwYXRocz0iJGFjcGF0aHMgLUkgL2hv
bWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0
ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi93b3JrL2FybXY3YS12ZnAtbmVvbi1vZS1saW51eC1nbnVl
YWJpL3Z0dW4tMy4wLjMtcjUvdnR1bi0zLjAuMy9hY2xvY2FsLWNvcHkvIgoJCWZpCgkJIyBhdXRv
cmVjb25mIGlzIHRvbyBzaHkgdG8gb3ZlcndyaXRlIGFjbG9jYWwubTQgaWYgaXQgZG9lc24ndCBs
b29rCgkJIyBsaWtlIGl0IHdhcyBhdXRvLWdlbmVyYXRlZC4gIFdvcmsgYXJvdW5kIHRoaXMgYnkg
Ymxvd2luZyBpdCBhd2F5CgkJIyBieSBoYW5kLCB1bmxlc3MgdGhlIHBhY2thZ2Ugc3BlY2lmaWNh
bGx5IGFza2VkIG5vdCB0byBydW4gYWNsb2NhbC4KCQlpZiAhIGVjaG8gLS1leGNsdWRlPWF1dG9w
b2ludCB8IGdyZXAgLXEgImFjbG9jYWwiOyB0aGVuCgkJCXJtIC1mIGFjbG9jYWwubTQKCQlmaQoJ
CWlmIFsgLWUgY29uZmlndXJlLmluIF07IHRoZW4KCQkJQ09ORklHVVJFX0FDPWNvbmZpZ3VyZS5p
bgoJCWVsc2UKCQkJQ09ORklHVVJFX0FDPWNvbmZpZ3VyZS5hYwoJCWZpCgkJaWYgISBlY2hvICAg
ICAgICAgICAgICAgICAgLS13aXRoLWx6by1oZWFkZXJzPS9ob21lL2EwMjIxMDA0L3lvY3RvL29l
LWxheWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hh
aW4vc3lzcm9vdHMva2V5c3RvbmUtZXZtL3Vzci9pbmNsdWRlL2x6byAgICAgICAgICAgICAgICAg
LS13aXRoLWx6by1saWI9L2hvbWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9i
dWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi9zeXNyb290cy9rZXlzdG9u
ZS1ldm0vdXNyL2xpYiAgICAgICAgICAgICAgICAgLS13aXRoLXNzbC1oZWFkZXJzPS9ob21lL2Ew
MjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFs
LWxpbmFyby10b29sY2hhaW4vc3lzcm9vdHMva2V5c3RvbmUtZXZtL3Vzci9pbmNsdWRlL29wZW5z
c2wgICAgICAgICAgICAgICAgIC0td2l0aC1zc2wtbGliPS9ob21lL2EwMjIxMDA0L3lvY3RvL29l
LWxheWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hh
aW4vc3lzcm9vdHMva2V5c3RvbmUtZXZtL3Vzci9saWIgfCBncmVwIC1xICJcLVwtZGlzYWJsZS1u
bHMiOyB0aGVuCgkJCWlmIGdyZXAgIl5bWzpzcGFjZTpdXSpBTV9HTElCX0dOVV9HRVRURVhUIiAk
Q09ORklHVVJFX0FDID4vZGV2L251bGw7IHRoZW4KCQkJCWlmIGdyZXAgInNlZC4qUE9URklMRVMi
ICRDT05GSUdVUkVfQUMgPi9kZXYvbnVsbDsgdGhlbgoJCQkJCTogZG8gbm90aGluZyAtLSB3ZSBz
dGlsbCBoYXZlIGFuIG9sZCB1bm1vZGlmaWVkIGNvbmZpZ3VyZS5hYwoJCSAgICAJCWVsc2UKCQkJ
CQliYm5vdGUgRXhlY3V0aW5nIGdsaWItZ2V0dGV4dGl6ZSAtLWZvcmNlIC0tY29weQoJCQkJCWVj
aG8gIm5vIiB8IGdsaWItZ2V0dGV4dGl6ZSAtLWZvcmNlIC0tY29weQoJCQkJZmkKCQkJZWxzZSBp
ZiBncmVwICJeW1s6c3BhY2U6XV0qQU1fR05VX0dFVFRFWFQiICRDT05GSUdVUkVfQUMgPi9kZXYv
bnVsbDsgdGhlbgoJCQkJIyBXZSdkIGNhbGwgZ2V0dGV4dGl6ZSBoZXJlIGlmIGl0IHdhc24ndCBz
byBicm9rZW4uLi4KCQkJCQljcCAvaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1j
c2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL2tl
eXN0b25lLWV2bS91c3Ivc2hhcmUvZ2V0dGV4dC9jb25maWcucnBhdGggL2hvbWUvYTAyMjEwMDQv
eW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJv
LXRvb2xjaGFpbi93b3JrL2FybXY3YS12ZnAtbmVvbi1vZS1saW51eC1nbnVlYWJpL3Z0dW4tMy4w
LjMtcjUvdnR1bi0zLjAuMy8KCQkJCQlpZiBbIC1kIC9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxh
eWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4v
d29yay9hcm12N2EtdmZwLW5lb24tb2UtbGludXgtZ251ZWFiaS92dHVuLTMuMC4zLXI1L3Z0dW4t
My4wLjMvcG8vIC1hICEgLWUgL2hvbWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nk
ay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi93b3JrL2FybXY3YS12
ZnAtbmVvbi1vZS1saW51eC1nbnVlYWJpL3Z0dW4tMy4wLjMtcjUvdnR1bi0zLjAuMy9wby9NYWtl
ZmlsZS5pbi5pbiBdOyB0aGVuCgkJCQkJCWNwIC9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVy
c2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vc3lz
cm9vdHMva2V5c3RvbmUtZXZtL3Vzci9zaGFyZS9nZXR0ZXh0L3BvL01ha2VmaWxlLmluLmluIC9o
b21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4
dGVybmFsLWxpbmFyby10b29sY2hhaW4vd29yay9hcm12N2EtdmZwLW5lb24tb2UtbGludXgtZ251
ZWFiaS92dHVuLTMuMC4zLXI1L3Z0dW4tMy4wLjMvcG8vCgkJCQkJZmkKCQkJCWZpCgkJCWZpCgkJ
ZmkKCQlta2RpciAtcCBtNAoJCWlmIGdyZXAgIl5bWzpzcGFjZTpdXSpbQUldW0NUXV9QUk9HX0lO
VExUT09MIiAkQ09ORklHVVJFX0FDID4vZGV2L251bGw7IHRoZW4KCQkJYmJub3RlIEV4ZWN1dGlu
ZyBpbnRsdG9vbGl6ZSAtLWNvcHkgLS1mb3JjZSAtLWF1dG9tYWtlCgkJCWludGx0b29saXplIC0t
Y29weSAtLWZvcmNlIC0tYXV0b21ha2UKCQlmaQoJCWJibm90ZSBFeGVjdXRpbmcgYXV0b3JlY29u
ZiAtLXZlcmJvc2UgLS1pbnN0YWxsIC0tZm9yY2UgLS1leGNsdWRlPWF1dG9wb2ludCAkYWNwYXRo
cwoJCWF1dG9yZWNvbmYgLVdjcm9zcyAtLXZlcmJvc2UgLS1pbnN0YWxsIC0tZm9yY2UgLS1leGNs
dWRlPWF1dG9wb2ludCAkYWNwYXRocyB8fCBiYmZhdGFsICJhdXRvcmVjb25mIGV4ZWN1dGlvbiBm
YWlsZWQuIgoJCWNkICRvbGRkaXIKCWZpCglpZiBbIC1lIC9ob21lL2EwMjIxMDA0L3lvY3RvL29l
LWxheWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hh
aW4vd29yay9hcm12N2EtdmZwLW5lb24tb2UtbGludXgtZ251ZWFiaS92dHVuLTMuMC4zLXI1L3Z0
dW4tMy4wLjMvY29uZmlndXJlIF07IHRoZW4KCQlvZV9ydW5jb25mCgllbHNlCgkJYmJub3RlICJu
b3RoaW5nIHRvIGNvbmZpZ3VyZSIKCWZpCgp9CgpiYmZhdGFsKCkgewoJZWNobyAiRVJST1I6ICQq
IgoJZXhpdCAxCgp9CgpiYm5vdGUoKSB7CgllY2hvICJOT1RFOiAkKiIKCn0KCm9lX3J1bmNvbmYo
KSB7CgljZmdzY3JpcHQ9Ii9ob21lL2EwMjIxMDA0L3lvY3RvL29lLWxheWVyc2V0dXAtbWNzZGsv
YnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vd29yay9hcm12N2EtdmZw
LW5lb24tb2UtbGludXgtZ251ZWFiaS92dHVuLTMuMC4zLXI1L3Z0dW4tMy4wLjMvY29uZmlndXJl
IgoJaWYgWyAteCAiJGNmZ3NjcmlwdCIgXSA7IHRoZW4KCQliYm5vdGUgIlJ1bm5pbmcgJGNmZ3Nj
cmlwdCAgLS1idWlsZD14ODZfNjQtbGludXggCQkgIC0taG9zdD1hcm0tb2UtbGludXgtZ251ZWFi
aSAJCSAgLS10YXJnZXQ9YXJtLW9lLWxpbnV4LWdudWVhYmkgCQkgIC0tcHJlZml4PS91c3IgCQkg
IC0tZXhlY19wcmVmaXg9L3VzciAJCSAgLS1iaW5kaXI9L3Vzci9iaW4gCQkgIC0tc2JpbmRpcj0v
dXNyL3NiaW4gCQkgIC0tbGliZXhlY2Rpcj0vdXNyL2xpYmV4ZWMgCQkgIC0tZGF0YWRpcj0vdXNy
L3NoYXJlIAkJICAtLXN5c2NvbmZkaXI9L2V0YyAJCSAgLS1zaGFyZWRzdGF0ZWRpcj0vY29tIAkJ
ICAtLWxvY2Fsc3RhdGVkaXI9L3ZhciAJCSAgLS1saWJkaXI9L3Vzci9saWIgCQkgIC0taW5jbHVk
ZWRpcj0vdXNyL2luY2x1ZGUgCQkgIC0tb2xkaW5jbHVkZWRpcj0vdXNyL2luY2x1ZGUgCQkgIC0t
aW5mb2Rpcj0vdXNyL3NoYXJlL2luZm8gCQkgIC0tbWFuZGlyPS91c3Ivc2hhcmUvbWFuIAkJICAt
LWRpc2FibGUtc2lsZW50LXJ1bGVzIAkJICAtLWRpc2FibGUtZGVwZW5kZW5jeS10cmFja2luZyAJ
CSAgLS13aXRoLWxpYnRvb2wtc3lzcm9vdD0vaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNl
dHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jv
b3RzL2tleXN0b25lLWV2bSAgICAgICAgICAgICAgICAgIC0td2l0aC1sem8taGVhZGVycz0vaG9t
ZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRl
cm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL2tleXN0b25lLWV2bS91c3IvaW5jbHVkZS9s
em8gICAgICAgICAgICAgICAgIC0td2l0aC1sem8tbGliPS9ob21lL2EwMjIxMDA0L3lvY3RvL29l
LWxheWVyc2V0dXAtbWNzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hh
aW4vc3lzcm9vdHMva2V5c3RvbmUtZXZtL3Vzci9saWIgICAgICAgICAgICAgICAgIC0td2l0aC1z
c2wtaGVhZGVycz0vaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL2J1aWxk
L2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL2tleXN0b25lLWV2
bS91c3IvaW5jbHVkZS9vcGVuc3NsICAgICAgICAgICAgICAgICAtLXdpdGgtc3NsLWxpYj0vaG9t
ZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRl
cm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL2tleXN0b25lLWV2bS91c3IvbGliICRAIgoJ
CXNldCArZQoJCSR7Q0FDSEVEX0NPTkZJR1VSRVZBUlN9ICRjZmdzY3JpcHQgIC0tYnVpbGQ9eDg2
XzY0LWxpbnV4IAkJICAtLWhvc3Q9YXJtLW9lLWxpbnV4LWdudWVhYmkgCQkgIC0tdGFyZ2V0PWFy
bS1vZS1saW51eC1nbnVlYWJpIAkJICAtLXByZWZpeD0vdXNyIAkJICAtLWV4ZWNfcHJlZml4PS91
c3IgCQkgIC0tYmluZGlyPS91c3IvYmluIAkJICAtLXNiaW5kaXI9L3Vzci9zYmluIAkJICAtLWxp
YmV4ZWNkaXI9L3Vzci9saWJleGVjIAkJICAtLWRhdGFkaXI9L3Vzci9zaGFyZSAJCSAgLS1zeXNj
b25mZGlyPS9ldGMgCQkgIC0tc2hhcmVkc3RhdGVkaXI9L2NvbSAJCSAgLS1sb2NhbHN0YXRlZGly
PS92YXIgCQkgIC0tbGliZGlyPS91c3IvbGliIAkJICAtLWluY2x1ZGVkaXI9L3Vzci9pbmNsdWRl
IAkJICAtLW9sZGluY2x1ZGVkaXI9L3Vzci9pbmNsdWRlIAkJICAtLWluZm9kaXI9L3Vzci9zaGFy
ZS9pbmZvIAkJICAtLW1hbmRpcj0vdXNyL3NoYXJlL21hbiAJCSAgLS1kaXNhYmxlLXNpbGVudC1y
dWxlcyAJCSAgLS1kaXNhYmxlLWRlcGVuZGVuY3ktdHJhY2tpbmcgCQkgIC0td2l0aC1saWJ0b29s
LXN5c3Jvb3Q9L2hvbWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9h
cmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi9zeXNyb290cy9rZXlzdG9uZS1ldm0g
ICAgICAgICAgICAgICAgICAtLXdpdGgtbHpvLWhlYWRlcnM9L2hvbWUvYTAyMjEwMDQveW9jdG8v
b2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xj
aGFpbi9zeXNyb290cy9rZXlzdG9uZS1ldm0vdXNyL2luY2x1ZGUvbHpvICAgICAgICAgICAgICAg
ICAtLXdpdGgtbHpvLWxpYj0vaG9tZS9hMDIyMTAwNC95b2N0by9vZS1sYXllcnNldHVwLW1jc2Rr
L2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3N5c3Jvb3RzL2tleXN0
b25lLWV2bS91c3IvbGliICAgICAgICAgICAgICAgICAtLXdpdGgtc3NsLWhlYWRlcnM9L2hvbWUv
YTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJu
YWwtbGluYXJvLXRvb2xjaGFpbi9zeXNyb290cy9rZXlzdG9uZS1ldm0vdXNyL2luY2x1ZGUvb3Bl
bnNzbCAgICAgICAgICAgICAgICAgLS13aXRoLXNzbC1saWI9L2hvbWUvYTAyMjEwMDQveW9jdG8v
b2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xj
aGFpbi9zeXNyb290cy9rZXlzdG9uZS1ldm0vdXNyL2xpYiAiJEAiCgkJaWYgWyAiJD8iICE9ICIw
IiBdOyB0aGVuCgkJCWVjaG8gIkNvbmZpZ3VyZSBmYWlsZWQuIFRoZSBjb250ZW50cyBvZiBhbGwg
Y29uZmlnLmxvZyBmaWxlcyBmb2xsb3dzIHRvIGFpZCBkZWJ1Z2dpbmciCgkJCWZpbmQgL2hvbWUv
YTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9hcmFnby10bXAtZXh0ZXJu
YWwtbGluYXJvLXRvb2xjaGFpbi93b3JrL2FybXY3YS12ZnAtbmVvbi1vZS1saW51eC1nbnVlYWJp
L3Z0dW4tMy4wLjMtcjUvdnR1bi0zLjAuMyAtbmFtZSBjb25maWcubG9nIC1wcmludCAtZXhlYyBj
YXQge30gXDsKCQkJYmJmYXRhbCAib2VfcnVuY29uZiBmYWlsZWQiCgkJZmkKCQlzZXQgLWUKCWVs
c2UKCQliYmZhdGFsICJubyBjb25maWd1cmUgc2NyaXB0IGZvdW5kIGF0ICRjZmdzY3JpcHQiCglm
aQoKfQoKY2QgL2hvbWUvYTAyMjEwMDQveW9jdG8vb2UtbGF5ZXJzZXR1cC1tY3Nkay9idWlsZC9h
cmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi93b3JrL2FybXY3YS12ZnAtbmVvbi1v
ZS1saW51eC1nbnVlYWJpL3Z0dW4tMy4wLjMtcjUvdnR1bi0zLjAuMwpkb19jb25maWd1cmUK

--_005_3C08AEEB3C731745938BC83D029FE5E391A896DFLE09entticom_--
