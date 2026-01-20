Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0F7D111B0
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:54:27 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9658.1768924457760912716
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:54:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=MixSn3VO;
 spf=pass (domain: list.ti.com, ip: 52.101.85.68, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plAFevB733LB5JHE26S3K6qcbI1Bjbsfj9if/z/jtGv60qeYNhTB56st3HSh8lm0eeR2dzrnhSYjxpSb5mKFbQ9Pzz+rGmRaMzvrNiRKnmEc+Jyyvab4mDRZRfIVUWo848hXtF4DOzRNF0W58dbRBRP77K4MXINDrfbHv6g32PT5XmQTaYbsr22IO+/xUzveednJr0MWi5evfPODdOuGCXkrmi7KAy4OOH8pZkyi7yqemL5TaH/uNACb+o/FIdQ0c3VfLvIfp1vQYH2y/Xk6qx28slA1ApfTm/g2bNXrQ6jRSRkLnbhi9V73TWrvOQrMn5sETwG7KmGaOuXgT/zPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1w9F8lDXbCF+5COkeK/DXFOpz67ceKrbB1csaS7g6kA=;
 b=kRFJ/inqqROqsrRhvaLOB+AtF66Kz/LNzZuaTIRPv51w3nhqFrtNf/bpSlaqw0pdjtPsiYC/M0QJQJoCCavAKqGf8iHJU+mClpGbYhZ3ox6O2G1n0DJJxSFqd45NKdXr0PM1wwHsAW47TLPMmIXa98lWmtQoP3lvwZKPwPRbJMMfMpuLZ/QPc4RV+zNwgEb9JIgZ7Xl00LZf9NrCRL2hNaAq3umE36FFNTbAlEApFZM0U+RDq68wNFznMO07tLk+ajzXA5H9Qdb5iRlzowuQwX9Z/to4a5ilkS7QTdwOyXRpIqXdtL3hIkl7gu8YtkWzJOumBBhBksROdMOGerUFvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1w9F8lDXbCF+5COkeK/DXFOpz67ceKrbB1csaS7g6kA=;
 b=MixSn3VO7vCRI1wlvDM9eBMVnJV3rKY/3vlBym2FDnA6rlVMw+NeAa9nvmNDaCTVgQcBT5ujdWMDTaFzdTjMbzbbN7pzwYA5q+uLnLVm0kXqkM7WRZ8O7M3cxxD27sQqSiL08WeW9y9jHfTS5UaoTmhdO5t8w4yV/HcGL0zgtncFCJXVxB4Po8fSWsUDbV5YM8kJsSi8+f1J+VY4q9MklNYjnjMh5y4SrJdRg+DQ9nOkZCduPPQb6Eqa6+rHcf/XuL7jADpZEvMX/5aMQmGFyDOorTILwJUW2YPy/oKfTxOdefu+EuvgTewIrBiG4fT9ajTe0F8/ztdCVibE4az9Sg==
Received: from SJ0PR13CA0221.namprd13.prod.outlook.com (2603:10b6:a03:2c1::16)
 by CY5PR10MB6010.namprd10.prod.outlook.com (2603:10b6:930:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 15:54:15 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::67) by SJ0PR13CA0221.outlook.office365.com
 (2603:10b6:a03:2c1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 15:54:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 15:54:14 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 09:54:14 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 09:54:13 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 09:54:13 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KFsDq9815524;
	Tue, 20 Jan 2026 09:54:13 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C63109ACF4; Tue, 20 Jan 2026 09:54:13 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 0/2] Clean up patches for open62541
Date: Tue, 20 Jan 2026 09:54:13 -0600
Message-ID: <20260120155413.73106-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260120152519.12538-1-a-christidis@ti.com>
References: <20260120152519.12538-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|CY5PR10MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b62f47-3992-4f4d-2dba-08de583c295b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jNnrPfx6xj/UFqg0NIOUb6/kvCiZpPNnDtBo4gXEaeUUjv7/hiwXwUVj3VVn?=
 =?us-ascii?Q?+1Z7iquLqVOLfr8rpjc74CRTGQhC6g+Kt3BiwcNYj866JMZ/yGnuMht5o1gW?=
 =?us-ascii?Q?cTXFT8Om26srRq1tcICKPnrcpj99YfkjLDLLwuDcaNWs8VGqT2pOq7JwAhHl?=
 =?us-ascii?Q?LMxnTyUai/XUym6gEITuq+rPn+j5KtBRsvxxAQ6woSvPcFUTillMt8JH6aVO?=
 =?us-ascii?Q?kk0XUZMCjDP0jpz69U/ZT9/NrtOte7YEFcLdVpqJ5vso/H1Ehg786ZEzBne6?=
 =?us-ascii?Q?b1qdO9kmpggP8sVCvuzIaDlqtJfPj7QQ4Qgc8oV8dsdNHH++NHVDAIHpzR0t?=
 =?us-ascii?Q?9KCu9irNH3UcyeSrPMZXXdaKE4tkJ5SG17RLLcQIzB51opfycz+WI4WSHFjJ?=
 =?us-ascii?Q?+TseyzSTpCwZKExcVegdOsKlkrQjL3TRttrYECwKXmsFMqc4LoGOPta4g9Cz?=
 =?us-ascii?Q?+j+c2bBofH4Oa1wQkTBVRFZyJNw3fUG7+7aLBJUC2ZV69z7AV2rIP+JlV8zg?=
 =?us-ascii?Q?0Hb6K8+L8JljidSJQ7+p/H/na9g2zHnLMmOpHT7FlvE9jl1+FkFKA0akhBu1?=
 =?us-ascii?Q?qOptj7rnp0X37MetnbKlcmkFP+e32OJO1rYhi6RB1yYZucV5ITzkl8HannAu?=
 =?us-ascii?Q?ivIXwkuy8pF53bHBiiyF/ZVGp20mO6Vea5IVzVj9qJGgycE7wOeaGKEe/u4D?=
 =?us-ascii?Q?RPhJ20ARyQ3H6IDIst2FFwF3cDrcg/PHzfwj2++cKkW10L50kfynw2ZZJn9P?=
 =?us-ascii?Q?aVG5aeAXN0TubfE7naelgD3VZxcVCTM7G49MpzG4I5Mn2sVzEWTNexiYmQAE?=
 =?us-ascii?Q?0e41xMAMXgXcHi96wzKDZAkq8ecAXfQ4D4fCzgFMbG+xslR8flrYGQ8hcwDY?=
 =?us-ascii?Q?cLNgaHDRJ9rNPjC3qaHeOgMWjPYQ3tAE30Sj3xY6ZiWzgry1TCdpH3BTDS/J?=
 =?us-ascii?Q?AbdmEPSJ52LlWR9v8AtmD/Fa8jaN6dFTCkE7ZYM24OPkPIrfl9gtHqO71v2Y?=
 =?us-ascii?Q?EUvHSgLzxTcuSIeKwqMnMk2yMJO2Y+BkLzmK6l3r4VHBkA/ut5HswL04VN9Q?=
 =?us-ascii?Q?70jxJx4GgUoWMS5otIafLsniTmN3E74sjZ+5wtiFiwDJIMnfgj83A1T6ZI2A?=
 =?us-ascii?Q?6fTEid9PXrHxS1hR7peZ6PISNPyirIyQP3TqwWTMp2bKR/R5WzXAnTQfnAeU?=
 =?us-ascii?Q?bNJFwcETEHuY+fSZxBfyefVfNF45/j4O9afTWnP+Hrso+B6a2GYa97DFQkBy?=
 =?us-ascii?Q?6GS1vvewJ5K6BGDeLr8rI5QLi0Rgp3bDC9XeQ5JaEmPIVsi7sD5PmsBcQzy7?=
 =?us-ascii?Q?z7hOq/GBW4186I7y7NEX4KZloCeRIxI/B57mp9LQaV+Q2W5KMp7DF5O6nO9r?=
 =?us-ascii?Q?QvP6JFBaNeSGWJiDSmXVZFvUt8Rqu9V7CJohuO//V+MD24Wpbc76fDqMhTHM?=
 =?us-ascii?Q?l0ElH1hq/jMQIqshMkCal3XDyWHzUyZScndUQvASgZonujnJ7ofW9O02kHQK?=
 =?us-ascii?Q?9jRfWJBLlqK46G/RHq4YfLLBPOwUcGSyHl4MQlaR3VPEWMLiLiVi4DmfP+8r?=
 =?us-ascii?Q?FpPVNG3Kx6huDiFLpuvHVZ+bUP2rUY6qJSVPA8JRlb6+XYdCBg7d7Gz3nsrb?=
 =?us-ascii?Q?4gWRYkgrldTaojzbI8H9VXRSYxRVHqhtW99aQkKeD7Wj?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:54:14.7008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b62f47-3992-4f4d-2dba-08de583c295b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6010
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:54:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16989

meta-arago / na / 20260120152519.12538-1-a-christidis

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
- Patch Series: [meta-arago][master][PATCH 0/2] Clean up patches for open62=
541
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Tue, 20 Jan 2026 09:25:17 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 415b092518234942292321b2d01fe7210=
a2b704b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
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
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




