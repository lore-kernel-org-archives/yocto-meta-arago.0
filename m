Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E359106F2FB
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 08:12:10 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43219.1774512719814705113
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 01:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=wl7RTrTA;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.5, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nq+kcb6dg9gehH0N1raYwqH+ATJkI37H6U9UfusLk9ME3Bo9ksA+pTuK5Y/r8BRgG6sXBVRBq/cWWosR68ZK+ptFILWEROl0ieSSKXzyyYeV+JFBhEd70noPgIKOf9wZkqOBMXFcjoqCj+EYV1pDUHXCUB8og7k5DYpEOmYD+y6+Fbf8ulJ9RfSoXSfmS5qOyjoTqpo+Cmh52QKmbQYgxoWUHshH9cv/58hC0GU5Nftw7UTjkG4Krn6QWKcfUTFjto1jT50aTUDUGFHnGDsBexywVE4QSuMJ9J8/tYAMhDsPwv8jNSUlpI1TwyLKo1GP2liO2QkwVJkCg6sOEbpWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92ipFIocWvQJH+zM1mOxpBqEEHUa1+l+W2mB2WoGl2o=;
 b=n6Cn63GtGAqtSeL3Eg8IE7qhKY5pBQk2dCCFotC4RFlE9G32kVPz5UBcdwHQQoqPzEGQS9J0IDuZJ11fZiNlaitmikiCgIhPZTxg73pT5vFnTOaHsr1PdEh1UMyf2PdOBOR6sbdntR+fH4R70+wFs0rQ5eIx33FE/KdA9stFfV0ZRFNUslXix/wqKb9ZGd+TwodV8WnzLngmfRumaAhlVxBXq5B55JqL7zg6vWcGFqlyMarlb7ue+aaw0OmAnBsdLb0iweaFW5roWx+WNLJ+nR7uK8/bfyQfLba5GioR9z6NxlvdN4/YwD0RGnaP6b2wpFJU2+XEg/VexBwFO3qwzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92ipFIocWvQJH+zM1mOxpBqEEHUa1+l+W2mB2WoGl2o=;
 b=wl7RTrTA8Ib6je3Q3G0jr1G6oBrP8eGQ32YXSu9Wf/jXNqXdWlwcJtJIVGDOFU1+q9LkfbY1R4oouHG+mzR9lp28IBqvR35uZd9AaSb/7NY24WYA0cTGFS7ZXyyUU+avgBeijtBf1u/XqI9n9w19tPgSkxwLgaf6wsW9MIlTQmw=
Received: from BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48) by
 IA1PR10MB6193.namprd10.prod.outlook.com (2603:10b6:208:3a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 08:11:57 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::e7) by BYAPR01CA0071.outlook.office365.com
 (2603:10b6:a03:94::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 08:11:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 08:11:55 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:11:55 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:11:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 03:11:55 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q8BqKG1796058;
	Thu, 26 Mar 2026 03:11:52 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v3 0/3] ARMv7 support across ML frameworks
Date: Thu, 26 Mar 2026 13:41:48 +0530
Message-ID: <20260326081151.1214749-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|IA1PR10MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 628745ed-4efc-4186-1ef4-08de8b0f589d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	xV65w7T7pQzOaKE+bbYY11jiBn4ok+2gZ1yS7hG0a/GGsPhyxvM3S4aVKg8CncmMzoqgSvtpcpiFFEV5nD4dTzg/TZDm1ltSVJ7pQYAcOIB2WFhHx1M5ERApTGOXq+TnCA+JgRWVuCZ8zRBFl5chO6OGpK+KJHOIW61q5e0EuqJwDzttBydtoFg0RHp1daAqetma29POLSaR+QTyMo/h/5e6lws1ebwHq8qoP82HVAG9bHeMky89zpXv9YhN7zOt5lK8WXy2Ss+SqOZ2m7DOFC4dVkd5Cm3fKopCiHB/dYd07kXzkcDkw9AxjlVFH0Q8r3JRNFEn0Q1umSY7GtIwgSVpEnG0K71W9YONDZnHBWzy/fVWkFOg40ogCkf9/e42e01tRfww0bmBGOHuOG6DyvXhE2OPFkx2DnyPPVb8K8qeIZcUU9qnYQnmE2Y8EdtbgMt2zdCrlOeyOgkzdYq3JwQ0H4d7EI1JsJ337r3hW5boG/l6zvrpT0m/W9Yr8ry8i/25qWDEsrIG7qfrnveFYQyRnlj/4DvqcLB7Lcaegf5V3ek9p5ux6MrPHS8kXjj1zVd5WfJxEMPIACVuH/sGcCqRDzFBdnm/Q7Dxi8pqu4FXvpBxWOPSxfjavjfcqidtpBwFlRqdypIWi1V1/ipnJUvZDukfNi3BLSPgHG/agMmuK3tC2/ZrOxfcjLcSgdxB07ct7DexiMdJI1FNPJiHixiD+5Wd9xNPUO2Yt/RDinv4ryz9OGMDkKhWHxIgEwWho5s8WtYQy8Y62Bdgt7rREkINCy4LifkFzXcIYXoQYoE=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	c/vLhjrS2GCckF2ZCa7X3CVGa+AaDTr9o50Hp2bPVZEfH+d6ZrGuHRl+jgoVOoExlfml0TJOHAxGlk7PKJ4JEKvNkPOo4fsnLkWUbUZnGRLlajN+1OCAajCdMMvucHnFccvjbnVIakoQ9KK4e9VDQLihreAU3G1HBr88caIWIXEgzj8GIxslCFgZM/4QwwARimx+2MM9xjUevZkinnj+p9XNR7ad3OJqHZtJoxN/7gIQfNK0E6QbfcVqLV2z1RGb9KcJOTbbgzG0HBGhL5Xu0XHrxTpklCeGxuR3QcrTyHevLsSJHhPJWKyoGPhgREvg7Et251EneUx8g0FpvNknwngcZIQuWnXNnq6CN8zdDeje48hsq8rskIHhqefDoHh2QbeS6UWeHMVlgb0SPSt+Dooj2BcR/uUTq6xpThBQUR5kw9l0BwVrhUpRc6qI9z7i
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:11:55.9359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 628745ed-4efc-4186-1ef4-08de8b0f589d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6193
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Mar 2026 08:12:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17446

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

Link to v2:
 - https://patchwork.yoctoproject.org/project/arago/list/?series=3D44961

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


