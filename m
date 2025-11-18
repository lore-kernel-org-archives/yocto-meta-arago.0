Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4125ACED24D
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:13:39 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8489.1763457214791516161
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 01:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ICvcGRhh;
 spf=pass (domain: list.ti.com, ip: 52.101.43.36, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8lb2xhlU6o4HNVW+5W38nOwHbSW7uQtA8Iu0s0V3NlZJykbvsjQipFpHxlyooFeez/lanUD0PTUHIUawxHA3XmzjVaK1YKNqcvNTrLcjRzzXFHC2Gg3UeVXZYZ64x158cgUAArZY0JCfjpYycPjrFuuMs1cMcXfLu5/huSL5XrQ4gw6G2XcE8DUgavfjVRP4mKhnN0lwVe6s7PNXhaciWYEEGn2Jb56xmIJbKV4BlRmdhR9hQTKrQBhOqGULbQPDuqTqkPabAHLAGXqgCPo2J/m7ZwQj5MkyoVnglRemI2ourS4w8liZ/8ZLonPbnKYcPtuAp2mKgPRLOb6HjoN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIg+lna6BnsRddZJj3y1FJBc1PDlCI8bD+9l0qd1ddU=;
 b=w3/QNz4vrZXlAfBfcwMVi+VxQG76t/vKrm1whjeYnde7KT//DnzhhmZqHtZrlvEdXDC+N7q4BDmYU56ejyad8pnCrAGjKNdjiAQlCCzOIKZTq2Z6cwy+BDit2xkBVILlfD6Z5VsA70YKyCVhvPAltkIUo9qFccQAG0hzSr3+7y3jZn6DcFngYa406+PeesldOh9/bgXNXzm7NMNqD/fGAd+EnWMM+/gocbW+5dZyDPXmRSjGjaRVWefHQiGGlqzbU5Z6pfl3RMwu0McI0MqFIUVr5+96mQg7V7cQ0xayPFxEy7VV3sZDG2+8HYHAphTBhHf1LjjlQ7VXy4ufRe/AnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIg+lna6BnsRddZJj3y1FJBc1PDlCI8bD+9l0qd1ddU=;
 b=ICvcGRhhO4LW3YzaVJSsf3YrJBCuzLP3FoI/AutPVoupQnSH8uW4zEH2ggTzL8HEO+si7LKiE9RM99N/SFiyA8JjFI/5X/NXI+ojpXmoBDxj3kvI5UU5EZT96DpHrnalH+AAid8IyUQMVmec/6fs46pz5aPcyvWO8IHBLIj7W2mMRg2QKtIGaRXFOYEvuEurhXtXjY1Uvp/5EmOoHiyFo2D+XckYhGtMg/5wUch0dUDVZpzTM0hU1yWTsetOcTREjMoQgx2T06AoL+/CbByAjIEbeQZwro4uQCsFlBKnHo5+5js1ACeQymXkWtQUcUEJV81xWzN8L9G5Z+h0aFVQ0g==
Received: from CYXPR03CA0004.namprd03.prod.outlook.com (2603:10b6:930:d0::29)
 by SJ5PPFC802EB2B9.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7cb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 09:13:32 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:930:d0:cafe::94) by CYXPR03CA0004.outlook.office365.com
 (2603:10b6:930:d0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 09:13:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 09:13:30 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 03:13:28 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 03:13:28 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 03:13:28 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AI9DSIQ443420;
	Tue, 18 Nov 2025 03:13:28 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 8D51B2A67; Tue, 18 Nov 2025 03:13:28 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202511180100
Date: Tue, 18 Nov 2025 03:13:28 -0600
Message-ID: <20251118091328.3260958-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|SJ5PPFC802EB2B9:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d40952-0f69-4de9-7a69-08de2682be13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xlCDZt35SImSNYJJxohod5bWHgU1QD/n5POwKwgjWIjxWMkh4Ri596iTb/1E?=
 =?us-ascii?Q?4FXtAoZNHTvzv+Xvi6t8tkWN3ASGUHWiT17kc/I8pa4ca2nhsl9EYiyTLnXV?=
 =?us-ascii?Q?VPa/maFH/01nIjOg/8IDUVU83KE5aftJUnSGxLegDGxGffxc6j3/iOpOWXqo?=
 =?us-ascii?Q?TC0XCWmukwHPlk/Q3DW3fFe+i4ySmOBUG0BpfL3BYgQf5lKCg69htz+gkpak?=
 =?us-ascii?Q?hCyjM9eX28Nkyu9frhIoNr7a9xJ1GQYoTIfp6XCDiaLUL8y3u/v6PfXyjVlB?=
 =?us-ascii?Q?pkbGHZ71NjW34oH+QSMDJ1m+ih+ii8FZzW767Au7PQH7pzGWCCtAgVP8mQSa?=
 =?us-ascii?Q?brEg/3fjR/IQyvvmYeXBxcA145mEYc9wrzNAmOXg/Qf/L8RnLIIifzj36SiU?=
 =?us-ascii?Q?lbQXHR4WKtfz5SR0VGmfQQdn2Mxj3zxH9WvBsV9YDYIeQiwtE5/8So4u18m+?=
 =?us-ascii?Q?f8oFmAfmWCXHSS0WIiyzViaZSqmBp693rxIZWQaEOOlZMiyb9gTbM24CfeuF?=
 =?us-ascii?Q?D8liAvZZsPq+/NMKCij0HDT3pu0wQm4AsHERCdCZ1NR53SDscQrjn6BB9FSr?=
 =?us-ascii?Q?8uJ7LgmovdAIBEZ3mMdjBeLA9tbKcxFeJUx1q8l+zIIuiq9nIp/KgEQHZzJo?=
 =?us-ascii?Q?Aw3ioWLz8o5VssxXhVGUtKY6zvxpGmCY2ln2rQxyc034RlG1pweDHewNQNja?=
 =?us-ascii?Q?ySrgBBjS0EfBw2E8wpUTHtmnpR7doYR/PIQ/AmI9A+jIi8pRvtrtpZRe3L8x?=
 =?us-ascii?Q?pmlA+kX2D8FqBjCAkyTR+zL1WyHLK3qggC559HXLrkcKzdjd2olSToXlwl8y?=
 =?us-ascii?Q?zQ7NtvUdAFrH7wEBZW1SubzEInIsE8R2ZiJcYCo/CZNyCtxD50PLftv6ctRB?=
 =?us-ascii?Q?lFQFqlxlCbf9zQlZXh7Lck3lQhlRjhJQxke8IISqWUQI0Koz8YOe3JBL31Ll?=
 =?us-ascii?Q?BhWxicA6IcDn6gG+N6IONTvOmU1odlyWgsZsGgX3tD8/91C39uWv4ar1t5Pu?=
 =?us-ascii?Q?SFAK3mKsxxURZtS5/UHZNSNaB2bAv+mSPCOTA/VeQVRllVxPuzYVDFETBQ9w?=
 =?us-ascii?Q?ZvPoFB6TuhV3pm8xBGlfqlYu+rFHl503swXhj4VlblAW65d9q8xhfzrekMSm?=
 =?us-ascii?Q?cEa1mbWwAKUlHOR5X68JFheA/y0T4AmtWs3xY600M7fm+5SwqOxd33dGFSbq?=
 =?us-ascii?Q?xrsPVVZrMyXOysfmI6y+fsiP268VTc6mqNGQKLF3izf7a7rWCAL0EL5boGrM?=
 =?us-ascii?Q?D9lKlmY+plx4Q0XqCdPPMiNJFN34ySQpWSj9Jheb85USNt/jFS7ZZg1p96hJ?=
 =?us-ascii?Q?XserB4N1tE/0VIUJc3cyByPPSs7rovZHt06xq+mtrlQnP5+ZZuyD6YS6zerm?=
 =?us-ascii?Q?t/Fq28pKJt/WzW/rZM505O37fyaT5r2DwkVc7NMoXbNuB3H8gOOmCEmyKHDA?=
 =?us-ascii?Q?6x7QmUa2Rmk3t3C1xB6WtgQ54/rJHstyCp5AETvVFIGtMN20oOj3BOCct7Je?=
 =?us-ascii?Q?uVs3tS1AUFFmjpGtmMDNCe25SQwlQI/G4S8CsVsDDBPfike7qTvwE2UPgoR6?=
 =?us-ascii?Q?ERM9yTgixCeoES8WZSI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 09:13:30.8835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d40952-0f69-4de9-7a69-08de2682be13
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC802EB2B9
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Nov 2025 09:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16782

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3D989e638943eaa6349e9e21ae378159a635183d1d..dc8865d0938e9eb37d662f61eb2db=
899c7b64bee

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 5c0d4ee4..a5cafbb9 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -9,7 +9,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "989e638943eaa6349e9e21ae378159a635183d1d"
+SRCREV =3D "dc8865d0938e9eb37d662f61eb2db899c7b64bee"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


