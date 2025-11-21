Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6342FCFC511
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 22:47:49 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23467.1763765261651043129
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Nov 2025 14:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ZjtD6PSt;
 spf=pass (domain: list.ti.com, ip: 40.107.200.31, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwA1DZ/OhjpJLMsZmHfHG47Ov4844EP6wYp+rcJCqrCfYPnq+d1nMUTDJ4kyznh3b1MTrHnwpJpa3YPXgq2/89VJXoFLkKsiRDnCo/8OzP/RHx7NTU6z+liid9AWQyHKqA9dHsGY0TE1BEh2S2Kp9uFeBt3Fw7vAkqmZ+iO8WECOqs4+uITdAQyCjY3HDu1jn00istkQ1ENJDqvJ+eDSdC7H4b0o1n3B3/NNOMeZDTLo1SifG2D5vc8EeutWS8xl30/WnknRvVVFYpg9nypYttxZh4+SevlY1FfmklFfl81irrBQMThxju4IJdL28GSvJkvrKcWmzL7fMrB4MnD99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZzB1mggn1h6dojW46y05ISbFKYTgS1Qyo33NikCJbw=;
 b=kIjezo+xKETNfYBN7Me6VSuLIeiZmg2tSUAIe0dzmctd5CQVYAYMhUlhHjHtJ4RCTDz7qtifxxs9/11yr0ZgAU30RJ+GDm/XstsNLZSp4tHoZTTvi1Ukgnw/4Gro4hecORa+YI/ek6zKd3M1bzPZYcUNeOTVDtNz3O3r9eh3WKCIwyulpJOICLaMYOUQoG46l4pjIh+uRCzUdFd0f+LtMkPl4wMuLfz3/suQkIYKnJhB2jc92ilpFM0NB0BZYB/mo8eFpSuAwPGhlgvZNOwpXGujm5XGMSt0X0xUXfBIpm/OHH3SL+5zv8eBEqGHvDdgR8XQz38fsBYGoRV5rivprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZzB1mggn1h6dojW46y05ISbFKYTgS1Qyo33NikCJbw=;
 b=ZjtD6PStthtBu/b6Fm1nKPXc91B5NpUsHo9/2tFMB1OgwzbrOObosLFsUz9gDZhclsW5i0s8u/+/JJQ/vr1mUtA7Nq0Hi7HHBZrGR+UVpH5MmwncqwlykZEyLes1uMmmRCEuwUvLU1xfeJWvMQIMFKj+MQbsgaW66wt6qlYa4dCFYiZoK67PxcRf7pkBeG8m9NT/kXJBgGhWbWG1/qIzzB1wW4XUCRrGjaa5BuHpPtzeQcBg1wQSmvPF8tcIvdFB/FHIs+WctEzqDiXYqV0348+9ai8f4Z76cF7KC2N2+kLnpYhqKp16GjuBLRh2n0bqOU2ClqysJEaj0k3k2TqWuA==
Received: from SA9PR10CA0018.namprd10.prod.outlook.com (2603:10b6:806:a7::23)
 by SJ5PPFB3F166793.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 22:47:39 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::e9) by SA9PR10CA0018.outlook.office365.com
 (2603:10b6:806:a7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Fri,
 21 Nov 2025 22:47:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 22:47:38 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 16:47:37 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 16:47:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 16:47:36 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALMlaMW2267295;
	Fri, 21 Nov 2025 16:47:36 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id D93D0142E2B; Fri, 21 Nov 2025 16:47:36 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2] nnstreamer: Update to 2.4.4
Date: Fri, 21 Nov 2025 16:47:36 -0600
Message-ID: <20251121224736.1002121-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251121222650.540856-1-afd@ti.com>
References: <20251121222650.540856-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SJ5PPFB3F166793:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5ca3a3-419e-43bc-be9c-08de294ff8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?heGUKXlXKG9+cZ5gu3NTWxxgFLKOAuO6Ltqj+dI5CR9iyViauzZwraUu6L7R?=
 =?us-ascii?Q?qCuWdjpK8OTc6ZkJrXTEsiMrY8PwC9AUjgnOIT4VlgG0vcOD/SN4d8nL4jOQ?=
 =?us-ascii?Q?+1JDXPGFPCiwtZM1D1jmg6MGdOfDAhbWv5d3ohX+cfbrDkiNClDkVDPCYVMt?=
 =?us-ascii?Q?c+Z0vN+6KM99MiMLMXOSWM/xGfKZIsPnjYfbsOIN6N1B0vANXSI30SlhUxba?=
 =?us-ascii?Q?1a5yWgZHSmyTgApaT4hM9epp3uiWwrDWDGq1G9K+sCIPI2D2iqXTvk29vXXT?=
 =?us-ascii?Q?dRTUP77clGd1SbpKUjpCmWmlQlLzvnoANjC1ge/2TjmGYivobuCQyFOBRncH?=
 =?us-ascii?Q?c0102MVjQfG9mVSNwvGvcL13EqspikBYZnzM/WulypPZkDSDRRmqZN+1tpfX?=
 =?us-ascii?Q?C17jjoplkNsWYtXl1MUlyC8m370NNnnPH3mJ7smAhOacSEVI144/w9M1lVEG?=
 =?us-ascii?Q?zxy0pjE2vo9eYWiKVJJp8EAzzTAk27qyoibq7SfP1PS1ZzBBruD1f0w5qPAH?=
 =?us-ascii?Q?KRQEpdEu3PwVF/1akuzBPm8dKhrJHyv1bro3qWm9U0PrXDJKENNZo6xGyStv?=
 =?us-ascii?Q?QO65WQxzNpv1k1dX5ormD4QAXdpguGCjBzLWH7BHP+PvEO3nRgM95DuJWDde?=
 =?us-ascii?Q?HXSeSeWnwHxent5Hn1XChvlPOl+hHnoY4+/gxTbig3lEhHuv/3jB1z4l/Yrh?=
 =?us-ascii?Q?IKem9zbYdsMmbM0RAjaGMMatkzMgNTGZJIlIw1BNvTvscisgzEb7nuWd9hsy?=
 =?us-ascii?Q?AwINDaPCyYFgYNEcJJo47JCOKA89OkSEKzJg9JUmX/2SGMRh7cg8s7jOWOuk?=
 =?us-ascii?Q?mbtB7EVSjLUzjnStTHm0DCLSEESnZqEc7d1C47QVhqX2747jdfnlPmUHHLsa?=
 =?us-ascii?Q?O+diWwmylm5WIlBEPPW1CeU7xbgG+kT+6ksYtmw3PVIBshXykj/yTV63Hau3?=
 =?us-ascii?Q?PRV6jw5U1jeJdiepmiar0vsVmSuL0l2Ctpc5ofTiotJEZ1BQOAElXnVQ4l3h?=
 =?us-ascii?Q?tBzcE8qgQAQlm3pj7g6P3nZraiF/N1kKKN3mXVST6yM+9CANpxiYM2APB2NB?=
 =?us-ascii?Q?gh8mLhdqq+Ib7YFxjjIKmP0utcFpoSjID5nHScvvFZxSPlzLS589AXymXyWc?=
 =?us-ascii?Q?5Umgoqc9qOT+519dYcBSnirObDpgSkmOCEITNtg2bmQHaI6PI8qdS4i5ZcGi?=
 =?us-ascii?Q?EIo1Dqq8Ij52qyCPSDqwN30xJCRhmJ7imwz1BBdpGBeI3x5mioeQLuDVBBrm?=
 =?us-ascii?Q?MjidPGL9kZOkZ9ObKAoMz7XXWOZFvu7DC4uO8asp+34qwWr5iLLRYeVSEzkB?=
 =?us-ascii?Q?OyUJOU+Tb4hvUHtc0SoLgDbkKTuxFccwqcQbJnp1TZ/ccDpCUtIhetCwMGoK?=
 =?us-ascii?Q?Y/c3A5nasC3lI5dshXqMWxOln9g8vSwIrFYeZxJ3PNZd1dinSAp7xbs3swHs?=
 =?us-ascii?Q?iLeTA7jFFG8F1JoJy2ob+OijX0UowgshBja1UcR2GfDCs2YXsuEosVuw8Sb7?=
 =?us-ascii?Q?qhrWo6vmp6SM8NZkqvOrVAeoFBi8vMcnAE92V//qG6vPGwkEbMhnekeYdtTK?=
 =?us-ascii?Q?SdJXSqb/gIx7oQusQMs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 22:47:38.7038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5ca3a3-419e-43bc-be9c-08de294ff8db
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFB3F166793
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Nov 2025 22:47:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16828

meta-arago / na / 20251121222650.540856-1-afd

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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH v2] nnstreamer: Update to 2.4.4
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Fri, 21 Nov 2025 16:26:50 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: be2edf4fad3444a484a155b40cb1f6064=
e6c1b14

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: nnshark: Set missing PV
- Commit SHA: dd71cd480cef2a081b1383e05fd290c01d04ad62

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
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




