Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2FAD778B7
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 21:37:50 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6658.1769204261547341752
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 13:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hpLNK+ks;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.18, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMzhMA5t63vw6RW8nfeJ1JLIA+2bC2+n6e6oyKzXQCRqSuKNTVekkqZjfg0Ytsn2GSxS+Nvn+w9dLnzFYKQMVotho02BqjXgw3wZP/+TqXZLNyn5L1o3CxvGFMMUrCTJO3/N/+6pe1/p2wQlVdkkgsvlaF5SK6iRQKu6AAwk8pkt0rawE8kUij95GfJFs2e+85sA0LYo1heqiFEUGGHN17FYNwuInm0TPQIZNjUHbFWHs6f7VvtCupyMxO2rXqUTPqWMLBC0xayW5uF3luLW8KxSwDg3bF2ON9SQEtcJs8P1txmlgNl0jxgi0fLeupFsnAjQhvJlY8rkL2XzLgQvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eA9sG089U5gHSg+W4T1I3dh4Y8m+JvoyNy2+8077VGo=;
 b=jZ6PEpSesY8+ihheQVmo6/kyaG2diPKD8QjcNrxy9bsOGnCuJPayCRfFfoqRYpefuTQ72dH1DT2GYgfXoxCgT1fu3Q+N1W/6WwhYILhffbWv9gO0FX5+XXgjCNNCuuL7/5on3Q0noagFAm2sLtiRzwPKSUJIlnJybIPdPr+PW07oQm5IyFkCmSmRJsUX5Kny8hDVcT7ENx/Hnd+SBh3hcQLtmoX5fjGEE9MO63uT+c1bL9Z2X/Zco9HCz25vbfK/XzUiptba3DxuIiPOGGLZJZrcuWqe5dmGVXD6pImSz2CIzpi4LgIYX6LxhiUWIOu8vniHhh94GCaqU+E8qy0nOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eA9sG089U5gHSg+W4T1I3dh4Y8m+JvoyNy2+8077VGo=;
 b=hpLNK+ksMnE3pnmb3DUoyNY+cP85Ah0KZJ6V91+5JWU0zQP1oq0ibYGAfu8lrdwya99om7VRyczQU1pPD69vVZVz44ZH/eLrB48tDatJroGvcwLFsiqUF1Lv0CP+ClYm9ciOqZ2oFPQRRrEDm0BpkB1VUi3v+XgC3KYa85rWuUM=
Received: from BL1PR13CA0218.namprd13.prod.outlook.com (2603:10b6:208:2bf::13)
 by BN0PR10MB4919.namprd10.prod.outlook.com (2603:10b6:408:129::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 21:37:38 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:2bf:cafe::ee) by BL1PR13CA0218.outlook.office365.com
 (2603:10b6:208:2bf::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.4 via Frontend Transport; Fri,
 23 Jan 2026 21:37:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 21:37:35 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 15:37:34 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 15:37:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 15:37:34 -0600
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NLbX6V2974534;
	Fri, 23 Jan 2026 15:37:33 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 1/3] pm-qa: Move recipe to meta-arago-test
Date: Fri, 23 Jan 2026 15:37:29 -0600
Message-ID: <20260123213731.827613-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|BN0PR10MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: 66697262-5fbe-4dbd-0c2f-08de5ac79fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lJ444VYe5VV1Fpbv4NhiXpGD8c7T/pMx1C0UtCsz+OE4kJCAhkvczriexsGz?=
 =?us-ascii?Q?J84HTCg6Htd9hi9h7Nts596z/ll4FfoE4oVsw2Cmp5al/+lezQi/zTRK6Vlh?=
 =?us-ascii?Q?vy7i/+pBjQyLm1SSNRNrR5XGcIWCOj2LIDOWtbucvkyss+wkwHUN+KWizDnT?=
 =?us-ascii?Q?ndmni7XfbOaLx4y7T/yoL/TQrxBWSmQ7MhvL3Vow/praDcL7OKFemW5ZRAa0?=
 =?us-ascii?Q?/QtXYHOQQda+vmEtrFD5yO4+Da61O6DlUnToPOJODhQhlBgc6SjWINryEa0Z?=
 =?us-ascii?Q?6QY7yb520aWo4cNHJbDWJWH7OFO20FW21UnaoTAIw2ndTgm+TuxPfKjVuDW8?=
 =?us-ascii?Q?uogaOZ6y3uPpRDlBrLVZl+7rS+aClYNZg+50e2kWxjnI/rnRQhTTL0DuFqch?=
 =?us-ascii?Q?zLrnwLGvStkL5U8iVm8LVhhauxZjAw+WXqc3slN8HISsTNmVIbGMlEpKLIwh?=
 =?us-ascii?Q?wgtNxDe9pCONA7HCEap5XX9nGDGEus1BQ76LjmzxxQwo7on8y/PCjW6u1b4C?=
 =?us-ascii?Q?zFBDXX8W9xyynwKlyFyMJ7Y8/khKpS0k3CocQBuz4vqMzO918UcxBbWTFvTC?=
 =?us-ascii?Q?Kuvon49QYcv2FaMFlsTVXnY/AQC/5mpCdzUdYNm68N6IE1ebwPLzkwfcs6wk?=
 =?us-ascii?Q?0qhYlq9MvfrzLWri8Ozq7vQEHjAIACEXCLa9a6UKt88L0ufS+sexQczGyMAT?=
 =?us-ascii?Q?DZd02tTyNnhLHhUEbT1czrdswnh+cPg4c1nBeZJAqw6NEQ4+9b5ELUOwSyWy?=
 =?us-ascii?Q?3+T9OtUGoShMXzfT9QMUw+uGBxXf8uANFRax2yI/sCjeQCXyLaTrvn6aArs0?=
 =?us-ascii?Q?2a/6gpImusou3NYt0nzSHj1qYkoc+dk91YRTXa8/TbSdWwOGUBSjvSFSETfq?=
 =?us-ascii?Q?pluMVsP7H/07nM0qPMk2wblBL/aNCJlI/i8P1Xv6NrW+mM5Qudh68G7Kx6G+?=
 =?us-ascii?Q?LQ2dMHshs78Qahg9OGhzn79ctAbeWam00S8jhv7m65RO0T88MzFG2BzRMuGD?=
 =?us-ascii?Q?URvBNgCmEzAQhi/XLD3UjfVoNQuWEypT6P+w/7PN2BxRBi+0CqjaTnnXcTCP?=
 =?us-ascii?Q?+gIEnoNxa+eRvTVLhF45L6YZLDth2pU2CzDYbxNJAaS3eI7pI4227e9DbJuZ?=
 =?us-ascii?Q?gg5Ew0Li4cskav/j9tICOQ8dMojbp7knhKy7mj7osvuJMDBfH+of+AWmphdi?=
 =?us-ascii?Q?KtztrM0FQeia2oJEbW9QMpl/mekdD/L4bDIZHR9Gx22hR1JWnMuB7yM5T6AH?=
 =?us-ascii?Q?6HhB8Ial0/W+UopfKafSWAOmLyTK9GQCQj3di/4OSphUDXcoz7/pDmKUIM5q?=
 =?us-ascii?Q?ybuUV7RgI+NyIhkKfPX9uLVZsxy5pFgwFdt7F7OkSmVio0W+ulgM373tJ4AE?=
 =?us-ascii?Q?9V8wZq3DD30+YkPc13vvA1s/u1zEbuvOwrLEZ2wasNcXfV1nf4p4NOT+M/S5?=
 =?us-ascii?Q?78OmCYpKOCizgJ6dxnrrmHAo+L+NkR4U1Smea+Jf7qj/31FJyiaY5BLn7EZt?=
 =?us-ascii?Q?JGBZOkGyaAOOGrp1zZrX8yZ6B/JLQ/5/V85/kh+pKDkYAS4VS2ju/0+fDjRn?=
 =?us-ascii?Q?pvwYkr9/9d7ounePpO6mJwO5qnKU9QN15QMy4+2Fex2uxtm3Y88dxUhGNmJj?=
 =?us-ascii?Q?t4lJK7IZOgKt7euvp++UkC2WCWwMFto9ph6TIMIOQ8q6fr40dAv72vsY40of?=
 =?us-ascii?Q?03sLDw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 21:37:35.9895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66697262-5fbe-4dbd-0c2f-08de5ac79fe9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4919
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 21:37:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17036

This is only used for testing. Move to meta-arago-test.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-devtools/pm-qa/pm-qa-arago.inc                        | 0
 .../pm-qa/pm-qa/0001-Return-non-zero-value-on-test-failure.patch  | 0
 .../pm-qa/pm-qa/0002-cpuidle-Avoid-relative-paths.patch           | 0
 .../recipes-devtools/pm-qa/pm-qa_%.bbappend                       | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-devtools/pm-qa/pm-=
qa-arago.inc (100%)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-devtools/pm-qa/pm-=
qa/0001-Return-non-zero-value-on-test-failure.patch (100%)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-devtools/pm-qa/pm-=
qa/0002-cpuidle-Avoid-relative-paths.patch (100%)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-devtools/pm-qa/pm-=
qa_%.bbappend (100%)

diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa-arago.inc b/met=
a-arago-test/recipes-devtools/pm-qa/pm-qa-arago.inc
similarity index 100%
rename from meta-arago-distro/recipes-devtools/pm-qa/pm-qa-arago.inc
rename to meta-arago-test/recipes-devtools/pm-qa/pm-qa-arago.inc
diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non=
-zero-value-on-test-failure.patch b/meta-arago-test/recipes-devtools/pm-qa/=
pm-qa/0001-Return-non-zero-value-on-test-failure.patch
similarity index 100%
rename from meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-=
zero-value-on-test-failure.patch
rename to meta-arago-test/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero=
-value-on-test-failure.patch
diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Av=
oid-relative-paths.patch b/meta-arago-test/recipes-devtools/pm-qa/pm-qa/000=
2-cpuidle-Avoid-relative-paths.patch
similarity index 100%
rename from meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avo=
id-relative-paths.patch
rename to meta-arago-test/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-r=
elative-paths.patch
diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend b/me=
ta-arago-test/recipes-devtools/pm-qa/pm-qa_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
rename to meta-arago-test/recipes-devtools/pm-qa/pm-qa_%.bbappend
--=20
2.39.2


