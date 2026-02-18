Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98953E9A049
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 21:49:30 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.759.1771451367513985185
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 13:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ORPd8vh/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.5, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fB1h7ApEcnWaNch9haJ+wcFFwEAgMruAfBiAptpV/MHORNWC+uP2uPIxumZnieHJws6YaC0P9exykMjGwZlzCrxQSEPl7hXElYxeZwALjTNclL6+M8xZMoAJ2xViyXzCZDR7IF0IokMDKM3eVuIHuwKHIYANOJDS+w3s6sDxg5vRG9DYds3BcKTggnHnXgfY5JKFT70BL0LQ7pOD28YDkbo32UoCwFr4k6ZWsiE3iCvJhfOpzkDqfRi2HyXg0rezeId3CZEwHCd2lU2vP6ma9gA/ndbzL5uAZw3WUBaNOLC4TWJhF/gYyc65uhngw2jyzopw/Qt+4KDmRSdk+c0UOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYerYr8wp+TQJp5MboMjEchVTd6gSLbbyumc96K1LH4=;
 b=XCrGIGgEXLXpfneq9jgB/ic2ygpoJQJhDLATw7kq9XnIUlw0l/jFt5+ZASER7tUPHWdmmsaScoBs7xfNVZIlAivweVUQlr1n/w5vP1FtwJ+tfyOTdkQZXT5J7IkXvUGIFpoHNMg1m9GqqaGn9JiHZOO5HtZ44mfH586r+G8IoqxX9wXXZyMxY6C8a8COifi8wfWtykfQ1NBJMdtX/YIhga5tQ09KaOGnPReqPFuuHewsbdW9KFiggA8Z2Dat4+zNk/quTfo5bY64yY07Mvs0QNYj0uERm5hdU3uDzdrkLvfITa8F91aRZa+kEM3lzLhf6DZfRGMvgzgGPo9wldKxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYerYr8wp+TQJp5MboMjEchVTd6gSLbbyumc96K1LH4=;
 b=ORPd8vh/RC+DbSm9Ue0/TJwYVtr0DA8JwrC5bH7mvzXsbJ+MHxnFU75prNQbIjrAwQ3o3YNzVBr5Oy5mAetkoe5NNkBDnpjizY0Pvaq3WVJGqaFAv3J3gtBwe4MkoRor1zRjftWshA6j+r0v/kdCBv05nF98gYgyzwLZAPscXtI=
Received: from SA9PR13CA0124.namprd13.prod.outlook.com (2603:10b6:806:27::9)
 by MN6PR10MB7465.namprd10.prod.outlook.com (2603:10b6:208:47a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:49:24 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::53) by SA9PR13CA0124.outlook.office365.com
 (2603:10b6:806:27::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 21:49:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 21:49:24 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 15:49:17 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 15:49:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 15:49:17 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61ILnHdQ1524958;
	Wed, 18 Feb 2026 15:49:17 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vspQ5-0000000Dkj7-1H8f;
	Wed, 18 Feb 2026 15:49:17 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ltp-ddt: update 20250930 -> 20260130
Date: Wed, 18 Feb 2026 15:49:17 -0600
Message-ID: <20260218214917.3277856-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|MN6PR10MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 57fd0890-67ea-4e7a-aea1-08de6f3794c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OmLOyfJKd1bMP2eWzRpnafC/taoQJFD7Q6oeryYvWfmGdOzdprfSi5shMNCW?=
 =?us-ascii?Q?Nt9iA/5lX1mfS33oXdztrzM55i619LXkTC6wuTSWbEE35Q8IOjBCEpvYwk1K?=
 =?us-ascii?Q?zp5bGd365d82ONM253eVljzsTdCtKfq8VFstXeg3qRex2DcHWMEj7yw6uZUO?=
 =?us-ascii?Q?qFgWWhRsKmoicE/sw62UtfLTrc9i+OzhJwDQ6/cYa+EHStpc9nHjiUPCtsGc?=
 =?us-ascii?Q?Qhuf3VBJQb/VSBrD1YwLackrVtFv/sRqkA/9hX2l2QfuaWpcv38rRdAFWtaf?=
 =?us-ascii?Q?RT03ZnQZR2FD1nG/e6cmzVYrkLkEyuICp73esPWJIvCYMtgEHmfJSBgWl0QA?=
 =?us-ascii?Q?D3BqnsCsOutTJExCrWUSY0lpCrogNTfBihppqNxoWesSG0ui/jczsgWJXghd?=
 =?us-ascii?Q?IUvMHXVGpRQ8ZUAbG5gxAz7qZEE3Cy2hPB/gqSFvxzxq4NabZu7vkTB3DEDM?=
 =?us-ascii?Q?6s8YqRYAfFEtLLcJUoIMIlkK1XRj3zCkvUS0IY4HSBwEt1jzC0sYNN3UIbP4?=
 =?us-ascii?Q?f8E1wdn905qQH2GUChVN6BF76vBsIc8pr5fCYKq4kfIW8JfpRORe2VXIcwte?=
 =?us-ascii?Q?itvxCFYdBi77xN0cdf7QbLFaxK6kNXa/GS3wDfCZ+Wc/ZQeCeziq9dJLZ7dv?=
 =?us-ascii?Q?Jq8DCOvUrGONXZpLnLPMWDIPr9rzNlSDw5wgVBDbxKNyJL/iEiIXP+oiJZw/?=
 =?us-ascii?Q?3vrryh/TPiARKjlmvzpiDaTYMJzZA+g4gIty5R/z+5hy49Gi3B7YyinZKWIn?=
 =?us-ascii?Q?DPUo3gIiny7ByW2x2miV6fdVEzYTEPBAkHmnEt7CpCbHIc+EIsAPVOGyvJic?=
 =?us-ascii?Q?zBzRj5AAI3nrLV4UNUOTXnsrsc/4EoeuLcA27ayaxQsc9wKOpAOkpEAb0jjP?=
 =?us-ascii?Q?Azekmw2zEkNwtzD5zWS9j+h8qDoTwD1rC1O3nE34DMWA05rRTT4HsTfrkoNQ?=
 =?us-ascii?Q?9pyInfvZOmGeL79RG9z1kNqR/Eq77Enl2L8NWsg9adYrR+wCLnBiKJ0b7GJe?=
 =?us-ascii?Q?4LINcqhJbq8dlm5c95wXqfkQ7UR9ynkz9et8t2l0yBnLijQBk4+masnB7N/y?=
 =?us-ascii?Q?Qc6wzl6PatYsPZxanQ/oQ8FiyU3ZV5L12Z174m5aEVfi8BPOtXqgaF44SDPo?=
 =?us-ascii?Q?RNpPpxQ2FJtk9aOwAiq7VL8e0yBcq9cQHm0vkUiBPE90x4pY1FFCZQmidgzV?=
 =?us-ascii?Q?yJtvZoc1Dj2Fd3TLxehNeh9sSx3dC9gjNXDWpqCoPFfQJYKWxkZKVorWzddA?=
 =?us-ascii?Q?Ji1dQtYcQ2INGcZQxm+4r7GdDyjPQRoNU1BkbXrH5ybbCRggmaDWi3x8DNYD?=
 =?us-ascii?Q?vic2i0KjnQMzjZfN4x9gjdDaYrt2de4BkbhuT4jia3yko/iYNG3shD2dPXSm?=
 =?us-ascii?Q?HFxlBaDarlZSUvSaw+cmzmIogtZb9XaA4zMVed67GtYFI5CVdQx/kVmzJY//?=
 =?us-ascii?Q?aHREhhfVttTzGR1xi2lmmPwbpIn64pS7b0SxDlgXwFPSogeSmKHdlAD8jLyU?=
 =?us-ascii?Q?FdZbGWYRkicgGkBrjetO3r88MAoCMPRJxWNfDZQwTClq+ZF3KkPmqTW20mOT?=
 =?us-ascii?Q?Zld2rka4e+iKlm3WjDNppCyDVMHLlX9brn6tHKhjwMT+4mAQ8Z+tSOX6JOBV?=
 =?us-ascii?Q?iFI43av46/DquCnnyouAIDGYaULjHLWMN1zqQG9tLaXdVUl2D3JAYTmjUGsR?=
 =?us-ascii?Q?FrUKlg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eBi0RxknmFuVL98fA0d6hXIHlqCHzvlXgCLXcsBg/MwNDeu5w/4jNaSZEBZrrBXxP6OiBzYAK3f/obiCC5msmhARsif6IidCU2nFLOjCNaiWWnrRmfucTI51xTjvvKXjIPepsb4v6tEwr/7HX/Tmun0/wtf4s/ucWrCF5YhlsgYM1mpK5m/I7v54Qnpcji1HdiiHLAEIBb0zCP8HDc/U88L1N0kpwfAMPkhZhlRyg9uKBULluzFyYsPRul0doVYpCQjNMfMhksVQpxqDxpwmIbB75hs+9yTHn5st9dKlgGuySOLHBsMUlv/LjvFfP1LEl4m12zhVuNnoG/KuVP6bwUQ3K9jiBton2VUEUL6tmgAPdq7fNG9VV3NIygmuPRc13WFrGU+GTQ2LOFqeMzT5TsGeka0tRuQkM8IxnmjCC3q9md9u3lTU33gDGLP0dXeZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:49:24.2532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fd0890-67ea-4e7a-aea1-08de6f3794c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7465
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Feb 2026 21:49:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17122

Rebase of ltp-ddt on top of ltp-20260130.

ChangeLog for ltp:
https://github.com/linux-test-project/ltp/releases/tag/20260130

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../ltp-ddt/{ltp-ddt_20250930.bb =3D> ltp-ddt_20260130.bb}       | 2 +-
 .../ltp-ddt/{ltp_20250930.inc =3D> ltp_20260130.inc}             | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-arago-test/recipes-devtools/ltp-ddt/{ltp-ddt_20250930.bb =3D> =
ltp-ddt_20260130.bb} (95%)
 rename meta-arago-test/recipes-devtools/ltp-ddt/{ltp_20250930.inc =3D> ltp=
_20260130.inc} (98%)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
similarity index 95%
rename from meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
rename to meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 77798074..3a32225e 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "ced5ca724ba628eb1251f9f47a9ee1b3c8064e97"
+SRCREV =3D "eb329df837fc17f5f543dcf0b45cd7a1b6ab0140"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250930.inc b/me=
ta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
similarity index 98%
rename from meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250930.inc
rename to meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
index 30897de7..bb3b7e9c 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250930.inc
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
@@ -24,13 +24,12 @@ TUNE_CCARGS:remove:x86-64 =3D "-mfpmath=3Dsse"
=20
 CFLAGS:append:powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
-SRCREV =3D "d2550ffbbcfe163212cd7e9c132db65ae0fa06ed"
+SRCREV =3D "6a60ae592cd375f004df0694efc7d50ddae9aa5e"
=20
 SRC_URI =3D "git://github.com/linux-test-project/ltp.git;branch=3Dmaster;p=
rotocol=3Dhttps \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_R=
E.patch \
-           file://2d066ead3d6ef504c82551b12306e751d23ddb45.patch \
           "
=20
 inherit autotools-brokensep pkgconfig
--=20
2.43.0


