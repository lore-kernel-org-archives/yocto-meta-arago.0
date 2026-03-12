Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B24105A599
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:09:40 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21065.1773320978927908153
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 06:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=YkyAybs4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.10, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVkZjHNWBc9JeK/mFgPuDnfqJ1TkKcP+QNzeCBbEd3SkOFEJYJ3k94bkt2nzLR7Y27qljm5lPrIZRHzwqISkHZvXekCafuWOsGTFgc6iuHMZku7FhTXSM5mtlimuZboJuhMZcAJm1gTazC4LYziF/PJklp/vfCeeN5o8dae6yOQLTsePzzBcsmhYz+MAWTCreu91xrLEUxF9oq0QIKzhWMj4Sz+Qxs45lwx9hhFsXyMSlIds70EFVVTcvM/9qbQtba0mP0bMfD0xADwy79UEJrSdOdX7ixEWP5ftZ6BIcmcngOMl15NREo3uRLG/8sMCw6UhoVWKBQFy7RJ1BXcu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uO19dsGkjo9Uy9C2+Ej2o6AATYCquh6Zd7fJGFnAdNA=;
 b=m5D6K6uDWCfp9T/qcsoAhG4djBbrlsdmhuNJP82CrH8vHLsDh7sKP9b3GEOVu3oAjkWOVj2pgr9V/TGPmVRrSGWRat3JcBaGxCe+Cay6GcKWcFXDW0qbotJNC15jOayXgeCpQ+jKUtPxL+hkYxEYoJbkbZ3vOWZV2DZlDPzsoSES9dfW8fEivgQoP8sYRCjoDYZFNVOMNljuFkC45KkR94OHK3U77gi2KhHRdREkCZR+y8lybdced46/SZf5nRreZ7dZBNNFFEajoxm5GU5BJGil2Klo+EyddzNVS/ZdlBUUng2Y9RuslBaUE6W6n9veMaecUlM3AerpSVN4H6hoRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uO19dsGkjo9Uy9C2+Ej2o6AATYCquh6Zd7fJGFnAdNA=;
 b=YkyAybs4UcAEYtQhW9rK675VqmvK8pNvbvxY6yUBTpSISr8EGIQ2azAKrmNLqGkrly4JglEhnGHW1LxLv4A3DgmFsajrzav/2Lu8q2RAsVmLrKtbhFKoloGXGgG+rlS47VCphz6aWlma2JESyMKNTqCEQsmsGXaeNN2wFHlBmAA=
Received: from PH8P221CA0032.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::12)
 by CH3PR10MB7807.namprd10.prod.outlook.com (2603:10b6:610:1bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 13:09:34 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::81) by PH8P221CA0032.outlook.office365.com
 (2603:10b6:510:346::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Thu,
 12 Mar 2026 13:09:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 13:09:32 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 08:09:32 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 08:09:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 08:09:32 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CD9TgN2352409;
	Thu, 12 Mar 2026 08:09:30 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v3 0/1] nnstreamer: Fix packaging and buildpaths issues
Date: Thu, 12 Mar 2026 18:39:27 +0530
Message-ID: <20260312130928.889341-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|CH3PR10MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: e881b593-e231-4683-0d7a-08de80389a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	iSPxgCor4/1O9nKFL6IvpDtnJjLYcAzoluY3WH8OjOqXR4EPRzoIetvyJVwYj7VmnTi9mri0LOKTHQs7CF5UdTPcpKDK+4jW6u1MEdq0RYV/JuwRSvmvm8rEo+RMdXPN1km00rUql8zh5jnOOZ9ukfN8LzHkaZciIYSAzv15SjwOjNkOVl2ArVbRBGngCTscy0aF6TsOjL63L+1gt/VcPFvYGGzLwTAt/aiC4jWrKUu5zPJnG0ReTBd4eDahLNZKgdZPodWd/SYr+6SMFq3iTVwxaWmnwpPC/DHb93Fo8MZobsD/3wcwus9dilDMIkB5wtHp6QatzMV9d6dYyQyM69345StmnwBvQMuvTcS5qhW7EfWed7Sb4tsmI/NfgOYFmGfEVRq8xJbEAQrk06RqpXpNqSkEOJr5RCYdgOVHlK3thKcARrHYbviI9LebN4xHM5s/FrNg1nI/Kw+M95tNUgnmm0cKHlY2JZdPsmRD+Wn1CvxAkZstQOuduzqlQE9ovE2cjelEDKVf6/+jsMt0afKlWni5lDNAIQvknox8NaaElG9Q0MWRCEGsTyMr0b9gItbth348OpYns60cXd5fUJinCCYSSXKO9t56x+NgkB/9aqiyViiCWrSRMjDyBFg19tlWKhmjXOUX8/GYVSFZwrz/nVFjz95OwkRT5nqTQfImTddbq6JaFUDmF6Iu1UfxkC/u26RzqLOUNIWgbF5823Kpvo5jgAIgZ0NC77XmYBV8YgFRn3wFNBdEJIG1iHrsQr59h44VUoc95dj1dGtYkg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ymeSNJIEYuFHC4BN1jENwCXbBrj3hQ1dF5X8op2WBzBvgkqayM2VNv+Bmmg+x69lZmhk8b1uzmBAJnu/xsg+Srd9alb2bQ3fjV4J8mH6+4ZL0nx6vcslPH94hqkWSivyjPtH7RebqWuFufJMYv45SSzIM7vxgiK2cCcsYsUXAT/38HkXWMhYE6rY83PFKthGtCajgHtCqArYxDD0S35GBYzgrClMMxJhVckD5KIfZjWynfYi86Vc0oBx6QuqyHzSPa92sI6rb1d/ZYnwzB2NnqScTL2srsFjYqZrZgpHfe+Jv9iqHQd/B0nZKpLdl7FnJ6b/kjgPzqD2DKYHZYTSbutycCVKdW6r2PToT2uCiE/5hCo3hL5geU7yM04jUnp0CgfR7ruYVbdVtCrqVBxsFA9R0kWArBKORADJNznNZNlVIjowO0mXuOaF0B5JFxIb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:09:32.8586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e881b593-e231-4683-0d7a-08de80389a5b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7807
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 13:09:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17315

This patch series addresses two issues in the nnstreamer recipe:

1. Resolves file packaging conflicts where test binaries were split into
a separate nnstreamer-tests package, causing runtime dependency issues
for benchmark utilities like unittest_filter_onnxruntime.
                                                                           =
                                                                           =
                                                            =20
2. Adds buildpaths QA compliance patch to replace absolute build paths
with relative paths in generated unittest files, preventing Yocto
contains reference to TMPDIR [buildpaths]" errors

Link to v2:
 - https://patchwork.yoctoproject.org/project/arago/patch/20260309061254.39=
42533-2-p-deshmukh@ti.com/

Link to v1:
 - https://patchwork.yoctoproject.org/project/arago/patch/20260309053346.38=
27889-2-p-deshmukh@ti.com/

Pratham Deshmukh (1):
  Consolidate unittest executables into main nnstreamer package instead
    of separate nnstreamer- tests package to fix missing benchmark
    utilities.

 ...ute-build-paths-from-generated-test-.patch | 42 +++++++++++++++++++
 .../nnstreamer/nnstreamer_2.6.0.bb            | 15 +++----
 2 files changed, 48 insertions(+), 9 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/nnstreamer/nnstrea=
mer/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch

--=20
2.34.1


