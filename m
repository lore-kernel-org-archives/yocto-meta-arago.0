Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C392106F2E6
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 07:54:40 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43066.1774511670961184408
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 00:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=qMSr14zv;
 spf=pass (domain: list.ti.com, ip: 52.101.85.8, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmOt6gU8IVzgIyc2/l3DPrFmlEF7D5fydW13kPl7LB0WtY0MqGU0IyeVFvuSkjB5gzyDAqIf6GIqxGob3D3KAFY8DKjutZExHDIa9MkKuYGOLSAcdV/eA3/dbAB73dn+fNTiBHFvBQRRfN/4SDQ4b5Tl2C5z7apyNB+ySeOJYwNl8YK+jKsih68sdiZWotd8It4n+2tt5kQeuh5vjbb+Fg420DHixanQQr/uc61zeZxxEIf3830KYEsYvgcmCLxn5joL9GAIqJdF2Af6ZqneQ5J6/8Z3kQF4/VUqQ4mgPHK+sYTqY0GzDUtZzmnJ9Qli12IRIH/xsY5876BY0dx8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XE6xBuDvjnFHAvSPLu5oke4+VjOGMw2FSdDQvfCl8TU=;
 b=E3nWQzjsbczudu4rUnxKqoZD6HijhqR4XC6yajSG+ZMALobvqf3kNzUywXTbHRfXtgAa8t0A3kI5TRa7AgZtLnVa2QrTkXZ/zeqCx/KGjMoIuZ66LvSY/FSOUmI13ZVOB37mcwqAXaxbuXvNj+IGcRQ7p1KC39WVAt9qLPV7fJZfR5Fh0/b+QC0ZHzppO7iBTORXeHXsWBkTUoz39Tiy0OFtgDHw9aCoZSxkWI4brH/XpkBafWJYC/hICq2mdZSikC8G2Zaw+MrN5EfHG8zWUaRse6xbsXejJSRNyJBFpglMc6rutm+8QKFgV9T7CqwB7XIr8nxMr9PtrFsp/Fr9HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XE6xBuDvjnFHAvSPLu5oke4+VjOGMw2FSdDQvfCl8TU=;
 b=qMSr14zv5D3UER+ghRmBzvoRj4TnxTbpqkauQzDyuCYm91xSL6C3eZlPMrN5Y4n8w+eIj9ENQxFSaf73Ee1gsQYzOAjTGOlcvA3IUqYMPLiOpNF9AT4OMBTc5z2u/njRwIDnxtZfq9anBQR9wGKN2sxXy1JyBV7SMFqtpoiF9NlE7FhkIowF7cxaIs1vLd6XMW1cW1J49gR0ai4eipu+44EzIsGQNNlkdPuJ7t7MTYbp1LjjKStoa1T3nWIGPxPJKjDD9drjvra1c+sOqdgMp0r/fycMxpWjfHzEEeC/BPckUhM0QGS5kAz65J1xkWhmn5LBFKEvJ2S5pIc+y+37mQ==
Received: from MN2PR05CA0019.namprd05.prod.outlook.com (2603:10b6:208:c0::32)
 by DS0PR10MB6270.namprd10.prod.outlook.com (2603:10b6:8:d2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:54:28 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:208:c0:cafe::bf) by MN2PR05CA0019.outlook.office365.com
 (2603:10b6:208:c0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Thu,
 26 Mar 2026 07:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Thu, 26 Mar 2026 07:54:28 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:54:27 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:54:26 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 02:54:26 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q7sQsW3538663;
	Thu, 26 Mar 2026 02:54:26 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D80319ACF4; Thu, 26 Mar 2026 02:54:26 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: Re: [meta-arago][master][PATCH v2 0/3] ARMv7 support across ML frameworks
Date: Thu, 26 Mar 2026 02:54:26 -0500
Message-ID: <20260326075426.2645675-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260326072653.1025506-1-p-deshmukh@ti.com>
References: <20260326072653.1025506-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|DS0PR10MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b610f6f-7dba-492f-4b88-08de8b0ce820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	h6urqIgt7cHcplLGDcr/widocHNJ2nh+dPZ6qD99DzD58LsM0hQWX2hy3pWIsWyEr+P+XPgb8pGFlMXFiHRU13y8L/NtlT8FODYqezMEwefS9gEaPSoVOmua89R7ZCc2rrx58LokeEvqLICLzpXnx06zgNXDO/j4eImVYLAoyTWkqyPJhFtsIAK8TI8a3JXSFPnqDIMVEb4UPOiZ9cCHhmXBS+j3BmR2xEuUqIP/JAe2rMZj1VkzkSXLk0iLsj6FkMKf4MZdtDGA7V3dkQ3Pqn1xx+C1tldyI/aGUGQmd9YagXD/m6eUzPu0IaRusCS7m/c01WHloOzYeDlXNRdf0/NfL05V1US6Dh3Z6zG7rvLvEmMS+n01CVRW6p0Q4vnfZDGcBrVY/0x9CxS++9ukza9amtOJsTKSSrVnYDFVCjVDmA+nnwIs5oqD/WRmYpedm4xr6cOYBHCTgRJTh+xBFG/0saa1EKwvZ1N5stNR+LO5dUJTX5fegTeDxTrGNI9FbY4uphT2eOJCnhjmrsuV/nygLWhmTuwv4OpeyUFs5XiA20djdBsCz35L0gAELkcxA3vZRh1Oyx7DG1h3UAu8+R6/PJ7ylgkve66rYMg2tS9/UwJqJQCmItv8SlUhbBvEhJSzUw8gEB6BI0uUWdP+FQz6rKMxyZIO2GIhDFwx8n4eHP7CDxlNh17l8vGMe7S4j5yyVP17rwDAb7Lp0C/feZ96D+5oKXchvx76P/2FK9g9HtLMvQAwP3l28d3Ci2i7Nw/zgQg7gglzdZqKuqHNhw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZlZ6cJoSyoqYKLqPDzx8tKVYazpPMMfKB0sVL0kunyClgR6eWjhOP2bF5johbu57QwcGQT09E25SMA999DODvUgIevE5xAfDimKOZCAVqAcKwRnuvR4sA+qQMgR6UJDeVvHF/TOL1s1VNu9sa/gzQbZNtJOxDfd7LZNoenTRyKBLqLSaDAiws1cV4XGDvFcN1HWdOt0fUEZ9zZFDoI4cSRQW/ZIfzggjyiK0FOL/LjraxAAlTRnMx4DIL1pJ5E8WQf2eaVJ12l1xNHSnaU0kwLAfTrDfU2rE9yrf4QqTJEpkB/EAqbS3EUIb7tW4qaoPTC0GeEffpOUXAUikhHRGeN8P5ogfDFQ2Tbwzda2FPTkzKD9KdyD73yfjhjUj3kok64RRz95ufgB1ogeSCc87WzlkezMOg89FEOcJcgsUdLrOxYPiIHTTzJm8ARSZZWUd
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:54:28.2348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b610f6f-7dba-492f-4b88-08de8b0ce820
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6270
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Mar 2026 07:54:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17445

meta-arago / na / 20260326072653.1025506-1-p-deshmukh

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
WARN - [meta-arago][master][PATCH v2 1/3] tensorflow-lite: Add armv7 suppor=
t with fp16 optimizations for v2.20.0
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH v2 2/3] onnx: fix 32-bit ARM build failur=
e due to LONG_BIT mismatch
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH v2 3/3] arm-compute-library: Exclude AARC=
H64 KleiDiAI kernels from armv7
    WARN: Revised patch missing a comment. (REVISION-1)
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
- Patch Series: [meta-arago][master][PATCH v2 0/3] ARMv7 support across ML =
frameworks
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Thu, 26 Mar 2026 12:56:50 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 8d31555c25ff15d4a587f03bddcff9e78=
4018bc5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago-prefs: Remove old settings
- Commit SHA: 6a3e3ddaca8ccea3590b072ad7fd1f2cae50df35

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




