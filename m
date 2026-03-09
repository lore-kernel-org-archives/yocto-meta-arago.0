Return-Path: <a-garg7@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB50AF3C24C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:01:35 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13588.1773061290836425930
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 06:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Ku2MU5SV;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.34, mailfrom: a-garg7@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vS/e2GKhzBJOFRRaV23ip+Yk/H/Xaqx+m26EHkNmpDut2nKHSEIb+oaFK70iA+Xrsxl8ZMHMbuzGX38fUq9gm03cJMWGpYYinxgv5yk423+CbRdLRwBe+LC59xEvGiamwkI1+XUq4U8UqbNjLkXYZtZnbILnsIjfobtg9HTxZGp8aA15jVlR1h668s3ZXZ1UMXqtAAX+3aQcoEbNMou2xZZZzmrVDr8EEZThPgfXcC3tIVmTsoV8GkMEK4/tISxvXGXUMpOx4oU7l/rfRZLQlIluvWog2C6Pk+wp/tANBQEEk0ZEXvtNGpu91fN97edpkhrn/D75eyCsfliEO/wTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s484ZuQB3VS6lH6FqHBX5c+Vifnqvi6FMg+FEaW+DiU=;
 b=ZCjoYC3QiyEkeY6O9ZO8QGiFKfc+lXN7jiydUCIxv9/U3RFek8E4o1H1mylBm0kKmJ37RcjVLZJTPdk2iy5LMJBdU/e38yc5TxzZRZiGkjCxXl7Cjz+DrSXAM1YZjdTeAHiqWes6ct4gUOX8q6i3U8+jnAaxP1HkFX9u87Yd8EEzhT/0KYii7HM4dLiNbQcsmKv00s5cgmljTMv1YqAoD+OwL2sOauGanAq7SMHtEHXtY2wPKhojsyUapnndjR8cQXK7c84lgSsn4e9w19ZbpAWM2jbHQoLTfQYHY9QChqU4+nNXuEf6kwWn+c2QaJwu43r8O4fFG6DnvIhs/+7a6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s484ZuQB3VS6lH6FqHBX5c+Vifnqvi6FMg+FEaW+DiU=;
 b=Ku2MU5SVlJRdnr9U5aXGN36n71foKxf3XN4ZwVeV0UgLMeCl3xgA7GmAG4/GjtHZh/1DkmVEGT3Ls3B0lza0VRISZ8LZS6K3hpZaQ8Gh0OoypbtuMX6UxOINn8c+klivShH5Eit6gZcjxyIFFkOh+Y2SGsoWqofURWf/30X1TT8=
Received: from CH0PR03CA0287.namprd03.prod.outlook.com (2603:10b6:610:e6::22)
 by MW4PR10MB6345.namprd10.prod.outlook.com (2603:10b6:303:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 13:01:27 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::53) by CH0PR03CA0287.outlook.office365.com
 (2603:10b6:610:e6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 13:01:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 13:01:26 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:01:25 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:01:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 08:01:25 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.69.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629D1M1u625871;
	Mon, 9 Mar 2026 08:01:22 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <c-shilwant@ti.com>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, Aksh Garg <a-garg7@ti.com>
Subject: [meta-arago][master][PATCH 0/2] Update PCIe Endpoint Testing Application
Date: Mon, 9 Mar 2026 18:31:07 +0530
Message-ID: <20260309130109.52886-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|MW4PR10MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: ea36fbe1-539d-468f-5eda-08de7ddbf911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: 
	gQPBAtrH/ykKS/WVlfvLTbwMW5wmv6IVzeoJGxGjIqcNJ5WF/5ik56UoMYxJzHbg4atruqMwbQ1dRqUGc022iPwmgq2Wpzy27x3HgJrlZImxWB0nAk/AbFFe7Xyey63peBLZ7vbPip7DPluv4PpLqjZmCN165v4G5Gi+cSDZGD6T1+/5jBZgYcrbbjKRrRloOiaam59oPES+upOn4w1E4fZWYV6LmNOlkqPBhkBnMQ5mxlkvVMyFkpAY21QT0CVdUZ4zRLQNXJj7TPvQPCuQL5ndRVIDQtaACO8+MwW8FCedNFgTzZ4bnwmT4ipfeu37wNh3v7IX5Idn9MXB8q1wIYsQZKegtIokSrKRkZO4VNbBVGO8/xVRMB5DPEx7shzeCuSzSHTHz2VZkN0U9vouwaMSixiyHIicvJ3V7JD0p/CEkvRSska+TXPo3+9pLEeo4XyVV6ML8E65DlnQxRo6s6x12B1D82bNKlkjzgX7fAtBJ7EhfDWjRpC3eDxF18gX52cJDoeZ7hiw3sJZ8QNa9zI9BUXs1OLu2awU1K/U68qb6GEzHySlOumXH7jNIDkOC4V5z5rhc+tibr1dSRxSzFy5+ni+gG+mc+eR1ZXi+eXRIOnMpiQGXLDXOB8VzLRbgVXVIPxQF+AAW/YKFyBpqvunDFlg+Fqh75HMxiQuDtmlhyQVNjpPRDtykYpINRAfyOxtWFgZ167FgStpGF8F5Eo3I1YFzS7ibmnYdlyETQti3RG+dfZUDYWC1mVNH+GQGaJ1yPIr5Yw2JNPo8QA5ow==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Z/c394Vdn+ONEqkuEc19QjDfNaTlED3SPJ1phwIzexyFTAZ5ny0N/K7DC4mTlqVsYET4rArdluF2xXAD4S2wbl046EHg4/xyV13/oxt7ruZeMgy4wdLDqse0QXITsS7GUZIbPG+HAQgJ+4Mxkypsed+6mwGHk1uORQsoRor1bdCV0kXvWNGgpMnaHsPXkUPesYqet93CjraM04zA5XiLwTvwGUbOhqnefBdaa4oVhUmokkJqy/f0LxQIpNSo3XOSeOmBONyIFJXAXq9E+HHZetYZHohn4ZobSo1KV87ET6QsPYtxC4eNalepxrGljg/ittEe3xM14EHEgzUUlk62GjFYIZEIrpEG5TTJSU7yRLoBAM/RMywj8MwYBcEyX1g01ITSwwaDGmgtjOMSpNaKwGmYFm2MDsysh5jNwKSZ245tZINkpdcQyMkbH2BlAygC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:01:26.2143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea36fbe1-539d-468f-5eda-08de7ddbf911
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6345
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 13:01:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17289

The 'pcitest' application is obsolete on the 6.18 kernel. Instead, the
'pci_endpoint' selftest is introduced to test functionalities for PCIe
in endpoint mode of operation.

This patch series updates the build for PCIe endpoint testing application.

Aksh Garg (2):
  ti-test: Remove the pcitest application
  kernel-selftest: Add the pci_endpoint selftest application

 .../packagegroup-arago-bootstrap.bb            |  1 -
 .../recipes-core/packagegroups/ti-test.bb      |  1 -
 .../kernel-selftest/kernel-selftest-ti.inc     |  1 +
 .../recipes-kernel/pcitest/pcitest_5.10.bb     | 18 ------------------
 4 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100644 meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb

--=20
2.34.1


