Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDDACDB462
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:50:34 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5623.1763074225917396051
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 14:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=e8wuNMNo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.39, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQk8s/fuDo2uGFsQDm0tsdivE6sOjXX3ojjdJVEy3OS+yy73LewGgcSa3ucNly/9LOynFu6vOEmDWh3XGZkiWmbUMERfpqq1/NoQ5dIwT41lhqKnjl8oTKeUSPFpX4Lt96HhhmqLav2xboDstorUvHBali2E8cDtaaCu4rTQQl/UyBk+B8Ez7oiv415B5IRE0xxGr0kSItF/NN6f3IV5QeZ5tfE01/ibB+y2j/Wd9muKR5TnYWQNr14Leydtf3sg/jOfMwBcMICRweyvgD4m+LL3erD1u62L/BWC1PiHAHLZ62ipBEtwbeG+1PMgCre9cUhyL5lqZ7mj3PxmFndSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA2DaIxiSarO1zPz5FbnvnhNfSy+V4wdnXikCxN/ieM=;
 b=xDEDl5ZlcFOzqmoKYNJaAbPhao05494vHJpSnvxYICeUoY68aPG9uPdM187zG5WDkWx5ewxWi8iIiCodrJc9jzsUdIHtKtYnxKabI0Nkar4JqgYwca0xtNR0gpDfs3YiBe9kDuDHqWHv+vex53mmZJlSiE707IO3suOE4dm5cFNN0CtymYkKbuPzEksnrX23gMK3Zi7ejxIX3cvZh6wXJJN5oZriIznwy1DOWkbfojiXOVM8ys1CqCSlwB7vwynXJ6dF9Ne7WggOwaRlW03/eDgqK7yuZKmxPemD0Hz+alRr2N/ZmutlaZQ7+FrZcKNys11gPZTS8dNeM+lPHq7CoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA2DaIxiSarO1zPz5FbnvnhNfSy+V4wdnXikCxN/ieM=;
 b=e8wuNMNoDemgMLCayAi6HlDnYbkeD5uuIW6P8AF0z8QYLu7UaJ4CpKAbmzsuBxMnwZRKewXa4HaUNgjIdn/nliaage+B7sbrjaZggTSqUXtT+efRVLXsWWk1NEv4AHIot1u/kOyUA/aEyote/Kk80rkF4fSAquGF4YWhIlMxNZQ=
Received: from DM6PR02CA0037.namprd02.prod.outlook.com (2603:10b6:5:177::14)
 by DS7PR10MB4863.namprd10.prod.outlook.com (2603:10b6:5:297::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 22:50:23 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::fd) by DM6PR02CA0037.outlook.office365.com
 (2603:10b6:5:177::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 22:50:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 22:50:22 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 16:50:18 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADMoI2s976597;
	Thu, 13 Nov 2025 16:50:18 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vJg8w-00060F-87; Thu, 13 Nov 2025 16:50:18 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 07/10] makedumpfile: Remove outdated recipe
Date: Thu, 13 Nov 2025 16:50:14 -0600
Message-ID: <20251113225017.22994-7-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251113225017.22994-1-reatmon@ti.com>
References: <20251113225017.22994-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|DS7PR10MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: 00303b0c-5ac4-4851-a33a-08de23070752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?m+E5WOAhGtPGv/Zb3cS2t7b1dHSWWLAk3WQcPTxTZa2FI7DxLIp8C6AaOQe7?=
 =?us-ascii?Q?pT8xZeMVAn6fUsl/4mU4irb4D9ELhpqfnJLnHTdXADFbJTjno2IEHZkVIUBD?=
 =?us-ascii?Q?L25yctY3N+9ssvZaZLZtEmiVnQKfKkjK0fWLLYCrZEkJK73d+QzlGcjlzclk?=
 =?us-ascii?Q?DtF9S0Raq7cI8K+okjtOwFJrWCRnd6hxvtk5Cd8PD1uOkdhzVFdNZMK66VMl?=
 =?us-ascii?Q?AW71W6SclseKsqQMk4bP4zLsfXIOMOKHxsLy5gRgBXxsztuhSMIgRahctqLI?=
 =?us-ascii?Q?dqhBbWVCwIzNemEmDFVBX15aJNBn5dl4YLUFpyRC1Wdo+eA/DhCRXirPrMMm?=
 =?us-ascii?Q?9xD/rBD7KICMkh7MGcg+IkZnXFIfhlmj3y0J9kKA9owhpebxB3J9ak1lOxxv?=
 =?us-ascii?Q?2FHtoGdESpqi6yPz17xNVBypTOlNxQ7Iz9Q0EsM1GA5XFmZBiiFfdxshMpDg?=
 =?us-ascii?Q?daqQYxpnRqK4jskRI3boWG8D/od1ezZRkFcU8mKg3uS2ipqrK+SEohyBTxVR?=
 =?us-ascii?Q?g7rI5WJ1UaQ+teM0UTtKhdLIf2/jBJBmSc2YAddnUl0QbLh6SzWTQHnH2+ES?=
 =?us-ascii?Q?LXfyrLMfsErgtuHAdqcBLJRMqOINm+F/neQRn4Cyri4Q4B02pFuYuBxuNjWm?=
 =?us-ascii?Q?Biw/coAMeffTs9eL/ysPhNoX+wRSslFxSnlrjLMdcNLljf3w8HN1XW15ieLf?=
 =?us-ascii?Q?6HaZiMhJ/Hcx6oB9YBWCpqJXzwjuJZdQrUVzpkrZoT66l2JMwWp3nyrNOOA5?=
 =?us-ascii?Q?l9oXqxARdvkOD1o8zD5gIvG3k/eDFg/0X4q5qPa0hvRNw4ImIsuyeZo+kFYz?=
 =?us-ascii?Q?8NYBkX+6qsj4GSFyNACfHyf5s+z1plwtLwh15S4Le5X0ZNr3RkggkUc/8ep1?=
 =?us-ascii?Q?WG4qxxtZpxbC4IUKH/8MJY3SeehUJWBHcc8HT5RFvT7Db2YlIguDsyinjoqG?=
 =?us-ascii?Q?oLLyu4dN0uLwPlRu7LbVoj9QcqYsEPl/RRO8Wbw9EhlAoU6SsTr89WPXUlc9?=
 =?us-ascii?Q?lTLp9Wx26RIyJHR4cfyY1EZxSrO97jBSgrmpp2xsg9xwWrINooAT4tV2gwXd?=
 =?us-ascii?Q?B+/ltuLGZ03wapPKpm1/DwVOkfA7U+M+vQbynvNQoBlrGgCGXWjNrJSvYcpu?=
 =?us-ascii?Q?BNO9QrrNjaIstMiNIYm+s7875B4+HimJF8yA/VdPMMUJfFR4Hj2jlGl9axZc?=
 =?us-ascii?Q?902UKM/pSDD1VBP3YsQQXkSEj/uGE8Jfclv28ZW+sK8Ui8uN8nIIIGSo7Xwf?=
 =?us-ascii?Q?s2wFQhuS0JqHsf6s58pp8Thp5laQ+I8+OBc56zxdJSpAQINCkQRWxRGWptGC?=
 =?us-ascii?Q?ul6/ZRyBG7MvptwcQFNCLlMKfHN0PMDTR5uRC+vqILf6+xlDECbrffCAfRus?=
 =?us-ascii?Q?h69UnPXEjnPczTyxOtJSzdvsVRtstiNE/NmBgf/a9CgLPGpvqyxKvP8DmfJs?=
 =?us-ascii?Q?buBtePqEPZT8IsmwbQW3uxjTszDHYYNSHaFxCplBz9CU1RJZwBxBJy1YLBKO?=
 =?us-ascii?Q?Ny34ayJSx5URKa+Z229kZeFnYvMuUObwbjaVOsTJWyHuTbfHtihrCqMm4zD8?=
 =?us-ascii?Q?AVKq8CjAXKyJfMymY6k=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:50:22.6748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00303b0c-5ac4-4851-a33a-08de23070752
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4863
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Nov 2025 22:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16756

There is a newer version of this recipe in oe-core, this is no longer
needed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../makedumpfile/makedumpfile_1.5.0.bb         | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb

diff --git a/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb b/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb
deleted file mode 100644
index 2b7002f5..00000000
--- a/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Make dump file utility"
-LICENSE = "GPL-2.0-only"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI = "http://sourceforge.net/projects/makedumpfile/files/makedumpfile/1.5.0/makedumpfile-${PV}.tar.gz;name=makedumpfile"
-
-SRC_URI[makedumpfile.md5sum] = "e22277d77752c71525a79eab148abf55"
-SRC_URI[makedumpfile.sha256sum] = "8a771a22c6ba79dc505e55727f0cfd357ccb3c97defe21cefd5a67b64452fca7"
-
-DEPENDS = "zlib elfutils bzip2"
-
-EXTRA_OEMAKE = "TARGET=${TARGET_ARCH}"
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/makedumpfile ${D}${bindir}/
-}
-- 
2.17.1


