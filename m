Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12B6F47CBC
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:31:37 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52694.1772739095481749143
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 11:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ns8y/UlX;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.32, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCEkkDRYItDYa7N5+33MFQTIzuXFN99+0VN/zsgFLLlr0GCiXgVxt/bV7tLR9f2Rr6gRgkVIDn01EGO8Fz4R6wnzr1rZ/WS78+gp2mCIveIsldCHHhD5Yi3o3GzOJJ4N4ugLqPfLUq7yw5lQmsY3TVh+2ay0PYaouzHrvIuiQ/ab93T3Iz/EMCHlXIbnl5tZCZAFDJxsM75/9XhMJR1csynZt8mjsK+OhUdnzvQlr1Qw18eG0s37+Wo1Y22MKyqU4SJGeBPD0x+FAobY7GV97jc4M8TDIx2bVKu8g/3HhzsnY9v4V2m7LYEm8TSExmjuSPg50rX6+E1CtdRUC9es4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bR+xHknJLQFIgln9o1ZwKl6FO+STiIsXOUzs14R5bcY=;
 b=n8bDoPY6PzZ6Jla46f+/dLIcj9jilVlSTAxgaExqhG6nZShE9nxasKDnUWunCL5cr5ZQi3Bvg0rFlNbOGsVSHeaG6PErQePKZE13DfP629AaGsXExmlDMNxdk61BT3c1vSMabGrGHGIvfncAPK58o2fpxIegSi67UQFk0WWjvWzXj5EcsETa++4STLuQiyaW6UruH8y2skWNHuMZlVmqKibWTXA8CILJO49Tt0Ph1SQX+L3ubhFbAFvffmWs8mjRLSfL3JbLiD0YvmrHorI/RXbw/9RK32XrWlhAX7+x448q5VgMes64fT+mbcS3w9tEGyZCkWo9DhcIXf4Xd2qP4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bR+xHknJLQFIgln9o1ZwKl6FO+STiIsXOUzs14R5bcY=;
 b=ns8y/UlXcyZGgQUeLL+h3Yuzw+xYmxi5jYrhU+uUGuCiIen8oiz7OO1tSWr1NHnEgPL+YMVZIGKim8oKL87kCw/223eh3+u3TGcdPeatXU4fd9XPspcLtA2bYSdUMmwcSLoCxV+ChBDQAGOKLOQvEglnpS83X71iiB5NJJcWqv8=
Received: from SJ0PR05CA0103.namprd05.prod.outlook.com (2603:10b6:a03:334::18)
 by LV0PR10MB997612.namprd10.prod.outlook.com (2603:10b6:408:33e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 19:31:32 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::4e) by SJ0PR05CA0103.outlook.office365.com
 (2603:10b6:a03:334::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.13 via Frontend Transport; Thu,
 5 Mar 2026 19:31:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:31:32 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:31:29 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:31:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:31:29 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JVQ2x2427052;
	Thu, 5 Mar 2026 13:31:27 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v3 0/4]Migrate GP AI Stacks
Date: Fri, 6 Mar 2026 01:01:21 +0530
Message-ID: <20260305193125.2045659-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|LV0PR10MB997612:EE_
X-MS-Office365-Filtering-Correlation-Id: 98faccc0-ab31-4b96-a49f-08de7aedce5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|34020700016;
X-Microsoft-Antispam-Message-Info: 
	dHdFx26MKFvCp07U4bbYtaqsqmeFp6qz7PGqtUXjZnacbrwQcw27NZKwDcRtctaP2hLaDuaxa1rrMRVG8u7CWXIfzvOedYVj9GtHlkgsUEIgwhfi72pncs0ovihikvLVX91Zq5JwbAJ/RaIDBqeheHPoQAVZWcdekrDTjf+e8U4jq7ECMuu08gyt7OPFUXXpzoj1FWvgrJxGy92IQMFQ3ezfIpY8wTTPd9qCVoEWzruFh2vzfKk/659ehL7dvuQKUcAA0tBDpYttEL1/QWyB1Q19eZSeEelzEiggSE9zNkXFQVpZs1vkmy68GxeP0vzcwBwrYQu9dBT1pOgKsuLH28T/7diI4zAhSAm0cMwZI0zyllbZfSz43MPQO/FK1B0ga47Gv4GwUwZVe9quF419rx3Pg9H6Ib2JNpdLNZ08a00Qkm61PWNfvy92whwYz0btRMtuiJdeIKm7kJEG4spUdW2HPXh8gXpIHR0UEudjQQqhm0cLd5UBwRucHmv92PbggRJOh8yBxsTEmDCluQ2IluWSL40jMZl7rRKwACY7dCWXz+v1IX/KfsYA0euTjGKYrN7wF1qkuICBTClp6WMayEdZw0io7cps9cv+WeYzwgdbPImc18F4xF2mJ/grYr4wZlOST9Cbq8QcIHN0lXuwUcf/kHZ8A1XgN2Tnes802pPXcqzRDHZHs8sgeugHSi31jiy6RCAwgh2ibzQXwLz5u+3iyCP7rNhE5BtV6WaSAxs=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mrpyjcbknbezdXIioYw+8IAGpO35WR2yIGFutkIv20PZLK54tXwd0CyvszdhPQgQK8khHnVr4bZYr8RX0W8fLVrpApxeDAgSjtkxSDcrIu28GHmrzsgE1CkujjazzvRoFIQ+yBbfqOn9jta2Q0mdWyzuuWEHL7/bgrA/k5E0gx+ZJCPzstrON2nghrSVs0mqF485XMneA3OwoY8uNRuHhuHlkqEZf78EJmiJORCrMbykMvEBikhA8p0Rx2brFgAPSk+cJYIWvNkh52vG1YLi7LCSo3Fzd6vur/jX50OEs9hT5kxMYcPJt2rKbT1kvcC7N/jXyECoDrmYYsU4W1hSETEYSE+aLMs4QX+zBgJpqX3m2NTHYy+QnMz13m5K+zO3PEydyyOkGsjS5j32Vi4PiahyByM431HMG2n5mi+7BvjwilI/ARLsdmDL04iGn7Z/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:31:32.0159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98faccc0-ab31-4b96-a49f-08de7aedce5f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997612
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 19:31:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17257

Hello Team,

This patch series provides an upgrade of the ML framework
stack in meta-arago, bringing all components to their latest stable
versions. The upgrades are ordered by dependency hierarchy to ensure
proper build compatibility:

1. ARM Compute Library: v24.12 =E2=86=92 v52.07
2. ARM NN: v24.11 =E2=86=92 v26.01
3. TensorFlow Lite: v2.18.0 =E2=86=92 v2.20.0
4. nnstreamer: v2.4.4 =E2=86=92 v2.6.0

### Benchmarking Results:

 - arm-compute-library
   - https://gist.github.com/PrathamTI/7031b8646dec1887f8375fc886a5321d
   - https://gist.github.com/PrathamTI/d051afea17832175bdce65907b2d07a1
=20
 - tensorflow-lite
   - With XNNPack Enabled=20
     - https://gist.github.com/PrathamTI/54978841a77c58fbd4ca567f03e890df
   - With XNNPack Disabled=20
     - https://gist.github.com/PrathamTI/096ce1ed02d5577a7f44bc1c7f6b2569

 - nnstreamer
   - https://gist.github.com/PrathamTI/fe06aacff9ad69f5e7c6ca6c04de1808


Pratham Deshmukh (4):
  arm-compute-library: upgrade 24.12 -> 52.07
  armnn: upgrade v24.11 to v26.01
  tensorflow-lite: upgrade 2.18.0 -> 2.20.0
  nnstreamer: upgrade 2.4.4 -> 2.6.0

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
 ...01-Fix-type-casting-for-32bit-builds.patch |  40 ---
 .../armnn/{armnn_24.11.bb =3D> armnn_26.01.bb}  |  10 +-
 .../flatbuffers/flatbuffers-arago.inc         |   8 +
 .../flatbuffers/flatbuffers.bbappend          |   4 +
 .../protobuf/protobuf-arago.inc               |  18 ++
 .../protobuf/protobuf_%.bbappend              |   5 +
 ...0001-Update-CMakeLists-for-building.patch} |  20 +-
 ...akeLists-for-building-shared-object.patch} |  54 ++--
 ...uild-issues-observed-in-TFlite-v2.18.patch |  35 ---
 ...te_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} |  51 ++--
 ...nstreamer_2.4.4.bb =3D> nnstreamer_2.6.0.bb} |   2 +-
 24 files changed, 671 insertions(+), 808 deletions(-)
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
 delete mode 100644 meta-arago-extras/recipes-devtools/armnn/armnn/0001-Fix=
-type-casting-for-32bit-builds.patch
 rename meta-arago-extras/recipes-devtools/armnn/{armnn_24.11.bb =3D> armnn=
_26.01.bb} (88%)
 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuff=
ers-arago.inc
 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuff=
ers.bbappend
 create mode 100644 meta-arago-extras/recipes-devtools/protobuf/protobuf-ar=
ago.inc
 create mode 100644 meta-arago-extras/recipes-devtools/protobuf/protobuf_%.=
bbappend
 rename meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite=
/{0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch =3D> 0001=
-Update-CMakeLists-for-building.patch} (70%)
 rename meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite=
/{0002-lite-Update-CMakeLists-for-building-shared-object-li.patch =3D> 0002=
-Update-CMakeLists-for-building-shared-object.patch} (49%)
 delete mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/ten=
sorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patc=
h
 rename meta-arago-extras/recipes-framework/tensorflow-lite/{tensorflow-lit=
e_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} (84%)
 rename meta-arago-extras/recipes-multimedia/nnstreamer/{nnstreamer_2.4.4.b=
b =3D> nnstreamer_2.6.0.bb} (97%)

--=20
2.34.1


