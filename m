Return-Path: <sajesh@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EF4B1529A2
	for <meta-arago@arago-project.org>;
	Wed,  4 Sep 2013 17:33:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r84HXWG6003596
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2013 12:33:32 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r84HXWkW009237
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2013 12:33:32 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 4 Sep 2013 12:33:32 -0500
From: "Saran, Sajesh Kumar" <sajesh@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: QA issue while packaging DSP images
Thread-Index: Ac6plE6wLgbJ9m7+T4+DDsOoAhGmUQ==
Date: Wed, 4 Sep 2013 17:33:32 +0000
Message-ID: <8EAE6244CE843044A42356038645C85515771EE7@DFLE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: QA issue while packaging DSP images
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
X-List-Received-Date: Wed, 04 Sep 2013 17:33:35 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8EAE6244CE843044A42356038645C85515771EE7DFLE12entticom_"

--_000_8EAE6244CE843044A42356038645C85515771EE7DFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am getting QA issue when I try to package DSP images in /lib/firmware dir=
ectory.

In the recipe I have added following

INHIBIT_PACKAGE_STRIP =3D "1"
INSANE_SKIP_${PN} =3D "True"
FILES_${PN}_append =3D "${base_libdir}"
FILES_${PN} +=3D "${base_libdir}/firmware"
FILES_${PN} +=3D "${base_libdir}/firmware/dsp-core0.out"
FILES_${PN} +=3D "${base_libdir}/firmware/dsp-core1.out"
FILES_${PN} +=3D "${base_libdir}/firmware/dsp-core2.out"
FILES_${PN} +=3D "${base_libdir}/firmware/dsp-core3.out"

I see following error in the log
NOTE: DO PACKAGE QA
NOTE: Checking Package: ti-tci6614-remoteproc-dbg
NOTE: Checking Package: ti-tci6614-remoteproc-staticdev
NOTE: Checking Package: ti-tci6614-remoteproc-dev
NOTE: Checking Package: ti-tci6614-remoteproc-doc
NOTE: Checking Package: ti-tci6614-remoteproc-locale
NOTE: Package ti-tci6614-remoteproc skipping QA tests: ['True']
NOTE: Checking Package: ti-tci6614-remoteproc
ERROR: QA Issue: Architecture did not match (40 to 140) on /work/armv7ahf-v=
fp-neon-oe-linux-gnueabi/ti-tci6614-remoteproc-1.0-r1/packages-split/ti-tci=
6614-remoteproc/lib/firmware/dsp-core0.out
ERROR: QA run found fatal errors. Please consider fixing them.
DEBUG: Python function do_package_qa finished

Is there any other flags to suppress this check?

Regards,
Sajesh


--_000_8EAE6244CE843044A42356038645C85515771EE7DFLE12entticom_
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
	{font-family:"Courrier New";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am getting QA issue when I try to package DSP imag=
es in /lib/firmware directory.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the recipe I have added following<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">INHIBIT_PACKAGE_STRIP =3D &quot;1&quot; <o:p></o:p><=
/p>
<p class=3D"MsoNormal">INSANE_SKIP_${PN} =3D &quot;True&quot;<o:p></o:p></p=
>
<p class=3D"MsoNormal">FILES_${PN}_append =3D &quot;${base_libdir}&quot;<o:=
p></o:p></p>
<p class=3D"MsoNormal">FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware&q=
uot;<o:p></o:p></p>
<p class=3D"MsoNormal">FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware/d=
sp-core0.out&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware/d=
sp-core1.out&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware/d=
sp-core2.out&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware/d=
sp-core3.out&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I see following error in the log<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Courrier New&quot;">NOTE: DO PACKAGE QA<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Courrier New&quot;">NOTE: Checking Package: ti-t=
ci6614-remoteproc-dbg<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Courrier New&quot;">NOTE: Checking Package: ti-t=
ci6614-remoteproc-staticdev<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Courrier New&quot;">NOTE: Checking Package: ti-t=
ci6614-remoteproc-dev<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Courrier New&quot;">NOTE: Checking Package: ti-t=
ci6614-remoteproc-doc<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Courrier New&quot;">NOTE: Checking Package: ti-t=
ci6614-remoteproc-locale<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Courrier New&quot;">NOTE: Package ti-tci6614-rem=
oteproc skipping QA tests: ['True']<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Courrier New&quot;">NOTE: Checking Package: ti-t=
ci6614-remoteproc<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Courrier New&quot;">ERROR: QA Issue: Architectur=
e did not match (40 to 140) on /work/armv7ahf-vfp-neon-oe-linux-gnueabi/ti-=
tci6614-remoteproc-1.0-r1/packages-split/ti-tci6614-remoteproc/lib/firmware=
/dsp-core0.out<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Courrier New&quot;">ERROR: QA run found fatal er=
rors. Please consider fixing them.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Courrier New&quot;">DEBUG: Python function do_pa=
ckage_qa finished<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there any other flags to suppress this check?<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Sajesh<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_8EAE6244CE843044A42356038645C85515771EE7DFLE12entticom_--
