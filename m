Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BBCCE8D57
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 16:50:55 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2936.1763139051699254617
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 08:50:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=VWljF8cd;
 spf=pass (domain: list.ti.com, ip: 52.101.61.55, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKO1IFpDWUvXFlOptY2/Ak7RQldszfEu6wj7eCGlgsfCMPzS1Tf5I5k8/9YdO+htZtQmvY9Z5X7F02IA+Qb6v+aeFO54BsUT95S860RVvSIoZWpzZ6RbYXErTw/0gClrEZvq6rqsIG97CYK8tok8xi2x1ttCkl6ACE6VO+LnVL4lVx+nFiyWdzGYvSeepA5G5VJEsJcB5qS/3gMb43Gwtdr3bDJtnQMNyEjhJswUCRfE6gjmW5y/bl0cu2ySY3sXkJAuFH4qtarmth0QrLxOnplCYE+H8BHMdc44RKyomtydjGObS+oUEsdVbW5jH0w2H37BEkkhsWQi2ggfNHxdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJHvEVYQmctGh6ll6SzkQcwiXqGlGTc2kM0Sy3Dv4xg=;
 b=dGuwPfGVWEX0z3t1qMcuWa000fD/DaQ9s9kZWLUpcFkGVzBtVaK78oG1e96HvvzasFAj18jep5IrYF4oK+BKgglkX/hR9JGn5oP3ywPfG7BVr2oonKHgja1+ztdHACKlW//zKVbWA8t1q1KjmnGJYF0T/l5bUFYH9YnJIHWxeypN4ABgCf8JA70JT2LQjPNhtIevpslN4JC3WXaRK1ubjA32Tj3a8cvBGkhKtotCki+vNTEwS0OXFll1HEVrDqsJXfrCo6QZlK9AB/NsRiuFj/0bc9MV5jpm14qYHb8t2/NUFXStYOTpk8FCXBEXCBZp6HSvECt9qJdU3nJiXbHayg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJHvEVYQmctGh6ll6SzkQcwiXqGlGTc2kM0Sy3Dv4xg=;
 b=VWljF8cdIpS7rU5bppTU+EhutpgI+RA9rZIeqs4xBSq3JGN/PETzRsVeGC5A+6B4MvwCtHmafbSg28bm5GDTZN5QyRg21wRfYuGpH97Ds5v6zuZgdJRHG6Zs3Cv4z7arxzxgfCMGco3kucmDnejLz/Pv8Bf1LpFX2UNz3GAxdfMtf93e/SkKod1wg+YeYpOn95qi7qYymGKsBw1fBmm6eWptqX8FkmdHtLSoe9I6LZBshsJWIgg0UUQdDOW16zYdEa9jfB1edJZ5699EYHrk4BQcEX7s3Eo8ieSIv312dAxSyITOWEEdFdFNehJw4j6WrZjoQE3BWBsG/G9mp+QLng==
Received: from SJ0PR13CA0129.namprd13.prod.outlook.com (2603:10b6:a03:2c6::14)
 by PH3PPF2A078470E.namprd10.prod.outlook.com (2603:10b6:518:1::791) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 16:50:45 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::ac) by SJ0PR13CA0129.outlook.office365.com
 (2603:10b6:a03:2c6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Fri,
 14 Nov 2025 16:50:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:50:45 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 10:50:29 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 10:50:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 10:50:29 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AEGoTWK2303295;
	Fri, 14 Nov 2025 10:50:29 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id EB55C2A67; Fri, 14 Nov 2025 10:50:28 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511140456
Date: Fri, 14 Nov 2025 10:50:28 -0600
Message-ID: <20251114165028.2048629-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|PH3PPF2A078470E:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d58f887-8302-4ec4-f1e7-08de239df4b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l+99kNE6V2t2vgS9FPBzQiHaaZejQmDYk1uLKHWcudScWATd2jGbLd/2vtuL?=
 =?us-ascii?Q?16ti2T382jqUJhSfMzhjjr9T3Z9h1ySqAEXGQ5m4Da3UHlSSzIFMgwx3fO0e?=
 =?us-ascii?Q?sC5T2n8RGBzv1nCxTwODFt2r5+8h/hz4vmgF94W5m4DgSvDyasF/cWX6w0zd?=
 =?us-ascii?Q?1Iw16YSLVyuplsWlVzBOe9JTy2JFG5YEtChpq0LFsoVQjIIJdEPDgQ66r07w?=
 =?us-ascii?Q?kycb379LazDocwtXIEJx3/1C9IIjU8j5WN7ETaFMt2xiFm+PXyl2RFIhvJYp?=
 =?us-ascii?Q?T2UhDyX8kp8Lo5LdDCUnOP7dESzWoSiXiX3oKrEpPX/qsJNTz8Xo9RkiO02o?=
 =?us-ascii?Q?wHWLbY8Ts4iFdPg72Nx7sBbyG+tgFLwJZVbQeN3/0QKvTQ4cLXQgbCDmkWOG?=
 =?us-ascii?Q?PQrY7W2Idh0BAeh+/a7skZfS3Mk7SPNY07zMQQpVZcOPglooZhTtTZfh6TxK?=
 =?us-ascii?Q?tSZyKoiThQbEHCBOFlxxq6YnIljewhrOKtk01/ZyEKzHXg99gAT/3FQp0zh/?=
 =?us-ascii?Q?IFUxw0v9ImPxVNS7InCJ4Oc71czMDTG+hV3ig38RgYqqyxSeV77w/JBZcjkQ?=
 =?us-ascii?Q?ezVxnu1bzHieNfXCx6XXQIhXr/4Ub0B38il89Woa/8IzlvFI5rD+O5x2V0OF?=
 =?us-ascii?Q?bjdOth0dm3MqkyiPmscT15cYPnFE7J8Etb+g/fTtKydbyu3Kop/j+A2Du8fY?=
 =?us-ascii?Q?5vgg5bnDKCzYyavB5GIqmM7oGqqiPSUw4IFmIBb+ZiRkHGtyhEXSSUmMMiAC?=
 =?us-ascii?Q?62fBZmTzy292Tcg2VPAsBn5Ql45hHAJnmjbXEKukLdQ7ljXg+7moBEejKYka?=
 =?us-ascii?Q?uZY5hupEJ2NcHLkkeEFeqDW5H1Ln703ZOBAuZuKuP1u/U2w8MB8v+uo9XPKd?=
 =?us-ascii?Q?6Szu0f3rMaVsa7udtugJ3Fsqy0rpRVeGykif5UfxxGSS3X8/2Ws0/R5oaBAK?=
 =?us-ascii?Q?I9Yp6zg3MwIzC7tEv4xJAZnJz6DaBd1r7sjqmwcKm7xbSgangjpMDuNSvGMb?=
 =?us-ascii?Q?3rup+AzEmqcm6ri65Xs1VhgtUzlCt2Jz0FIXEc+HlKd/+FjkL+Ln/iD2YHNo?=
 =?us-ascii?Q?ICQT5kpU1NXuo5ndSdNXG4Ex79mvrCp1l5JOVazHgIx8eWhULZu1u9yAYhfq?=
 =?us-ascii?Q?z0pLv0e/U1UM9pVFrMJSA8ZNTWfCYE0bT6P0wSM8eqoTs74LoUhBGaUtdDW1?=
 =?us-ascii?Q?wVCfcvS5jLbJY50DurTWZpGmZiZodxtlCwvZAyRcOHh5+ykOaS2YuWP1I1oG?=
 =?us-ascii?Q?Xa4REocKAp6KbAehni4oTTp4KhJBzh6nKbozQr5hntPPeTdUT2yvkbXXzFs1?=
 =?us-ascii?Q?YhRqNh/3oDqOE85N5sy9tB0Q9lE7ZzL2pI0EZkAAYKdK0UUM6zl+7V08sV45?=
 =?us-ascii?Q?X4TPkNkZAj9JVxTGyYPxL6hpYaaNaRoDO53M9nX/yWo9ks///E3uh8Pyps6E?=
 =?us-ascii?Q?HNDNKwQNWvVEDAabDKbKLqGSpo8V2PtQgFZOlpZWxMW/1lQ4EYaJhxzGV3kE?=
 =?us-ascii?Q?Xa4FAzywDlBJpYLwryThwliBl1AWxQqsHjkLe0C43GsGKonlsbImwSMmeCUN?=
 =?us-ascii?Q?8TWe1v1wF3mGlhl3XsQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:50:45.4088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d58f887-8302-4ec4-f1e7-08de239df4b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2A078470E
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Nov 2025 16:50:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16768

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
index dccf3fe0..bfa6e449 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE =3D "1"
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


