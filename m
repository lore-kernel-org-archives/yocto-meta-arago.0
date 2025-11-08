Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7600CCCF9F8
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 01:20:34 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.114.1762564826530656748
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 17:20:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Qx4EOCVm;
 spf=pass (domain: list.ti.com, ip: 40.93.196.33, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ph/hn4Q9qpfPvFce+5NP2vXYPwEfuLjhd6VSTL/qxCz27KvyJfgb7mw9x/rmt88nORQIgKADIG/8a5hQF8jk67IiRtgmdxZboE9eaqfKhuM+FS6onf1X0YU+mU13cbWYrk7KbZvraAKqJVUUqhUrkdzBtO1+Epsbtg5+QgofeybqwvJsg0hsJFlmoKdI/2LLZhTZTgb+Q0n7Vx74L4YZ2cLjtXscH3//VZh9BOYisKkmlf8ZZLLNLTpmRXc2zEcaW6HsD3z67nO/x2IEunS8YAXRp2kQAPc6PbscTP/4UocFpHtCuOI+DHz0aUo/JtFPd4pgQP0GFgixMCb5C3gOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zZx2o48gxrlJcv80JzhDiPNIT33OlyhklIgQrOeHaY=;
 b=BZKFiDKzESfcqcAp0GT9UmCUdbQfqpkFac35TytjvSS91ezeWCjJ03ZRnG03tqogGLivdZtg1zDn9gogMzvnXVA0Nx3wFdJfQ9lqV55JGx7SyRdZ+7pctMI+isR5rwwQgyzDNueW3fiFZ4OxritZZf/zF9uGO2KX1bdsio3YAbnjj2lpZV9yIa0H8ss6ZgVmgNxVtb2ERzYLlqOU6fndMX39Qz6JnRxX3uSzsd6V5rt/6xez9L6V3KMORjZEmXuLhJJSSKS//440lbxlcIrfk3OpCo1vlVY9Oqj7GrloWSd3mgYHQBhMBY55lBCkiae+4JVc84ElnblEoZahZO65qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zZx2o48gxrlJcv80JzhDiPNIT33OlyhklIgQrOeHaY=;
 b=Qx4EOCVmj6Tu26oSO7kVxtrjz7sTjgyJw7mlX9JpuuwJEMHAlINgqkzsw8faT00489pWTJhjDegFbNTfbPwEi/aV5Yy5Mf/8TxYhTTBET25OGQ4mQ92zPcSchMsh1H6lWBXiJPEHaUm5OcGgiOExoBR4k07HkkYvmxNTePJhzzuXbAZBriT2d32PduqHUbTG9SHGblPYPHv+FpwYnff0ZMto/0rbvPMibzfwuo0TuwWNuBo821RpRjNqvHoz7uvSvRCLh/WfiD+DJjh90rBFBDB6UrSEtz3Ceqh/7AOv7rgZKFfz7+HjE56/4Brhm8fY3MM/Kll4RrwjI5aYQ3l+GA==
Received: from MN2PR05CA0028.namprd05.prod.outlook.com (2603:10b6:208:c0::41)
 by SJ5PPFC322FD87E.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 01:20:23 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:c0:cafe::98) by MN2PR05CA0028.outlook.office365.com
 (2603:10b6:208:c0::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.8 via Frontend Transport; Sat, 8
 Nov 2025 01:20:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Sat, 8 Nov 2025 01:20:22 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 19:20:18 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 19:20:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 19:20:18 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A81KISW3912235;
	Fri, 7 Nov 2025 19:20:18 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5729E9ACF4; Fri,  7 Nov 2025 19:20:18 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] udev-aragoconf: aggregate generic udev rules
Date: Fri, 7 Nov 2025 19:20:18 -0600
Message-ID: <20251108012018.1266334-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251108011752.3782760-1-rs@ti.com>
References: <20251108011752.3782760-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|SJ5PPFC322FD87E:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b3afd5-be51-4055-0331-08de1e64fd00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eNZAqysMNWaKRlIMi02FvKtGKPdcD7xCuib7RgOh4Ro9oHsAF43mlitPXLdZ?=
 =?us-ascii?Q?ZL0AwWTI/z/XMzUMII8uN7PQEVgkTPU/ASpGM5vRfaZQRr900Qk14NxfyzdP?=
 =?us-ascii?Q?WXYCv8OSi+KtAXa32+YzU1E8JufyMZ1AeFKUws2L0srrNFdswctpm52R/lUL?=
 =?us-ascii?Q?oclzicD+c+hjiKjT0KQykLvUwVmYstNgmK214CJqBdR5pWpPCmkoXz6PRCAK?=
 =?us-ascii?Q?bddKU+pGpdqfLeqtekBgMGcz2hP3aAiULm7ky77QhiHhd2AA6t9kT4l8QEeW?=
 =?us-ascii?Q?t9atVBdSdnjW0KjXKPSe0O+Io+s/vu3IqMhoQX6I5VcMRhP9TRwjum2C4Yzt?=
 =?us-ascii?Q?2rndC41mXjRIqVSpmdnxfg7HvKvs6Tp7IecywtE54d6OAIXk1eBo04WMJhkS?=
 =?us-ascii?Q?2WXTJIg8vXCVOrPT+mBb2tK/jhM+Xx2RaNBCBx/Zgz50485D8R+dTSbkVfg7?=
 =?us-ascii?Q?T8sgmZ6xc3ifLjWiDg1dAgYtzmlQLm7y06sL47WqARimwGU9lkQD6J7v6VAL?=
 =?us-ascii?Q?Xlhxbo8L19ZrLzZWmSmd56qYTOhJ0nUI10JLBdeXsLLk87uqMQxa7pL5Vvfj?=
 =?us-ascii?Q?GqzFBdBqDmq19TQpOMk5OlbqUDzHOOgoWGrSN+T9zLdalybhDg3ZQyvWIf96?=
 =?us-ascii?Q?ryle7M2Qy3OFaibMTlzA0my0ceM3gDJZn2qqvWGuhQFJlRll9hE6H9IsxjMW?=
 =?us-ascii?Q?kGW8UAT+BiqLsVWyf79SL63tLRU6aC0xWlLfZScMpWDyszq51AcfBNP2nojh?=
 =?us-ascii?Q?yDYkT5Tzxbxpt7flrQ05AsiyYmS0wBz7WQaJYEGOA+Np9U+kwG4LxheOS3xz?=
 =?us-ascii?Q?SejugK0dHxjFzPW9lmD1DHNj58WksSSTjHJY7bQ+BpSNV+o4023kPMRU6dyA?=
 =?us-ascii?Q?BkygCxEG88gi63jBwq/9/kKMoZ9YWHCfHRsIbQ8Sv6ikXn978dCvhNZGhJcv?=
 =?us-ascii?Q?n/ocNmChyh97DbgQJ5340DDjhwmZZu9gZkeEhRBkuI7LIR7Hocp/OdgXFi5k?=
 =?us-ascii?Q?KUz/iqU+w0gzmbYfjnFLfLXc75N27XrQvxYpXDwEhwHyYrpiMe2hNYOqZkjN?=
 =?us-ascii?Q?h4yyw61+x/1U0Ij1NIj05BcJ3yCXqV5JCVRYlACrWqEp6HyM8oo3qtULAPhl?=
 =?us-ascii?Q?Vubz5o0VzNvYy1sLlzTg7AmWIirpCxkMQ0Ry6hwgNvntgti19HwcrctufPvE?=
 =?us-ascii?Q?jv/0/to5AlhnNmDCpFiVfa2q1S9Mkobsu0a5UJEi9c6UiCwF3YIOKUx86Ohf?=
 =?us-ascii?Q?JfHmrSmr5EL0z+QX5gPXDl57Urx9dbuoCyaVwnw/ysV+StKmyq7CJ8MehXyR?=
 =?us-ascii?Q?X/Z6zniG7xRczQmUoN5gJGEpa/OApEWQ/4rd/r4KqokOgxD5HINq1dVAnc6g?=
 =?us-ascii?Q?vnwTZqj0a6Cq0+YjPLqxOBaLj5dthNt1PIqfWeeQf3D4JJK1ZEsokvD3F4Tx?=
 =?us-ascii?Q?IaSZm4rB8RPjoxIbIFHNzQPSyWU3zNdDngxKc9lKyiT10jgIBH9sKJf2uvNe?=
 =?us-ascii?Q?SSjtZwybppfbaT7xehcx7WZ6p2fMl6LDNYMTR6DitRGTn+gkBNI6+M7byKXq?=
 =?us-ascii?Q?W/AieEN1jzCsN2LMbRw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 01:20:22.2276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b3afd5-be51-4055-0331-08de1e64fd00
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC322FD87E
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 08 Nov 2025 01:20:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16740

meta-arago / na / 20251108011752.3782760-1-rs

PRC Results: PASS

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] udev-aragoconf: aggregate ge=
neric udev rules
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Fri, 7 Nov 2025 19:17:52 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 47e90afc11f7f0fd8554db876fb6f8e09=
c087506

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: v4l-utils: Do the version bump in a yocto-check-layer com=
pliant manner
- Commit SHA: bf77133815ae1c359f81e8838deb239f9841f22f

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




