Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA55106F2FC
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 08:12:20 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42633.1774512737637585534
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 01:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=XhfmqmBe;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.40, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjdPFFC5CccS7kClDxdQqD/bwElVvuUmfFMUNTZUpOCqQmRuDKumW8VbLz9LXTqEkxsJURvrYEeEmuGRLFUoGLDtEdyM9U/B5Iylm4x8iyL2QbOfhcLOUY5nwxdfeHOCOOVWiNqqwG7vYackzS16H0MOscwL/V7YBg6LSlfN8TifRHc0M6QpS9GfYz8+BbSo3Zs9Uah1tSD791+YK+nLAUu8y6MCAKd4holNCgOh1l9M0e8yTnfjdVfsk0nbXhrrAl02bzsRP4+ZWIXYA9OJ0mE4NdChSuQ1Am4e12JsmoHzGfv8vheZ9/ZquLfenEbA7ZCqwDm4iCuAXaHtAgSqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmI+YVQMUlp9xZFNbaJ9QNNyjtYArcJIqTiSx5rZZOo=;
 b=lHXmhN1BbvCChrOddEXEcXWuVfjviTQtENgRJ3BLaN8sD1MtN8Dw0fagxft8liQSSp+Oho2V318PrCB0Zd7OgmwHvGNR/3++5G10W7t6Vn1k5G0nk0EhVk0TVCfah4obyxA8kES0pAazeyxHkEqsNq8s8UObV5pr9UJ3F1N1On2P+5CPz/CJSJZJ+b4zwcf+ulZYmaxwElq0i56G6JDxO0vnNAl6T9kpYK97jP8RtJ+tbO9ac/p9oVe1g09elcLacKZDMt6MUPGTF5Be6wEYpldjrcMsoliHao6tQWC3gypnsMf5viQfxSIcFvvg4RhUHaC3PO2k3PKHSKEshlx5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmI+YVQMUlp9xZFNbaJ9QNNyjtYArcJIqTiSx5rZZOo=;
 b=XhfmqmBeLkEQG3akrXtHfxO1NUpMVD7qXRH/7MmJQlTCNgTESMtx66km354nh9/MPd3zoI1mfUhJ7rpld4YUcGrk5P+g11ErPnP9BBJ9rGL2GafdCWWLmVnpB2oOdERDsjuzpXXv3XSJ3BYSz4i617o/Yl+GHOb6osBrrDHMJjs=
Received: from SJ0PR03CA0189.namprd03.prod.outlook.com (2603:10b6:a03:2ef::14)
 by CY5PR10MB6045.namprd10.prod.outlook.com (2603:10b6:930:3e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 08:12:15 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::6) by SJ0PR03CA0189.outlook.office365.com
 (2603:10b6:a03:2ef::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 08:12:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 08:12:13 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:12:05 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:12:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 03:12:04 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q8BqKJ1796058;
	Thu, 26 Mar 2026 03:12:02 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v3 3/3] arm-compute-library: Exclude AARCH64 KleiDiAI kernels from armv7
Date: Thu, 26 Mar 2026 13:41:51 +0530
Message-ID: <20260326081151.1214749-4-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326081151.1214749-1-p-deshmukh@ti.com>
References: <20260326081151.1214749-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|CY5PR10MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d792dfc-fb4f-4f3a-3b3e-08de8b0f6326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	6Z/bpIO3utseSLhL6OxX50U8pNg1Q8KzgFcN/6Q94DBXUMmJ2BZ3DKXI2Fu1Hn/GtskdKy7yfxrB5kXOr0uMRyTooh2ZAw7Oai5qlBj9K68EDdHgWsE2gpHtVQElw0BHid8k0Wx2xmtnghPSgdw0C1KGebmNHfoBZOoigPeN3dzV/Q4XTVqh6bQbDWIeJ3O8vfVmS217obCG+60440SIvYVLyN4i1Qn8t9N//R0je+8fKvDB6rYhoBmdy31sV/1slu6HoL3YKcORgzQdF6+esMimZKLzkIAXSxt7x+S4VSSj7nlVm84jQrJuwNdhPo6G64wpqxgZfvLCX18r3vNXdMFC05suHZZZDP+zzfjK/bvr1YyMjkJXw1r9fVcT+GsRoqrmXCpZ4aGb6kfCzcgVQnXOA0dB/Ourz340WmfXAs6a1nq/RhAKLdA3k6nK75O58/2lu3Gs7plfYc2TL6th8m2o6uhd+pF1K4WIRsuqVvNiA624mVfKVSaYk52arF8oaYeos9CwoQZONxXoGwDQvpXEe4oy1TMBHJ3u9/0UFAlr84m1wHu340dkn3U6lJNwOaV6Kt7FJxF6SxSaigD2GsgLXhH3ypcYdGvJwqNF1WVgqhYftfF2ogHmxYjE0CS4Z++WJczUx4WZqL/enoxjOXDpgP6hHvb+GDzoZeMvOTSa4xI33PY3lnMcSCqTpbWAbZMYKOoTa6ogleFIMMpQ0PUWKt/ew5qB7IjsD9Rqoc8LpwWOQ8rNzmTJc+pwBe+eWE/7a5OEh4yAREqqLMSRig==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FgzpSB5fBNYjxbzIc38MIJRc05WNDrSpfUd45h5c7+/Orrl9qT7tQh5XhjyS3/9CZg8oq726oJWkXjCGw+NcWRTl7xVwnbbFeolu0q0F8yfcURxRQIhPbWrjDs2NhVL8vWR85yuEdqDKguvi3UQg6J624qb+hH1WTVxsXmih2RwE9KFsjyZ4TgQAa3RKm8A/D9sTP+8DfZINrwFup0yNcICykM98AkucS+btnTnDCe8dYTM35X3boccE1Rz7gPN1cQAIljL9XquBswybntHAkFV1NxfjaCH9LqF5pOBBuAOx6sKCSCBj2gWpXikcMnaDP2MtoknFH+9mjTkRF4+KfYGMiYmBihQGD5MNhJCqWt/iCGr2r9CVLinF9LvCOZ/FVBQGfSDrKv6Ukgj6qfhEYu9oO4YhfiziWMhCput/mWavqRSUhi0lUjLdZHHeGx3I
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:12:13.6088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d792dfc-fb4f-4f3a-3b3e-08de8b0f6326
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6045
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Mar 2026 08:12:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17449

Prevent AARCH64-specific KleiDiAI kernels from being included
in armv7 builds, resolving build issues on 32-bit ARM platforms.

Added Patch;
 - 0009-cmake-Exclude-AARCH64-specific-KleiDiAI-kernels-from.patch

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:

v2 -> v3:
 - None

v1 -> v2:
 - Added shorter commit message

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


