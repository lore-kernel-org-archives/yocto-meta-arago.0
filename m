Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4B6F4BB95
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 22:22:16 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32679.1771971730621154814
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 14:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=OrJYo+Ys;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.32, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRXvLfCiezJtnwyJCzZWuhSizv5crGbbEG6nJspmAHkvtEbnS14uuaTXFlWqHyRzdTz+lj2+k9FjjTIw220UjYmHkswC7dDDTHtRkjWRzlMpVeKyoDkKH9jfWMiGHoNjIg1x/VhxzsteLnUnHL6a3Z8dZXYP2UaponSglU6tpzKaSEro9EE0Jk42LpNOinieEPltQMQ6fcS554lKpYKTjITtd3yPte4JOVLDhtGlOkrQvxxYbe7kBNjarIR1YjRo0ChddI1pRRfpla/5tybxGYGuCiTBuPZfwL71BF+iOlYYVECGZT9+lpeowGg3JMg/J1u3cJIWyWc4ZED9JCnaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2vMUPQPbdcpmpryW46v/pZTAuKJvK80V8ezRUXmGXc=;
 b=hksKtb4Uy7f0fOvzYKb9LgSzTYfBRtIlN2CPnV24Ob+0zzBQ+MinxSxtdPD/GrPw2WeJtlAspdfAcZpMoODrCFB8BMYRvKK5FzICVbAZdT2QTklJATNj+8ezT7Tnlwqs2I4nMl5oHngkW0weCigoPbcM7tR//+JncojHpel7l+6Plk6nX7fceURPVaiXIJKnTyYI0BbJ6r/8I82Hyeyap9g69MkXfSJYPYJ4rQDSCYHNg9aL7MWD/aZ/KLkpDypGIERrrmBST1mPCG9utIQzo+quMeJzayVYPPFuwKIjqSGEkBlt/hQxogofIjzWlemuHxDQsE8t/iWkCZr5oExGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2vMUPQPbdcpmpryW46v/pZTAuKJvK80V8ezRUXmGXc=;
 b=OrJYo+YsYAdFAoOy04wxNaasJc6fsFVqpApKQphkQeVfJN35o7XzDhLvMTrGXa0uGY2R5A3x3c7p7eiY5x381epquCkU+E7SbjmUTMWcapZ2VnLyxu+GGYcd6xN8FjUOHF5nVKLqKdiQX6OkJt1aOt5CWy3PiIfadLqHv9e6XZQ=
Received: from SN7PR04CA0168.namprd04.prod.outlook.com (2603:10b6:806:125::23)
 by CY8PR10MB6491.namprd10.prod.outlook.com (2603:10b6:930:5d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Tue, 24 Feb
 2026 22:22:07 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:125:cafe::b9) by SN7PR04CA0168.outlook.office365.com
 (2603:10b6:806:125::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 22:21:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 22:22:05 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 16:22:05 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 16:22:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 16:22:05 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OMM5Xx3491331;
	Tue, 24 Feb 2026 16:22:05 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vv0n7-00000005R2W-0pkZ;
	Tue, 24 Feb 2026 16:22:05 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] iperf: Remove old recipe
Date: Tue, 24 Feb 2026 16:22:01 -0600
Message-ID: <20260224222205.1295569-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|CY8PR10MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 275423d7-8a05-4e5f-16b1-08de73f32463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|34070700014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iFONVPw8Y32mONRjjr4i/hR9E6W1pUvOP83pgk5hqAgW4bKLzLS4vYG5d9Nr?=
 =?us-ascii?Q?pxspvPaXM4G0Reqt3pWsJqRQRfw9cwtZLNcn2eow8HpkBmmA8AUz0Ugls4dQ?=
 =?us-ascii?Q?4y/yoB6nNLn9vN/UquTkYkuzN5eeKVuOMJi6YvyVw4X7Zh0uCHTq6HLLTxvH?=
 =?us-ascii?Q?T2rmOq4Lu6h4BEz6rnaFr0eYm8kMBFht7RWXqsm6mw9hWeHuU1UO3QnjDFn/?=
 =?us-ascii?Q?DRIr8wJLP2kKicNFWeJW15IrzJursQCSjL6eHxRQpJFh8nDRPtbbv5MGPAc1?=
 =?us-ascii?Q?xVh0zFFpVoOqU1hFJFUKcR5FHICDwXBn6y0WrkcVjcSp/bZOkJlBSuXcTzSl?=
 =?us-ascii?Q?2XT+kqwGzddNAGoFOWQ6gbdfV+phLFcqGXuKuSQSxGeAvmBeaWn1Oq8ocaKI?=
 =?us-ascii?Q?X5v5lBsSV7i4fzsrNgMTG2TGHmwY1SxGkcnaqRe4RdFDNcZNJ/ePuApK3G9O?=
 =?us-ascii?Q?ytizY8bedWgYR/tfjK0DCG+pPd0bvd4xqLkc22xLGAyI0fKv+6J85fgErY0F?=
 =?us-ascii?Q?+EnytRYeEUdra1MpiOo9s3fkrQtMgalEsZrbCT/8sITA7G+Av3r7lveroU6U?=
 =?us-ascii?Q?hsVIVmUGYawvhDwXocnZ3QyEiOGcmfaWc2v2DynmAxWhc5LT4ZZ5USEy5Dcr?=
 =?us-ascii?Q?RhmsioriURSbsaA7RIRA52lhiilUc4qrzRj6osxcCV8VBURjd0+9wTBfXmXj?=
 =?us-ascii?Q?vM3ruqRe3jK2hff1Xj6BtG6PkxQQuIYNcON/0pa4GitAYglX8AXiI/Zdlp1Q?=
 =?us-ascii?Q?Oqy0koALS5KqTWaUziw0em7Qn5WYBqhJEtWeobEsPkRoe2DNjrM4KBCfbWZL?=
 =?us-ascii?Q?8d3L3tRGciz3KvwxgkDSyNxGlmq35zpXasCtSCucW9r1/L4oEGTHfhE2mEzJ?=
 =?us-ascii?Q?OyTZf7Z4hCzFmcFvozhEn5J24JdwsQ9fkftPF/dyKVzrmULFjLKT6cyMAwEs?=
 =?us-ascii?Q?xjhBOauLtz5MFfEvEb4W2jSwi4iTLY5AgeXCqTBbXjYC+Z46wqaCL9YqJUyp?=
 =?us-ascii?Q?Y9Ksx3hCKxpf1AZ/Tg/i/eWEL+MGjIhR0BujaJjxGzNZio1xY6M1m3CWCA5z?=
 =?us-ascii?Q?N9KgcgO9vQ3852OxV5CuVXzYGnW5sATkV3Tlid/iLEld5MS/YAhTQj7aQBVI?=
 =?us-ascii?Q?Tco++siMEqLfof2m+JCJ/kgwNJwNi+bNRQ+c3v047m6B4zSsdeFJIURGE6U6?=
 =?us-ascii?Q?UCacvewWzxeqMhDLz17u2TaU3uW4xjT+3LHzn/Vm6Izv1bOLykGAa1wzX0pu?=
 =?us-ascii?Q?is2QJpv1oTXbLtgS/VwHfZ5LDix4m3cJu8U1tf4ELxn9XEqe2We0fqXwwNnt?=
 =?us-ascii?Q?aTqoFJ9k3OzF2cXgHYqufq0PM2KH/R23k9kAmsTkpsGdq+pQZPfC34EP+/OR?=
 =?us-ascii?Q?VP9dhUX+yCP5TC5/8mW9dQU4wigV0JKZ+cjC9CQvmS8S0ssspWHmdO/+KTj0?=
 =?us-ascii?Q?Z96QgIxeFEyo6cAqchtoZ+/LYswwfjR3YxJ+5znJ+PneCWvAxmPaOFWaL+Vz?=
 =?us-ascii?Q?hBF1iFZHB4DtFubmFO3SCeeGvEaNN2SvSz+9ccPiFYBsUhUnZGHrBz+/xKhi?=
 =?us-ascii?Q?aDI/r/zcpB9uCYAI63/pBXNj1i75kYP+yNHP++uu20iWHDg4EKLGpO8u04Hr?=
 =?us-ascii?Q?Vg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34070700014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Pw6gZCwkUW5uI+lEr8uKTv/UIcbmDNn+Wf2gB2oYbS2dEn1eRy0wvIrBVslbuFIlLS+cKlGnFJFbtEY1sBrBQGuFmorHD4ITvbRcKLRdo0LivV31fgyv6tP2UQ9NURmYL601Oo3/aqzKRtuoSqyOX0o/tHq92PRrvLYkKLJGTdsZbZI0FXLDOcLV+rfVBFlZALv4C4ahAZTewjxqAyS/zOtI63j2YRqMkcWgMIrJIUrusDrf3DOmfm8/Ci8myQTK+84KnszkgXKFNs/qFZ3uRYphmwEhfWTZDqlyivEURg1GQ9eYUxiJ7T0iyRRl6akVSMbQwDEj+cxE/9ni87dEc4P6wypMCUzy4IOM//Ir9ZnGeyR5l1s7fgN+4yjcPG/nABYvwFxSnKREBYXo/tWZKBcTNAz7dt9wwMQBp+zLrfAzIF/toV37CUZe3N37QOA8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:22:05.7162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 275423d7-8a05-4e5f-16b1-08de73f32463
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6491
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Feb 2026 22:22:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17136

We missed this when we moved to iperf3 a while back.  Fix the last
reference in packagegroup-arago-bootstrap and remove the iperf recipe.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroup-arago-bootstrap.bb           |  4 +-
 .../0001-fix-out-of-tree-config.patch         | 54 -------------------
 ...e-math.h-include-that-breaks-aarch64.patch | 42 ---------------
 .../iperf-2.0.5/0002-fix-bool-size-m4.patch   | 19 -------
 .../iperf-2.0.5/iperf-2.0.5_ManPage.patch     | 10 ----
 .../recipes-benchmark/iperf/iperf_2.0.5.bb    | 23 --------
 6 files changed, 2 insertions(+), 150 deletions(-)
 delete mode 100644 meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/000=
1-fix-out-of-tree-config.patch
 delete mode 100644 meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/000=
1-headers.h-remove-math.h-include-that-breaks-aarch64.patch
 delete mode 100644 meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/000=
2-fix-bool-size-m4.patch
 delete mode 100755 meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/ipe=
rf-2.0.5_ManPage.patch
 delete mode 100644 meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-bootstrap.bb
index a1b9636d..e7a28eb8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boots=
trap.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boots=
trap.bb
@@ -23,13 +23,13 @@ UTILS =3D " \
 	 ethtool  \
 	 pciutils \
 	 stress-ng \
-	 iperf \
+	 iperf3 \
 	 lmbench \
 	 usbutils \
 	 devmem2 \
 	 phytool \
 "
-	=20
+
 UTILS:append:ti-soc =3D " \
     mtd-utils-ubifs-tests \
 "
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-o=
ut-of-tree-config.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0=
.5/0001-fix-out-of-tree-config.patch
deleted file mode 100644
index 003d2523..00000000
--- a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-t=
ree-config.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-iperf: fix out of tree configuration
-
-The configure step uses a package header to check for support of types/dec=
lares,
-this package header encapsulates all the required system header for provid=
ing
-the needed resources. When configured from an out of tree directory the pa=
ckage
-header is not found due to the hard path.
-We now make the path for package header relative to our 'srcdir' so it is
-found appropriately.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Awais Belal <awais_belal@mentor.com>
----
-diff --git a/configure.ac b/configure.ac
-index 2b3fd20..d420f9e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -176,8 +176,8 @@ dnl Check for system services
-=20
- dnl check for multicast
- if test "$ac_cv_multicast" !=3D no; then
--  AC_CHECK_TYPES(struct ip_mreq,,,[#include "compat/headers_slim.h"])
--  AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"])
-+  AC_CHECK_TYPES(struct ip_mreq,,,[#include "${srcdir}/compat/headers_sli=
m.h"])
-+  AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "${srcdir}/compat/headers_=
slim.h"])
-   AC_MSG_CHECKING(for multicast support)
-   ac_cv_multicast=3Dno
-   if test "$ac_cv_have_decl_IP_ADD_MEMBERSHIP" =3D yes; then
-@@ -193,9 +193,9 @@ fi
-=20
- dnl check for IPv6
- if test "$ac_cv_have_ipv6" !=3D no; then
--  AC_CHECK_TYPES(struct sockaddr_storage,,,[#include "compat/headers_slim=
.h"])
--  AC_CHECK_TYPES(struct sockaddr_in6,,,[#include "compat/headers_slim.h"]=
)
--  AC_CHECK_DECLS(AF_INET6,,,[#include "compat/headers_slim.h"])
-+  AC_CHECK_TYPES(struct sockaddr_storage,,,[#include "${srcdir}/compat/he=
aders_slim.h"])
-+  AC_CHECK_TYPES(struct sockaddr_in6,,,[#include "${srcdir}/compat/header=
s_slim.h"])
-+  AC_CHECK_DECLS(AF_INET6,,,[#include "${srcdir}/compat/headers_slim.h"])
-   AC_MSG_CHECKING(for IPv6 headers and structures)
-   ac_cv_have_ipv6=3Dno
-   if test "$ac_cv_type_struct_sockaddr_storage" =3D yes; then
-@@ -211,9 +211,9 @@ fi
-=20
- if test "$ac_cv_have_ipv6" =3D yes; then
-   if test "$ac_cv_multicast" =3D yes; then
--    AC_CHECK_TYPES(struct ipv6_mreq,,,[#include "compat/headers_slim.h"])
--    AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h=
"])
--    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include "compat/headers_slim.h=
"])
-+    AC_CHECK_TYPES(struct ipv6_mreq,,,[#include "${srcdir}/compat/headers=
_slim.h"])
-+    AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "${srcdir}/compat/head=
ers_slim.h"])
-+    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include "${srcdir}/compat/head=
ers_slim.h"])
-     AC_MSG_CHECKING(for IPv6 multicast support)
-     ac_cv_have_ipv6_multicast=3Dno
-     if test "$ac_cv_type_struct_ipv6_mreq" =3D yes; then
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-heade=
rs.h-remove-math.h-include-that-breaks-aarch64.patch b/meta-arago-test/reci=
pes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-b=
reaks-aarch64.patch
deleted file mode 100644
index 8d9e03f6..00000000
--- a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-re=
move-math.h-include-that-breaks-aarch64.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c9d104a51f4f62e157f01e1fd47f534aa22a9d81 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 26 Jun 2018 15:55:31 -0400
-Subject: [PATCH] headers.h: remove math.h include that breaks aarch64
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-| In file included from .../aarch64-linux-gnu/include/c++/7.2.1/cmath:42:0=
,
-|                  from .../aarch64-linux-gnu/include/c++/7.2.1/math.h:36,
-|                  from ../../iperf-2.0.5/include/headers.h:85,
-|                  from ../../iperf-2.0.5/include/Timestamp.hpp:63,
-|                  from ../../iperf-2.0.5/compat/delay.cpp:53:
-| .../aarch64-linux-gnu/include/c++/7.2.1/bits/cpp_type_traits.h:205:12: e=
rror: redefinition of =E2=80=98struct std::__is_integer<int>=E2=80=99
-|      struct __is_integer<int>
-|             ^~~~~~~~~~~~~~~~~
-| .../aarch64-linux-gnu/include/c++/7.2.1/bits/cpp_type_traits.h:138:12: n=
ote: previous definition of =E2=80=98struct std::__is_integer<int>=E2=80=99
-|      struct __is_integer<bool>
-|             ^~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- include/headers.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/include/headers.h b/include/headers.h
-index 4667bfe..7e5efd7 100644
---- a/include/headers.h
-+++ b/include/headers.h
-@@ -82,7 +82,6 @@
- #include <errno.h>
- #include <string.h>
- #include <time.h>
--#include <math.h>
-=20
- #ifdef WIN32
-=20
---=20
-2.7.4
-
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-b=
ool-size-m4.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/000=
2-fix-bool-size-m4.patch
deleted file mode 100644
index a6001b10..00000000
--- a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-siz=
e-m4.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-
-Upstream-Status: Pending
-
---- iperf-2.0.5/m4/dast.m4.orig	2016-06-15 11:42:03.945581785 -0400
-+++ iperf-2.0.5/m4/dast.m4	2016-06-15 11:42:11.053581641 -0400
-@@ -11,7 +11,12 @@
-=20
- AC_DEFUN(DAST_CHECK_BOOL, [
-=20
--AC_CHECK_SIZEOF(bool)
-+if test "$ac_cv_header_stdbool_h" =3D yes; then
-+  AC_CHECK_SIZEOF(bool,,[#include <stdbool.h>])
-+else
-+    AC_CHECK_SIZEOF(bool)
-+fi
-+
- if test "$ac_cv_sizeof_bool" =3D 0 ; then
-   AC_DEFINE(bool, int)
- fi
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.=
5_ManPage.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf=
-2.0.5_ManPage.patch
deleted file mode 100755
index 97cf1ff4..00000000
--- a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPa=
ge.patch
+++ /dev/null
@@ -1,10 +0,0 @@
-Upstream-Status: Inappropriate [arago specific]
-
-diff --git iperf-2.0.5/man/Makefile.am iperf-2.0.5/man/Makefile.am
- index ed97bc6..728873f 100644
---- iperf-2.0.5/man/Makefile.am
-+++ iperf-2.0.5/man/Makefile.am
-@@ -1,2 +1 @@
--man_MANS =3D iperf.1
--dist_man_MANS =3D $(man_MANS)
-+dist_man_MANS =3D iperf.1
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-=
arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb
deleted file mode 100644
index f073894f..00000000
--- a/meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY =3D "Tool to measure maximum TCP bandwidth and allow parameter tun=
ing"
-DESCRIPTION =3D "Iperf is a tool to measure maximum TCP bandwidth, allowin=
g the tuning of various parameters and UDP characteristics"
-HOMEPAGE =3D "http://dast.nlanr.net/Projects/Iperf/"
-SECTION =3D "console/network"
-LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De8478eae9f479e39bc3497519336029=
8"
-
-SRC_URI =3D " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \
-            file://iperf-2.0.5_ManPage.patch \
-            file://0001-fix-out-of-tree-config.patch \
-            file://0002-fix-bool-size-m4.patch \
-            file://0001-headers.h-remove-math.h-include-that-breaks-aarch6=
4.patch \
-          "
-
-SRC_URI[md5sum] =3D "44b5536b67719f4250faed632a3cd016"
-SRC_URI[sha256sum] =3D "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d1=
3096d20362265b"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF =3D "--exec-prefix=3D${STAGING_DIR_HOST}${layout_exec_prefix}=
"
-
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6=
', '', d)}"
-PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
--=20
2.43.0


