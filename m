Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B784CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 22:08:03 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2438.1763417277315002435
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 14:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=LPAjgdi+;
 spf=pass (domain: list.ti.com, ip: 40.107.201.69, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCYOkqtBtgpIe4bOFzfhENsfe6TsMsn9QzsehGeE6yERGAiNMDXLzWW8l+bUmtXBn0XdUnGHFOKLFj3GXlmb6UMOCnGl2hJ0sSipB7TTsoEU4bKsIOEywO37W51CzhVCSUP/HMSRbcdND3LK10OzHcVZiT+q9EGuJP8cuMLRbH9WTiRqBj2JyLa4p/ReV8qJ5uPX7+3r7mD3t7Ot2lDy4MiN8WjE0/Sm9Rr5twDIkoUpqG7AxMxvarBEk9gihqv0IzQ4tJpa/9TtKfmsQnY8dICY1Vta110nMmATcDDO88/zeJBqyZAbQuy7eisHKgHSh50TOwV1zMgzG80h8sAJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRqgbZT7ZZgIblaTjk2TXcYBSWfa0I8n+Y3HqDxlV0Q=;
 b=kvLTUtmqFAt6SkPb7w3kCdbTHIkfXaUNPj2Y+jXlsYqG9Y++h5dnbi7HI/vWCAzIyG9NBKF1FXqz4NEppcEFIoCR5YlBxwpm6ikisRkEKDxL7yoz+Yoquo0oMcks6zlUItTxM5KvV42V/G0faZBBInGo013FtfOoSW10QmW6SrIvhrkWbLY/cnFXnvBmQrky4vFJCuEPQMykQpxkjdgwKteOxaSgBbkD7OXwZnJmX7NU6JD+PVLI5Est9tlGytZ+arkyZQrz0NsgtSDCKRqGC+HGW6hiOxgXID8f4GzzzP4ZKh6y5G5sU5nz3U1eei1ovDcN80Rsdf7C5dhxfwKz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRqgbZT7ZZgIblaTjk2TXcYBSWfa0I8n+Y3HqDxlV0Q=;
 b=LPAjgdi+pFpSpXBShBiuhk91y0hdZ+V46Wmj/0/M6P9Tccje9xbxLyjsn08vLxzWJ7uVVBOXDaijw1S+WD4Kv/lLV5kcyNRR5AXCEa0G36R94aU+F4ZM/v6CseHX4jXJrol3lEVXyn+2ctVCsyEw81gM6SohuOq6sOuj1x3SqCrezU8PwdVAGdiL1mrTSytPN4QKzBiXOq+SaVFCiduhOX3L97oeNEVJ+E2+OErcIstCVE/JrbZoJbCADSLub3AO27UnuyUUIOZaA6nZeqfdCywyqCd+s5qQkvaW62pwbA5FiW6kTBMFvPxX+qhHXZD31V4k80sMS3OBPp4mSvkg9g==
Received: from SJ0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:a03:331::33)
 by SJ2PR10MB7671.namprd10.prod.outlook.com (2603:10b6:a03:547::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 22:07:52 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::ff) by SJ0PR03CA0088.outlook.office365.com
 (2603:10b6:a03:331::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 22:07:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 22:07:50 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 16:07:49 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 16:07:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 16:07:49 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHM7nDU3180270;
	Mon, 17 Nov 2025 16:07:49 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 5D6602A61; Mon, 17 Nov 2025 16:07:49 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCHv2] udev-aragoconf: aggregate generic udev rules
Date: Mon, 17 Nov 2025 16:07:49 -0600
Message-ID: <20251117220749.2419841-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251117214828.2518952-2-rs@ti.com>
References: <20251117214828.2518952-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|SJ2PR10MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ce8204-3f2b-4497-7290-08de2625bfcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?irImSfdeKwGW3PN4EevdfkGnvNzYejsuwb53mz2SVKVcBXlhCg6oCo5KyFKu?=
 =?us-ascii?Q?l3iQRKs3/9TJfaTPm7RwzDSOAqIGuCF3dZfaQi6PvIL6yGv5fBBHoNezZrQo?=
 =?us-ascii?Q?9ZbX0pSv39ATK1gvhTqn6zbCeWU6EbX2clS2z/FgfsYCIz05x/E2fbzsrQHl?=
 =?us-ascii?Q?kmYQzuzcv8AuAdnT0i0ON7DomjdbvHWn01kihzq3sC8FIw+bVCCxc7FgXgT6?=
 =?us-ascii?Q?pYSR+H/ZXAQYknsWQ/ksiQytsVBvQxj+v/g2K89NLskNRjOtpD2J4kbA/nh0?=
 =?us-ascii?Q?/i1aQjcrlh1pPxdbP7rFrNz7E1TPG3DXe2mkd8wShTMxCoYCpMbLb1XXtwWQ?=
 =?us-ascii?Q?ELJOFRUmdORF6wMPomoiqEY5eij5Twp0IrVNmW4saLLXs58HReeLN46eoUk2?=
 =?us-ascii?Q?YauyKWNwjdbw0unudfO4/IyJwTRztDhmAhuWi1fvyQViu5tmbkRNl4N58+64?=
 =?us-ascii?Q?Cdxy8G+a6Arnv5uPJG/wrY6ZbAGhLdWwAqDXKhHtPaeVkNks65Ukofz8dLAu?=
 =?us-ascii?Q?kXAa6+kvJrQHgX1xpqbX9kW5zfp14Y1vUL7d+8mAVtw1LfH0Tm/j/WF8NC0s?=
 =?us-ascii?Q?ATxHu9n5mQMdBZQA5zHCyfX22ejggg5sofHmRbT4WZReGelGH1h/anIVLenj?=
 =?us-ascii?Q?C5b3znJ54gcKGzI82g6JBXipEAtyRBoxr5ez/mgLCTkwF5ROEGl1PlM5JL6v?=
 =?us-ascii?Q?dEeA8pqtWfPNJqu/YtiGNdYw2qoWVI7RvAwRaBCfxtlJNRjBRGHCwQq+LH5M?=
 =?us-ascii?Q?wibjIE+QfCopZW9kmAqrxqlwC0TLLgye49KybsaDEh9xjI/BKwgRiHgguIAQ?=
 =?us-ascii?Q?f/xwkQ3YgFGhaBaMFNjA5NJM4lbLa26sbAdBaV7hTAfPhcIOlbKdDjdnKUzY?=
 =?us-ascii?Q?s/7Gp8p56R434k2nQPnAsxSQJSdGbYFMXjpQoQhX0pRCTXlH2kbNGnwhf8OZ?=
 =?us-ascii?Q?9OteSVbLTgOSoKKdwss3V/A1C3fb5cL+ifwx1nWcq62mt9IQlQeB3EHwePnq?=
 =?us-ascii?Q?A4lBGhembEejxoX8WVr1SUym10VYZ17CHM6SoOIdrEB/mK7B3po9PTrEETNU?=
 =?us-ascii?Q?XLmOjaHBxEMkLgwK/PDSBmhGpRRna0IIiM2/JtD7rmFpVrPzl6Ev2e/E3Nqh?=
 =?us-ascii?Q?Q1O6R17i17WX84AjxnfVHbBZydUihwrhXGejHMIYLU58X/MmHxYAoEsyBOwG?=
 =?us-ascii?Q?5lOUlACLc1MMTX0Hu2VRVZ779vtYE84U8Bknw6vow/r4gr4SOOT0SNoSIM5Z?=
 =?us-ascii?Q?rYM5Lxt0/lYsxXCLlo1XD5tk0pes3s6Gyfoo9K+aC3XsjDRm64n/vBH1/8EG?=
 =?us-ascii?Q?rOhF1tWMngPd6EXaUmFNFsbRhz5PoJcelOPpgJhMODxtN48+Q0+lMXR2Ks/y?=
 =?us-ascii?Q?mowoHt45RfCHArajv0w9dxXrnl28fyHtQfHi45BkuZnx7RI9hp9O15hxOvkI?=
 =?us-ascii?Q?st5AyybGtAdCCfrLns8CRBFR468AI/pTBygl3BuSemDnCkq0q3wf/D17IbE5?=
 =?us-ascii?Q?sIhXKwcwTmgSKcnIuXYfg59fOaOgkvIshkgUnqDPjorWckZ+UT2TZE74VIcz?=
 =?us-ascii?Q?QC3GdLkb4WymFB5iTWI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 22:07:50.5882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ce8204-3f2b-4497-7290-08de2625bfcb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7671
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Nov 2025 22:08:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16781

meta-arago / na / 20251117214828.2518952-2-rs

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
- Patch Series: [meta-arago][master][PATCHv2] udev-aragoconf: aggregate gen=
eric udev rules
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Mon, 17 Nov 2025 15:48:29 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: eaf61b3f8136287c509f2c3a678cdae51=
ce3c957

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: libdrm: remove any rogue specific overrides
- Commit SHA: 29882c889b016c47cdcf6ff53dd8dc373f2a8ea5

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




