Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3EFC452A49
	for <meta-arago@arago-project.org>;
	Mon, 29 Jun 2020 08:20:58 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05T8IK3h087339
	for <meta-arago@arago-project.org>; Mon, 29 Jun 2020 03:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593418700;
	bh=JMMj8PxdI4X4mOXhyDqo39cLXIkRmq66gnnPrVjxQlg=;
	h=From:To:CC:Subject:Date;
	b=R6iYscrbd/1vecAxE8hgaIwkVCPw3hCcA3o8b7rqQ+JifTDBGKYITQ/c7aYyn0iwg
	VK4uiHiTFxsZRR2xH81Pw2PD02vERSRkWdTAIDJpI3Eg8RO9PC9rgz0ZvI5D5ug7iD
	wcaVik3blJ0og9XulSzu+TiuMS8a6hKcs8azDn3c=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05T8IKkw011524
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 29 Jun 2020 03:18:20 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 29 Jun 2020 03:18:20 -0500
Received: from DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb]) by
	DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb%17]) with mapi id
	15.01.1979.003; Mon, 29 Jun 2020 03:18:20 -0500
From: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Rao, Praveen" <prao@ti.com>,
	"Stiffler, Jacob" <j-stiffler@ti.com>, "Robey, Caleb" <c-robey@ti.com>
Thread-Topic: bitbake mtd-utils Fetch failure
Thread-Index: AdZN7bl+tIroAE1HSDKW0wYkS7xaAQ==
Date: Mon, 29 Jun 2020 08:18:20 +0000
Message-ID: <eb8071f2d06448408a42f38ce18980c8@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.175.248]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: bitbake mtd-utils Fetch failure
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
X-List-Received-Date: Mon, 29 Jun 2020 08:20:58 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_eb8071f2d06448408a42f38ce18980c8ticom_"

--_000_eb8071f2d06448408a42f38ce18980c8ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am getting the mtd-utils fetch failure in the yocto builds as follows:

fatal: remote error: access denied or repository not exported: /mtd-utils.g=
it
ERROR: mtd-utils-2.1.1-r0.arago1 do_fetch: Fetcher failure for URL: 'git://=
git.infradead.org/mtd-utils.git'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /work/nikhil/ybd/k3-yocto-26-Jun/build=
/arago-tmp-external-arm-glibc/work/aarch64-linux/mtd-utils/2.1.1-r0.arag
o1/temp/log.do_fetch.14117

I tried to clone the repo manually on my machine and still I get errors in =
cloning it.

Note that the mirror at http://software-dl.ti.com/processor-sdk-mirror/sour=
ces/git2_git.infradead.org.mtd-utils.git.tar.gz
Is obsolete and does not contain latest commits.

Are you also facing any errors due to this? Is there a fix for this error?

Regards,
Nikhil D


--_000_eb8071f2d06448408a42f38ce18980c8ticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:p=3D"urn:schemas-m=
icrosoft-com:office:powerpoint" xmlns:a=3D"urn:schemas-microsoft-com:office=
:access" xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:s=3D"=
uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882" xmlns:rs=3D"urn:schemas-microsof=
t-com:rowset" xmlns:z=3D"#RowsetSchema" xmlns:b=3D"urn:schemas-microsoft-co=
m:office:publisher" xmlns:ss=3D"urn:schemas-microsoft-com:office:spreadshee=
t" xmlns:c=3D"urn:schemas-microsoft-com:office:component:spreadsheet" xmlns=
:odc=3D"urn:schemas-microsoft-com:office:odc" xmlns:oa=3D"urn:schemas-micro=
soft-com:office:activation" xmlns:html=3D"http://www.w3.org/TR/REC-html40" =
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" xmlns:rtc=3D"http://m=
icrosoft.com/officenet/conferencing" xmlns:D=3D"DAV:" xmlns:Repl=3D"http://=
schemas.microsoft.com/repl/" xmlns:mt=3D"http://schemas.microsoft.com/share=
point/soap/meetings/" xmlns:x2=3D"http://schemas.microsoft.com/office/excel=
/2003/xml" xmlns:ppda=3D"http://www.passport.com/NameSpace.xsd" xmlns:ois=
=3D"http://schemas.microsoft.com/sharepoint/soap/ois/" xmlns:dir=3D"http://=
schemas.microsoft.com/sharepoint/soap/directory/" xmlns:ds=3D"http://www.w3=
.org/2000/09/xmldsig#" xmlns:dsp=3D"http://schemas.microsoft.com/sharepoint=
/dsp" xmlns:udc=3D"http://schemas.microsoft.com/data/udc" xmlns:xsd=3D"http=
://www.w3.org/2001/XMLSchema" xmlns:sub=3D"http://schemas.microsoft.com/sha=
repoint/soap/2002/1/alerts/" xmlns:ec=3D"http://www.w3.org/2001/04/xmlenc#"=
 xmlns:sp=3D"http://schemas.microsoft.com/sharepoint/" xmlns:sps=3D"http://=
schemas.microsoft.com/sharepoint/soap/" xmlns:xsi=3D"http://www.w3.org/2001=
/XMLSchema-instance" xmlns:udcs=3D"http://schemas.microsoft.com/data/udc/so=
ap" xmlns:udcxf=3D"http://schemas.microsoft.com/data/udc/xmlfile" xmlns:udc=
p2p=3D"http://schemas.microsoft.com/data/udc/parttopart" xmlns:wf=3D"http:/=
/schemas.microsoft.com/sharepoint/soap/workflow/" xmlns:dsss=3D"http://sche=
mas.microsoft.com/office/2006/digsig-setup" xmlns:dssi=3D"http://schemas.mi=
crosoft.com/office/2006/digsig" xmlns:mdssi=3D"http://schemas.openxmlformat=
s.org/package/2006/digital-signature" xmlns:mver=3D"http://schemas.openxmlf=
ormats.org/markup-compatibility/2006" xmlns:m=3D"http://schemas.microsoft.c=
om/office/2004/12/omml" xmlns:mrels=3D"http://schemas.openxmlformats.org/pa=
ckage/2006/relationships" xmlns:spwp=3D"http://microsoft.com/sharepoint/web=
partpages" xmlns:ex12t=3D"http://schemas.microsoft.com/exchange/services/20=
06/types" xmlns:ex12m=3D"http://schemas.microsoft.com/exchange/services/200=
6/messages" xmlns:pptsl=3D"http://schemas.microsoft.com/sharepoint/soap/Sli=
deLibrary/" xmlns:spsl=3D"http://microsoft.com/webservices/SharePointPortal=
Server/PublishedLinksService" xmlns:Z=3D"urn:schemas-microsoft-com:" xmlns:=
tax=3D"http://schemas.microsoft.com/sharepoint/taxonomy/soap/" xmlns:tns=3D=
"http://schemas.microsoft.com/sharepoint/soap/recordsrepository/" xmlns:sps=
up=3D"http://microsoft.com/webservices/SharePointPortalServer/UserProfileSe=
rvice" xmlns:mml=3D"http://www.w3.org/1998/Math/MathML" xmlns:st=3D"&#1;" x=
mlns=3D"http://www.w3.org/TR/REC-html40">
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
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
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
	font-family:"Segoe UI","sans-serif";
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
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;">I am getting the mtd-utils fetch failure in the yocto b=
uilds as follows:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;">fatal: remote error: access denied or repository not ex=
ported: /mtd-utils.git<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;">ERROR: mtd-utils-2.1.1-r0.arago1 do_fetch: Fetcher fail=
ure for URL: 'git://git.infradead.org/mtd-utils.git'. Unable to fetch URL f=
rom any source.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;">ERROR: Logfile of failure stored in: /work/nikhil/ybd/k=
3-yocto-26-Jun/build/arago-tmp-external-arm-glibc/work/aarch64-linux/mtd-ut=
ils/2.1.1-r0.arag<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;">o1/temp/log.do_fetch.14117<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;">I tried to clone the repo manually on my machine and st=
ill I get errors in cloning it.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;">Note that the mirror at
<a href=3D"http://software-dl.ti.com/processor-sdk-mirror/sources/git2_git.=
infradead.org.mtd-utils.git.tar.gz">
http://software-dl.ti.com/processor-sdk-mirror/sources/git2_git.infradead.o=
rg.mtd-utils.git.tar.gz</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;">Is obsolete and does not contain latest commits.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;">Are you also facing any errors due to this? Is there a =
fix for this error?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,&quo=
t;sans-serif&quot;">Nikhil D<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_eb8071f2d06448408a42f38ce18980c8ticom_--
