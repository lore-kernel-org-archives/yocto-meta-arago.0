Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAB7CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 17:24:24 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4686.1762536256898184700
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 09:24:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=bDlQlQO5;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.59, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/xI6CTeEWXqSIMDq325M+1eqCsK7BwhNACF59pghhmVGN2y/mEL69spl0V4hGAcJvfsCHCPgl/h+cT62jerYrs90es1mLiRLUf8eRUEVUdLF2oDKGiCtn6bsiRT54apqWeOPjWxvmznz/kmeUG0uj2IXfeXInqY483FgUtqNgVhZ8bcAybRDhR9tScDWrGZq1ZiQFGxJ2bJscqvaYlWu7fExZZpHd/OMLGWOV5nKFJhCgXz2qqqgeTxiNKQ0NPUdJbfwqQ4Ec/4hgYtzBcjMshiLMduwdAVi1idiWRosgNNV18dWHXHZ6ChQp3aJzZzL+B8t7kTpDQJQInBS04nCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tiDhIA3mxMpW+i+vHnz8VpowABHPmsVzRg/xVJFq6g=;
 b=P3N8W7Pf5ctDX0kCbP6bf20JfZXCVw5c1kUhjKymKz8TJxsQSlNAZatvJYnNfQu/A2CXmveQMDc5yteF0H+10xlIGYmPLfpM6sEsNDV8/fY8dCPRrtQu9gHdkX8XGKCikHMfp+ag/3zbfS/yZHLPO6wpgHCwfiiCSoXJub2mIGyYYV+SayYf7p+B8WTNlsmHjbN4C3QpESB2btTUwZpntVjQ4oV5XrpmdvJ70rsYwWrgWF2GJlwTTvui1yLfv+VjucZd5M4S8YYxp10eYFHm4WvuQUTjZkGt+90qHzP9F17igK6Wj9rOMbbb4lfiKyZOrtqbMhhKnhDKS4jefb/FmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tiDhIA3mxMpW+i+vHnz8VpowABHPmsVzRg/xVJFq6g=;
 b=bDlQlQO5z6qshF1N/VFQOmnT+jBxmfwiTqTCHjiE7vu5zgHuX9lrMjOUwuabcrbUYycmeHFGPDPGO14FDyaBME7EMj1os2EzkZiYw7NXqJU4PkTNThWzVN+M2FvOP8saZXveUrr+UxNtz2qXdiUBxatJznLOka4j87LNEnScwh0=
Received: from PH7PR02CA0003.namprd02.prod.outlook.com (2603:10b6:510:33d::31)
 by CY8PR10MB6516.namprd10.prod.outlook.com (2603:10b6:930:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:24:14 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::bc) by PH7PR02CA0003.outlook.office365.com
 (2603:10b6:510:33d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 17:24:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 17:24:13 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 11:24:10 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 11:24:10 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 11:24:10 -0600
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7HOANs3397390;
	Fri, 7 Nov 2025 11:24:10 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] cpuloadgen: Remove this utility
Date: Fri, 7 Nov 2025 11:24:09 -0600
Message-ID: <20251107172409.1248314-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CY8PR10MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0bca5d-0be8-426b-3c20-08de1e2278a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DLQWxHq0Gl6J0VG8e9nNDAaeDYLVhzITGYqYemxtJVSd69hTDFc13hRYKrLN?=
 =?us-ascii?Q?OwW4BlutQsI9fRodtnopTniIaiNBkdzeKnrQfm30GmyWHLYWfwol6CCvY1rw?=
 =?us-ascii?Q?EXu1IK1/niI3Mr2plnE5+LDDMixfJ91OGKER9Pu01t/TkCJGOrI/nFmOL4Qk?=
 =?us-ascii?Q?h4ScuBaskaYwcJoTfxTJmra+a5DYe8gP1ghFGdf4f3SZ7Gi5XEPApUGz8vLH?=
 =?us-ascii?Q?6d8eWN9AgxPzqk+rKSDEanapDt3fhwarHBoXiVXVs8Cy7a/H8BX2dABbWrbf?=
 =?us-ascii?Q?/sEqbaxh4tAHZM6ZiVmB+g8kSaRnPL6E9LjkJqElWxU1RWybtHX7O2HjFQY8?=
 =?us-ascii?Q?4usMKROiC46L+Wdjn1ZcMKhpNnn7t/phfcqlJnIggL0jk4y0w22R7WON22YD?=
 =?us-ascii?Q?aLk0y3lQkhHxHwuZU+hSHLo+K2+j/BR4A166WoAoF9JGoKHpDY4bdbLCMlmR?=
 =?us-ascii?Q?zZP41TSmqgwjTY+q92Kepf52Qo3Tz5IsdxQKWI/kWPYb/iEJyDMxbyqWjdAl?=
 =?us-ascii?Q?rzrLJIJ8qxAWS2/3cOXKe02WUdMXvzKf6XcXalzQxG+ZEYKVQHoYDhJGCrbF?=
 =?us-ascii?Q?0sdVAA3OO9bjQDpBnPUIfirr8mfzt+3e8S1+whN2os0hrHlV1ZgHthvfAvNZ?=
 =?us-ascii?Q?NTVfzEwiKhI3GvejP02db0lLOUF5M1aWCoa/wzWr0n01NLxYOTvRSUnCXNe6?=
 =?us-ascii?Q?S3a+Jeg1IvNvO3e9/CaUMnWHfH0qKN34V3eQDUPFcu+/E0o956T63sAUHwws?=
 =?us-ascii?Q?BqY7as2OfbRnO7XadU/MFcGDe9OgQqUOW9w61ZYLFJxxwv9NQHhElpO117so?=
 =?us-ascii?Q?wnDOv3ty9abzaeoVHitla2PbiLM3lbgZTUCPWGa2HX/K1bE/2GpiinSWP4nT?=
 =?us-ascii?Q?Xk4z+4pm3KRcJOAgrPxxiviNKsRJovqsnG0St0/xZsMaheCM7KDbvDaDXiGl?=
 =?us-ascii?Q?u4UZUzh/5wJRBW9aop+p6meaT1rDDuLHPSOk7gMsHmew6614hS4KLFRbGVKe?=
 =?us-ascii?Q?RyM3Z6kAZrk0iJKG+IiLLr5W986Dd9oc2ANz91jRE/iMMZOKVBcKEg2ma1Bh?=
 =?us-ascii?Q?IaXC57FDEoFERAQvVHk1KtWB9J+IFRbNVYWhtOjq0snteeVHwWyltCwduB/w?=
 =?us-ascii?Q?nURa2cKhYOn2hn5pML8Wgw2/1lDjgTOuZFiElOgJ2c9nkpwwqJwMsglLZGv4?=
 =?us-ascii?Q?sldyJ1cq+bv/kFzIIYFexR1MtTBOZpIYCxICUaIc7JddGqsqal1K49VCEDvZ?=
 =?us-ascii?Q?2OQwhhxjm7UNnO8kPZ+dESbuYRSlfDA648xk2/RmcFSlGFnQycfjm5L30EGV?=
 =?us-ascii?Q?s8DvBHmkTLTLVfSNBvx3ED45zBEQxOXxlS6AE9e0LqXwygSlnWS+TEo0mLNl?=
 =?us-ascii?Q?jewCzIYELOaYChQCw0+exRB8FNWqkDJs99ugC4o/38bbC9BQUa/DwHlRflcR?=
 =?us-ascii?Q?jsGKHeHEaNeEB4HKxaFIAkliaceflRdiOPsOd0uLMKO8xNBBumRkt3dH6ieN?=
 =?us-ascii?Q?C2qxmcpnkOVO0wtVUg1rD9wDRJu02HlcwZrHvM5g5SzYiOkHbWBuwtTOUvdg?=
 =?us-ascii?Q?ycPAJk/XpcZK09BKUPg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:24:13.3892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0bca5d-0be8-426b-3c20-08de1e2278a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6516
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Nov 2025 17:24:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16728

This tool has not been updated in 10 years, and has long since
been replaced with the tool "stress-ng". Remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb     |  1 -
 .../cpuloadgen/cpuloadgen_git.bb              | 21 -------------------
 2 files changed, 22 deletions(-)
 delete mode 100644 meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_=
git.bb

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index cb779123..c6d1f227 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -96,7 +96,6 @@ TI_TEST_BASE:append:armv7ve =3D " \
 TI_TEST_TI_TOOLS =3D " \
     arm-benchmarks \
     arm-ddr-bandwidth \
-    cpuloadgen \
     input-utils \
     ltp-ddt \
     openssl-perf \
diff --git a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb =
b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
deleted file mode 100644
index 6f46e9fb..00000000
--- a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY =3D "Utility to generate specified CPU Load"
-HOMEPAGE =3D "https://github.com/ptitiano/cpuloadgen"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc6c2eb46c569d0cd7884089fea6b4f3=
1"
-
-PV =3D "0.94"
-PR =3D "r1"
-
-BRANCH ?=3D "master"
-SRCREV ?=3D "dd2052b581ae7c2e0e06344887885fd6cd66eebb"
-
-SRC_URI =3D "git://github.com/ptitiano/cpuloadgen.git;protocol=3Dhttps;bra=
nch=3D${BRANCH}"
-
-EXTRA_OEMAKE =3D "DESTDIR=3D${D}${bindir} CROSS_COMPILE=3D${TARGET_PREFIX}=
 CC=3D"${CC}" CFLAGS=3D"${CFLAGS}""
-CFLAGS +=3D "-fpermissive -std=3Dgnu11"
-
-do_install () {
-    install -d ${D}${bindir}
-    oe_runmake install
-}
--=20
2.39.2


