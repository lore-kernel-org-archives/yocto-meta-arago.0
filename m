Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AABE7FDC6
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 19:48:21 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62323.1770061696098287328
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 11:48:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=csm2BuUP;
 spf=pass (domain: list.ti.com, ip: 52.101.61.17, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXBm/qFTUGfuSS+6KbfIHAjhHb9JKEhv34faNvrxgieTIFMMkz4okWWmVc2uKK7ShLhcO1amBOeqs7W7UM7u4ZAresaoYYOU4jASBljK36fetvs/GkbD1vqTXgnqmgoNBf0A6G+r0R/w8j1PF6kOrpkMuUopVbR9BB1DY9AgDR7dk4MApXOnpNZZ2lFG59VvvaaT0yZTNYIYak4lVszYwqD2eA0t6MZCeP64JZL+C9p8zaETr1cyRbscBo6sxCVDgMpihMGiAGhD+TaLcGDsOx0oHyRm0+RcHvkA9pacnOk2ziTyTNJNrKnCA5m/VIujHv7/K7aAtXehWFVC7+Z0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4+i1YTgXZTMWv+UYIUjXgkgxaIcNFZB7XDkQEJW9bQ=;
 b=LBtHFQpXAFAHGJvix/mwdSTVqdAtJevrgGXNugMKSkXV8vo7BzroXC3ZoeCCnZSGbo0NWRvPC9oZAraPWVXwgVi5/VhpEMH+JBSfYKUgRagNTh65Q9gHW2acd806KJg398rlaU6pcO7cZ5LwIo1sQRCb1RGWgkC0OF9lscxZHqaYeGm5e9FZawvOHwzRYbh2PDnyYpdQEnLm/h2fTFCV850JswFO4CBAoXudbH7OCcKOdXUrlnkznmVUr5raowY7DwVQIWL06ZcDG4nlnwUes2MKVEAjuOW4+6rm/3CGab5ChSrNbnZeOm79TWHeLnLrurzp4WZAv1tBn1CF3cO3oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4+i1YTgXZTMWv+UYIUjXgkgxaIcNFZB7XDkQEJW9bQ=;
 b=csm2BuUPF2oUwAT58BisTIG1XT2YFmffLN/gnVPYpenq1TDa8HsUXCfq08Y0+qozVCLxfeAm1rg1KigoomsZfYZn3LfmHNGxEKZQDBhLNMAsHS+Yaq77+MaAXBw1chixjgno5e6Drnm/hQ4K4Vvcc13lUCwpN8OBGqJqMy403xVdeo1Xstq5/DKy6A1x6fdv165LXE3qkmpEPDY29cq1CtAWGiSvb2i+gnu9Y7FAnD7PKQCb0RXPbLenriu0iSNEFg3SwgLnmckv+Y6/egmdx5wGi7fHCHWeFQMazTz/XJDxQhx1E4hNRiPykmozOqwgDWmY/SgRXRWMYr/fwbieWg==
Received: from BL1PR13CA0217.namprd13.prod.outlook.com (2603:10b6:208:2bf::12)
 by CO1PR10MB4612.namprd10.prod.outlook.com (2603:10b6:303:9b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:48:13 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2bf:cafe::66) by BL1PR13CA0217.outlook.office365.com
 (2603:10b6:208:2bf::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Mon,
 2 Feb 2026 19:47:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 19:48:12 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 13:48:11 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 13:48:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 13:48:11 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 612JmBKp2288463;
	Mon, 2 Feb 2026 13:48:11 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 8B18C136624; Mon,  2 Feb 2026 13:48:11 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602021018
Date: Mon, 2 Feb 2026 13:48:11 -0600
Message-ID: <20260202194811.1717449-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|CO1PR10MB4612:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3315cf-6e92-413e-0cc9-08de6293ffbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sgMe5KKadO2bi7gF81utSLRGeKd0OV9MxYVMb4h7aQgjDoNOD1amiR62+71G?=
 =?us-ascii?Q?VsumudehF8E4PnbIL5dR3jGZ9EgudIabHscL79jZgsnYLzeF9d0zROomeDDb?=
 =?us-ascii?Q?32n1LHKjDBbE36+DFJWEhvVr4yWBR+4Q9FyHhz/+qG0O5R8yKbxQ5ixYxmWv?=
 =?us-ascii?Q?BYl6HK6OAtiP+apI+ug1yloap7qtepi36R43IBqWnXPjf22qEE3dlPeuXYaq?=
 =?us-ascii?Q?nP4HQ6SrCI5YQ6dZXTGqZMHBTjQv8QD8r1Sy2Yyw6OLOhgUL1QvrYYJuwANn?=
 =?us-ascii?Q?VX78Q0DpXgh01XNPfB16nxTdUg2/Cpis9SWOtbFPgkXjxPcKBlq0og5Vu3IJ?=
 =?us-ascii?Q?tt8ZbdWlZybPXoKymFwseujDubPiitkkNEWKNrroMdjGiiXS6n5Dm9dzZA9q?=
 =?us-ascii?Q?CONZhIlqH6JzsF2mnFofMOfsIg8KmREVWMRrBfLw/0+2TezfXXIrebpk7w/m?=
 =?us-ascii?Q?vYIUZZLerLc+LcrjdSJPlcTDlr9yvYH+0Gxf/d7+NR0D7FwKwtb4jpxJWMMW?=
 =?us-ascii?Q?5d8gw5dd8jzrCo6IVgZqdtwnxac0nWDGp9rToZZ3mj7Ypa7heqUoo6Am1zYJ?=
 =?us-ascii?Q?xi1duC+aI77SbNDrrluGyqlt6jWG5FKdSTfLRNZJN2QJZflYrHIHzVXCf+mM?=
 =?us-ascii?Q?ue9sNVlCC7EQD6EbE89OU7TRn+jYwHdb/OJy4UX2IcIMmGhtQWCI1T3FrSDL?=
 =?us-ascii?Q?Xw06TZ7ZYBUQYhK5mWIglPhmVUjBpYxYH/SXyfYi49m8/sqL38QK7DYrzK4A?=
 =?us-ascii?Q?Lq3wtfq8xDVFPkA6qHAQDGiy4ACYzXVXLnDOOHUKBSwWamYTot7Oq/B7+B5I?=
 =?us-ascii?Q?gF2kyPDdkamZLIImoPGDRXrmSpnYW8HvqVPCFEI6wVXfGUznmgcUdBGEiR1i?=
 =?us-ascii?Q?Zv6Js4YM/rAEYEtbhk/CPntjgykZXrvwI1s6nZZqZhEXVuvWpZEnbKkBuBKY?=
 =?us-ascii?Q?6kwDNkxZI1XURFb7jXpXELgBl/7MaWz6reetWuy/VroitCTCAtFf3CQT/5Qr?=
 =?us-ascii?Q?n7aRaULcMAwAatMwnjVjIGkmRQT1GxgL1/hK4T88EazrZNt2dDNz0gRKWfpG?=
 =?us-ascii?Q?Fr++MFEkTn6s/S0IH/2LuDYvKQwe1XdlmofPeuqltoddQD/OVainCuI15d9c?=
 =?us-ascii?Q?nRRm9HcKWnP67RvhEM1moJUzsBfqMpi6twQT42hDTbuVJY6SZpeYzS1QRYOg?=
 =?us-ascii?Q?+bFRuoMA9iiOSTv79W+T1iyeCE33mAjtFPm5v047hB8SuyunQR2kisX2elOL?=
 =?us-ascii?Q?cg+CgB/tcdPrkm5iUuSwGwHQJvh1KeuVHowyY/ZI9t7QQOohAcpIHz95kQot?=
 =?us-ascii?Q?ayg3MQkibAcicUFO0J3c216b3+Fzpt2qh798rt029ViqsYxI2SZYuuyJXIdI?=
 =?us-ascii?Q?cZW280JX8lohExbKoTQyf1er1/tGbsntqbfWyp3HtNlD3+ArwNmPJiMuYuXp?=
 =?us-ascii?Q?9HfB7llBz0gUBC+5TcDF2NZEqMmon1lw6gGmLclyuCDc02ynbxNP6uY69J9C?=
 =?us-ascii?Q?dzOyhX0I+5gpQMlA00GraQNXNobCk2yddtnU/V5ES3Opxx6MBPsNYazAsO/2?=
 =?us-ascii?Q?JPCgiigTmZ8+URFd1tXsU8CephpSF0/7CwHrlZVbOci1tfAK5ypyikEoZSo0?=
 =?us-ascii?Q?fJlPDjvd5Sl3w483I7CNAxPaffQpOJMd4qIvmp8+rOKJHmL4dRnsHImq0C5a?=
 =?us-ascii?Q?VkwMHg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	e0Jmpc3MJ/3ln9Rp+LgVYiZWcGONXO8PrbT4NubJThPGdMnPlTk1fmBbh9KQ+JUoBodYFSxnStl1GKoNovdrVO2veIUvDvqepE1ibwcXLNSe6a+wCkRtlmHqiqR/56V49g1bgc+hM26Iib6WmijisFisLvEZOfpUvIt+e9jmJP2TH4dmdnt134VRSv4tglgqs+/yRD+dLRGN+rPaxjJ8ncGpYCUSDTqSvHpDgqdhvqsbUSasxEkc0x6GSLRLcYddkG2YNjTBv3LLnn3xMru8NWC7+QcSR2VMc7LIAeXi0Wg5GmbjhDI2po4gAbg0C5c9LhXQr5LBnJyfGnjKkp3KMbwqMODyFoE/Xu2XRGXbzzpWtF/RUawDlrkPOZaR8MYHmwa9YjgkgZeUp3asZ8ofNVfmRidBk+/pc/g3d3GGZq7/1QiwMPBYAROZ5/jIKuj6
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:48:12.2208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3315cf-6e92-413e-0cc9-08de6293ffbd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4612
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Feb 2026 19:48:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17065

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3Dbe5e3b1ceaf18498c4586e9806ff2783ab336072..009ab8e98152dcc4ee070e066882e=
da6b42f720c

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
index a1ae0274..9b2be3e5 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
@@ -11,7 +11,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "be5e3b1ceaf18498c4586e9806ff2783ab336072"
+SRCREV =3D "009ab8e98152dcc4ee070e066882eda6b42f720c"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


