Return-Path: <nikhil.nd@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9403152A75
	for <meta-arago@arago-project.org>;
	Fri, 14 Nov 2014 13:02:15 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAED2D7c023117
	for <meta-arago@arago-project.org>; Fri, 14 Nov 2014 07:02:14 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAED2BeD024598
	for <meta-arago@arago-project.org>; Fri, 14 Nov 2014 18:32:12 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0174.001; Fri, 14 Nov 2014 18:32:10 +0530
From: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Applying non local patches
Thread-Index: AdAACzIpnhwplHN0R0WucZIJ8z5Gzg==
Date: Fri, 14 Nov 2014 13:02:09 +0000
Message-ID: <E60A9E1B4132A24DB80BD56ABC926847D2DB79@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Applying non local patches
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
X-List-Received-Date: Fri, 14 Nov 2014 13:02:16 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_E60A9E1B4132A24DB80BD56ABC926847D2DB79DBDE04entticom_"

--_000_E60A9E1B4132A24DB80BD56ABC926847D2DB79DBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,
Does yocto support applying patches which are under review
It is possible to download the patch and add it to the recipe along with th=
e actual patch file

But  is there another way where we can point to the patches in the SRC_URI =
itself

Something similar to

SRC_URI=3D "git:git.fredesktop.org/project/repo.git;protocol=3Dgit \
      http://patchwork.freedesktop/project/repo/12345/raw;protocol=3Dhttp \
"
Are there any examples of such reciepes
Please help

Thanks and regards,
Nikhil Devshatwar


--_000_E60A9E1B4132A24DB80BD56ABC926847D2DB79DBDE04entticom_
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal">Does yocto support applying patches which are under =
review<o:p></o:p></p>
<p class=3D"MsoNormal">It is possible to download the patch and add it to t=
he recipe along with the actual patch file<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But&nbsp; is there another way where we can point to=
 the patches in the SRC_URI itself<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Something similar to <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">SRC_URI=3D &#8220;git:git.fredesktop.org/project/rep=
o.git;protocol=3Dgit \<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; http://patchwork.freedesktop/project/repo/12345/raw;protocol=3Dhttp \=
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal">Are there any examples of such reciepes<o:p></o:p></=
p>
<p class=3D"MsoNormal">Please help<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#4A442A">Thanks and regards,<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#4A442A">Nikhil Devshatwar<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_E60A9E1B4132A24DB80BD56ABC926847D2DB79DBDE04entticom_--
