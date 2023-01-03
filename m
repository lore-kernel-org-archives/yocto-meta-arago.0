Return-Path: <bernd@sprenger.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47C2C46467
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 14:02:21 +0000 (UTC)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com (CHE01-ZR0-obe.outbound.protection.outlook.com [40.107.24.110])
 by mx.groups.io with SMTP id smtpd.web11.63800.1672754537743965997
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 06:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sprengerengineering.onmicrosoft.com header.s=selector1-sprengerengineering-onmicrosoft-com header.b=DlUd0clf;
 spf=pass (domain: sprenger.org, ip: 40.107.24.110, mailfrom: bernd@sprenger.org)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZcFkQYoBmW8SW7pqhgL72j3UJyu3KIvBSuATg5IW2FhFSwGAIwtQ1/rVgLB/y88YuT2ZEE9z7wBcFT1QpW8AIrYytpk0CBv7/he3dxb+ZKBp08SlPaALwvlnXRhMjArqTS/4Wr4/PJfzO754P7Sx7Q764rTcDZUcSumUYO4nlw0i4gdD3aYvTIreTYW6WRwAMKXPHVA8sj3eSiP9+yj0qu1xWrmZjj/dNhQKTAOyxukMRnQcxqwa8CHXr67zs1V5XwMBeGf+SUp8UPxpZeley849kNSIPTZ3bZ2CdY7CM6keYy43nUpcnNUtOlYf1Dg6HaaiLxjJybOa1mJqK/PGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/3q/hhLOlVAHcnvsB2ev7K2nfxuBTsjc2wzWRSN+m8=;
 b=mtz/vXSZfXbS8s6y+8wGBb2MpbzNvpPnfMopxg41Y3+yGFi+u9THt6+VGbk5ZbWEidErU6pa+XTGe3MgVB74dBmQL72T7c8tSFuF3szPYARM0WCvf+3jFALjwDtJku8+vK5qA08XxIIvjm4APHoJidBhHdvFTuDL3/o88xPCwZmBfUXgX2iD5ykoFufJEmDcu7GsWz2HaaUoD52GiZJBHzsp03UlPXUTkeM9Nro+63liTXqQ0wjbGBZfxT8DfCE9brUDeyMAGD5DykZor6N8UvztCeU6vyMDT3rQycLdL7YKleItbOmpEwhHsQHUeJEvb1rXepS5HTjFH2HpTF9H5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sprenger.org; dmarc=pass action=none header.from=sprenger.org;
 dkim=pass header.d=sprenger.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sprengerengineering.onmicrosoft.com;
 s=selector1-sprengerengineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/3q/hhLOlVAHcnvsB2ev7K2nfxuBTsjc2wzWRSN+m8=;
 b=DlUd0clfRWlV8Tzi4rQED99DJiQXkvnyWvMl2kl+se+FsZyZJuJO/kq9JuFr/fb9oiwXdP4bg16QFV82aubqWU5qdjTI3sH0JhENguG3UQDHPD2/Qy7poWactQXb/IbLD4nBvnNYKaP9a6xmLUotPfmWD5Djlv2nktgMbda9xmo0Znqs87Q2LLGivDdDfkr4FT1FzmVIRuSmjRgMj5yvCi0yIhb/UA7dWuqo6kJn4GsO+pESlER3zVE0PjL7yvW8Rhi98kT0b1KEXuT6Zr1J4FdKEdqe9PsyajE0qu+FQlI3h7OyOydlv9MHbqJez7k/MVwzwdvB8jRH1uovRTeJ6Q==
Received: from GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:23::13)
 by GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:52::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 14:02:14 +0000
Received: from GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b0ca:865d:e3c2:a13c]) by GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b0ca:865d:e3c2:a13c%5]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 14:02:14 +0000
From: Bernd Sprenger <bernd@sprenger.org>
To: "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>
Subject: Patch to enable overriding linux-ti-staging kernel
Thread-Topic: Patch to enable overriding linux-ti-staging kernel
Thread-Index: AdkfeypXxZfrqqPRSTSkvUKvdn48hA==
Date: Tue, 3 Jan 2023 14:02:14 +0000
Message-ID: 
 <GVAP278MB0117A08C96137519825B1E57DBF49@GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sprenger.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVAP278MB0117:EE_|GV0P278MB0767:EE_
x-ms-office365-filtering-correlation-id: 0ba0a012-c49a-4c69-9341-08daed931dfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Y4HRNOAx//TtzZNFcwrHzsDLelJiVEJB/xWGaFauN7OrSpL8Ww6cnckfOmze3+jYIUIyGNeny+bmb/HvGBNto51oxvVn7RgAZNh4r/ozYvFnsmNUD7hfSAto4r+xT59YEVaOKh10UyLUAnoSNGUTNk8rkiWle5vEA7Mr2jVsK1/F0P7pkZ92zIUwtM7P//mGQnT+jTO11OSDVWpgr9eLrc0L+vdXJovweMdraFh6pfPsYiIcNx/Q3OUSOASsOKCyfI6RfyUDN4xrZYFfRZxhaDfYfubzqJt/RV4MDJFBoXO1PkomVxMJO+r7qhNoeUzC0AeXSasYgw9w7TvpK911kVVM/RdsP8HdmRevmEdpfJ0Tyob9+Tw7AYb/DD9aoRJ8EOFTYcq+wYZFhnFQZRQuYE4z0l6eY/sskdDnT7+QpVyr4y8u6jjrJtdTenWEocgJ79o7pnJUA9cHptlnYAKfEZOkV+H3aKH3DhJDS6oNr52YY2/VDJOvhzinZatPwCX2Ua6hodZSe5w3SD7R56TPDSGHTzRqGzpKFtmTq2+Iw8/n4pD7s4STtbQ+AssBb4RKmXe1hwyEQawflc3yT28gqMOYAAjohuHqwmH8G53/CyQD/WRtFfNKLnICPwPfRsLOTS7stnZUai0KeA4tEdvHNCNV53m9nGjzJGGfGVVDWIO81EXHapVX0njWPjxv4wsD/lf074FAzqybSXfJ8EOfLXBhRDLnQu2zeoeYU45o2U8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(376002)(136003)(396003)(39830400003)(451199015)(186003)(26005)(9686003)(55016003)(86362001)(33656002)(38100700002)(122000001)(38070700005)(6916009)(52536014)(2906002)(316002)(9326002)(66946007)(41300700001)(8936002)(76116006)(5660300002)(8676002)(64756008)(66446008)(66556008)(66476007)(478600001)(71200400001)(6506007)(7696005)(22166006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pwY+d5JeTcmuOJU5sFwjBiEVwW59TjuU2CPhvw133liv1kpiOO+fxcNiw08N?=
 =?us-ascii?Q?IW+vulw6lWJ1bz8W4W2ItFBDAxl4bb662D5U1xWts5pRBLtg7Ak76hVDFmfI?=
 =?us-ascii?Q?qMmxARxitJFT/LKjH0gKi8OxloSPLiRR276Jv7czMRtUMvkU9FHeSRmf9rrt?=
 =?us-ascii?Q?V89UoRcfeKheY7TzSuR3yOI4qw2BS/x/ZVRGPHrlBWk3tNDyqWVBr+X/FKcv?=
 =?us-ascii?Q?JhtrpjSgzX9mCTH9RdeQwwOJ8YmQPgWNaSqXkAbDTzhYFpkINsSMSpRBGnOI?=
 =?us-ascii?Q?AwzcojJtdXB1TLr7FS+qNbNlEHJB5Ik3csiZX79odM4THxAuBPZPCw9sgiKc?=
 =?us-ascii?Q?oMMhERlGC3zmjM1wEaMOUu3Lr3twK9YSk9jKCYqZIB99Cpst9x6qgKNt31oc?=
 =?us-ascii?Q?YGpfnAqRYixSbU0CzuaT3+gE+yDQFNWEy+KzDvzilOnh6QvmApHp/t2AYKau?=
 =?us-ascii?Q?OD620Dz+U50L+IlzoSSJuAdgziw481A7HgboaG2o/FQs1AmDRb3mfG97o+HB?=
 =?us-ascii?Q?NqIXCN5tWlspHyDaj7e18Qgajj/jh3EG0iGynEPaS1Rj3qJ6u4cYO3sIZeBI?=
 =?us-ascii?Q?Y0DXjzLcK1B+mU9PzHqma6xFhpKiQ6R/ERuX6knRTJCPNscDdHiCrWminxcx?=
 =?us-ascii?Q?icRJ9i/3dT8I+8WOw2Y4bvMTFb9YETmAEL4xRicYKvqDsSgFIFpRpQ/qL3Z2?=
 =?us-ascii?Q?mjO9FtvgnON8JgvCFNwBQZYM2ufqWDm2Y70J31tEO5sdjbQFqrC0zYTWFr5M?=
 =?us-ascii?Q?99+e9n7jK1QWyw8nbjmA7Xkwz/6t+pw+dOtxZs4Hs0+v5nWOlwp/jDzC/wxG?=
 =?us-ascii?Q?fSv3fNSU0/wk6Ewjoo2sAN/TxZKHiaQ8PyQ5+ttnIe0v+WoH6w8zNozK43QV?=
 =?us-ascii?Q?Y62bDV3mEyyEWci9GkP1O7w6cSOPGY4x091UiumTjnQ8pW8v9PORRy0OOUOZ?=
 =?us-ascii?Q?4HhLzFR6wj/EWykqu8yLe0I+FF8jHO3x4tFGfAX25mhLYlSDRKYXSMAN6ohT?=
 =?us-ascii?Q?uQLfqod8oiH/keCPkrUfns7cDVDYkHQ6e2X5/AJl4f/nhUWTotwqekJ5XWMD?=
 =?us-ascii?Q?s0CgDawa7Ta6mbKSejCCT09/weqnY7/rSmvGo6CX1zrz8Ue4SDY5ZRgIdPaY?=
 =?us-ascii?Q?RXHCSkoM2xb0DdmFxzWwVd+dcCY8BBlUe2yYwUnMAttwu4+YrzhWGm0zbupQ?=
 =?us-ascii?Q?Eu2awHRx4r7G6qw6OFHf2odK2aBcV4tzDzfonryGMazhRF+0oQJ32iiKHUTv?=
 =?us-ascii?Q?Ad7LGNWYiMECwWn23oXmmm3h0T4zZRDIr/On7fs/6KhtMCPzhBBmDgfVe0Gq?=
 =?us-ascii?Q?tVApE9TXu39wmE3YSSDDfgxJ2mbvLT3LlpIvZlwq7C4Qn9VfxkXNyG7ibKY6?=
 =?us-ascii?Q?lzLYL4rJp3Zp7hf1yWO/mzllVNwWUhbtfWzTKOqq1AJByENiGhkMluo2AfyK?=
 =?us-ascii?Q?n9wS8dAHZ3E/hf2vSdWG6TaEcecdLKAYQInYKGq/Ui5UvrJkwiDFjTAT2CyJ?=
 =?us-ascii?Q?NgznkK+86ByJ5RVrUjBT4c7pJAGFI6OIwIu9w8X6nb5v3617aq4gpC32zIEd?=
 =?us-ascii?Q?uaOZwXoUTIv9+ph3xLU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_GVAP278MB0117A08C96137519825B1E57DBF49GVAP278MB0117CHEP_"
MIME-Version: 1.0
X-OriginatorOrg: sprenger.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba0a012-c49a-4c69-9341-08daed931dfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 14:02:14.4867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9bc038f3-4d6e-4487-bd4d-2c421d9246bb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ecNpuedq16tYnK4Vm2tQNVdj5er3PA4MNSAmtB7DFpAccrKuukfJmMSG0dW4W5IFJCBS6lcuzdyU//O5hHzUeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0767
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Jan 2023 14:02:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14142

--_000_GVAP278MB0117A08C96137519825B1E57DBF49GVAP278MB0117CHEP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

for my projects I use another kernel than the linux-ti-staging. I had to pa=
tch the meta-arago to achieve this. In my opinion this is a nice feature an=
d is achieved by the small patch below for tag 08.04.00.005. Maybe you coul=
d integrate this into the next releases...

Thanks a lot,
have a nice day,
Bernd


diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-a=
rago-distro/conf/distro/include/arago-prefs.inc
index f9fab020..dc55bfec 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -37,7 +37,7 @@ PREFERRED_PROVIDER_virtual/libgbm_keystone =3D "mesa"
PREFERRED_PROVIDER_virtual/libgl_keystone =3D "mesa"
PREFERRED_PROVIDER_virtual/mesa_keystone =3D "mesa"
-PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging${ARAGO_KERNEL_SUFF=
IX}"
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging${ARAGO_KERNEL_SUF=
FIX}"
 # For TI devices with only baremetal/TI RTOS support
PREFERRED_PROVIDER_virtual/kernel_c66x =3D "linux-dummy"



--_000_GVAP278MB0117A08C96137519825B1E57DBF49GVAP278MB0117CHEP_
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
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for my projects I use another kernel than the linux-=
ti-staging. I had to patch the meta-arago to achieve this. In my opinion th=
is is a nice feature and is achieved by the small patch below for tag 08.04=
.00.005. Maybe you could integrate
 this into the next releases&#8230;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks a lot,<o:p></o:p></p>
<p class=3D"MsoNormal">have a nice day,<o:p></o:p></p>
<p class=3D"MsoNormal">Bernd<o:p></o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-bottom:double =
windowtext 2.25pt;padding:0in 0in 1.0pt 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><o:p>&nbsp;</o:p><=
/p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/conf/distro/include/a=
rago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc<o:p>=
</o:p></p>
<p class=3D"MsoNormal">index f9fab020..dc55bfec 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-arago-distro/conf/distro/include/arago-pr=
efs.inc<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/meta-arago-distro/conf/distro/include/arago-pr=
efs.inc<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -37,7 +37,7 @@ PREFERRED_PROVIDER_virtual/libgbm_=
keystone =3D &quot;mesa&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">PREFERRED_PROVIDER_virtual/libgl_keystone =3D &quot;=
mesa&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">PREFERRED_PROVIDER_virtual/mesa_keystone =3D &quot;m=
esa&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">-PREFERRED_PROVIDER_virtual/kernel =3D &quot;linux-t=
i-staging${ARAGO_KERNEL_SUFFIX}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+PREFERRED_PROVIDER_virtual/kernel ?=3D &quot;linux-=
ti-staging${ARAGO_KERNEL_SUFFIX}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;# For TI devices with only baremetal/TI RTOS s=
upport<o:p></o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-bottom:double =
windowtext 2.25pt;padding:0in 0in 1.0pt 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in">PREFERRED_PROVIDER=
_virtual/kernel_c66x =3D &quot;linux-dummy&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><o:p>&nbsp;</o:p><=
/p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_GVAP278MB0117A08C96137519825B1E57DBF49GVAP278MB0117CHEP_--

