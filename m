Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027AE109C030
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:51:17 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24130.1774450268430395571
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 07:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Dg5DHerx;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.35, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPBuMYzwywQPoma2jBs/8vxmuhSNyb8i7GOc5DF9KIu034gkBBuRGtENB+J/lTNaYJh/NQLY+yFLC8hyIJI9X7S0uS5i1gMAfjNZ5DABwa7MMj2SEeaPYGu7ZKqU9FIyd4AbNajHdViz/RsPzDKQoYXAs8s5T2+Jeau7vgDehBq1+0QW7EdcA6B9nEhxxrAFu5BBaadnhzMnIZzFgU1pZe9won3OdxspFG2sxWyOsR10C1l/o//ag4cJrUNagwnBMCX94hFJIGlHpjaQaJ+dNyTxHOSzsJZSWlaeiW9Yyhol9DcuIlSwImGM8X6Velq1kUeAJOw9Tb4AS2vlG/6e5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXBVvkwzGNcwSiemdi65Ys/BH/jeImbBwnN58XRG3mQ=;
 b=rzt0ci39xBJ5UlxcoitNzJ73zDbo7xp0EmzGqlUsDFAf2Qy3Tjb3TOeIvUatr20hLkcEgvMSyGKw+rwZBqMz7Z8/2leU4UZ+GAPh43YMsoow2qqYWmzd1FYOee7ztP5WOxGyuE/rYca6h0Vh8SGiqy7qo+dj59rrnRWDRMoV4Soq+TxQpbw1s+8Sry5Kdk0irJZpUAfADEQBtwMQv3HR7LvUYaaLlzrGBW6du0KQQi27iclNxEvXhijO6oXcssalOtRKqq7n29A8ZuNnVUaiFBnioOisPd94S3EH70UBkX6ubJ87GPIR6VQkqWr7b7mk1xaM+GnqIIZbtNHNWTewng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXBVvkwzGNcwSiemdi65Ys/BH/jeImbBwnN58XRG3mQ=;
 b=Dg5DHerxY7bPw+u5UCzpO5zZpjzQN9uwpp+Z3fCFx9AfYcG/r+M94/7IIip7z/jlRjEAJEcVtisKUeYSISYuk+k3qgEVZRwWbKcypFfnrhuewfKl0Wdw9JwDbPjZIKPGPTAak/iUfaOkMvtbVWJvmtfg3sh5v9pquKrp8M6U/TU=
Received: from BN1PR13CA0002.namprd13.prod.outlook.com (2603:10b6:408:e2::7)
 by DS7PR10MB5183.namprd10.prod.outlook.com (2603:10b6:5:3a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 14:51:04 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::21) by BN1PR13CA0002.outlook.office365.com
 (2603:10b6:408:e2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Wed,
 25 Mar 2026 14:51:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 14:51:04 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 09:51:03 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 09:51:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 09:51:03 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62PEopPU470987;
	Wed, 25 Mar 2026 09:51:01 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH  3/3] arm-compute-library: Add patch to exclude AARCH64-specific KleiDiAI kernels from armv7 builds
Date: Wed, 25 Mar 2026 20:20:50 +0530
Message-ID: <20260325145050.1053445-4-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325145050.1053445-1-p-deshmukh@ti.com>
References: <20260325145050.1053445-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|DS7PR10MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b4f32d-e165-448a-b58a-08de8a7df09d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6OZqmFgfREWUb69uv211xR15kzVMqPbmDmtG+cg9NV546+7cwyt97tJqOALOdasrM7+yUaD4ghhrtknWIvWUfM4kSO/LjiTWis6RybdlH3rwBYJSCy6NnAp4fqApDbz5HOHwysrsIrieOp4P8CKH4XzmNjQT+Rt3AzQzvkbXz8uIofIjh/gn+QDDnxNlord75m7YZmes+vTOkDB1Hqw35x6PXV7Y9xBenS6cEp0wkd3XYIIvD65zWEYtaGDyjWw/qL5OJoHNeSn9BFPSfFkVAz3NOYIEenszpJ3T/UcN2gmiJkmNy5xkF6TCI9G02niWpM38QNBg/mlAJTB0d61e92M9pB/14HytkzBrMM3s4w3QPwZ16vFgmMAbdk1/Xqyj5+OYu77vjq3musvyB4/mXqSEIBMZX1iyIcQDuP8SBx2X6wO8CShJ4ChC4WVXomKTXP2hTWq8SSUPtfHH9q8ONWlUnCCPKrjN6M3MfGh2bvQhpOlIuXsYFGrmWtVPvY3wqawK24OzHwm+Rg2AmwBi3Flmuvei/gqVfzWqyuco4X1RKYa1hqwS/L3MUwQFRJQARU1xgbJ+DrtO3o84b0hJ077SZ00n+icqMatBN6DhA9yuL0qLsRLDTIgAxT6Qyid8Am6BTWFJQxSSVo72jeivG0ZqqOkJeev6zF/XJVrh85gVRHidlJ+88KJ43rEhXgVLE2UEnjn/99uFO/wXKcLGRvwKKp3HoPIC/miNhW4GR4Zb6cUIvIHA2xGbswA77TnHneTeKTHDLUvejahjAWTUEw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rSV8tWh7MfwBPw02ObdrArHiAFMCO04wnnr+IkHbh8T+uhOmljReyqQY6dvi26kM5Co8+q15ohx3cBLWQcsIyDmrSEkhP3bBmjjYD8GK3pL5u32L+83aNhWxWDeI+KigJO8PjrfkjAj+nr5FKhbl2iT60hONrup7hrrQxstWuvWKs59Qzc5uIgZURWPIoZETYyblJAKAloDRkcr1tltLIJ1JrE3+bBYbxtP4z0bGSRWZct6QPPFkPvhWJdIlkxwpHfXgNVwHC05DQ25oC9NZJCrQHtstOo67qfDCBLqpEvY3JdW2ckc3NVkWh4tig6XRrRWk4JVGrGEQTTN2JigvjZoERTzSz+kQRN5b6IguHKHFcs+9KpL2uISYwGIt9dnbfCRD1lTCVPmr6ldzEmq6b+Q5Yj52beXhMoZMtCAXse7OaCFnzplCAg0KkPXdd3OS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:51:04.4412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b4f32d-e165-448a-b58a-08de8a7df09d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5183
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Mar 2026 14:51:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17435

Prevent AARCH64-specific KleiDiAI kernels from being included
in armv7 builds, resolving build issues on 32-bit ARM platforms.

Added Patch:
 - 0009-cmake-Exclude-AARCH64-specific-KleiDiAI-kernels-from.patch

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
 ...RCH64-specific-KleiDiAI-kernels-from.patch | 37 +++++++++++++++++++
 .../arm-compute-library_52.7.0.bb             |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0009-cmake-Exclude-AARCH64-specific-KleiDiAI-kernels-fr=
om.patch

diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0009-cmake-Exclude-AARCH64-specific-KleiDiAI-kernels-from.patc=
h b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libr=
ary/0009-cmake-Exclude-AARCH64-specific-KleiDiAI-kernels-from.patch
new file mode 100644
index 00000000..fd72189b
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0009-cmake-Exclude-AARCH64-specific-KleiDiAI-kernels-from.patch
@@ -0,0 +1,37 @@
+From 4e2bdad07af1a4a16264ef1373488f41fadd62ab Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Wed, 18 Mar 2026 20:55:08 +0530
+Subject: [PATCH] cmake: Exclude AARCH64-specific KleiDiAI kernels from arm=
v7
+ builds
+
+The KleiDiAI matrix multiplication kernels use AARCH64-specific instructio=
ns
+that are incompatible with armv7 architecture.
+
+Update CMake and add expressions to conditionally exclude these files when
+ACL_ARCH_ISA is set to armv7, preventing build failures on 32-bit ARM plat=
forms.
+
+Upstream-Status: Pending
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ src/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 0867ba81ad..45046fd0f1 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -361,8 +361,8 @@ set(ARM_COMPUTE_SVE2_SOURCES
+ )
+=20
+ set(ARM_COMPUTE_SOURCES
+-    ../third_party/kleidiai/kai/ukernels/matmul/matmul_clamp_f32_f32_f32p=
/kai_matmul_clamp_f32_f32_f32p8x1biasf32_6x8x4_neon_mla.c
+-	../third_party/kleidiai/kai/ukernels/matmul/pack/kai_rhs_pack_kxn_f32p8x=
1biasf32_f32_f32_neon.c
++	$<$<NOT:$<STREQUAL:${ACL_ARCH_ISA},armv7>>:../third_party/kleidiai/kai/u=
kernels/matmul/matmul_clamp_f32_f32_f32p/kai_matmul_clamp_f32_f32_f32p8x1bi=
asf32_6x8x4_neon_mla.c>
++	$<$<NOT:$<STREQUAL:${ACL_ARCH_ISA},armv7>>:../third_party/kleidiai/kai/u=
kernels/matmul/pack/kai_rhs_pack_kxn_f32p8x1biasf32_f32_f32_neon.c>
+ 	c/AclContext.cpp
+ 	c/AclOperator.cpp
+ 	c/AclQueue.cpp
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library_52.7.0.bb b/meta-arago-extras/recipes-devtools/arm-compute-lib=
rary/arm-compute-library_52.7.0.bb
index 02155d20..f3b67a66 100644
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary_52.7.0.bb
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary_52.7.0.bb
@@ -13,6 +13,7 @@ SRC_URI =3D " \
     file://0006-Remove-TARGET-dependency.patch \
     file://0007-cmake-Generate-generic-library-name-instead-of.patch \
     file://0008-Add-FP16-source-path.patch \
+    file://0009-cmake-Exclude-AARCH64-specific-KleiDiAI-kernels-from.patch=
 \
 "
 SRCREV =3D "c9a1fff898abd5109b759e8e16616519dc758fdd"
=20
--=20
2.34.1


