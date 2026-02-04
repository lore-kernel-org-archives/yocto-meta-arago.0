Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62222E9D407
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 15:56:18 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23749.1770220574060391128
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 07:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=g8fM+8f8;
 spf=pass (domain: list.ti.com, ip: 52.101.61.9, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJ0FCGLdqos0+3JJn2WXyMDbkAesJG+5pjVklLcL0XucdhusWQHoiRBoZKy/PenntM2jR1x7X3dWxCMw8/T9q3b7H2pJdvPibjFAUdBijp4CiFX7Tv24e9Cx8+jUGUQo+wPHsGgxvhJQ44r3XpCafDBngD7TQlmGC3SMzDFIx+U/StDiif+112K9hJhJ7Uv6/wsxajlSXaeZI4WBeaxLDCab+H1hhk8mYSOT6YJWwJSSwXmIHJt7ionmuiGDfWilhWLZ8Obn7nvZ34I4NKpSZ4ky2Re5SYGbO4dw1TlWCz4vNjl4q5QJXHRj6onXthFnE5FWT7Rlh835VoattvIutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hKA7KOK1/qWsIrw0Qja7+4/PW+94ajhGFO/RSoaYHg=;
 b=ATyp9PaeNjLdG42EfxJ5+Wa05/xU3v2+agFdx2Idik2G9fGcawsL3kdHpCo+I1/wZdutWNXzqQGdjyeN3XSEP/Ko7RgCoUu9DoYSQJgAjWzCRZe3pDt4I9e08iVKyomdrpvFPlvptr87fU0SRDc17WDbf9H09XPQXhkUOr4iEqPq3eiyNCAfJdLt92NoliVikvCJussw3kE8rjHAXFwo+/a80EC0kgCSjOoxetA7EqL67pLsM+aZoeudYspx5w+m3tr2bFi+QyS3PiBia8nj6YeGg2Ym1IJHjI+KEjto+8Qk2AgcLPoL7jspCVdCAfDgNDhxBRs+vjq8Y57pUH2lbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hKA7KOK1/qWsIrw0Qja7+4/PW+94ajhGFO/RSoaYHg=;
 b=g8fM+8f8Mg1eEs1ZVRMR/Yk+NU98BR1kkuTaY1M2Yuk6C2RmLMbUhsyXq+zaqkXHmTv4lu2WTn1FhiFQcP0gNW05dFV6u5CHDTAfId46lteH5gVP2EtxHcMhVoW1LYQlxadq7rETVNCykCT8VpojNIohKsPv/mTjT36zz7QrSmv/IotiqWSVOHhYv81PkXHP/04RCrUinaKdxr/bHD4niyYpzBXCgOLYAbVc+s2RJKbJ0kEmKQ5woqtv7xwlNw9F++cvkImkMh3P7p462DA5gXyFyBY54ONDRrmDeI4d9noETObGBoTKy6v9tybcqDYMDqA42+Dd7mONrJX2FSVPqw==
Received: from PH7P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::19)
 by SJ2PR10MB7558.namprd10.prod.outlook.com (2603:10b6:a03:549::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 15:56:09 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:326:cafe::3b) by PH7P220CA0012.outlook.office365.com
 (2603:10b6:510:326::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 15:56:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Wed, 4 Feb 2026 15:56:08 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 09:55:38 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 09:55:38 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 09:55:38 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 614Ftckn1374855;
	Wed, 4 Feb 2026 09:55:38 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6ACA89ACF4; Wed,  4 Feb 2026 09:55:38 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-arago][master][PATCH] pulseaudio-service: Add systemd service for system-wide audio daemon
Date: Wed, 4 Feb 2026 09:55:38 -0600
Message-ID: <20260204155538.3316116-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260204155219.2386647-1-j-sahu@ti.com>
References: <20260204155219.2386647-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|SJ2PR10MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7b2fb1-d9a2-4e64-fa35-08de6405e936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v21NEfaDRKJgJQkuTz7M3EzKaTDu8fuvGW8882JP0Q2Hoon+/kK02Z5JreRe?=
 =?us-ascii?Q?0OMo/k/gmZBQR48a0jriVQUIyAiTiWP6tlUnq39n0JtfRE89zVnGKv+yiAsM?=
 =?us-ascii?Q?J80PNZ4JEaFBsX1i9mt9MMqutIEfLTMmZ7LI4kNLHnjPEKieZA56U0nLOQd8?=
 =?us-ascii?Q?318ojaczLJyB9LztyHq1V3fJmczitoabTc6tPKZve2C93AbPr4EHe9MYuijc?=
 =?us-ascii?Q?Q8p8OYVPfFwG+saxUk2py+DmZ7wXxY6YshDN7+CScUEHrk4g3PlreM8SBK71?=
 =?us-ascii?Q?xH5kavBX+ILJi9TGB3JTFn+MW1LTysuML1nmVfFHgDbR3dRpADtmD24NRHDy?=
 =?us-ascii?Q?r1D/Z38SsyRfo+AxOSjV0SublcQk05ZMPNyf1Fi21t4a4wOyP5eBqdlZ/pIT?=
 =?us-ascii?Q?BcDNS0coan9yOL2tH213XmHMk+yM+WAc0VsG0RbJei9Uf8K7XwdzteUGjPBB?=
 =?us-ascii?Q?nzHQ4LdHKM9iAjCMhEc3Lvh4d7wj4q7hhfgPQX06oSso4e9m3MQA2h6XM75p?=
 =?us-ascii?Q?ReZlUTD5/5DjsmfS4rUXtYr/FjcLKIOG3aVbOCcsrx1LOjNsNrcCIl+/OO26?=
 =?us-ascii?Q?IBOdX7voLe4sMnyX7Aa+ZeeZSkPJNj6O+tIXMYiYXYWCncL69B3yFGeq9wK6?=
 =?us-ascii?Q?C0J6g2CiFAKA3KsOtoxP3OhUsNGygwnkvgTTZzzZ9k5bX5fNs+/kh84vECDy?=
 =?us-ascii?Q?L+fg6vw4hdSzc1/2BHCZuasjvmTVLEO00rU+f7Om95JVJYMARRuxL+MaMAMP?=
 =?us-ascii?Q?2WlM0Y2R9M+jmVOsef17lVxxbynlrOzSsSaEaLUPUGYCCnSphTy/dyCqDKGD?=
 =?us-ascii?Q?Jl7qGa5OtKcGFsQPbHJusZ4FP7y5wZPA0u9u17Evk6PUeGmqxV15PKQFwu4g?=
 =?us-ascii?Q?ZRwFphnXIl1b+4EeWPy1EzYgotAGQRhRGwlleHm8wud1/g+RayzqhDaOFIiM?=
 =?us-ascii?Q?MgJOStRbpFTO0zOs7RhZSqKxW9AvVhZHB2mPYRqo8Rx/1NuKo/wcNHHbS6Ir?=
 =?us-ascii?Q?bRaYiN6vw+KaMQOFol+SW56FIquHJOreSF1ypW6vGL/gS/TZ5MRp+kfX//7h?=
 =?us-ascii?Q?wugzvrBHHeNkoUgf06P+oOXHAszlYF/Qv75DPirFrOMyctV8oYu6TaPeavhm?=
 =?us-ascii?Q?T+J86DpzK2egWqtGZFKW9rX9CbMQqa+2RVOWw9WYYMZXqNWreEOWCGMf/+Lb?=
 =?us-ascii?Q?85H1jbXvsJ1ha5zfpNIknz9Rcf4kVVR+/Spp24qu39HmcgaQ9BSAqe1mQAnG?=
 =?us-ascii?Q?xokj2NAoybyLcsJlG7468Tg/ghhMAhd7rIl5sQKCXE/TfkZmJUmca5I5vEUi?=
 =?us-ascii?Q?Jmvj/v124gsD3xUskqKgT6WIK8utCW4It3biCgtTw6j3LFUNgL6O50kFhhmR?=
 =?us-ascii?Q?DNlJhl1LaUEuWhAl8dTdal5yYNw+FF4K36BYM7+cmJ6xUp0UGiw/w3xuqsQn?=
 =?us-ascii?Q?Ex05zjGVwJabzSqa+KbER0Dx2r3sIRt+YVsHo1JcLUht+dJvEAspN3vZEjSE?=
 =?us-ascii?Q?0kWJepjY7DCrq3ebQat9c2XwQiCh3jbfiZLUaDSUHLnY/9BY04nfzpbDIfDw?=
 =?us-ascii?Q?gQmqco6CEzvTf8BpOv/YyCG52I4UYq/o5/8Y+0KM+FbZR/StRQ7qo4NRyHK/?=
 =?us-ascii?Q?nOtn/iZgh1EIXNATU1TJn6U=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rvL8JinzABG4/ApH4Whsw6Xi0lgSfr09ZGG8BzIc5IrRAtlrs5GA5apmEN9hAmBX5x9PtGegpD5Nh4gOa7kBzcIbibQw1DisktidPaeAXxRq7Orn4GDQBLZo5tpiWpkJID5ilf1UIeCMK1o+LQuA5+gQ4Y1yjwCVB8G5q3QjcukKxfEfRRhgbYt2J13ts5Par0zLJYqnMCdhvsmqrPAdFhgz9J1Wd5EJwlZyup7OjUGnSVlFC/jswvFyc5LZQNDucNdkQfU+TgHQ8S9MSPmxTf4Vh94CuDYf0FR3gwmo92DXmHG636TsxDCiiR+/wNnNP001QbQAL+Lc9jTBVjY0barAsOflhd0ncjeEHIyUv7BlyR5opJeI5EDAcRIztMDGDQbgDaAHXNDNkSntmXiBwGuxUaARhX6nmQ8nqrw/sVWvL/HD36nVz7rq0SE707I4
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:56:08.2217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7b2fb1-d9a2-4e64-fa35-08de6405e936
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7558
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Feb 2026 15:56:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17078

meta-arago / na / 20260204155219.2386647-1-j-sahu

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] pulseaudio-service: Add systemd=
 service for system-wide audio daemon
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Wed, 4 Feb 2026 21:22:19 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 178b67069851613e6a41b2cb1ae30379a=
8120ebb

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: meta-arago-distro: Remove tisdk name from Arago packagegr=
oups
- Commit SHA: 5fb7dfe249b07778f706eb50635e2c5a2c56b13d

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: Are you missing a PV =3D "...". (PV-1)
        meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-service.=
bb
   =20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-service.=
bb
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




