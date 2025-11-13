Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9235DCD98FD
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:50:34 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5642.1763074230924398018
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 14:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=dUXvhP8/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.13, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2NDITJmxLsh0sBmvdiowd3SgYleXDKmj4wqwuXzWDh7aUQQYeTROGce9lBaqNC6uCqlRLJuN1+CSGMwu7gCiRb/WejEHWeB8kCd1kCyXk2HQW9/M4s3xHLLS1dX5bKkOBZfF0A0eAn9S8RPCdr9PjP2wIEBLofHaxVVPWnV+L584ZgIRg8yvoVpAZdah53XAJFWD1iGCqzbksud7WACmHNcf0pIgr7e3CQIAG9BHDsZ17WCy6q6Wy/aimbj7r3Zkzkrxy7hgxhL7stA7rlfSrNKHyyk3EdDeE0ZMFZOsYn9LAbXfwN3UiWlj0J9ijKBhbDtaE1OFLToKIc+4nAvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80Eu+eUn0CN/3f7VJjpdxC1LOLc86mN25Vrog9hI+8w=;
 b=hpGi/tAHFonZwSgIuWD6a08LcrBAlcdZiucEXRsMAxJ9hkcgkYWAUcEV49JMdPJia3i94NmnYAPXFJfkIdBidfiHqU+F29PGMPkvY0LMT6Z779UVhG4WSEGk92APe1EoNk43UrIrJn8zIlwQ5Q3Kd2M+3F++q8IJ12bxS2IWT+cVnCSbJFNTF2xsgftqieBnJm5JCz+f5eXxKVi/HHVfxer/D52bnBdYNQ6LvSSUY36hU6puUvoSQQl6ZCMy24Gw59QT48CYGuVqo75/ZKXfEWK/TvUQ7WrR3r6wGM4GwtRiVBAQjsEX8EWY4uNfosUFQEGXKI5clT2cThdvtSl1NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80Eu+eUn0CN/3f7VJjpdxC1LOLc86mN25Vrog9hI+8w=;
 b=dUXvhP8/KalrcorLq1Mism//L+drNRCOYJ+FaRSwGHW5TKXk4L7dZtKH8FQfHYUohrS67s5ieBmh490RiaTrIcKsPoUwTyo9s6v22htujr9bxOtYOv8jVn92R7K0i9D87KYE+8nMzuo4gIPvyCOtVHuHrcuqTLiJZQzWxsBLjxw=
Received: from BY3PR04CA0019.namprd04.prod.outlook.com (2603:10b6:a03:217::24)
 by SA2PR10MB4729.namprd10.prod.outlook.com (2603:10b6:806:11c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 22:50:26 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:a03:217:cafe::d9) by BY3PR04CA0019.outlook.office365.com
 (2603:10b6:a03:217::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Thu,
 13 Nov 2025 22:50:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 22:50:25 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 16:50:18 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADMoI89976600;
	Thu, 13 Nov 2025 16:50:18 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vJg8w-00060L-Bo; Thu, 13 Nov 2025 16:50:18 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 08/10] abseil-cpp: Do the version bump in a yocto-check-layer compliant manner
Date: Thu, 13 Nov 2025 16:50:15 -0600
Message-ID: <20251113225017.22994-8-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251113225017.22994-1-reatmon@ti.com>
References: <20251113225017.22994-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|SA2PR10MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f26e5f5-b16e-463a-7b0b-08de23070952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gxxRj/j/d04omj9FBXm+f+C6lDG+EpMsuqzz2M3NhOUj75ZwavddRuJi5zf2?=
 =?us-ascii?Q?PL80oEYYJX8J+OHzc6IJM0ehMz+D5uy4TJF8IWAKwRMWpeCfDeWfMY8Q6nZA?=
 =?us-ascii?Q?cCJd4s3sLD6UM3KxhWAVgBQ1XWAid/FiPhzG/uBtU5HrHgaBPaem55tVo+f8?=
 =?us-ascii?Q?uZ21LzjJVdFBMUnR+QLHEmeabmaAvNGY6OhoD10lRZEcKhEpf8kd8pQ1/goh?=
 =?us-ascii?Q?o7Frp0hA3tjwTPCuB0b1rIrGhSR38gfIbNlDjwiRHWcziY2hoYYunvyOElw9?=
 =?us-ascii?Q?beDeKrU3oSeGR7nosXuLK2DV2fN1/HBTdn7F9nA0v1oRx+Gld4aacJbUg7C4?=
 =?us-ascii?Q?st9eDSqYTn0OsmaFqqb8Ji+t2xMqZaEfipdje6zvCTyE8pDbx7n34fSs2dPa?=
 =?us-ascii?Q?LgM9XnRxHvnjAF391yes5QkAU2EpK/Mma6AKWOoXtCudKHMlIj2T9xSMVLqa?=
 =?us-ascii?Q?/U+EW3djJxeEmbut+JjF6upi0B1z60fEcyyz/+n3pCVfp0jcD8Y6ZserrvjN?=
 =?us-ascii?Q?XquiFY8ZxJEv2Jsb8TYtjwDwqmkchtSuF7CZhvhnbPHiwL4pM6DoyEtlEkdX?=
 =?us-ascii?Q?bRtApN+XZE8gJ2X75ZgdJzn8M9VPxtrqXRntEzaz0499e7I/ts54BP4zPDkn?=
 =?us-ascii?Q?X5QMSr/+Asj24IJ2qrmIdN2nWe5BxpO4/SOquccwE3tDJlf1dXWpNRUcbJ1d?=
 =?us-ascii?Q?JNmc/+Sdcx0FjrA15zONHtXfVNPm7ZbYH/uHOH/Y2MZH2EYLee257R/I2Q4r?=
 =?us-ascii?Q?jfL1RDhWW2/KhRZTCCyvdDQ7vKaeTNwJS8A9MQDuj1Kf02hxWZr37ptKniu+?=
 =?us-ascii?Q?XWV58l5vaD+IfpsY9apABQJQbHtFOSOkmtajV42EChNmIrNrCb/jfr99BRAL?=
 =?us-ascii?Q?KV6sjGd+7Vr6ujOEhXqleEJJlmXIyv6FfnMvtMkZIkQmNAI0REUG6kdApbzU?=
 =?us-ascii?Q?na0LYVSBXm/YPZAINay17PoyAfjKXEx/mYZbZ9KezR5Q5YyXR54UtzswE/Cn?=
 =?us-ascii?Q?Au+nYXtAUG8/P+BYoW6jaRyDqSHGkj2Uzh5YgmqjO0pCZgDzo6aw+O4rxD1n?=
 =?us-ascii?Q?XcGsGBR4zmpVb6czmIj1TIYmQ1hEC6510O+LXRe0FpUMMCTPU2SSwqCcEre3?=
 =?us-ascii?Q?JT0FCwqIMkNwyfEUiqsjufAOBzGQDTw5z69/UpspYmYBal7rX4rbTfiESyzX?=
 =?us-ascii?Q?jnnd0K5MNr3nJbGzJMw/qI3LyjCz/uVPFdj7kUYyILWRrtfwY3Y2M5R2W2FG?=
 =?us-ascii?Q?ZCvk4gCiCfTcJoztwO+XA9lofU5cl/Dejqn5wi5YkWNvrmkhyUmzPBNZ3jM7?=
 =?us-ascii?Q?q+PvPAmQbWnCWCuRcuiWlJI6yQXf3HptWfY7J5wrPGyCVui1kEOiyt+oZ0LV?=
 =?us-ascii?Q?F6dq3XZh7FmfkxY9wu2vj6NNTUVpP/NmpeLqj2vWfvvOt0CwTbnQxpQ8B0ry?=
 =?us-ascii?Q?VbIGvFywsWskgd+wHNn/bMVXaLCDu5cUxTm7M4uZ58IJ9tMIHw85e5/nwaaj?=
 =?us-ascii?Q?TWgR2BBMs8hYf/k=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:50:25.9756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f26e5f5-b16e-463a-7b0b-08de23070952
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4729
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Nov 2025 22:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16763

Yocto Project Compatibility requires that including a layer in a build
not change recipes in other layers.  In this case, we were providing a
newer version of a recipe that another layer provides.

The proper way of doing this is to create a bbappend and only change the
minimal things needed to perform your changes.  Additionally, to pass
the yocto-check-layer the bbappend needs to be wrapped in a manner that
only applies your changes in the event that you are making use of your
layer.  For Arago, that means only if we are building Arago.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../abseil-cpp/abseil-cpp-arago.inc           | 17 ++++++
 .../abseil-cpp/abseil-cpp_%.bbappend          |  4 ++
 .../abseil-cpp/abseil-cpp_20240722.0.bb       | 54 -------------------
 3 files changed, 21 insertions(+), 54 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp-arago.inc
 create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb

diff --git a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp-arago.inc b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp-arago.inc
new file mode 100644
index 00000000..99449654
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp-arago.inc
@@ -0,0 +1,17 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/abseil-cpp:"
+
+PV = "20240722.0"
+
+SRCREV = "4447c7562e3bc702ade25105912dce503f0c4010"
+BRANCH = "lts_2024_07_22"
+
+SRC_URI:remove = "\
+    file://abseil-ppc-fixes.patch \
+    file://0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch \
+    file://0001-PR-1739-container-internal-Explicitly-include-cstdin.patch \
+"
+
+SRC_URI += "\
+    file://0004-abseil-ppc-fixes.patch \
+    file://0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch \
+"
diff --git a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_%.bbappend b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_%.bbappend
new file mode 100644
index 00000000..e1e08204
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_%.bbappend
@@ -0,0 +1,4 @@
+ABSEIL_CPP_ARAGO = ""
+ABSEIL_CPP_ARAGO:arago = "abseil-cpp-arago.inc"
+
+require ${ABSEIL_CPP_ARAGO}
diff --git a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
deleted file mode 100644
index 4bfc2100..00000000
--- a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-SUMMARY = "Abseil is a cpp library like STL"
-DESCRIPTION = "Abseil provides pieces missing from the C++ standard. Contains \
-additional useful libraries like algorithm, container, debugging, hash, memory, \
-meta, numeric, strings, synchronization, time, types and utility."
-HOMEPAGE = "https://abseil.io/"
-SECTION = "libs"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
-
-SRCREV = "4447c7562e3bc702ade25105912dce503f0c4010"
-BRANCH = "lts_2024_07_22"
-SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
-           file://0001-absl-always-use-asm-sgidefs.h.patch             \
-           file://0002-Remove-maes-option-from-cross-compilation.patch \
-           file://0003-Remove-neon-option-from-cross-compilation.patch \
-           file://0004-abseil-ppc-fixes.patch \
-           file://0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch \
-          "
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-
-EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
-                 -DBUILD_TESTING=OFF    \
-                 -DABSL_ENABLE_INSTALL=ON \
-                "
-
-SYSROOT_DIRS:append:class-nativesdk:mingw32 = " ${bindir}"
-
-PACKAGES_DYNAMIC += "^libabsl-*"
-PACKAGES_DYNAMIC:class-native = ""
-
-PACKAGESPLITFUNCS =+ "split_dynamic_packages"
-
-python split_dynamic_packages() {
-    libdir = d.getVar('libdir')
-
-    libpackages = do_split_packages(
-        d,
-        root=libdir,
-        file_regex=r'^libabsl_(.*)\.so\..*$',
-        output_pattern='libabsl-%s',
-        description="abseil shared library %s",
-        prepend=True,
-        extra_depends='',
-    )
-    if libpackages:
-        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(libpackages))
-}
-
-ALLOW_EMPTY:${PN} = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


