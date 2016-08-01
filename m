Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 60D2852A5F
	for <meta-arago@arago-project.org>;
	Mon,  1 Aug 2016 10:52:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u71AqcmN018752
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 05:52:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u71AqcL1028926
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 05:52:38 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Mon, 1 Aug 2016 05:52:37 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: gstreamer 1.6: bad plugins
Thread-Index: AdHr4hiQQHFXgrANQXCjU+yWeIjpqw==
Date: Mon, 1 Aug 2016 10:52:36 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958142EFC43@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "R, Karthik" <karthik.ramanan@ti.com>
Subject: gstreamer 1.6: bad plugins
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
X-List-Received-Date: Mon, 01 Aug 2016 10:52:39 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4B26FB5A64EBA14C87266869E037F958142EFC43DFLE09entticom_"

--_000_4B26FB5A64EBA14C87266869E037F958142EFC43DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Karthik, Denys,

We are seeing a failure with building the gstreamer1.0-plugins-bad for k2 s=
ince upgrading to 1.6.

In file included from ../../../../git/gst-libs/gst/drm/gstdrmallocator.c:32=
:0:
../../../../git/gst-libs/gst/drm/gstdrmallocator.h:39:21: fatal error: xf86=
drm.h: No such file or directory
compilation terminated.
Makefile:866: recipe for target 'libgstdrm_1.0_la-gstdrmallocator.lo' faile=
d
make[4]: *** [libgstdrm_1.0_la-gstdrmallocator.lo] Error 1
make[4]: Leaving directory '/home/gtbldadm/processor-sdk-linux-krogoth-buil=
d/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/k2hk_evm-linux-gn=
ueabi/gstreamer1.0-plugins-bad/1.6.3-r20/build/gst-libs/gst/drm'
Makefile:1050: recipe for target 'drm' failed


This appears to be related to http://git.ti.com/glsdk/gstreamer1-0-plugins-=
bad/commit/04ee4d353888a210c5ee5792ff402eb8c3d3e6e4. Is there a config opti=
on to disable the drm allocator?

I am also curious as to why we are using different versions of these plugin=
s for ti33x and ti43x. Should k2 also use that commit? I am referring to th=
e lines in gstreamer1.0-plugins-bad_git.bbappend:

  38 SRCREV =3D "f0694b5fcec997036ef7df4d382b28e833c8ebfd"
  39 SRCREV_ti43x =3D "d0160ca810be30bf2b2e7681f5047933402efb52"
  40 SRCREV_ti33x =3D "d0160ca810be30bf2b2e7681f5047933402efb52"


Thank you,
Jake

--_000_4B26FB5A64EBA14C87266869E037F958142EFC43DFLE09entticom_
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
<p class=3D"MsoNormal">Karthik, Denys,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are seeing a failure with building the gstreamer1=
.0-plugins-bad for k2 since upgrading to 1.6.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">In file included from ../../../../git/gst-libs/gst/drm/gst=
drmallocator.c:32:0:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">../../../../git/gst-libs/gst/drm/gstdrmallocator.h:39:21: =
fatal error: xf86drm.h: No such file or directory<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">compilation terminated.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Makefile:866: recipe for target 'libgstdrm_1.0_la-gstdrmal=
locator.lo' failed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">make[4]: *** [libgstdrm_1.0_la-gstdrmallocator.lo] Error 1=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">make[4]: Leaving directory '/home/gtbldadm/processor-sdk-l=
inux-krogoth-build/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/=
k2hk_evm-linux-gnueabi/gstreamer1.0-plugins-bad/1.6.3-r20/build/gst-libs/gs=
t/drm'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Makefile:1050: recipe for target 'drm' failed<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This appears to be related to <a href=3D"http://git.=
ti.com/glsdk/gstreamer1-0-plugins-bad/commit/04ee4d353888a210c5ee5792ff402e=
b8c3d3e6e4">
http://git.ti.com/glsdk/gstreamer1-0-plugins-bad/commit/04ee4d353888a210c5e=
e5792ff402eb8c3d3e6e4</a>. Is there a config option to disable the drm allo=
cator?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am also curious as to why we are using different v=
ersions of these plugins for ti33x and ti43x. Should k2 also use that commi=
t? I am referring to the lines in gstreamer1.0-plugins-bad_git.bbappend:<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; 38 SRCREV =3D &quot;f0694b5fcec997036ef7df4d3=
82b28e833c8ebfd&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; 39 SRCREV_ti43x =3D &quot;d0160ca810be30bf2b2=
e7681f5047933402efb52&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; 40 SRCREV_ti33x =3D &quot;d0160ca810be30bf2b2=
e7681f5047933402efb52&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you,<o:p></o:p></p>
<p class=3D"MsoNormal">Jake<o:p></o:p></p>
</div>
</body>
</html>

--_000_4B26FB5A64EBA14C87266869E037F958142EFC43DFLE09entticom_--
