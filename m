Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F05D6CFC4
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 04:28:25 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60880.1769142501631248723
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 20:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WC7/xXK+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.49, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oprvi+d+iZirwV/8txdHA7sJoRZhAYyr8bWhkjLCqfy9NkrhHVzl/M3KlOH6Q3Vm3EKfb7Zqi47aVXqrstpumysh0Ph7W2K7q7o+h5NClvRdgsJyK+Hl4bVK6lnv4pVNRXhgfTffyy4Dv62B17+hs+WShHRS17jlW0LuFjyZ7fVYOPDVN3FTjABUhck6SElV8ovJXk8qVVD5RIWKgCTGldS0/Nqf5dghUpR2SGB+J8u5G1FKad8vySAEJIl3YjZAmRh9E6/O3uV7a+mPBNLgzbikqeutsBawLEdbUKuVWgw0rhQ/vPhRXPuudxnVb9BmWNnSuNIIVpgb9dkQoJ2qow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XNvGcq+4VebfivIvmmKkGm/ngSGUQUB+Jng7V/zVSs=;
 b=GiEFwT9otkfqKLCfW6dB/+UbwrNAEredVr5FwJYHQRVt+A78twjZ6Ln2NBWWtWCwf6BdG7ApkqS/2WKoIHY/p7PuYKpJlHv0yx6DOBrd5ZyWz4JWzzIBQkLGw46mpttKzUdM/uLxmRg3aHE2hqMmEyVe2te1y9tzu6bykxMGJiF/Qslt+UOyFhT9W+HOIlksRq7tUu1H5ZUl5RHv5Gr24MEEenQEAeWQVGuO0hB+6bQrwnvUB2+7QeahGfcL8WBJ4wdDdTbp6Eez0m0eHTunl0nhc47xq1/GE9yYBdjLn7QblI/e75k17pdrvwpWkmjFfOP7fAYjEVmoMaUEsVrzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XNvGcq+4VebfivIvmmKkGm/ngSGUQUB+Jng7V/zVSs=;
 b=WC7/xXK+AWz04mB54mcIoH6oVJJvHPHB4KMK6LFZUoqsyVPUDg0xsNYvpaznsTAuzOsDYuJYMKkm4NBw1CRLGJtLQ6QVkfIh+6pehUZntiPHZ/sEqSm3E/QzKleA05b/LmCydy95MLA/fv0viwzRgi135nyzMNfF5dPMi1J5HMI=
Received: from BN9PR03CA0335.namprd03.prod.outlook.com (2603:10b6:408:f6::10)
 by CO1PR10MB4756.namprd10.prod.outlook.com (2603:10b6:303:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 04:28:19 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::56) by BN9PR03CA0335.outlook.office365.com
 (2603:10b6:408:f6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 04:27:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 04:28:17 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:28:16 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:28:16 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 22:28:16 -0600
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [172.24.233.77])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N4SCMn1574886;
	Thu, 22 Jan 2026 22:28:15 -0600
From: vishnu singh <v-singh1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [scarthgap][PATCH 1/2] packagegroup-arago-tisdk-connectivity: add zeroconf and avahi-autoipd
Date: Fri, 23 Jan 2026 09:58:11 +0530
Message-ID: <20260123042812.10342-2-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260123042812.10342-1-v-singh1@ti.com>
References: <20260123042812.10342-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|CO1PR10MB4756:EE_
X-MS-Office365-Filtering-Correlation-Id: f16f1fee-fc28-4e73-94f4-08de5a37d507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zzmkc42oAbJ/sZLfo/68p8OAjqNP1j3tMgnkWOeVuPp5E+8qvz7MnT10Y4UH?=
 =?us-ascii?Q?dv0QlJ5UiJzUpfdXKIZmDSEBRJZoVT+2IOYV5jKhpOyNi69r7ulRV1zd33P2?=
 =?us-ascii?Q?tJoNlTrYSVZ3ckysnUGklfaKh14QH9MMWY2j3w2qkXqAxw36hbTyeZgaWnaw?=
 =?us-ascii?Q?DnZ3R+pGTmz3UtnoQdbMgsYWZmRQ9mfxdrUA5jAi+/UnrGTGkCmFypqokoBi?=
 =?us-ascii?Q?cltlfvuaKJbCimEtUofWvmCiKkcVsSYuB9WLTuSfLX/7DSa6FurjU3tMub2c?=
 =?us-ascii?Q?g9s/56yLe+4/RMG7gll3cbffuUxe3Kq7hSQNaujzzqF//KzcxbqMMqAlGR+A?=
 =?us-ascii?Q?pk0Fkl1clMmYwd+F9z8RGOw2lSiKXMLA1V1MDSJ6dcgTXIVVc6I/VzsPS8M/?=
 =?us-ascii?Q?ryv8fmP1oCO3pu876JgT7zyd4+9dKJ2QeQOAUGJBfXUYdioJv2nSl+aKwP0Y?=
 =?us-ascii?Q?zEZwdNPXULqZVbYpcH6qyo4oT/W9n8StJ534bInoSlmBq/pXFDIjtthUHyB+?=
 =?us-ascii?Q?FK2RXWzPvi8lq6ol0DS+QWI+MaeFmdmjwM4H9UviW310VX4sP1KhFt2RZ3qW?=
 =?us-ascii?Q?vEnW8VB3kFy9iFNHgm27qfg/6wY/YZLZr74DdTILWQi0fR2Y3A1kZI64c45g?=
 =?us-ascii?Q?EkMLi6kw0cmE/grgjU0kF/AGltUdy1f4gZr5tduM7XeUXHzWuIyFpiFMuBdX?=
 =?us-ascii?Q?O7wiEFJUQnbO/4fAH9J6MPLOeygfWLs+Mua5+WapEYjQqpvIo53u3DQT9xoX?=
 =?us-ascii?Q?wfwgmHQUuJmNMYWBPjW/c7gg8Ez4joDYupdN4MgfI+zCv+jhG86X1FBXfLTd?=
 =?us-ascii?Q?5wtqclvaHoWA7NKBBhlHT+XwdrLofKaeXFCxpOz9Vo5D77jFBKhZdnNz2RBl?=
 =?us-ascii?Q?mxcgjhgVbBlHnN7kGfInHl3+kz/y2yIpw+wivL1TcyOCU4tftXclpHX1wsto?=
 =?us-ascii?Q?3AX6AZbfvIom7d3wwhQyuL0SaQn2fzZz7YFblcDvh8fKGYGAvskIP3Zts0S8?=
 =?us-ascii?Q?dkK38lI9VL0TR9/mkQB0QPPeMEYVXSdcpInwG6K0M/bBpfBw+ntG7e3zzYRp?=
 =?us-ascii?Q?oHk3CkQKQd+MBdWJY7B4spY0NH3uTLV5qFvfyONHxktuo8nGOauAdaevmqS6?=
 =?us-ascii?Q?VrUl8mMyDUUnsvQCXzIvomYOfuD/ONrWioVhyy0pgd5NfQFL/p5q/dw7Xmip?=
 =?us-ascii?Q?RB+lWtLOGqa05akdKhQPhSEJ9Tc5a5eNjyDbuh2tx9hvYZlmpC4PwPLaoK2v?=
 =?us-ascii?Q?WFzOJT97ppO5p0QzZJcicwPoWFsblOQ5tP9OeZnUu0szLrUDxSgsTOlBp4Al?=
 =?us-ascii?Q?Hi40gixGQ0m+psGtBB0ip0a3QHcsqAEBdGkxZP4XrMKC/6cVZatjqsWig4bg?=
 =?us-ascii?Q?NPETsPjQ8dbv2AdDIikXWaTpxDvMYdMArI0/NU82//Z9gdEVkCnAo7AGZqNC?=
 =?us-ascii?Q?go/ituUnWsIiGdIa0vMo1hslrT+or9NSqMEgaZG26P96eJYvBkVEgNqRIaez?=
 =?us-ascii?Q?ptMSdKF+ro6ava+4EaOEsNA71MpgKE/IVBZXFgOA451kDZLg27tPZss+IURA?=
 =?us-ascii?Q?T1Ux63r0xxt3GrtcgfIV4acSuVs4HHpAZhavKHd/8gKCEAsdDntJqvz4YJOL?=
 =?us-ascii?Q?yqFoygJ7f8Pno/On1SUgewlKXG4A4e2FLybmyIcRLv0n+AIFlew7AQRpmvdM?=
 =?us-ascii?Q?YVXmrw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 04:28:17.5700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f16f1fee-fc28-4e73-94f4-08de5a37d507
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4756
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 04:28:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17017

From: Vishnu Singh <v-singh1@ti.com>

Add zeroconf and avahi-autoipd to the connectivity packagegroup to enable
zero-configuration networking capabilities. This allows devices to automati=
cally
configure network interfaces without manual setup and supports service disc=
overy
on local networks.

Zeroconf provides automatic IP address assignment without DHCP servers, whi=
le
avahi-autoipd implements IPv4 Link-Local addressing (169.254.x.x) when DHCP=
 is
unavailable.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-tisdk-connectivity.bb
index 0a8d4493..ab299391 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
@@ -53,6 +53,10 @@ BT_TI =3D "\
     bt-enable \
     bt-fw \
 "
+ZEROCONF_TI =3D "\
+	zeroconf \
+	avahi-autoipd \
+"
=20
 CONNECTIVITY_RDEPENDS =3D " \
     htop \
@@ -68,6 +72,8 @@ CONNECTIVITY_RDEPENDS =3D " \
 CONNECTIVITY_RDEPENDS:append:ti33x =3D " ${BT_TI}"
 CONNECTIVITY_RDEPENDS:append:ti43x =3D " ${BT_TI}"
 CONNECTIVITY_RDEPENDS:append:am57xx =3D " ${BT_TI}"
+CONNECTIVITY_RDEPENDS:append:am62dxx =3D " ${ZEROCONF_TI}"
+
=20
 RDEPENDS:${PN} =3D "\
     ${CONNECTIVITY_RDEPENDS} \
--=20
2.50.1


