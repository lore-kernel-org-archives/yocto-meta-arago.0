Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCD6C9830B
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 23:02:39 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.896.1768604549344435861
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 15:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=cBVnk0Qm;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.54, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjwexOAyS2TRyviuasnOCRw2fWKmZAky+Uq+vcLyBvlbVvIkThDgfiDMbTWFkiKDxr/SgoZZMactArb03bCn1H1dzniV+4GBH8C57PKRcMweid7CUZF3JCE+8ZycBTo4NuyBSEqAhuBkLqZFEHQA0GA6oB/U0kCP1P/oKvW5ohqdckuQosSnUQHrQMI7SjmPraV+xvcp9bJEC8M7B5ZLeTHHkEUsBQ7YuGEwH1Dcn3jvPvbAPgNM+ubyOyDA5r1c2QmbUd64+lTJtldrgOtcHxD2PnSgAM2RnucwTaO1vzYONAuu+azdDEbNgLToIcf4BzfYM8Wk5D9jhxNrumXnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+fIZjRD6kX/mafRtgMgZErB6jX0CJPPj4zkwX431Cc=;
 b=lDlXqUAoTM1fDJzvCgimpIO8lNL6OT5GHYYvrdHhNDW47DDwnh5zt8tPfB94w4gEpEGqlCOi/1xkJ3Xtm/kmYTL+lEorGZ1hScWnQ6RBD+L1y8+xl8C9kMRdXYaOX/4Ky7CLlclV7t4qudb6d+/uh3VZHUEvke259rTaqxo+7dQrgVhFtFyIxP7vDE2GoSJF7gPtewqqwOTljHyb3sXfHJHUn1TsCslZBp/8VBfOO+O8yCUwzIEO9pj+TNy/QSlgx5IfMJRrwiF+aj6kWBSxHXyA1ncMCHsPQFd6y2E7FtpyDvVkGHxtPRq86sHvIdSzaJ89n1qSirQHIK+iRdS/qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+fIZjRD6kX/mafRtgMgZErB6jX0CJPPj4zkwX431Cc=;
 b=cBVnk0Qm2nUZ+BJG1PKc5E2YteY5W+AIReDDPx5PK7W0dfE3/Vvj04pe1Kt/apxzmH2plJ4lPoKNBBx5AGEVEI72o2tYds8tRejAiFzx8grPDeUZpvNKf56U1Zfqyt991UudbWi+eZBuUFSY7emG0u59H6QTbIFQT3burtLQX34=
Received: from DS7PR03CA0168.namprd03.prod.outlook.com (2603:10b6:5:3b2::23)
 by SA1PR10MB7815.namprd10.prod.outlook.com (2603:10b6:806:3ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 23:02:26 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::e0) by DS7PR03CA0168.outlook.office365.com
 (2603:10b6:5:3b2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Fri,
 16 Jan 2026 23:02:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 23:02:26 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 17:02:25 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 17:02:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 17:02:25 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GN2P8H3880138;
	Fri, 16 Jan 2026 17:02:25 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vgspl-00000000S1H-0tUV;
	Fri, 16 Jan 2026 17:02:25 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] open62541: Upodate for v1.4
Date: Fri, 16 Jan 2026 17:02:25 -0600
Message-ID: <20260116230225.107700-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|SA1PR10MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: e25a7617-181e-4cdc-3ecf-08de555350f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q2XY54QNqRXXxE6cBAG642ZARhaxlCzk9zEIWbgf7DBgwKh5VcEnntUGsaE6?=
 =?us-ascii?Q?QpcEwgNxRSK+xao0/7c0rs11rqNnZmKOwTRwTuInIoZUHipM6ydqMjhacSVA?=
 =?us-ascii?Q?hwKjPBmFhrwZ4QYyPIeMJmkcRv+eXM3o5MpiidD7h4V/DYclIVeCiZWPxCUO?=
 =?us-ascii?Q?y37+ahx/I5z+w3AxqunE4Y7XEWrNLS/nThJoUMq5wY0bkuNSlAtcaLQWTL9S?=
 =?us-ascii?Q?CPv4WsPYd91Slpaqudvx8VptfMBtPdMggOh6rXtwsdqOkQC07EJuXQeSfw6e?=
 =?us-ascii?Q?+acxBxHNv2VrAS9oQttkT/fHHaMP8t5FsfZWJSqVV5GEEgXS9dvzXHcrhkFz?=
 =?us-ascii?Q?0XUde/gUA8WaMZF7BYIQSIQ7RGG3XLxskR6ERt136L/5G/nVhDWj12PPBfQW?=
 =?us-ascii?Q?0IBoHYT+SK/Ur7oXcCPClyZGGAb5La9obSaXMPd6X+C7evjnHQWEIJeDePId?=
 =?us-ascii?Q?ycmXf5Vzsp1qRi0YR41tBBlzkpoHaFa84fz9WkOoo/jsYgo3V2lMBOLn9Dw/?=
 =?us-ascii?Q?Gpl8g5WleKfDMsn4f42FK8YmVunyQ/JBAJVEZT98i75Ii9xd9NYC0xca//gU?=
 =?us-ascii?Q?l4Hvb4tX4NLBk/cyjmc0AvQC3B8S8kMZyabMplNF1PbCKX89LwGVYbRUV1eX?=
 =?us-ascii?Q?1C0F3Gy/VcnsURkQvIpO9R5nGNNd/HJ415PktimAh+b4Im8Nqx9IHCbDxTl4?=
 =?us-ascii?Q?4d6y3Sp338vj1qFbOUBIfshLRQU6pqBFLa2rzsqh5uN5NE+KVEqAi9QB8Ai5?=
 =?us-ascii?Q?gT+rkk2/6GVn550Z6IQ+RagK3AEwYMuSm7LD6FQUs4kUnpmXc1+1HJQBpPw9?=
 =?us-ascii?Q?3BG3QaDj/uki1fAxPDu1VMUnVLsWTyrCHQrIJ3tVdjKRcQbiMFFPWjjD2XTc?=
 =?us-ascii?Q?x5jGpCtce8EwOTnZBo/ItWDNzXT/as+60UtFeGr3V+14cdRh/i33ANnrakEk?=
 =?us-ascii?Q?fan1iU6urGQLACpodmAAZIYnhXV94P6kIKetFM3mqt39PQN6Oe8fy8vb0k7F?=
 =?us-ascii?Q?EIYpnZ9CrDisY7hxeyN/nfyu6G57D7AObbqTJtv4OK9AdnVhHP2NbpM14IEI?=
 =?us-ascii?Q?P2DSjR3TMaPqQBeYuEYxAaLawJnY8zuwQVl8FofeMFDPhVLoboSRwsTAXx8p?=
 =?us-ascii?Q?iYxZJ8Nw9EU+bjseVURbkOI6CSxGV30Avzru1OnyQg3NvS9TpcLytEQwJ01/?=
 =?us-ascii?Q?w9TTI56qHOgf68a2Acr80ra8lg//a1apZw+Ed0rGeBsJI/RbkT1rPsArtoGh?=
 =?us-ascii?Q?GYXDTfyGPjkFR4kEqIP24zt9CoV83zexMvyX7cQQwsIn5Ty077oZ5QAEs2Fz?=
 =?us-ascii?Q?vI96qkAtIikk3KwZOZ+DY/IepXE1sWC3mT/eQv2Ewodlzblg0RtFCnMfHiCD?=
 =?us-ascii?Q?AlxnPN26jKea0zeGiBbqgMSwH1j5A9v5F7cfooR/rkWra1LgHnKW66rfhigt?=
 =?us-ascii?Q?oXfgTjNWGABA2PNRHgPf4Qstg3J8WjR/K/A0V2GN+5gfLxeuRJ4X03iVUHHv?=
 =?us-ascii?Q?9M0N0NxwVLE4MVK7vEn3QKyjGzp76JK4sPcpCsGnUEFonNVmLdWoTNtFhqQD?=
 =?us-ascii?Q?vR3k+B4zFLGa/Y5CGGHC0iOCrU9unAaeHMymV7N/C9J8GO0wG4OGaVjOBRTL?=
 =?us-ascii?Q?oOTFhViX2Tp38/LLQMXrb9ZzJqtIIt7HwENKlGu2ELgbSR0mcKRIjU68OBTu?=
 =?us-ascii?Q?bqmVQw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 23:02:26.1187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e25a7617-181e-4cdc-3ecf-08de555350f4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7815
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 23:02:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16981

mets-openembedded bumped the version to 1.4 [1].  We need to remove a
few patches that no longer apply and add a new patch to fix a compile
issue related to missing the pthread.h file in an include.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=3D3e3f0eac0f5=
99e92442d8c6c0000eb961d8c4170

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../open62541/open62541-arago.inc             |  2 +-
 ...Lists-do-not-install-git-directories.patch | 27 --------
 .../0001-examples-Remove-sys-io.h.patch       | 68 -------------------
 ...blisher_rt_level-Add-missing-pthread.patch | 38 +++++++++++
 ...tests-fix-typing-of-size_t-in-printf.patch | 64 -----------------
 5 files changed, 39 insertions(+), 160 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62=
541/0001-CMakeLists-do-not-install-git-directories.patch
 delete mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62=
541/0001-examples-Remove-sys-io.h.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62=
541/0001-server_pubsub_publisher_rt_level-Add-missing-pthread.patch
 delete mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62=
541/0001-tests-fix-typing-of-size_t-in-printf.patch

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541-ara=
go.inc b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.i=
nc
index 745c88a1..f92e1e90 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
@@ -2,7 +2,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/open62541:"
=20
 SRC_URI:append =3D " \
     file://0001-examples-client-allow-configurable-server.patch \
-    file://0001-examples-Remove-sys-io.h.patch \
+    file://0001-server_pubsub_publisher_rt_level-Add-missing-pthread.patch=
 \
 "
=20
 EXTRA_OECMAKE =3D "-DUA_BUILD_EXAMPLES=3D1"
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/000=
1-CMakeLists-do-not-install-git-directories.patch b/meta-arago-extras/recip=
es-connectivity/open62541/open62541/0001-CMakeLists-do-not-install-git-dire=
ctories.patch
deleted file mode 100644
index 89e47635..00000000
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-CMake=
Lists-do-not-install-git-directories.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From a80cd1702055086e2197851047e2eb65323b7656 Mon Sep 17 00:00:00 2001
-From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Thu, 19 Mar 2020 07:40:42 -0400
-Subject: [PATCH] CMakeLists: do not install git directories
-
-Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
-
-Upstream-Status: Pending
----
- CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a7b15c6..264d484 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1350,6 +1350,7 @@ install(DIRECTORY ${UA_install_tools_dirs}
-     FILES_MATCHING
-     PATTERN "*"
-     PATTERN "*.pyc" EXCLUDE
-+    PATTERN ".git" EXCLUDE
-     )
-=20
- install(FILES ${UA_install_tools_files} DESTINATION ${open62541_install_t=
ools_dir})
---=20
-2.7.4
-
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/000=
1-examples-Remove-sys-io.h.patch b/meta-arago-extras/recipes-connectivity/o=
pen62541/open62541/0001-examples-Remove-sys-io.h.patch
deleted file mode 100644
index 3119fb3d..00000000
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examp=
les-Remove-sys-io.h.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 123f7274cf6cb65866c910dec16ec1595495d1dc Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Thu, 29 Jun 2023 11:14:50 -0500
-Subject: [PATCH] examples: Remove sys/io.h
-
-This header is missing on some architectures, aarch64 being one of them.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- examples/pubsub_realtime/pubsub_TSN_loopback.c                  | 1 -
- examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c    | 1 -
- examples/pubsub_realtime/pubsub_TSN_publisher.c                 | 1 -
- examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c | 1 -
- 4 files changed, 4 deletions(-)
-
-diff --git a/examples/pubsub_realtime/pubsub_TSN_loopback.c b/examples/pub=
sub_realtime/pubsub_TSN_loopback.c
-index 803a3c107..e90015aa3 100644
---- a/examples/pubsub_realtime/pubsub_TSN_loopback.c
-+++ b/examples/pubsub_realtime/pubsub_TSN_loopback.c
-@@ -77,7 +77,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <linux/types.h>
--#include <sys/io.h>
- #include <getopt.h>
-=20
- /* For thread operations */
-diff --git a/examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c =
b/examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c
-index 7db37e9d5..ba5f7aff6 100644
---- a/examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c
-+++ b/examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c
-@@ -54,7 +54,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <linux/types.h>
--#include <sys/io.h>
- #include <getopt.h>
-=20
- /* For thread operations */
-diff --git a/examples/pubsub_realtime/pubsub_TSN_publisher.c b/examples/pu=
bsub_realtime/pubsub_TSN_publisher.c
-index 945ec3d4f..5ff866908 100644
---- a/examples/pubsub_realtime/pubsub_TSN_publisher.c
-+++ b/examples/pubsub_realtime/pubsub_TSN_publisher.c
-@@ -78,7 +78,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <linux/types.h>
--#include <sys/io.h>
- #include <getopt.h>
-=20
- /* For thread operations */
-diff --git a/examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread=
.c b/examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c
-index 72dcd3997..73967577f 100644
---- a/examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c
-+++ b/examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c
-@@ -57,7 +57,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <linux/types.h>
--#include <sys/io.h>
- #include <getopt.h>
-=20
- /* For thread operations */
---=20
-2.17.1
-
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/000=
1-server_pubsub_publisher_rt_level-Add-missing-pthread.patch b/meta-arago-e=
xtras/recipes-connectivity/open62541/open62541/0001-server_pubsub_publisher=
_rt_level-Add-missing-pthread.patch
new file mode 100644
index 00000000..8519fd5c
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-serve=
r_pubsub_publisher_rt_level-Add-missing-pthread.patch
@@ -0,0 +1,38 @@
+From 7af0f9a29ec011530a2b8c4b60e719e76ce0cdf0 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Fri, 16 Jan 2026 16:40:07 -0600
+Subject: [PATCH] server_pubsub_publisher_rt_level: Add missing pthread.h
+
+Fix for errors:
+
+open62541-1.4.14/examples/pubsub_realtime/server_pubsub_publisher_rt_level=
.c:78:5: error: implicit declaration of function 'pthread_create' [-Wimplic=
it-function-declaration]
+   78 |     pthread_create(&pubSubELThread, NULL, runPubSubEL, NULL);
+      |     ^~~~~~~~~~~~~~
+open62541-1.4.14/examples/pubsub_realtime/server_pubsub_publisher_rt_level=
.c:78:5: warning: nested extern declaration of 'pthread_create' [-Wnested-e=
xterns]
+open62541-1.4.14/examples/pubsub_realtime/server_pubsub_publisher_rt_level=
.c:173:5: error: implicit declaration of function 'pthread_join'; did you m=
ean 'pthread_kill'? [-Wimplicit-function-declaration]
+  173 |     pthread_join(pubSubELThread, NULL);
+      |     ^~~~~~~~~~~~
+      |     pthread_kill
+
+Upstream-Status: Pending
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ examples/pubsub_realtime/server_pubsub_publisher_rt_level.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/pubsub_realtime/server_pubsub_publisher_rt_level.c b=
/examples/pubsub_realtime/server_pubsub_publisher_rt_level.c
+index 0ec133d1f..caa440596 100644
+--- a/examples/pubsub_realtime/server_pubsub_publisher_rt_level.c
++++ b/examples/pubsub_realtime/server_pubsub_publisher_rt_level.c
+@@ -8,6 +8,7 @@
+ #include <open62541/types.h>
+=20
+ #include <signal.h>
++#include <pthread.h>
+=20
+ #define PUBSUB_CONFIG_PUBLISH_CYCLE_MS 100
+ #define PUBSUB_CONFIG_FIELD_COUNT 10
+--=20
+2.43.0
+
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/000=
1-tests-fix-typing-of-size_t-in-printf.patch b/meta-arago-extras/recipes-co=
nnectivity/open62541/open62541/0001-tests-fix-typing-of-size_t-in-printf.pa=
tch
deleted file mode 100644
index 21f7a162..00000000
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-tests=
-fix-typing-of-size_t-in-printf.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From c04171fb423c16f1aa9ad31d6f95e95b54b6f26f Mon Sep 17 00:00:00 2001
-From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Wed, 9 Jan 2019 08:31:27 -0500
-Subject: [PATCH] tests: fix typing of size_t in printf
-
-Upstream-Status: Pending
-
-Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
----
- tests/check_timer.c                         | 2 +-
- tests/server/check_server_historical_data.c | 8 ++++----
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/tests/check_timer.c b/tests/check_timer.c
-index 051f1bc..1021cf4 100644
---- a/tests/check_timer.c
-+++ b/tests/check_timer.c
-@@ -52,7 +52,7 @@ START_TEST(benchmarkTimer) {
-     clock_t finish =3D clock();
-     double time_spent =3D (double)(finish - begin) / CLOCKS_PER_SEC;
-     printf("duration was %f s\n", time_spent);
--    printf("%lu callbacks\n", count);
-+    printf("%lu callbacks\n", (long unsigned)count);
-=20
-     UA_Timer_deleteMembers(&timer);
- } END_TEST
-diff --git a/tests/server/check_server_historical_data.c b/tests/server/ch=
eck_server_historical_data.c
-index 8f16089..0dfcba0 100644
---- a/tests/server/check_server_historical_data.c
-+++ b/tests/server/check_server_historical_data.c
-@@ -325,7 +325,7 @@ testHistoricalDataBackend(size_t maxResponseSize)
-     UA_UInt32 retval =3D 0;
-     size_t i =3D 0;
-     testTuple *current =3D &testRequests[i];
--    fprintf(stderr, "Testing with maxResponseSize of %lu\n", maxResponseS=
ize);
-+    fprintf(stderr, "Testing with maxResponseSize of %lu\n", (long unsign=
ed)maxResponseSize);
-     fprintf(stderr, "Start | End  | numValuesPerNode | returnBounds |Cont=
Point| {Expected}{Result} Result\n");
-     fprintf(stderr, "------+------+------------------+--------------+----=
-----+----------------\n");
-     size_t j;
-@@ -372,7 +372,7 @@ testHistoricalDataBackend(size_t maxResponseSize)
-             ++counter;
-=20
-             if(response.resultsSize !=3D 1) {
--                fprintf(stderr, "ResultError:Size %lu %s", response.resul=
tsSize, UA_StatusCode_name(response.responseHeader.serviceResult));
-+                fprintf(stderr, "ResultError:Size %lu %s", (long unsigned=
)response.resultsSize, UA_StatusCode_name(response.responseHeader.serviceRe=
sult));
-                 readOk =3D false;
-                 UA_HistoryReadResponse_deleteMembers(&response);
-                 break;
-@@ -465,10 +465,10 @@ testHistoricalDataBackend(size_t maxResponseSize)
-         }
-         UA_ByteString_deleteMembers(&continuous);
-         if (!readOk) {
--            fprintf(stderr, "} Fail (%lu requests)\n", counter);
-+            fprintf(stderr, "} Fail (%lu requests)\n", (long unsigned)cou=
nter);
-             ++retval;
-         } else {
--            fprintf(stderr, "} OK (%lu requests)\n", counter);
-+            fprintf(stderr, "} OK (%lu requests)\n", (long unsigned)count=
er);
-         }
-         current =3D &testRequests[++i];
-     }
---=20
-2.7.4
-
--=20
2.43.0


