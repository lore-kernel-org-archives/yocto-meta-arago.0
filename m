Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7A3F4BB96
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 22:31:56 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32883.1771972315600349282
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 14:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=rv+WU/H0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.60, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcmkgQTgkXFlNLiGhZwjOyjfw9ey7tvZxEDG4++DkOv5AV/UlSsJiggbAi40+t6bZWqCtSTZkWvtnX2J8pMdmz+GT6gwStpJHsv+m0XB54EPgu2soP4mLeOniYkgnfqTCXZSNIA6zPNM06YnEpbou70AG5AZb9+poSZo/UplojvHbBdD5GcodMqktoDtTWFNXOxUa8I6LtOEPMKT6QDBKk5LgDbB827h70xlqKU2ivPBiENdNiu2ZmSWqm/OEG4fcQRtLPFlZQaufdYYEi02nokyu5KOB4XsI6thX+rzteevqWA+WuTn58YURUZP5Cs7pQij7LjRweI3BwRTdA2cGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4s7Ujg0R67yASO8Gp55iCKE9x5hF2lXpQS1zEJldmwA=;
 b=j+DIRk6UM3mXI8vqzwdQnlEIUPVR1bU5I99zoKH7m9ElvvOUETU/DTFCl4jRd3/DNuvG5mJ5+y3/X7JKjbx6BLwR4H2HnIjJU7al4bqLlRpCK1Ylw1ThF6mW1iLdtYRY+llMgHi10mFTw4gan5l6PaikUaYUaW4lPGvxuGouMZgLmRRxqwnUiZrl5JfwFXi/8AF+sG4fZn/jk4/PKpUSwnZbEVyiuR2+cfAe6gQ3Q0BCbPsPqCvKSLuGqX0wLf9Hzry8/HQIvhQ2945A5snlQz+fjMBLZ6hYEc+/Q/Erl+6zNYdo0K2O9RjYEzREn+6cntc8dMcPstGYueYceJbAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4s7Ujg0R67yASO8Gp55iCKE9x5hF2lXpQS1zEJldmwA=;
 b=rv+WU/H0+S6Tp/o93a9qs0XH2RA3rxkK364a91ZGBp9rWtUoH+xn7LrY83bbpL4nA+XpfNXIZs5rx1bPkqvxjnOtjqCislF7cYbSI7AyegY+DMVHtnlzP94h373kVzbfn/uv3p11XcLDmyLmLa8YKytOpB5hwdD/8quQBs7gKEQ=
Received: from MN2PR03CA0011.namprd03.prod.outlook.com (2603:10b6:208:23a::16)
 by SA2PR10MB4523.namprd10.prod.outlook.com (2603:10b6:806:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:31:51 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::53) by MN2PR03CA0011.outlook.office365.com
 (2603:10b6:208:23a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 22:31:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 22:31:49 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 16:31:48 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 16:31:48 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 16:31:48 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OMVml03504915;
	Tue, 24 Feb 2026 16:31:48 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vv0wW-00000006Yz6-0Cr1;
	Tue, 24 Feb 2026 16:31:48 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] arago.conf: Remove duplicate include for yocto-space-optimize.inc
Date: Tue, 24 Feb 2026 16:31:47 -0600
Message-ID: <20260224223148.1564416-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|SA2PR10MB4523:EE_
X-MS-Office365-Filtering-Correlation-Id: ea7a8b2f-39a3-4f7b-11a1-08de73f4806a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|34070700014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q9vyhdlNMEOkXu8jgQJ5K4tRfu7yh5jiBxtYoB5TMGzVBtAMID0ouWzXWCGa?=
 =?us-ascii?Q?HpOKSue53loUUYU43lEMQB4YZT0EPChDXoHSX5/gBPAm5HCpCJ34Wh/7J7IG?=
 =?us-ascii?Q?naaxgkwOYj+77mwaby91v5yggsinsy5YVMKtJ40WNzdv1o45wYVLegn6P6JH?=
 =?us-ascii?Q?3HzsjyWLo2C/zCvnCti+q0GAXHSiYmODEVFkKR7Cg9K2zzObZsgPTzzomLP6?=
 =?us-ascii?Q?TefeFFHdfzxHVlMbxqBTb06ZAZ9QWMMd4AFD8GNKLHE5nH+jgagJ6FbyYNHj?=
 =?us-ascii?Q?nE3F7EAhqeEqhmANoq7KYatwMJLQ2B3KEuj8RP6fg/fUk7MiE3QCCdmisP0u?=
 =?us-ascii?Q?FEi0CUcW4jmDNGLcrWJ69NiiaXMatepFlfPeofvZENr+RMFny8AJ6kERZAni?=
 =?us-ascii?Q?bVEAHhsKohG0sPm5mDXla7cJ8H84fvQH4yoxqaDaC0ug5QUChoBHFux4KLEU?=
 =?us-ascii?Q?B5EcZJTdFhX2oavsFL8cVYAekcSRUuy0lwyWYMmqMq86FzAYaRiBnwwZhl2U?=
 =?us-ascii?Q?0ZphqipYF7wSAEmWqTQ/rqazVMc6H+DgD3BHtsXeO3cL1TNBPzPb4fx2OO4v?=
 =?us-ascii?Q?kBAFUbJCU79648DdsbavTePR/HH3HJ7Ux5OyT/pzlOT7yCnLtdo7UJBxrQHh?=
 =?us-ascii?Q?uMd+HejA5frFzOqkyuCuYle3A+ms/ZFGJURL0EJC+ECUWSAOnXHliPy8lML2?=
 =?us-ascii?Q?F8HjOcM1yu/pqeCxYDqzQCWaQ1XKZOh+WqoJzflsDbX0SusVvqqgohTv8p2c?=
 =?us-ascii?Q?uo+iqfNT8sb0PFk+yS5T4eWgB1jxk81KG/yitIpkTzlJ0HIigNIpbBcsgTaO?=
 =?us-ascii?Q?rSHr6tpklHaWgpfok9VCCq9itUq1TwSOHPdYE5ctNBdEbu7QjR0iubkpHYGD?=
 =?us-ascii?Q?HOR89QRlEvyQToTvP5ZfdM6F792sOdWtKkcWaqR3lPG1EKr9PJNhCMxSMUIb?=
 =?us-ascii?Q?hdG4WoYwOWE+1NvGkVltz6Toa+bwoMhIBopJ6pC+W41FepatNv5CJTkQW/7B?=
 =?us-ascii?Q?dc3GI452nyIwtXZJ8M+anPVFSLNZoQN2OAXAGZmASpGvDRvDrJDIPhdrbOj0?=
 =?us-ascii?Q?ETbomLGDccjpFXYDnrDkM1eTnC0dDyxgYIOnS/Vvb3Y+1Mdb6CQSrfFhe6Ug?=
 =?us-ascii?Q?cHDuTz8HUXZCyD6EYVGJgbg7ny5vPXSbbFdwsYUCHoc1LXmAA5EVsWLLhjQS?=
 =?us-ascii?Q?2uh7FApwoFNrVrO5UjZQ3ikBtS0kFKqZZ3FMB7I7ljgoRaz8nvcQqm77U9Wf?=
 =?us-ascii?Q?9CQl56hnMwAvEXsVg0mdNM4c4Y4s4h9rYJj6A6apQFg6S5QrPN8ef7ZHncdF?=
 =?us-ascii?Q?MNHSYz9K/C/aVHvWwjNQIQBkUobyq/uCX+4tO5/ntb5HAXVgQKUzSL5ySQPd?=
 =?us-ascii?Q?GoRqX7MTrwG3wSvoXwxwzwcgjNkEJ6kbYuVGi1hiyQAKl8Ola/cvC5ceJrMp?=
 =?us-ascii?Q?EBjAoYQxc5q9EiKeMhvYPdQbGLylmyxnN2s2xyH8Fp9KL8VAZZ15DHFSnMpl?=
 =?us-ascii?Q?tGR779F5qxIPNIJrQXA/7vy9wAM4lSRwu07OUzzQdh+18T/BQmfPkHUtFWKK?=
 =?us-ascii?Q?T8pL5Hpwe6LkAwPArypuOT+/TJMmX8jaRjVCljxOkLOmpa95ahEA7XpsZy7Y?=
 =?us-ascii?Q?p+FgeoTYiMMHuoB3xtejrfUmoDfD9RMiqJWHEI+sWA/62unxDjjmaSegqpSk?=
 =?us-ascii?Q?j+AIHg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34070700014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XClelnMcD8XhLHrMAEHYXJI86HaF0Odr4+RQysaKyJOSD/Z4DyuaIkXAo/4EgR1R9OPjbRTSqpVQ3Bf3SPRnwgC9H01qOpsNWN0En2HEL2ZMC3eDxKTo0mzkrwKwpge1VIEePTD4X9A3jJ8SoJEcw2iixrDkQnrAN1b6kbPzZEVKQciMwqny7nIqvP3X5aLiwMIeVVAKUnHNbLS/gZjYGA6yExjNAKR/geqq3OoDt6bHGVyaejk0Xwv8+1LMOA1TpfGJqk0M8p/pWyVP0zykYTE5EYxsAh9wJk0u9fdjmELsUTswt1N9aX46e6tb0/CuN1wW4W+1mddZ5XFP5KXpcbjGhXcbj0MTbdcA4gmvrduJ/YgbNrj17LFklEbKF8mcdpHe2Nl5XG/q4VZEQ1cQSjrv9UUn8AiPj8CBs1gpP0FIVVs/kqRfCtVhZ86CgtDJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:31:49.5319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7a8b2f-39a3-4f7b-11a1-08de73f4806a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4523
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Feb 2026 22:31:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17137

As of [1], yocto-space-optimize.inc is now included by default.  So we
can drop our duplicate require and fix a warning message:

WARNING: Duplicate inclusion for <snip>/oe-core/meta/conf/distro/include/yo=
cto-space-optimize.inc in <snip>/oe-core/meta/conf/distro/defaultsetup.conf

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D175fcf9fad6=
99dd122680d3f6961af9bf8487046

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index 4ec091e4..17c6fed8 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -6,8 +6,6 @@ BUILD_VARIANT =3D "${@['prod','rt'][int(d.getVar('ARAGO_RT_=
ENABLE'))]}"
 TISDK_VERSION ?=3D "live"
 FEEDURIPREFIX ?=3D "builds/${DISTRO}-master/${BUILD_VARIANT}/${MACHINE}/la=
test/packages/"
=20
-require conf/distro/include/yocto-space-optimize.inc
-
 OPKG_ARGS:remove =3D "--prefer-arch-to-version"
=20
 TI_MIRROR =3D "http://software-dl.ti.com/processor-sdk-mirror/sources/"
--=20
2.43.0


