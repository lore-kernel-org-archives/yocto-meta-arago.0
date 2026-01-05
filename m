Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164DECD041D
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 22:22:24 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77035.1767651741664633576
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 14:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=tPHUu73e;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.48, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSIOoyJsuWJzBAN1Rpcq7S/5m3Gcgz1g31GnMuAM1qLyQEE0eF2QbdzLayX9+qbPVkUTXT1tN6mQ1RNDy6ptEZFOyP+seFxKjh9C5FzVIAcU0IHpoV2oUTxsdNdljNa3NJHjzJFtwn5pM98VB9QdtWHUkewnJO1vikPkjeuk+ZajA6Sc4ulSaLMKxavsOjCMi6w2xHa6QO3bYukGkRT88zoFIi9NkT6SnQMpYsjmZJ5Cl4xRhkEYtwlmKQQFEPPdjAJNqs+X22JHF0TL5Ee36kdaveRWq66tlWIz/dUpM6IZlmnkfxEWcZZqkwsPRITycDVaweox2xkiefkTQ1Eocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fRERDUfPj5V2VEXx5rO2MSmYZleSt9wwcnzsi4OuYU=;
 b=CqyBu18UdtwJY+Khpm7YLLddhimW/DaRWREXrQ685NODUDfDG2rvKyJvy/qWdo3/VYQdovKEIEULp/d5MG62yTEHdZgcSZ5YQyKcGrPdTZ0g+Slzj9Fnw+TRBLdg+5BL4N1w7QcB9dF8EvE0fLrTAUVjmasl1kCfwjwbbUzlmz+O2YkPtpHuvLFNI9nwAzuss0uu6+XjmnpT0PLef871Ok4owemZ1McgSR8PTAL7+0baewCHWYJ7fqHxJ6PX1E1pY6QRXYDxT1VE5GkcqUnEdbM34qE3CARRb4TFA6MztSPdTCMQEMCx476foYQ9Zw6JNmQlT65yTTAepEevuK7TQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fRERDUfPj5V2VEXx5rO2MSmYZleSt9wwcnzsi4OuYU=;
 b=tPHUu73e0JL8vGKhfCdulynGn8erKZTQvpUGe8tfKk+GlHdS7DYzGJ6pYVVf8SOTxVfacsrMhOl4qyuwTwr8Mvysccz6fdScgX2hSjpbSFJEezeRjwKWxAx9+nXyI1ya2vMbMRLp/QtTD/rmctHQYQWLEgXeupTNfC8iyFKyHdo=
Received: from BY5PR04CA0028.namprd04.prod.outlook.com (2603:10b6:a03:1d0::38)
 by BN0PR10MB5158.namprd10.prod.outlook.com (2603:10b6:408:120::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 22:22:19 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::c6) by BY5PR04CA0028.outlook.office365.com
 (2603:10b6:a03:1d0::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 22:21:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 22:22:17 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:22:12 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:22:12 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 16:22:12 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605MMCL91865663;
	Mon, 5 Jan 2026 16:22:12 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 1/2] tisdk-default-image: Use core packagegroup to include valgrind
Date: Mon, 5 Jan 2026 16:22:04 -0600
Message-ID: <20260105222205.2503660-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|BN0PR10MB5158:EE_
X-MS-Office365-Filtering-Correlation-Id: 94dd2d70-101f-448e-b644-08de4ca8e2a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+HLGoJWI5iM9l4mWhWu8QzQMQnTzQoSbp1nf9111i8qwVx9IgPEQs0Lwsgjl?=
 =?us-ascii?Q?AyDMADHI6Qw8l+XKtwku4yjTZ+b7Xs/7Hm5L/f5jgKCSbaqE2wk6klh9tyXI?=
 =?us-ascii?Q?IUuJqFJcGMVDxRlon7AZV1KpHDZqVs+E3VHSBeqGh2kfY65T/Yx1yQMp5shT?=
 =?us-ascii?Q?Y2+KzZl9S3mi/jpCiRTqV2fWtxmzCrVIAyzh16uVSslM6HYUwgLi4Q4EjXU+?=
 =?us-ascii?Q?QDGepcp0RpJiAF9sPLFET2Li8vYLasRgO9zI9GJrYU99K6jlNtW5JbYvwl7b?=
 =?us-ascii?Q?M81gUxToWK5nU5GAjzg/fO9Bn3uAwKcDnxpT3wtOzSF/8+bNZYnKFJmtL9CL?=
 =?us-ascii?Q?hzZhO8mhTxkP4fvzcv6xNPg+FJFjU3XqXFchqodfUZYmVk6TpmlojbkVpwFj?=
 =?us-ascii?Q?SDJXkjBuE3F2ZXqoRxOzfJeoQ2L+Hr5TujXaB+I5txixolykXewH4qDuj2z7?=
 =?us-ascii?Q?WbeXtJVjQN5Z4KDtdGkdjViTiJvyn9B98Z+5Mcu5FDzUwidTP7cxh7YxasdD?=
 =?us-ascii?Q?V1QaauDtE3of2aagV3rc2RKH6EJ1bSr97nD9uhvym8UpNUBg1cKjNRxWhYUP?=
 =?us-ascii?Q?ODO0madYk3zIN5eVSFQkwaFJ2+Z2c8itcXcxAm4U02dgHxYG9VObmOASOu9C?=
 =?us-ascii?Q?X5gzrYFuoKgDT9tdLjSyouJi0OgMpYtiLCLIAD7nYrKT1w5nM0yIm29tHViQ?=
 =?us-ascii?Q?94agQEwofQO+eqvK3a5tX7A1bYwAYMTM1uyzz0m/kNOqXIVogMWK//A/RKxc?=
 =?us-ascii?Q?kR4lurjtXoalbjfpRl5FNrOUcYQqkyfX9zIsHe7rODF5Uh0O8rgZxh3RrK3h?=
 =?us-ascii?Q?pclE5JnNmTMr2jUgTSKM7wvL04a08tq+oenwz96Ki6DiK8ajLPj8nCJUro8M?=
 =?us-ascii?Q?0ijlib3+h+Rw4uu73HmSXioApCf8ZchT+UNmsCgMYARKL085p2mtkPXX7TNA?=
 =?us-ascii?Q?aRlt24hdJ5c/PjAmnnhKQNPfU3T6JuZITonGWEEcTut/LkEkQ9DXvpa4MZmZ?=
 =?us-ascii?Q?Q/BpXj9kFHSWZZDjFmK6cgE4XsXqevSBUlJrr/dslelgb5xF93BdiGZPDOY8?=
 =?us-ascii?Q?yr3I0ag4p5H/nxy5TT+baAAqzsXFe4Ji1gZ4Wp1wzbjXGvcAqM5X+50zYsT+?=
 =?us-ascii?Q?ZApdwsYrpHqLAhbWAJua1DvfE7l4Ixb9AYvfAO2B16vdJ5yBOyUcjST+RmIz?=
 =?us-ascii?Q?5n3KFDnLXbnwbDVz6v+tViAyZyMN8oltIQrslErDA5MFZfiVPGmxVSgeTWFp?=
 =?us-ascii?Q?0QTIeJsgidq2h0BCpED9JtNN0KFlRC7w5nXoFTjrZ5gAMr13seuFCxUjBir9?=
 =?us-ascii?Q?L4vpPJfzVnQKXyPVJGLO5yDkmPVdonMmdn2IUQjM8Ztja7q4VLQSnHRMpFzD?=
 =?us-ascii?Q?T6F6Rwzfx7RhCIzVby472FuYnHJdqlh/Sl9/jMNqwXWEkCGp9XrXsjY+5Btr?=
 =?us-ascii?Q?LWrtZKxqICZna0RFQjFldLURg+vIK66T/GHB8+cb0N85LPPj+39Ymlfpz2se?=
 =?us-ascii?Q?xvDnJI3Qq+5m/D2i2rcyoeCDVd/KXJqFwYblV7Sp1dW5Di0gV8I/fORZ4d07?=
 =?us-ascii?Q?7fvUHmQGt4vy62zYxGA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:22:17.3219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94dd2d70-101f-448e-b644-08de4ca8e2a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5158
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 22:22:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16924

This packagegroup includes valgrind and handles the arch compatibility
selection for us.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b=
/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index bc067857..a35e8321 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -34,12 +34,12 @@ DEVTOOLS =3D " \
     linux-libc-headers-dev \
     build-essential \
     packagegroup-core-tools-debug \
+    packagegroup-core-tools-profile \
     git \
     dtc \
 "
=20
 IMAGE_INSTALL +=3D "\
     ${DEVTOOLS} \
-    ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     docker \
 "
--=20
2.39.2


