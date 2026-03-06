Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865EBF5141C
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:33:39 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70237.1772807609725596067
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 06:33:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=b8suxpyU;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.20, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWOLgvegr0UaqMFSrqsIsfmfq2GqLXCm0MtjM5j4WBfAkE3KsniS84ZcL3VwwdTcYxLigHXSL7TBOgKMP7gx2x7Rr3xWLMloAxjL950A5o5vqcJ7ZEm2xx49FJhWEHqYGiIN3irvkvaVa+5iwL7qdQf6+VURruJX/jHYEp1veFVZj1K8d5O889sic1dMPBeJr3LQfkYm3vnq9DcsVtMRDFnZObWcp8Yxj97lAafQ8qt0H4Dnd+wzrtjFHgXuT75sU2Ve9dWMGCdVqqyyoHFBb+GAMbncoxnEr9tL1Dmz5mHZT3qQDIt+uaRNDX/mY5PAh+sPDgkwmKfh1R8zn2MlOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZjtFbQVBmfheYikpp8j+9dNk6RG4cZQtmqrZg6zmSQ=;
 b=RZNik+kZAZABFzCT/IJWirlesOxy1CGGjBA9d0/WuJDFwOpzjuVyDgZNOY+A0wNdEkI2NYsNIqBShgiC2YeHYhEoPSrQsiYpNnmYisgEY9hduT7QstGSmI0TT+c+/V7dmKsHna7eQBEk2WjrcqtQgWdMNUTxrcs9WQ2YFHI9dvk2VIvyqqlrdSQTyHDaYVW8GhPYgloTsksKfl3IkCSto70AF5s9HraWEOK5ITLZapVpjrIpcRuKkZdqa2q80fcC49mqw3R9mrnI/RsZoKG9AtlCxjZAZrLIVX6T2x2eWwI7Y6THyEuGclbs5i7l2i3ETgQskHXIkBLEfBs9y4PKkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZjtFbQVBmfheYikpp8j+9dNk6RG4cZQtmqrZg6zmSQ=;
 b=b8suxpyUIA46P0lPuFy5w5i9YgVfwzOzhW4r7B5wP6Asa+T1AaxsGqbgs25CabC+bq/ZJax8b21HaaKEYYVV9h1vi1XT5AczUUMRIaHokbfHguAb7Db2cy85GW5tYuqdh4FzKgpqsk/SKnTvvlRvp/uhFZ4qxh40DcVjR3I3n0A=
Received: from SJ0PR05CA0097.namprd05.prod.outlook.com (2603:10b6:a03:334::12)
 by IA0PR10MB7273.namprd10.prod.outlook.com (2603:10b6:208:40b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Fri, 6 Mar
 2026 14:33:26 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::83) by SJ0PR05CA0097.outlook.office365.com
 (2603:10b6:a03:334::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 14:33:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 14:33:23 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 08:33:22 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 08:33:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 08:33:22 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626EXMh23963053;
	Fri, 6 Mar 2026 08:33:22 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vyWF0-00000002Mtr-12VI;
	Fri, 06 Mar 2026 08:33:22 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] check_yocto_rules: Add settings for new emptty recipe
Date: Fri, 6 Mar 2026 08:33:22 -0600
Message-ID: <20260306143322.564676-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|IA0PR10MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: fc1523a2-daae-4ae0-94c8-08de7b8d5253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	6zUBYKuf0SQH8rEVS/qqFRde4kS/SclUIfP+umncrODY5YLjw4MixiQ/pq47MSmk8dSf9/IXSgBKabzS2qVrFEzZPODmgxyl8AtXaxqihZltkOkyL5KNa7zWYLeeDM7rzNVhPJc8Gn167Rl1OibinqtSEREKBlW01K2RI8FmdAdaMWcDzExhOy3g4/H6SLA3hEVXSPXEFRYs/VKH/613cjPLI+p5M008XXsEJPHaOnbyCpfLPYQkWsAfTwFNaVSHFgXJ2cBAeGYNq7+jqfaejSQUZMsFtIFs+/bC1VvZPkpa+tZ9fvgOESqYTOlT6gag3c/rZ7oLmZOlWPXHBlvZ7Q8HFHXtCTzoakwNnwF2X2Rtrs24sCsuEHggnmXziY7c6MoyE5kHfYH8HxmwpF8a2D/GDJPNVIMY4c1znHyZHr/pM1YhKyXqbJU6/f4meJFpEwRITIfXxC12fE8uGfEe55IZOpnKArEcoR30cQs9EMB/EmX1P7d6f/dWTqozOf3RkIvucFlE5Joo9X5yCMeTce8w3HZmOO9s/ghTLY0mIWNt1qiyr07tBrWAy1ZO3fvrohmBTkJb8py8ysPfhX1CyPJJ19GeJvNKls1em7rUO9eVtmFN+qvNagzdDrdSa/IYXNyzp3d6gvht+rO/UIoYrEguiW1xeMXPzKNam9jVgBgfYIuAQ61FQeTSwfxhishhobNta+GtayQewr2aesqGywDGsCZ5xJLOzkTUmNOTiRfU8st/j8YGI/kjBFBK9gqASvqM9dbr/WAS8RqEATHtPA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5p7bRc49Eiagx7RWJjoA2iTjkb29xf0jygiZ4rqEuy+QXFQH/5T/RJIT4CzL3JBWhgs17aeWgQ1GZYpuoDV2ehQywKwPc6K1dJIv879vMW2nZE2OslcyXoj74ATi4E2FWUZQjJE6QrztCVW+/9AdsMkyCifJK/5eE5Ay/BV+ZLweFFBl0e+8yAvFw2ItGEYjlfxlpjzYrplj7s1AdAjGA5bz4rOOr/C4rNa+vVsPNax3Rkt4q6cAf6uNWRYdv0leoMF8GBlp0XMRnq85+ElwtLfCQHYuEKtpphdL0hf4jXTpmQlcTXyWg6KyXCX2yYHEpn8Vw7IX9RcYdlZZqlmAmtxEIHbZXKgTiAjTZ3e0EkRKcJdiWVe61WYfoB0R+7PS/U0Hhq0h9k7qRLNgofZjaQnT+HQ6OWI58dvJbz2sqGehzhyyQi2VHiwLK87e20Vn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:33:23.3642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1523a2-daae-4ae0-94c8-08de7b8d5253
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7273
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Mar 2026 14:33:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17275

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index a6a46f42..93a784b0 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -1,6 +1,6 @@
 {
     "APPEND-1" : {
-        "skip_vars" : [ "FILES", "RDEPENDS" ]
+        "skip_vars" : [ "FILES", "RDEPENDS", "RPROVIDES" ]
     },
     "APPEND-2" : {
         "skip_vars" : [ "PR", "PV" ],
@@ -8,6 +8,11 @@
             "meta-arago-distro/conf/distro/include/arago-prefs.inc" : {
                 "skip_vars": [ "PREFERRED_PROVIDER_virtual/kernel" ]
             }
+        },
+        "file_regex" : {
+            "meta-arago-distro\\/recipes-graphics\\/emptty\\/emptty_\\S+\\=
.bb" : {
+                "skip_vars" : [ "GO_TAGS" ]
+            }
         }
     },
     "GUARD-1" : {
@@ -33,6 +38,8 @@
             "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisd=
k-server.bb",
             "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisd=
k.bb",
             "meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb",
+            "meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb",
+            "meta-arago-distro/recipes-graphics/wayland/weston-init-arago.=
bb",
             "meta-arago-extras/recipes-core/oprofile-example/oprofile-exam=
ple_git.bb",
             "meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.=
bb",
             "meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb=
",
--=20
2.43.0


