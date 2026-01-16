Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60CEC982EE
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 18:21:36 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3829.1768587693914257631
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 10:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=GREpk15p;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.53, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oITcofKQ3vERrE1CWL8ucTcFcQ1AysUnVcmXxv7YMMgiStY/dASqKNZKN6yp3qxaNBu02XEQYLYsd7LIHCWTUlBQ6BNZL28M/IZlKuj1tRSpm8Y+A50dfMTUlHBf15BJIo8jsZ02ZlnIXiIUV8n1gxG7B9eCnP+uzrW2+C938b+IUx3lTBTDAhQO67CZ5H0zRGcAj/Z5u7PcpsTG1H6uomYnncCx89Y3QQEnIczM5oOey6onQQhD4kAjk54bd4QISn/wrVLMIp5vLtq1fSqJUgpmpkH/OVjttxbT4BkHt2unBDrzxfs1JTxVFWImqTh6kZzur17+41axKDp0TfArmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SThUJNlcsJAc9+AsNSqgxmIkcQoquqYi3enpGfIu/yo=;
 b=dKywEQQTSUglrXKhpkCyrnGQvmB/wj8Xuz0Z8Qjx/gb9jRKwuhslIly2BG3wnod2s4HBP5o86tKKOuVEaiJIIRMeWT13KnyeOYdSH8fPq/BHNBg6KC7sRAWfgZ85v/hOAuJD3YOZFDOUa2vdWXH/b9/KjTRffK8Pt059Kf1Joj+/2anIz7OnvGYw0mQyNW+ksyebA/DCVF+KUpcX711EwV34hSYxSyHLfwohSIlwQau/WBvZKfRp5avEMY1e+6lEH87183GPwfl3N4Wz7GrqFYUXqv6N7Pbq+7uCu47eE0E3vqAWfEvxjlGa54XtujLq8THTKM9AvMJK9g/3ittAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SThUJNlcsJAc9+AsNSqgxmIkcQoquqYi3enpGfIu/yo=;
 b=GREpk15pcGUDvY7iL8ZZrtFvckHdE5nWqjIfOP81/GV6sCDhSAzBkEl9NBnEN75472+wHV5sJz1QuVCQIrQYCwusxMPnm/ErfQ83+rAVlFfqQ2M/5+T+sc0IBr0rsMqrT57d0ql8sWd7u3ytXYKljCWZONKzWs/6ayVIino2G4s=
Received: from BN9PR03CA0053.namprd03.prod.outlook.com (2603:10b6:408:fb::28)
 by PH5PR10MB997710.namprd10.prod.outlook.com (2603:10b6:510:39d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 18:21:31 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:fb:cafe::1d) by BN9PR03CA0053.outlook.office365.com
 (2603:10b6:408:fb::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 18:21:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 18:21:30 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 12:21:29 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 12:21:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 12:21:29 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GILTeL3559057;
	Fri, 16 Jan 2026 12:21:29 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vgoRt-000000088Ks-0HmH;
	Fri, 16 Jan 2026 12:21:29 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ltp-ddt: Version bump to 20250930
Date: Fri, 16 Jan 2026 12:21:29 -0600
Message-ID: <20260116182129.1938502-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|PH5PR10MB997710:EE_
X-MS-Office365-Filtering-Correlation-Id: b15ca59b-82ea-4b79-ea65-08de552c122a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r190Kvd9cdYXPxTh4BXXlAR87tqo7esw1ryY7phVQMuX6TpREvp7gf/jQlle?=
 =?us-ascii?Q?u1YiDB9GHxBcfRW1s8vH22tW/OT+fb53+fpJZw5+r4W9TciqUWOfXoiVjF22?=
 =?us-ascii?Q?9Qczcntxgtx4H4tKFWbx1XGNeAUDcKdXVaU8p3hHsclhtSFmOYdYwDnDHxf5?=
 =?us-ascii?Q?E3dP5m+FTkvLqEmgYb6HF9MhMybUIlL6mV9VK88AIvzchQVw3GIZ3MNgKpNB?=
 =?us-ascii?Q?D6OscPQI2OdR1a+1XFds9Wwv2oF4Rvt7VnNo1/TXfLxe2CeeF69zV1Cqsh5W?=
 =?us-ascii?Q?tiZhYVjQLzvcGB8O31oa++Pxmmm9g19kUeq/UAx8Aoyi4pTJQmp75IgWkmAP?=
 =?us-ascii?Q?lh5VOo336f1lIM7cxy6A6mmu5T3ytthxmqlzQjEMR50dLm9jLZnTO808UzFK?=
 =?us-ascii?Q?We0GBgCCXFDsUMg+L5zX2xgWwWTbc50P4dAvYTQxOxh/xAukPVxDVGW14lxq?=
 =?us-ascii?Q?CiTj8Co76zgw+XSOsBl9npQadSv2YGCFLbBSktcxswKozUnjAMSVE0pf/Faq?=
 =?us-ascii?Q?Ya5F3Va0iQvFyKRftqqn7Y4iB2b/mKmVA0zOgxavSzXwkcCS5KOKyxnjO3D1?=
 =?us-ascii?Q?yDyK3MWRSTsSBXT1CNIYPwuVqg4kbmjDRO+64jvS30jxv8f+7iYLVfJlvbuV?=
 =?us-ascii?Q?PvgHjuNXJoXKGBJhzdnTIiKpogg/UKCE5kFvvrafgN+58TJgCKGI9RagVBUg?=
 =?us-ascii?Q?QFRfQczIEkmFr7WBiFCWrSrEhidBXLXHYoxBh+58gfjpWbmE6GOhNqzqtqpo?=
 =?us-ascii?Q?Av2utEKHl+4ekxslHbvgZjuZxlkniF4YFL5HhtAxe3rGFK+OVY8f4GSWQGKO?=
 =?us-ascii?Q?cYTsiMdLQlGtA8dSGRajj7ts7Vo7TCXvfJSNLbX7Y8ElPgkrCy7/A3Ved8d9?=
 =?us-ascii?Q?LmhBJOXpoTcD04vjklq2nayy3lvGAOmxoShs7luaN9VDT6xN3DzaCpGRm7oc?=
 =?us-ascii?Q?p65/b5RZlQg4pFHNa720pI8K6WyQ348MeVmFmVCCe9l+KktasVVeGK+Ox/5e?=
 =?us-ascii?Q?sGOhxSDCRV6vLKNZv34EjINiyemQ89kOyNI4t1SORP847D2FTezhMtZLqNCn?=
 =?us-ascii?Q?If1k+1aIDKlTYUvoWtCIJVecpnxTMFeaCUvuD4chS/jlU5A0iPypJXCR86tZ?=
 =?us-ascii?Q?s6tSzrBb3pGGrDLsLJ+V5SFWBAUXlwb4P4hwhaZUsTnDz1gOLAvY4B9K5UKa?=
 =?us-ascii?Q?7y7XEct8qj0kZpNKvsqX6RGv52cqFLYYcoFxmiZLdGIj4mP356QPljRqINN0?=
 =?us-ascii?Q?x8WtTpRJWVm1NOKq/8jbf9tTk8NYSDQbIjkqfCVLXW/RP3v4vDKaXDobi5m9?=
 =?us-ascii?Q?OHNebrfPLsDnwy+Ng2/4+bYLXGlUuH+0XFMv6I7UZAPnw/03E5KtKuLbHc8v?=
 =?us-ascii?Q?qUYqPahg1saezsFH2UJ1RItubOT9sOSzg2pWT/lIhtO/6DkUfHfNK5OtOAch?=
 =?us-ascii?Q?lfxE8sCsZ331FLNrTt0CVCQoOwyC03dc8SRgeGEya1l/uwz/7J5afo5+sisd?=
 =?us-ascii?Q?tzo9Vhd6C5fvSkvlvGlHGAnLh36u0hvV0ntikWVY9h8OZxourV0rm5tDeiOQ?=
 =?us-ascii?Q?9ZCeIUVDL5nVbYLfEBYex/657l5vQ/kbnAVSlXmBCGgp8gXXZFZRzREk0LSB?=
 =?us-ascii?Q?/g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:21:30.3781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b15ca59b-82ea-4b79-ea65-08de552c122a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997710
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 18:21:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16976

ltp-ddt repo has been rebased on top of 20250930, update the recipe to
match.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...-__clear_cache-declaration-for-clang.patch |  32 +++
 ...001-Remove-OOM-tests-from-runtest-mm.patch |   8 +-
 ...unt04-Update-for-6.18-kernel-headers.patch |  54 -----
 ...8-Skip-semctl08-when-__USE_TIME64_RE.patch |  45 ++++
 ...6ead3d6ef504c82551b12306e751d23ddb45.patch | 193 ++++++++++++++++++
 ...tp-ddt_20250130.bb =3D> ltp-ddt_20250930.bb} |   6 +-
 .../{ltp_20250130.inc =3D> ltp_20250930.inc}    |  12 +-
 7 files changed, 286 insertions(+), 64 deletions(-)
 create mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-A=
dd-__clear_cache-declaration-for-clang.patch
 delete mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-l=
istmount04-Update-for-6.18-kernel-headers.patch
 create mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-s=
yscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
 create mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/2d066e=
ad3d6ef504c82551b12306e751d23ddb45.patch
 rename meta-arago-test/recipes-devtools/ltp-ddt/{ltp-ddt_20250130.bb =3D> =
ltp-ddt_20250930.bb} (87%)
 rename meta-arago-test/recipes-devtools/ltp-ddt/{ltp_20250130.inc =3D> ltp=
_20250930.inc} (92%)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-__cl=
ear_cache-declaration-for-clang.patch b/meta-arago-test/recipes-devtools/lt=
p-ddt/ltp-ddt/0001-Add-__clear_cache-declaration-for-clang.patch
new file mode 100644
index 00000000..24e8762f
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-__clear_cac=
he-declaration-for-clang.patch
@@ -0,0 +1,32 @@
+From a2ce04cb82d545f3dbab71de7fa55eaad3df3063 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Jun 2024 22:52:56 -0700
+Subject: [PATCH] Add __clear_cache declaration for clang
+
+__clear_cache was enabled on RISCV recently with 7352ba02390116f1cd6a9b583=
860ba28aa0a1b7a
+however it fails to compile with clang19 on RISCV
+With this error
+
+  hugemmap15.c:51:2: error: call to undeclared function '__clear_cache'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
+      51 |         __clear_cache(p, p + COPY_SIZE);
+         |         ^
+
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2024-June=
/038762.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Hui Min Mina Chou <minachou@andestech.com>
+---
+ testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c b/testcase=
s/kernel/mem/hugetlb/hugemmap/hugemmap15.c
+index 1dde9e87b..6a6f5fe5e 100644
+--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
++++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
+@@ -19,6 +19,7 @@
+=20
+ #if defined(__clang__)
+ 	#pragma clang optimize off
++	void __clear_cache(void *start, void *end);
+ #endif
+=20
+ #define _GNU_SOURCE
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Remove-O=
OM-tests-from-runtest-mm.patch b/meta-arago-test/recipes-devtools/ltp-ddt/l=
tp-ddt/0001-Remove-OOM-tests-from-runtest-mm.patch
index 5b6c780b..860b2f12 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Remove-OOM-test=
s-from-runtest-mm.patch
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Remove-OOM-test=
s-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From 768159aa53257d247645a12518778f50b8fdf578 Mon Sep 17 00:00:00 2001
+From bb9146dd322af98a7bb96ad0d84ec376589c6cde Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
@@ -14,12 +14,12 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
  1 file changed, 6 deletions(-)
=20
 diff --git a/runtest/mm b/runtest/mm
-index 6a8cd0b9d..8ce3f4416 100644
+index 41d624ad8..1e8c22638 100644
 --- a/runtest/mm
 +++ b/runtest/mm
-@@ -76,12 +76,6 @@ ksm07 ksm07
-=20
+@@ -69,12 +69,6 @@ ksm07 ksm07
  cpuset01 cpuset01
+ cpuset02 cpuset02
 =20
 -oom01 oom01
 -oom02 oom02
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-listmoun=
t04-Update-for-6.18-kernel-headers.patch b/meta-arago-test/recipes-devtools=
/ltp-ddt/ltp-ddt/0001-listmount04-Update-for-6.18-kernel-headers.patch
deleted file mode 100644
index 2c002e40..00000000
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-listmount04-Upd=
ate-for-6.18-kernel-headers.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 2dab76490d8d9b30119204a6376e00176fad9b07 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Mon, 29 Dec 2025 12:42:29 -0600
-Subject: [PATCH] listmount04: Update for 6.18 kernel headers
-
-The spare slot is now being used as of the 6.18 kernel.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- testcases/kernel/syscalls/listmount/listmount04.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/listmount/listmount04.c b/testcases=
/kernel/syscalls/listmount/listmount04.c
-index d38408d2c..2053532f6 100644
---- a/testcases/kernel/syscalls/listmount/listmount04.c
-+++ b/testcases/kernel/syscalls/listmount/listmount04.c
-@@ -28,7 +28,7 @@ static uint64_t mnt_ids[MNT_SIZE];
- static struct tcase {
- 	int req_usage;
- 	uint32_t size;
--	uint32_t spare;
-+	uint32_t mnt_ns_fd;
- 	uint64_t mnt_id;
- 	uint64_t param;
- 	uint64_t *mnt_ids;
-@@ -75,12 +75,12 @@ static struct tcase {
- 	{
- 		.req_usage =3D 1,
- 		.size =3D MNT_ID_REQ_SIZE_VER0,
--		.spare =3D -1,
-+		.mnt_ns_fd =3D -1,
- 		.mnt_id =3D LSMT_ROOT,
- 		.mnt_ids =3D mnt_ids,
- 		.nr_mnt_ids =3D MNT_SIZE,
- 		.exp_errno =3D EINVAL,
--		.msg =3D "invalid mnt_id_req.spare",
-+		.msg =3D "invalid mnt_id_req.mnt_ns_fd",
- 	},
- 	{
- 		.req_usage =3D 1,
-@@ -124,7 +124,7 @@ static void run(unsigned int n)
- 		req->mnt_id =3D tc->mnt_id;
- 		req->param =3D tc->param;
- 		req->size =3D tc->size;
--		req->spare =3D tc->spare;
-+		req->mnt_ns_fd =3D tc->mnt_ns_fd;
- 	}
-=20
- 	TST_EXP_FAIL(tst_syscall(__NR_listmount, req, tc->mnt_ids,
---=20
-2.43.0
-
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-syscalls=
-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch b/meta-arago-test/recipe=
s-devtools/ltp-ddt/ltp-ddt/0001-syscalls-semctl08-Skip-semctl08-when-__USE_=
TIME64_RE.patch
new file mode 100644
index 00000000..364e203e
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-syscalls-semctl=
08-Skip-semctl08-when-__USE_TIME64_RE.patch
@@ -0,0 +1,45 @@
+From 09364a758df9d89a0968894376f82f636441addb Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Fri, 23 May 2025 15:17:49 +0800
+Subject: [PATCH] syscalls/semctl08: Skip semctl08 when __USE_TIME64_REDIRE=
CTS
+ is defined
+
+When __USE_TIME64_REDIRECTS is defined, glibc redirects struct semid_ds to=
 a
+64-bit time-safe version that omits the sem_otime_high and sem_ctime_high
+fields. As a result, the case becomes invalid and leads to incorrect behav=
ior.
+
+This patch adds a check to skip the test when __USE_TIME64_REDIRECTS is
+defined, ensuring the test only runs when semid_ds structurally matches
+semid64_ds and the *_high fields are accessible.
+
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2025-May/=
043647.html]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ testcases/kernel/syscalls/ipc/semctl/semctl08.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/k=
ernel/syscalls/ipc/semctl/semctl08.c
+index f4549adf4..28776f266 100644
+--- a/testcases/kernel/syscalls/ipc/semctl/semctl08.c
++++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
+@@ -12,7 +12,11 @@
+ #include "tst_test.h"
+ #include "libnewipc.h"
+=20
+-#ifdef HAVE_SEMID64_DS_TIME_HIGH
++#if !defined(HAVE_SEMID64_DS_TIME_HIGH)
++TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fie=
lds");
++#elif defined(__USE_TIME64_REDIRECTS)
++TST_TEST_TCONF("test requires __USE_TIME64_REDIRECTS to be undefined");
++#else
+=20
+ static void run(void)
+ {
+@@ -49,6 +53,4 @@ static struct tst_test test =3D {
+ 	.test_all =3D run,
+ 	.needs_tmpdir =3D 1,
+ };
+-#else
+-TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fie=
lds");
+ #endif
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/2d066ead3d6ef=
504c82551b12306e751d23ddb45.patch b/meta-arago-test/recipes-devtools/ltp-dd=
t/ltp-ddt/2d066ead3d6ef504c82551b12306e751d23ddb45.patch
new file mode 100644
index 00000000..1c06e254
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/2d066ead3d6ef504c825=
51b12306e751d23ddb45.patch
@@ -0,0 +1,193 @@
+From 2d066ead3d6ef504c82551b12306e751d23ddb45 Mon Sep 17 00:00:00 2001
+From: Wei Gao <wegao@suse.com>
+Date: Sun, 14 Dec 2025 02:15:20 +0000
+Subject: [PATCH] listmount04.c: Update struct mnt_id_req support for kerne=
l >=3D 6.18
+
+Kernel change from v6.18-rc7
+78f0e33cd6c93 ("fs/namespace: correctly handle errors returned by grab_req=
uested_mnt_ns")
+causes the test failure with following error message:
+listmount04.c:128: TFAIL: invalid mnt_id_req.spare expected EINVAL: EBADF =
(9)
+
+The fix require following changes:
+
+* struct mnt_id_req got new member mnt_ns_fd in v6.18-rc7.  That is
+fixed in a fallback defintion in lapi/. If the fallback is used is now
+done via typedef (that requires also update in statmount.h).
+
+* New kernels (>=3D 6.18) have also different errno. This is fixed by
+runtime check.
+
+Link: https://lore.kernel.org/ltp/20251214021541.3256-1-wegao@suse.com/
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Reviewed-by: Li Wang <liwang@redhat.com>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Signed-off-by: Wei Gao <wegao@suse.com>
+[ pvorel: Shorten TCONF, rewrite commit message ]
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+---
+ configure.ac                                  |  2 +-
+ include/lapi/mount.h                          | 10 +++--
+ .../kernel/syscalls/listmount/listmount.h     |  2 +-
+ .../kernel/syscalls/listmount/listmount04.c   | 37 +++++++++++++++++--
+ .../kernel/syscalls/statmount/statmount.h     |  2 +-
+ 5 files changed, 44 insertions(+), 9 deletions(-)
+
+Upstream-Status: Backport
+
+Index: ltp-20250930/configure.ac
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ltp-20250930.orig/configure.ac
++++ ltp-20250930/configure.ac
+@@ -262,7 +262,7 @@ AC_CHECK_TYPES([struct cachestat_range],
+ AC_CHECK_TYPES([struct cachestat],,,[#include <sys/mman.h>])
+=20
+ # Defined in <linux/mount.h>, but include/lapi/mount.h includes <sys/moun=
t.h> */
+-AC_CHECK_TYPES([struct mnt_id_req],,,[#include <sys/mount.h>])
++AC_CHECK_MEMBERS([struct mnt_id_req.mnt_ns_fd],,,[#include <sys/mount.h>]=
)
+ AC_CHECK_TYPES([struct statmount],,,[#include <sys/mount.h>])
+ AC_CHECK_MEMBERS([struct statmount.mnt_ns_id],,,[#include <unistd.h>
+ #include <linux/mount.h>])
+Index: ltp-20250930/include/lapi/mount.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ltp-20250930.orig/include/lapi/mount.h
++++ ltp-20250930/include/lapi/mount.h
+@@ -45,14 +45,18 @@
+ # define MS_NOSYMFOLLOW 256
+ #endif
+=20
+-#ifndef HAVE_STRUCT_MNT_ID_REQ
+-struct mnt_id_req {
++struct mnt_id_req_fallback {
+ 	uint32_t size;
+-	uint32_t spare;
++	uint32_t mnt_ns_fd;
+ 	uint64_t mnt_id;
+ 	uint64_t param;
+ 	uint64_t mnt_ns_id;
+ };
++
++#ifndef HAVE_STRUCT_MNT_ID_REQ_MNT_NS_FD
++typedef struct mnt_id_req_fallback mnt_id_req;
++#else
++typedef struct mnt_id_req mnt_id_req;
+ #endif
+=20
+ #ifndef HAVE_STRUCT_STATMOUNT
+Index: ltp-20250930/testcases/kernel/syscalls/listmount/listmount.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ltp-20250930.orig/testcases/kernel/syscalls/listmount/listmount.h
++++ ltp-20250930/testcases/kernel/syscalls/listmount/listmount.h
+@@ -15,7 +15,7 @@
+ static inline ssize_t listmount(uint64_t mnt_id, uint64_t last_mnt_id,
+ 			 uint64_t list[], size_t num, unsigned int flags)
+ {
+-	struct mnt_id_req req =3D {
++	mnt_id_req req =3D {
+ 		.size =3D MNT_ID_REQ_SIZE_VER0,
+ 		.mnt_id =3D mnt_id,
+ 		.param =3D last_mnt_id,
+Index: ltp-20250930/testcases/kernel/syscalls/listmount/listmount04.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ltp-20250930.orig/testcases/kernel/syscalls/listmount/listmount04.c
++++ ltp-20250930/testcases/kernel/syscalls/listmount/listmount04.c
+@@ -14,14 +14,18 @@
+=20
+ #define _GNU_SOURCE
+=20
++#include "config.h"
+ #include "tst_test.h"
+ #include "lapi/mount.h"
+ #include "lapi/syscalls.h"
+=20
+ #define MNT_SIZE 32
++#define BEFORE_6_18 1
++#define AFTER_6_18 2
+=20
+-static struct mnt_id_req *request;
++static mnt_id_req *request;
+ static uint64_t mnt_ids[MNT_SIZE];
++static int kver;
+=20
+ static struct tcase {
+ 	int req_usage;
+@@ -34,6 +38,7 @@ static struct tcase {
+ 	uint64_t flags;
+ 	int exp_errno;
+ 	char *msg;
++	int kver;
+ } tcases[] =3D {
+ 	{
+ 		.req_usage =3D 0,
+@@ -79,6 +84,18 @@ static struct tcase {
+ 		.nr_mnt_ids =3D MNT_SIZE,
+ 		.exp_errno =3D EINVAL,
+ 		.msg =3D "invalid mnt_id_req.spare",
++		.kver =3D BEFORE_6_18,
++	},
++	{
++		.req_usage =3D 1,
++		.size =3D MNT_ID_REQ_SIZE_VER0,
++		.spare =3D -1,
++		.mnt_id =3D LSMT_ROOT,
++		.mnt_ids =3D mnt_ids,
++		.nr_mnt_ids =3D MNT_SIZE,
++		.exp_errno =3D EBADF,
++		.msg =3D "invalid mnt_id_req.mnt_ns_fd",
++		.kver =3D AFTER_6_18,
+ 	},
+ 	{
+ 		.req_usage =3D 1,
+@@ -113,7 +130,12 @@ static struct tcase {
+ static void run(unsigned int n)
+ {
+ 	struct tcase *tc =3D &tcases[n];
+-	struct mnt_id_req *req =3D NULL;
++	mnt_id_req *req =3D NULL;
++
++	if (tc->kver && tc->kver !=3D kver) {
++		tst_res(TCONF, "Test not suitable for current kernel version");
++		return;
++	}
+=20
+ 	memset(mnt_ids, 0, sizeof(mnt_ids));
+=20
+@@ -122,7 +144,7 @@ static void run(unsigned int n)
+ 		req->mnt_id =3D tc->mnt_id;
+ 		req->param =3D tc->param;
+ 		req->size =3D tc->size;
+-		req->spare =3D tc->spare;
++		req->mnt_ns_fd =3D tc->spare;
+ 	}
+=20
+ 	TST_EXP_FAIL(tst_syscall(__NR_listmount, req, tc->mnt_ids,
+@@ -130,8 +152,17 @@ static void run(unsigned int n)
+ 		"%s", tc->msg);
+ }
+=20
++static void setup(void)
++{
++	if (tst_kvercmp(6, 18, 0) >=3D 0)
++		kver =3D AFTER_6_18;
++	else
++		kver =3D BEFORE_6_18;
++}
++
+ static struct tst_test test =3D {
+ 	.test =3D run,
++	.setup =3D setup,
+ 	.tcnt =3D ARRAY_SIZE(tcases),
+ 	.min_kver =3D "6.8",
+ 	.bufs =3D (struct tst_buffers []) {
+Index: ltp-20250930/testcases/kernel/syscalls/statmount/statmount.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ltp-20250930.orig/testcases/kernel/syscalls/statmount/statmount.h
++++ ltp-20250930/testcases/kernel/syscalls/statmount/statmount.h
+@@ -16,7 +16,7 @@
+ static inline int statmount(uint64_t mnt_id, uint64_t mask, struct statmo=
unt *buf,
+ 		     size_t bufsize, unsigned int flags)
+ {
+-	struct mnt_id_req req =3D {
++	mnt_id_req req =3D {
+ 		.size =3D MNT_ID_REQ_SIZE_VER0,
+ 		.mnt_id =3D mnt_id,
+ 		.param =3D mask,
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
similarity index 87%
rename from meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
rename to meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
index 11bbf13a..96250e09 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
@@ -1,3 +1,5 @@
+FILESEXTRAPATHS:prepend :=3D "${TITESTBASE}/recipes-devtools/ltp-ddt/ltp-d=
dt:"
+
 require ltp_${PV}.inc
=20
 SUMMARY =3D "Embedded Linux Device Driver Tests based on Linux Test Projec=
t"
@@ -9,14 +11,12 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "d23395da4e67855a7d7ce476e44f79b8e604998e"
+SRCREV =3D "be5e3b1ceaf18498c4586e9806ff2783ab336072"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
 SRC_URI:prepend =3D "git://git.ti.com/git/test-automation/ltp-ddt.git;prot=
ocol=3Dhttps;branch=3D${BRANCH} "
=20
-SRC_URI +=3D "file://0001-listmount04-Update-for-6.18-kernel-headers.patch=
"
-
 export prefix =3D "/opt/ltp"
 export exec_prefix =3D "/opt/ltp"
=20
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc b/me=
ta-arago-test/recipes-devtools/ltp-ddt/ltp_20250930.inc
similarity index 92%
rename from meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
rename to meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250930.inc
index 5e0163e0..30897de7 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250930.inc
@@ -24,11 +24,14 @@ TUNE_CCARGS:remove:x86-64 =3D "-mfpmath=3Dsse"
=20
 CFLAGS:append:powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
-SRCREV =3D "a7c31dff7edc089a32e990765e12952cc4d7666a"
+SRCREV =3D "d2550ffbbcfe163212cd7e9c132db65ae0fa06ed"
=20
 SRC_URI =3D "git://github.com/linux-test-project/ltp.git;branch=3Dmaster;p=
rotocol=3Dhttps \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           "
+           file://0001-Add-__clear_cache-declaration-for-clang.patch \
+           file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_R=
E.patch \
+           file://2d066ead3d6ef504c82551b12306e751d23ddb45.patch \
+          "
=20
 inherit autotools-brokensep pkgconfig
=20
@@ -117,6 +120,8 @@ FILES:${PN} +=3D "${prefix}/* ${prefix}/runtest/* ${pre=
fix}/scenario_groups/* ${pr
 INHIBIT_PACKAGE_STRIP_FILES =3D "${prefix}/testcases/bin/nm01 ${prefix}/te=
stcases/bin/ldd01"
 INSANE_SKIP:${PN} +=3D "already-stripped staticdev"
=20
+CACHED_CONFIGUREVARS:libc-musl =3D "ac_cv_type_struct_mnt_id_req=3Dno ac_c=
v_type_struct_statmount=3Dno"
+
 remove_broken_musl_sources() {
 	[ "${TCLIBC}" =3D "musl" ] || return 0
=20
@@ -130,7 +135,8 @@ remove_broken_musl_sources() {
 		testcases/kernel/syscalls/getcontext/getcontext01.c \
 		testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
 		testcases/kernel/syscalls/timer_create/timer_create01.c \
-		testcases/kernel/syscalls/timer_create/timer_create03.c
+		testcases/kernel/syscalls/timer_create/timer_create03.c \
+		testcases/kernel/syscalls/statmount/statmount02.c
 }
 do_patch[postfuncs] +=3D "remove_broken_musl_sources"
=20
--=20
2.43.0


