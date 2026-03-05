Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A82F47CBD
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:31:47 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52873.1772739101510350522
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 11:31:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hVuatdd7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.46, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4ieRuHkk4LsB11tfOhuVv+HE7T52Q5eujyZ0iVj65FdfvYk4gksOW3cWPO0JxNvJKOLX0AElmttns9tumTulwm+7I1avf9J4oDSxyoJB68t1IzIc0WmC8gOHTpXYTtXx31ScJfg7wsmECsg7SAqIEj7wZPiVyZQ5nSVy9WjK/ZseXWTMWumWqg3Zta9tHApFI92ya+SXLhHcMduqAHsDuOkn4xylLFH68lNO/JmZa9wpi+HIOTcO7Jjv3/7PmLU/5s9xzXiq641/tlfiq7qdCOrlh3UHCEP2QuXJaRXVDjCb+QvCUAahbzjBptRmVEOLzE3rfk6fIGwoOOktdzhzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGaCeGWdEQQldqF0djPSmU+TPHl41YSTqgOsX8M4YUE=;
 b=UmMvLpz5Io3oWzuDuMLJjmwzPTyJnvQO8JOq5mh+C0W6rngQ47zRZ7WIlDDbaD2HczL4eYOPUf6/EOeNF/f49aWB/6jVHlH+XwskzlShZry2demfj/ou6588L8NTPq0YbWi0KN699uin4er0TrXMl455Z9K/fq2VpMy6miedXpPr5fNg0GwpSQ8Hyd3gr+gioNXOcHzmpg3kGUFVxaMvtiajEd/ZeaRo5VTfX4i4tDz3sRi/saJhg4+Hv7WetADX2I5mfwGupl+I9WlJKshrn/MT6NTE6sOXHIB7xEr9GJ2HCi0R4YUENCZGeo4muP54/LVQxWvtXOUoZYmSn6pJFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGaCeGWdEQQldqF0djPSmU+TPHl41YSTqgOsX8M4YUE=;
 b=hVuatdd7oW7MVE9eFoju04XvzXmwAy3S6QT9No3LEpFmAbd8uwn0dccyOInF7f60XlLRKRpINGj9oZmbXr4iofL6ZAf4pkKiitZxyOLI/8dZlIS5vGhzTqhXRpSpFBNqMCxbudn9uPtxWh3+pU/KmbMtpjFP+KtKGiOJ5awqgl0=
Received: from DS7PR05CA0107.namprd05.prod.outlook.com (2603:10b6:8:56::25) by
 SA1PR10MB6520.namprd10.prod.outlook.com (2603:10b6:806:2b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 19:31:37 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::ba) by DS7PR05CA0107.outlook.office365.com
 (2603:10b6:8:56::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 19:31:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:31:36 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:31:33 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:31:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:31:32 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JVQ302427052;
	Thu, 5 Mar 2026 13:31:30 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v3 1/4] arm-compute-library: upgrade 24.12 -> 52.07
Date: Fri, 6 Mar 2026 01:01:22 +0530
Message-ID: <20260305193125.2045659-2-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305193125.2045659-1-p-deshmukh@ti.com>
References: <20260305193125.2045659-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|SA1PR10MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: f3cf957c-8f49-47ea-cc35-08de7aedd13b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info: 
	qyFyCPfm291BjI8xhvgp22YNjEU/roV6l5IABcMAxLKVv+51JDt6b4gWnx0QHJYT6AChfol4IUFWLZM/ykxVXCEjQvm/64Ziz81TyqNU/Z7/FgOq/MNFGmQOoqh73NveC2MVGzb1jAONQQCarZPmiRSf+i4kybIvmz9OZS6q6j1sCzplGQrcvY9av6ASHcoknWAeikdv73VJ0McHB/u7sDGYDqEfPPi/p/8h4BTNUpAO3rCNjJLtUOg/P47GooQUuWVXCjQnFY8PVo8Rr8CSsAh/z3ioQX5QJAZT2xgqctGeSyZRHnVeF/vtCyDxWTcQatXFRl/7qS+1A8PJxDGiQpZEztmdltKeO8BdIjCkz0y8DGDg+Rpm4102/6+1CMK/kbjJzgumh5tVtR9xrmssnvJfB1h7eVIQeCaGN1peYmm3PjpJfvXazIfFWedtfBRrlTEGj1ytc7csqvtBxnRfVxZcUZ0KMTjnB6GM/IyPWrE1ZgfYm1tja+enPgiDuo/JVjgqPXV8aqKXPUs7WNfMeHikRWsXjqQV6ODmjUmei4G/CaBQn9NZmWfrv11vukTQo/m+HPnjVoG45hyl9DIpRC5t/EI0RBFbph6amZxot7geH3JIx3iJjt88uiOrzq1+QgtQIcTPOrsb9Vunw9vK8qKlNKmrF6qjP/0tDxGr6VNWY3tkle8vhd+PmqyUatlMpVW1IF7x1T44vZoEZKxDghPMdowsiHHMZV8eH7TTNcv3X1+rUGLSJp80UPrk4wdciPeb8TYm6hgMgTp+vhyozA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	g6E+OySMRXM8QhqRa1BYfopm63+ZJO68CiagQkyOVqETYsrBNcG82FZzOMyJEmaee7xVcUi6y0R34B7gJ5n2o6aJBAXIBfaaxnF6gESCZjYu+aLH8NrYmElPrb0ku4VJJxHbhi4Cgelfv7Ubt+ZZKsEtSC+W/P9XTx1wJmORwIHEdWVCoy+OtVnYy5sbYWbZTCLPSxsmHmjLY3v+Y761mPD4AS12IawkQVVpRCl0X6CsL+6eY54uzEs9a/2wp4Nw4tike4E9V7F+HD2i+B8heFUldl4IrjF5viUsU/dutrmeODcTrDrHP/4Mc0lkSYn2SQw8V+p97iMRygQMuORa3VtGxhlTADqWZPU9h5KHdKxXLoHkH4u+iq4IvzkjYe/A3I7vh6j3f/xi0+AeBax/VCZg0NI1fkSDTMmemnlt8l9xbfmvmmit3PT929aDuzjC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:31:36.8504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cf957c-8f49-47ea-cc35-08de7aedd13b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6520
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 19:31:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17258

We are migrating ARM Compute Library from v24.12 to the
latest version v52.07

Removed Patches:
 =E2=80=A2 0001-fix-Fix-indention-in-cmake-generator-script.patch
   - Upstream Link: https://github.com/ARM-software/ComputeLibrary/commit/e=
0c42ef651709fd284da3bedd2c98d420bd6fd1a
 =E2=80=A2 0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
   - No need for this patch for v52.07 ACL.

Rebased Patches:
 =E2=80=A2 Following patches are updated with new commits
   - 0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
   - 0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
   - 0004-Add-source-files-at-library-definition-time.patch
   - 0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
   - 0007-Allow-ARMv7-builds-using-CMake.patch
   - 0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch

License-Update: Updated LIC_FILES_CHKSUM for MIT.txt, just checksum update =
due to minor
formatting/year changes in the license file for version v52.07.

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:=20

v2 -> v3:
 - Added Authored-by signature in patches
 - Link to v2
   - https://patchwork.yoctoproject.org/project/arago/cover/20260305173419.=
1735480-1-p-deshmukh@ti.com/=20

v1 -> v2:
 - Fixed arm-compute-library recipe name=20
 - Fixed tabs/spacing issues
 - Link to v1
   - https://patchwork.yoctoproject.org/project/arago/cover/20260304123221.=
1450993-1-p-deshmukh@ti.com/

 ...NABLE_NEON-in-code-for-checking-NEO.patch} |  73 ++----
 ...-indention-in-cmake-generator-script.patch | 130 ---------
 ...ENABLE_SVE-in-code-for-checking-SVE.patch} | 118 ++++-----
 ...ce-files-at-library-definition-time.patch} | 247 ++++++++++--------
 .../0004-Allow-ARMv7-builds-using-CMake.patch | 175 +++++++++++++
 ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 --------
 ...mbol-error-when-building-TensorInfo.patch} |  25 +-
 ...SVE2-support-to-be-disabled-in-CMake.patch |  91 -------
 .../0006-Remove-TARGET-dependency.patch       |  58 ++++
 .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ------
 ...rate-generic-library-name-instead-of.patch |  33 +++
 .../0008-Add-FP16-source-path.patch           |  28 ++
 ...24.12.bb =3D> arm-compute-library_52.7.0.bb} |  56 ++--
 13 files changed, 556 insertions(+), 676 deletions(-)
 rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/{0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch =
=3D> 0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch} (58%)
 delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch
 rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/{0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch =
=3D> 0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch} (67%)
 rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/{0004-Add-source-files-at-library-definition-time.patch =3D> 0003-A=
dd-source-files-at-library-definition-time.patch} (24%)
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0004-Allow-ARMv7-builds-using-CMake.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.pa=
tch
 rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/{0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch =3D=
> 0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch} (67%)
 delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake=
.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0006-Remove-TARGET-dependency.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0007-cmake-Generate-generic-library-name-instead-of.pat=
ch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0008-Add-FP16-source-path.patch
 rename meta-arago-extras/recipes-devtools/arm-compute-library/{arm-compute=
-library_24.12.bb =3D> arm-compute-library_52.7.0.bb} (58%)

diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patc=
h b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libr=
ary/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
similarity index 58%
rename from meta-arago-extras/recipes-devtools/arm-compute-library/arm-comp=
ute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
rename to meta-arago-extras/recipes-devtools/arm-compute-library/arm-comput=
e-library/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
index 1c33ac3c..07327e50 100644
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
@@ -1,7 +1,8 @@
-From 4350c56d14b7b68acd060d8331f3ade1fb74e167 Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 5 Dec 2024 09:21:23 -0600
-Subject: [PATCH] Use ARM_COMPUTE_ENABLE_NEON in code for checking NEON sup=
port
+From 6902148626781de2b4a2aec2c00fb6a13328209c Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Wed, 4 Mar 2026 15:24:41 +0530
+Subject: [PATCH 1/8] Use ARM_COMPUTE_ENABLE_NEON in code for checking NEON
+ support
=20
 ENABLE_NEON is a flag used by the build systems. The flag is not used
 in code, instead ARM_COMPUTE_ENABLE_NEON is used everywhere.
@@ -11,19 +12,18 @@ use in code.
=20
 Upstream-Status: Pending
=20
-Signed-off-by: Andrew Davis <afd@ti.com>
-Change-Id: I65f5e7411c99280e2dd8c187140909cefd1c6892
+Authored-by: Andrew Davis <afd@ti.com>
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
 ---
  Android.bp                     | 1 -
  BUILD.bazel                    | 1 -
  SConscript                     | 2 +-
  SConstruct                     | 2 +-
- cmake/Options.cmake            | 6 +-----
  scripts/generate_android_bp.py | 1 -
- 6 files changed, 3 insertions(+), 10 deletions(-)
+ 5 files changed, 2 insertions(+), 5 deletions(-)
=20
 diff --git a/Android.bp b/Android.bp
-index 69379472b0..9288bba2d4 100644
+index 9f659b2f6e..eec8366833 100644
 --- a/Android.bp
 +++ b/Android.bp
 @@ -157,7 +157,6 @@ arm_compute_library_defaults {
@@ -35,7 +35,7 @@ index 69379472b0..9288bba2d4 100644
              "-Wno-unused-parameter",
              "-DNO_DOT_IN_TOOLCHAIN",
 diff --git a/BUILD.bazel b/BUILD.bazel
-index f553b7bfad..2262a09655 100644
+index 3cbd582c2b..d555ccea45 100644
 --- a/BUILD.bazel
 +++ b/BUILD.bazel
 @@ -170,7 +170,6 @@ config_setting(
@@ -47,64 +47,36 @@ index f553b7bfad..2262a09655 100644
                    "ARM_COMPUTE_ENABLE_NEON",
                    "ARM_COMPUTE_ENABLE_I8MM",
 diff --git a/SConscript b/SConscript
-index 12e8fd1025..69a564873f 100644
+index d2f39c4a5b..45a9471d34 100644
 --- a/SConscript
 +++ b/SConscript
 @@ -97,7 +97,7 @@ def build_multiisa_lib_objects():
-
+=20
      # note that ARM_COMPUTE_ENABLE_FP16 is enabled in update_data_type_la=
yout_flags() to make
      # sure the environment is progated to the validation suite
 -    arm_compute_env.Append(CPPDEFINES =3D ['ENABLE_NEON', 'ARM_COMPUTE_EN=
ABLE_NEON',
 +    arm_compute_env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_NEON',
-                            'ENABLE_SVE', 'ARM_COMPUTE_ENABLE_SVE','ARM_CO=
MPUTE_ENABLE_BF16',
-                            'ARM_COMPUTE_ENABLE_I8MM', 'ARM_COMPUTE_ENABLE=
_SVEF32MM'])
-
+                            'ENABLE_SVE', 'ARM_COMPUTE_ENABLE_SVE','ARM_CO=
MPUTE_ENABLE_SVE2',
+                            'ARM_COMPUTE_ENABLE_BF16', 'ARM_COMPUTE_ENABLE=
_I8MM',
+                            'ARM_COMPUTE_ENABLE_SVEF32MM', 'ARM_COMPUTE_EN=
ABLE_SME',
 diff --git a/SConstruct b/SConstruct
-index 8d7bd291e8..7381300fc8 100644
+index 39c0ffdea3..1fce556c8e 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -302,7 +302,7 @@ if 'v7a' in env['estate'] and env['estate'] =3D=3D '64=
':
+@@ -334,7 +334,7 @@ if 'v7a' in env['arch'] and env['estate'] =3D=3D '64':
      print("ERROR: armv7a architecture has only 32-bit execution state")
      Exit(1)
-
+=20
 -env.Append(CPPDEFINES =3D ['ENABLE_NEON', 'ARM_COMPUTE_ENABLE_NEON'])
 +env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_NEON'])
-
+=20
  if 'sve' in env['arch']:
      env.Append(CPPDEFINES =3D ['ENABLE_SVE', 'ARM_COMPUTE_ENABLE_SVE'])
-diff --git a/cmake/Options.cmake b/cmake/Options.cmake
-index 5d685be48d..121d527718 100644
---- a/cmake/Options.cmake
-+++ b/cmake/Options.cmake
-@@ -53,7 +53,6 @@ option(ARM_COMPUTE_ENABLE_SVE_VALIDATION "" OFF)
-
- option(ENABLE_NEON "Enable Arm=C2=AE Neon=E2=84=A2 support" ON)
- option(ARM_COMPUTE_CPU_ENABLED "" ON)
--option(ARM_COMPUTE_ENABLE_NEON "" ON)
- option(ARM_COMPUTE_ENABLE_I8MM "" ON)
- option(ENABLE_FP32_KERNELS "" ON)
- option(ENABLE_QASYMM8_KERNELS "" ON)
-@@ -70,14 +69,11 @@ option(ENABLE_FP16_KERNELS "" OFF)
- option(ARM_COMPUTE_ENABLE_FP16 "" OFF)
-
- if(ENABLE_NEON)
--  add_definitions(-DENABLE_NEON)
-+  add_definitions(-DARM_COMPUTE_ENABLE_NEON)
- endif()
- if(ARM_COMPUTE_CPU_ENABLED)
-   add_definitions(-DARM_COMPUTE_CPU_ENABLED)
- endif()
--if(ARM_COMPUTE_ENABLE_NEON)
--  add_definitions(-DARM_COMPUTE_ENABLE_NEON)
--endif()
- if(ARM_COMPUTE_ENABLE_FP16)
-   add_definitions(-DARM_COMPUTE_ENABLE_FP16)
- endif()
 diff --git a/scripts/generate_android_bp.py b/scripts/generate_android_bp.=
py
-index d5b268f522..99a04e7071 100755
+index f9dbd89228..ba2765900d 100755
 --- a/scripts/generate_android_bp.py
 +++ b/scripts/generate_android_bp.py
-@@ -94,7 +94,6 @@ arm_compute_library_defaults {
+@@ -92,7 +92,6 @@ arm_compute_library_defaults {
              "-DEMBEDDED_KERNELS",
              "-DARM_COMPUTE_ASSERTS_ENABLED",
              "-DARM_COMPUTE_CPP_SCHEDULER",
@@ -112,3 +84,6 @@ index d5b268f522..99a04e7071 100755
              "-DARM_COMPUTE_ENABLE_NEON",
              "-Wno-unused-parameter",
              "-DNO_DOT_IN_TOOLCHAIN",
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch b/meta-=
arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-=
fix-Fix-indention-in-cmake-generator-script.patch
deleted file mode 100644
index f423c259..00000000
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0001-fix-Fix-indention-in-cmake-generator-script.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From 1e4c3016547b5f75e515d4b9a7202733c47f5a18 Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Wed, 4 Dec 2024 14:46:17 -0600
-Subject: [PATCH] fix: Fix indention in cmake generator script
-
-All other items in these lists use tabs, the first couple
-lines should match. Switch them to tabs then regenerate
-the CMakeLists.txt file.
-
-While here fix the missing ending newline.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrew Davis <afd@ti.com>
-Change-Id: Icab852fc43ae08e7858857881c996d233c835289
----
- scripts/generate_build_files.py | 27 ++++++++++++++-------------
- src/CMakeLists.txt              | 26 +++++++++++++-------------
- 2 files changed, 27 insertions(+), 26 deletions(-)
-
-diff --git a/scripts/generate_build_files.py b/scripts/generate_build_file=
s.py
-index f88cf1af44..52a8cc14da 100644
---- a/scripts/generate_build_files.py
-+++ b/scripts/generate_build_files.py
-@@ -168,28 +168,29 @@ def build_from_template_cmake(srcs_graph, srcs_sve, =
srcs_sve2, srcs_core):
-     template =3D f"""{get_template_header()}
-
- target_sources(
--    arm_compute_graph
--    PRIVATE
--    {line_separator.join(srcs_graph)}
-+	arm_compute_graph
-+	PRIVATE
-+	{line_separator.join(srcs_graph)}
- )
-
- target_sources(
--    arm_compute_sve
--    PRIVATE
--    {line_separator.join(srcs_sve)}
-+	arm_compute_sve
-+	PRIVATE
-+	{line_separator.join(srcs_sve)}
- )
-
- target_sources(
--    arm_compute_sve2
--    PRIVATE
--    {line_separator.join(srcs_sve2)}
-+	arm_compute_sve2
-+	PRIVATE
-+	{line_separator.join(srcs_sve2)}
- )
-
- target_sources(
--    arm_compute
--    PRIVATE
--    {line_separator.join(srcs_core)}
--)"""
-+	arm_compute
-+	PRIVATE
-+	{line_separator.join(srcs_core)}
-+)
-+"""
-     return template
-
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index ff3bed96df..f1b275532a 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -21,9 +21,9 @@
- # SOFTWARE.
-
- target_sources(
--    arm_compute_graph
--    PRIVATE
--    graph/DataLayerVisitor.cpp
-+	arm_compute_graph
-+	PRIVATE
-+	graph/DataLayerVisitor.cpp
-	graph/Graph.cpp
-	graph/GraphBuilder.cpp
-	graph/GraphContext.cpp
-@@ -101,9 +101,9 @@ target_sources(
- )
-
- target_sources(
--    arm_compute_sve
--    PRIVATE
--    core/NEON/kernels/arm_conv/depthwise/interleaves/sve_s8q_3x3_dot.cpp
-+	arm_compute_sve
-+	PRIVATE
-+	core/NEON/kernels/arm_conv/depthwise/interleaves/sve_s8q_3x3_dot.cpp
-	core/NEON/kernels/arm_conv/depthwise/interleaves/sve_u8q_3x3_dot.cpp
-	core/NEON/kernels/arm_conv/depthwise/kernels/sme2_fp16_nhwc_3x3_s1_output=
2x2_mla_depthfirst/generic_direct.cpp
-	core/NEON/kernels/arm_conv/depthwise/kernels/sme2_fp16_nhwc_3x3_s1_output=
2x2_mla_depthfirst/generic_indirect.cpp
-@@ -332,9 +332,9 @@ target_sources(
- )
-
- target_sources(
--    arm_compute_sve2
--    PRIVATE
--    cpu/kernels/activation/generic/sve2/lut.cpp
-+	arm_compute_sve2
-+	PRIVATE
-+	cpu/kernels/activation/generic/sve2/lut.cpp
-	cpu/kernels/activation/generic/sve2/qasymm8.cpp
-	cpu/kernels/activation/generic/sve2/qasymm8_signed.cpp
-	cpu/kernels/activation/generic/sve2/qsymm16.cpp
-@@ -357,9 +357,9 @@ target_sources(
- )
-
- target_sources(
--    arm_compute
--    PRIVATE
--    c/AclContext.cpp
-+	arm_compute
-+	PRIVATE
-+	c/AclContext.cpp
-	c/AclOperator.cpp
-	c/AclQueue.cpp
-	c/AclTensor.cpp
-@@ -1049,4 +1049,4 @@ target_sources(
-	runtime/experimental/operators/CpuSub.cpp
-	runtime/experimental/operators/CpuTranspose.cpp
-	runtime/experimental/operators/CpuWinogradConv2d.cpp
--)
-\ No newline at end of file
-+)
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patc=
h b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libr=
ary/0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch
similarity index 67%
rename from meta-arago-extras/recipes-devtools/arm-compute-library/arm-comp=
ute-library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
rename to meta-arago-extras/recipes-devtools/arm-compute-library/arm-comput=
e-library/0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch
index d766f2e3..4b4ec65c 100644
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch
@@ -1,7 +1,8 @@
-From 92a881cebfee5504b188a046a96d39dd9361ddb1 Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 5 Dec 2024 08:57:38 -0600
-Subject: [PATCH] Use ARM_COMPUTE_ENABLE_SVE in code for checking SVE suppo=
rt
+From efaf2a32cefa5096eeb560cb28f3d4987ac3ca18 Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Wed, 4 Mar 2026 15:30:57 +0530
+Subject: [PATCH 2/8] Use ARM_COMPUTE_ENABLE_SVE in code for checking SVE
+ support
=20
 ENABLE_SVE is a flag used by the build systems. The flag used in code
 is ARM_COMPUTE_ENABLE_SVE. There are just a couple spots where the
@@ -13,21 +14,20 @@ being added in the future.
=20
 Upstream-Status: Pending
=20
-Signed-off-by: Andrew Davis <afd@ti.com>
-Change-Id: I00da7580c4520647b62c6989bc7fbdd5efc7935e
+Authored-by: Andrew Davis <afd@ti.com>
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
 ---
  BUILD.bazel                                   |  3 ---
  SConscript                                    |  2 +-
  SConstruct                                    |  2 +-
  .../batchnormalization/impl/SVE/fp16.cpp      |  2 +-
  .../batchnormalization/impl/SVE/fp32.cpp      |  2 +-
- tests/BUILD.bazel                             |  1 -
- tests/validation/NEON/ActivationLayer.cpp     | 24 +++++++++----------
  tests/validation/NEON/ArithmeticAddition.cpp  |  6 ++---
- 8 files changed, 19 insertions(+), 23 deletions(-)
+ .../validation/helpers/ActivationHelpers.cpp  | 24 +++++++++----------
+ 7 files changed, 19 insertions(+), 22 deletions(-)
=20
 diff --git a/BUILD.bazel b/BUILD.bazel
-index 2262a09655..c04a52e084 100644
+index d555ccea45..28f39d64d9 100644
 --- a/BUILD.bazel
 +++ b/BUILD.bazel
 @@ -297,7 +297,6 @@ cc_library(
@@ -55,31 +55,31 @@ index 2262a09655..c04a52e084 100644
          "ARM_COMPUTE_ENABLE_BF16",
      ],
 diff --git a/SConscript b/SConscript
-index 69a564873f..c2ca549b71 100644
+index 45a9471d34..0fee195ecf 100644
 --- a/SConscript
 +++ b/SConscript
 @@ -98,7 +98,7 @@ def build_multiisa_lib_objects():
      # note that ARM_COMPUTE_ENABLE_FP16 is enabled in update_data_type_la=
yout_flags() to make
      # sure the environment is progated to the validation suite
      arm_compute_env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_NEON',
--                           'ENABLE_SVE', 'ARM_COMPUTE_ENABLE_SVE','ARM_CO=
MPUTE_ENABLE_BF16',
-+                                         'ARM_COMPUTE_ENABLE_SVE','ARM_CO=
MPUTE_ENABLE_BF16',
-                            'ARM_COMPUTE_ENABLE_I8MM', 'ARM_COMPUTE_ENABLE=
_SVEF32MM'])
-
-     # Build all the common files for the base architecture
+-                           'ENABLE_SVE', 'ARM_COMPUTE_ENABLE_SVE','ARM_CO=
MPUTE_ENABLE_SVE2',
++                           'ARM_COMPUTE_ENABLE_SVE','ARM_COMPUTE_ENABLE_S=
VE2',
+                            'ARM_COMPUTE_ENABLE_BF16', 'ARM_COMPUTE_ENABLE=
_I8MM',
+                            'ARM_COMPUTE_ENABLE_SVEF32MM', 'ARM_COMPUTE_EN=
ABLE_SME',
+                            'ARM_COMPUTE_ENABLE_SME2', 'ENABLE_SME'])
 diff --git a/SConstruct b/SConstruct
-index 7381300fc8..17f5615acf 100644
+index 1fce556c8e..22a30f3eb2 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -305,7 +305,7 @@ if 'v7a' in env['estate'] and env['estate'] =3D=3D '64=
':
+@@ -337,7 +337,7 @@ if 'v7a' in env['arch'] and env['estate'] =3D=3D '64':
  env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_NEON'])
-
+=20
  if 'sve' in env['arch']:
 -    env.Append(CPPDEFINES =3D ['ENABLE_SVE', 'ARM_COMPUTE_ENABLE_SVE'])
 +    env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_SVE'])
      if 'sve2' in env['arch']:
          env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_SVE2'])
-
+=20
 diff --git a/src/core/NEON/kernels/batchnormalization/impl/SVE/fp16.cpp b/=
src/core/NEON/kernels/batchnormalization/impl/SVE/fp16.cpp
 index 48caaa3e63..e07593312c 100644
 --- a/src/core/NEON/kernels/batchnormalization/impl/SVE/fp16.cpp
@@ -100,24 +100,32 @@ index df4fbfe607..0d52d2c3c0 100644
  } // namespace arm_compute
 -#endif // ENABLE_SVE
 +#endif // ARM_COMPUTE_ENABLE_SVE
-diff --git a/tests/BUILD.bazel b/tests/BUILD.bazel
-index 7085f1facc..4b4be8b257 100644
---- a/tests/BUILD.bazel
-+++ b/tests/BUILD.bazel
-@@ -114,7 +114,6 @@ cc_binary(
-               }) +
-         select({
-                 "//:sve_validation_flag": [
--                "ENABLE_SVE",
-                 "ARM_COMPUTE_ENABLE_SVE",
-                 ],
-                 "//conditions:default": [],
-diff --git a/tests/validation/NEON/ActivationLayer.cpp b/tests/validation/=
NEON/ActivationLayer.cpp
-index 119d51808a..69a8b52354 100644
---- a/tests/validation/NEON/ActivationLayer.cpp
-+++ b/tests/validation/NEON/ActivationLayer.cpp
-@@ -73,11 +73,11 @@ RelativeTolerance<float> relative_tolerance(DataType d=
ata_type, ActivationLayerI
-             switch(data_type)
+diff --git a/tests/validation/NEON/ArithmeticAddition.cpp b/tests/validati=
on/NEON/ArithmeticAddition.cpp
+index 94a24cffd4..b51ff77fd3 100644
+--- a/tests/validation/NEON/ArithmeticAddition.cpp
++++ b/tests/validation/NEON/ArithmeticAddition.cpp
+@@ -49,12 +49,12 @@ namespace validation
+ using framework::dataset::make;
+ namespace
+ {
+-#if !defined(__aarch64__) || defined(ENABLE_SVE)
++#if !defined(__aarch64__) || defined(ARM_COMPUTE_ENABLE_SVE)
+ constexpr AbsoluteTolerance<float> tolerance_quant(
+     1); /**< Tolerance value for comparing reference's output against imp=
lementation's output for quantized data types */
+-#else   // !defined(__aarch64__) || defined(ENABLE_SVE)
++#else   // !defined(__aarch64__) || defined(ARM_COMPUTE_ENABLE_SVE)
+ constexpr AbsoluteTolerance<float> tolerance_quant(1);
+-#endif  // !defined(__aarch64__) || defined(ENABLE_SVE)
++#endif  // !defined(__aarch64__) || defined(ARM_COMPUTE_ENABLE_SVE)
+ const auto InPlaceDataSet    =3D make("InPlace", {false, true});
+ const auto OutOfPlaceDataSet =3D make("InPlace", {false});
+ } // namespace
+diff --git a/tests/validation/helpers/ActivationHelpers.cpp b/tests/valida=
tion/helpers/ActivationHelpers.cpp
+index a432482623..fe86d784eb 100644
+--- a/tests/validation/helpers/ActivationHelpers.cpp
++++ b/tests/validation/helpers/ActivationHelpers.cpp
+@@ -52,11 +52,11 @@ RelativeTolerance<float> relative_tolerance(DataType d=
ata_type, ActivationLayerI
+             switch (data_type)
              {
                  case DataType::F16:
 -#if defined(ENABLE_SVE)
@@ -131,8 +139,8 @@ index 119d51808a..69a8b52354 100644
                  default:
                      return RelativeTolerance<float>(0.05f);
              }
-@@ -85,11 +85,11 @@ RelativeTolerance<float> relative_tolerance(DataType d=
ata_type, ActivationLayerI
-             switch(data_type)
+@@ -64,11 +64,11 @@ RelativeTolerance<float> relative_tolerance(DataType d=
ata_type, ActivationLayerI
+             switch (data_type)
              {
                  case DataType::F16:
 -#if defined(ENABLE_SVE)
@@ -146,8 +154,8 @@ index 119d51808a..69a8b52354 100644
                  default:
                      return RelativeTolerance<float>(0.00001f);
              }
-@@ -117,11 +117,11 @@ AbsoluteTolerance<float> absolute_tolerance(DataType=
 data_type, ActivationLayerI
-             switch(data_type)
+@@ -89,11 +89,11 @@ AbsoluteTolerance<float> absolute_tolerance(DataType d=
ata_type, ActivationLayerI
+             switch (data_type)
              {
                  case DataType::F16:
 -#if defined(ENABLE_SVE)
@@ -161,8 +169,8 @@ index 119d51808a..69a8b52354 100644
                  default:
                      return AbsoluteTolerance<float>(0.00001f);
              }
-@@ -129,11 +129,11 @@ AbsoluteTolerance<float> absolute_tolerance(DataType=
 data_type, ActivationLayerI
-             switch(data_type)
+@@ -101,11 +101,11 @@ AbsoluteTolerance<float> absolute_tolerance(DataType=
 data_type, ActivationLayerI
+             switch (data_type)
              {
                  case DataType::F16:
 -#if defined(ENABLE_SVE)
@@ -176,22 +184,6 @@ index 119d51808a..69a8b52354 100644
                  default:
                      return AbsoluteTolerance<float>(0.00001f);
              }
-diff --git a/tests/validation/NEON/ArithmeticAddition.cpp b/tests/validati=
on/NEON/ArithmeticAddition.cpp
-index c0033daab0..bae8535ff3 100644
---- a/tests/validation/NEON/ArithmeticAddition.cpp
-+++ b/tests/validation/NEON/ArithmeticAddition.cpp
-@@ -48,11 +48,11 @@ namespace validation
- using framework::dataset::make;
- namespace
- {
--#if !defined(__aarch64__) || defined(ENABLE_SVE)
-+#if !defined(__aarch64__) || defined(ARM_COMPUTE_ENABLE_SVE)
- constexpr AbsoluteTolerance<float> tolerance_quant(1); /**< Tolerance val=
ue for comparing reference's output against implementation's output for qua=
ntized data types */
--#else                                                  // !defined(__aarc=
h64__) || defined(ENABLE_SVE)
-+#else                                                  // !defined(__aarc=
h64__) || defined(ARM_COMPUTE_ENABLE_SVE)
- constexpr AbsoluteTolerance<float> tolerance_quant(1);
--#endif                                                 // !defined(__aarc=
h64__) || defined(ENABLE_SVE)
-+#endif                                                 // !defined(__aarc=
h64__) || defined(ARM_COMPUTE_ENABLE_SVE)
- const auto InPlaceDataSet    =3D framework::dataset::make("InPlace", { fa=
lse, true });
- const auto OutOfPlaceDataSet =3D framework::dataset::make("InPlace", { fa=
lse });
- } // namespace
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0004-Add-source-files-at-library-definition-time.patch b/meta-=
arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0003-=
Add-source-files-at-library-definition-time.patch
similarity index 24%
rename from meta-arago-extras/recipes-devtools/arm-compute-library/arm-comp=
ute-library/0004-Add-source-files-at-library-definition-time.patch
rename to meta-arago-extras/recipes-devtools/arm-compute-library/arm-comput=
e-library/0003-Add-source-files-at-library-definition-time.patch
index 462215a2..6ee18903 100644
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0004-Add-source-files-at-library-definition-time.patch
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0003-Add-source-files-at-library-definition-time.patch
@@ -1,167 +1,186 @@
-From a3c7d6aefc289dcce6656fc6d9f9c8c9b1af8f0b Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 5 Dec 2024 09:38:26 -0600
-Subject: [PATCH] Add source files at library definition time
+From 167dd1485ec1396e4b92c623ad7106ca15f420a0 Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Wed, 4 Mar 2026 15:38:50 +0530
+Subject: [PATCH 3/8] Add source files at library definition time
=20
 This allows for easier conditional disabling of these libraries.
=20
 Upstream-Status: Pending
=20
-Signed-off-by: Andrew Davis <afd@ti.com>
-Change-Id: I442aaa03060f2cb7db4ed0c1d93e64dbc223fdc6
+Authored-by: Andrew Davis <afd@ti.com>
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
 ---
- CMakeLists.txt                  | 20 ++++++++++----------
- scripts/generate_build_files.py | 16 ++++------------
- src/CMakeLists.txt              | 16 ++++------------
- 3 files changed, 18 insertions(+), 34 deletions(-)
+ CMakeLists.txt                  | 18 +++++++++++-------
+ scripts/generate_build_files.py | 20 +++++---------------
+ src/CMakeLists.txt              | 20 +++++---------------
+ 3 files changed, 21 insertions(+), 37 deletions(-)
=20
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e8bdf2af1a..4073e06b17 100644
+index 7dc4102e62..fc9c88a8af 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -46,6 +46,12 @@ set(CMAKE_CXX_EXTENSIONS OFF)
- list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
- include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Options.cmake)
- include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Version.cmake)
+@@ -84,6 +84,13 @@ endif()
+ include(${CMAKE_CURRENT_LIST_DIR}/cmake/configurations.cmake)
+ include(${CMAKE_CURRENT_LIST_DIR}/cmake/compilers/setup.cmake)
+ include(${CMAKE_CURRENT_LIST_DIR}/cmake/version.cmake)
 +include(${CMAKE_CURRENT_SOURCE_DIR}/src/CMakeLists.txt)
 +
 +list(TRANSFORM ARM_COMPUTE_GRAPH_SOURCES PREPEND "src/")
 +list(TRANSFORM ARM_COMPUTE_SVE_SOURCES PREPEND "src/")
 +list(TRANSFORM ARM_COMPUTE_SVE2_SOURCES PREPEND "src/")
 +list(TRANSFORM ARM_COMPUTE_SOURCES PREPEND "src/")
-
- # Require at least gcc/g++ 11) CMAKE_CXX_COMPILER_VERSION OR
- if(CMAKE_C_COMPILER_VERSION VERSION_LESS 10.2 OR CMAKE_CXX_COMPILER_VERSI=
ON
-@@ -139,8 +145,7 @@ endif()
-
- # ---------------------------------------------------------------------
- # SVE Object Library
--
--add_library(arm_compute_sve OBJECT "")
-+add_library(arm_compute_sve OBJECT ${ARM_COMPUTE_SVE_SOURCES})
- target_compile_options(arm_compute_sve
-                        PRIVATE "-march=3Darmv8.2-a+sve+fp16+dotprod"
-                        PRIVATE "-fPIC")
-@@ -162,8 +167,7 @@ target_include_directories(
-
- # ---------------------------------------------------------------------
- # SVE2 Object Library
--
--add_library(arm_compute_sve2 OBJECT "")
-+add_library(arm_compute_sve2 OBJECT ${ARM_COMPUTE_SVE2_SOURCES})
- target_compile_options(arm_compute_sve2
-                        PRIVATE "-march=3Darmv8.6-a+sve2+fp16+dotprod"
-                        PRIVATE "-fPIC")
-@@ -187,7 +191,7 @@ target_include_directories(
- # ---------------------------------------------------------------------
- # Core Library
-
--add_library(arm_compute "")
-+add_library(arm_compute ${ARM_COMPUTE_SOURCES})
- target_compile_options(arm_compute PRIVATE "-march=3D${ARM_COMPUTE_ARCH}"=
)
- target_compile_definitions(arm_compute PRIVATE ARM_COMPUTE_ENABLE_BF16)
- target_compile_definitions(arm_compute PRIVATE ENABLE_SVE)
-@@ -216,7 +220,7 @@ target_link_libraries(
- # ---------------------------------------------------------------------
- # Graph Library
-
--add_library(arm_compute_graph "")
-+add_library(arm_compute_graph ${ARM_COMPUTE_GRAPH_SOURCES})
- target_compile_options(arm_compute_graph PRIVATE "-march=3D${ARM_COMPUTE_=
ARCH}")
- target_compile_definitions(arm_compute_graph PRIVATE ENABLE_SVE)
- target_compile_definitions(arm_compute_graph PRIVATE ARM_COMPUTE_ENABLE_S=
VE)
-@@ -238,10 +242,6 @@ target_compile_options(arm_compute_graph PUBLIC ${COM=
MON_CXX_FLAGS})
-
- add_library(ArmCompute::Graph ALIAS arm_compute_graph)
-
--# ---------------------------------------------------------------------
--# Library Target Sources
++list(TRANSFORM ARM_COMPUTE_FP16 PREPEND "src/")
+=20
+ if(ACL_ARCH_ISA STREQUAL "armv8-a" AND (ACL_MULTI_ISA OR ACL_BUILD_SVE OR=
 ACL_BUILD_SVE2 OR ACL_BUILD_SME2))
+   message(FATAL_ERROR
+@@ -191,7 +198,7 @@ set(
+ )
+=20
+ if(ACL_MULTI_ISA OR ACL_BUILD_SVE)
+-  add_library(arm_compute_sve OBJECT)
++  add_library(arm_compute_sve OBJECT ${ARM_COMPUTE_SVE_SOURCES})
+   set_target_properties(
+     arm_compute_sve
+     PROPERTIES
+@@ -205,7 +212,7 @@ else()
+ endif()
+=20
+ if(ACL_MULTI_ISA OR ACL_BUILD_SVE2)
+-  add_library(arm_compute_sve2 OBJECT)
++  add_library(arm_compute_sve2 OBJECT ${ARM_COMPUTE_SVE2_SOURCES})
+   set_target_properties(
+     arm_compute_sve2
+     PROPERTIES
+@@ -218,7 +225,7 @@ else()
+   add_library(arm_compute_sve2 OBJECT EXCLUDE_FROM_ALL)
+ endif()
+=20
+-add_library(arm_compute_core OBJECT)
++add_library(arm_compute_core OBJECT ${ARM_COMPUTE_SOURCES})
+ set_target_properties(
+   arm_compute_core
+   PROPERTIES
+@@ -242,7 +249,7 @@ else()
+   add_library(arm_compute_core_fp16 OBJECT EXCLUDE_FROM_ALL)
+ endif()
+=20
+-add_library(arm_compute_graph ${ARM_COMPUTE_LIB_BUILD_TYPE})
++add_library(arm_compute_graph ${ARM_COMPUTE_LIB_BUILD_TYPE} ${ARM_COMPUTE=
_GRAPH_SOURCES})
+ set_target_properties(
+     arm_compute_graph
+     PROPERTIES
+@@ -329,9 +336,6 @@ endif()
+ add_library(${PROJECT_NAME}::Core ALIAS arm_compute)
+ add_library(${PROJECT_NAME}::Graph ALIAS arm_compute_graph)
+=20
+-# Library target sources.
 -add_subdirectory(src)
 -
  if(ARM_COMPUTE_BUILD_TESTING)
-   # ---------------------------------------------------------------------
-   # Validation Framework Library
+   add_library(arm_compute_validation_framework OBJECT)
+   add_subdirectory(tests)
 diff --git a/scripts/generate_build_files.py b/scripts/generate_build_file=
s.py
-index 52a8cc14da..4c4a14623f 100644
+index 913c73e991..bf0573a332 100644
 --- a/scripts/generate_build_files.py
 +++ b/scripts/generate_build_files.py
-@@ -167,27 +167,19 @@ def build_from_template_cmake(srcs_graph, srcs_sve, =
srcs_sve2, srcs_core):
-
+@@ -171,33 +171,23 @@ def build_from_template_cmake(srcs_graph, srcs_sve, =
srcs_sve2, srcs_core, srcs_c
+=20
      template =3D f"""{get_template_header()}
-
+=20
 -target_sources(
--	arm_compute_graph
--	PRIVATE
+-    arm_compute_graph
+-    PRIVATE
 +set(ARM_COMPUTE_GRAPH_SOURCES
-	{line_separator.join(srcs_graph)}
+     {line_separator.join(srcs_graph)}
  )
-
+=20
 -target_sources(
--	arm_compute_sve
--	PRIVATE
+-    arm_compute_sve
+-    PRIVATE
 +set(ARM_COMPUTE_SVE_SOURCES
-	{line_separator.join(srcs_sve)}
+     {line_separator.join(srcs_sve)}
  )
-
+=20
 -target_sources(
--	arm_compute_sve2
--	PRIVATE
+-    arm_compute_sve2
+-    PRIVATE
 +set(ARM_COMPUTE_SVE2_SOURCES
-	{line_separator.join(srcs_sve2)}
+     {line_separator.join(srcs_sve2)}
  )
-
+=20
 -target_sources(
--	arm_compute
--	PRIVATE
+-    arm_compute_core
+-    PRIVATE
 +set(ARM_COMPUTE_SOURCES
-	{line_separator.join(srcs_core)}
+     {line_separator.join(srcs_core)}
  )
- """
+=20
+-target_sources(
+-    arm_compute_core_fp16
+-    PRIVATE
++set(ARM_COMPUTE_FP16
+     {line_separator.join(srcs_core_fp16)}
+ )"""
+     return template
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index f1b275532a..73871563e1 100644
+index fe70114490..0867ba81ad 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
 @@ -20,9 +20,7 @@
  # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN THE
  # SOFTWARE.
-
+=20
 -target_sources(
--	arm_compute_graph
--	PRIVATE
+-    arm_compute_graph
+-    PRIVATE
 +set(ARM_COMPUTE_GRAPH_SOURCES
-	graph/DataLayerVisitor.cpp
-	graph/Graph.cpp
-	graph/GraphBuilder.cpp
+     graph/DataLayerVisitor.cpp
+ 	graph/Graph.cpp
+ 	graph/GraphBuilder.cpp
 @@ -100,9 +98,7 @@ target_sources(
-	graph/printers/DotGraphPrinter.cpp
+ 	graph/printers/DotGraphPrinter.cpp
  )
-
+=20
 -target_sources(
--	arm_compute_sve
--	PRIVATE
+-    arm_compute_sve
+-    PRIVATE
 +set(ARM_COMPUTE_SVE_SOURCES
-	core/NEON/kernels/arm_conv/depthwise/interleaves/sve_s8q_3x3_dot.cpp
-	core/NEON/kernels/arm_conv/depthwise/interleaves/sve_u8q_3x3_dot.cpp
-	core/NEON/kernels/arm_conv/depthwise/kernels/sme2_fp16_nhwc_3x3_s1_output=
2x2_mla_depthfirst/generic_direct.cpp
-@@ -331,9 +327,7 @@ target_sources(
-	cpu/kernels/softmax/generic/sve/impl_bf16.cpp
+     core/NEON/kernels/arm_conv/depthwise/interleaves/sve_s8q_3x3_dot.cpp
+ 	core/NEON/kernels/arm_conv/depthwise/interleaves/sve_u8q_3x3_dot.cpp
+ 	core/NEON/kernels/arm_conv/depthwise/kernels/sme2_fp16_nhwc_3x3_s1_outpu=
t2x2_mla_depthfirst/generic_direct.cpp
+@@ -341,9 +337,7 @@ target_sources(
+ 	cpu/kernels/softmax/generic/sve/impl_bf16.cpp
  )
-
+=20
 -target_sources(
--	arm_compute_sve2
--	PRIVATE
+-    arm_compute_sve2
+-    PRIVATE
 +set(ARM_COMPUTE_SVE2_SOURCES
-	cpu/kernels/activation/generic/sve2/lut.cpp
-	cpu/kernels/activation/generic/sve2/qasymm8.cpp
-	cpu/kernels/activation/generic/sve2/qasymm8_signed.cpp
-@@ -356,9 +350,7 @@ target_sources(
-	cpu/kernels/softmax/generic/sve2/impl.cpp
+     cpu/kernels/activation/generic/sve2/lut.cpp
+ 	cpu/kernels/activation/generic/sve2/qasymm8.cpp
+ 	cpu/kernels/activation/generic/sve2/qasymm8_signed.cpp
+@@ -366,9 +360,7 @@ target_sources(
+ 	cpu/kernels/softmax/generic/sve2/impl.cpp
  )
-
+=20
 -target_sources(
--	arm_compute
--	PRIVATE
+-    arm_compute_core
+-    PRIVATE
 +set(ARM_COMPUTE_SOURCES
-	c/AclContext.cpp
-	c/AclOperator.cpp
-	c/AclQueue.cpp
+     ../third_party/kleidiai/kai/ukernels/matmul/matmul_clamp_f32_f32_f32p=
/kai_matmul_clamp_f32_f32_f32p8x1biasf32_6x8x4_neon_mla.c
+ 	../third_party/kleidiai/kai/ukernels/matmul/pack/kai_rhs_pack_kxn_f32p8x=
1biasf32_f32_f32_neon.c
+ 	c/AclContext.cpp
+@@ -1000,9 +992,7 @@ target_sources(
+ 	runtime/experimental/operators/CpuWinogradConv2d.cpp
+ )
+=20
+-target_sources(
+-    arm_compute_core_fp16
+-    PRIVATE
++set(ARM_COMPUTE_FP16
+     core/NEON/kernels/arm_conv/depthwise/depthwise_fp16.cpp
+ 	core/NEON/kernels/arm_conv/depthwise/kernels/a64_fp16_nhwc_3x3_s1_output=
2x2_mla_depthfirst/generic_direct.cpp
+ 	core/NEON/kernels/arm_conv/depthwise/kernels/a64_fp16_nhwc_3x3_s1_output=
2x2_mla_depthfirst/generic_indirect.cpp
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0004-Allow-ARMv7-builds-using-CMake.patch b/meta-arago-extras/=
recipes-devtools/arm-compute-library/arm-compute-library/0004-Allow-ARMv7-b=
uilds-using-CMake.patch
new file mode 100644
index 00000000..068e78d7
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0004-Allow-ARMv7-builds-using-CMake.patch
@@ -0,0 +1,175 @@
+From ddd1ad96efbe900853b64daf94549b4e3bc5bad6 Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Wed, 4 Mar 2026 15:55:49 +0530
+Subject: [PATCH 4/8] Allow-ARMv7-builds-using-CMake
+
+Upstream-Status: Pending
+
+Authored-by: Andrew Davis <afd@ti.com>
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ CMakeLists.txt                                | 41 +++++++++++++++----
+ cmake/compilers/setup.cmake                   |  6 ++-
+ .../fixtures/CpuGemmAssemblyDispatchFixture.h |  2 +
+ 3 files changed, 38 insertions(+), 11 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fc9c88a8af..521132917d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -51,8 +51,8 @@ option(ARM_COMPUTE_USE_LIBCXX "Use libcxx instead of the=
 default stdlib." OFF)
+=20
+ # * Build mode: multi-ISA (default) or single-ISA
+ option(ACL_MULTI_ISA "Build Multi-ISA as default" ON)
+-set(ACL_ARCH_ISA "armv8.6-a" CACHE STRING "Architecture (armv8-a, armv8.2=
-a, armv8.6-a)")
+-set_property(CACHE ACL_ARCH_ISA PROPERTY STRINGS armv8-a armv8.2-a armv8.=
6-a)
++set(ACL_ARCH_ISA "armv8.6-a" CACHE STRING "Architecture (armv7, armv8-a, =
armv8.2-a, armv8.6-a)")
++set_property(CACHE ACL_ARCH_ISA PROPERTY STRINGS armv7 armv8-a armv8.2-a =
armv8.6-a)
+ set(ACL_ARCH_FEATURES "" CACHE STRING "Comma separated features list (sve=
,sve2,sme2)")
+=20
+ # * Arch features
+@@ -92,7 +92,7 @@ list(TRANSFORM ARM_COMPUTE_SVE2_SOURCES PREPEND "src/")
+ list(TRANSFORM ARM_COMPUTE_SOURCES PREPEND "src/")
+ list(TRANSFORM ARM_COMPUTE_FP16 PREPEND "src/")
+=20
+-if(ACL_ARCH_ISA STREQUAL "armv8-a" AND (ACL_MULTI_ISA OR ACL_BUILD_SVE OR=
 ACL_BUILD_SVE2 OR ACL_BUILD_SME2))
++if(ACL_ARCH_ISA STREQUAL "armv7" OR ACL_ARCH_ISA STREQUAL "armv8-a" AND (=
ACL_MULTI_ISA OR ACL_BUILD_SVE OR ACL_BUILD_SVE2 OR ACL_BUILD_SME2))
+   message(FATAL_ERROR
+     "Invalid configuration: '${ACL_ARCH_ISA}' does not support requested =
features"
+   )
+@@ -108,7 +108,7 @@ else()
+     message(STATUS "Requested features: ${ACL_ARCH_FEATURES}")
+   endif()
+   set(libs "core")
+-  if(NOT (ACL_ARCH_ISA STREQUAL "armv8-a"))
++  if(NOT (ACL_ARCH_ISA STREQUAL "armv7" OR ACL_ARCH_ISA STREQUAL "armv8-a=
"))
+     string(APPEND libs ", core_fp16")
+   endif()
+   if(ACL_BUILD_SVE)
+@@ -132,11 +132,18 @@ else()
+     set(ACL_MARCH  "+sve2+fp16+dotprod+i8mm")
+   elseif(ACL_BUILD_SVE)
+     set(ACL_MARCH "+sve+fp16+dotprod")
++  elseif(ACL_ARCH_ISA STREQUAL "armv7")
++    set(ACL_MARCH "+neon")
+   elseif(ACL_ARCH_ISA STREQUAL "armv8.2-a" OR ACL_ARCH_ISA STREQUAL "armv=
8.6-a")
+     set(ACL_MARCH "+fp16+dotprod")
+   endif()
+=20
+-  set(ARM_COMPUTE_ARCH           "-march=3D${ACL_ARCH_ISA}${ACL_MARCH}" C=
ACHE STRING "Architecture (march) for core library.")
++  # Handle armv7 -> armv7-a mapping for compiler compatibility
++  if(ACL_ARCH_ISA STREQUAL "armv7")
++    set(ARM_COMPUTE_ARCH "-march=3Darmv7-a${ACL_MARCH}" CACHE STRING "Arc=
hitecture (march) for core library.")
++  else()
++    set(ARM_COMPUTE_ARCH "-march=3D${ACL_ARCH_ISA}${ACL_MARCH}" CACHE STR=
ING "Architecture (march) for core library.")
++  endif()
+   set(ARM_COMPUTE_CORE_FP16_ARCH "-march=3D${ACL_ARCH_ISA}${ACL_MARCH}" C=
ACHE STRING "Architecture (march) for core library with fp16 support.")
+   set(ARM_COMPUTE_SVE_ARCH       "-march=3D${ACL_ARCH_ISA}${ACL_MARCH}" C=
ACHE STRING "Architecture (march) for SVE library.")
+   set(ARM_COMPUTE_SVE2_ARCH      "-march=3D${ACL_ARCH_ISA}${ACL_MARCH}" C=
ACHE STRING "Architecture (march) for SVE2 library.")
+@@ -235,7 +242,7 @@ set_target_properties(
+   LINK_LIBRARIES "${ARM_COMPUTE_LINK_LIBS}"
+ )
+=20
+-if(NOT (ACL_ARCH_ISA STREQUAL "armv8-a"))
++if(NOT (ACL_ARCH_ISA STREQUAL "armv7" OR ACL_ARCH_ISA STREQUAL "armv8-a")=
)
+   add_library(arm_compute_core_fp16 OBJECT)
+   set_target_properties(
+     arm_compute_core_fp16
+@@ -246,7 +253,7 @@ if(NOT (ACL_ARCH_ISA STREQUAL "armv8-a"))
+       LINK_LIBRARIES "${ARM_COMPUTE_LINK_LIBS}"
+   )
+ else()
+-  add_library(arm_compute_core_fp16 OBJECT EXCLUDE_FROM_ALL)
++  add_library(arm_compute_core_fp16 INTERFACE)
+ endif()
+=20
+ add_library(arm_compute_graph ${ARM_COMPUTE_LIB_BUILD_TYPE} ${ARM_COMPUTE=
_GRAPH_SOURCES})
+@@ -271,7 +278,8 @@ else()
+=20
+   if(ACL_ARCH_ISA STREQUAL "armv8-a")
+     # base
+-
++  elseif(ACL_ARCH_ISA STREQUAL "armv7")
++    # base only - no fp16, sve, or sve2 support
+   elseif(ACL_ARCH_ISA STREQUAL "armv8.2-a")
+     list(APPEND lib_objs $<TARGET_OBJECTS:arm_compute_core_fp16>)
+     if(ACL_BUILD_SVE)
+@@ -298,6 +306,15 @@ else()
+   set_target_properties(arm_compute PROPERTIES OUTPUT_NAME "arm_compute_$=
{ACL_ARCH_ISA}")
+ endif()
+=20
++if(ACL_ARCH_ISA STREQUAL "armv7")
++  target_sources(
++    arm_compute
++    PRIVATE
++      src/core/NEON/kernels/arm_gemm/kernels/a32_sgemm_8x6/a53.cpp
++      src/core/NEON/kernels/arm_gemm/kernels/a32_sgemm_8x6/a55r1.cpp
++      src/core/NEON/kernels/arm_gemm/kernels/a32_sgemm_8x6/generic.cpp)
++endif()
++
+ if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
+   target_compile_options(arm_compute_core PRIVATE -arch arm64)
+   if(TARGET arm_compute_core_fp16)
+@@ -341,6 +358,12 @@ if(ARM_COMPUTE_BUILD_TESTING)
+   add_subdirectory(tests)
+   add_executable(arm_compute_validation $<TARGET_OBJECTS:arm_compute_vali=
dation_framework>)
+   add_subdirectory(tests/validation)
++  target_include_directories(arm_compute_validation
++    PRIVATE
++      $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}>
++      $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
++      ${CMAKE_CURRENT_LIST_DIR}
++  )
+   add_executable(arm_compute_benchmark $<TARGET_OBJECTS:arm_compute_valid=
ation_framework>)
+   add_subdirectory(tests/benchmark)
+=20
+@@ -348,7 +371,7 @@ if(ARM_COMPUTE_BUILD_TESTING)
+     arm_compute_benchmark arm_compute_validation_framework arm_compute_va=
lidation
+     PROPERTIES
+     COMPILE_OPTIONS "${ARM_COMPUTE_ARCH};${ARM_COMPUTE_COMMON_CCXX_FLAGS}=
"
+-    INCLUDE_DIRECTORIES "${ARM_COMPUTE_PUBLIC_INCLUDE};${ARM_COMPUTE_COMM=
ON_INCLUDE}"
++    INCLUDE_DIRECTORIES "${ARM_COMPUTE_GRAPH_INCLUDE};${CMAKE_CURRENT_LIS=
T_DIR}/src"
+     COMPILE_DEFINITIONS "${ARM_COMPUTE_DEFINES}"
+     LINK_LIBRARIES "arm_compute;arm_compute_graph"
+=20
+diff --git a/cmake/compilers/setup.cmake b/cmake/compilers/setup.cmake
+index 642a9a2a5f..4756dc6149 100644
+--- a/cmake/compilers/setup.cmake
++++ b/cmake/compilers/setup.cmake
+@@ -68,7 +68,9 @@ if(ACL_MULTI_ISA)
+     ENABLE_SME
+   )
+ else()
+-  if(ACL_ARCH_ISA STREQUAL "armv8-a")
++  if(ACL_ARCH_ISA STREQUAL "armv7")
++    message(STATUS "Configuring for armv7, NEON enabled")
++  elseif(ACL_ARCH_ISA STREQUAL "armv8-a")
+     message(STATUS "Configuring for armv8-a, no FP16/SVE features")
+=20
+   elseif(ACL_ARCH_ISA STREQUAL "armv8.2-a")
+@@ -86,7 +88,7 @@ else()
+     )
+   else()
+     message(FATAL_ERROR
+-      "Unsupported ACL_ARCH_ISA=3D'${ACL_ARCH_ISA}'. Allowed presets: arm=
v8-a, armv8.2-a, armv8.6-a"
++      "Unsupported ACL_ARCH_ISA=3D'${ACL_ARCH_ISA}'. Allowed presets: arm=
v7, armv8-a, armv8.2-a, armv8.6-a"
+     )
+   endif()
+=20
+diff --git a/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h b/=
tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h
+index 65df3e1c0e..85c9e8c06a 100644
+--- a/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h
++++ b/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h
+@@ -28,7 +28,9 @@
+ #include "arm_compute/core/CoreTypes.h"
+ #include "arm_compute/core/experimental/Types.h"
+ #include "arm_compute/core/Helpers.h"
++#ifdef ARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS
+ #include "arm_compute/runtime/NEON/functions/NEReorderLayer.h"
++#endif ARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS
+ #include "arm_compute/runtime/NEON/functions/NETranspose.h"
+=20
+ #include "src/core/helpers/MemoryHelpers.h"
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch b/m=
eta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0=
005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
deleted file mode 100644
index 55b3d4ee..00000000
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From cdb765df59d8ce5f388ac2a820b5da76eb8d610c Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 5 Dec 2024 09:47:25 -0600
-Subject: [PATCH] Add CMake options for SVE, SVE2, and BF16 support
-
-These should be optional, add options for these. Remove the hard-coded
-definitions of these for the libraries. This also makes it so validation
-options are not needed, if SVE is enabled it will be validated.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrew Davis <afd@ti.com>
-Change-Id: I03182ac6ece843e813c027ef6a573cbba254dee9
----
- CMakeLists.txt      | 19 -------------------
- cmake/Options.cmake | 16 +++++++++++++---
- 2 files changed, 13 insertions(+), 22 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4073e06b17..4d95fb1bfd 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -149,9 +149,6 @@ add_library(arm_compute_sve OBJECT ${ARM_COMPUTE_SVE_S=
OURCES})
- target_compile_options(arm_compute_sve
-                        PRIVATE "-march=3Darmv8.2-a+sve+fp16+dotprod"
-                        PRIVATE "-fPIC")
--target_compile_definitions(arm_compute_sve PRIVATE ARM_COMPUTE_ENABLE_BF1=
6)
--target_compile_definitions(arm_compute_sve PRIVATE ENABLE_SVE)
--target_compile_definitions(arm_compute_sve PRIVATE ARM_COMPUTE_ENABLE_SVE=
)
- target_include_directories(
-   arm_compute_sve
-   PUBLIC $<INSTALL_INTERFACE:include>
-@@ -171,10 +168,6 @@ add_library(arm_compute_sve2 OBJECT ${ARM_COMPUTE_SVE=
2_SOURCES})
- target_compile_options(arm_compute_sve2
-                        PRIVATE "-march=3Darmv8.6-a+sve2+fp16+dotprod"
-                        PRIVATE "-fPIC")
--target_compile_definitions(arm_compute_sve2 PRIVATE ARM_COMPUTE_ENABLE_SV=
E2)
--target_compile_definitions(arm_compute_sve2 PRIVATE ARM_COMPUTE_ENABLE_BF=
16)
--target_compile_definitions(arm_compute_sve2 PRIVATE ENABLE_SVE)
--target_compile_definitions(arm_compute_sve2 PRIVATE ARM_COMPUTE_ENABLE_SV=
E)
- target_include_directories(
-   arm_compute_sve2
-   PUBLIC $<INSTALL_INTERFACE:include>
-@@ -193,9 +186,6 @@ target_include_directories(
-
- add_library(arm_compute ${ARM_COMPUTE_SOURCES})
- target_compile_options(arm_compute PRIVATE "-march=3D${ARM_COMPUTE_ARCH}"=
)
--target_compile_definitions(arm_compute PRIVATE ARM_COMPUTE_ENABLE_BF16)
--target_compile_definitions(arm_compute PRIVATE ENABLE_SVE)
--target_compile_definitions(arm_compute PRIVATE ARM_COMPUTE_ENABLE_SVE)
- target_include_directories(
-   arm_compute
-   PUBLIC $<INSTALL_INTERFACE:include>
-@@ -222,8 +212,6 @@ target_link_libraries(
-
- add_library(arm_compute_graph ${ARM_COMPUTE_GRAPH_SOURCES})
- target_compile_options(arm_compute_graph PRIVATE "-march=3D${ARM_COMPUTE_=
ARCH}")
--target_compile_definitions(arm_compute_graph PRIVATE ENABLE_SVE)
--target_compile_definitions(arm_compute_graph PRIVATE ARM_COMPUTE_ENABLE_S=
VE)
- # add_subdirectory(src/graph)
-
- target_include_directories(
-@@ -268,13 +256,6 @@ if(ARM_COMPUTE_BUILD_TESTING)
-
-   add_executable(arm_compute_validation "")
-   target_compile_options(arm_compute_validation PRIVATE "-march=3D${ARM_C=
OMPUTE_ARCH}")
--  if(ARM_COMPUTE_ENABLE_BF16_VALIDATION)
--    target_compile_definitions(arm_compute_validation PRIVATE ARM_COMPUTE=
_ENABLE_BF16)
--  endif()
--  if(ARM_COMPUTE_ENABLE_SVE_VALIDATION)
--    target_compile_definitions(arm_compute_validation PRIVATE ENABLE_SVE)
--    target_compile_definitions(arm_compute_validation PRIVATE ARM_COMPUTE=
_ENABLE_SVE)
--  endif()
-   add_subdirectory(tests/validation)
-   target_compile_options(arm_compute_validation PUBLIC ${COMMON_CXX_FLAGS=
})
-   set_target_properties(
-diff --git a/cmake/Options.cmake b/cmake/Options.cmake
-index 121d527718..5c23fcb490 100644
---- a/cmake/Options.cmake
-+++ b/cmake/Options.cmake
-@@ -48,11 +48,12 @@ set(ARM_COMPUTE_ARCH armv8-a CACHE STRING "Architectur=
e to use")
- # ---------------------------------------------------------------------
- # Backends
-
--option(ARM_COMPUTE_ENABLE_BF16_VALIDATION "" ON)
--option(ARM_COMPUTE_ENABLE_SVE_VALIDATION "" OFF)
--
- option(ENABLE_NEON "Enable Arm=C2=AE Neon=E2=84=A2 support" ON)
-+option(ENABLE_SVE "Enable Arm=C2=AE SVE support" ON)
-+option(ENABLE_SVE2 "Enable Arm=C2=AE SVE2 support" ON)
-+
- option(ARM_COMPUTE_CPU_ENABLED "" ON)
-+option(ARM_COMPUTE_ENABLE_BF16 "" ON)
- option(ARM_COMPUTE_ENABLE_I8MM "" ON)
- option(ENABLE_FP32_KERNELS "" ON)
- option(ENABLE_QASYMM8_KERNELS "" ON)
-@@ -74,6 +75,15 @@ endif()
- if(ARM_COMPUTE_CPU_ENABLED)
-   add_definitions(-DARM_COMPUTE_CPU_ENABLED)
- endif()
-+if(ENABLE_SVE)
-+  add_definitions(-DARM_COMPUTE_ENABLE_SVE)
-+endif()
-+if(ENABLE_SVE2)
-+  add_definitions(-DARM_COMPUTE_ENABLE_SVE2)
-+endif()
-+if(ARM_COMPUTE_ENABLE_BF16)
-+  add_definitions(-DARM_COMPUTE_ENABLE_BF16)
-+endif()
- if(ARM_COMPUTE_ENABLE_FP16)
-   add_definitions(-DARM_COMPUTE_ENABLE_FP16)
- endif()
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch=
 b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch
similarity index 67%
rename from meta-arago-extras/recipes-devtools/arm-compute-library/arm-comp=
ute-library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
rename to meta-arago-extras/recipes-devtools/arm-compute-library/arm-comput=
e-library/0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch
index b1be6a76..0c9cfe01 100644
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch
@@ -1,22 +1,22 @@
-From 58698788adaeb2f74cf9fcddf06f3e9a2e78b984 Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Mon, 16 Dec 2024 09:42:22 -0600
-Subject: [PATCH] Fix undefined symbol error when building TensorInfo
+From 5b2cac4c7261b0313bef70248213a952a2cd96fa Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Wed, 4 Mar 2026 15:58:06 +0530
+Subject: [PATCH 5/8] Fix undefined symbol error when building TensorInfo
=20
 Upstream-Status: Pending
=20
-Signed-off-by: Andrew Davis <afd@ti.com>
-Change-Id: I657d1b7faaad94147c685c4826916d3c21da82e1
+Authored-by: Andrew Davis <afd@ti.com>
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
 ---
  arm_compute/core/TensorInfo.h | 5 +----
  src/core/TensorInfo.cpp       | 5 +++++
  2 files changed, 6 insertions(+), 4 deletions(-)
=20
 diff --git a/arm_compute/core/TensorInfo.h b/arm_compute/core/TensorInfo.h
-index e4c9cbe879..2bfe83c4b1 100644
+index 629139fddd..a49e7b4099 100644
 --- a/arm_compute/core/TensorInfo.h
 +++ b/arm_compute/core/TensorInfo.h
-@@ -242,10 +242,7 @@ public:
+@@ -246,10 +246,7 @@ public:
      {
          return _num_channels;
      }
@@ -29,13 +29,13 @@ index e4c9cbe879..2bfe83c4b1 100644
      {
          return _dims_state;
 diff --git a/src/core/TensorInfo.cpp b/src/core/TensorInfo.cpp
-index 31bddbde40..884203fd7c 100644
+index 36e2772514..ea3afdc9db 100644
 --- a/src/core/TensorInfo.cpp
 +++ b/src/core/TensorInfo.cpp
-@@ -395,6 +395,11 @@ ITensorInfo &TensorInfo::set_tensor_dims_state(const =
TensorDimsState &state)
+@@ -406,6 +406,11 @@ ITensorInfo &TensorInfo::set_tensor_dims_state(const =
TensorDimsState &state)
      return *this;
  }
-
+=20
 +const TensorShape &TensorInfo::tensor_shape() const
 +{
 +    return _tensor_shape;
@@ -44,3 +44,6 @@ index 31bddbde40..884203fd7c 100644
  ITensorInfo &TensorInfo::set_quantization_info(const QuantizationInfo &qu=
antization_info)
  {
      _quantization_info =3D quantization_info;
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch =
b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-librar=
y/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
deleted file mode 100644
index fc135a18..00000000
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From ab5bf5b8f86337a31bfd48277650f583a040e658 Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 5 Dec 2024 09:59:48 -0600
-Subject: [PATCH] Allow SVE and SVE2 support to be disabled in CMake
-
-Currently these are hard-coded as enabled. The SVE and SVE2 libraries
-are built unconditionally. These should only be built when SVE or
-SVE2 is available.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrew Davis <afd@ti.com>
-Change-Id: I176259f872a84f736028622694d65d4c5b57e379
----
- CMakeLists.txt | 25 ++++++++++++++++++-------
- 1 file changed, 18 insertions(+), 7 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4d95fb1bfd..d233d6bc67 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -145,6 +145,7 @@ endif()
-
- # ---------------------------------------------------------------------
- # SVE Object Library
-+if(ENABLE_SVE)
- add_library(arm_compute_sve OBJECT ${ARM_COMPUTE_SVE_SOURCES})
- target_compile_options(arm_compute_sve
-                        PRIVATE "-march=3Darmv8.2-a+sve+fp16+dotprod"
-@@ -161,9 +162,11 @@ target_include_directories(
-          src/core/cpu/kernels/assembly
-          src/cpu/kernels/assembly
-          src/core/NEON/kernels/arm_gemm/merges)
-+endif() # ENABLE_SVE
-
- # ---------------------------------------------------------------------
- # SVE2 Object Library
-+if(ENABLE_SVE2)
- add_library(arm_compute_sve2 OBJECT ${ARM_COMPUTE_SVE2_SOURCES})
- target_compile_options(arm_compute_sve2
-                        PRIVATE "-march=3Darmv8.6-a+sve2+fp16+dotprod"
-@@ -180,6 +183,7 @@ target_include_directories(
-          src/core/cpu/kernels/assembly
-          src/cpu/kernels/assembly
-          src/core/NEON/kernels/arm_gemm/merges)
-+endif() # ENABLE_SVE2
-
- # ---------------------------------------------------------------------
- # Core Library
-@@ -203,9 +207,12 @@ target_compile_options(arm_compute PUBLIC ${COMMON_CX=
X_FLAGS})
- add_library(ArmCompute::Core ALIAS arm_compute)
-
- # arm_compute_sve and arm_compute_sve2 obj files will not be public in th=
e arm_compute.so
--target_link_libraries(
--  arm_compute PRIVATE $<TARGET_OBJECTS:arm_compute_sve>
--              PRIVATE $<TARGET_OBJECTS:arm_compute_sve2>)
-+if(ENABLE_SVE)
-+  target_link_libraries(arm_compute PRIVATE $<TARGET_OBJECTS:arm_compute_=
sve>)
-+endif()
-+if(ENABLE_SVE2)
-+  target_link_libraries(arm_compute PRIVATE $<TARGET_OBJECTS:arm_compute_=
sve2>)
-+endif()
-
- # ---------------------------------------------------------------------
- # Graph Library
-@@ -263,8 +270,10 @@ if(ARM_COMPUTE_BUILD_TESTING)
-                                       "${CMAKE_BINARY_DIR}/validation")
-   target_link_libraries(
-     arm_compute_validation
--    PUBLIC arm_compute arm_compute_graph arm_compute_validation_framework
--           arm_compute_sve)
-+    PUBLIC arm_compute arm_compute_graph arm_compute_validation_framework=
)
-+    if(ENABLE_SVE)
-+      target_link_libraries(arm_compute_validation PUBLIC arm_compute_sve=
)
-+    endif()
-   target_link_directories(arm_compute_validation PUBLIC tests)
-
-   # ---------------------------------------------------------------------
-@@ -299,8 +308,10 @@ if(ARM_COMPUTE_BUILD_EXAMPLES)
-     set_target_properties(
-       ${test_name} PROPERTIES RUNTIME_OUTPUT_DIRECTORY
-                               "${CMAKE_BINARY_DIR}/examples")
--    target_link_libraries(${test_name} PUBLIC arm_compute
--                                              arm_compute_graph arm_compu=
te_sve)
-+    target_link_libraries(${test_name} PUBLIC arm_compute arm_compute_gra=
ph)
-+    if(ENABLE_SVE)
-+      target_link_libraries(${test_name} PUBLIC arm_compute_sve)
-+    endif()
-   endforeach()
-
-   # NEON Examples
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0006-Remove-TARGET-dependency.patch b/meta-arago-extras/recipe=
s-devtools/arm-compute-library/arm-compute-library/0006-Remove-TARGET-depen=
dency.patch
new file mode 100644
index 00000000..e508b6e2
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0006-Remove-TARGET-dependency.patch
@@ -0,0 +1,58 @@
+From d10cbce3985b70270a61cb96a12768ce9adfea1e Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Wed, 4 Mar 2026 16:02:44 +0530
+Subject: [PATCH 6/8] Remove TARGET dependency
+
+Upstream-Status: Pending
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ CMakeLists.txt | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 521132917d..87bf38781b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -215,7 +215,7 @@ if(ACL_MULTI_ISA OR ACL_BUILD_SVE)
+       LINK_LIBRARIES "${ARM_COMPUTE_LINK_LIBS}"
+   )
+ else()
+-  add_library(arm_compute_sve OBJECT EXCLUDE_FROM_ALL)
++  add_library(arm_compute_sve INTERFACE)
+ endif()
+=20
+ if(ACL_MULTI_ISA OR ACL_BUILD_SVE2)
+@@ -229,7 +229,7 @@ if(ACL_MULTI_ISA OR ACL_BUILD_SVE2)
+       LINK_LIBRARIES "${ARM_COMPUTE_LINK_LIBS}"
+   )
+ else()
+-  add_library(arm_compute_sve2 OBJECT EXCLUDE_FROM_ALL)
++  add_library(arm_compute_sve2 INTERFACE)
+ endif()
+=20
+ add_library(arm_compute_core OBJECT ${ARM_COMPUTE_SOURCES})
+@@ -243,7 +243,7 @@ set_target_properties(
+ )
+=20
+ if(NOT (ACL_ARCH_ISA STREQUAL "armv7" OR ACL_ARCH_ISA STREQUAL "armv8-a")=
)
+-  add_library(arm_compute_core_fp16 OBJECT)
++  add_library(arm_compute_core_fp16 OBJECT )
+   set_target_properties(
+     arm_compute_core_fp16
+     PROPERTIES
+@@ -253,7 +253,10 @@ if(NOT (ACL_ARCH_ISA STREQUAL "armv7" OR ACL_ARCH_ISA=
 STREQUAL "armv8-a"))
+       LINK_LIBRARIES "${ARM_COMPUTE_LINK_LIBS}"
+   )
+ else()
+-  add_library(arm_compute_core_fp16 INTERFACE)
++  # For armv7 and armv8-a: create library with sources if they exist
++  if(ARM_COMPUTE_CORE_FP16_SOURCES)
++    add_library(arm_compute_core_fp16 OBJECT ${ARM_COMPUTE_CORE_FP16_SOUR=
CES})
++  endif()
+ endif()
+=20
+ add_library(arm_compute_graph ${ARM_COMPUTE_LIB_BUILD_TYPE} ${ARM_COMPUTE=
_GRAPH_SOURCES})
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0007-Allow-ARMv7-builds-using-CMake.patch b/meta-arago-extras/=
recipes-devtools/arm-compute-library/arm-compute-library/0007-Allow-ARMv7-b=
uilds-using-CMake.patch
deleted file mode 100644
index 1ff36d16..00000000
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0007-Allow-ARMv7-builds-using-CMake.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 416cffe2a75a4ec66a75e00bc00297f2f0187e0f Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 5 Dec 2024 10:05:03 -0600
-Subject: [PATCH] Allow ARMv7 builds using CMake
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrew Davis <afd@ti.com>
-Change-Id: Ib6bae5820569a8eadd53afdfe31e611a3089140e
----
- CMakeLists.txt                                | 25 +++++++++++++++++--
- .../fixtures/CpuGemmAssemblyDispatchFixture.h |  3 +++
- 2 files changed, 26 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d233d6bc67..4fc27553f3 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -148,7 +148,7 @@ endif()
- if(ENABLE_SVE)
- add_library(arm_compute_sve OBJECT ${ARM_COMPUTE_SVE_SOURCES})
- target_compile_options(arm_compute_sve
--                       PRIVATE "-march=3Darmv8.2-a+sve+fp16+dotprod"
-+                       PRIVATE "-march=3D${ARM_COMPUTE_ARCH}"
-                        PRIVATE "-fPIC")
- target_include_directories(
-   arm_compute_sve
-@@ -169,7 +169,7 @@ endif() # ENABLE_SVE
- if(ENABLE_SVE2)
- add_library(arm_compute_sve2 OBJECT ${ARM_COMPUTE_SVE2_SOURCES})
- target_compile_options(arm_compute_sve2
--                       PRIVATE "-march=3Darmv8.6-a+sve2+fp16+dotprod"
-+                       PRIVATE "-march=3D${ARM_COMPUTE_ARCH}"
-                        PRIVATE "-fPIC")
- target_include_directories(
-   arm_compute_sve2
-@@ -204,6 +204,15 @@ target_include_directories(
-           src/core/NEON/kernels/convolution/winograd)
- target_compile_options(arm_compute PUBLIC ${COMMON_CXX_FLAGS})
-
-+if(ARM_COMPUTE_ARCH MATCHES "armv7")
-+  target_sources(
-+    arm_compute
-+    PRIVATE
-+      src/core/NEON/kernels/arm_gemm/kernels/a32_sgemm_8x6/a53.cpp
-+      src/core/NEON/kernels/arm_gemm/kernels/a32_sgemm_8x6/a55r1.cpp
-+      src/core/NEON/kernels/arm_gemm/kernels/a32_sgemm_8x6/generic.cpp)
-+endif()
-+
- add_library(ArmCompute::Core ALIAS arm_compute)
-
- # arm_compute_sve and arm_compute_sve2 obj files will not be public in th=
e arm_compute.so
-@@ -264,6 +273,18 @@ if(ARM_COMPUTE_BUILD_TESTING)
-   add_executable(arm_compute_validation "")
-   target_compile_options(arm_compute_validation PRIVATE "-march=3D${ARM_C=
OMPUTE_ARCH}")
-   add_subdirectory(tests/validation)
-+  target_include_directories(
-+    arm_compute_validation
-+    PUBLIC $<INSTALL_INTERFACE:include>
-+          $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-+          ${CMAKE_CURRENT_SOURCE_DIR}
-+    PRIVATE src
-+          src/cpu/kernels/assembly
-+          src/core/NEON/kernels/arm_gemm
-+          src/core/NEON/kernels/assembly
-+          src/core/NEON/kernels/convolution/common
-+          src/core/NEON/kernels/arm_conv/depthwise
-+          src/core/NEON/kernels/convolution/winograd)
-   target_compile_options(arm_compute_validation PUBLIC ${COMMON_CXX_FLAGS=
})
-   set_target_properties(
-     arm_compute_validation PROPERTIES RUNTIME_OUTPUT_DIRECTORY
-diff --git a/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h b/=
tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h
-index 5d74e210d5..0b45cdf356 100644
---- a/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h
-+++ b/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h
-@@ -25,7 +25,10 @@
- #define ACL_TESTS_VALIDATION_FIXTURES_CPUGEMMASSEMBLYDISPATCHFIXTURE_H
-
- #include "arm_compute/core/Helpers.h"
-+
-+#ifdef ARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS
- #include "arm_compute/runtime/NEON/functions/NEReorderLayer.h"
-+#endif //ARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS
- #include "arm_compute/runtime/NEON/functions/NETranspose.h"
-
- #include "src/core/NEON/kernels/arm_gemm/utils.hpp"
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0007-cmake-Generate-generic-library-name-instead-of.patch b/me=
ta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/00=
07-cmake-Generate-generic-library-name-instead-of.patch
new file mode 100644
index 00000000..6da1dc6b
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0007-cmake-Generate-generic-library-name-instead-of.patch
@@ -0,0 +1,33 @@
+From 7dea25d8e77a66a6f867027c1d78d4940d28b09e Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Wed, 4 Mar 2026 16:04:25 +0530
+Subject: [PATCH 7/8] cmake: Generate generic library name instead of
+ architecture-specific
+
+Generate libarm_compute.so instead of libarm_compute_${ACL_ARCH_ISA}.so
+to improve compatibility with downstream projects that expect the
+generic library name.
+
+Upstream-Status: Pending
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 87bf38781b..2df5622d47 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -306,7 +306,7 @@ else()
+   endif()
+=20
+   add_library(arm_compute ${ARM_COMPUTE_LIB_BUILD_TYPE} ${lib_objs})
+-  set_target_properties(arm_compute PROPERTIES OUTPUT_NAME "arm_compute_$=
{ACL_ARCH_ISA}")
++  set_target_properties(arm_compute PROPERTIES OUTPUT_NAME "arm_compute")
+ endif()
+=20
+ if(ACL_ARCH_ISA STREQUAL "armv7")
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library/0008-Add-FP16-source-path.patch b/meta-arago-extras/recipes-de=
vtools/arm-compute-library/arm-compute-library/0008-Add-FP16-source-path.pa=
tch
new file mode 100644
index 00000000..19a41eac
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0008-Add-FP16-source-path.patch
@@ -0,0 +1,28 @@
+From d22f14236ca6217b10ce64e64bdf91038234cfb3 Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Wed, 4 Mar 2026 16:06:24 +0530
+Subject: [PATCH 8/8] Add FP16 source path
+
+Upstream-Status: Pending
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2df5622d47..a09bb27387 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -243,7 +243,7 @@ set_target_properties(
+ )
+=20
+ if(NOT (ACL_ARCH_ISA STREQUAL "armv7" OR ACL_ARCH_ISA STREQUAL "armv8-a")=
)
+-  add_library(arm_compute_core_fp16 OBJECT )
++  add_library(arm_compute_core_fp16 OBJECT ${ARM_COMPUTE_CORE_FP16_SOURCE=
S})
+   set_target_properties(
+     arm_compute_core_fp16
+     PROPERTIES
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-com=
pute-library_24.12.bb b/meta-arago-extras/recipes-devtools/arm-compute-libr=
ary/arm-compute-library_52.7.0.bb
similarity index 58%
rename from meta-arago-extras/recipes-devtools/arm-compute-library/arm-comp=
ute-library_24.12.bb
rename to meta-arago-extras/recipes-devtools/arm-compute-library/arm-comput=
e-library_52.7.0.bb
index 42e2f343..02155d20 100644
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary_24.12.bb
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary_52.7.0.bb
@@ -1,20 +1,20 @@
 SUMMARY =3D "The ARM Computer Vision and Machine Learning library"
 DESCRIPTION =3D "The ARM Computer Vision and Machine Learning library is a=
 set of functions optimised for both ARM CPUs and GPUs."
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSES/MIT.txt;md5=3D35f8944fae972976691f34=
83b0ac9dba"
+LIC_FILES_CHKSUM =3D "file://LICENSES/MIT.txt;md5=3D3912d958d00bac4a6b550f=
75d7c806bb"
=20
 SRC_URI =3D " \
-    git://github.com/ARM-software/ComputeLibrary.git;branch=3Darchived-rel=
eases;protocol=3Dhttps \
-    file://0001-fix-Fix-indention-in-cmake-generator-script.patch \
-    file://0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch=
 \
-    file://0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch=
 \
-    file://0004-Add-source-files-at-library-definition-time.patch \
-    file://0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch \
-    file://0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch \
-    file://0007-Allow-ARMv7-builds-using-CMake.patch \
-    file://0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch =
\
+    git://github.com/ARM-software/ComputeLibrary.git;branch=3Dreleases/arm=
_compute_52_7_0;protocol=3Dhttps \
+    file://0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch=
 \
+    file://0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch =
\
+    file://0003-Add-source-files-at-library-definition-time.patch \
+    file://0004-Allow-ARMv7-builds-using-CMake.patch \
+    file://0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch =
\
+    file://0006-Remove-TARGET-dependency.patch \
+    file://0007-cmake-Generate-generic-library-name-instead-of.patch \
+    file://0008-Add-FP16-source-path.patch \
 "
-SRCREV =3D "32bcced2af7feea6969dd1d22e58d0718dc488e3"
+SRCREV =3D "c9a1fff898abd5109b759e8e16616519dc758fdd"
=20
 # Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE =3D "(^$)"
@@ -33,17 +33,26 @@ PACKAGECONFIG[cppthreads] =3D "-DARM_COMPUTE_CPPTHREADS=
=3DON,-DARM_COMPUTE_CPPTHREAD
 PACKAGECONFIG[openmp] =3D "-DARM_COMPUTE_OPENMP=3DON,-DARM_COMPUTE_OPENMP=
=3DOFF"
=20
 EXTRA_OECMAKE:append:aarch64 =3D " \
-	-DARM_COMPUTE_ARCH=3Darmv8-a \
-	-DENABLE_NEON=3DON \
-	-DENABLE_SVE=3DOFF \
-	-DENABLE_SVE2=3DOFF \
+	-DACL_MULTI_ISA=3DOFF \
+	-DACL_ARCH_ISA=3Darmv8-a \
+	-DACL_BUILD_SVE=3DOFF \
+	-DACL_BUILD_SVE2=3DOFF \
+	-DCMAKE_BUILD_TYPE=3DRelease \
+	-DARM_COMPUTE_ENABLE_BF16=3DOFF \
+	-DARM_COMPUTE_ENABLE_FP16=3DOFF \
+	-DARM_COMPUTE_ENABLE_I8MM=3DOFF \
+	-DARM_COMPUTE_ASSERTS_ENABLED=3DON \
+	-DARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS=3DOFF \
 "
 EXTRA_OECMAKE:append:arm =3D " \
-	-DARM_COMPUTE_ARCH=3Darmv7-a \
-	-DENABLE_NEON=3DON \
-	-DENABLE_SVE=3DOFF \
-	-DENABLE_SVE2=3DOFF \
+	-DACL_MULTI_ISA=3DOFF \
+	-DACL_ARCH_ISA=3Darmv7 \
+	-DACL_BUILD_SVE=3DOFF \
+	-DACL_BUILD_SVE2=3DOFF \
+	-DCMAKE_BUILD_TYPE=3DRelease \
 	-DARM_COMPUTE_ENABLE_BF16=3DOFF \
+	-DARM_COMPUTE_ENABLE_FP16=3DOFF \
+	-DARM_COMPUTE_ASSERTS_ENABLED=3DON \
 	-DARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS=3DOFF \
 "
=20
@@ -80,8 +89,15 @@ do_install:append() {
 			install -m 0555 $example ${D}${bindir}/${PN}-${PV}/examples
 		done
 	fi
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'true', 'false', d)}; t=
hen
+		install -d ${D}${bindir}/${PN}-${PV}/tests
+		# Copy the validation and benchmark binaries from the build directory
+		install -m 0555 ${B}/arm_compute_validation ${D}${bindir}/${PN}-${PV}/te=
sts
+		install -m 0555 ${B}/arm_compute_benchmark ${D}${bindir}/${PN}-${PV}/tes=
ts
+	fi
 }
=20
 PACKAGES =3D+ "${PN}-tests ${PN}-examples"
-FILES:${PN}-tests +=3D "${libdir}/tests"
+FILES:${PN}-tests +=3D "${bindir}/*/tests"
 FILES:${PN}-examples +=3D "${bindir}/*/examples"
--=20
2.34.1


