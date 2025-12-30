Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D55EE4990
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 16:51:44 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67794.1767113502933557175
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Dec 2025 08:51:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=do5OK5rN;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.35, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISiEOHz3TISP7EsKXx9kIgSK5fFp3tIhIJYA1fVYYxr2X7vkZLNkcLf3Iip9qjjh9ssbqI+p/GAIiT8Nc3p03tw4bqlyYbl/cn4yO92PsHM1SmQsKTo9acYu2kTl7vRD6AlorXkseXCkccF2RX0xyZUUFfIhRlZNvXeDCuz3JQBKYhaFOJkM2sd/aR65ivmdCkA5+QmFVFdz776dwrSlqwO4TKXoWkDgo9TpJ5Df6P1eB7uS05EQU3fnNlbvkWFSGsTjc0l/72PnGoo4+MNndgBpD0J0CotfYooClvlxzPGNjeVWYMgA/Nfraq/2jxB4jbSXlkpnvB13tNJXcmcIFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPSThO2VfC4guNyJC06vYqZD0bWYAQTUJk7llgfWlkc=;
 b=V1TEA62r7vXsQc7yQ8ofLiGnqOqxVqnwDHWW4SCOizlJ/4QjNUaLywa0IO4k6DgthDyZ+/BUjhNmDYaUd4jQtmVYFed80hBnYixKomH2/HUB45xTTIlIVNyqi88n/3gkGW7zGXn+8tzOpAu/uVEJin3ovsYSbSJEE/uu9lmC4VK7uBtpSgY8JtO0FlDtkOGVQ+OZJ2C7RoyqRQD7e8RvbAA9TjjjdVw8PmLHCTiPPpkNOhJg6UvKLwUYG8RD5S/MhTZFJuwLxCWdb3H75t9A2r1ibtInrzWh9WlZV6M5vEbOJlFvPZKvSHHaS5cM9Q+ChNoidh6p1fYcrGBk9Ruwbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPSThO2VfC4guNyJC06vYqZD0bWYAQTUJk7llgfWlkc=;
 b=do5OK5rNzW9ApRqG6waSpRvK4njxaMHmrnI1NSCuPaKi/TfOVCiakQKpDq3xas6oVH7RzyZzOuIyFaG6DJa3XX7mz7Qdm5UzRHEiHR7eHHRr+5s9jI3IFjw9w0z3veXgQzQpfg0sd3YuTPXrUY2GcGozG0znSLaGaHFO3CEglaE=
Received: from BYAPR02CA0026.namprd02.prod.outlook.com (2603:10b6:a02:ee::39)
 by PH7PR10MB6967.namprd10.prod.outlook.com (2603:10b6:510:271::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 16:51:40 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::8c) by BYAPR02CA0026.outlook.office365.com
 (2603:10b6:a02:ee::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 16:51:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 16:51:40 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 10:51:35 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 10:51:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 10:51:35 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BUGpZfs997573;
	Tue, 30 Dec 2025 10:51:35 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vacwZ-0000000Ei18-2bPM;
	Tue, 30 Dec 2025 10:51:35 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 4/4] FIXME: tisdk-tiny-initramfs: Increase allowed size
Date: Tue, 30 Dec 2025 10:51:32 -0600
Message-ID: <20251230165135.3505628-4-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230165135.3505628-1-reatmon@ti.com>
References: <20251230165135.3505628-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|PH7PR10MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: b77d9101-dc71-4466-af46-08de47c3b449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nPXuH2VZ51ybkIv/975C3KDlEErl6spRFtWsnQEJ60xkBMVDmtg7s3M/rENU?=
 =?us-ascii?Q?NdTxSJWhAvt/NKCx8vZni+8bj/ScjjGvzigyvNxdkaBiumaHG9RLaqV/WYHp?=
 =?us-ascii?Q?f3v4nptatlq2Byobf86VBuQADiDp0j8/lUpz5wUmucaMGmzFdJc3Om/oeN1R?=
 =?us-ascii?Q?Hws/YxKBKP0v1tOLCu3mOKSA269645iIRin4M1wXEATV97BRxpqT0OAYIr5j?=
 =?us-ascii?Q?6EWM5TnnMx/mIqtOktIA2RoPj2J+Ce1Y7yPoETI7URdf5hDokhGyHKv8cPjd?=
 =?us-ascii?Q?oFPwIU+nQAiVsn00Q7VDON/AFcBpM/me+sp8pNQkpwl/W4VZRs5/8H2tV6M3?=
 =?us-ascii?Q?Gu7oQvcS9r3kWUO6278jf+JVDTHLAbiw7L28l0uv2lUyDx1f4uOorraO177u?=
 =?us-ascii?Q?K82wsw6DvgYTFWkAso9L52JEx9ALQcx0GMmXPU87e1HaPx9ygMlH3bpvZEQn?=
 =?us-ascii?Q?uQUxpGhIml+PV3tkz4V4mcGIFQH/3rGPA86Rg/xZFkb/EWsU2VXdFaPdGUGv?=
 =?us-ascii?Q?SjIjTQVd0uUF2JAVjeFuFrJx1Q6MH0TJjCuW9GPi3DvQmclNcy4ecvEON7dT?=
 =?us-ascii?Q?u6o+Of0USa3RW+N+QAGuwHASar8CQ8HrBYgKkSOpjREheyri9V8c4LyTJm22?=
 =?us-ascii?Q?76HwyaCi0UQ8/qZayQuOvJngGfft2Z2kHCmlWVStWPwHWleFZotCKCGhaDro?=
 =?us-ascii?Q?5vpfJiZVre885EJIS9krcXJ1niJwuMx471Gg0lJFhbPNDBW1s5bQC76jOh6N?=
 =?us-ascii?Q?QMHDyVRPgFm2bUkSCUuCl+H3phYEh4si58f2W9HSLbUJQoF7/0ghCgdwZb6E?=
 =?us-ascii?Q?vv+PPverXlqiIUjX0EiA7gF3Kth2wL/bbhRJVwBqdsKC4FflwMfekRmHoBrT?=
 =?us-ascii?Q?IeuiwUJXNXtCvK7kH8Xcu5PE+TIQb1Yt8EH+77CDTA33siUuMCEAZikRFMEr?=
 =?us-ascii?Q?5bVyH0ftPHyIZUtK3HE1eDGJ/bIuvmRs/TEI/EYyCvpJwGceEaz6hA9gUocG?=
 =?us-ascii?Q?q5rbiuXj1h1miq8ohumIOQodEW4+zmxMKE8nL4n3VDRD8i4Uvct6qlO7VHgU?=
 =?us-ascii?Q?dToeXMy46tKYsQCJWJ94xbHkB0+9eO5Wn7NRqYCn2Vh45MpAOQTZyvoU6A0H?=
 =?us-ascii?Q?6+112z5BcT6T0/4nKOSM3NcfNOg8/Tm/0vjwerTiNlAp+7Rb0QeMZzsdPEzg?=
 =?us-ascii?Q?qoEruvCA1h+3PxPgPvMivOp3sBhHGpK9Qs5/6afYD2yb3BriXQnIkA+Ir86i?=
 =?us-ascii?Q?dsWB64wyRMwudXxW5TgS2PUH7dxMoiSYbvJRp1TmNb3/9RYbdmnReOhI6t/Q?=
 =?us-ascii?Q?BSWUp/XJufOUDuWwDnvoMpHycjs9vVnBssZlJv781ZR0Dh615tl2EyRC7YUa?=
 =?us-ascii?Q?9/4RJiEuVDXHAfIhWANb+amS5UAg5ebrC/BsNzZT7TX8Ybkd7NdGK/nXoE6v?=
 =?us-ascii?Q?d1ZBNm0pzjpGz53vS4+Xc1r+Mv0pONSki0mTqEBMQB2W91PyxLocawE5N6BQ?=
 =?us-ascii?Q?s5RUv0Q+JuE1kYiiDvYbLLrj3QWDzz9zDTbeD1AwMsb2d7S2e3VYKR2fhXIA?=
 =?us-ascii?Q?K53IfO0PnUGANl+xurQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 16:51:40.1050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b77d9101-dc71-4466-af46-08de47c3b449
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6967
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Dec 2025 16:51:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16909

The initramfs keeps growing, we need to figure out what is inflating it
and what we can prune out to get back to our 64k desired size.  In the
meantime, increase the allowed size so we can get builds going.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb =
b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
index e19be8a6..157248e1 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
@@ -16,8 +16,8 @@ IMAGE_FEATURES:remove =3D "package-management"
=20
 INITRAMFS_FSTYPES =3D "cpio cpio.xz"
=20
-#INITRAMFS_MAXSIZE =3D "65536"
-IMAGE_OVERHEAD_FACTOR =3D "1.1"
+INITRAMFS_MAXSIZE =3D "200000"
+IMAGE_OVERHEAD_FACTOR =3D "1.3"
=20
 IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
=20
--=20
2.43.0


