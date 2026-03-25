Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B590106B53C
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:41:56 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22507.1774446110404709104
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 06:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Hd1HTTvi;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.68, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyKzDpzl9yDZy8Z7wGFdHfD2Jyo2eCKu6Pvlqmb7GI6bSTlDmd1N3NRV22DpZoCVTAbf5GtUZICYZCBXWRfAnBPgBoyAk+BwJaqGbmC4wDgGgx2OFSkJgBe+mW5Xqt5Y/jKtCVSkk8fZwNxVysrZQ6t/lY3V+hwxN+vB3jnTX1ju9i3KG92hKoSCkePTqRvyBO9cIhPqK136coY+/6z84AHt8JZuPJouBihrDI0jHHT9Bgngu1XBtIt5/lM4O3Mpm0NhpU/BdjF17iKr/htH74tgSsBCimDWIZb8dJTzU3Ehl3yXCUeG44qtlLwnKNh0QhMCEUqCZ1/FHme80wfW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Slf9wZgVPYbowa4Z1oq1gf04MU7sgqw+gUCONy6L4Aw=;
 b=vl5BBJw+jS7NOcRAaszpvLBvRFFUlk2ODnif+VKQ4QWxXNzAxP6MKfKBB1jfIoO7TzfUBkm0JV/klxUiRqocJ6UCbEwfVqqIN66AYj99nJysklinDGf1otmvQNAmsKxOJnhuiPwzZN/1fhrROl8z8r01m7seRxC1nNiq+pGNtif1+R7S5Jw6xjpgfWMYveJ3M4IVkMb0wr13qpVGK2ey1nHcbp6bYYfR2rJWFqbn6vX4RjFET4yimVyCGDTK720j4Mm1pw1AXmXRY4Fa2WOx7dItX+54udX9rS0556c8JHrxZkrcOgo2cQOhjQLKQI1Ji/uk4DOxfzQVNeb+5OIoEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Slf9wZgVPYbowa4Z1oq1gf04MU7sgqw+gUCONy6L4Aw=;
 b=Hd1HTTvi2oBUqlr6/ynSCgUUxph3WvuYUXDkwcEzuuiw1P36py5M6yWh6Ahdpnp17uQLmHTySqNnnKepG89D7LcaHWuiRL6J3GNMZUdBHFFZLQixeOUk0vkh13LrIfdKFQG5CWlqqJatFj4ADEeWDXipSSd+H9O8VTYJzKwTV4s=
Received: from BY5PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:180::42)
 by DS7PR10MB4943.namprd10.prod.outlook.com (2603:10b6:5:3ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 13:41:47 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:180:cafe::7a) by BY5PR13CA0029.outlook.office365.com
 (2603:10b6:a03:180::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Wed,
 25 Mar 2026 13:41:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 13:41:46 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 08:41:24 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 08:41:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 08:41:24 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62PDfO7h368912;
	Wed, 25 Mar 2026 08:41:24 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w5OU8-0000000Djqt-18IQ;
	Wed, 25 Mar 2026 08:41:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] arago-prefs: Remove old settings
Date: Wed, 25 Mar 2026 08:41:24 -0500
Message-ID: <20260325134124.3274512-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|DS7PR10MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: 411f2d7f-a262-46c9-36e1-08de8a744277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	QNgOIpPlOzwlArAdVPmuD0PO5dxLBQDPyz1fJihJ0D93EqGhfzoJLbssGZIfE0FfAGPecTvLapLEX1F5J+BMHHG+oYf+gZkXCDXM0VmsZsXdreFQCKfh/nFbqVIa4cGflDSZKwTUEf7/M2sHFsOs3m9fdP5Q9bn3bmef2a9Qt/bhbHAmqNC3C9o1Ip9dPfU8LwG4fmS5jfVbumkHv7Yvr5DeLR0HLyIC3E2uHByVfUELGMvQQIIs3D8X+4div0IN1T6sUhfgoofTk3ZPce/6aCmCGXHH7nSJpXCfS3IskHc7yM1YVmX1XayhY234O9GKkNbzXnZsLSunzGE1pzUvlJ+FnBKmhGFf4qHd5Db2Ez2PNP7P5KsqfLgaVqZE15Jf7zEO5wvaYsj/ONHp1SL6hvGSnv2rKcEbvFGnctA4u2BwkBAbQL2/FsrgqTr/6JPXDryY2XOKzN9IRxEY3B4kVX12rwWIocnSd7BtOOdcFmXaXirmdCc9EpzP6gWxJMH0GbFg49qAdRHJBuXEil9qSVWaxh82N9TRSZ16Yi3G7llNnHdpvb2/vRbJxSWOFYEKU35crES/h1fQFxkdrhCSynemOf5NOgnMK0XZwwRhHvPA59qLZ5+5bd1TbB8UfLr9CovlUDfuVAgj7sO9bzhQrqotFVqXTpylKFNyp1K7knG5W9gKAtnF2CSb81xKHg5zieDOLGN4aIUWNa7goyFzEmAICxDPMp7DVewUNX0sM2Io3c4FAbl3VBE/WbBNjznDGFRWTf+O0bTaJ2sTY+twxQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fKYOEAs8De6LKRTpAaZ9OuXIX2BWCMAuVkvlRwCASAqI3shBWS1GRZrZiLFwXG+LZJNTKsiBG58kG3/4w1AE5ao3scCPShIPhUmguO0U0xvhM2Qef6zFR1YRNMPvueHqw2Yxze/Y0hWDfSS/4/yeSNQs9FFn8cDV0hbYjw/btGRvhbCX78NOCv1Lrt2K2MbwJysSl99/WqnyCFFM3K7H996CXRa8UHIQ5l9uDEXRrxCQ1+t960Z8CgdPR96A/zvNqWKRjwlUHW8HncYFb1suYp8xnVIEsye0RAxpq4WZhimJleG1JcUNsfBIJs8ML5WiIB4g6VprgigVuHqZK3ivUhQsyEIYBR5pF6ysrsaHqHOM78ngenNLmwn2tQd7kBJH0gXciZNLmhD5DD/PZk92wN1PiEjHAd4diZphwmMa4bvaqL0gE9JIl/T0I8idM61P
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 13:41:46.7763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 411f2d7f-a262-46c9-36e1-08de8a744277
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4943
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Mar 2026 13:41:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17431

These settings refer to recipes that no longer exist.  Remove them.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-a=
rago-distro/conf/distro/include/arago-prefs.inc
index 6a2faa53..0bc2e8ff 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -5,8 +5,3 @@ PREFERRED_PROVIDER_virtual/kernel:append =3D "${ARAGO_KERNE=
L_SUFFIX}"
 PREFERRED_RPROVIDER_libnss-mdns =3D "avahi-libnss-mdns"
=20
 VIRTUAL-RUNTIME_dbus =3D "dbus-broker"
-
-# Setting PREFERRED_VERSIONS due to selecting a specific version of a libr=
ary or
-# application that does not have a GPLv3 license
-PREFERRED_VERSION_crda =3D "3.18"
-PREFERRED_VERSION_obex =3D "0.34"
--=20
2.43.0


