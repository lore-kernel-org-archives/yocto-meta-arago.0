Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B375052972
	for <meta-arago@arago-project.org>;
	Thu, 25 Jul 2013 16:45:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6PGjugW005759
	for <meta-arago@arago-project.org>; Thu, 25 Jul 2013 11:45:56 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6PGjuvD015160
	for <meta-arago@arago-project.org>; Thu, 25 Jul 2013 11:45:56 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 25 Jul 2013 11:45:56 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Help needed: Issues wtih applications using shared library
Thread-Index: Ac6JVc4wz0VWQ8XMQnG48BGqqOYNEw==
Date: Thu, 25 Jul 2013 16:45:55 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905493CA66@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Help needed: Issues wtih applications using shared library
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
X-List-Received-Date: Thu, 25 Jul 2013 16:45:56 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4F9216F96E5DF9428610502835A9F4905493CA66DLEE11entticom_"

--_000_4F9216F96E5DF9428610502835A9F4905493CA66DLEE11entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello All,
We are running into issues with application running shared application look=
ing for the *.so file.
The file system only has the *.so.1, *.so.1.0 files. ( with the major and m=
inor versions).

netfpproxy.out -p /usr/lib/netfp_proxy/plugins/netfpproxy_plugin.so -d 10 -=
v
netfpproxy.out: error while loading shared libraries: libnl-xfrm.so: cannot=
 open shared object file: No such file o
r directory

I am pretty new to this. Any ideas on what may be wrong here is appreciated=
?
With regards,
Sam

--_000_4F9216F96E5DF9428610502835A9F4905493CA66DLEE11entticom_
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
<p class=3D"MsoNormal">Hello All,<o:p></o:p></p>
<p class=3D"MsoNormal">We are running into issues with application running =
shared application looking for the *.so file.<o:p></o:p></p>
<p class=3D"MsoNormal">The file system only has the *.so.1, *.so.1.0 files.=
 ( with the major and minor versions).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">netfpproxy.out -p /usr/lib/netfp_proxy/plugins/netfp=
proxy_plugin.so -d 10 -v<o:p></o:p></p>
<p class=3D"MsoNormal">netfpproxy.out: error while loading shared libraries=
: libnl-xfrm.so: cannot open shared object file: No such file o<o:p></o:p><=
/p>
<p class=3D"MsoNormal">r directory<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am pretty new to this. Any ideas on what may be wr=
ong here is appreciated?<o:p></o:p></p>
<p class=3D"MsoNormal">With regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Sam<o:p></o:p></p>
</div>
</body>
</html>

--_000_4F9216F96E5DF9428610502835A9F4905493CA66DLEE11entticom_--
