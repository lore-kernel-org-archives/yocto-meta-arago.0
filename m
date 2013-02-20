Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5A1D852A86
	for <meta-arago@arago-project.org>;
	Wed, 20 Feb 2013 15:09:20 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1KF9IEr004554
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2013 09:09:18 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1KF9INw007929
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2013 09:09:18 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 20 Feb 2013 09:09:18 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: vtun recipe review
Thread-Index: Ac4OTAg8qENO/MmZQnmLRfSnfHYCtAAAJlMAACULiSAAJr4TkA==
Date: Wed, 20 Feb 2013 15:09:17 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C39775B@DFLE09.ent.ti.com>
References: <3C08AEEB3C731745938BC83D029FE5E391A1A4@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C395340@DFLE09.ent.ti.com>
	<3C08AEEB3C731745938BC83D029FE5E391A3CE@DFLE09.ent.ti.com>
In-Reply-To: <3C08AEEB3C731745938BC83D029FE5E391A3CE@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
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
X-List-Received-Date: Wed, 20 Feb 2013 15:09:21 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C39775BDFLE09entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C39775BDFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please attach the log.do_compile, log.do_configure, run.do_compile and run.=
do_configure files.

From: Zhou, Jingting
Sent: Tuesday, February 19, 2013 2:55 PM
To: Cooper Jr., Franklin; meta-arago@arago-project.org
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

--_000_8F29D6B095ED194EA1980491A5E029710C39775BDFLE09entticom_
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
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
<b>To:</b> Cooper Jr., Franklin; meta-arago@arago-project.org<br>
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

--_000_8F29D6B095ED194EA1980491A5E029710C39775BDFLE09entticom_--
