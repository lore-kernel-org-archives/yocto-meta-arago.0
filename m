Return-Path: <Ankur.Tyagi@gallagher.com>
Received: from AUS01-SY3-obe.outbound.protection.outlook.com
	(mail-eopbgr1370113.outbound.protection.outlook.com [40.107.137.113])
	by arago-project.org (Postfix) with ESMTPS id 2F682529AB
	for <meta-arago@arago-project.org>;
	Wed, 19 Feb 2020 19:06:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=msu9ClnTOaHJ5+OXg/SCrdCIeb1D8LlVlUr75t3nxtvbCo50CMkvLqaC/NseI2XxKyz/AO4MxbvHCcRu7lOp0E60tGw5RnroOH8nrIhIZHdV9q4JqSjS7e96juuAUwur1O12qHxjHzS8e5+ZnCCWI99rLqxQPvFf6bte/oWqoB58dIXugT/KegkNSfF0XZZSvDNCt/vEZO28dAzY7bEgqWxKWPzRUXtRggCHOILKxQ1zPSVQ4UAcCocqDqCxupETl77kUBnhy0/h+wpIjgYHSnkDXhhKTrltVpBTKf8ZNZQZsXjMf3/COssGRjEbFCg8evBFhVVY6dk7BMikKMvSRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QJKP44rGZOlhy6tXx7YLLM4QZfMEgW/03+5kucye47A=;
	b=GR09Xy255MgNPI6o7xaL2Y4pUejh6Y4gGUsoF6KSO3cJniwpJZWCNojlP88w7wc53GX5M+GnnoH/ZEdlRCUYPW2B90NRUv7FKS5QlJe22FgSaf8TCzL8DNmC8tuef7UtdVsoYXfO9WEjE7nQLAyZb1Ax7FACjBYEIktEOnsTQX798CGolrLZhyqXTG08ySvMcNDNsQoAK95Dz9rIc+zQHWVkymtR6LGR5YIDBoQFC88aiRP69fWXnLJCJEkYrNb9MyRqT/olGel7qfaWkNH14xZp2OIn+2MS1YcWXTF1UThsxF+HAarHpSCnzHbfiH/ogmGsjdQI5d2Zh9TUDeFH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=gallagher.com; dmarc=pass action=none
	header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QJKP44rGZOlhy6tXx7YLLM4QZfMEgW/03+5kucye47A=;
	b=kAdc0+6hSSHi5ZDzw4me6MYHDCVO8Z+JpZjAhftSaA4OqMxzyrLXJZ/clk3/5YvJHgVrKiRoK6vL9HEuJp3PiOeq2BzqgkIYXrSR2JW12PU1ngwz4HOc6N0o6AULspyQR32fmPtAhssj9sJTICdJw/NfhkEi2V3xaJk7lEUL4Oc=
Received: from SY2PR01MB2426.ausprd01.prod.outlook.com (52.134.169.12) by
	SY2PR01MB2412.ausprd01.prod.outlook.com (52.134.168.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2729.23; Wed, 19 Feb 2020 19:04:12 +0000
Received: from SY2PR01MB2426.ausprd01.prod.outlook.com
	([fe80::6941:123e:23c0:8839]) by
	SY2PR01MB2426.ausprd01.prod.outlook.com
	([fe80::6941:123e:23c0:8839%7]) with mapi id 15.20.2729.033;
	Wed, 19 Feb 2020 19:04:12 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [Thud branch][AM3354]OpenGL/QT font rendering
	problem - corrupt glyphs
Thread-Index: AdXga0sggRssNwE8TBucwglUxu+UtAFc1sOAAF4Z1Bw=
Date: Wed, 19 Feb 2020 19:04:12 +0000
Message-ID: <SY2PR01MB24265CF57E3A14572D8434B7E5100@SY2PR01MB2426.ausprd01.prod.outlook.com>
References: <MEAPR01MB2567716832C5FA4F6E472CF2E5190@MEAPR01MB2567.ausprd01.prod.outlook.com>,
	<SY2PR01MB2426BC6017DD8E113B166CB6E5160@SY2PR01MB2426.ausprd01.prod.outlook.com>
In-Reply-To: <SY2PR01MB2426BC6017DD8E113B166CB6E5160@SY2PR01MB2426.ausprd01.prod.outlook.com>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Ankur.Tyagi@gallagher.com; 
x-originating-ip: [139.180.103.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 608bfcca-40e9-46b7-1394-08d7b56e8201
x-ms-traffictypediagnostic: SY2PR01MB2412:
x-microsoft-antispam-prvs: <SY2PR01MB2412D5097BBD477793CDADE3E5100@SY2PR01MB2412.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(366004)(39850400004)(396003)(376002)(136003)(199004)(189003)(8936002)(71200400001)(7696005)(53546011)(6506007)(8676002)(81156014)(81166006)(66446008)(316002)(64756008)(186003)(66476007)(66556008)(66946007)(2906002)(76116006)(26005)(478600001)(86362001)(55016002)(9686003)(6916009)(33656002)(966005)(5660300002)(52536014);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SY2PR01MB2412;
	H:SY2PR01MB2426.ausprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: gallagher.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iVL/nyKmHCXMmAQiyqQALRcZxIOvge773ysa8o1/HTyKScIKL41oK/2GwfsR8ujpkbYMoJqTD4gg/dwFYDWtbbQPkCLzlhcv4fqhBvqXGL8y0PhCnTXzRXkLydMjnZAI+YhdxPNfBh5eRP+wTUgD/gmXBC9CZNDjkc56a0VrjY1In5rXKuzr/gZZ+oKkKyMEhOu5xpaZ3s5E2p6WG6ydh/HLLowOs62J7tJ1V/TrnSube3ynmhtVpjTOdGdBn3Bz9cPlBDz5MnpfJ9rXTo5xcIr8N4uD9P71wnXz0sRR+99h1AVuh9KQ0sjByc7iKGr8zl4ELxXMTM/kh366kZp9enxzryaCYjhgbm5Zhzg9PMbj4rZcIXo1UQmPx0yTuLa8psJy5WN65JRPgkxvf80+QnLbxTrNttEZnWQ1ParTnYmXGpubNTVC8mKJ+btOwFZDAE0qqSdEUYcGdrhxPDJn0m8xM25hNVY4Ypba6IbpR4o9MdOXr+vt44nX8FfJInaJvtstjuopn/t0LlSeyGUiSA==
x-ms-exchange-antispam-messagedata: xl+VoDFoYK3fKLCsjiENlQM4ZsTWiZiyLwGR2wDq6J/1hiZjwbJhfzGZqDr3/2h4VO4SCibWln82hM1KQM2fS40WZjDuizfc6YONAmBO9qNsytsVJhPPxuopGkW8TaFvgUoXJeaN6VN91jGZdoxgXQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608bfcca-40e9-46b7-1394-08d7b56e8201
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 19:04:12.7243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sEDueG67ZYHJJKyQE6CztJB/YWFmYov+DjHpVWPtn9/Ilih4/rJCz8ycwMFG2AY59zvXyWJqhjBGj4DwAaTSa5Dqe22CxfVWpgvj8HkD5WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY2PR01MB2412
Subject: Re: [Thud branch][AM3354]OpenGL/QT font rendering problem - corrupt glyphs
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
X-List-Received-Date: Wed, 19 Feb 2020 19:06:15 -0000
Content-Language: en-NZ
Content-Type: multipart/alternative;
	boundary="_000_SY2PR01MB24265CF57E3A14572D8434B7E5100SY2PR01MB2426ausp_"

--_000_SY2PR01MB24265CF57E3A14572D8434B7E5100SY2PR01MB2426ausp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

Is there anything can be done to fix it? Let me know if some more informati=
on needs to be shared in order to help with diagnosis.

Regards
Ankur


________________________________
From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-projec=
t.org> on behalf of Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Sent: Tuesday, February 18, 2020, 11:11 AM
To: meta-arago@arago-project.org
Subject: [meta-arago] [Thud branch][AM3354]OpenGL/QT font rendering problem=
 - corrupt glyphs

Resending it as previous one didn=92t made it to the mailing list

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


--_000_SY2PR01MB24265CF57E3A14572D8434B7E5100SY2PR01MB2426ausp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
Hi,</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
Is there anything can be done to fix it? Let me know if some more informati=
on needs to be shared in order to help with diagnosis.</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
Regards</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
Ankur</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
</div>
<div id=3D"id-31fd0a25-e4d2-4423-aa7f-e8d5fd4dcde8" class=3D"ms-outlook-mob=
ile-reference-message">
<div style=3D"font-family: sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;"><br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg"><strong>From:</strong> meta-arago-bounces@arago-p=
roject.org &lt;meta-arago-bounces@arago-project.org&gt; on behalf of Ankur =
Tyagi &lt;Ankur.Tyagi@gallagher.com&gt;<br>
<strong>Sent:</strong> Tuesday, February 18, 2020, 11:11 AM<br>
<strong>To:</strong> meta-arago@arago-project.org<br>
<strong>Subject:</strong> [meta-arago] [Thud branch][AM3354]OpenGL/QT font =
rendering problem - corrupt glyphs<br>
</div>
<br>
<meta content=3D"text/html; charset=3DWindows-1252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style>=0A=
<!--=0A=
@font-face=0A=
	{font-family:"Cambria Math"}=0A=
@font-face=0A=
	{font-family:Calibri}=0A=
p.MsoNormal, li.MsoNormal, div.MsoNormal=0A=
	{margin:0cm;=0A=
	margin-bottom:.0001pt;=0A=
	font-size:11.0pt;=0A=
	font-family:"Calibri",sans-serif}=0A=
a:link, span.MsoHyperlink=0A=
	{color:#0563C1;=0A=
	text-decoration:underline}=0A=
span.EmailStyle19=0A=
	{font-family:"Calibri",sans-serif;=0A=
	color:windowtext}=0A=
.MsoChpDefault=0A=
	{font-size:10.0pt}=0A=
@page WordSection1=0A=
	{margin:72.0pt 72.0pt 72.0pt 72.0pt}=0A=
div.WordSection1=0A=
	{}=0A=
-->=0A=
</style>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Resending it as previous one didn=92t made it to the=
 mailing list</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">And we are stuck in production after upgrade to thud=
 branch because of this issue, any help is appreciated</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Regards</p>
<p class=3D"MsoNormal">Ankur</p>
<p class=3D"MsoNormal">&nbsp;</p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0c=
m 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"">From:</span></b><=
span lang=3D"EN-US" style=3D""> Ankur Tyagi
<br>
<b>Sent:</b> Tuesday, 11 February 2020 12:39 PM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> [Thud branch][AM3354]OpenGL/QT font rendering problem - cor=
rupt glyphs</span></p>
</div>
</div>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Greetings,</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">I am using AM3354 processor. I just did a major Yoct=
o upgrade from &quot;daisy&quot; to &quot;thud&quot; branch, and I noticed =
that some characters/glyphs happen to be slightly corrupt.
</p>
<p class=3D"MsoNormal">The problem occurs randomly, but when a corrupted ch=
aracter is rendered multiple times on the screen, all of its instances are =
corrupted the same way.
</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">It looks like this: <a href=3D"https://ibb.co/LYP4JC=
x" data-ogsc=3D"" style=3D"">
https://ibb.co/LYP4JCx</a></p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">I tried using various QT environment variables, but =
the only one that worked was QT_QUICK_BACKEND=3Dsoftware. However, this led=
 to a very significant slowdown, so it's not an option.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">I'm not using X11 or wayland. I'm not modifying the =
graphics drivers or the QT layer in any way.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Following are Qt environment variables on target:</p=
>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">export QT_QPA_EGLFS_INTEGRATION=3Dnone</p>
<p class=3D"MsoNormal">export QT_QUICK_CONTROLS_1_STYLE=3DFlat</p>
<p class=3D"MsoNormal">export QT_QPA_EGLFS_NO_LIBINPUT=3D1</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Has anyone experienced similar problem? Is there any=
 configuration detail I might be missing?</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Regards,</p>
<p class=3D"MsoNormal">Ankur</p>
<p class=3D"MsoNormal">&nbsp;</p>
</div>
<hr>
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents
 in any way. The views expressed in this email may not be those of Gallaghe=
r Group Ltd or subsidiary companies thereof.
<hr>
<br>
</div>
</body>
</html>

--_000_SY2PR01MB24265CF57E3A14572D8434B7E5100SY2PR01MB2426ausp_--
