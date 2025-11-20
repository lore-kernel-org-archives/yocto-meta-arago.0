Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860B9CFA459
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 23:33:23 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1255.1763681596493165874
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Nov 2025 15:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=bKgAjYLG;
 spf=pass (domain: list.ti.com, ip: 52.101.46.64, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ureX9Nmab40A0rAtgFl5otcRN9Cq+HKzrEftxLVLYU0CqTAEKr9PTAglsgErCTVOwh1kfDJwP5XiRBP1JwTY3nWgu6063AeSrDBl0y23vLQ/SMp1j1lDSkviTCRfKG31qTtoWLgok5Ojkwx1S32BHeqSLwsbgzUiNWegdB2jir3S0RyAEuJ9co/fuXjOom9DzrPxqaYrKUbQUloFcQLNVnmk1rtwGF5DDz9cWsCp1U7wb5gOom/tr+CZ7KNf9s2G3M3g3Kc36Wl33Q5aw/gWI233NII1V04b9GnSDQ3wPVbKVnk+8d83Kbsvol0BSrlhACNW419onWM1GXDg3rx6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APxlIXTSmIbkJMRbXSLSxzDXttkOlhXqC9s9TnoAM9Q=;
 b=JQYHDEEyr0nghSLSI9Ouhk7WlPEszpVD/uIKvvJUYpOhzrYx7BPKkP6cAZHjSFCv/n3F+XVqIoNRreKWRog4gdbWvjDYNndTD8sB7kCekwTcMlcYNoSX7H3p3xpDpyrA9gQmG+CkCh8z0kJ2IXIJXkLlfwrVxDEg+G4sMM10A5MCjnzjpnrbDn4snQkbzviYHmY2QhRTYdR8yg/qLL5j5YOJ1UFc8jzF3Jw5YbUCree5ONQhtGttYHy4FYmHV8TM/9XxY12+xXMKFGeAUG9Uq+kNKVLPFTvs1z6MwAMQ18pAz8B/isuqVUeEAbfFGD952rimLWlVRVsZ7qG2XYITPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APxlIXTSmIbkJMRbXSLSxzDXttkOlhXqC9s9TnoAM9Q=;
 b=bKgAjYLG8csN6DUqQtMkth6Pqi/a2udOwA9O+iSzry8g6f/0DUAQqk44c8Lw6PwWYjtxhnsN7HTFGqk73v95oV9T2wif41DpuHIgOojH1Ihe9g7CRNO6YkSbRvYQT28qhEi8fE9/jfDNAC/qjCCPayWPxPh1UNuDGCpVVd0+Ztz6TL+LS4m6ZVo1cowPa7GZyeBOp+bXrNcJ/JjLwCiTAjD1mM9I/oFWltq4bQTXLuY2cIiqx5TOSWTqS52f8fcbat9M6NYgKwBNDiqwAcfVPq/ifUDlL056EiEnPRiEhcgIfjUXByEXGtNpPPD2XzwiHDyDkrcGhZVy/wULswaFug==
Received: from BL1PR13CA0292.namprd13.prod.outlook.com (2603:10b6:208:2bc::27)
 by SA2PR10MB4540.namprd10.prod.outlook.com (2603:10b6:806:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 23:33:13 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:208:2bc::4) by BL1PR13CA0292.outlook.office365.com
 (2603:10b6:208:2bc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 23:33:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 23:33:13 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 17:33:09 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 17:33:08 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 17:33:08 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKNX8Xs3201929;
	Thu, 20 Nov 2025 17:33:08 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D1F639ACF4; Thu, 20 Nov 2025 17:33:08 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511200845
Date: Thu, 20 Nov 2025 17:33:08 -0600
Message-ID: <20251120233308.793926-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251120230932.1485293-1-lcpdbld@list.ti.com>
References: <20251120230932.1485293-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|SA2PR10MB4540:EE_
X-MS-Office365-Filtering-Correlation-Id: d33aa711-82cd-4ccd-8851-08de288d2c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qmBFoEx/q3Ut9/p41IPLPvfMlo3gnyAbzEVIRZBp84j+rGoV+bc6g4YjVYla?=
 =?us-ascii?Q?JuSEgdgRZTtWvoPX4TxX6fj+Eg5/MvEs/rfdT21Vc40IF2vLgNoLnFaERQCm?=
 =?us-ascii?Q?dZsYpP9mcpIRZV9ogkEEz2oPHA/MTl42HRikD58lhi5XKiMshkHDqjwKGQVq?=
 =?us-ascii?Q?pcZnH1HtbYQ3CiHLWXighwesCV71auJYNcBdcsLC02fkB0GWEOZDezncsBDu?=
 =?us-ascii?Q?FPgvTaJA8iX/o39aLEvmXAQysk0x85GnBjOd8U4oFD8YNW3H2xFHmuh5ZaFy?=
 =?us-ascii?Q?iQ0Zx80jG+Y2gE+0C4DFxq1Tc0iYxGJfK2TcOcX0Zv4n9ltmD7h7m3dD9Zc0?=
 =?us-ascii?Q?obTxTzvtnv5RKDxzsuY4HP4i+qVnd0xC/awtSRTqHAQYDI86fsQ+dsTK4kVv?=
 =?us-ascii?Q?WWJ1+3ZWnjuRLq672PQmXH4v34ExqiJ58YWCCzzHVEfHfIa9vhoc+nmtgxKm?=
 =?us-ascii?Q?INIoxtc6VHJ5pi8fOIjv76p4kS0JFF5VtLObcYUcHd5xA+Lm5t7o7OCYALo7?=
 =?us-ascii?Q?WK4v7sTaYdoKlj5oEhDj6hUJYfH7NZ4UJ7Tdzpas0h2rrPsUMPa5Ypzdyzqm?=
 =?us-ascii?Q?k07HZvgTw/AvjL5g9Am1kd1lXAJsRHWaY3Ot0En7M0VTeGhH40bezYsBNWEv?=
 =?us-ascii?Q?mx0HaP1g95x9cUyQWb3XkGeCdOP99idf8Y/qJZB5LOKHWauPAs5SW0QKgJJv?=
 =?us-ascii?Q?LFsOgkJC2VSM5VKI5FEItMAaPSW1/v0XcyU2GhNr7sHlz9u0E9ZssMB3NZa8?=
 =?us-ascii?Q?FsbBpAgINyMBq4624Q5Cj9/be1Fy61XSfhUPX3XaUcVkj30wiqsw6YVbiXXj?=
 =?us-ascii?Q?vGVqFhz3mdhNnINxo9Iqne2u1HGNwjBjhl9Y9KSmuSl7hn6EACpQMpqiK0De?=
 =?us-ascii?Q?1PvHJRHUHIooqOxzcyM50E3QJu9PzyRb2ukgySG5EztNA776o2Lu/Q5kyUiV?=
 =?us-ascii?Q?MIhW9zOKgbDoTtY+9kBsG/kWBuKzoomnsDQVwRLrR+8xaBztIEz9sCcyuzNe?=
 =?us-ascii?Q?4e1ouacC5w4DRoCDeZ6MYe2xzBf5mlpapgnjtUMTtEfjbsLLdD7g6rHkl/dz?=
 =?us-ascii?Q?u2b6uWrcBTMHyg3wu/Hf/iacejlgSifV8t69pf4/zZkJ/LjI3mYTOH6m1pJd?=
 =?us-ascii?Q?V906Q+UBCeMOrQGnpkrr2YOaW9RO5S9jLB0Yyw7k2Q56ojEsEv3Q03kOkxyw?=
 =?us-ascii?Q?1v/QXeMIuCp1WnBrnwUlTipZOzSPKfQTt74C+M2oA0uaOZnKX+n8c/Y8Uh8Q?=
 =?us-ascii?Q?Jma6rvw4tHq/dUxPpG544cn2tvC1bfYmAuilyViKSI0Gwm+pcUyUvxPTGK3x?=
 =?us-ascii?Q?bjIjS35z73muwElNpAUzNGzFzReBDXbtPyb2oghWybP5SzclLPPm3fE7+saW?=
 =?us-ascii?Q?NLlr7Rf0H5t5X8ZEGj7CV700CPre7MOfJLqbK/j9MSS7FobDfteImfNRrKwJ?=
 =?us-ascii?Q?z9CeZLl3vUsYedPFJoxJQH2O05NYcs5OohbQIOryMBBPsTKD1h7oSXTlVzwt?=
 =?us-ascii?Q?D/0gJ7zabJNB649YXGIq3yimKH/UKo/ip6IR6SwVgT1yYqXAivCIIwW8eAdh?=
 =?us-ascii?Q?BVzmZXxh0jlDkIYKNFo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 23:33:13.0993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d33aa711-82cd-4ccd-8851-08de288d2c4a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4540
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Nov 2025 23:33:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16818

meta-arago / na / 20251120230932.1485293-1-lcpdbld

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
WARN - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202=
511200845
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.scarthgap.202511200845. (COMMIT-MESSAGE-2)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scar=
thgap.202511200845
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 20 Nov 2025 17:09:32 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 561e98a72ff4bb85fcb63a1682e6c1657=
37a940d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: nnshark: Set missing PV
- Commit SHA: 562517da63eb17ba7f9279cfa90d68a76344eff6

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



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




