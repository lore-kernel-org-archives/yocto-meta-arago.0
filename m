Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2F0109C02D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:51:08 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24126.1774450261703132070
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 07:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=urRUGsDZ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.39, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gj6I2IbIHC9UDINH0Y82mIBxiZCUtHsR2pTOcV9potN1uc+0DiRQEFuZFoZmay9ErxdVVbPhrzdViNekd7xW8M/mcYEoZVZM3jCqCyeroh3JXdA1nl1aJ+ST3d3909A9o/KFl0rH1NoT0Ar6U0N0WKo2a4/bsK756SgmSvELZElyQhFemn0wB4GFJMs9fEqTyCOa8LcYZcaPcbbumyPRwNALxvIJn9h28Sr/oe2NGYe4f2FGw6npdIda5Pd4oEuu8jMxZ8n8p+VltSn9mg60Esbl+ypAwA6CVhI/VdZ6xvkDUDuCS7GUY5BpqOKbn73XBvGL4dsyyYKZtiW2dtKRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSnQ0pWXWCHigkSWTyqVNBafq+sl7JjxtLw0Nv6VqIA=;
 b=PhZ57kVRxRs0wkYaaVnh6pQqE4BxT/c0P1ngVvHOqwpmePdrVjNYjd8qv2YSg7bGGxatH1WVFRA+SIAINPqrSt44qM2dJghMjDpTboH3u5wNRFyQWWbvFDm5gI0NuBbSXjBz/l2L2Nw1DlNuIfxWMELfgkp/iH1ewr6pBZ6B6dYJbhoKoJNg+Ni4YHefSk723aTy53S7YJUoXmIuCceX23Yr5Z/CcEDXJRIQt9sirFfpyy31tU+fga3TXidykGzKZEnoMmwvTXEjGEjKrqDUW8OxkYSEchMEy/5Aa0jHwCMOFlOFDKkBzg3PvLKLY+/PqzziQWsDlbNvyhID079DMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSnQ0pWXWCHigkSWTyqVNBafq+sl7JjxtLw0Nv6VqIA=;
 b=urRUGsDZdZS3eR3nhXh3C3i9unAxY8UlkAWuXAzuUaZdXIKziPZWzxr27hzuBfhVv8rQErGmsZE4ovB/KPmhiaPaoMhG1w599k/ipOWRW7AZRIUf2WYssO7df8SWOwTuoV3Y2eOJ95S/CqLklkv1pbcdRLSgj0D4lEUj2kdYnXs=
Received: from BL0PR05CA0014.namprd05.prod.outlook.com (2603:10b6:208:91::24)
 by MN2PR10MB4334.namprd10.prod.outlook.com (2603:10b6:208:1d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 14:50:59 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::80) by BL0PR05CA0014.outlook.office365.com
 (2603:10b6:208:91::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Wed,
 25 Mar 2026 14:50:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 14:50:59 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 09:50:54 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 09:50:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 09:50:54 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62PEopPR470987;
	Wed, 25 Mar 2026 09:50:52 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH  0/3] ARMv7 support across ML frameworks
Date: Wed, 25 Mar 2026 20:20:47 +0530
Message-ID: <20260325145050.1053445-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|MN2PR10MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b3f00e-2951-412d-d3a9-08de8a7ded9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Rvu/K0EdDR92PN0wvkQRbFsxotiL92jixhvXuvJz7BWpkcTKkODPjPorvejdE+x9Xd0GScp46AKar8n+L2wCBzh+OF3vVycB0ia9PRXbBRA5b4EjQ940RrJneAsm1aX8aJVqPDDdzrcKG8loFreMdumWF/24AjCfQwIDoj2RG8qT6XNs0L6VtPWdF0Bq49iHnTBLK9r/YWMxbe/VhrUdTFX+BTduQcA0ggPaKD1lHHScl263xv7/4mZxr48hUh+vB3OJPhU1HNXQ45UbUcMz79MY8a+vqgW2PqSGc0oPIo0IoFqQAp4pthAmkywN5zU8hY8R1YyUJLhSHAqd+kQr5HHVuFxww9d4gMRESWFMPeWR1C/MnAdRncYDlNs9jIyMQ9hw0f28KIEMyVPjn6L+e6iaSJXb81VEGRW4NbeoUapVMs3BCJVUuvd9z7BcofrqFKL+b1np++7Bq07keKbcGccIdHMSbKnwrk6JTekEz3SotyCSy8gPPo4NlS56yntNmruXteeJUJU9P/ejhVdXvtJxlFUMzAJYk5TicoBmh8po9hmhu8OC2QZWstlcbuYm0lgXOJeoL8OZm+6hep9EqG0D3Na7gS0KfZJpsBBtJups4DOshmc/MQlP/FaAsNyUc/uHmDXGfNZOY8o1yeF76eoklz0WuCXAAFhua90Ih/nEb8RLQFmFLBrIFPxczwF5Xzg539JdjKSbAyiX4ftZ/Ie+GtY6aHMQkPZWMv9gJy1FWfTQGtYwBGjU+QL5+3agxJ+qlce6exNzzGJWHfr+jRoIfqZELUk+S7AVjOewkJo=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CrWfqEayU+xSQFHjt6c6j6nHar3Y0ca1I/mVCK6gII1YD6PDdMOU04BWFPdvMtsWOzgNNLdbjF05d5tWd+hfxmMAkEvByAInhyzPVz4JrbPeBj5c0efwZ/ulP5avOk0JS4OlEwG10zrAv/WmHJW6mEWu+UdF1dqaMZKyISdp5WiE6dvn2gBS/eUCsheydNmXNYyIHUGpTSrvPuspXRETfnqu7F11BgOgcYp0uC0hvMDZwnfR6r+GqZ4T0GSTh8fm75YoLHUfw3ApLaF06Bi52sgw6YhANMvIQiAt/G1NzRgOxXyzBwo3K9kFByWesq8xYsEEhG0D2mquD3ygeZ1iU9HlXFQCMZ164qQtlhYp+Sp06Qj/1X2wff+YT+d/qZxkhl+ekmswAoNvwLJTICiS8avNEXyNL+qNZo5cfBdKQzdWOHmQ3k/xHJMtajCWNC5o
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:50:59.4017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b3f00e-2951-412d-d3a9-08de8a7ded9b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4334
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Mar 2026 14:51:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17433

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

Pratham Deshmukh (3):
  tensorflow-lite: Add armv7 support with fp16 optimizations for v2.20.0
  onnx: fix 32-bit ARM build failure due to LONG_BIT mismatch
  arm-compute-library: Add patch to exclude AARCH64-specific KleiDiAI
    kernels from armv7 builds

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


