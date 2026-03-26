Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84DF109C047
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 07:27:09 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42204.1774510022913195221
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 00:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CSpb3jub;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.71, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKKAwvF/0KaJMteQdNI/S1nNXjF+qM0/iALGoT3pZ7NFySUQ17vnJpSvNfRZp4ZgqwJOAOw7lTBdvE9RzgQ3PlU1flEyp4I9+oJ/AYhjIN1IIuoKeMQf1yCQ1+XyXBYLY/ZH3Bva9vLbvQXfccXrPCM5008voQSql4RLcewndiQpb6eAvjedHPyDVPcu1FDg2ULK/4XeTJuDPcTFzJQLIzAkkYbn8Op/YQftc3JDT8+ogKButaWE2XRxZIj4X1dSJBz9QD3pXL5Vr0cQ6mKNAz7RNRXc06h2Fxpi1g7DGDXTv74jMvud/Ujc4gk3O2ALBjRchCdd5WmSYPK6vFDNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KzffI2jo8TtNQ2zhy45AKRSmm7QjUO0TCrOSUyUCIU=;
 b=SFhVI489hW/0Eo4CIVrj11uLY2i/c+sWk/VqIUKxi0Ql/B30/qIrTlvkY1bggvladffYYYP2e4IfdfJ2oUQG4nEaRCDsSf9WtaWDDs4glwKfebQJ+O11PyMaRH9DnfEThzK3yCBrf99L6kSQwEpQ8cV53e7+9EW+IPVfkKQ4gacGhDX8ZlUWbH+ozIjoCOm1OX5a1q/27leKsFJUj1h5xGHlGrSpHgv7d9qojCwIThcrHqSeO1GB6hR/oxNkkAM89x79ad7tYyAbLVXqx4VBuk2ycIZrrAANJGpy61APLbsSpxyNrExdllwYGHoov6tlnCjltvBpcSqiWK6OCX0NPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KzffI2jo8TtNQ2zhy45AKRSmm7QjUO0TCrOSUyUCIU=;
 b=CSpb3jubA9/MgTxeWznm267z5ziH+EVZmNvOQSFU6NAWXXrJUadFNKiRz2juAV94F/V/TYzwa6CluT6fcaiGIdynrzWshogu/iG3dfDnecI3qUBBDeAXXROtzd6e/dui85pyDW5x0DeMD4A9fTr3iaOfpLze3SJDNF4/LlqKCHM=
Received: from MN0PR04CA0012.namprd04.prod.outlook.com (2603:10b6:208:52d::31)
 by BL3PR10MB6210.namprd10.prod.outlook.com (2603:10b6:208:3be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:26:59 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:52d:cafe::f8) by MN0PR04CA0012.outlook.office365.com
 (2603:10b6:208:52d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Thu,
 26 Mar 2026 07:26:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 07:26:59 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:26:57 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:26:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 02:26:57 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q7Qsxb1733061;
	Thu, 26 Mar 2026 02:26:55 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v2 0/3] ARMv7 support across ML frameworks
Date: Thu, 26 Mar 2026 12:56:50 +0530
Message-ID: <20260326072653.1025506-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|BL3PR10MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ff2272-5b20-48d3-b3c5-08de8b09116d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	fZK9me0iyL7E7naTjCfvYxe8s7LSMK+0X8YczIpxFrsapVCS+zBBPwHhBV4k4CK3R4rZLieiiPmEgOJ8ctt5VeVOFbfRWdKkXwqnQpEJ2A+GJgex+dGjb4YVfwkz8mFv0FEsBJIK4f0VhMHQliTM6j7DWLua4hOAeiPrnKVxhsxqmT8ddjC2VsIIANiDP9AjqXzJ6KLR9vV9bstRSMhQ51ikbMz7kEwChrerxiLX1y/QPEpVcRtXF1wLeNhML1AKAaVKJ25USIkZCsct0n5cWdpwOHV44E33aKHCa/kWFRzXw40P6u+Tg2SeKTq/cIJA+sVH+NJDlQq0jlW37XTYtNei/jIQJHnXIMvlwwygE3hs0XYuzNnMVBXtX8yivErnOd2Ws9qtfpnZGK3CAvmfLXrTmsBEdIc4aaX4wX7VkXJjq6AO/187H2sb1rvEKK9TzjUciZ2Wj2lOrm9m3aU6xjKNqOiUg8oybMdTtoh73LUKCNOh5YUyImqlTnMzEl4Yzf26ss0feCdRo57QPTJAt/jaMaKMRL+jVfuQThjbOaA+uXOSBmp7yeQ8p9E39NXBgE2SfnLKmX4FMvApE/oG/IWSJYR90FoKUUV7lbr0wJXN/hh9DgwpM9kfNJF+Az4GTrSXearVQwb/PDCX1kikOpFBsOSs1j/ZSJPujaVMakqK04InHKVIvD+wLZqibee4DTebsB4zuLIVh8ChWEatWEnK8yxI30XlailIZnC94J64Cs2x0nstTcjrN+igAUSyEx6QkftRMumBI3/oyI3nmPefmhxpV+BJ7Mj7pxLfmFw=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hnxXVWRTQP1tbIzx6HqOTkfOoYQSMqmOxdNx6zsJsHc+pUL1GqkXtL5fZdtcaIYuzpETXRSnijTM2muhwf9uNyVQHB2Mnp15PZVo1vYaDmlCFaWKDjPtBt9AETW5gDWDagIqSBLkatuJ0FRZvKPFCm15p7lEo81bxQNAuoKOKM60zQ4etR9fUFx+xYXmjjhHLIpYq84Ix02zUpAlyttRi1E2g7EUFHEdmOPpp9BjStLb0deWad0gHZXnTI5SmUFA19PNYSSWRzCHrPp969FwDIqtYDjwwPPh4XAJUtCozV17U5bxkdggGz9hqX+2n1BUwNRVgi76l1bNRMOVcBcn9MpUmihxkvdejSuXLpOkC8lYH3H5GzunxbW5BkaD9a6cO8bIP19vvaE6tsC902HEOrKlZ9QFplzhdr0lGgoXJNUcyDiqlIrXqU3NI83O6Ogw
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:26:59.5420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ff2272-5b20-48d3-b3c5-08de8b09116d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6210
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Mar 2026 07:27:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17439

This patch series provides ARMv7 compatibility across the GP AI stacks
in meta-arago by addressing architecture-specific build issues.

Changes include:
 - tensorflow-lite: Add ARMv7 support with fp16 optimizations for v2.20.0,
   including XNNPACK delegate fixes and EMBEDDING_LOOKUP kernel enhancement=
s
 - onnx: Fix 32-bit ARM build failure caused by LONG_BIT mismatch
 - arm-compute-library: Exclude AARCH64-specific KleiDiAI kernels from
   ARMv7 builds to prevent compilation errors
 - onnxruntime: NA
 - nnstreamer: NA

Benchmarking results on am335x-evm:

 - TFLite
   - XNNPACK ON=20
     - https://gist.github.com/PrathamTI/2cce31defc047515d3bb205b86ec954d
   - XNNPACK OFF
     - https://gist.github.com/PrathamTI/734ea8c0aa8b4fb57125cc5a7e032c00
=20
 - arm-compute-library
   - https://gist.github.com/PrathamTI/fd78e2e8b259e88e33c4efb926aafbad
=20
 - nnstreamer=20
   - https://gist.github.com/PrathamTI/46529497cf4b3852619f5f3bf84908a7

 - onnxruntime=20
   - https://gist.github.com/PrathamTI/1e7150592d8e1fc6b167548ea62f0904

Link to v1:
 - https://patchwork.yoctoproject.org/project/arago/list/?series=3D44947

Pratham Deshmukh (3):
  tensorflow-lite: Add armv7 support with fp16 optimizations for v2.20.0
  onnx: fix 32-bit ARM build failure due to LONG_BIT mismatch
  arm-compute-library: Exclude AARCH64 KleiDiAI kernels from armv7

 ...RCH64-specific-KleiDiAI-kernels-from.patch |  37 ++
 .../arm-compute-library_52.7.0.bb             |   1 +
 .../recipes-framework/onnx/onnx_1.18.0.bb     |   2 +-
 ...delegate-target-operations-for-armv7.patch |  38 ++
 ...pe-infrastructure-to-TensorFlow-Lite.patch | 552 ++++++++++++++++++
 ...6-support-to-EMBEDDING_LOOKUP-kernel.patch | 447 ++++++++++++++
 .../tensorflow-lite/tensorflow-lite_2.20.0.bb |   3 +
 7 files changed, 1079 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0009-cmake-Exclude-AARCH64-specific-KleiDiAI-kernels-fr=
om.patch
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/ten=
sorflow-lite/0004-Disable-xnnpack-delegate-target-operations-for-armv7.patc=
h
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/ten=
sorflow-lite/0005-Add-fp16-data-type-infrastructure-to-TensorFlow-Lite.patc=
h
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/ten=
sorflow-lite/0006-Add-float16-support-to-EMBEDDING_LOOKUP-kernel.patch

--=20
2.34.1


