Return-Path: <Ankur.Tyagi@gallagher.com>
Received: from AUS01-ME1-obe.outbound.protection.outlook.com
	(mail-eopbgr1360118.outbound.protection.outlook.com [40.107.136.118])
	by arago-project.org (Postfix) with ESMTPS id D76ED529DC
	for <meta-arago@arago-project.org>;
	Mon, 17 Feb 2020 22:13:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=cfr3rJCMKXAynffCFaigmGn2tRncJBjnP4BbfqNtsZbAGAwVj06uHeLfpQyC02QvHfaE6gw2yuexSg3xjTI46wlMhzXUcUlQgIUbnTqp6DkEmB/BGMYdkkBJGrZsuQVcpMl7gM7i78LvYHya7Sld4cLulYkBAXiij+aF/8IWe1oja04dy6H38+H/LcS9+kBYg3DfoN7OKqKtfh+PZwMWWAFmk/ejZDj4ypr0IzPN/uDVzRA5liKru8OK3Xqtv/RriOmJL60LqTQni8/FH+BAID8H8YKVfbF0AVbGuRDRDiDP4nRcr8KPIKmZWW/ElIuazkOaXHUPVuM8rQmNFMDZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rWZ1ihjZoq8elFgPtGm0/spexUgGb1OJATJgy+vO/dA=;
	b=P2F8kHXJqxzlmqQLxEoby1ZPVQJXznfhGN+AtwC6ITPwHHoQErRzkqfwTnGzLnLZZ5tQUGNkiGbMnT30dez2ljwqCxx4JpkrMILISQ0ywcSaMh/2fCSQzb1Mx+S2TUgykSdntdrDaQWAp4sGt0Z50nxV7QRf0dDZVIwWvKu63QRF4H5z25aW12GdTyMvRTWaC81rbFa/R3Dtl3ye1Zws6j0hg547GGJORInoZTuXnJJTuKn2sPinFnKTSmH8Lf2wmBzKfWLaCiFsdqrRWgjc5ksMSt0sFNNQ2AG//ONBYap+vOTzmBPoMBFQuM0ktzG3hUCC1oq25p0lbeDbPnZ95A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=gallagher.com; dmarc=pass action=none
	header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rWZ1ihjZoq8elFgPtGm0/spexUgGb1OJATJgy+vO/dA=;
	b=Acyx5hWrvczIlzY5pz0VDVYPvOdfmaabCv0aUpqc1WxXuWv8KzxesGsWrGcEWnCcDuZXASWblhGC0uVgiWDCgMeP6SNUeaRES4qXQc4D+9ENPWWnLbB9WDQwE0SiDxUUHUCO4sSziTvzqCdiMGUdUb/j2W/pzCQQu9oiSawCS70=
Received: from SY2PR01MB2426.ausprd01.prod.outlook.com (52.134.169.12) by
	SY2PR01MB2220.ausprd01.prod.outlook.com (52.134.187.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2729.31; Mon, 17 Feb 2020 22:10:59 +0000
Received: from SY2PR01MB2426.ausprd01.prod.outlook.com
	([fe80::6941:123e:23c0:8839]) by
	SY2PR01MB2426.ausprd01.prod.outlook.com
	([fe80::6941:123e:23c0:8839%7]) with mapi id 15.20.2729.032;
	Mon, 17 Feb 2020 22:10:59 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [Thud branch][AM3354]OpenGL/QT font rendering problem - corrupt
	glyphs
Thread-Index: AdXga0sggRssNwE8TBucwglUxu+UtAFc1sOA
Date: Mon, 17 Feb 2020 22:10:59 +0000
Message-ID: <SY2PR01MB2426BC6017DD8E113B166CB6E5160@SY2PR01MB2426.ausprd01.prod.outlook.com>
References: <MEAPR01MB2567716832C5FA4F6E472CF2E5190@MEAPR01MB2567.ausprd01.prod.outlook.com>
In-Reply-To: <MEAPR01MB2567716832C5FA4F6E472CF2E5190@MEAPR01MB2567.ausprd01.prod.outlook.com>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Ankur.Tyagi@gallagher.com; 
x-originating-ip: [203.167.229.98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bfbd642-6d66-42a1-8a00-08d7b3f64519
x-ms-traffictypediagnostic: SY2PR01MB2220:
x-microsoft-antispam-prvs: <SY2PR01MB2220F166E8B1D4CF61B2F9EFE5160@SY2PR01MB2220.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(396003)(366004)(346002)(39840400004)(136003)(199004)(189003)(2906002)(76116006)(33656002)(66946007)(316002)(66446008)(186003)(64756008)(66556008)(66476007)(71200400001)(26005)(8936002)(6916009)(6506007)(53546011)(8676002)(81166006)(81156014)(52536014)(7696005)(478600001)(966005)(86362001)(9686003)(55016002)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SY2PR01MB2220;
	H:SY2PR01MB2426.ausprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: gallagher.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 70PXfg0A+4FQcImlbgw8bMfSweCcr8XpwFFZmlD8UQucJr7jNCwSxf0Z5sNDvoU7yKdkw/M2WVmAUBN27Iwhvt2lEl8Z7lKp+5vWGI2tNzq8nXl6I4xP59y6DFE8HBA3YVTKn1zBI49mnA47ZYi9KxQYlaOebBvIHCOfnHo5l/UWPcJo0f7gM+TA8sWzUPCGjfyfu2VF211aFafMK5UW8vHyy7oaGnrWl6tKnwfobE0YE/CT8UsFEssu7OWfyHBX0HiBS+W+5pKJk60vrn+LIwUlfXWDxKhyXJGsmj6CdUIY2vEvmJzMNsos5sbVYETcEOaQrZyQgRgA5xbmmmU+h3SItOO/kgQfzpU+ZEjrrQSCnFokeR0Czfs1nXs69u/u46qaVtuprdseo5XuLcNWxG9O1EwFW3YOaW/PywF77voWesMsLPPdQppM3c1hHYY4adAvKWujsLym0AuIKjJ/gvG1z5zO6Voevt7oUyzZrxRukV1W1EC72KeAVpQskO8wZwAyiL9Is5Fr3U0jSxA5HA==
x-ms-exchange-antispam-messagedata: RAZHalYV//PzqB90Gu4cDZ2b0M3GCRp0KtxPQ0DcfIwM7/5Jtlo5zJOkNpjeFujUEdn9wMid/dj/Gmd31NzV3p7kPO4rjmBV8yCZsFg5zLN1AAvfsq5OCZreU+jU3oGaCXa5LSd1HTCgCvBMkMUDag==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfbd642-6d66-42a1-8a00-08d7b3f64519
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 22:10:59.8153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GZBks+e8P7yhv5w5+B5n5N8rgHplp5Cm0EdSwwlccrIJdhPE5gt2nf6MbbN/eeOtyDCwh5GJzkSmZkNCk3yCgDAoJxKaIZ2ZxswbvoMNL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY2PR01MB2220
Subject: [Thud branch][AM3354]OpenGL/QT font rendering problem - corrupt glyphs
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
X-List-Received-Date: Mon, 17 Feb 2020 22:13:01 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SY2PR01MB2426BC6017DD8E113B166CB6E5160SY2PR01MB2426ausp_"

--_000_SY2PR01MB2426BC6017DD8E113B166CB6E5160SY2PR01MB2426ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Resending it as previous one didn't made it to the mailing list

And we are stuck in production after upgrade to thud branch because of this=
 issue, any help is appreciated

Regards
Ankur

From: Ankur Tyagi
Sent: Tuesday, 11 February 2020 12:39 PM
To: meta-arago@arago-project.org
Subject: [Thud branch][AM3354]OpenGL/QT font rendering problem - corrupt gl=
yphs

Greetings,

I am using AM3354 processor. I just did a major Yocto upgrade from "daisy" =
to "thud" branch, and I noticed that some characters/glyphs happen to be sl=
ightly corrupt.
The problem occurs randomly, but when a corrupted character is rendered mul=
tiple times on the screen, all of its instances are corrupted the same way.

It looks like this: https://ibb.co/LYP4JCx

I tried using various QT environment variables, but the only one that worke=
d was QT_QUICK_BACKEND=3Dsoftware. However, this led to a very significant =
slowdown, so it's not an option.

I'm not using X11 or wayland. I'm not modifying the graphics drivers or the=
 QT layer in any way.

Following are Qt environment variables on target:

export QT_QPA_EGLFS_INTEGRATION=3Dnone
export QT_QUICK_CONTROLS_1_STYLE=3DFlat
export QT_QPA_EGLFS_NO_LIBINPUT=3D1

Has anyone experienced similar problem? Is there any configuration detail I=
 might be missing?

Regards,
Ankur

________________________________
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents in any way. The views expressed in thi=
s email may not be those of Gallagher Group Ltd or subsidiary companies the=
reof.
________________________________

--_000_SY2PR01MB2426BC6017DD8E113B166CB6E5160SY2PR01MB2426ausp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-NZ" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Resending it as previous one didn&#8217;t made it to=
 the mailing list<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">And we are stuck in production after upgrade to thud=
 branch because of this issue, any help is appreciated<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Ankur<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"mso-fareast-languag=
e:EN-NZ">From:</span></b><span lang=3D"EN-US" style=3D"mso-fareast-language=
:EN-NZ"> Ankur Tyagi
<br>
<b>Sent:</b> Tuesday, 11 February 2020 12:39 PM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> [Thud branch][AM3354]OpenGL/QT font rendering problem - cor=
rupt glyphs<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Greetings,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am using AM3354 processor. I just did a major Yoct=
o upgrade from &quot;daisy&quot; to &quot;thud&quot; branch, and I noticed =
that some characters/glyphs happen to be slightly corrupt.
<o:p></o:p></p>
<p class=3D"MsoNormal">The problem occurs randomly, but when a corrupted ch=
aracter is rendered multiple times on the screen, all of its instances are =
corrupted the same way.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It looks like this: <a href=3D"https://ibb.co/LYP4JC=
x">https://ibb.co/LYP4JCx</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I tried using various QT environment variables, but =
the only one that worked was QT_QUICK_BACKEND=3Dsoftware. However, this led=
 to a very significant slowdown, so it's not an option.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I'm not using X11 or wayland. I'm not modifying the =
graphics drivers or the QT layer in any way.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Following are Qt environment variables on target:<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">export QT_QPA_EGLFS_INTEGRATION=3Dnone<o:p></o:p></p=
>
<p class=3D"MsoNormal">export QT_QUICK_CONTROLS_1_STYLE=3DFlat<o:p></o:p></=
p>
<p class=3D"MsoNormal">export QT_QPA_EGLFS_NO_LIBINPUT=3D1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Has anyone experienced similar problem? Is there any=
 configuration detail I might be missing?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Ankur<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<hr>
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents
 in any way. The views expressed in this email may not be those of Gallaghe=
r Group Ltd or subsidiary companies thereof.
<hr>
</body>
</html>

--_000_SY2PR01MB2426BC6017DD8E113B166CB6E5160SY2PR01MB2426ausp_--
