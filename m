Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5135D46627
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 21:10:50 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.872.1768511443602752429
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 13:10:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=j5Y4Q5pA;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.17, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzE1nsHd7l2AFo9SvFgAYJBK7pE/6ii6AS/3T9UytlVejMONagvHWVKStecVEezgtcKS4BagsqOC4TduJ9RfQKfX/3FGWkJHEGZqAu053J4FnFr8zK9zMvAyQLt99t70gN18Vg+Sk9405uz1PwkQHoYpy/yGuistYwWRWe6OcLbsePPnWTEuV2FvRsP+4xFl5lV2PWe0PpsSOW3hssZE0gaUBFgzmZJIsMvn34ItpdeKtyHLpDMRLx1AjX5E0Is9e/odi4cPsYWNulmj6VT5icsJDrmR+wZsqtTklFN4L3+bi+HMmPlj3nc0U9DunyhZGIfExyhfRFXheqk9mpFoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBcjwGFrqLPfIj3zdoV//rFs1JrQ/fAuuuGGKkjNCnw=;
 b=CGEiK4rltN3s/x09Bb86S2Kx/DY8/Rp6x+MVhC0F3SxNNGz8LuL9bEmA+Zb5GSgv7dhlcAfKtyxSNoRdhk7xpJm01QN9zGN06VyniCeRNLmP2h750qG5c2EsImc+luNlNbaUh1aG6wh8O1Odd3AFurSnOe7xrmJxufMszzGIOHbCyihW93sUxvfesi4vU6DnkeRl3ffuQuQY6PLTzA4e9vHsN3UqTC2fPuScYSQROydBh0IatyEMqHbTUoBeFCIVBW2OyavlwkvCScR2yJN0Fr5uh42exm/bD9HPnYeJzgEosEhGheo6jhlXK9lHLjZCCVD2biApqsklVhcCTHDHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBcjwGFrqLPfIj3zdoV//rFs1JrQ/fAuuuGGKkjNCnw=;
 b=j5Y4Q5pA6QhSxTAWiuHJroItE466CuMnPa/JF4KYoV3vhI5CvqtUY0MhE2tFI7UnUbd5lVf18c1mg1w7Rrwg/9917GHzCIU5vy6yAp+VOj4asiGYLKuPULQIOEdknVdjjOTkVFiEanL2lf2fsNGiIAZ6Rw75n6y+UQNtZv34QII=
Received: from BY5PR13CA0006.namprd13.prod.outlook.com (2603:10b6:a03:180::19)
 by DM4PR10MB7450.namprd10.prod.outlook.com (2603:10b6:8:18f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 21:10:39 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::51) by BY5PR13CA0006.outlook.office365.com
 (2603:10b6:a03:180::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via Frontend Transport; Thu,
 15 Jan 2026 21:10:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 21:10:38 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 15:10:28 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 15:10:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 15:10:28 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FLAS5M2041155;
	Thu, 15 Jan 2026 15:10:28 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vgUbs-0000000G3TD-2oOu;
	Thu, 15 Jan 2026 15:10:28 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v3] packagegroup-arago-console: Fix package names for alsa-utils-*
Date: Thu, 15 Jan 2026 15:10:28 -0600
Message-ID: <20260115211028.3826580-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|DM4PR10MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b2e250-da27-4530-c264-08de547a8849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|34020700016|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SMaunrLskix6UT4VNdc+cDEWlTS4V0jNDkNHK6RCGP/2yjYrOkkW5ZK+gTPN?=
 =?us-ascii?Q?7ZakMg9OFJ8orK1z3vVlFDYwABgTnt9UWJRE3OQj/r+F7uD5Q2FgBBdUjoPV?=
 =?us-ascii?Q?GK7NOfxZn9R+EkWt1v2xbuGQsemycpMtWBdMj8qU9ZNm2EA6rkKSjHYBjjlU?=
 =?us-ascii?Q?qU4gw7+DErQR8M/4GooIt40UDW2LYWWJE3CZ2hC6NOe2421Y4hnKz7mWmp4/?=
 =?us-ascii?Q?KYYAG0No19eq5kPT3APLcdCw6errQof0D9GQTrVE1b6iZWRtgNcIYr6d3Vug?=
 =?us-ascii?Q?Ohnf3L9czhAEBR9m6a2XQ59aswLYb+/1C38lGMoCLKJ+2/Jx1OyYFXHtJxaC?=
 =?us-ascii?Q?RqUy8qJojLTN2HmP9T6zlG+FHbTFEDoGFq4iSR3bQ++IkC69q6fmCMzpoMSv?=
 =?us-ascii?Q?6u55fMlF/B8F45cECPvgeFsNlT3QaRyhVKloZeQ1cYSToGeJiGdkhozfu7nZ?=
 =?us-ascii?Q?OEiOxmGM3uq+OZsOdReeRM8xcdKppQXNu3R3RX+c/WCtZrnaFEdIzUdBb0Ah?=
 =?us-ascii?Q?QReZ7XvjV+xCRy1BaZWCSpWwbXvO99hxsoRazchB08sRm/BeFkKxMOXWy/Tb?=
 =?us-ascii?Q?F68UjQmpILOKlpRIfHCr0nHQTj9KC/dJFUQn8GJnpYzM6RmYj9qmSIRRvH+z?=
 =?us-ascii?Q?/HSL+kGOf9Ay+V8ITLlXfQBZ5MUls3BdWJJCgLvVAu6G5qTAvlt8nlOQ8Eao?=
 =?us-ascii?Q?9LNoJ//m6sx6CRYgQzOyEtpbvXK68ga+fkgnwDPrpUmioHKahBsCaI1moRiS?=
 =?us-ascii?Q?2O31q9CN1EJHw99xkV0mQbcZjafxDQLw2358lx8RCX7xIMpnH4aDaLz2/7aN?=
 =?us-ascii?Q?tnfWA8BWxDO9wM7SGxj/rS5DqmZEw/XUkVBzSqbcr8pcLQpIUSq7r0F5INFp?=
 =?us-ascii?Q?sk8520JzyrIuhCEutgQSzNazFkRUqO7oSv0Ni9x77ksQ2sgB2mAXWeOYlEvc?=
 =?us-ascii?Q?yU8Xt6offD+e69Xf/S7V8anzoTqRXNvyjp8KxIwn3A98pUTIQxjRAzC2IxdX?=
 =?us-ascii?Q?0HZ1kZQO6sh9CJKwrqpcYAZYFN2+oFf+r68fjaIsA812QnD6qDdvWBR6KDyh?=
 =?us-ascii?Q?1vZyl7AAxerFP8KXOl7rko4JDtbyGZVf0pn4XyFilEKMqcaIfPENEcBqtjpy?=
 =?us-ascii?Q?qtGO3X1JcC9XAYt8xUkquUKRCPjT1P6rbKNkYVEh4DXQz/8bArLdH3gbBEPv?=
 =?us-ascii?Q?BLGJO6o6Y02bsCFNljsyJ1A/OH6snDQ0sYfLUekEICQpf4tVU1q9mSMJD6nh?=
 =?us-ascii?Q?QvzBOgWHGQ9Pka+DP11PUE1wQ2masJd5DesCY5S/dO4LUZJo8I+g8Klxihf9?=
 =?us-ascii?Q?1+oW+6My/+Sgj/Gqx7ZLqnvRTatszLsahbC67MeIPOAG2qZnmKmGfA5Y3H+D?=
 =?us-ascii?Q?YDYSgs7ZjBoz8gDarnCZqYyK3HdLqK0bZKQpita4ylNT8DXff341QhzLCk0Q?=
 =?us-ascii?Q?r6owNt3uz96bGamYBVW1kN69d+c8WLjluIkDHNdIhM0+81umvxaVKeLmMiD6?=
 =?us-ascii?Q?eXOuiz50LnAu/5SFTbuY8AsS3LLuwGaf09j4gtzDEgv3Khxu7HBso9n9KEqj?=
 =?us-ascii?Q?7NlMMcHzZs8f2s+A5UFpA1tAPHu9fkX0ceBBgqqVI51n9J9OmdCu6M4wNj79?=
 =?us-ascii?Q?mZuT0hbKWVMyUAETrn+6q9BhdjIHirc4FqXTPk3qXjCCoHAuctoHzVqOaUBt?=
 =?us-ascii?Q?YiOAkA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:10:38.1083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b2e250-da27-4530-c264-08de547a8849
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7450
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Jan 2026 21:10:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16958

A recent change in oe-core [1] reworked how the recipe chose to name the
subpackages.  The name of alsa-utils-midi changed to alsa-utils-amidi,
and alsa-util-scripts was removed in favor of separate packages for the
three scripts.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D26a28ee7935=
091250a8c52f223a7a954d9e29d34

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Fix commit subject.
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


