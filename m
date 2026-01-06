Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCCACE9D70
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 16:01:11 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93124.1767715261440395244
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 08:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Icgo10w6;
 spf=pass (domain: list.ti.com, ip: 52.101.53.28, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j02VwKWXmFsJ1KygeA3OFM3z6b7DdOBSsGeqz0gSXx1aBUsh/8RcKpdsQn9uYxpToL7u7aqHTdMT+29WVgqqLj7/N9Hqz1Mcet9VE488AmtoqzAX7HvVoliWpozEEMr60hpp6R/QH5O9UkdC0FAQwjPJl2N+2WWOC+3WM4hcUiotjbGanGkpeLpP916PEsrOvvHvErmGMKdSxsI8ctglP1cv14imc4UTpmly55n228P5RXljJbbMeL/Q5Xvw0rcalBiuTMe0iRViaWwCoAn6iWdLfGQ+wgFI7CBiqdfhRbsWY16FAJt0+wenZAW+q+Gn1Go2ZwY76+vD6uPr4VkL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UskDt6gJoi1nSo/lDukpL/gnnCbwffFw22AWciWMxLo=;
 b=LvvWzJymWJv1uIFPkhIXwVxfBX5F3Cls8ueHDYSc6xV0tXvhNDAdmsrYMMVmR6BSawyB0NrTtVFvWYeQnhFJr5D9sfTtOUJk22Y8UPd6QIGs+1iwgxOu5HXUGiCvbMAZ1DR8V4iSz1hL39x/pFYlz1TPqBMIr1bQnf5lnUxQbNRa+zAs5zo2o2s+WMbZCYH2NsVJBGj2LlG5UChoJUeFfo2WQGi6UVmvm/B+wSs9K1o8xyc058cUhGlKeCpnyoKi4b5GFq2i2otgDX3dL3t+vTmx9iEW4wFXd9K3LdNQNq4BSiSAw6BKOAYfvzwhu4gPhBBJEaE2gFwxb/30opfcAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UskDt6gJoi1nSo/lDukpL/gnnCbwffFw22AWciWMxLo=;
 b=Icgo10w6BX7OsqsYVQ30tk9Du+pwaqRFYyrcp2AjcKx/QI3TRJD6gWLp5+ad2fLDjfUk9hXyT8uYbd/JDJHtJVrPxo/SQQlFUvdKc6Xk4LIPZ58bPlXPpJ8ceRjc+trx/3nsFtP91QcTRKDtaATNJ87bRp2HCbo3cG2ZLkG1V35/CSidYDPDXKvFhu5UBeKYXwrzs42jmf0h+WQR1sKKd7mNcybNaaK7C1bXgcE50YmsZdZ08cN3i+ly786jhCyx9AXUlFtD/JhNdgRo5jWkNC5twhEDez3cY/FXM9l+PLbRaY2CcxyxCsx2fwn4sVxkjezJZBOduW2NAwsHzDKmoQ==
Received: from SN7PR04CA0203.namprd04.prod.outlook.com (2603:10b6:806:126::28)
 by CH3PR10MB6833.namprd10.prod.outlook.com (2603:10b6:610:150::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 16:00:54 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::bd) by SN7PR04CA0203.outlook.office365.com
 (2603:10b6:806:126::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 16:00:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 16:00:53 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 10:00:49 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 10:00:48 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 10:00:48 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606G0mIS3072596;
	Tue, 6 Jan 2026 10:00:48 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A4FD39ACF4; Tue,  6 Jan 2026 10:00:48 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Anurag Dutta <a-dutta@ti.com>
CC: <reatmon@ti.com>, <gehariprasath@ti.com>, <a-limaye@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] meta-arago-test: recipes-core: Add udev rules for MCAN to meta-arago-test
Date: Tue, 6 Jan 2026 10:00:48 -0600
Message-ID: <20260106160048.2127594-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260106060815.868724-1-a-dutta@ti.com>
References: <20260106060815.868724-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|CH3PR10MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 1edf5e79-0c27-4a3c-aeb2-08de4d3cc522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M0Z1QNuTryO0fMj8GZkEqaL5+4W5x8Y+pGzTeR3GWt9Bc7X6n61EZcF1NrEz?=
 =?us-ascii?Q?kvWAwM9+1M3D2L+o7KQfN6hxY++HXSaW7olNDyvJ/eQInQN2NAFxgS1QSt/a?=
 =?us-ascii?Q?Pndn5/4yjYFNpB4mzpEmgF2Sjk8xnH6Bl9DV5rcuSTjofvnOZ0oD371OknQC?=
 =?us-ascii?Q?mOO92kIxPTQpr8NP4ccrPTUFqQrKDy5MAMKm71GZavV3fBDIm89uC8B6ORwi?=
 =?us-ascii?Q?gX8F0P9rMgOK57SfwDwa8PH43YW29UVDtXg1oCIKiB8qfN4RdUSuGX8yy3i4?=
 =?us-ascii?Q?gIf56VFm9F0hfynA2rJea64FSWlQmc/8cf8/Hnu3gVsirsbaH5XVFe+IiQj7?=
 =?us-ascii?Q?V4L5dTFobB9nYgI1bxfANqyyfROSfrp2UFuQwE7XSnvI1hQOGs3apVJanu5Z?=
 =?us-ascii?Q?X2gQ0uBH55tSa9HPRStqxxeeZIGSytzolhQNyyCENvl6YqYbggXidnCHDuWw?=
 =?us-ascii?Q?ukUvpyxJqAsJ2kvXcGJ1VTWL76jJwmnQsd+4978FhSuvLW5Au5aNv+AbUBgV?=
 =?us-ascii?Q?Lh6XAZVLYNKbtuSEAofJ+epgyffnWm/XXCbRASzzsAqaeoOZidTrguauvgGK?=
 =?us-ascii?Q?8i2uU0d1y7wYpHDv98cYa3FoLEUHFaFe96Ktl3pxwcucDRemyukcsQ23XCre?=
 =?us-ascii?Q?VUf1dgo8xePcgVLBR/r5kstx2NnyCzkBVWzh6gYTuXMzuQEeHt0XXv/qG8HH?=
 =?us-ascii?Q?RMEfR2LSFRYOM90GHAfyW4t4gS9lQdmq0dxMUxzwj26tzTRJznvAdrkjudF1?=
 =?us-ascii?Q?sxWZjbKSLUiaQDmycf07bhUyZ2vgp62u5NzsXM4iWYaLIJ0getusP+ToqguU?=
 =?us-ascii?Q?pE60p8BTvoiod5Wp9Jo89wjz9Xay4LtmxhHqBTBmDrIL9XYVFPZXqaR1QzNF?=
 =?us-ascii?Q?idJHuLc4v4Px/C9bSiekI0pYEF3GjMbYFiANe9Nd+k7ovDIfEeEX396ihx8M?=
 =?us-ascii?Q?8SvXGUL3eNod1iKmcfEVuiZrOAnqDnz8CpTVf8pMx1DTxf4uc+TSbwEK9fcM?=
 =?us-ascii?Q?12C/EZugk062fHpwgIwk/f5vFa7dzpasUdBsmHLxul7/0Rn6/WEZkeZojlSk?=
 =?us-ascii?Q?6XvZsYDd0D0IPpCBjneuop5EFA5alPQ0DK9YdynUjNq9oCe/P0/MESkfmeM2?=
 =?us-ascii?Q?hv3wkJzsyJVajVLTPSfE7p8Eoo7J54b4yoI3unXNbaYVvhtEYZ9CYWVDpmFm?=
 =?us-ascii?Q?EI+nrWABaHIhgRvlURU/qv6cuRvAXU1M15CTgkKNLOunE83DnYJsYvid37eH?=
 =?us-ascii?Q?Wo/hnok2FZjwiiHUvl39++p0yGR5JGfLAKRWku1EdtJo5aqSgzW9qtBltRLI?=
 =?us-ascii?Q?LlgC1vHGtmF958c7CWOHEW9unLZN7K2bsDF2TRHGthv/VZ39aArvJ8waEdPw?=
 =?us-ascii?Q?vojM476IifVfcz0fnbRyxmxXvDFd1gQnMn0TWAF4B7GBmN1YWrdEtU7NrED8?=
 =?us-ascii?Q?owbmYPl5eN0/k+SBVJKbwHnUqZEihN4SYk8X5KXqLzrkKiqjSJQkRuPNmyzr?=
 =?us-ascii?Q?KrYnum5iyZ3facsAIce3IRx67UnsUfkLz9uBtm1EX+TbZIXP39teG30QTend?=
 =?us-ascii?Q?2i4FY2ZxUUF/mwcxIUI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 16:00:53.3227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1edf5e79-0c27-4a3c-aeb2-08de4d3cc522
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6833
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jan 2026 16:01:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16934

meta-arago / na / 20260106060815.868724-1-a-dutta

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
WARN - [meta-arago][master][PATCH] meta-arago-test: recipes-core: Add udev =
rules for MCAN to meta-arago-test
    WARN: Commit message should not include directory path to recipe: meta-=
arago-test: recipes-core: Add udev rules for MCAN to meta-arago-test.
              meta-arago-test (COMMIT-MESSAGE-3)
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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] meta-arago-test: recipes-core: =
Add udev rules for MCAN to meta-arago-test
- Submitter: From: Anurag Dutta <a-dutta@ti.com>
- Date: Date: Tue, 6 Jan 2026 11:38:15 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7fd2dd8a8ff163746dc6aa13a4898586f=
010086e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libdrm: Remove upstreamed patch
- Commit SHA: 8c190b1e4f6a53ea641ba9d6150ef873f561c706

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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: <build-dir>/sources/meta-arago/meta-arago-test/recipes-core/udev/ude=
v-aragoconf_1.bb: Using S =3D ${WORKDIR} is no longer supported




