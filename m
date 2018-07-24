Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 58DC952993
	for <meta-arago@arago-project.org>;
	Tue, 24 Jul 2018 23:40:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6ONeFvT029565
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 18:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532475615;
	bh=T3Hw0UGw6xEgeEar753eWJ5osZrlixA2zHTnLimAdfw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Ln8/HH5ujqKLyZ8loM3O6P9R3smNIvgt5Q3wcDyPf87apqeJ2C4CobD+C03N/b/Xc
	jXazez3/6mEN3w9eCv8eVbxkHDjRXX6lhFLsnBZ694TFSCcyAtgCihAB1gDIOLWnya
	HL5CYNEsH8nwbR05fZdcUaiRITKhZ7MAw1XdEkII=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6ONeF1d012844
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 18:40:15 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 24 Jul 2018 18:40:15 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Tue, 24 Jul 2018 18:40:15 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Senicic, Djordje" <d-senicic1@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: tidl-utils to be added to devkit
Thread-Index: AdQjphjh9xGz9sY2R1WXEMnvnXI/CAAAZClg
Date: Tue, 24 Jul 2018 23:40:15 +0000
Message-ID: <ef7f76e4c9f54614af10f6222b425d49@ti.com>
References: <30ea823de86d44d581fbbb93db12434d@ti.com>
In-Reply-To: <30ea823de86d44d581fbbb93db12434d@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: tidl-utils to be added to devkit
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
X-List-Received-Date: Tue, 24 Jul 2018 23:40:22 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_ef7f76e4c9f54614af10f6222b425d49ticom_"

--_000_ef7f76e4c9f54614af10f6222b425d49ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

http://arago-project.org/git/projects/?p=3Dmeta-processor-sdk.git;a=3Dcommi=
tdiff;h=3Da631e2ebdfe65567b894f02abca8e08d4f712561

From: Senicic, Djordje
Sent: Tuesday, July 24, 2018 7:30 PM
To: Dmytriyenko, Denys; Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: tidl-utils to be added to devkit

I see that http://patchwork.dal.design.ti.com/patch/39450/ was not accepted=
.
But now after http://patchwork.dal.design.ti.com/patch/39452/ being accepte=
d, the first one should be fine.
Do I need to resubmit 39450?

Thanks
djordje

--_000_ef7f76e4c9f54614af10f6222b425d49ticom_
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
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">http://arago-project.o=
rg/git/projects/?p=3Dmeta-processor-sdk.git;a=3Dcommitdiff;h=3Da631e2ebdfe6=
5567b894f02abca8e08d4f712561<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Senicic,=
 Djordje
<br>
<b>Sent:</b> Tuesday, July 24, 2018 7:30 PM<br>
<b>To:</b> Dmytriyenko, Denys; Stiffler, Jacob<br>
<b>Cc:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> tidl-utils to be added to devkit<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I see that <a href=3D"http://patchwork.dal.design.ti=
.com/patch/39450/">
http://patchwork.dal.design.ti.com/patch/39450/</a> was not accepted.<o:p><=
/o:p></p>
<p class=3D"MsoNormal">But now after <a href=3D"http://patchwork.dal.design=
.ti.com/patch/39452/">
http://patchwork.dal.design.ti.com/patch/39452/</a> being accepted, the fir=
st one should be fine.<o:p></o:p></p>
<p class=3D"MsoNormal">Do I need to resubmit 39450?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">djordje<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_ef7f76e4c9f54614af10f6222b425d49ticom_--
