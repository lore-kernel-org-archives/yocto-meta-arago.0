Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9D0F33A88
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:14:15 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46518.1772723651736011779
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 07:14:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=s/5+Q9CH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.49, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVGlY6s/TVpnDR+QSACFfK0YMvTg2wv9RrffihKTE9NWyNfyeSvXN/IK9MuxGke2rfTqE44+iFNbUerEcwm4Wbkjk2561RNYtrVHX18rQ9tZDb0YDvaotAQBpM3+OOyWV1Y3/RLqZ9r2Tai+S4BJcX7kwkcuNb8J0ZXKUUU+arkjMnSTrWYnIVfqOkLuvYWxXiFkqCTjB9qF9QLYj/Jt+hgh1bneb+sUGHfXG3kMMPc1qRyPdWC1YwCu+6K5im13NnEeNIr/7xKglwmOsZ41MqZAbWINvJ+rc8cjJpma+Je8ju+mAznyjgzoY9q6WIcQLgesPIBySzLGebfHbe5Ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msyXPW/efLCu/Mw7t7WdNF6f/fNeEXwY69oXd+L5exs=;
 b=sLvVf8xlQJAIUhX0rgI5I2UbcaA+g7I1YO/FlNpE2/17Xby4F76NmIeSnN3hdYkBkvdxiQHU8OuEgjTpZ60kXQcCjtRYeBEvzm0YiNBSfC4gqW3pqDPrRRRHcf7CyIcKoq9LaL6ngbbGTU1Ndq1koz9EVYfc40mznhfq1v0hsULE6bbaODoukgOt44Caj6IxnGbqqv9hYCbD27+cdOxcKTG90IFqF03DafCVKog4A4YZ6QUfyDJuC+qdOaug4wttQheUVJ2+R0fn0usiv5X6kjFMkRr1cHmpWRWoNzZuSUnKxwN58UGJZVYG4ySR7mYTMOHyX59PVjAlibq946sgzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msyXPW/efLCu/Mw7t7WdNF6f/fNeEXwY69oXd+L5exs=;
 b=s/5+Q9CHN9eZ5q9LYUE6YW3albzOiXU2ioEnc9lDN7Gcxsrl5Ps3noDEq3SvLbjgIj2iOp/k+YYA7oTLHkgAWPgbs7UIUY+LR8bvtcEnKJrBzaqST/1r6FxnwbLhkazrqggYjs+R2svfbpBYVJE4ho4JcvyfUAQhKWmvlVornbA=
Received: from SJ0PR05CA0161.namprd05.prod.outlook.com (2603:10b6:a03:339::16)
 by CH3PR10MB7714.namprd10.prod.outlook.com (2603:10b6:610:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 15:14:06 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::29) by SJ0PR05CA0161.outlook.office365.com
 (2603:10b6:a03:339::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16 via Frontend Transport; Thu,
 5 Mar 2026 15:14:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 15:14:06 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:14:05 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:14:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 09:14:05 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625FE5Nf2551740;
	Thu, 5 Mar 2026 09:14:05 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vyAOr-00000001vhT-23ab;
	Thu, 05 Mar 2026 09:14:05 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] ti-test: Add iproute2-bridge
Date: Thu, 5 Mar 2026 09:14:05 -0600
Message-ID: <20260305151405.460115-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305151405.460115-1-reatmon@ti.com>
References: <20260305151405.460115-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|CH3PR10MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3cac06-8f07-4b13-f34a-08de7ac9d800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|34020700016|36860700016;
X-Microsoft-Antispam-Message-Info: 
	nljPWuVN0lSuTwZXT4slV3nbRCw/gEQ6Rb/iLjLg5H9kygYZPluExMvxSiQD3vY1q5MIvqzR35ASK0WVMYFPh+BInxYr4CoQxmTujmRAPkrWhmuDXfMk/UUX9Gj3IfXmVC1Y6XWY51tt2apJkK2RrCit2XQOah66nx1OI+XQYIb8au7P38cVEz+KcqNR2fUAG9NgWpM8FpN5AKkRQh9WW6Jg6kaq5MEdOtB+CU6q39DcyFk5VsS2vGmSf1QkVRFF23hyujuRWiRC6+bpTwB8uItJYRel7+8q50bOfKJVw0iQI4UhP92bc63eoxWQgs9mxu1eFKcB0VOzOnIW4kUjsuDmn550LMsNbJuZ1BB1o472ZPCnkvT7ARKfsE59tgVThphBhGlkvqErjokMfELozIrhvG/EyugP+3KJwBJ8/TkUDp6PdGjg4qZ32dAZPSyYh2AIc12fj3cVdoAY4R1PCt9D58X923EHm/5zO8LmYB8csz3A7o5lqrVJ8+GIr/tHlkqlMhEaqYTjzF99Zp1eQKTuc0DZzgG8G0fn813xiZnMl4Z7JA5m3O642Ww/4YasRlBpVaKE7Auhb6+ZJ0GSbzJ5q/HvESUMeH62NQPZ/61ccIkodWSCwdZRu802GyAAk/wipgqWDiwqVXkrgJZtIXZWMRPLhEatXSjvaJdHJY3OUKdTvSQ5QztDwPhStCEfJMCFdixl6Ox2jSSgMX/lwV+GYCWd+D8sHOLshmYhgN+66JHhTQBHbWPDRQJI8/oVsKo8mBoAnumStGyR/LvdRw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(34020700016)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XHIeiEF2Km3tRmdl8gvL1JGwE9W7hKzQdA2FKiT8Lu1DjNfmSEWmyMtopZ+NIrkzJp6VtwXbPLRXOPgdwb280sUSr8t6wNekKL1h5V+o5WWhk/YqMbHhO/Eld60vmI1SIV1ZPTddqN3FC6FRbME/AQRsX9vZ4/BTTeWhqC7GpL9bHTTtmdzA55yJNcuE6VMpuuf3U+aPsO5NQdaEZuE8DFNaBm3g5RYAe7q2lxI+Rb8XiOZ7Ca5RLfZk9FfrKbfPvxRvt4S7QtGVPAc90AUZj8KKJPiZMZmynQc9iysqsfHmizZ1Y90oyaxdj3OfYBo2M2NgpVmmiqkXDpX+qb0pxA1p8QHYUHDbKzCMvjXXz1OTqahHTcaq/Zc1QMB2It8cbfdjUmuZsLzy7mZ/P5ZxPAkR3Eb46d2XLfQzGMU1o9Begc6BltcfoTIDPmnIsRTh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:14:06.2810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3cac06-8f07-4b13-f34a-08de7ac9d800
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7714
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 15:14:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17235

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index 8067f4c1..65cf7f1e 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -100,8 +100,9 @@ TI_TEST_NETWORKING =3D "\
     bridge-utils \
     ethtool \
     iperf3 \
-    iproute2-tc \
+    iproute2-bridge \
     iproute2-devlink \
+    iproute2-tc \
     mstpd \
     netperf \
     strongswan \
--=20
2.43.0


