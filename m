Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7C2EF99FB
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 17:22:28 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17560.1771348945602051231
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 09:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=lY63DBwu;
 spf=pass (domain: list.ti.com, ip: 40.107.208.33, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UE60I1o+r0qZ85u9rD6200ndK1UnhHYKuce5Lhv0tPHD87rV4LsAqEYr45OMcBkKB/1UbMdIjxJVvMPNkkcZB2eg3roxQVv7DvYcctiwLl2GOd3j3qz1HXxGcXchBxd/Qi8GswCd4zRDI0ImyLEETEElVLrdixDASFOTRBiheTfVi5dhtCs1lq5U1bf79uavO9VlPuRaEbHWGYlTM1+TB8u6O+hY8LPmGwMGbtko654IRUVjsUppZOVGPTRgmWRqqMF/LlqFMGHpgMWSVMOnnNyThe/1ux+UtxVT/Nq3WIEhFhTUBuuVRTeKljoMLhbM8O8ioHiug+kXL1PwjaiZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGp2FVKA3c5EvqxZvKyxnpYmBQPjLwa/h9WGcr/fDgE=;
 b=hDbZ3eR6RA6Ub4SeWZ5MaDgLbD1i6KHRaM+aYWX0s3xXERHZMh1qP6WMprQTi4/ab5HuXOTCR5JEzzGu9T5WSwckMGwzL42ddRgmYtm2ZitZXVIfqskaLj6S0uLY1PXEfDOOfPXhDZoCW6bR0SuAyO4P0aVToZbk84CsarCC34mh6DMs/oI4TYUcUBXOYvbMJ9Wp9ucJZif1/GegIs4vYZ/8x8LbIgDh1jsR8TZE3Htr1kwxnT7lc2IFsOPMrmvsVRarZCeLtNaz8nUJUEaFneWGTgvwG3mfxAgiElOo//xkmoBuLrYJw9SazKoRScoRfn+WEJ0L60mnb339nn2CLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGp2FVKA3c5EvqxZvKyxnpYmBQPjLwa/h9WGcr/fDgE=;
 b=lY63DBwucdnJgWk2V/pnq2QnRUmhvapEy+e67ljute2xDfY6XdSm9c1gG9tYgSA7meDgu/0UzJrXHUdiarj3rXvogdgfHILOyroOIG/1tZwe6yEwW1MIf+cmiTkUNLoXPXOSykEZu4ZA2zqMjpGHCvesqwc75PbFc2VJNHYRyihNAL0N8rlnXBmeKZlf5rmDKqRqGkgILA4Ww3d6iw6MkGemnGwb2F+n9NGGGW0FNXH5l5QVTRFoaLnDpRzZDkn3mOTS5+T/BKFAchaLJkAX9YuJUvuBYpldTDzvailCCMLZWD17DknwzN7axq9xxP4imeRAgSILG+imfPVCJt3MFA==
Received: from DM5PR07CA0105.namprd07.prod.outlook.com (2603:10b6:4:ae::34) by
 DS4PR10MB997620.namprd10.prod.outlook.com (2603:10b6:8:31a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:22:24 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:4:ae:cafe::74) by DM5PR07CA0105.outlook.office365.com
 (2603:10b6:4:ae::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 17:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Tue, 17 Feb 2026 17:22:22 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 11:22:22 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 11:22:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 11:22:21 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HHMMF03223119;
	Tue, 17 Feb 2026 11:22:22 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 128399ACF4; Tue, 17 Feb 2026 11:22:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] busybox: Turn on sha3sum support
Date: Tue, 17 Feb 2026 11:22:22 -0600
Message-ID: <20260217172222.2614299-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260217170544.829944-1-reatmon@ti.com>
References: <20260217170544.829944-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|DS4PR10MB997620:EE_
X-MS-Office365-Filtering-Correlation-Id: 092b4e39-67e0-44cd-3932-08de6e491cc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2g73EW6W/NNKj947/8wWkX9UYjQC/pLidi1Ok01kJCIRp31ZFnaoGK7Gu4ke?=
 =?us-ascii?Q?azqZsDDwSirvknVSqtvgludjOSn6PceOhIGLAMLsaCAs9s5fPJJd/5mfbl9g?=
 =?us-ascii?Q?8fqh+Ih2HWhqDUHQX/juCK/GH/yL2YjQ3dFXEeI4v+bfV0TFODwwCoeU//ZA?=
 =?us-ascii?Q?378++go6pObKngBZjulokSBIK+FZXj5ndyXMhFZMbaDPyOBDWQCVGXwmWxGn?=
 =?us-ascii?Q?jP8NGBs8Cqk06GuihMS9TV+Tz841n16gsVI7/qrsoo9hmvFDVI6+a/bTXA/i?=
 =?us-ascii?Q?Lr+gdAYAvLZx0tGaZtSkMcBTk/mkIwSQ7mfUmpK+B4LGPTnoTqbVJCvA9ECJ?=
 =?us-ascii?Q?gyRAqkFKskwC3DmuMVjIwEv6639kYshfxtkUTqh8x6zI7WXtrtZ2lPVSJNNb?=
 =?us-ascii?Q?Gclo96GGZZjU8/D4yRSsSe5RGYKwKu25XgozftYiJGYW4/wmMsm3Su+gyeRP?=
 =?us-ascii?Q?ct4H9u6QCZZ6SOPE40hBuwkhryGgjbsPsOxPbe80qOJP/ZTFctrFOT4Dc2bI?=
 =?us-ascii?Q?Rs3poe217F9MM6ZknVhGy3hwXu8uSQEUXfCMLG9ytoGVLqSFY9Elvebz2YYV?=
 =?us-ascii?Q?EjDw8mLtDq1VgaceUftsYLF+5vOrEBM5yGP+jmh11BEMiKnhBjGLofxlDIXt?=
 =?us-ascii?Q?sdsP9D/jaA6bUR7GIPOlufGHxiQQmp8MeN9TkHozmMkl6nTynTSC5+IT6x64?=
 =?us-ascii?Q?0aUoYTiTkZBFfO/Oh3hLeq3SOiRNcvsl1tFPzIei/PbbkTHlZ3Y+Rsqk32V1?=
 =?us-ascii?Q?2k4KPNQI01kRQ/fgwbJHE1LGDetPeIegPQ8u0+sswkiHXybAl/Uwi6xFzym2?=
 =?us-ascii?Q?BGTfqX2MAXiU/64lB/ag1SGyQ1jNV0/B54U4PnbwAmXRucmTnjZkKaIixj22?=
 =?us-ascii?Q?gW4uqInBoiox7D5ZxKmzWQOcrsOom94IxsonBf7RmOoC4NdGDZf5RtNbgkKg?=
 =?us-ascii?Q?g/sjzV/BiBsN/gD3Izr2DwaMeCSyhjDr9T4ygIBw8pHE4SEhO5IDlFeW1RTK?=
 =?us-ascii?Q?rUJg7z0stD1tT4TLw93vDgrMrPJA9pxwrNV3e1sW9r8bPG9qABWkp7Cf+qIj?=
 =?us-ascii?Q?NJ7UUwBb8R3eL4/TWWu6Q2wgsp85Hgim3FB+Tg7x7/6t69X1lWIDv74zROf/?=
 =?us-ascii?Q?WVShcW8dW981Q9Icot4q8qFO8M6zTTUyQIFwGqGsrSvAhOT3Q4DPLEz8a/0A?=
 =?us-ascii?Q?l/22ZIjpIdvb9Q1bh5Bdbx8GoOn9djApYlCBzOQ6glzDuzFdd4x9KMvCyjmY?=
 =?us-ascii?Q?lsOQwBEPMfroXAY1EYO5jF7g8WzEI8rdj+Fny+niOfamcdUzOy8Tm01IHiJ5?=
 =?us-ascii?Q?RmxkP+vohup6THlnEliaY6p5lc5ihXqwQoej0V/IEp17Zf6GjaNu0Vx1SIjS?=
 =?us-ascii?Q?dkQg3fssuWiqOzULV/ltw86ixTpc36GAz3AOuIFiv0f8IdPDdb4NgzgE7g4t?=
 =?us-ascii?Q?CtrzNyXdiN2Xe+w7y2l15vPn0I07IcW79cIyiigUT/+v8ooF/jROTVHroPTJ?=
 =?us-ascii?Q?1EKfRGrgrmjsu8qk3gnIjmtkMU7cX5gPm2Dxh3VZtGAEVmaefYvu6kyjesnj?=
 =?us-ascii?Q?cVaqrgdZdGRhrtSQlyDDPgT7WiD3EW/zj1JBTf+PryydyLZKK6+NQxkfU2WZ?=
 =?us-ascii?Q?1Ju3YZMNkpDhhPWjmKjhRw8tKG8zitk7xPnmbTVSvx2tUk+DVVmsar6H6RZU?=
 =?us-ascii?Q?dSHmnw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OeUW39+PL8N8c8rSUq1usBZTCPI87CEcIqQAv0rE2mKUUX9re2OzRf94XYb9JA0B5lfOrpuPWAuX+EMOeAvK16eZ5yF9DQoT9/olI3K706pT92lCP8GIyC94wjga5p+E9/iQN1lHQ/vsoAjc/wQev+1Luifv7eR9D5wy8k7et/tiMUhkXR5HJDyyEKB8v2yk6OMH2+eYemDRx1Se20zQfICffWsj5tnhN+AJ78nk/4xcagRvf8dMn0L0ZLrXijtAdlK0DhRf6g7qsME6vhTYq52W8ebB1eaY2fO5omufxKrwYnsh39ETxc/n6X61wfuq/NlDnmNu3UfLg4DaIgoXQuWV6tUT54PJiVoZ4jKXKzg7KpDH1NGVT3DLuUMrr+Qqo4gwGKudNmiOqZ9MnVa4F8CdalQj9905rXc5cqarsmUahPY4FkRWHjZdl0+bekjQ
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 17:22:22.6719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 092b4e39-67e0-44cd-3932-08de6e491cc7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997620
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Feb 2026 17:22:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17109

meta-arago / na / 20260217170544.829944-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] busybox: Turn on sha3sum suppor=
t
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 17 Feb 2026 11:05:44 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7942ec8fc90c23e11c91c679a60bd00d1=
71299bb

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602130934
- Commit SHA: 61171ba24123649fe6cd3ef567ca3e767d9a7d6a

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
ERROR: Nothing RPROVIDES 'systemd' (but <build-dir>/sources/meta-virtualiza=
tion/recipes-core/packagegroups/packagegroup-yocto-builder.bb RDEPENDS on o=
r otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




