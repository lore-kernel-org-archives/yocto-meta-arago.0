Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11EFD1067039
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:20:12 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22663.1773325202549457269
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 07:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Tnk0LJvs;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.24, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWjuPsCL/iitlsaoFhrUqC+mUx1IQSdvT/ivGIOz1o1Sqnf7lIR0M9CztceeR+ZLlLqYv2qZ0hjcMpwEP9b+Sc3Tbea40uKMBMyJnmei7/SNbL0AdFEuu5cHaFA4jHtaHTXolZK0b1tlWyTxK5EPZEpojtbM683Ebtz4jUN8QmKC5OtRuzOeUC9cO0XJ5BGQZf+U/b7Mo/bMQ/yMms7oBHSU5g2m/ZKtO43shnptoiegU57lYyZ5nhDGpZCTaYw5m9Uri4qPa97mg3eGlk4fJXQC8NAGEaj7NRXhvrqFIhFcAe7WBgafCJS+ewa/30TDa7RVEbf0VscPmbKWZlCpgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTTKZjUFTEQbCsW30qQmmVYWZfsJRFO+cpUEPjavzkQ=;
 b=OZCanWn8dcBy8A0dKt4ryJdZI/mtQFEml5+MuHo4Q2WNicVIGxMk5XOMWgksVTPHndo0timWQt6gR1mLvwdzjXnpxRcgK1nK4G6yS1m0LckZJxMoi1sGCUMhniLtYGKUpiJs8FWZM9Jk13pnX1CvrB9vKJkKM27qSero2hwPlfeTGKqQseNE3DtA5Q6pDaB3bGKliM2MJwjvFZXeElVrzmVZed+AsfaH5xRdTv5lZKOpYdF/d08zwE2AwbzlaSrgV6sQ/deqqYfBgUV1jcTcwz7AkNcL2DcZfAbJ3ql372iyBdPX8sI76aeYIpis7TrTdJmjTgq/w2i/C54qF7OGJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTTKZjUFTEQbCsW30qQmmVYWZfsJRFO+cpUEPjavzkQ=;
 b=Tnk0LJvsZ88OO8jmWlkyGgRJy18ZCRTWsdZqua+lYIYIzwxwk2rWQoEj6QfIaU96zc5WfByVWE627oRBavLimApoxC0eumlNzCUvupoISISnUiuEOi3BMVBYeKsp3qYMoLZQgQvjBIltGc4P0jDBq9NN/M/vyyS1G7ZhpnTPVwU=
Received: from SA1PR05CA0005.namprd05.prod.outlook.com (2603:10b6:806:2d2::7)
 by SA2PR10MB4444.namprd10.prod.outlook.com (2603:10b6:806:11f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 14:19:59 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:2d2:cafe::ea) by SA1PR05CA0005.outlook.office365.com
 (2603:10b6:806:2d2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.8 via Frontend Transport; Thu,
 12 Mar 2026 14:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 14:19:58 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 09:19:58 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 09:19:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 09:19:58 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CEJo1a2964016;
	Thu, 12 Mar 2026 09:19:56 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH 1/1] tensorflow-lite: fix undefined Abseil logging symbols in shared library
Date: Thu, 12 Mar 2026 19:49:48 +0530
Message-ID: <20260312141948.1002945-2-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312141948.1002945-1-p-deshmukh@ti.com>
References: <20260312141948.1002945-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|SA2PR10MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b26073-ade4-4845-9f6e-08de80427147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	LhPFrqf0YupHp8TaS0ZaQ81tba6JETGkKMu43fbRXw1SKX8HlOUC+RrhuLsnrXeb+XesFwjpt5e0c8uJGpHGvk8ujVYmUHrVgbcj24hk1RyxU1bzj6TmRPeO+p/NZ5syPqxwOtR5mlGjNNCQLPpQKyKZ4KEWgSLMzsS8L8tTOGCoLGB3XxwCWSrCMVxtG12X3qR1/y6Scdd1skiTiYCp2adYRzDGj8Sm/+bUcJ9arb/qYvP+yXfLvod4ajyFxZM/lfjx3KYWqMdbZqQwyD84wfv3fOZ+L5Rx8rKTmjSaosG+fYy3pnDvqcEUYz4Cq5+Q68d15ElW/d+FkVKw921OM7fCtk77YyAOpCRB+YEq3i5XrQ5sL0ZgU3j2NVxPpgr2sqtBWYhhO1RW16/y8lRtSwdBNRUewMLOQXpglO4AHIfg/eIHDeROmWqfMQs89fk8wAB9+VpABpqQ6xQwezcpCRJGcK4ZJEvLetfprBojjbRijg5SGh3PkKitKiLtA3zIkP8VZHEgQc53I9//riNNBt8bC9L/GEC4n2Uam6p0YOVqA3RDNQeuStn/i+SIjWNilXDKAOGBWkopJ1GW3dLkTYps6lHHOAMpirC1tEEv5Ntq9t+We8EPNLUyd+TPAbJ35TPDg25602/hb+1KdftY9nXDftIajPnTK8my/tqdO5l5v2xhvGtkAfOEaK/C2TgmhiOhslLeFGEg8C2xylwzNSIJY669F3dpk6xGpoJmpvE=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pxnABMXevAzXTFVbD/MEP3fkBOHw2m1CN9yLH4qbEk1UGZDA3p90oZ19TrJI6Dzc11ZIpE1/4p6hm7bsf8OQXx3XZYtEFdgxssgVCTpHkrQDAfIxFsJBJPo6sh3qSVtVh5EdMmYy/rK+fAwTh1ZIQygX6JRK8CN7GsGb9Y+4zoi0UMrSFnKM5H8K5jvO7QlMiGIAPZVAIW8vJQgTvzKuyVtB5zAc1nPmBQKGFVwtvYFwntw/1U4emgziAp/bYKHjxUpsz6r75PAa1KT/0KrRZQVphrbUmd7DY7NT9wvMIq1tRORJV+pysDoCeWO3NhMR/vWV1mTIGP8Zaba3DNVAMSbOZ3BpCh6j+TNLddeX01vEs/fZiO1zxmNiM7tTvB9nfUMdPVyvHxyE0kpUdKaaDh5rkSNz+U2n35cbhwnUZtfQPU15N99aQPrlTozdzbEU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:19:58.9214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b26073-ade4-4845-9f6e-08de80427147
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4444
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 14:20:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17319

Add patch to resolve GStreamer pipeline failures when using TensorFlow Lite
object detection models. The tensorflow2-lite NNStreamer plugin was failing
to load due to missing Abseil logging symbols (_ZN4absl12lts_2025012712
log_internal9kCharNullE, _ZN4absl12lts_2025012712log_internal10LogMessage
C1EPKciNS2_8ErrorTagE) in the libtensorflow-lite.so.2 shared library.

The fix adds missing Abseil logging targets to the CMake build system and
links required logging libraries (log_internal_nullguard, log_internal_mess=
age,
log_severity, raw_logging_internal) to ensure all symbols are available at
runtime.

Added Patch:
  - 0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch=20

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
 ...nsorFlow-Lite-pipeline-failures-due-.patch | 62 +++++++++++++++++++
 .../tensorflow-lite/tensorflow-lite_2.20.0.bb |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/ten=
sorflow-lite/0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patc=
h

diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow=
-lite/0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch b/met=
a-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-Fix-G=
Streamer-TensorFlow-Lite-pipeline-failures-due-.patch
new file mode 100644
index 00000000..f286018f
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0=
003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch
@@ -0,0 +1,62 @@
+From 0e6c2c6d0911897e38f54dd0739e13ea15ccedd8 Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Thu, 12 Mar 2026 16:50:33 +0530
+Subject: [PATCH] Fix GStreamer TensorFlow Lite pipeline failures due to
+ missing Abseil logging symbols
+
+When running GStreamer pipelines with TensorFlow Lite object detection [0]
+
+The pipeline failed with undefined symbol errors:
+  undefined symbol: _ZN4absl12lts_2025012712log_internal9kCharNullE
+  undefined symbol: _ZN4absl12lts_2025012712log_internal10LogMessageC1EPKc=
iNS2_8ErrorTagE
+
+TensorFlow Lite shared library was missing Abseil logging
+components that are required at runtime but weren't being linked during bu=
ild.
+
+Add missing Abseil logging targets (log_internal_message, log_internal_nul=
lguard)
+to the Findabsl.cmake module and link the required Abseil logging librarie=
s in the
+tensorflow-lite target, including absl::log_internal_nullguard for the kCh=
arNull
+symbol, absl::log_internal_message for the LogMessage constructor, and abs=
l::log_severity
+and absl::raw_logging_internal for base logging support.
+
+[0] https://texasinstruments.github.io/processor-sdk-doc/processor-sdk-lin=
ux-AM62X/esd/docs/master/linux/Foundational_Components/Machine_Learning/tfl=
ite.html#example-applications
+
+Upstream-Status: Pending
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ tensorflow/lite/CMakeLists.txt                     | 4 ++++
+ tensorflow/lite/tools/cmake/modules/Findabsl.cmake | 2 ++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.t=
xt
+index 7e0004ef..8c43fdac 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -732,6 +732,10 @@ target_link_libraries(tensorflow-lite
+     absl::strings
+     absl::synchronization
+     absl::variant
++    absl::log_internal_nullguard
++    absl::log_severity
++    absl::raw_logging_internal
++    absl::log_internal_message
+     farmhash
+     fft2d_fftsg2d
+     flatbuffers::flatbuffers
+diff --git a/tensorflow/lite/tools/cmake/modules/Findabsl.cmake b/tensorfl=
ow/lite/tools/cmake/modules/Findabsl.cmake
+index 75041749..685b851b 100644
+--- a/tensorflow/lite/tools/cmake/modules/Findabsl.cmake
++++ b/tensorflow/lite/tools/cmake/modules/Findabsl.cmake
+@@ -99,6 +99,8 @@ if(abseil-cpp_POPULATED)
+     leak_check_api_enabled_for_testing
+     leak_check_disable
+     log_severity
++    log_internal_message
++    log_internal_nullguard
+     main_lib
+     malloc_internal
+     memory
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow=
-lite_2.20.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tenso=
rflow-lite_2.20.0.bb
index 43562303..ee445e75 100644
--- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2=
.20.0.bb
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2=
.20.0.bb
@@ -16,6 +16,7 @@ SRC_URI =3D " \
     git://github.com/tensorflow/tensorflow.git;protocol=3Dhttps;branch=3Dr=
2.20 \
     file://0001-Update-CMakeLists-for-building.patch \
     file://0002-Update-CMakeLists-for-building-shared-object.patch \
+    file://0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch=
 \
     file://tensorflow2-lite.pc.in \
 "
=20
--=20
2.34.1


