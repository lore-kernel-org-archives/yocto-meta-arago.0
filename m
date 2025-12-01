Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CD3D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 18:41:16 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.106.1764614467626665020
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 10:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=HsstTPKZ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.41, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDC+mR8kV8guZSpRoo2UFSrBxv9kWlYxfqMipRl76ooE7qafgpnTu9wwtFOatL2kofv4rBJ/4+NSXhpqpuGcXK1D3yEyOkF7fXKKSoZtcbs17e4zGOB/BWg5Ao7pSVjJ4n1EK8JHM2NZNNOzfdrntxzNAVRounPiKmyUYilcaSDP/w+DgL3AojSugQbyAaYZUZTj1LUbj8PQybn58nzK2/O0l6NN2qo4dI8ezQR1yVSSl9ruv0mLdIKVFy/4xvZz3AYPdcSrtT4vun/0aLGzAGsOFjQE9Ml80BLH2c17SzrviZ7Vylen9n3pseUDr/c7DSM6L0HXgZxz+ZfebXSJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiQhg4vzxwxQSY3vQ5VI0TzRbPN9Exx2JmhczEJFjKQ=;
 b=Tqc0ATN9bO9B4plSpHWndnTkMn/TeZyLpkf8VJ6QgNr1qmYv91RtOIV3nwrm6ibD18ENbA34wl4BSNMjmfJSJu1pCbjGv3u5baHcQkdrOgwaeHnqGGjoBmXjlgWB1SudH9oaRcelewWTB0IDNsN4MxVGP9nRzDuECdBbPVEwBWjyF1CBZtu34JzFxW89AK8R+UYkSxuiO1yuoGkrU1TR5PCdBAbwMSErdI9YbGndmNcutZIKHL+XyVXR7VkkNQL99FC1PRcMeDMyPrnsPTrH7BS+ajKJBvTDUVGRxz8/W0nFN4Fh8ZH9IgHF2733rBZYYqLpVjoKfvhcYogUcpZtrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiQhg4vzxwxQSY3vQ5VI0TzRbPN9Exx2JmhczEJFjKQ=;
 b=HsstTPKZtJfZGk/hjwZqC4zGgizLb2Mir2W00zUc3Z3FFg89AvPA0Q/bCRK77vvFaYu9xQ8WTV52mROdcmDqshhaTfuJn+j85nCA8hj/ySZWpvDZKN+KpdxASX/cvupZMRGRlyxSINxihkpx8hENvR6L8hS5Dstccf0+9yzsKi4=
Received: from PH8P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::8)
 by SA3PR10MB7095.namprd10.prod.outlook.com (2603:10b6:806:31e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 18:41:03 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::de) by PH8P220CA0027.outlook.office365.com
 (2603:10b6:510:348::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 18:41:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 18:41:02 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 12:41:01 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 12:41:00 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 12:41:00 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1If0Qg917893;
	Mon, 1 Dec 2025 12:41:00 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vQ8pY-00000005kwZ-2lHC;
	Mon, 01 Dec 2025 12:41:00 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] coremark: Clean up buildpaths QA error
Date: Mon, 1 Dec 2025 12:41:00 -0600
Message-ID: <20251201184100.1372032-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|SA3PR10MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: de7605cb-8861-42e7-20a3-08de31092de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EmAZ0qCeqePXc8tWkOGpQ7BQTpt5nIGh87S/4P1O7lL+T9bUeRBMZXO7ZT6a?=
 =?us-ascii?Q?sNH78QL/IlBLLCltqp/+9H3hNZSr7DOdRFWVo9aycLpkr8YBNF2AxY43RqhM?=
 =?us-ascii?Q?WV7gHG/gV8dIoSt758O7LdYOj88l2uUyOyGiWo7R+xYZb4gQZwkxn5/oAoD/?=
 =?us-ascii?Q?OTldQKyuxXtkpGvOXHOlzjMKPwZeYK2jA5mpu8seQThf0Z8jP0QmxqlgcEsv?=
 =?us-ascii?Q?fOskeHY42xHJK239j/iJ5MGqg3BUEnOIloEabmcl9C7zwlXB1/OeC7x8w2+A?=
 =?us-ascii?Q?b2xA2SK3dB7jVhVSMU6aSXcmeDZUBEOoD6sRxX/AhuLpw4OYwWed5nJqhwFf?=
 =?us-ascii?Q?NLt/238FwgMSRqjTsGc8D95Tsj+PjVCo6PY36iTov9KBWQJ3nZIVI5caPlfC?=
 =?us-ascii?Q?gbLWOWe4CQU3LHyS3EwRtMG8oEajqy4xB118KjBrNQXw1See6no51VUUm4LN?=
 =?us-ascii?Q?0pCKsv7dA9N2iDKELODHrblhU3mcm8pcNGWWP9ZiEwAXlb9f2xPQ9LpLxzGq?=
 =?us-ascii?Q?aX0uyFIkteH2KCBedjnoW0GXwwXsmcHCGkabTH0YpqrAJHfP59CGUwQZAOnu?=
 =?us-ascii?Q?HFiIl6WZ5rDn1xLABl90L9uP2+HLdISiWc4NvcFzs/NizcOHB3HuiWK2I6nm?=
 =?us-ascii?Q?iObciD4tuzQFQ+fyElGYVxIxL2yyvJsLWt5tTnX6dCMjHXFS4B4A9kwcIJA/?=
 =?us-ascii?Q?91a4FP9dYZOCgghBS0CoOefUYHyWRFE2sPwp/G8y/YV5hgzPAS1DZVMb0MhJ?=
 =?us-ascii?Q?UDCHUCDA92yPMnm9Xs3jZ2efpenxE3HYNiZmAbKB0NB2XkbEv+8Gy5RHZ2Mi?=
 =?us-ascii?Q?jXGxoSaKEFdTpVuFXPy5V9shAa5R3wcybiapuplv9EMx1Ng6AEyBlwliwHzg?=
 =?us-ascii?Q?xpDbZwbEN8pepDNMzww1nHKKYIKnTEERqxvJJVhUYsd1WN1/0OlqZHrumomy?=
 =?us-ascii?Q?+c5DVfr9M2/y0vX74eKiBdJdseCEFx6kuM8jwkh0owNRmx2dghDnjhY4mhkZ?=
 =?us-ascii?Q?O5kZYozNwRdbMoOe8KPgiHrOvxK2Ftynlw5zvdcRjJWSpwHo6Yy/HYU1U5oG?=
 =?us-ascii?Q?2v8/Y8Bi4WYChguf5pTNwrtZUq0i+paHwW3uu7gxaGp3DP3CRWbLTNgMp/tD?=
 =?us-ascii?Q?IGDMtAGNb98u0Vi16FwCzH+SQVk6rc6XuYC6OEJr1bqTzhrAG5luaz0AuBYk?=
 =?us-ascii?Q?GHSklL62TeSnNJVJrrk8MiZMCvbaPW9SBhvA3quASN1xEvb56bfB4gU9iDbx?=
 =?us-ascii?Q?z9YETTRLVOq7aAj+YeAxeqJ58K6c+cnC+V6c9wn7kpcC0C181g3KCCZkKu3z?=
 =?us-ascii?Q?Jij3SU3LUPgvtMZo8xcftNwxBpnGrynJkCkSHEvrJfb4gucJYfsakgjd8Obg?=
 =?us-ascii?Q?+lAuxWBoVz/gEUch3ooSddX6XJPV9qEtzu6p55GfqfFd6VLviBWFxEi5uYbk?=
 =?us-ascii?Q?7cp4V69YHNIu/R4i3jhlHwOQ90PnWTsvNzqrvgClvrSRb6XnLotrAAcLTgl8?=
 =?us-ascii?Q?Ey8ijbFuAzZZEUvvYfYp/tvT6TQBYPVGFtnAhH/FDB9LuHNxMsTlB0o+C6kV?=
 =?us-ascii?Q?tbXORPf6bx96/bhyUMI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 18:41:02.6906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de7605cb-8861-42e7-20a3-08de31092de3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7095
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Dec 2025 18:41:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16843

The coremark binary includes a copy of the compiler flags in the output
which breaks the reproducible build tenet of Yocto.  This patch simply
replaces COMPILER_FLAGS with "".

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ..._main-Remove-printing-compiler-flags.patch | 41 +++++++++++++++++++
 .../coremark/coremark_git.bb                  |  5 ++-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark/000=
1-core_main-Remove-printing-compiler-flags.patch

diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark/0001-core_=
main-Remove-printing-compiler-flags.patch b/meta-arago-test/recipes-benchma=
rk/coremark/coremark/0001-core_main-Remove-printing-compiler-flags.patch
new file mode 100644
index 00000000..ef7c78b2
--- /dev/null
+++ b/meta-arago-test/recipes-benchmark/coremark/coremark/0001-core_main-Re=
move-printing-compiler-flags.patch
@@ -0,0 +1,41 @@
+From 0af4e2298ccacc8afc0294b7a731f0e866155427 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Mon, 1 Dec 2025 12:21:23 -0600
+Subject: [PATCH] core_main: Remove printing compiler flags
+
+Reproducible builds do not like including anything that references the
+build environment on the host machine.  This would include printing out
+the COMPILER_FLAGS macro.  Substitute it with "".
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ core_main.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/core_main.c b/core_main.c
+index a4beeb6..f0ab87f 100644
+--- a/core_main.c
++++ b/core_main.c
+@@ -380,7 +380,7 @@ for (i =3D 0; i < MULTITHREAD; i++)
+     ee_printf("Iterations       : %lu\n",
+               (long unsigned)default_num_contexts * results[0].iterations=
);
+     ee_printf("Compiler version : %s\n", COMPILER_VERSION);
+-    ee_printf("Compiler flags   : %s\n", COMPILER_FLAGS);
++    ee_printf("Compiler flags   : %s\n", ""); //Reproducible build fix: C=
OMPILER_FLAGS);
+ #if (MULTITHREAD > 1)
+     ee_printf("Parallel %s : %d\n", PARALLEL_METHOD, default_num_contexts=
);
+ #endif
+@@ -410,7 +410,7 @@ for (i =3D 0; i < MULTITHREAD; i++)
+                       default_num_contexts * results[0].iterations
+                           / time_in_secs(total_time),
+                       COMPILER_VERSION,
+-                      COMPILER_FLAGS);
++                      ""); //Reproducible build fix: COMPILER_FLAGS);
+ #if defined(MEM_LOCATION) && !defined(MEM_LOCATION_UNSPEC)
+             ee_printf(" / %s", MEM_LOCATION);
+ #else
+--=20
+2.43.0
+
diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb b/m=
eta-arago-test/recipes-benchmark/coremark/coremark_git.bb
index 1e002c06..9d770c44 100644
--- a/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
+++ b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
@@ -3,7 +3,10 @@ SUMMARY =3D "The benchmark utility to measure the performa=
nce of CPU"
 LICENSE =3D "Coremark"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D0a18b17ae63deaa8a595035f668a=
ebe1"
=20
-SRC_URI =3D "git://github.com/eembc/coremark.git;branch=3Dmain;protocol=3D=
https"
+SRC_URI =3D " \
+    git://github.com/eembc/coremark.git;branch=3Dmain;protocol=3Dhttps \
+    file://0001-core_main-Remove-printing-compiler-flags.patch \
+"
 PV =3D "1.01+git"
 SRCREV =3D "1f483d5b8316753a742cbf5590caf5bd0a4e4777"
=20
--=20
2.43.0


