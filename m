Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C631FCCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 21:41:55 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10770.1762551708877164711
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 13:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=a+Xm4HV+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.9, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AM+e2Ml9npAaKiAGBW9UyM3UaSAqn4yftKKHzJnwL4FleSlf5Ic8+pnvc2vjZk+G8vyHdOPyreCPHp3/uX7oOTcf9WTS9S0JIWH8nO300UVcCf9AwzUOjc17D21oTPfYyUCEzweWVKz6kSxgVkt3QSam6qtD8RpoqW+DcU2qMctSLt6FphA4hmVRjBMylSDCka5o89uvGALAoMrULH6Mb/7wxKPuJGOQI7M6Q5Z2/4ObWLuoW+UfTJ8Q5/W2sRbxgxHq8Tr87hRkPEMTqGobcq4piOm3xrVhDw7lkY1LYx1c1NuedW6GVq0VlbZbNEybgz+qhPVvSuGvO8MTimfAPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfKbw/aBLtdK+uwZOTZoaLNiuIfn5YEZAUqyLY6FOQg=;
 b=XTjO5dWygzjYUUDGtt/1FcVnBRM7/ZwdIsQTIE0ZG9RnrKPvvI0mI1T1ENum63B1hWwmhT/ET3K7kx24qLq0tIw9gaK5do/3GuMRvlpuh0plT/ApOiv8Nscm5eX8ND2zSYrMbYEEQyZAyhcqQQ4nLxu5EOWGU+oTxvIrhMWmg4HfRGtmA/NYmFP0u9fAhHBuAgVoEtCvBxmqFtZQocpfwfto2ZXsmc6oQ3DjfBWYK5VSHK5iklv8FrDS6l/D9yu84NsJHi3D9LoxWRoAe5F87L0v+2t6T4cmbhaawLKDh+iFW2bt2EBmHjBp9Tv9HDONaldSxdwXDityDcsULySLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfKbw/aBLtdK+uwZOTZoaLNiuIfn5YEZAUqyLY6FOQg=;
 b=a+Xm4HV+yt4K/SBxkv9qKvzRCI+wCbqOFpBonC/bNO9UKOv9aNfrBoBXgbHuQJwi684d9NhiVdEsIaKmL/Huu6ZMjksPyaWOIlNfTSIUw9rqM8mvH7cYOySkGdqOc30ivL3lCChI7R068Y+0Vnw9yN/UmVv4L4OVDJzDzmc//yc=
Received: from BL1PR13CA0220.namprd13.prod.outlook.com (2603:10b6:208:2bf::15)
 by IA3PR10MB7995.namprd10.prod.outlook.com (2603:10b6:208:50d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 21:41:46 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::85) by BL1PR13CA0220.outlook.office365.com
 (2603:10b6:208:2bf::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.8 via Frontend Transport; Fri, 7
 Nov 2025 21:41:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 21:41:45 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:41:31 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:41:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 15:41:31 -0600
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7LfUT23713651;
	Fri, 7 Nov 2025 15:41:30 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 1/5] tisdk-core-bundle: Make DTB filter work with DRA7xx HS EVM
Date: Fri, 7 Nov 2025 15:41:24 -0600
Message-ID: <20251107214128.1491466-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|IA3PR10MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f5afbb2-2b6b-47f5-bc4a-08de1e467318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SMMnBiD5R0HGwLHfbFiZYHR47IJI0ZmZAw7iZwj8UaWhiB7SUlwI6rm5shT9?=
 =?us-ascii?Q?t36TCOiW/AOaND7ksNZNBgbqIaR3dvgQrn0y69S/xGV2omtGsS9KJyHFFH4h?=
 =?us-ascii?Q?XNQOcMfnYXQWvEGCxqSHeob29GvksuyUGsBTLQPAtK3Ls6nESV05zCXWqjM6?=
 =?us-ascii?Q?SIzilq9yRUMIjDgbPeMHRHAew3/ejYOyY6vcjkR4ySYFaqMCnrkNZrLQAIE7?=
 =?us-ascii?Q?ZViU9E7Xk85YSiFP96Rpa4q+0KXRhjgPxCS2TfTXG8gfeH/ImSoIGGA8i/KX?=
 =?us-ascii?Q?7QUkByfMm+iDyGPcRQKruCtOcvZEIXBxyM4fasvmK/m3MewfSzVOr4mIqUwx?=
 =?us-ascii?Q?+fnXQC36tSxow6epIz7cK0AleM5Qd5LTjRZbEErJcltW7RZf+ZoD9U7AFuey?=
 =?us-ascii?Q?I3ZAa+ug9qtYWrW/rq1qxtuqwh9zpi9E7jTrhZhKBxRSfVhdfw70tA7YmgRd?=
 =?us-ascii?Q?TmVk269Myad9SYUxsfOl8bUK3sfJyEbMqTeaXXQGgxc5t/9XcpUHha8FsTLa?=
 =?us-ascii?Q?z3kw8MRS52jEwBdj0KxgStREgRMK9JXPTZ/IytVpqN2VzpcZkebDSro2k0iQ?=
 =?us-ascii?Q?rJp2vZqCUiSXnmu9cXYDlZgmZlhZX7RfD7azZQnMwbfJkcPqQ3B3DAbqejyZ?=
 =?us-ascii?Q?Y8XQ0J34dcfON1yuKyXjcokwQnbeK4LzKygWNhKR98g1eee9njXE5IGcqZIK?=
 =?us-ascii?Q?fAZfuPrkHrrMeUizJITPnBpC1uDN/KSUtWKoshAuHBb7vbQ647mgPf6YujqC?=
 =?us-ascii?Q?cge7l4ERbXLpfDq1Zwndzy/SEIi8pVYCGc2EDCNqeiKE2V6+bwfTYPUTsQhg?=
 =?us-ascii?Q?SkiVTb2f70jJCzY3y0G1DCRQ1ZwOzATlmbuLdp8BMeymRzfwWOgX/zMvAeWr?=
 =?us-ascii?Q?VUPY+vFTr1jIBg6jnDMY1FWEhO4jwi8NGetLx9EbP8ZnMu+l+dpELqUDLnJG?=
 =?us-ascii?Q?pdITHCaHQoSEQ/4+vSRC8u2+pF12/Xdd+Vc6FbQCyMZRbic5f0GlinZCgWJw?=
 =?us-ascii?Q?FdR9i5ZOCi22ASj/JjaweemTODMXCDuKB554eftXlqLakr8BcOqtKnUJqKX9?=
 =?us-ascii?Q?r7uuc8BVGReMNdZD4K4j3q1Ij9QAbM/mOrMTXXOq1HDe8pBGornxjFuJXfK4?=
 =?us-ascii?Q?6KMxvTMZfFYJ0StsPbxdaYStJ7lGcrprohc3laaQwmW00cHt1IHzAPs2wKae?=
 =?us-ascii?Q?rWHvzz5DlRCnC/zmoQHeb2r6Tb5opJTTXBD9tXnj71AtaQtPR9y7LmpEBfyf?=
 =?us-ascii?Q?VjdCFRuycRCC5zj8o+cBnM9egDIKoyYTmQm9mNYVRF+aQp6wL7wdQTzww/kk?=
 =?us-ascii?Q?GfHXeoAMa+Mbe4TnpyAECxMYqnYBhzxV3m/TweNwxjbJJiAOlmfD7X+yHO9M?=
 =?us-ascii?Q?44MfVqezgYCGw7pInmrdBirG9MCWpz8j6k3jsGGLST0qpRmHAtMEXykWs6fE?=
 =?us-ascii?Q?aK0L9V2pkodj8cKHHVryaMKw5AGeYJDhkj468whzN3QuNXGSVpDABlaOdZjI?=
 =?us-ascii?Q?Q1c1zUbxbWLR/kte+ONO6MqO41Rfd8ypbaN6b8uaUl/bn1kmE6GRz0Ms7Gqb?=
 =?us-ascii?Q?EufRK2b2f1mgxGKcnhQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 21:41:45.9555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5afbb2-2b6b-47f5-bc4a-08de1e467318
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7995
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Nov 2025 21:41:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16737

Add these filters based on SoC, not board. This allows this to work with
dra7xx-hs-evm and any other DRA7 based board. This also means we only
need one line for all AM57x boards.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/=
meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 5f72e7b0..200ccf52 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -18,9 +18,8 @@ TOOLCHAIN_CLEANUP_PACKAGES =3D "libgnutls-dev libgnutls-e=
xtra26 libgnutls-openssl2
 # picking up DTB files for devices with no DTB support.
 DTB_FILTER =3D "unknown"
 DTB_FILTER:ti33x =3D "am335x"
-DTB_FILTER:dra7xx-evm =3D "dra7"
-DTB_FILTER:am57xx-evm =3D "am57xx"
-DTB_FILTER:am57xx-hs-evm =3D "${DTB_FILTER:am57xx-evm}"
+DTB_FILTER:dra7xx =3D "dra7"
+DTB_FILTER:am57xx =3D "am57xx"
 DTB_FILTER:ti43x =3D "am43"
 DTB_FILTER:omapl138 =3D "da850"
 DTB_FILTER:am65xx =3D "am65"
--=20
2.39.2


