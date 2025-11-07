Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00792CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 19:13:45 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7429.1762542821827187252
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 11:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=HQEfD5j8;
 spf=pass (domain: list.ti.com, ip: 52.101.48.51, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWfWqjb/WtheJdLlUi1qTWn0OIs43s/M60ZkHwuJciB6MQd3w/lMXrsHw8O+DeN+ltDAppLn0tpE0R4Sn4pn7Sv6SWcFA5nDOYYeBIlSVuW67UZYBy5RZ+RSPCXMD9P7AyvQ9pXGIhY5TZ6JniA78FawihiVBsManRM3+4Q7Ip2j3Tk009lt+xO3IxJpp2XqLPG75RtB9WpMCdrqhJzUBxezBK+o8VDXysRoehSwjDrfT1q4MQPQzmOy5V0Rl06T+/uLO/wqwY5CRdEq9N86brMjtZ7ZoWrIPz+UUDf6xSrvacq1RCm5fWcaq/oiJkmw+T/m+V1FgqRHPvTdwiuW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qU5nYYwM21Tmi4r20tqHGuFncfZxnU246e7mwC/E7HA=;
 b=Ta9kMLtp3yrLe0VDV8i5hdrVarRpL+GrTEIn22JCDTomYBjgDTk6a3dtoy5mspkX/XLlJiWI2Ym7UQeiaEjGmanxUGiwOmk1rTdAX8gPrluGOUNbl8KTvicKBPaxUrXF06/LCpPDMHThqH0nt+/upl+R9v0Griy8eORfwqwaqTRHs2oq/sro4zR8YbvNkaXJhCtKPqnMCbnLgZPiRP/DTZZBzg4V+nt2UwW8GBlmMwbS4/AGW84VLAl30iMdMepiqoPvXRbyLsRH509laRFDpfB0a9ezwbqiDwh0Z/+QFF7r0diKCostob6JL57WeYoO5SYM5VhRSuo1+j+WYDobpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qU5nYYwM21Tmi4r20tqHGuFncfZxnU246e7mwC/E7HA=;
 b=HQEfD5j81crK/GSLeCT4YSYqRWgavRuMj8tgmY6Doyxo5J/e3l7VNhgJXpTXPwKQgOg6aiHag8tGp18os1t8NClcC1nu7nFbd1o61PFP1fQWlTXdhq2K5iMLKFnOnJh6a6NA+qM08kCauJiIQrH1rYkKmSK6Lvujfhap5440PnjB3G4cth+eLrgDOtShn2wFNlyTJ6/+hY1c2XPkZl/Qi7HczCYpIRIAxZw3kRJVRJ+RvLGPrfAs/Zx6ELY/y35YNjuydtBr6preDwndNO6W5NcAvs59vXhEuZTj/yRPtgORQsLdT5XWnqMX1iC7isIa/hIMH4UQI8RvQeGAqTT8zg==
Received: from PH8PR07CA0033.namprd07.prod.outlook.com (2603:10b6:510:2cf::20)
 by SJ5PPFB6A054FAC.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 19:13:36 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::50) by PH8PR07CA0033.outlook.office365.com
 (2603:10b6:510:2cf::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 19:13:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 19:13:34 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 13:13:26 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 13:13:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 13:13:26 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7JDQiV3498193;
	Fri, 7 Nov 2025 13:13:26 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 4ECAE2A67; Fri,  7 Nov 2025 13:13:26 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511070802
Date: Fri, 7 Nov 2025 13:13:26 -0600
Message-ID: <20251107191326.481769-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|SJ5PPFB6A054FAC:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ddf494-1055-40fa-9862-08de1e31bf75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DtjO1BS9/R3K4yKYurb5wLYghwETPZEHyDy7Z8fbA7ZhXnR5CxAff0cNrz/T?=
 =?us-ascii?Q?wPZPcaPaSDi7XKMZaKzGx/rDmAhX4CbeD84yrzC+8bHQwh3HCRCweBKLCSGp?=
 =?us-ascii?Q?T0koT7qlLjprfjx1Tw4U8lurFZK8DxAJeffmcnqNJNpq1BRhx36uSQMuy7pO?=
 =?us-ascii?Q?UU+k45b/vjrsg+q5ZqwRRCQAlR2l4LIxQCOYWh26e72SyCoWfLT6Twxhjp/M?=
 =?us-ascii?Q?6R8eYRVsuUqEeB8b18kwNewDdhyX6id7E83ophZJngtutbLxnnH6OVEdaPtI?=
 =?us-ascii?Q?TLjgkSjoP6SU0J6SRgee2FtS8z83hDgNp3wAim6eEB4/5ZSw/qwatTa88dzf?=
 =?us-ascii?Q?HcFKL6nzQy1WmkhsUdtQI463A//ZwXF75OHf1je7YC+4zY8dPXeMKxst/3d3?=
 =?us-ascii?Q?j8fLRxFtZ4BdrXWbR+XQ8/33Pffp0heF4nQP6nFNAikQAgDSZu94nSydsDM5?=
 =?us-ascii?Q?B75dgkSetXGoUWXofOcHRuNkD+GM8ZHzIeJkU7IdQVoZYEop/y+jahX4GzhH?=
 =?us-ascii?Q?BkbKD5dLd4VWqJNnfJxMGJV+4EpQ4SBFtQ3zfztzwCs9HaGUMUQEAN0gUrz6?=
 =?us-ascii?Q?prDhA1M1nDSjfLDVSUFcxhz9SeHbOWvdO9kg0dyLr1AUmH+G30FiU6DTQorp?=
 =?us-ascii?Q?N6E1xvdqMRR40FYwMmjve6koEjGU1W+ZKv3ewGfGp3c9ZHRkDcmqqvdeII/l?=
 =?us-ascii?Q?0JFBT6OnBVbBbkPeyYLgFtmqcT40x5MAgm8Q6OqgW31diHMAitdryA8F9phM?=
 =?us-ascii?Q?fZ/5K79uuAbC19ltEdyOYbz0BqX3COxBGNYdMPvmf6zRa8LMMAPUAOCs6RHa?=
 =?us-ascii?Q?MlLKgMsU83lStaEq0Q11I+gTphmpTn/JAeW2kWHtc9r2leExO5VTjJvcI69C?=
 =?us-ascii?Q?VmEp48XQ6u4V5gTBbxDI1P8bb76MBTwjjFMBLh3+rMLW3X7nbElaw4DDX4ep?=
 =?us-ascii?Q?rwYbNt9IBarJIUctYH+rUYtDLtNO8XP7AfN58Av7pvLAqFGkD2dIG+DAsmuZ?=
 =?us-ascii?Q?BBRqJo+Z0oDpqswo1R6ORSltqHkQ0ErYTm9mOE+OoARkvI1Ofqx/1+cX8PfT?=
 =?us-ascii?Q?twY3ihYtg2o8PJnc5A/1VmIf+jlbZDtQP0STF4ha81xxezcGhsGh4FYQ7ibB?=
 =?us-ascii?Q?wOsInh/LDJtuWFQVAKIi6/Ykz9fl+nmEli2eVGwcKstkcp3K+iG1l9Xf66iv?=
 =?us-ascii?Q?bKRUrOIlIhDxcwVgPnP/f4TYyPkTlzitQHdS22g5Ggun3cTlWHmE3s7SL1B6?=
 =?us-ascii?Q?vbbGY4XCPaU8OIKwO4pVJpLGY1gKGUzC+e8ScDdfkx0mam8odP9aP0oBPKPa?=
 =?us-ascii?Q?5CFGdwWC/JiZ1ylyf6qDLUAAF9CpkSJmJkfE2GxMH/4rXFnUmQmBf1IVbsZw?=
 =?us-ascii?Q?33u4nKNIN40RO+ZCWzZ6B/a+X0/XCayvBlcVzhaSwVbynJfHK4NZYx/L3SQS?=
 =?us-ascii?Q?fYWRUcnbU/LLtrQ3mdLjeKF1ofZLPXjPfBJTDeBzCWgPW6yhX7c1UbPRcQZ3?=
 =?us-ascii?Q?LanU6GJPOxUkLeBNwXfWT7oK1QHkKJzh0yOugF6Z81DqtmTmewl2t//tXLSL?=
 =?us-ascii?Q?SexwMlYPERH3dZ0QILA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 19:13:34.6725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ddf494-1055-40fa-9862-08de1e31bf75
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFB6A054FAC
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Nov 2025 19:13:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16731

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3Dd025cd6ccd407e7022bfeaa46eba7c3c9d29d933..989e638943eaa6349e9e21ae37815=
9a635183d1d

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 3da60cce..dccf3fe0 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "d025cd6ccd407e7022bfeaa46eba7c3c9d29d933"
+SRCREV =3D "989e638943eaa6349e9e21ae378159a635183d1d"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


