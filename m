Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D596F55128
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:27:08 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46571.1773653218031720763
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 02:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=k7jDa5de;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.29, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujkMFNPOcYclFphz6CNsiZjb/M0xqGZZLHrFjcQDEAa6HsZOLK89kE+XD3clTNY/TiIIbBfOqv62f/bOf7163gae8kgfouXZlwwshi0mupO/sey2ME/viUna0k0g8H2X62rb1D0A2Mj49Vkk1xcmlkRfSoREBSDfQ2shU+Dh6UjH4GpFAz4Z/CuoIqZRGgh8sdOc4vIQEJxjrXLKYVpEr9vb+tuc3yHempri3YfQ5YJq7z869X4i2WoAec65whBPxZ4603hJn/njBxD5DA4d+1x5pQ/GJquD7fQWDJs8uaOa9Vtb/b3gljJXy3x6FaBxWqvhCbWINbIYadAErFKReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGY7pxFMT/HWrIHA3nT2G4hG15BbtyG8bmwfX0+wK1s=;
 b=V1+hbddS6Z97/5XULwL9KWzNgKUlovyyd41JMIvpb/j3ldNoKHyoiZn+YLFboBe7HuLiEKMrqiNLK1nsKjDL71M6kfzICEmZLg4iOUR+PxbaAVIzcwEVM2ohcUHm7jIf/BQa0u7tsfHd6rtCQ8QJbTYnZgmLDGWkFRQC6x8Xtp0kK4fUWEvUM6nG/5QFz7yi8bKP9UHY9DS6Jp52gveGsufl7YI4kyFI5/C+1/r0K2Wusa7hoa/rKmuD/KqS8DTdlfOzBHPvsxN8+W1TmMZ5DaToq/qlbmsWppZEb9pQFybvaUB0CmOPKhld9IHPV7h6mrx67Joh78UC0rWVULu0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGY7pxFMT/HWrIHA3nT2G4hG15BbtyG8bmwfX0+wK1s=;
 b=k7jDa5detiqhjP63kPBShh2pFZaO56aaHFrjOkua0cACYSw8eKbkVs5e/GJq6hl255dGEe5Z053LxgG+DMAoVNzWPbsvkFYlL2fGoH4vPkVarHtNhF2+TiyqIpEEhm3numVF6mTOi3BO85zSBaaW/xt3Js9wC5GsikUE1HXYT2M=
Received: from MW4PR04CA0101.namprd04.prod.outlook.com (2603:10b6:303:83::16)
 by DS0PR10MB7902.namprd10.prod.outlook.com (2603:10b6:8:1aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 09:26:54 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::f0) by MW4PR04CA0101.outlook.office365.com
 (2603:10b6:303:83::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.21 via Frontend Transport; Mon,
 16 Mar 2026 09:26:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 09:26:53 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 04:26:52 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 04:26:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 04:26:52 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62G9QnPV553169;
	Mon, 16 Mar 2026 04:26:50 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v4 0/1] nnstreamer: Fix packaging and buildpaths issues
Date: Mon, 16 Mar 2026 14:56:47 +0530
Message-ID: <20260316092648.1377711-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|DS0PR10MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b49aa7-3bc7-43c8-959d-08de833e291a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	LuANDYhGda8jkIOl7kXVwwi3vBhBlnxqmVOBEoAGlD2wDoTxy0MguJzwsVh2XCZkCBInD8x8M2yYoztYWOHMhlrOOnBKY02gogcXqxX0h2BjkhRKmxPIqgNaioTzeuHLLZBrmOFbUh+7uX5M5PA7m+B7BhkgFEbwObMMerpAlxS5CgsWi0ItFzIPh9ODfLt9r2vQWwufctu2+TmWqwLfbrCWjezEWaLWG6+2S8v5451EFy0VM7Nk4uqw8JlAClMLImyq/tWH/993mInFBdLxslaDPyywCLS7JRn5P191+2SYv77b0biGuL9/1u+34p03lVUHiWYpoE8Ays7Cj8OP96RR5p7It8+JaW1ZE7j+Ou1wdLyIkD/0ddUtFf9JaRGqv2qNEGw+mQK5QoG4foIkw6wIJbMCXLfoSSrsO1wQfaOL14xW1vPqGodv8OpgbI0eqUweUwmveeQEU+TJRETQ/S+qMwmOlz4HOQdflXmRLnpatkoE3Pc7c68lr3FBmwDwvOW/RM453z9XubxCrOWVu9Nw5EbLF8G1Xdhoft7GNd7XKyZGn9nNGoNXDluU9Pp7Asah77laGTgSo04/U2LZT3/OVFB7iH4yfoYyhgb5S1f6cjTpdsq6vwgBtuPm5euQz42tetO7Nq8pD+53da8adg4VoMKnETEraooYlAmTZ/BiTUcY4uYfJ+2K3pNpHMUCaG/Vyh8gAmZwox9EWVdSPgp6LXajDRVoA3daWiZxIKI=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	M9jCU+O7Vu399nIdQy4CQrtLZkaw/uRz4e8SIupQnIWNi4rqmF69t5T44seQzaGVbHe8aPt7Cox39m9NySmmMtuDgj3IzBrAUNAQNE+tClacbDd1vL4W0rXPVsaJPV9UY7tkby3tBx3yLDPAapZ3QN+axuLMQmwMf5szyoaMpL4dwJPjNTDvWTZVG/NWc7c3XfYSOeoamHEnfxXvw4XGXwpODf20faGhRNFqIQze7vhTgoGal1dzrBboxNQFMUeihMqvhggMSH45WPzFanV8syjbFzpUW7zAqK6IbfsA4pVO1GhJHbldumlMcNBRT/nPC64RqksbNt2LIhYMrrf+KiWf1476n8VrmaleIwxGEQxERz+9XtN+teU5KrO3tjiq/L7eYAfMhLZmOcb69k9imD2q0w0GqMWb/heuMVFBnzbNetNklXqnVxJJ4Wpqsdzm
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:26:53.2759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b49aa7-3bc7-43c8-959d-08de833e291a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7902
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Mar 2026 09:27:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17345

This patch series addresses two issues in the nnstreamer recipe:

1. Missing unittest_filter_onnxruntime benchmark utility when only
the main nnstreamer package is installed, preventing ONNX Runtime
performance testing.

2. Adds buildpaths QA compliance patch to replace absolute build paths
with relative paths in generated unittest files, preventing Yocto
contains reference to TMPDIR [buildpaths]" errors

Link to v3:
 - https://patchwork.yoctoproject.org/project/arago/patch/20260312130928.88=
9341-2-p-deshmukh@ti.com/

Link to v2:
 - https://patchwork.yoctoproject.org/project/arago/patch/20260309061254.39=
42533-2-p-deshmukh@ti.com/

Link to v1:
 - https://patchwork.yoctoproject.org/project/arago/patch/20260309053346.38=
27889-2-p-deshmukh@ti.com/

Pratham Deshmukh (1):
  nnstreamer: Add test package dependency and fix buildpaths QA issues

 ...ute-build-paths-from-generated-test-.patch | 42 +++++++++++++++++++
 .../nnstreamer/nnstreamer_2.6.0.bb            |  9 +++-
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/nnstreamer/nnstrea=
mer/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch

--=20
2.34.1


