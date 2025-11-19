Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923D6CF6481
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 21:53:01 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18869.1763589181111935127
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 13:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Arws3Z48;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.52.12, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jC7ZWlqsgKVdpq1WoGd5uCQ1KW3pRLn40S8MUyRxajU8uBWGql0Ct+vWRe2BMXHicapDdfAxs5eVR5oo0ngYf7FwYL7+C8mr3SKdpPrFzTXoksyvcpOuKOiGpp8ZuidmMMHn3AC4/jjrXvRETWX2gG6bJ0B3AHUyYaAR3SlHRQh5Wq/QMP83szKwNxldoT8uVsjqr7DyY3t8/M5UyWsf2slTyARCHvUgF8VzsGFQcxcicZ6w9gsD30O1Ww5BPSph0OYVBow+deh2wh0GqQf/ecD4utLTOoXQaU6DpOiIxkVYMLAe80YJ38002J60lZHIqBj8X0yY2L80zQSO5Kz1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/K+sOjgOhhwMkMuSGtA3SIFKDtLbDJSVpS83UlO/7+w=;
 b=h1M2w1mr8j7IaDuYOmtt7C9fGr4qERKvaFz162Qg8HzLMKfSB5/FtNC9d6Mk/UGl/ga4LNc086AiZ/QFh/xWC+3Zsa+HQTPeFggeSXuUXuykzMCSQigs8XPw7euAiaBL2cvXdO5kbxb9sfNfXXAWvHu73wo3KPZTwGzNhYOMWEcfZqwbmZjHBwf+pnjOgBe+uiDDhmXYSVQNRR3+t7UhNnf/ArgG6dnx4itLkeYTPXrXTnwn5AzLOOUjqfOhuCuvGIlW8spT+fUfBAmRiQkLmKHW1f7qwNn17d0nqnarRd9inr6lRmGdcTbEbyqtZZKjccrEclo8klocnmZv665J4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/K+sOjgOhhwMkMuSGtA3SIFKDtLbDJSVpS83UlO/7+w=;
 b=Arws3Z48LXuaqZH8T/WDukywp82VNKaXzvuljXjeEPpK9IWIuRwl9/S1WW2gpcAYm5mgbx9yuLbwHWEkotWUSQ9nWNYD4C7bHr2im79AqEnG0CaT+Yf8/ZXE7tmR/8bKZVP9AZNYI+E4Mcgt1SBMt8Tgfp6KDa1PZDUbjHVfbLY=
Received: from DS7PR05CA0003.namprd05.prod.outlook.com (2603:10b6:5:3b9::8) by
 LV0PR10MB997686.namprd10.prod.outlook.com (2603:10b6:408:340::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 19 Nov
 2025 21:52:58 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::f5) by DS7PR05CA0003.outlook.office365.com
 (2603:10b6:5:3b9::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 21:52:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 21:52:56 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:52:54 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:52:54 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 15:52:54 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJLqsrf2578018;
	Wed, 19 Nov 2025 15:52:54 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vLq6g-00000000mQu-2U22;
	Wed, 19 Nov 2025 15:52:54 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] nnshark: Set missing PV
Date: Wed, 19 Nov 2025 15:52:54 -0600
Message-ID: <20251119215254.186164-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|LV0PR10MB997686:EE_
X-MS-Office365-Filtering-Correlation-Id: 443d7682-8615-4764-1f4e-08de27b5ffda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?729MXz6Lr5qW5EpugbQF3pw7QKpLPC6N96LYXijvr6eubJJ/pFqF+q8ivkwI?=
 =?us-ascii?Q?8n2HGGMHvk5dRBLW1r8x18iU1yRDvrnrlO/H+Y41mxTFH9/BVVMgLkkB/jOu?=
 =?us-ascii?Q?yUtvjUTYTWHnRsmE0wiGH1TVXhDbGkKMswFTqGBANqLiJCrIasdmu2t/aDFB?=
 =?us-ascii?Q?QJ7uM7RVk8w8ezXabJhsBzuWFs40SEbSq3imH5D6K/BIXB0EV6R0YLaDQ414?=
 =?us-ascii?Q?7LQ0itAoY60RPsa81r9sxqV8fVpUlJMZ2aH40HPdPcAQFl5FD9fouG7BZZ9D?=
 =?us-ascii?Q?chg0lE03U+sRSTsGTN7Rud5ZYeTQVjoBq7L7vkktJazD3ob8LH5NMcyrHzId?=
 =?us-ascii?Q?BVM+T+ToZmtIwKTxYrsr6fMVlS+Z7sTxIRyPKJdu59DKl2rMBfDyIY7QHm6o?=
 =?us-ascii?Q?GdJPB1EmQE+qd9Zs0WRYnKfEj935tKwooH4KgtKouP91BJCI7bwF0W0NUeZ7?=
 =?us-ascii?Q?HEF1ViVT7Y0CEmH+mqn2Gu2O4ArucceE4LdlNbSJ5WbQYiO3Hqr4AziRB4a8?=
 =?us-ascii?Q?WEirkXz9v+mathTxPYGuvQAeCQ6S+fyXCt/haM5XBClCAMPx7WYwfL0n9bCQ?=
 =?us-ascii?Q?LLtzWTXpwEVRIqaIaeVnTESpCyB1DfBmKYLbMBkV6zjDulERXS1HYkzRt6OJ?=
 =?us-ascii?Q?xNDQnO9K4MEuw2koeiNoQfA7BGwRKJigfow0riztdA47U+tItC6oSjyLoHVJ?=
 =?us-ascii?Q?QZWAqycDpVVh7kEBc+XkiQpwrRqOERWZklr3kbpwBdj3oERT2zIzYkw84OKv?=
 =?us-ascii?Q?IsMba4Qvb8yp+wn+kp4a2MnvW6dOR4NnoO6al4AecVFVUtz89MAt6O1rbzM1?=
 =?us-ascii?Q?kEERcBVsp/05PGHpIKYwooT24KvGI3knAvFA3DMQ1zH+xFAc6KyJKGL/lERD?=
 =?us-ascii?Q?EyyPc/90XsMdnVvho2ixq7hUKWdXRDN2cm6gncA3J4jtYsnDUCxeammIoIE1?=
 =?us-ascii?Q?8EiOo0KrWF9oI+CH/LdgSCes2LjTwq+PDJYxvV4XWnU5PgAe+XCCk/lJTgxc?=
 =?us-ascii?Q?uJQd2SiFvIhuPvTK70gcd9h08z1eQsrg0HEcxbUZMWKD3LxuIJFjT/bLDugJ?=
 =?us-ascii?Q?0M1wZwvf64zgU7HJ+0BZgf4B81Nm5QyjSiHyS/PLpGUXkdLkcgrhusfXjjF6?=
 =?us-ascii?Q?iyWiv7x0lvluCZTo+Dl/yKsqhCkj9n1IWJ0mShdzWLKwcw4vPBLOX1SUAOj/?=
 =?us-ascii?Q?BsMg4FIHwToNbESBeRwbFBGWRZpH0Q9QzaxN39D+c9kcQysxZODpQPynsnSf?=
 =?us-ascii?Q?Nff9upqQBjcE6MGDWWJ3HM2kFUczS/PWEvrWEExvVZvmqa5ZQFWKr+/8cEtQ?=
 =?us-ascii?Q?Y1HPpTbsMOlWqxAtOpWFHW4MkSixxiGonMLMUWm2kWyidjUWnkmqFq0SXLw1?=
 =?us-ascii?Q?yhJ4vEtPZyzC7bOqXJ1TbCoHH+cD3rOps50MQYQaUsUbdFMxqnblRhRZs4+d?=
 =?us-ascii?Q?eOlC5yXpwm8RdbmgMODwTXMYyS5YnkjR76YTceIiWbs/zctxN2QprSBebunn?=
 =?us-ascii?Q?Vr0ThiYTRVt6i+2QsQWh7/6WMYcNr0HL/HEZk1cnLY+lRgHwcht+a4wrU2Vw?=
 =?us-ascii?Q?pgbvVcGcdh8wpKYhcZA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:52:56.7619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 443d7682-8615-4764-1f4e-08de27b5ffda
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997686
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 21:53:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16811

Based on the git repo, the latest tag was v0.6.1 and then some
additional commits in git.  So tag the current PV to 0.6.1+git.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb b/=
meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
index c3af5244..8afe7def 100644
--- a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
+++ b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
@@ -5,6 +5,8 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De1caa368743492879002ad032445fa9=
7 \
                     file://COPYING.LESSER;md5=3D66c40c88533cd228b5b8593670=
9801c8"
=20
+PV =3D "0.6.1+git"
+
 SRC_URI =3D "git://github.com/nnstreamer/nnshark.git;protocol=3Dhttps;bran=
ch=3Dmaster;name=3Dnnshark \
            git://github.com/GStreamer/common.git;protocol=3Dhttps;branch=
=3Dmaster;name=3Dcommon;subdir=3D${S}/common \
 "
--=20
2.43.0


