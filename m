Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A67CCF9EE
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 02:10:23 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.25])
 by mx.groups.io with SMTP id smtpd.web11.18817.1761790219671041045
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 19:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=e+wTVxyy;
 spf=pass (domain: list.ti.com, ip: 40.107.208.25, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSTnZPv8ep5xWB9J0viVyUf9LgkjEPGepePOJIEvcIk73/AY/6VrIfQ6dVSv1pe1awOPvqvgEhDcl0oamcOAIerO0x3FjYFVk61c8XwdiKQWZ1v9IWLkpJKiMCTFosScqqyFH0dsFXjSFNMzvLyEQdrL7uDk+jMjTQDgBADpwzuuCsoF8EW8rhr0cJHsdArnHPcm/t8Xrpp5UBhkKKlHhuNJbRbDVnnnbT1o6LrMVoTlJf4/UIGiXGUVnsakAD3YWWlMeZ8sWKMQs/4M2yf/G3vYdjp0ePLtBsv2uisuVqQtLjVvZQ04aY/pU4a7sbEJ7/EWCNa77wnm7zi8cBoZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBru3nGKmUIxiIkIYxvONfKGotSuW+7uWL22yAbcf4U=;
 b=rQpJhojgEdcE4siQ6FkNiLJ7td2NDnilVN9d0PA9tC2rfSG54ypUawWJyMDLrI8gHL84pwzT0Gy4kh/2VRQxmRSy0gVpfBqK9NcUI6v4qRCV/ok8HLkSIAfCP7bEkPHxuEXhWfQBJIiiw+DNbtxtjNOOjkLxXspg0yHmSHN+zUuAza+138pzeM7Vk3SDHR9jCdF37QrNZ3tHvz6l48HROpJtD6k6/zyr9WuycD2mdhlPBjAuNQjhrAl6M5kf8/r51edBddZ7o7O9qYJwpYxYXnsiEakrAq2gFULV96YlsK9FMZycHpoSZIQxulW8OjUhrE12oPAybKLGSEufLQu8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBru3nGKmUIxiIkIYxvONfKGotSuW+7uWL22yAbcf4U=;
 b=e+wTVxyyfbSSE3HSo00jKCgCaAj97aSUT7SQd0jW5lMOgNY3eTCfnyKTksscJbWm8sUdh1tiIPOzoWYV2b/JwuN9eqd/7XwVuvJgSXLDR8YepZBJNRv5u59zJP1TFZs/+0UgHQO+vH8WhZ9/LF/Lo6a8AEMZJNbrIL7D0pjgpVFdaAAZR2gDedXmoGq4eki6hI6vgBWB1yIgwjGZ1USLoPhsojhpaPzZWcEt6+g3s6ot+Go2x30YcG0AY7rhbJUrbYoeWSsvX9cW6ePNklajRWAzdU7eA1qvjHzEoqFQGB1uLEn8FNFESaL9Zo//D6NBHY4g0H9jcBzWWrPcEOR6GQ==
Received: from BN0PR04CA0064.namprd04.prod.outlook.com (2603:10b6:408:ea::9)
 by CY8PR10MB6755.namprd10.prod.outlook.com (2603:10b6:930:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 00:31:28 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::f3) by BN0PR04CA0064.outlook.office365.com
 (2603:10b6:408:ea::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 00:31:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 00:31:27 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 19:31:21 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 19:31:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 19:31:21 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59U0VLvx944995;
	Wed, 29 Oct 2025 19:31:21 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 578252A6D; Wed, 29 Oct 2025 19:31:21 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510291355
Date: Wed, 29 Oct 2025 19:31:21 -0500
Message-ID: <20251030003121.2151431-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|CY8PR10MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: ce750329-92ab-4c64-fc16-08de174baa17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nsqRqTUou1PfAKh91ow8WuivVFVpwXiIpRn9zicwuVfwhaM9ciz4OdtOTE9d?=
 =?us-ascii?Q?sQAUQcdWE82RVKZlCtLVpNjDH5bWg05NxAvIhrQDkdEaBZBxNMq6PbJSSah9?=
 =?us-ascii?Q?dLSEdjYrgmD8j8jgQrjOAQSx1BxqNwlfJGyiDu3y/9+ZVyChF6FkbLhS+ala?=
 =?us-ascii?Q?e9gpklJJlMXmi7V2Un/M2fQEktg+LGUSUcFeAgEoT41Iw4EwG6x+Nch2qv1o?=
 =?us-ascii?Q?aSqjbPNfp0q//cx7sC7yi1v345JQ9Ug2+02hYuP80Qg95K499MjakbxSx0j0?=
 =?us-ascii?Q?9WA5+8KC+RXfzvVDAcSeku3+Ae86cmkPixvvjnVoZouOeissX7e5J/HzfAK1?=
 =?us-ascii?Q?EZE66dJ7MS6Py+Oth+T4E7yzvggaq1gY/iV8bID8nnHuj1TA4j+28TPtBfxv?=
 =?us-ascii?Q?HPWYMkCDPf1zjY6xQDV5jGz8VEIn8vQpqgYDwxYI8UPu6O21bQnzQ6AIgPpw?=
 =?us-ascii?Q?by7vMpBzjW87EmjqNOxpNhdJBdZ3UQM3jGh/6OAUc9B2p+htFj8KheOhovku?=
 =?us-ascii?Q?YwX93QOskMhpkoQAOCxcONWW18fNBvOQPFtR6ZxDZUjIqaDL5Nd/NcvmY+fq?=
 =?us-ascii?Q?1sG4ntUx6ShUqBeThVnCSp4CLo1aot66Z9ltrTbL4owRvAPExZAAYZINa+J2?=
 =?us-ascii?Q?CjbFJDmqsD4VrUt05bC1DamfztWPOhuD8tDqBmmNnoQVEKamLBxCTJ70GHG6?=
 =?us-ascii?Q?MRK+VMp2hHOw7xZTk/5uqInY+wMhl7xcIbcCQRykIaWyFhaBSBcbXpWrtIq1?=
 =?us-ascii?Q?wcSSJudDMJj/fQ/JuEDWKEKy+Vs3vaxBpox++CBoLBwnc2cbz0HGxo3cKtaX?=
 =?us-ascii?Q?7n2Kfw9I56yi85mjv7s/WXt020CVspq4CvL6cQhUym6zjOsr7PN7qo98V1/t?=
 =?us-ascii?Q?WSLoM/smABSleawUb1jgEH9dup/lGqMvGTf67ClNqQwt+HEaJFHbSITmQtqt?=
 =?us-ascii?Q?xRzByvzrzpcaer8VZCV3zVSRwLMcb93fCTZRlEM1ToI9UTtm1Aj1V7bJQiSa?=
 =?us-ascii?Q?mHhiHqnuO0cMJagW7uwj4gtXfAyJ9M2YGFdTjlecomiGZHILVTelQ/NPLXVg?=
 =?us-ascii?Q?I6Rxpth06TxMEYYf7hmrC9vlK8BcXrKF8A57fyrHf/k3ozbxX+zIOZRHoFes?=
 =?us-ascii?Q?gUj0odi6MG+zgD1PE+E21h40m/XZiY7s2hJ2vYKefadAwpMM2uNZ4cRV9Syf?=
 =?us-ascii?Q?Ab6GwkfYqkeUL746Pt5Km4wt6fQOtA0iLr3zi1Xs7zHH+q5nPttrkIJhTYE5?=
 =?us-ascii?Q?8+4DfGuGMIBaSsqCV5umSpw0ALIZfEyTPe/jGSh2c5bUIDvorYeBNDYUjRlw?=
 =?us-ascii?Q?3oiis2IxGa6THrF53qnePvsmWS/75A6/rXY3hwweJhJ9LU2GI6oKDaj1Uoky?=
 =?us-ascii?Q?NyPXm9nXDPaZ6XdhFSecBBK9tVA9DcY/ukx7Q9j5IC5u24rwT9GQgOh2Gcqv?=
 =?us-ascii?Q?MLMgiE0SlcZTblnH5XyEDScBQh/gmJ2ka0iV5v9NGA4UaGUVnk0Dd97uo5I/?=
 =?us-ascii?Q?ei9CIAxdrsA4gFyjYEkNNKnTJPK2HNTr203k/pJobQkrw/V7ps1LPokAcuo9?=
 =?us-ascii?Q?e8leRsDruGsOe0iX6UQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 00:31:27.5642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce750329-92ab-4c64-fc16-08de174baa17
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6755
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Oct 2025 02:10:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16714

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3D84666597750b5c68d903eb23cdd9b412c28e889b..d025cd6ccd407e7022bfeaa46eba7=
c3c9d29d933

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 309a1772..3da60cce 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "84666597750b5c68d903eb23cdd9b412c28e889b"
+SRCREV =3D "d025cd6ccd407e7022bfeaa46eba7c3c9d29d933"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


