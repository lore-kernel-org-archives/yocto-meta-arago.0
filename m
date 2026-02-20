Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0457C5DF68
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 23:55:51 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10762.1771631744760888057
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Feb 2026 15:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=X8qvxtZy;
 spf=pass (domain: list.ti.com, ip: 40.107.209.69, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCFHbCtHC51ne5pdTm79b23e9vIyBhPrsa8qSwf7Ijluelf4vu4tPw+7VDSAHeQnnzSvoAckiJ+MM/f8vYuIk6zP6O6/obBASbMrTFehZzsoKOypA7CVWrp+I+uWIA9RkNV8r7yGI+g0Oz0KjRoiIVlril5ah/xZjZ5pVUD39Hsmm51z6azEK/nyg3rHTkkMrT5Q6p+ImQVdBfi1BzYh8+sHdm5x+BleD/7qTMwsGXrWXvSdbeqwcEbHrkM7QFPR+pHWf7yszf2PETCK5BPwklasSzWtmwhvLXpTKM/DvAoGslw+bl+DPRxgQcC/aUxbzpni7d68ykXny3np21IuWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/h2NU3L4vYfRxFY/xSoI8foJNWiL6RYKagzt3f95Q3c=;
 b=LHOs1uPKLFRMcGRsVu8xDdS+5mdXJxiZ+KUAxi1m6l+MTu8od8i4eCc2KzK6iqIc7ZlDsUZ3i/ZYfRtRzvyXhXYwRLTzYbj7Te/4N2Z/TY6X35+kckfDeLX6fa8pgg8SBklTtB65IeriOv4lfEzdYVvmOg40NBGXyQwrQo64ZbgPBvbH8E9igL7kGzaa96wwKBfYTQD6wFI1PXN3bFijuiJKuKhoAXLpUGM3eHQ6hQ6ZfKh6rg0FjrI2Q+HVbys1sjynwE53I4Fb3Zj3LFHOg4ZAXOLcvQhtzOlvmKU+kP+6+Bx+9jzGOcK3nuNX/l53PDcmvNkVowMmUDgrLNStZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/h2NU3L4vYfRxFY/xSoI8foJNWiL6RYKagzt3f95Q3c=;
 b=X8qvxtZyOtWTaqQEVjLg4c2ByhnR7rzEEkBK2HUS5dn8CpRVh9rriGEGwSWqmbPVXZvJMSKwQbtQaq7qnkDPMwTAFBDxCgXVaL9wDrb75Sywu5JVeXziGbSwED5SAhc97Nx1VKQkBITq8MxP0s9Mk9fG1BM6XW43zO1YBtWlP37z6hKEDN63nQIMIIE2EfQTuDIjaARqbTSiZuVRFE62iAIehzbBk/kWJj+KzZ0zJNAtBRgrtar8JtakMucIk5qNueKBoTuu3A/v83WagQPAIaJ5KFCjeoJk/9afElJUhi8T8xiLH7nu0tAScX1kKtV80zc+n6HUgxLxPCAr4RQm3g==
Received: from DS7PR06CA0046.namprd06.prod.outlook.com (2603:10b6:8:54::13) by
 IA4PR10MB8328.namprd10.prod.outlook.com (2603:10b6:208:56c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.13; Fri, 20 Feb 2026 23:55:41 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:8:54:cafe::7b) by DS7PR06CA0046.outlook.office365.com
 (2603:10b6:8:54::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 23:55:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 23:55:40 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 17:55:40 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 17:55:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Feb 2026 17:55:40 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61KNteYb488537;
	Fri, 20 Feb 2026 17:55:40 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 40D23142E2B; Fri, 20 Feb 2026 17:55:40 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [oe-layertool-setup][PATCH 1/3] kas: set path for all repos
Date: Fri, 20 Feb 2026 17:55:40 -0600
Message-ID: <20260220235540.2176051-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260220235407.1064734-1-rs@ti.com>
References: <20260220235407.1064734-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|IA4PR10MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 4721e7c2-c71d-43a0-fef3-08de70db8da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Rdr+R6kyckRtSsm7kY1HWkBgdCRwoBgHHof6zff8SCKoAWruS8Z0RoRINsPg?=
 =?us-ascii?Q?vyK2T8XzCWmkgw8ORFEA0Urw2Gdq70n1ibvGnJAD9OOSc3dwxhAx1I2FXBXs?=
 =?us-ascii?Q?Vs7Ke0SAUXfEOIyrcqvS5DRrsCnFPZz6nC9MIk/hNkobxbgMbZfedieI860N?=
 =?us-ascii?Q?bAgKUPgql0pxuapP5OICceRmxP5NfRCLcHz9rbx9uaJdnmos4Q/3yl/2ps1F?=
 =?us-ascii?Q?RJQELT0bMKNcLYDmhKe5pgGdh8YHVLRfmo8nhcJM4qDUuRI5AK9aN12qNfWq?=
 =?us-ascii?Q?2R8hiLnefXrSpNY46a3HpKlXOW0YMZ2YUMo61UYpbTUhZ+AnlMT1PG6SUmcO?=
 =?us-ascii?Q?Zk9z2zH5FqgsAlaVLGBPqGmT0ZZp9xSI2D4iJp8B4oo6nY1PG7ovRwlOowT7?=
 =?us-ascii?Q?B4ypsT3vbK+qJS3vA8w4sruHK84FoC7YdaSysysd7YtD0HN0fgZlkjucE3NJ?=
 =?us-ascii?Q?h/kwHhhm/0y+uUAIJMW5xV2sAEsWFGJl3nJHxJ7hqwIr9ENdF1kmK2+UZiwa?=
 =?us-ascii?Q?PS/uhrXfgGvhYXItlq1J6qZCDwoKiJjvVueqllu+Iv6CNvTGFrerhe11iv8n?=
 =?us-ascii?Q?KzqfauYgFfziAi9xc3wFX3s52bNPiUZwTAb+pGYLfiD/Yb+2CGHIuNNPl7Qo?=
 =?us-ascii?Q?SLt++HH7WRfX8b/gnMgeKNyUURS73EEPoVKc89RnF8bwxmQ1ZXa47Swo3PaC?=
 =?us-ascii?Q?GGL6hL3JRqnWnZOozo3eDX5OZ5rjdm3wyBm2aeX14IWrWH3UZKhztbIZlWGr?=
 =?us-ascii?Q?sMuN7FsPrUrqPRiYATI8CtmerbnSb96AXqUzMzkP/LNP9dTtQiBToLBFAY8i?=
 =?us-ascii?Q?k2YHqiid7WWI9hcHdER1V+47VVrbqykynEmKWe5OSo9juqy40n28rNkKvkKS?=
 =?us-ascii?Q?ASQnLzlx7iYRJPdkXP90Rx7K4R8NMXuON/cKheng2woqmwxqs3ZbdI2m4wAi?=
 =?us-ascii?Q?m42q/zHJlf3w4thuqV20vErJGliqfKDt/dahgZeB6+7lEiiMfl79iAkPrrhW?=
 =?us-ascii?Q?v0CFl3SnQS4VpHZPGj6WgSMr+IjPcW10YgPZ+3UDlOiX35SHZK3ggrSWxQpw?=
 =?us-ascii?Q?C8EaRVMX3x8N1ItSS+WC4PxWLmhNrcIFs3A7+fpdHOM6o2wL2969gTu7XCpj?=
 =?us-ascii?Q?CUkSsnpss4qwxRqm12sLL7VCy2CVX8PFChFn+HM7OYQyriRwIz1YDO4Dq/Yf?=
 =?us-ascii?Q?49ajOumexX1ewPQWttYWz78O69JmSQfbCM5jOeKATd2LEL+Y7SCYGMDkRF8L?=
 =?us-ascii?Q?5ewx0B3FIox47hWYjeKBkbD9GPhCKz3Y1BDEwqPm/6wi+sfNN8J/4A7ndbA9?=
 =?us-ascii?Q?IkJk6D3ijzRSFcz0jhyMLXYfeh+ROYorjMVTZWUykHhK9wXcLAawVdi6TM1+?=
 =?us-ascii?Q?r1JiRV29fWeHM2w6LMMqNd/5X29ZX1wSCmMO4OyOt2nQfGd3O0lu/DAFlyH0?=
 =?us-ascii?Q?ufsKb7doJwZOTt7JSP+dJsREUVOAqCTRmA52viAXzuR3bmbCBB+oHHsGWlFZ?=
 =?us-ascii?Q?Ci8qct32JpzX+LN6uKEvIVveA9SE7mEXQnNEAeaRSWhOTM1YTFvsTE7g6Vgf?=
 =?us-ascii?Q?v0/Br9K2MQ1mMwqWnmga+nGajMYxpa53BUXTun9SCoqm2V+qUo/auIV5nT8n?=
 =?us-ascii?Q?NQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bhYBjWR/3vH8IdYONNpjcgTYKc5UuwL0B29sCwc5TkVD3BgsSR5yWk1nnzcpay7G1F0b2JtII8FXb9FYxmRcZAUGTLqEfeaIaqa34YISRn5IqchzI1OY+V4GyIUeYEtqDFM1mMYWNVtPNhsEDQgH3nyZ4DEJzkkRO0xy9+n4wV8JgP32z/ICPGoTLkLsZG88DiG0PfLVjMmOL7iRKGZ16y0O/lj6QTk5R8nBtPxoUEvhCFAZPTp77Rm4EOAYk7fYNPT9Ro0UMqHiZCHVsucjg9fvlnXN3CtxLKfcdJ32EGhTKV5lqNS3tRBIbiMHqiI6IBjqVGy2gnOmdqJirnsAbR7y4xTiXtVUY+0hMpWbkBEpRvBpZczs/qnVOlunExEzYoV8vKfZfsi+L6UyY2SMQbhSQaxslAXnnTVMjYQIfaZjuk8SdLYdPSzU+Lqv+Aq5
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 23:55:40.8949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4721e7c2-c71d-43a0-fef3-08de70db8da5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8328
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Feb 2026 23:55:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17129

meta-arago / na / 20260220235407.1064734-1-rs

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
WARN - [oe-layertool-setup][PATCH 1/3] kas: set path for all repos
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:67
            Subject: [oe-layertool-setup][PATCH 1/3] kas: set path for all =
repos
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [oe-layertool-setup][PATCH 2/3] kas: use repo-relative addressing
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:67
            Subject: [oe-layertool-setup][PATCH 2/3] kas: use repo-relative=
 addressing
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [oe-layertool-setup][PATCH 3/3] kas: regenerate all configs
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:67
            Subject: [oe-layertool-setup][PATCH 3/3] kas: regenerate all co=
nfigs
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [oe-layertool-setup][PATCH 1/3] kas: set path for all repos
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Fri, 20 Feb 2026 17:54:05 -0600
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: de79d4131c9228109992931866f2f0549=
2945d36

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Brandon Brnich <b-brnich@ti.com>
- Commit Subject: gstreamer: Fix CMA Exhaustion in latest gstreamer
- Commit SHA: 92479493d820fd6a617a4605ed2612649f0c4aa7

Patches
----------------------------------------
FAIL - [oe-layertool-setup][PATCH 1/3] kas: set path for all repos
    error: src/xslt/kas.xslt: does not exist in index
    Applying: kas: set path for all repos
    Patch failed at 0001 kas: set path for all repos




