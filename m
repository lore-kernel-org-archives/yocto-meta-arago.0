Return-Path: <bernd@sprenger.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13B9C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 13:54:31 +0000 (UTC)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com (CHE01-ZR0-obe.outbound.protection.outlook.com [40.107.24.96])
 by mx.groups.io with SMTP id smtpd.web10.64039.1672754066380805219
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 05:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sprengerengineering.onmicrosoft.com header.s=selector1-sprengerengineering-onmicrosoft-com header.b=F2u5Y1u6;
 spf=pass (domain: sprenger.org, ip: 40.107.24.96, mailfrom: bernd@sprenger.org)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heMeVcGuNIG4GL0vTuSBpqnvOQ9hDeJJm3itAaYS3EcSWTOJESeK9kiJteZvuGJtKIt7oaqnftKd11jiZYf1G0Li1OlTCb2pSz7UFfdfwqi77Om6zLmTT4/yFNUPY1cjOMJ0RTYbG++Hk3sCLxTn92BKzQSdiy6ZyU1DY0qs1KRi5mJKXIYW+KC4QBSr9NG3EqF86sKY6msIXhQfIEKyXwnhOZkdzn5i2iSw76CwGjpUpAomn2oyiSf8mvGbaH8ilbIBWm02UOCWqJP0nZV4CBbGmNUPJ1XVOPLMgXeCcEC/wfmL8/COuccJA9pb4eo7TEmT1l3H64jrVDK4ZLRyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEseOfq6e87MS953wS4h3YN0Mwxw7O3knUHBoN604LY=;
 b=Yru02MGVrJMdwMG1Kc30j/9B96EdjXvghFUAExSCVRv9bNq7/XwfPH7M0Pp/j19QLEDouhKK43YzXulMykHJU1Po2eDS9ivJ5SihJ/XyVDv6bV6lU2oHLzj2S9TXEoSAdD1KuKjIeQZTPX1zCxLWNNYTNdIZQy21A2QlJlKcJHe2drg7SSnLleBRjseSZJY5KDMrft3lqRw2bdldJrli3Li0ZWJh538gjvNotoPLHd0gJrWtJkL5AcXnAKRHPFidYY4NqGIBe1p0DKSXAe1UEd0+BtyGmO9dY9BQ4Gmlb13wpcSFq7Tj2lKp/B1JjYnXRzA7yULnZfkY5X9SIyWzOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sprenger.org; dmarc=pass action=none header.from=sprenger.org;
 dkim=pass header.d=sprenger.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sprengerengineering.onmicrosoft.com;
 s=selector1-sprengerengineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEseOfq6e87MS953wS4h3YN0Mwxw7O3knUHBoN604LY=;
 b=F2u5Y1u6cskDa9TS/4os0JcgEbGkNoNbZ6IssbFXFbJbuLwVbrqGTczr0yNBK4Y0X3GfOAemzQLSQC84q9rP1BqYx6uERFkCw3qt7JYRNO8bhyRyY7B/zDtdfhhilXtaTWV112CGnqNN2pnt4oeJxhCTRttnZs7La/LO/vEzEc6rjtZJkJcHLUJ7Q1zTbhLq4OF94rBpTwxMKQy7LxV3TxGqXDQyShJagYLcLdQwLpcWnS/Hxhe53Mvg/y1E2EoJjOz+WgWVcD57Zm4txUrLr9hFSGBxpA5XULxJoVC1PPFotxIsNQBurRwKu0Whbj7m8TaijEAYhSTRpZH8N3n/AA==
Received: from GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:23::13)
 by GV0P278MB0750.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:51::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 13:54:23 +0000
Received: from GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b0ca:865d:e3c2:a13c]) by GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b0ca:865d:e3c2:a13c%5]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 13:54:23 +0000
From: Bernd Sprenger <bernd@sprenger.org>
To: "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>
Subject: Patch for enabling yocto populate_sdk
Thread-Topic: Patch for enabling yocto populate_sdk
Thread-Index: AdkfeWTtilXBDUmcRu6d0rQ+xnNHIg==
Date: Tue, 3 Jan 2023 13:54:23 +0000
Message-ID: 
 <GVAP278MB0117C3BBC581C7A3D59986B0DBF49@GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sprenger.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVAP278MB0117:EE_|GV0P278MB0750:EE_
x-ms-office365-filtering-correlation-id: b62628ab-328a-42c8-36e4-08daed92052d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zcqE7JVsnG9rKCBHM6K0GeqWmK6qOoAcBSl0WB1OBzFOWz5pXd2cB9vodMr2ZaXK/KvD/tmyPFYuxw+fJ8TQ7a9fl01tn1KVs5R5Ey7au/E4l4zbbZs9on7ijspc5ZJlHqCxzsKWDcl/cawwFl6TJrNYvwM4wgdp7BGkVghqQ2aY50gP8y4Wh4CAm4NVsQBYP6LWfKRno2O0IX4Y+vJ0iK5UkYtm87Y3Sxn/Nh83knLsnOJBsS5omkp1uqRv58GNU+rVrj5T17q9wbBZlgyLR9NweigbwiWwAJPXyKgM83TAX0bV084eenMjb216gSCMM0vb//Li8q2AKZ9r0gFSIP4ipWZFH2AYh/gqvSan5rPeHHORSlqSmOtZM+FfvSOl4STq8cZbWavu58rNiH3Vx3U0JvkNlF5y55rk1qcaOorsJMYzPV8Ts+LtuJaDsNZb6o9YBv6YSkk5fXzIbh6D0yEjpfXoQpTQCG14ZqvWo6zMYGkkDs2epW1xPzFUeG1cjgRxkYVoNScvCeh4KvVmiTa6bY25X1K0ILIjeZJeJ2mLxd3lHGOdPS9Py9J3kybtUEyqgCpabNdcKSXLld7RYJcdmpMrf9RaQKgDnUIAgXreuVT31bdU+l3ZgWuKREzFWMq4t/z1zUuACL1uiD+EhNIVS0Ql33ij80QXSXSFjexXBnwtv6u1sTRkjrBn468a3OFbkjz3zLfCM8GW2GUGDg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(39830400003)(346002)(136003)(376002)(396003)(451199015)(26005)(9686003)(7696005)(55016003)(33656002)(6506007)(38070700005)(86362001)(38100700002)(122000001)(186003)(9326002)(478600001)(41300700001)(8676002)(2906002)(52536014)(5660300002)(8936002)(4744005)(66556008)(71200400001)(66946007)(76116006)(66476007)(316002)(6916009)(64756008)(66446008)(22166006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RlD9x246NROP7/baZNzvpvno9r+LFCUM2x0nD/qREVmJblNgVGN/StJeGxsX?=
 =?us-ascii?Q?VN1og3409Lpq7vkSZl07HP5eWRYDn+6GTcSDLrerAfFKFFB4QUxqoe5RYsle?=
 =?us-ascii?Q?5SWC1wvUpFO/Hurcn0euDfRdNE8NFL8Vx4c2XvB9PJtxKqCC1MhPSwBfhXz0?=
 =?us-ascii?Q?Eyde/Vz9cf/HJC9MVmEamGr7yd8Wu6Re7Pa3eymb7XJ86OVXarMQNp/jCAIQ?=
 =?us-ascii?Q?laISUoulBfS/FMp2SpTw8GTheQlgtfZTRUPoPsAukbVtOntrv+GczVkH9+L3?=
 =?us-ascii?Q?WOGeG2KadFU03PVHb/td5KbsMjrrpFeG8z2GGJvXkgdPLGC4BUp+AW9vtIwq?=
 =?us-ascii?Q?VesX48AW5YFwB5J2QOBa4Bmz0aaT6ft2hlfFyNZzPno8kPp7FaRk3wzxlAyR?=
 =?us-ascii?Q?scJbgJcwbyv5zZfdo5MGotm2ZhDlzxry3VFRClnEDOrjMAGUjd9CHmCh9P+P?=
 =?us-ascii?Q?R0a2DybeJmUzHy9spMTlpDknnLX94GlvKX4ociHS7rJbvXiiviQsoizjNqE0?=
 =?us-ascii?Q?GiGtZjakiRM1+L2JQrvbAk68nWmsvLORrhENAnTndXjAq1H8XcjQMoHB6o3h?=
 =?us-ascii?Q?/LIaIb8y1ouklGQoi6vs833sM6gbYupwdEVPTsHqgqO9Bra7k53uzg+XAaM3?=
 =?us-ascii?Q?lZWZ9jfcZNNNdb2Fy5+uXw3wPBw/YS2Vfe9aUjnRbKSMEHswaj3tl/0AlEwT?=
 =?us-ascii?Q?5dxtQkYOvQflvNf6GeoN+71dFAP1eSFXCtLgvSm6jr9Ei9kuDVd5jV4dZEfM?=
 =?us-ascii?Q?yWrVrYR/GT165331vav7MjYJRjw9N3uyEllr6t60e0kq53bY7qW/ZU6PfdoV?=
 =?us-ascii?Q?9xfcuxlNBxOC8gbHYwMHmPFpoWa2UxsQXheUrDccAoFHIoki4tOv0lKhxbPA?=
 =?us-ascii?Q?AH80jwHhIKBdXxnq0RTXR2o1E5EOTOEQaIq6LMYT5naw+iWxV/NHemIbkLHo?=
 =?us-ascii?Q?XmxR9RvXvnyBCCEwngyrputq6MkDxbx8/xtYF/IwRPC/KQMgvtzGjvDzCkbn?=
 =?us-ascii?Q?SUjBM9E0UwJCpddG7PkINvRxd8LAivmTUDM609l+Va7oIII6BCyQrKoG3Z9J?=
 =?us-ascii?Q?QoRRiqeqz/9ydblxqZfh8Acm5hHSg5H99nntvQe8GuPN16sgd7Ek+S+jGNFg?=
 =?us-ascii?Q?kjZWwwGZlGJ8JYKHs0XKBNkPo2A1oBGWTUwBuif/0bcy0fE5CnVgV6rku/Uy?=
 =?us-ascii?Q?W5calzqTwL/E5nbhWoIAXRLnIUoXURT4qwUL703o6r+iI2OG5Y3VIRhG4xSA?=
 =?us-ascii?Q?T+iYGUjq3aketL+5XpNau4doetCK8Tj5R2E7JiSqr/ZA1qYo6Nks+EUYfw70?=
 =?us-ascii?Q?XNMRD52I4L5LBr4/A3zzGMJZZ+3041l4sbjZcY+nnDdAAlxHyuAIU17c3b0I?=
 =?us-ascii?Q?D+uxzypUkiV+PxGpdK9Mtkt3360DOx1ZJuDj8/0MFQN0E4B9GZ7HKUw5iW8s?=
 =?us-ascii?Q?Mm+nWEJ+k5syi//Vxky4tt/vd7CDI2enNtK+lRtgLt39v9zSTftfW0aXGan0?=
 =?us-ascii?Q?mKEhGoYxtIhRvBTzTiF8eVCGG56ljTMDt1rBkVImCo0OzlUodNB9senBHqlS?=
 =?us-ascii?Q?jw+m/MLgqMUJCmGPV6E=3D?=
Content-Type: multipart/alternative;
	boundary="_000_GVAP278MB0117C3BBC581C7A3D59986B0DBF49GVAP278MB0117CHEP_"
MIME-Version: 1.0
X-OriginatorOrg: sprenger.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b62628ab-328a-42c8-36e4-08daed92052d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 13:54:23.4047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9bc038f3-4d6e-4487-bd4d-2c421d9246bb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ryfSt2IjLtnvZl00Pk7LmC3TvHSiSFxTgrAIrNYOxqLxssgfc+0zJsDZY9/eN0ER/F0zmrdqmBXhZhnHwfvyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0750
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Jan 2023 13:54:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14141

--_000_GVAP278MB0117C3BBC581C7A3D59986B0DBF49GVAP278MB0117CHEP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

as a dumb yocto user I would appreciate if a working sdk for cross-compilat=
ion could be created the yocto way by appending "-c populate_sdk" to the bi=
tbake command. Only the small patch below for tag 08.04.00.005 would enable=
 this. Maybe you could integrate this into the next releases...

Thanks a lot,
have a nice day,
Bernd


diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-a=
rago-distro/recipes-core/images/arago-image.inc
index e068287e..2029ccd0 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -19,7 +19,7 @@ export IMAGE_BASENAME =3D "arago-image"
 IMAGE_LINGUAS =3D ""
-TOOLCHAIN_HOST_TASK +=3D "nativesdk-buildtools-perl-dummy"
+TOOLCHAIN_HOST_TASK_append +=3D "nativesdk-buildtools-perl-dummy"
SDK_PACKAGE_ARCHS +=3D "buildtools-dummy-${SDKPKGSUFFIX}"
 make_bootfiles_symlinks_relative() {

--_000_GVAP278MB0117C3BBC581C7A3D59986B0DBF49GVAP278MB0117CHEP_
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">as a dumb yocto user I would appreciate if a working=
 sdk for cross-compilation could be created the yocto way by appending &#82=
20;-c populate_sdk&#8221; to the bitbake command. Only the small patch belo=
w for tag 08.04.00.005 would enable this. Maybe
 you could integrate this into the next releases&#8230;<o:p></o:p></p>
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
<div style=3D"mso-element:para-border-div;border:none;border-bottom:double =
windowtext 2.25pt;padding:0in 0in 1.0pt 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in">diff --git a/meta-=
arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipe=
s-core/images/arago-image.inc<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in">index e068287e..20=
29ccd0 100644<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in">--- a/meta-arago-d=
istro/recipes-core/images/arago-image.inc<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in">+++ b/meta-arago-d=
istro/recipes-core/images/arago-image.inc<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in">@@ -19,7 +19,7 @@ =
export IMAGE_BASENAME =3D &quot;arago-image&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in">&nbsp;IMAGE_LINGUA=
S =3D &quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in">-TOOLCHAIN_HOST_TA=
SK +=3D &quot;nativesdk-buildtools-perl-dummy&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in">+TOOLCHAIN_HOST_TA=
SK_append +=3D &quot;nativesdk-buildtools-perl-dummy&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in">SDK_PACKAGE_ARCHS =
+=3D &quot;buildtools-dummy-${SDKPKGSUFFIX}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"border:none;padding:0in">&nbsp;make_bootfil=
es_symlinks_relative() {<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_GVAP278MB0117C3BBC581C7A3D59986B0DBF49GVAP278MB0117CHEP_--

