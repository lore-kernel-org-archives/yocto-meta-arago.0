Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1BB109C038
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 07:27:20 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42208.1774510032114900034
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 00:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=AVO4PsN9;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.25, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVZSbYJGLglUCmHiv+yY6vz4RK5LrDfURf1+q645TBS9ORbYbjfLWrDoSIsmgVjfTvJcOQqGa0GlVk0oN336v19qLydo/e3xQ/IMO2k5SuYbUnbBgYew+yfJP+gDO1TtTfMShR9lYJZ+J9FkramBAHbmdBgAcaxLyZbMgZ8YL1nR1scjMh1vgryL7EZ/TmsSGNWqiim80kQRGSpgg3VKk4dqWDmI3IvTd6/rAbq08ENjQ80FdRi1QKTrEzTCEspl1xNAd27NTml7XoaBYl5KtZtZgPhPwsyzhAP5+euaiDrYGvOHzhVtqZVDBQLcaNOtyClez5ajvaixSvkSfX8lmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osGjbOV7X2CvU1ueW+3yddJ6pAqnWYbOJDatBuadNlQ=;
 b=OOJXufwFuviT4hEVKebHIGXiSqvQRt2nVWoYrCpA6w1Uh+ZqAKS+oiQj/xsA4y3E1xSvve0zH4SUOfRgjjAgsYRc1RVfJOx538D3RFj1xmn/vI/6EvJ8CI/4Ei2YoAY+ypulaPkUBSD6UYG9uXE7oz34NNyewJuZJrwW4Pwk92GqwkGFkxhpAt6DwPKBAv6NE2S7HybkSFdlcxh+dW0PbAOBe2LbHZFc0u4PAhmq+aXGFL0nj/Oe+RQY4ZuZpYfnkmIk5h7v6J85P83/I5RIx5onCNemaFpzIppv8m1z2HvnHEfc/IPY1tJAvFzQbOtttUUMMwBkN8FvJ+37E8EvJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osGjbOV7X2CvU1ueW+3yddJ6pAqnWYbOJDatBuadNlQ=;
 b=AVO4PsN9VR7rp4zJrJSowJqC8ZaA28Wbz+EG4L137EyFRtxymtuGS+jWBZXdejZP/CHyhnlHNtisHxKdO+vBQmSQZ1oEidmCGaNTuMIADIiDbebL7Szyinsbhj/wNn06D8edD90+szZXW0CHYTPP+42glu87Xox3CFw7kUb8jdU=
Received: from PH8PR07CA0024.namprd07.prod.outlook.com (2603:10b6:510:2cd::8)
 by DS7PR10MB4991.namprd10.prod.outlook.com (2603:10b6:5:38e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 07:27:09 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::7f) by PH8PR07CA0024.outlook.office365.com
 (2603:10b6:510:2cd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Thu,
 26 Mar 2026 07:27:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 07:27:08 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:27:07 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:27:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 02:27:07 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q7Qsxe1733061;
	Thu, 26 Mar 2026 02:27:05 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v2 3/3] arm-compute-library: Exclude AARCH64 KleiDiAI kernels from armv7
Date: Thu, 26 Mar 2026 12:56:53 +0530
Message-ID: <20260326072653.1025506-4-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326072653.1025506-1-p-deshmukh@ti.com>
References: <20260326072653.1025506-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|DS7PR10MB4991:EE_
X-MS-Office365-Filtering-Correlation-Id: 28fa1fef-f9a7-4196-6a07-08de8b09169a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YUt2qaGJDNbrf5ymC0Waj96X/pAwSCzyohuIRTp7zznjrWfGYbhTmQ1ejD6DS/yerpkSrFSg1uTzY6SG7gYawbGW0aov/mqQfg8hB1cMQwrDThmcA1fFOqii15qyjKyIGOGtrtmK46ycaJbQ5W26vh5h9Jm22lBBS6fi6HUAoSAol+udWSiERgYdXwiojhDYUSeMbDe9dogErNk0df20k7bmJgos7xePIB7OKg5fYbNZOlipBi1HHh4G+qGESrZP+VFkYfp8Qb+KCjbKyB3oJMzBEHjrXmmcd6h6S7MbFv0nTQZ8FC9X40F1EmkRF225p+zLbdU3P25x4iOyCmN8A6BFczihrwwkANeW9uQrlQNmwFX0xJYh1SP73uTcih+NSnn9DIVzzSer0fkQkRGnDxMwEJQCSoAxrc4W3+L33ODNdAgq3Snn2F4isADHPUFuVXJ/yDSiri+5Tk+IEKRPufmdAAys+y2rbMLFoZwExx0NQRTWXr/kCZS+zb5jbSA1tZLAuwAI9vRvpQZiphps3jy402sLu5FCifGq6AJHX8UnSz0AIbbUxAnZ/jE8/C9q6vtvl18oseZBHdm3sn2wEwDDmjHJGPznYetbXyyRZ8/zBiaPqi0o3dy1fIuHNj11qaxwNWIg1CEptg13zSneMh0Um9msUSXhwgcBFUSLGCQ/c3Wz6wVchYcfh8uib/WeAENbJHJkgOxJNDlpclUi6G0Q+SqVsd6Vt9BfohX45MC2Sa9PeJLtrDaxLGeVncmyrkk3lktMUQP90eRI0/Grmw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nfWOsygjo1jCNRIThUbKS9sIM4VVgxdZ3P3Tmqn5fT0GPP3NVztmEaLJW/DP4YAIwCtciFasmUgA+6CzuBwoaZxJ79ZrSLoSG8oJO+K2wDHRr4MoGlRObYZPQ2njhhiJNOk1dA6S2I6L3p8ZJn3wkFWz+DN6u6tBBqB3MnYR8PLse5w1Hf+hnzeUIxHxJZCKJD1QrLkunoYba2Of/KSmdZUU9/50s4gc3UNpg1HKgRB5xe4JdNpe4j6iGHAii+wUH5BXuN/aLpDFOKMYKWny2DyA9mm5i6EWUF1h3+CwPqX/HcGZ3baYWlNAbj7Ekc1Kp9JYataobuuLe9LIoncTX5E5eYC9XUdWilWHQtaPNEFzUJ6JcoLEuY1BcVmyTHR7vmWlWwnccAZKnxIFYnw9qznZGHoEbNjBAumhGgm6B4GQ8G4PjnkLVgkXxFAGtL5E
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:27:08.2666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fa1fef-f9a7-4196-6a07-08de8b09169a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4991
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Mar 2026 07:27:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17442

Prevent AARCH64-specific KleiDiAI kernels from being included
in armv7 builds, resolving build issues on 32-bit ARM platforms.

Added Patch;
 - 0009-cmake-Exclude-AARCH64-specific-KleiDiAI-kernels-from.patch

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:
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


