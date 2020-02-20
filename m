Return-Path: <Ankur.Tyagi@gallagher.com>
Received: from AUS01-ME1-obe.outbound.protection.outlook.com
	(mail-eopbgr1360138.outbound.protection.outlook.com [40.107.136.138])
	by arago-project.org (Postfix) with ESMTPS id C0D6152988
	for <meta-arago@arago-project.org>;
	Thu, 20 Feb 2020 08:34:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=HVmsBLuvSkkMDl98OCi1Xv0xR5qScO4ufZNWM3LgcfKSmvC50VlinF3kINU6ySG+a/Yx/IF8NIgk6zCDy6FQm88x/LQPR8Oq/vANhQBlvp2ztEVOoz85JfMT4wxpY3ZpThgp28s4GlNHkkJp5WdHyo5dgObbpbhNqAohCvUFeAj20l9wXpyk22By05cT3T2cqgj0KxIr5KRx2KmapXxtogSwqRMRB2qQlRwGlW8B00Pize8P4QBLsRCHBij9nF5JIam0IMWPBPoEUqspK5vo1cdJNHCArDrseZDmhK/mJ2hGd+oXGPSBufUBEuPtjR6lY6lb91vc2fQSKQR2qi5dYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=La+MHxBJl2P/mmlfzP4wnLOI2Cm6ZMfQyvJPvsFkZGg=;
	b=DUzAcVD4plLr/6Ai8/UDzaMQq8ZY8h+VkyulVh58yM2Lj//MtzlA76auWxNGA5C1Wkju5ujp18pFT/sD/jeNpzcV+WtDlqToVjX/gMo3X3hDp22JgHGBqrve5J5ZWdVTcPv9XETCVkk64SQ8p25FLfn7D8h6DexwxWa4zFLsAx2ciGM9jHF0vBbSd/QKsqV/+KJw3CjMAJcW5j6uPVEHHLAhgHP9e8U2CL9Vs9Tn9qQFmPIXSEhlzD2bCo5ODP99oQtEZ5rebr1Uw4c9JliJaLOrZtNS+FgmigkNBzDX2whpgs04o80Bv3s+QTMTcMvvpwWG18tAG/+qvHtMafRxXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=gallagher.com; dmarc=pass action=none
	header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=La+MHxBJl2P/mmlfzP4wnLOI2Cm6ZMfQyvJPvsFkZGg=;
	b=F9u95GotMYVL/7RO0VlhZ/8SDo0z3IhVzZL7PKeW8DvA4Hb01pNyZQvW8wA/PQ3u6bB/yT8sQhKNwMAMh719+fAtMA+ObsJy69xeCl0N+ny1Va4QDJ8qgix6UsfkSjEwVDSjF5coCkFSGd6S0Q7t2eueWKYLC4p6BCiY6XegTFI=
Received: from SY2PR01MB2426.ausprd01.prod.outlook.com (52.134.169.12) by
	SY2PR01MB2745.ausprd01.prod.outlook.com (52.134.169.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2729.25; Thu, 20 Feb 2020 08:32:20 +0000
Received: from SY2PR01MB2426.ausprd01.prod.outlook.com
	([fe80::6941:123e:23c0:8839]) by
	SY2PR01MB2426.ausprd01.prod.outlook.com
	([fe80::6941:123e:23c0:8839%7]) with mapi id 15.20.2729.033;
	Thu, 20 Feb 2020 08:32:20 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-arago] [Thud branch][AM3354]OpenGL/QT font rendering
	problem - corrupt glyphs
Thread-Index: AdXga0sggRssNwE8TBucwglUxu+UtAFc1sOAAF4Z1BwACiJqAAASD7bD
Date: Thu, 20 Feb 2020 08:32:20 +0000
Message-ID: <SY2PR01MB24265A98EF67AE591799434CE5130@SY2PR01MB2426.ausprd01.prod.outlook.com>
References: <MEAPR01MB2567716832C5FA4F6E472CF2E5190@MEAPR01MB2567.ausprd01.prod.outlook.com>
	<SY2PR01MB2426BC6017DD8E113B166CB6E5160@SY2PR01MB2426.ausprd01.prod.outlook.com>
	<SY2PR01MB24265CF57E3A14572D8434B7E5100@SY2PR01MB2426.ausprd01.prod.outlook.com>,
	<20200219235206.GX720@beryl>
In-Reply-To: <20200219235206.GX720@beryl>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Ankur.Tyagi@gallagher.com; 
x-originating-ip: [118.148.153.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f97a7228-a0b4-44f2-de5f-08d7b5df66b8
x-ms-traffictypediagnostic: SY2PR01MB2745:
x-microsoft-antispam-prvs: <SY2PR01MB27457C89A7A6E2D455A4C5D5E5130@SY2PR01MB2745.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10001)(10019020)(346002)(136003)(376002)(39840400004)(366004)(396003)(189003)(199004)(33656002)(53546011)(52536014)(6916009)(71200400001)(316002)(6506007)(966005)(2906002)(7696005)(4326008)(86362001)(81166006)(66446008)(478600001)(64756008)(66556008)(186003)(9686003)(76116006)(66476007)(55016002)(81156014)(66946007)(5660300002)(8936002)(26005)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SY2PR01MB2745;
	H:SY2PR01MB2426.ausprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: gallagher.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VBhW9WUWsCjyWueiKhhpQx8JL6z3VYfmqv1+F/Xk41ulOHPnHoEZRRkN/csraGACY+TXmm/d9TLJ7YF1clcNNpwQ+94mBQCQ9X6W71SjH5FRolXFwUI7D7a5ywpsZViCP8tekybd6F549ovZERSCaGnp8UiaFKKfVJHECBJXVqMVpHOJZgD3nyOkKdc7HjtmdT65+X/BLClFNY/pUvFzogfC1NGciesIRF0miTl0Akthe+oQnE7rz9q9GQcCJgR/YKnHgmbT7JiAEwI4aOkeZnlxyXO5V2cg+l4d37zBskajyOGWnCciPsTnKDJf5CvZ2VhDFKCM1DBWX0cLLueTZKRDfCez7EKdrfbrieg+7dkrcnaapp4aFn1BVYjTZA8t/WVedoDIu0DyveWmb/SpXcdjJHINye64Glwd5AjG/vSMxHP79n7Hfozha3BoUZ0+vE+DcA4QLNDt4jjnWY18eF+p6OtdSPYeWXdpSehgKNY3R+Uq/d/esFRZq0iGCPqoixsZn/rfpEd9POgAbCnr07dbAA4GpLE4aKr4uk89/4c8Y+sy9Wc0txarztN8YDIeV2ALJ6ncFCXP2kjksFfc9w==
x-ms-exchange-antispam-messagedata: +wuhfg4QdDR/2em6PO9xxdOZPJsm45P7JWiAJ+NK3xuxL+Lr+sShw67BToMg0kjyQKyeskJ7l4mwJTULxVB0RW0txQ7agzqxVAHJH7Zs82b16A+60RDFCGH6e7WTUamPVDBhjCUIpEIHaaiXr+nckg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97a7228-a0b4-44f2-de5f-08d7b5df66b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 08:32:20.1240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3+oC94SANs4yb8e3La3sFH9CW31o0j8OX91EtYyJPJBIOdAtVSZrlThzu1oqvQ9R0X0Ywt68tY6zqaUNvWYscDEPCa13i0LVB0vqkLtGEEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY2PR01MB2745
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Thu, 20 Feb 2020 08:34:22 -0000
Content-Language: en-NZ
Content-Type: multipart/alternative;
	boundary="_000_SY2PR01MB24265A98EF67AE591799434CE5130SY2PR01MB2426ausp_"

--_000_SY2PR01MB24265A98EF67AE591799434CE5130SY2PR01MB2426ausp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

We are using sitara u-boot and kernel coming from meta-ti thud branch.

We didn't had this problem before with daisy branch and RAM configuration i=
n u-boot is not changed

Is there any configuration/setting that you want me to share with you?

Thanks
Ankur
________________________________
From: Denys Dmytriyenko <denys@ti.com>
Sent: Thursday, February 20, 2020 12:52:06 PM
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Cc: meta-arago@arago-project.org <meta-arago@arago-project.org>
Subject: Re: [meta-arago] [Thud branch][AM3354]OpenGL/QT font rendering pro=
blem - corrupt glyphs

That is quite strange. We are wrapping up our Thud support. But it was used
in our products for about a year with rigorous testing and we haven't seen
anything like that on any of our platforms.

This does look like some memory corruption - are you sure you have all the
timings correctly? Have you also switched any of the low-level components,
like U-boot, Linux kernel, etc.?

Denys


On Wed, Feb 19, 2020 at 07:04:12PM +0000, Ankur Tyagi wrote:
> Hi,
>
> Is there anything can be done to fix it? Let me know if some more informa=
tion needs to be shared in order to help with diagnosis.
>
> Regards
> Ankur
>
>
> ________________________________
> From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-proj=
ect.org> on behalf of Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> Sent: Tuesday, February 18, 2020, 11:11 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [Thud branch][AM3354]OpenGL/QT font rendering probl=
em - corrupt glyphs
>
> Resending it as previous one didn=92t made it to the mailing list
>
> And we are stuck in production after upgrade to thud branch because of th=
is issue, any help is appreciated
>
> Regards
> Ankur
>
> From: Ankur Tyagi
> Sent: Tuesday, 11 February 2020 12:39 PM
> To: meta-arago@arago-project.org
> Subject: [Thud branch][AM3354]OpenGL/QT font rendering problem - corrupt =
glyphs
>
> Greetings,
>
> I am using AM3354 processor. I just did a major Yocto upgrade from "daisy=
" to "thud" branch, and I noticed that some characters/glyphs happen to be =
slightly corrupt.
> The problem occurs randomly, but when a corrupted character is rendered m=
ultiple times on the screen, all of its instances are corrupted the same wa=
y.
>
> It looks like this: https://ibb.co/LYP4JCx
>
> I tried using various QT environment variables, but the only one that wor=
ked was QT_QUICK_BACKEND=3Dsoftware. However, this led to a very significan=
t slowdown, so it's not an option.
>
> I'm not using X11 or wayland. I'm not modifying the graphics drivers or t=
he QT layer in any way.
>
> Following are Qt environment variables on target:
>
> export QT_QPA_EGLFS_INTEGRATION=3Dnone
> export QT_QUICK_CONTROLS_1_STYLE=3DFlat
> export QT_QPA_EGLFS_NO_LIBINPUT=3D1
>
> Has anyone experienced similar problem? Is there any configuration detail=
 I might be missing?
>
> Regards,
> Ankur
>
> ________________________________
> This email is confidential and may contain information subject to legal p=
rivilege. If you are not the intended recipient please advise us of our err=
or by return e-mail then delete this email and any attached files. You may =
not copy, disclose or use the contents in any way. The views expressed in t=
his email may not be those of Gallagher Group Ltd or subsidiary companies t=
hereof.
> ________________________________
>

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


--_000_SY2PR01MB24265A98EF67AE591799434CE5130SY2PR01MB2426ausp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Hi Denys,<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
We are using sitara u-boot and kernel coming from meta-ti thud branch.<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
We didn't had this problem before with daisy branch and RAM configuration i=
n u-boot is not changed<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Is there any configuration/setting that you want me to share with you?<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Thanks<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Ankur</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Denys Dmytriyenko &lt=
;denys@ti.com&gt;<br>
<b>Sent:</b> Thursday, February 20, 2020 12:52:06 PM<br>
<b>To:</b> Ankur Tyagi &lt;Ankur.Tyagi@gallagher.com&gt;<br>
<b>Cc:</b> meta-arago@arago-project.org &lt;meta-arago@arago-project.org&gt=
;<br>
<b>Subject:</b> Re: [meta-arago] [Thud branch][AM3354]OpenGL/QT font render=
ing problem - corrupt glyphs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">That is quite strange. We are wrapping up our Thud=
 support. But it was used
<br>
in our products for about a year with rigorous testing and we haven't seen =
<br>
anything like that on any of our platforms.<br>
<br>
This does look like some memory corruption - are you sure you have all the =
<br>
timings correctly? Have you also switched any of the low-level components, =
<br>
like U-boot, Linux kernel, etc.?<br>
<br>
Denys<br>
<br>
<br>
On Wed, Feb 19, 2020 at 07:04:12PM &#43;0000, Ankur Tyagi wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Is there anything can be done to fix it? Let me know if some more info=
rmation needs to be shared in order to help with diagnosis.<br>
&gt; <br>
&gt; Regards<br>
&gt; Ankur<br>
&gt; <br>
&gt; <br>
&gt; ________________________________<br>
&gt; From: meta-arago-bounces@arago-project.org &lt;meta-arago-bounces@arag=
o-project.org&gt; on behalf of Ankur Tyagi &lt;Ankur.Tyagi@gallagher.com&gt=
;<br>
&gt; Sent: Tuesday, February 18, 2020, 11:11 AM<br>
&gt; To: meta-arago@arago-project.org<br>
&gt; Subject: [meta-arago] [Thud branch][AM3354]OpenGL/QT font rendering pr=
oblem - corrupt glyphs<br>
&gt; <br>
&gt; Resending it as previous one didn=92t made it to the mailing list<br>
&gt; <br>
&gt; And we are stuck in production after upgrade to thud branch because of=
 this issue, any help is appreciated<br>
&gt; <br>
&gt; Regards<br>
&gt; Ankur<br>
&gt; <br>
&gt; From: Ankur Tyagi<br>
&gt; Sent: Tuesday, 11 February 2020 12:39 PM<br>
&gt; To: meta-arago@arago-project.org<br>
&gt; Subject: [Thud branch][AM3354]OpenGL/QT font rendering problem - corru=
pt glyphs<br>
&gt; <br>
&gt; Greetings,<br>
&gt; <br>
&gt; I am using AM3354 processor. I just did a major Yocto upgrade from &qu=
ot;daisy&quot; to &quot;thud&quot; branch, and I noticed that some characte=
rs/glyphs happen to be slightly corrupt.<br>
&gt; The problem occurs randomly, but when a corrupted character is rendere=
d multiple times on the screen, all of its instances are corrupted the same=
 way.<br>
&gt; <br>
&gt; It looks like this: <a href=3D"https://ibb.co/LYP4JCx">https://ibb.co/=
LYP4JCx</a><br>
&gt; <br>
&gt; I tried using various QT environment variables, but the only one that =
worked was QT_QUICK_BACKEND=3Dsoftware. However, this led to a very signifi=
cant slowdown, so it's not an option.<br>
&gt; <br>
&gt; I'm not using X11 or wayland. I'm not modifying the graphics drivers o=
r the QT layer in any way.<br>
&gt; <br>
&gt; Following are Qt environment variables on target:<br>
&gt; <br>
&gt; export QT_QPA_EGLFS_INTEGRATION=3Dnone<br>
&gt; export QT_QUICK_CONTROLS_1_STYLE=3DFlat<br>
&gt; export QT_QPA_EGLFS_NO_LIBINPUT=3D1<br>
&gt; <br>
&gt; Has anyone experienced similar problem? Is there any configuration det=
ail I might be missing?<br>
&gt; <br>
&gt; Regards,<br>
&gt; Ankur<br>
&gt; <br>
&gt; ________________________________<br>
&gt; This email is confidential and may contain information subject to lega=
l privilege. If you are not the intended recipient please advise us of our =
error by return e-mail then delete this email and any attached files. You m=
ay not copy, disclose or use the contents
 in any way. The views expressed in this email may not be those of Gallaghe=
r Group Ltd or subsidiary companies thereof.<br>
&gt; ________________________________<br>
&gt; <br>
<br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; meta-arago@arago-project.org<br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SY2PR01MB24265A98EF67AE591799434CE5130SY2PR01MB2426ausp_--
