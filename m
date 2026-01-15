Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D805CD46611
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 18:56:47 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2362.1768503407357116541
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 10:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BdbFvlgy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.25, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYdF1Y3bh24Rfo0znGR8AIZ49rDNfRK1hMUWfxaZsRGGbyu+SPU7nS31t/zmNL3oEwhS5J/+KQ8xk/zT0Kxr/7jiHVU0LLKzdQFFixSfXYERkYJJEGcbENeekHN4MPEOdUKiURE4S9NP7VnLrubwkbjMMy3xBVEd4EbiBUYiCP+SgkTpjVw7VUJgiR+0ANhg7e9nTvxYvwY9e5eMOOXsrf015iFjkFWl9vihh6C4GDQ9poIjPJwFMV8HUe9BIj+gkxulQiwQsQi53dCguTK9/740wvFAIfXv6xpMgyAGFvwI7NUL4Lq409dcStQOiEgNu43kmqbARw3JwWGgj8uXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIwckKX+Tkprv6Df10TMbCIPI4sEr4jL3l/0rlUVD4k=;
 b=OhXfaA/ixJbsVLtRSzN2++y8DiS+0Jr4qJZqb2vf5kstuFJTKDQVO47zXwXTjMfT06YZC0ILpFF0ErvnZZBRO/TwbW2abxJ9lEV7Lyqf9Bg4G9Zj/EmZGDTR2WhKgCkaGxv8RfCu4bNJ8/1zd1YmT+kgMGN4h4VZS0KUmlSSw+Ji9UnbzgZ+z/HJOi+0gtio8xANgS4uMEKAKP3bwXvUEZT/oDuQYDLKvM1Ans0PseIKZZx9yel5MmJhH/5vzAjR0y6rTUDa0DbwSb+Kvt9jThxgAJEz/Tubr2K4XryLp8PBk3eCITZkQgTMal4WZDttj4+NjxfALdrT9HVXPGWEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIwckKX+Tkprv6Df10TMbCIPI4sEr4jL3l/0rlUVD4k=;
 b=BdbFvlgyua6gv0q0+4uDLM1zkYgUbAGtWvZ543VN8g1i733vrloo+V7Ee70jGEAAiPaquVAnxIR2pToUKiZvPZi7SctGF/ERyfriWVzVIJxeIvDuxeM055/MaRM8PVfrZIDnxESbC8tjG3Zbi05r/YzpJ1B5x8ou1y6tMcUntos=
Received: from MN0PR05CA0004.namprd05.prod.outlook.com (2603:10b6:208:52c::10)
 by MW4PR10MB6345.namprd10.prod.outlook.com (2603:10b6:303:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 18:56:45 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::32) by MN0PR05CA0004.outlook.office365.com
 (2603:10b6:208:52c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Thu,
 15 Jan 2026 18:56:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 18:56:43 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 12:56:37 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 12:56:36 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 12:56:36 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FIuaWN2015672;
	Thu, 15 Jan 2026 12:56:36 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vgSWK-0000000F0gJ-2vF4;
	Thu, 15 Jan 2026 12:56:36 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] packagegroup-arago-console: Fix package name for alsa-utils-amidi
Date: Thu, 15 Jan 2026 12:56:36 -0600
Message-ID: <20260115185636.3577485-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|MW4PR10MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: bf621acf-8f08-40d4-fad3-08de5467d34e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|34020700016|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SU4JnWVnsYDEBWHiMoghxJk412tAi3e7VdhLUwGkza8gW6RY6cUx1memeRqT?=
 =?us-ascii?Q?6CIri+XuUm7cQ6TLx8jJtdUd8oDGKwKKik9bAiVkF/gTBVeE0fM2zReGULWH?=
 =?us-ascii?Q?Uk+L2395WTV0toYvWd3ZNUZJzvrMju/uyDgNmHIHLTzTK0K22ZCBCBsQMFsc?=
 =?us-ascii?Q?u0WyPTLEfHpr4Hs3m9S/M0rdUHamtKC8ymQa2bdW8makdeCeNGTnUD0opoE3?=
 =?us-ascii?Q?q/6MmJmOpYqP1TgOASqtIicx9ZxH98qDe/segdKaYjuo11WFExwlFYL6nhTv?=
 =?us-ascii?Q?SNJlfzq0moMCeFOZWeH8s2tWLI8+dUqwO851hNFlufRFC9jKFxC3Y1NEfcJc?=
 =?us-ascii?Q?9s/NY1VPh8j0z9WEWf1kJhA+1ze3cBsVneLIKBc7BdfvwDBGkcku/L9eMXXx?=
 =?us-ascii?Q?g6Tp36pCHK+U+h+GexO9EMe99s7XXeCCVz4j1jMR2LkQTfEmKjOYS0BmLwg3?=
 =?us-ascii?Q?3D1/XfY65VWEmpTAItj5Rr7g7XWI0rQ9uWvtKREYOQqt2RogVa+UO4v8eA5a?=
 =?us-ascii?Q?wM+QYkEknXAgnvzK2DbUvyYGFREJA8Ij12xldItzAcjd/vwnTtmfTfxgjecm?=
 =?us-ascii?Q?YGBGpK+uyYTC1nX7fBGQUioxTWLl0AXVbiDM13HAiKpTy3EcvopORAKzobhy?=
 =?us-ascii?Q?PWv1pOyeIb3WyD0SUeUkxP2Jcqrfes9y30HNQ8Ba8Sz9CKc54qtuTVyn7pH/?=
 =?us-ascii?Q?hLJqNn+JBdTrVLGAF8RZwK1LPriVUAoT2rbXG3wPc6LPXGYw42TPuGKPWGEy?=
 =?us-ascii?Q?i7UUm4Po6DApJsG6GwJSZElfPICAsWh8PqgIE0w4NGYEU9epu5nl5HkAewk8?=
 =?us-ascii?Q?pYpKKSeFCXwjUQHjqcBwG0eI+axd858J7br0zXDgE7bjGObNiqQL8j5+SHGs?=
 =?us-ascii?Q?mIPNNq02WBbownXhPwgsts7YFvHtDfFdc74A3fIzkfCkrG4S8zzf0VsAcR1+?=
 =?us-ascii?Q?i208gH8mHBi9b4qaSgFKNlIFl9SAned1SrSK7drDdcMs9anDheDjt7m1963y?=
 =?us-ascii?Q?vJ4MPf6Uhjv1z4uzVaHfEpwlFrZPHxzgJIZBaEsJSEryYLd3Y5+HM6IYQa5h?=
 =?us-ascii?Q?xaWBvJnLw0XJD+wp8mpefn8+OMImhRV4+grw9rZg8gddRUeY7D9uyYaL1SLb?=
 =?us-ascii?Q?oRKSnDMojtcFGN+kLjnzJY72w1tACqWd77TGXS8R3QpYsfpiZF1SiFOeNXqT?=
 =?us-ascii?Q?z5Xng6pJqm0qTGubX/5t6oMPjDqR27aS/wr5bJkPT3MZ8T1RV0llEezpa9ij?=
 =?us-ascii?Q?aGOupN3w69LJm9tzMx9KwwDNJfqTCrA0dJ0TfM6eOTW2vBcQ3X+QABl1ZRrC?=
 =?us-ascii?Q?Yxn8mqhd8cxRO+Vcj01CouiKHc2ydPS3cLBHkqJRJoC4RtgBGC5NL9rm+Cm8?=
 =?us-ascii?Q?ZrWsBlpetmhb9cjFb6MWnEDccqqpt2uL4Zy1b32Ajxk2qoa5Wqk2SxtDLWQt?=
 =?us-ascii?Q?szPKpw79Cs+i1Tn959fHvWT4ec3XvLVGgccGUFRYv83DUDJbaw3ZOFZ6qa6j?=
 =?us-ascii?Q?kWDcmhQBKy0nT1FCad66Bum8O61/Br6PR/4fc3oCrUo1W07QGHJ0EgFk3A/0?=
 =?us-ascii?Q?09YIHCD/WRnQeh92lYLHB6ZZUNLRyUi8+aTwM35l2cdtofWz1r8QTffuJuBo?=
 =?us-ascii?Q?c4kWZHvIqjkeBjRcwvnDzKJXJg5sRdLVkyP/YCeRHxVVhvDCgfiIbICuVlo+?=
 =?us-ascii?Q?MZG5CA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 18:56:43.5440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf621acf-8f08-40d4-fad3-08de5467d34e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6345
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Jan 2026 18:56:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16955

A recent change in oe-core [1] reworked how the recipe chose to name the
subpackages.  The name of alsa-utils-midi changed to alsa-utils-amidi.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D26a28ee7935=
091250a8c52f223a7a954d9e29d34

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-console.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-console.bb
index f6ec0a05..e2aa6823 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb
@@ -18,7 +18,7 @@ ARAGO_ALSA_EXTRA =3D "\
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


