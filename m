Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF81FD46625
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 21:03:10 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.705.1768510989624707760
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 13:03:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Vz6AYVHY;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.41, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuLvtfTZpxWdbGmvSZBCXV5WcLNeb6cyelrZl79DX17GdWKfSkXCs6Fu8QktxVrMXTGrZKxTYgMqgdsPHDBTTlv72LatMQv48qRODhQ2+47JROupq4G+l8EDU6Ef4CP1xCI9d1SmzKhxmPGKnnYMkuCX4FKgqx3500IP0F+f5HVLgEM6u8CXxwHm1FVjBgTM90dPU+fVf502bcVn4DvgbvZFuyRMGCjasUUwhuTieCpI4losNm7Vpj7ebNY71oInF2+TvAB/oiPotjKfVkxu2XAWxLud5rsDC1VJJzlOKsjL6/lwyVubYFYTZ9abd4+pggm4FHWLEGtPeZyWyzOkeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfGkiugadtzvuawT+JRIVF+c3sR8Cy5XoKWsBr0GEWA=;
 b=MeewdJTTLGl56V1ASRio4YYBA/C+o6pbUsi3UpgX55D+ZnSDQqSYJ2bRh68rEgyRBgPAteMK+GMMZBBReq2i1yhu1irhjyPHeq5r5kpjsXbo/HwsK55fauy4ml6K8IbQf5CMKFP/IVhfpW6DAc3eQnQdQs5ZI1Vig/N1xi2l8ertWxrGmE5eQnQmIjVwxvpUsefbOl6O4pWwjoPR0w0RHHF6kO59PGkSWuvQ6zOsikT5qO7smoKQiEdeGwRHPUJLMuNScTB+7vBVSOyfBwV4H6+a8tfoJMo9c36Ek/kp1X4DHTvALQpMUu1m2MQfjWaUt9BAaYiRhaVq8UkidjWxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfGkiugadtzvuawT+JRIVF+c3sR8Cy5XoKWsBr0GEWA=;
 b=Vz6AYVHYl/mFLq2N+JFH+u9KQ1HrfhksBga5Xrp4PKoKyF3nul55ei2y+I83TTPx5c/tu/4tRBCmLw8gyyGtvdra+eBf4QIx0NaeE8GxAk7uDMsSLP32jUtJBXyR/ndj+S5RzGLDk/vPObUW21LdlYmDn2vFnOmWecRkZBigRcM=
Received: from BY3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:254::22)
 by CY8PR10MB7217.namprd10.prod.outlook.com (2603:10b6:930:71::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 21:03:06 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::7a) by BY3PR05CA0017.outlook.office365.com
 (2603:10b6:a03:254::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Thu,
 15 Jan 2026 21:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 21:03:06 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 15:02:59 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 15:02:59 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 15:02:59 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FL2xUm2032709;
	Thu, 15 Jan 2026 15:02:59 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vgUUd-0000000Fzot-0vS9;
	Thu, 15 Jan 2026 15:02:59 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] packagegroup-arago-console: Fix package name for alsa-utils-amidi
Date: Thu, 15 Jan 2026 15:02:59 -0600
Message-ID: <20260115210259.3812548-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|CY8PR10MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b862fa-bdaf-48fb-5cc5-08de54797b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3eQpPf8elOnHqa4zGl+0dPHgHmydM+8W+OEdFQMURwR5ciWW99k05g3gfZV7?=
 =?us-ascii?Q?ugD81ud5W8kcT/WI4zirk8mC+IQeB8KCDHbIjKohLEn/Ro2r0ssIQbv4XDCj?=
 =?us-ascii?Q?A6I/r9nvp4Lrx9D0fcNGWtftT3No9pahYSh+RZiQ5OtFEJlhtcPhLX7OEhA1?=
 =?us-ascii?Q?zUaCM/PJQL2ILZRq33gRgtt3H5S9exPvOLAD5FLxSpQFtvnm5mMYql5QkMu/?=
 =?us-ascii?Q?PJ3rnTzaATSjb2T7UZDK6KWyDlo19Y+JTAfxtleP4286afXaGFG/Phdxs8l4?=
 =?us-ascii?Q?mAVOIgx+qWVwOQxSsUzaoLTDikLFTMI9FBImAnD7NXT3gyf8x25q6ni0pwzi?=
 =?us-ascii?Q?0pLP7OAqkow/XZuNTWWTxizltNnEgkbohUXCNwocn31/TNDgi3UG5/RCDuXI?=
 =?us-ascii?Q?ArDn+NGkbPi9Ts3MwGrAL0C7jsQOq5zLAT4KWs7ymzjFgDpZitlHb+BeGwgx?=
 =?us-ascii?Q?UfZBZAW2rhJzYK3D1MdDyHLK7Mb06iS3BxSd7UcccWL9MYwK2pYeuYz9N91Y?=
 =?us-ascii?Q?gmNyLsnOiHwCY7i59Ec/mBC4dbszoLaTqe8WFVW4sj9gu7o2xCbcwqntODEK?=
 =?us-ascii?Q?1lMJNct9oyMLLMLJCtktstysqZrtFDxbXcPFDfYM/SlM5hgGJ0BzlhGsnDVD?=
 =?us-ascii?Q?I2/LzIYOWwdRHsmE4s2SXYEtS07qgSmTrHgDkXMHCDgX7BmlZ9TolpdMKzzP?=
 =?us-ascii?Q?WZ9KZoULeSnM/ZTNIRmfGK3YK/l6FXv+rWHUiIy/Xzm+Xq32uArJf2jjT8bm?=
 =?us-ascii?Q?wqOrks7aMX2eDEnZ3q3sYaZMJF7J6sRpUriwWOyQSjSWvyypCyLT7tMNgCy1?=
 =?us-ascii?Q?bpLyBIcdgSaZqiJ+hpynOfIhaJW02EBZg7SaLPFk53xVUJ1/5vs+sSofR3Yv?=
 =?us-ascii?Q?fNShhJy8O1N2C36W9abQ6Ul1BZeQQywWm2aX5gOj84t5n8SaUHMaJYQuq7R6?=
 =?us-ascii?Q?QsCXM/6Wbglm1zqBGub4PwF2DCVaaeYNhoimztnWNejomFJ4JgB/M4zzNnVk?=
 =?us-ascii?Q?qLgenwIB4hJVBLX7Uw8JIUqiAigc5oYORvbrHI7Q7+moEMg7o0SzvsQGqYMv?=
 =?us-ascii?Q?5UZJCLb8iKwgknovHoM/JYSONAFqjaTw8gSAxQlbcfUgtWVq5lMwfmfwytbq?=
 =?us-ascii?Q?iRiDljPbd2E2JRbc8sjWnR5vaN9bcEZ9MvpX0ifGIJ1E6VLKtFAGoz10a8nG?=
 =?us-ascii?Q?DE06rXqwOK81cTSznn6fXtyV1OwozgM/b7xXSlcVDm7hJ2yWiXLRQJmsAkEL?=
 =?us-ascii?Q?1so42r8il2iRxfmg6Lfr+zonDZW8zEKoHv4NR/IYF1hrIPbPdRkELU1LURd+?=
 =?us-ascii?Q?4K383PQECKriLRXmR/OQqKGRKtL219ShrMvpjU4M2oUsB4w6mfqbh0vWH4EV?=
 =?us-ascii?Q?MNzwF0beZyWUlPIJEp257k/Xn31dU8/NcA5w599WTe5ALt9HHXFJ5hGJ6o2b?=
 =?us-ascii?Q?vXxyhsI2tBMw7D5mUpgh3KUwnLFhYFEA3Bzx0dYsFus0h/TgSrEvBfkvHm/3?=
 =?us-ascii?Q?GtZbuVMc77kwsQjyEG9Zlx/VBI6iF0VFTUBaflAP7u74u9bY/3rfXnZNbGSg?=
 =?us-ascii?Q?n6ciCqc6iundHWyhZV2/ZQl8DubFqskXh6GdghwA5GBoMmZtGKLp3tHSPVda?=
 =?us-ascii?Q?x3C79NyR1IT9vke658qb+BJVrKewTIgfR9/itRrODZ1ST7qSwy5yw42vC3Nt?=
 =?us-ascii?Q?zv98Bg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:03:06.4837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b862fa-bdaf-48fb-5cc5-08de54797b17
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7217
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Jan 2026 21:03:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16957

A recent change in oe-core [1] reworked how the recipe chose to name the
subpackages.  The name of alsa-utils-midi changed to alsa-utils-amidi,
and alsa-util-scripts was removed in favor of separate packages for the
three scripts.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D26a28ee7935=
091250a8c52f223a7a954d9e29d34

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Added three more packages in place of alsa-utils-scripts.

 .../packagegroups/packagegroup-arago-console.bb             | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-console.bb
index f6ec0a05..04da0c6c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb
@@ -13,12 +13,14 @@ ARAGO_ALSA_EXTRA =3D "\
     alsa-server \
     alsa-utils \
     alsa-utils-aconnect \
-    alsa-utils-scripts \
+    alsa-utils-alsabat \
+    alsa-utils-alsaconf \
+    alsa-utils-alsa-info \
     alsa-utils-alsactl \
     alsa-utils-alsamixer \
     alsa-utils-amixer \
     alsa-utils-iecset \
-    alsa-utils-midi \
+    alsa-utils-amidi \
     alsa-utils-speakertest \
     alsa-state \
     "
--=20
2.43.0


