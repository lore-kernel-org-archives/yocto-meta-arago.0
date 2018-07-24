Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C6A85529B9
	for <meta-arago@arago-project.org>;
	Tue, 24 Jul 2018 23:30:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6ONUMY4074209
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 18:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532475022;
	bh=YXzT/S8nBWa8/340CjhO2ALgxmb2Fh7QXFI0XKqmhpM=;
	h=From:To:CC:Subject:Date;
	b=HBcvBAXQQ/4OHnEPXXPMG5vjrv6wLSOh20vaMB2lU/4/5JmK0lHmVtoqHoInbzcae
	9IFhi/CknhNrq/bEyCYqIYQzVHbvaUyKzNq6T2jtL80brbMYJ8X2DYSozxBdUm2GnM
	hfvmh9hwWOPH4NH1wS16HEvqB/iH7q1/R3f1mL0A=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6ONUM7C028645
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 18:30:22 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 24 Jul 2018 18:30:22 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1466.003; Tue, 24 Jul 2018 18:30:22 -0500
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: tidl-utils to be added to devkit
Thread-Index: AdQjphjh9xGz9sY2R1WXEMnvnXI/CA==
Date: Tue, 24 Jul 2018 23:30:22 +0000
Message-ID: <30ea823de86d44d581fbbb93db12434d@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.111.218]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: tidl-utils to be added to devkit
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
X-List-Received-Date: Tue, 24 Jul 2018 23:30:30 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_30ea823de86d44d581fbbb93db12434dticom_"

--_000_30ea823de86d44d581fbbb93db12434dticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I see that http://patchwork.dal.design.ti.com/patch/39450/ was not accepted=
.
But now after http://patchwork.dal.design.ti.com/patch/39452/ being accepte=
d, the first one should be fine.
Do I need to resubmit 39450?

Thanks
djordje

--_000_30ea823de86d44d581fbbb93db12434dticom_
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
</body>
</html>

--_000_30ea823de86d44d581fbbb93db12434dticom_--
