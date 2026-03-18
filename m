Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1EFFCD0DC
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:30:28 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9238.1773822623913863548
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 01:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=viHt2gHc;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.64, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdomOmvyhfUWiOQjPCM5hLnEu/pUQw/C1TDeSFpjY+0GsBehD0SEkAuYLVSHHBZY5b8jEQgWTL7H6NlNcc5bbGtIt0CLBC92TrBnbNEyAbc2ZnnGxd+D03//GqWV/cODqZIuiJw9uG6gcrFgxrvWqfzk5NVahxHF5xU+08QOfuAIU2Od+1aDeXdqYKGiXnC6+Y3D1YB90YYAsfCOJ0l90dClygmNq9i+c9LMjppOIT5HDNJJQvhaSBSdIOEF+/bN4TzEyKdL4VyP3Q7sLrRdmTWznSU9J/DrtCenPur/yEFXSXDTq6Q0VO7ahno1CgLXg/MQWLlp96Pk5dZyMO3v+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6npT+QYgowl8lMRo58jrPfz0dcjEmz5gkbKZJHzhvRo=;
 b=QcHAjVfF1fowbb1IWpAGxCnNSJrqHG6zD0RXsjpA0iNQikXOKQPLf0hfo49hDLd/KR6qS70E5gMR4qOZ7j1bkMXfhn/4ltsODSY9tp730q0aVpnYDRZ0zNtaNLuE2JwT0blQohXIRuqwwPIP1tVpRDLkmxOHuYB18GXkmTwmB9sx8yLRZfLD37/CHeZKFzd76n7uqblK+u11OJoBEFon7zJfNA0f3OECFczFwCiq8sBWacwmGsv0oFBN+q0GIa2sKw2FveZ1AYZcG8m8RBslnYxXFqQdDQr+BDFydHv9dNxiYNdkb3i+9zwspmyziyGkR4HqPP8lFEQs6uOcrARJ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6npT+QYgowl8lMRo58jrPfz0dcjEmz5gkbKZJHzhvRo=;
 b=viHt2gHchxPUbvvA3p/6Z3rkdkCe4ZtRYZdkR/lwB9xfMspewc6qqSSbl8L0gaAQy18TJ5R4NItA2LZ3dfjd3MTVV0FdcKIeiG8Bk9artRVOKtTzCBvLPiqvNzixrgmhRFHvMUBQJA99GoqSMxfYErnyizVK/JvTRj2CoABFwGo=
Received: from BL0PR0102CA0006.prod.exchangelabs.com (2603:10b6:207:18::19) by
 SA1PR10MB7789.namprd10.prod.outlook.com (2603:10b6:806:3ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 08:30:21 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:207:18:cafe::9a) by BL0PR0102CA0006.outlook.office365.com
 (2603:10b6:207:18::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 08:30:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Wed, 18 Mar 2026 08:30:20 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 03:30:20 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 03:30:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 03:30:20 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62I8UH1U025981;
	Wed, 18 Mar 2026 03:30:18 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v5 0/2] nnstreamer: Fix buildpaths QA error and establish test dependencies
Date: Wed, 18 Mar 2026 14:00:13 +0530
Message-ID: <20260318083015.2295406-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|SA1PR10MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 33184a42-dcfd-44e6-8904-08de84c897e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	MI+328DIH5PxfyGo/WrCURVagcpQXRcqhVMkDjDkttT3oNwKKS1euLDT6xNXbTWHYBrBN5E4md6xj/Kq7dzVxETfmc+D44xL8Qm4nJujPpz+kLbjATtw3hjcdh5jZABH9gnQlGIXACLZpQu8jwMJF2QZnwmZzzQ8uGIXXYWOaZz7NlEemdOVkVfv/3c4pzeKsPunFzRK5zQgGkH/RduUjZB3+5DxQ4AI04iefxjZmAyJeuoQNusOP8m1jWT2JFBUjJslKWkL5/SuhVNh31lEbRfa/ceQu0BHokY7Iu4Tr/iymuqKzl4/ZzdkifQ2UxrcrBjGcTR2GNIhn9reizjuORiBTNREGxUt9nflP+5lMS+2qbkxn48/cz7f7pTvKbaw/owX4LeoOLkddQm6ZrQfwMnoAGt7et9Tf0PI+AuTDxkcsVnJKZu35LfdMwV+LKxkUHSna1aP49v/3KTg9aOwX/88+UVre7tuDoNJIw09lEkDodmQtwuUeTZ/L3OmAu4RFqZJfcq2B9uuQUdAJvvB6r2RIUAq5KwweN6ZEOfB0EZXZDDA7lD3mezrq9Vn1nVfd79ms4QNDlO8hEvVu4bnfWDqdel/SPbUY4d1hoGpljtyQMFnHDfyDETVDxeCSklOSw18pWq5itKbUQYIoeAkLYSy5TDSH3XMM/J1N5la03MXGG3KOxKNE2dVXo4VabilRJpPLTwnlErSe0cBXA/AaE/waO57SCYGikIvHP/ZqVk=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	E9EmNwQKT8aKkqbcd9QDDPUdHnc6M7p/VF19kG81yxDRcW7pBqr1VORqyu6xj3vuS10F/i+ZtZxAgf9/2X3BJaz6/PdTC7r6sQPwwh0hf9dYxZNfHrYUrJ2zmnti4HYwWyOcOorooLZ33CWiYTL1hJa4+JVoK04pL3MtmtB7wOcB/mBGW8s6hnkrL+tuvqKyCglEAmJB8NOnHQJBltp3QezreoJokKSNMapN1GqrtAqUJc3uZTm68UrdC+tuXEWkx3mTHfoNYyN2yhg9ieVfn2jSB/tiF9og5sRrrKqCkqBqd8K5pXAHFIfwZrK4wFPpRp7YUu85NYo5klOwA3MochucZ1Q7itxw2RS22ujKwgpi6yyrPUIPGa/yHeyK2WUT2JKh8LBbheqCzu3V+IEZI1Inn00hmu0FjZ64gGw4Ano8NFRMwKPvVvy39sogk6gN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:30:20.8491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33184a42-dcfd-44e6-8904-08de84c897e0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7789
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Mar 2026 08:30:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17395

This patch series addresses two issues in the nnstreamer recipe:

1. Adds buildpaths QA compliance patch to replace absolute build paths
with relative paths in generated unittest files, preventing Yocto
contains reference to TMPDIR [buildpaths]" errors
                                                                           =
                                                                           =
                                                         =20
2. Missing runtime dependency relationship between nnstreamer-tests and
the main nnstreamer package, which could lead to test package installation
without required core components.

Link to v4:
 - https://patchwork.yoctoproject.org/project/arago/patch/20260316092648.13=
77711-2-p-deshmukh@ti.com/

Link to v3:
 - https://patchwork.yoctoproject.org/project/arago/patch/20260312130928.88=
9341-2-p-deshmukh@ti.com/

Link to v2:
 - https://patchwork.yoctoproject.org/project/arago/patch/20260309061254.39=
42533-2-p-deshmukh@ti.com/

Link to v1:
 - https://patchwork.yoctoproject.org/project/arago/patch/20260309053346.38=
27889-2-p-deshmukh@ti.com/
                                                                           =
                                                                           =
                                                            =20

Pratham Deshmukh (2):
  nnstreamer: fix buildpaths QA issues
  nnstreamer: Add runtime dependency from tests to main package

 ...ute-build-paths-from-generated-test-.patch | 42 +++++++++++++++++++
 .../nnstreamer/nnstreamer_2.6.0.bb            |  9 +++-
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/nnstreamer/nnstrea=
mer/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch

--=20
2.34.1


