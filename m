Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5CDE9A03B
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 21:47:29 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23647.1771364841856419419
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 13:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=tpI3EjV7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.57, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgIe3EjFsU+xj5coG87ip8QnalvsavltA+bp7XRl1UxFqJnidj9UzZzuh4MKYdRfrnMhSysuIviZk7FEGuAn2+EzCoGZtVCU7UDSvpb3JDwe5NtbygMenZVLVXALLhSTFV5nUcBoweOmbZiz+bgJE0pDM6q2bibffJgYUb4CpDFKICJqr3QSUdW3/QkQgj9opcK34ILeZgi3LTp/8nsYtuU7N7avAHU7FI+kACM9gRFfZbVY96QCwvzE6XCijTmGk28Snp0cWozqGnl0UnL34nVql6s/N98xSX55rYs01Fp0FP3krW2ETNDYcApEocKvfWCfUCeor+/v9Xojq9fBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHI3Anjmop7BaV2/c3dufGLmr8UyaURW1WfvqztVjeY=;
 b=SGV8v1zzNNOc15GnTb3r2qIhsqmdWcS9ExM0Y6QhBJE3WpHgzeefyzU5+DnsXqLn6njyE2uiiD7ISIBZ2gSCq8R96kXQazl1hG4wzNdDPhZq7uQQWM8LyQsCjw6D9rI0dAWEy5oC46axjcbngn9gF+lTlOFyPNPKIUxctZwv6zJMSL6yz2Ia9nwPavV5GWx+NCA+pZJFgpNlFeyRZnww99HElUiPrBSPeQPG4eK/596n9tS0l6ADPKlnKLLSnhz/N1X1UIr5eHR414y1Uz/oG5g5kGzjpzU8bKme67rghto455XzPaPAyT5uzaquakm9v1hk13xUoA+n7tdEQCNZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHI3Anjmop7BaV2/c3dufGLmr8UyaURW1WfvqztVjeY=;
 b=tpI3EjV7xwsmqryxtj68HAiX5JWzh5efrwrATCPHV7l6fh7iLJOgO7UGT2KJrunOOCt6hYT4gUTGS+Awa5b0Pbcme9nQ1QJvzkEfweTcO7RG+uuFJ2ve3h1bTV3/4KMuLW9P2yCUj9KaHNxpfwqvRggTrRY6CLfCg7W4vNFMEUU=
Received: from BLAPR03CA0151.namprd03.prod.outlook.com (2603:10b6:208:32f::15)
 by SJ2PR10MB7786.namprd10.prod.outlook.com (2603:10b6:a03:56e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 21:47:18 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::ba) by BLAPR03CA0151.outlook.office365.com
 (2603:10b6:208:32f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 21:47:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 21:47:16 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 15:47:15 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 15:47:15 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 15:47:15 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HLlFan3527629;
	Tue, 17 Feb 2026 15:47:15 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vsSuZ-00000008xX6-1nd1;
	Tue, 17 Feb 2026 15:47:15 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] xdp-tools-arago: upgrade 1.5.4 -> 1.6.1
Date: Tue, 17 Feb 2026 15:47:15 -0600
Message-ID: <20260217214715.2135461-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|SJ2PR10MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: f10e547a-4b3a-4653-6d22-08de6e6e1e10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X1dYhmIUQOIFY+RosBt/rfSJ/Opihg/V2cndk0ekPXziabfKaNS2ifDD18kK?=
 =?us-ascii?Q?gg8BrXYEOzmPGwtCKPBHH0zNWBGZUrjmtLk5FaqLf/Zzz0+2tHhHaDPOguv9?=
 =?us-ascii?Q?yp6mNJfq7oGei7I3d43c2lLYQUKI/oAaGMcwC+kXCuZZCrG7/7ADTNI2v02G?=
 =?us-ascii?Q?vhmv4i27ZvzQySEPXfUIr1GZDsdkFd0cwQGIKoPwaFJAlSK9nGsaLmUBgcRe?=
 =?us-ascii?Q?teoJtB8nI1Xv6MHmxIkt35tK7awJyvKG7i+hxLWZCFr3mdVF9AQOFcf4hn4/?=
 =?us-ascii?Q?5yucX2P+67OnhRkAqkwWQHsUVSuwUei1MQE6Gju4YyYS2x9EhQ36a83HfgKn?=
 =?us-ascii?Q?oPCsh5yO/Lou7DEK0V4PdovmYR/ULlVjmkWeHHuH+EKxg1JevmZpvwpma9Eu?=
 =?us-ascii?Q?6dEuYGYikLNtHv1/BjfOtxijS49MXO4Lvj5G3H2aQure8awQStO4sjOlNcff?=
 =?us-ascii?Q?3kYQpdGpOFbsteDemoShKIWu/V+WTUm86wTja10Q1fhiRnlaVH6NZJv+ZC+R?=
 =?us-ascii?Q?KmjKUkxk3ksghhpUcZX0C958oxW153zHGXd1m77MRn2W8tuHRCQRxfdpr99I?=
 =?us-ascii?Q?qr8DHpDmMx7R/As/aNwmPqE2y4bfpgAAkmvs0snGxzi6qplOY60289g+/nnE?=
 =?us-ascii?Q?sBixvCpY8iIPuUrzkySZgFHoffZm/k41n4B0AicNG74Nem0jMtyYWMafO6kG?=
 =?us-ascii?Q?/7ehEd3Xq3Wk+jg8RaYs520apjUc9mAtlGa74ALuDm+HPLML4S/rFtHp4ndu?=
 =?us-ascii?Q?dIATtFGYmcijDPNywvrTtYJLtdFSJp8L4TlZY5PjAg+vtf8REX5rTREhyVqy?=
 =?us-ascii?Q?qD05ikm9g9pcyYxiB6I6ZYGyQKJ8uu7goq5JfmtgVagnR7mlBxoNRd+eTeUn?=
 =?us-ascii?Q?a1PpaEODvc9w71ya2xg1nKzzIerc8J3t2meV/v4qWSu4bzHGjvy2OUXmY9PH?=
 =?us-ascii?Q?Z4UDUWAI7jMcv3EqgywZN1CcrQM5c5Km9W3F7JctSPNTJcNH+a+ssIFonmL7?=
 =?us-ascii?Q?SU3i/rC2ZXqRRo+Tl6jkKTth8akNa5VNCd5qyWC0Up9lGHQvvrbm3/vQ5Eyz?=
 =?us-ascii?Q?td7LOgBgUKFAT9sHhX1DTUWDJ4ARpIxS2oqZGnwBvGbYoA4D5x3K8zc1dVgx?=
 =?us-ascii?Q?eOm6NLXHx5VaWXIZXR7xzksE1tKa+ZkULsgy8W6mbR9NpFJhzPxofmPXA8I/?=
 =?us-ascii?Q?t68cxy+RCAtsz51PTLjXYRFf3/oopVMR2wYAubp0VAP1a5rjuR2e4FhLbq/f?=
 =?us-ascii?Q?ZwP9zJBbVgalTwrZn/0CQQIKowTW66kMjzV/EfBkEUduddUxqpcCNk+p8TeD?=
 =?us-ascii?Q?Wyk1kgIUgHl7FIXBpKbRW4l2foOdVcJtci1vLtPOUJcI+R1HaEtmvRM1XeUv?=
 =?us-ascii?Q?LNRHjr9NW8nx0zj20+TbyxxPUVXr0IYr9HGMcalc0bcOxE7JbjpIvrtmtilO?=
 =?us-ascii?Q?JEO//MmI1w0WHXFipD/fiWlLQtJeg/6iQ3dKaSDgpt9efKrtxztnl76kQsua?=
 =?us-ascii?Q?Tpckc9e96iOMe32ltW1fzLVdju0ET0jiqS4p2p9OdcmQ7SfA0tP6SGKT0TBK?=
 =?us-ascii?Q?R2j2d5M8ZWxvhbTYdUTW4AkYxrboFBI872abFYUjlrkgl5IdkeX4R8VdvIOu?=
 =?us-ascii?Q?1BxnGPDQtiB3U+LYbQaajzOHW2f8loUQUGcZlDxLExSEZuawvmmx6ayHVW0H?=
 =?us-ascii?Q?pEKAkw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zulj0h2bvk2ck8bc3XWghtyteuJzmgLFuuwc5xRbCTebfwLIOcL/oqpfNduqLSWkoUNwP19L5PYlf6p4FT5f1nFrbkP5kUHu8NhFaf1I8AOtqSl/fcWNs/NF33r9bdaNez55PPh5YLqh9WyhspIitLo/jFXRvmnPlzsOMKEtddkM7SPluwgpWcl1ikNHh6GCbUxSBaBjjtbGkHF+IOwlRMXkaOyO2mUpMwMtxj2K9O/z5eEfchnXjrGqN6PIxYSdNcOCmJK9IZ/M0IATI3En53fPWLM3YIXSV5Z93UXQYw/dlH3lUqjsRVOB1nDotifOSN49bvfHZhVKZyRSiEWZUiHJyCHF4/smMGXUmX5rdc3cEn3jVXFKx4iqBC/RSg59trm1hQUBzF8nxZlUBgt5Ba/N4SNGkYCDipvIOElZqrrf3YhMDUJO5PQZKBSGgTt9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 21:47:16.1792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f10e547a-4b3a-4653-6d22-08de6e6e1e10
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7786
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Feb 2026 21:47:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17112

Changelogs:

v1.5.5: https://github.com/xdp-project/xdp-tools/releases/tag/v1.5.5
v1.5.6: https://github.com/xdp-project/xdp-tools/releases/tag/v1.5.6
v1.5.7: https://github.com/xdp-project/xdp-tools/releases/tag/v1.5.7
v1.5.8: https://github.com/xdp-project/xdp-tools/releases/tag/v1.5.8
v1.6.0: https://github.com/xdp-project/xdp-tools/releases/tag/v1.6.0
v1.6.1: https://github.com/xdp-project/xdp-tools/releases/tag/v1.6.1

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Added patch for 32bit compile errors.

 ...0001-xdpsock-Fix-32bit-compile-error.patch | 42 +++++++++++++++++++
 ...rago_1.5.4.bb =3D> xdp-tools-arago_1.6.1.bb} |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-ara=
go/0001-xdpsock-Fix-32bit-compile-error.patch
 rename meta-arago-test/recipes-support/xdp-tools/{xdp-tools-arago_1.5.4.bb=
 =3D> xdp-tools-arago_1.6.1.bb} (94%)

diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001=
-xdpsock-Fix-32bit-compile-error.patch b/meta-arago-test/recipes-support/xd=
p-tools/xdp-tools-arago/0001-xdpsock-Fix-32bit-compile-error.patch
new file mode 100644
index 00000000..da439bf1
--- /dev/null
+++ b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001-xdpsoc=
k-Fix-32bit-compile-error.patch
@@ -0,0 +1,42 @@
+From 9b649be4876a3e42c44e57013840904006530e52 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Tue, 17 Feb 2026 15:11:18 -0600
+Subject: [PATCH] xdpsock: Fix 32bit compile error
+
+Using UINT64_MAX on a 32bit machine results in a compile error where
+unsigned long cannot be cast to an unsigned long long.  Since this is
+trying to handle an error case and return a big number, switch to
+ULONG_MAX to match the type being returned regardless of the compiler
+bits (32/64).
+
+Upstream-Status: Submitted [https://github.com/xdp-project/xdp-tools/pull/=
553]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ lib/util/xdpsock.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/util/xdpsock.c b/lib/util/xdpsock.c
+index 5d71e6a..899c3a3 100644
+--- a/lib/util/xdpsock.c
++++ b/lib/util/xdpsock.c
+@@ -35,6 +35,7 @@
+ #include <time.h>
+ #include <unistd.h>
+ #include <sched.h>
++#include <limits.h>
+=20
+ #include <xdp/xsk.h>
+ #include <xdp/libxdp.h>
+@@ -171,7 +172,7 @@ static unsigned long get_nsecs(clockid_t clock)
+ 	res =3D clock_gettime(clock, &ts);
+ 	if (res < 0) {
+ 		pr_warn("Error with gettimeofday! (%i)\n", res);
+-		return UINT64_MAX;
++		return ULONG_MAX;
+ 	}
+ 	return ts.tv_sec * 1000000000UL + ts.tv_nsec;
+ }
+--=20
+2.43.0
+
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.=
4.bb b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.6.1.bb
similarity index 94%
rename from meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.4=
.bb
rename to meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.6.1.b=
b
index 12b42c90..e25ae146 100644
--- a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.4.bb
+++ b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.6.1.bb
@@ -15,9 +15,10 @@ SRC_URI =3D "git://github.com/xdp-project/xdp-tools.git;=
protocol=3Dhttps;branch=3Dmain
             file://0003-Makefile-fix-KeyError-failure.patch \
             file://0004-Makefile-fix-libxdp.pc-error.patch \
             file://0001-defines.mk-Add-missing-prefix-map-settings-for-OE-=
bu.patch \
+            file://0001-xdpsock-Fix-32bit-compile-error.patch \
           "
=20
-SRCREV =3D "e78d8d23bb80f221dd6b6970ff5a44aaf4717114"
+SRCREV =3D "84906a0fe98cbb5e5eaa2c888c50a1ab32d5d0b7"
=20
 inherit pkgconfig
=20
--=20
2.43.0


