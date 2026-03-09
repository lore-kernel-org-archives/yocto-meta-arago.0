Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20894EA855C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 05:34:00 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7756.1773034436690073451
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 08 Mar 2026 22:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VZm7NIm5;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.20, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzzGxtB0ygknSr5pob1/+NdgO/76osQjprGTcs5tRuF2K7er6pgB6LxGN5pJgYiqqBdWpEiu2bBLX4CyFsFH7t53XESkMnteeYS8V/djfN8bYj7A+6J59SHscbJNA23uWZmSMdiGvcNPhS/G3oE+VaUsvX3ZIqrneNlDGLE5G6aiv1w0XyFaS/hcSY4buFeagdnMEhUFWuKjZVdwQ30/YFqPFGKxG0J2Oa+4f9bawAVAAdEELJTMCn33j6o7EUv61X4bE2SDVo+zfc3oRMnoZxYkDGgFD7Yzh5xNqgaeOVrSNQa6R71s/dflbDsBEx2Tt90LtdGh8Y3jWAeKBk8R7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odpVgRdBIwAlrPxislUKD8j63aGqR/MBqGBFnp3+uJA=;
 b=cceGff38x763zC/EROXAcTJEw3myrhx2eFK1VvziYZTPI98K+XjB9OUsHOCM6m3Yx8i6HZx+PopsxPN9g43CTFsEAv6cRzJo07WdcpCPCngceCEkG5iPr+gm5zDsytFPqIojeIOrACmli1xQsVdJMGcQZrC6ARM+fohsmprLt3fVfnfS9Ax3LTi3YXjFbQwrrymY8FTl2EmN/EPVC6pA19rItRd28gB2Mkz8ZpJOO0uYqHhJ9Aqr4FfL3OrhgVOt6T7M+3X/16+MAih7nKssHiSsWL/NPWF+dgBzPeSfee04NOyqVoZTp/lh/cTE89BY4srYul+Ka0f2yEzX3sYIaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odpVgRdBIwAlrPxislUKD8j63aGqR/MBqGBFnp3+uJA=;
 b=VZm7NIm5TmJJXO6ZyfG2PXvRE95N5r7xAViAZ5W247BGHLEHN0bEZfcqb9xS2UVE2xV4fnQu8lVFtVl6UAbhtVMiRQf1LVRyePBgkwIRkRLq0e/LPbC+oo/ujkg7GSGJnQEdH+C9KfovEO0H3U0ELxo+2fJTMgua8yix4CWYDtc=
Received: from BL1PR13CA0129.namprd13.prod.outlook.com (2603:10b6:208:2bb::14)
 by SJ2PR10MB7857.namprd10.prod.outlook.com (2603:10b6:a03:56f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 9 Mar
 2026 05:33:53 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::f8) by BL1PR13CA0129.outlook.office365.com
 (2603:10b6:208:2bb::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 05:33:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 05:33:52 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 00:33:52 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 00:33:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 00:33:52 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6295XndI496421;
	Mon, 9 Mar 2026 00:33:50 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH 0/1] nnstreamer: Fix buildpaths QA failure
Date: Mon, 9 Mar 2026 11:03:45 +0530
Message-ID: <20260309053346.3827889-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SJ2PR10MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b80594-1ef0-4e60-4e89-08de7d9d7344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	4rtWOJIaaI077fGCtBLSaJdFzotzfJENpN1o6p9dMTcjgBHT30J5mPBX/hiaOjKJJ1T9BbMfAwMM8zBJ8984mrkyeR4r6PuUG2waA69sEd0DZpXBwda8YBQlVt4Un7jMtgW0Ff9uBh1jUwysbdXsWVOX4Ved1k9Du6Dzlj06NbbzcsL4WA+T3PGXRmokyVM4/09+0pZlueHnKwZqKBCDMPgJuJfY67zMmJ1PBJkuCYs1QgMht+jI5CKPEQoSZ8H/0O8f2UzmtqTRJkOw2ECyGikb+nLRG57WvoCP/54ymtws91mcJLTvTZeLrBOcIjm/dY+A0IYvJTL16AFNPsbLZ9DR8g87Y1rcmulKyLikbk1c73WrjsvlXjn160OhwTx/M4O8edhNIFLMgVHhBq2hlrsnfk5n3t8lyk8vYugJi78OWErw6kxMvKhMiRrKtwYrLeo2TTflkO/bxIKW6xn2wc17J82bHrUUWtIdI45YeNVg2/XeWJzqlrVGCjxuqEl8GT+SLEG8TyUiDdxYt+UALBrlZCNVtdTEA5UHnTLsVNHyf+YvnYVPXrnqGaPMSu07EWl9OACsE1elWBb5o9mksIuoF8FfMLb1BgY8Ovt3i/NamcjbaR2m5ar6f4CyCd6J1+sNIp+8OKnWmeoIbS3WrG0ke1IRCYs2kBdClEeasBIWyT/sAyCKEEl7Pmn4Cly0bwSf2FmRGS/lrkVX3w+KCvONUKWtTq0eTzG09GRIaeae8nO7vH9HqQlyEprSLi4Bft7/upvw1ohm6TKJ4LWodA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8lX5tu3VzsIC3uoTkRmKyg4YOHMh31gMh8rt6XEHIPNRjmQ9H2HtEVfWHDvLmb+OEZtRA80sRBYdJ77OZ/d97c8DcUvUwarXQdemnA5gxJhPpGQFKsaL/QyWo+EQz0bxqvA7Gi7HmU8ed/fKF8nVTyt1hILfP/fRNhAtkrYT4lURJnQrBrwviC6VvwfpbGuF3Ula7fgMF+83GX79t9Fpf6j+3QoxtMP+4O/jlU47OI8E7nb3xiphso3AU3p3h9J1hAuoIWTZX0uJ48wYDAoXsc6B0Rl662HXfNghTgoz1Ivo4xu4cRsVeygM+1WYuk5FwLXo+52xlq3lBDBJPswxpW1oACzntMHR77beMJo1uQO2CrQdq5gCAJGhBcrC2ixj+dgzBmTCXBsw/EwwM76kCMZAU2PQ50vRR8RjX6CzYixnSOR/tA7sjoFI1u7zZUN2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 05:33:52.9289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b80594-1ef0-4e60-4e89-08de7d9d7344
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7857
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 05:34:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17281

This patch fixes a QA buildpaths failure in nnstreamer that was preventing
successful builds. The nnstreamer-src package contains debug source files
with references to TMPDIR paths, which triggers the buildpaths QA check.

Pratham Deshmukh (1):
  nnstreamer: Skip buildpaths QA check for source package

 .../recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb           | 2 ++
 1 file changed, 2 insertions(+)

--=20
2.34.1


