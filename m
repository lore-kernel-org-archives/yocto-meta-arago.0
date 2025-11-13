Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C24CDB46A
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:50:34 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5625.1763074227211583444
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 14:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=cgwqvkHH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.45, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnvVn4BN4HhJj9E6PMwsIx5lFPs/uxHSDP1ziOIcq6eiE217WmNEgdG67YsHucS8As71ewtDupXlT5gNykApLempRM4+OQsapNnB4IzgzG54h373183HCNTgMRhrnMKOlDuz5xh8IayMRuwqbSxJScorX96AChxhDKDJtOlvv6kvD4KtgpnES8IMH0GdzAByT+laQDuMUiQjJ/OHZKg82OOjKPfjrAegfa4xndZoce6MPwoAKwGnHFlmvNV+RFnY5IbBTERS8LWXEA+VkYEp+zkoN+iBd0fVIz87hmm76E5tWIIkFTqkKIV4wkcnap/6oDLBFevvNjqUij1Mr5gUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKD+BJELBnmce6/LdATPRKlEp3ONrIGl6Gib5Tp5mVc=;
 b=Atb39eVUwj723t6rSIViFk55oUPnJRNtqSEon1ehiSSz4X6wu5cCG+Y7MDHuintG94T87qbeVb+p5yirSIVdZLDByuMptPSJgmRvB0kd87uA/tJkV8QvKuw7Nbjwq7Ob+xBLbtjSq+2Xrn8CXW8armnIM5QE7EURB15FIjnBVdGwuHIC/0vbfZ5Ipx+J8Gb3DqZaS5VpG6wv8ywiWw2Vs6ZVENeCaYl2Wu8tUnhSvJ5tQWIjWMyqw/YrwYlI5aVu8Efmr2NEmMHj8uj73iD8c60l2t7mVyXbHwK1XSPDYN7wg+2n0QwrA8icrjaho5craewvHbqfsOj6Q6mydl2viA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKD+BJELBnmce6/LdATPRKlEp3ONrIGl6Gib5Tp5mVc=;
 b=cgwqvkHHt2kH9cAYSRvQfrv7Z8y4q2fyONECSLyzb04tfsKMVTP/n5PYAavFJkyuJ5KvCpXnYAycX7WYRkqAo5J1h6tIVQVZsCMRkNojt1+I+r3Mo0V5JM+wdYxj7xvFWVg3QnU6g/HVh+0wk/s2ET0b4dik7sGTWvpsIfUKn3E=
Received: from SJ0PR03CA0034.namprd03.prod.outlook.com (2603:10b6:a03:33e::9)
 by PH0PR10MB4456.namprd10.prod.outlook.com (2603:10b6:510:43::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 22:50:24 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::7e) by SJ0PR03CA0034.outlook.office365.com
 (2603:10b6:a03:33e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 22:50:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 22:50:23 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 16:50:18 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADMoIcW976603;
	Thu, 13 Nov 2025 16:50:18 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vJg8w-00060R-Fw; Thu, 13 Nov 2025 16:50:18 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 09/10] libyang: Do the version bump in a yocto-check-layer compliant manner
Date: Thu, 13 Nov 2025 16:50:16 -0600
Message-ID: <20251113225017.22994-9-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251113225017.22994-1-reatmon@ti.com>
References: <20251113225017.22994-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|PH0PR10MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f25b6cf-248e-4de8-2a0c-08de230707c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ii2tngKhr7ThgeGsT1o+QVD/P3hB5D6iwMkdiATz77Ki/qeWVWEakBcsV68w?=
 =?us-ascii?Q?Wh+c2QomxeHYEdJSLgcG/GA3RdriQ2Vji3Vw1aViX/1m337pDTQbRSsRwiUG?=
 =?us-ascii?Q?xvpNzBfhbVPtCkObzenO7MzG0Pqmc5ypS72vej1nCJxLlHLUOyUb7QPC4qlT?=
 =?us-ascii?Q?/QqN9On3RdWF/NS/PcB3u5mcAwP14/IorRs9vRTqDJrQjxXIgeuiZOmRTjVB?=
 =?us-ascii?Q?G+jtNYqUpzUrcPepE6o/iXItLhEe4AyVCHfyBDJJLfs9OHeY332EWDVJzb46?=
 =?us-ascii?Q?pon7lz8I0f74DfIkhqKrtw9t4oNQsW2Vj0jiLCqeB0QFn0CeUprBRZD4kmY1?=
 =?us-ascii?Q?NhV9nL3mCL/On8eqcgQy4oIVi9JZ/DQgqBdzOahiQ47YC+Ma7kyH5N0D1USz?=
 =?us-ascii?Q?pcAVCRqEI03rb4++C+oT0dunaYUW0Rk24mqOSUCDI0LGQmmQzqs0haUGpG1z?=
 =?us-ascii?Q?50thj1i5V6kP0O+ZhDdMq5ZfUaNjFLqHROPcdsYFkFsPSkRzordle+gkxOqR?=
 =?us-ascii?Q?agDeUte6kFZiOplBl2uST/pmYKAcdLaqOrJBOArFzAKtC7cuaHNCeyKyrIBz?=
 =?us-ascii?Q?BRqPUEsNLHv6t4ruMEPeXGxd44L9rD1HwYcYohAIl8wCrSqBl1i8Wnd7F9hB?=
 =?us-ascii?Q?sAUYSEAusA0QQixYwkuKxoFCryiMoYBxqPB1q6D20FfSb9MOTM96/8dHbloX?=
 =?us-ascii?Q?rplk9u4p4r3kSkVVD2Ysgv53MtIXJvEaqUPMq2CRle7KYQ4DJqMoIXnOFjPM?=
 =?us-ascii?Q?5v28SAxHIwI3b1I4cRR/zS2MZYu7BSnJW+wVqJF9clJ4PU11froD5l7WgD14?=
 =?us-ascii?Q?3m/mvONGPhPoIsxjRVA3dWLprDpzU/+TjyymvF/Yr6gv+K8jlRBOLXkazO98?=
 =?us-ascii?Q?7FJBr2GoORVm0/Z4TddKcRmoeuL/AwpFkQJZ//NT5u4By8PenIVOqen13xqI?=
 =?us-ascii?Q?Tc20vv7CAQThmXyqy4LSgQ8wVIwqOwvjegcn2wpWIFVrasvuDVRVvsslSeDl?=
 =?us-ascii?Q?nqIj03KJV9ED4U/0G0sh25n98vNt0oqgcai+szpnGrOir123D+Vx8nBofKaY?=
 =?us-ascii?Q?NZ8sTlIf9W+4wjPzJoLGKKP2ka4Km0GlqdnpDNdNq7gDtP/E8ZMuGBTgCK5w?=
 =?us-ascii?Q?q4acA7PTZoWCmwkzMhwnUajJ8q6+tzRjk10zAcsZzvhmKbGld6+Wlsmc7j4N?=
 =?us-ascii?Q?4o+OnNN+yeAhLC8siOaqt1KUgpXzkJYbASeR25LaGDh7TcDd2smrCOmyRLD5?=
 =?us-ascii?Q?00ipsz0AC95SciVSIPF3h+I780rwLqSUiaJSfM7NUxQ88rqRtApPmXh4lgvm?=
 =?us-ascii?Q?xgS4UnEmsJ67UcIlJHwoWS4w92iAzcdiXNS24l/PXjUj+aoD0RZk1Vz5UHJk?=
 =?us-ascii?Q?e4xcjwvknwbFO/FCMhEHd168XmoHKwUumeg7kA+nfUUosNWa+ISd4/emyxxY?=
 =?us-ascii?Q?/gwF/u1ghMmY1qg7tPlhw/m2XvCL1jghpyq9qsa+9YKxnon6sVJlJ9VBmF3v?=
 =?us-ascii?Q?JoBLHpSAIJsOchk2JgYr7+hUtHGBfGbG1mKd/2a1ff99UmqBePgkGgQ0zCG9?=
 =?us-ascii?Q?8fIZCgx1iKMGdHNyJUk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:50:23.4479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f25b6cf-248e-4de8-2a0c-08de230707c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4456
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Nov 2025 22:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16760

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
 .../sysrepo/libyang-arago.inc                 |  9 ++++
 .../sysrepo/libyang_%.bbappend                |  5 +++
 .../recipes-extended/sysrepo/libyang_3.7.8.bb | 45 -------------------
 3 files changed, 14 insertions(+), 45 deletions(-)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
 delete mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb

diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc b/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
new file mode 100644
index 00000000..b76701a8
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
@@ -0,0 +1,9 @@
+PV = "3.7.8"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697"
+
+SRCREV = "03e294d83b610f89e8ba7b2156a80dc0ad534443"
+
+do_install:append () {
+    oe_multilib_header  libyang/ly_config.h
+}
diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend b/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
index 608377e3..60d1258e 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
+++ b/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
@@ -1 +1,6 @@
+LIBYANG_ARAGO = ""
+LIBYANG_ARAGO:arago = "libyang-arago.inc"
+
+require ${LIBYANG_ARAGO}
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb b/meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb
deleted file mode 100644
index 3bea9bc2..00000000
--- a/meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "YANG data modeling language library"
-DESCRIPTION = "libyang is a YANG data modelling language parser and toolkit written (and providing API) in C."
-HOMEPAGE = "https://github.com/CESNET/libyang"
-SECTION = "libs"
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697"
-
-SRCREV = "03e294d83b610f89e8ba7b2156a80dc0ad534443"
-
-SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
-           file://0001-test_context-skip-test-case-test_searchdirs.patch \
-           file://run-ptest \
-           "
-
-S = "${WORKDIR}/git"
-
-# Main dependencies
-inherit cmake pkgconfig lib_package ptest multilib_header
-DEPENDS = "libpcre2"
-DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}"
-
-EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
-EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON -DENABLE_VALGRIND_TESTS=OFF', '', d)}"
-
-do_compile:prepend () {
-    if [ ${PTEST_ENABLED} = "1" ]; then
-        sed -i -e 's|${S}|${PTEST_PATH}|g' ${B}/tests/tests_config.h
-        sed -i -e 's|${B}|${PTEST_PATH}|g' ${B}/tests/tests_config.h
-    fi
-}
-
-do_install:append () {
-        oe_multilib_header  libyang/ly_config.h
-}
-
-do_install_ptest () {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -f ${B}/tests/utest_* ${D}${PTEST_PATH}/tests/
-    cp -fR ${S}/tests/modules ${D}${PTEST_PATH}/tests/
-    install -d ${D}${PTEST_PATH}/tests/plugins
-    cp -f ${B}/tests/plugins/plugin_*.so ${D}${PTEST_PATH}/tests/plugins/
-}
-
-FILES:${PN} += "${datadir}/yang/*"
-- 
2.17.1


