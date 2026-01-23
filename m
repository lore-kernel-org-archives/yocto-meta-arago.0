Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBB7D6CFBF
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 04:27:55 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61429.1769142471479347145
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 20:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=v6eFsvyC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.31, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKJljEVcw2xgPG8/SGftk9wfRTxrzQ6Q0ZkwRnW/q00BzOayfiU//uaw04SzfGzESs95IeHNO99aWwCfNwIM5uCu7LlJDnRsI5X2d+i6lFOvg82oIoURJXwCMGMlDM6U9n8OudnpQzWUNeJHuCVvZndaMNuwD/2A4Hf7juL4DlldFxzdgtov7Ha5vwEiRZl0xy35Z6wLXg8Qi5+7sIwMhuZn1KxIvTEK+JLbbliBF2X3x2Ce3W5rn1GPLX4jBa9ifHNi+OElLZ1pq17fkvCgPBsNZm2Bdr9HPdU+J5xdJIE5Tb4cthDH0gJmLn+rpU+SLJNQoBE4cvTQmaHBLaAEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XNvGcq+4VebfivIvmmKkGm/ngSGUQUB+Jng7V/zVSs=;
 b=wRIlsekC/ztUxuSeI0aadiRxn9CEoQWyHI1bR1CGFCaJ/tECfRNefQNOj4WrgQjYneKkEGZ07KCfKCPrx3RRzqUvciLWIH5Iikab+HILaWbNoc0s+05z9ovKt72xxnA37BC8nHHkse77U1PUTn/sKXJciKzvxzyX0CXthRPaaYh/b5U0GwjT7Bxl0HpKi1jL3NrC7yOyuzCr8Ku/0JspSNB8A5Ecx3EjotClp3e5AmAA4SRq3lK6/YMkDkwH/YxHagxmE9QSmDQAp94GTQUKDwaeA8cKpxM0zNNiOXN9cAMjSSJrKCVGKbOxCZlkQYR88VQeRXSXxcnuiYF6NKgtEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XNvGcq+4VebfivIvmmKkGm/ngSGUQUB+Jng7V/zVSs=;
 b=v6eFsvyC6m+gzU747mVb1/L6QCJITq/dz8q1iU9ilDRmlU7VHah7/MjMGErw42Sy91Z2uoHBhoqMPSzQzLykHLhjV9IVQGcCgBCjbgvjd/G8Wia90IIUYfRFTHQysLdaUkjB72eFFJuJBwpoN4HLDEBvTb+gCwf3L25j3mWz4pE=
Received: from BLAPR03CA0080.namprd03.prod.outlook.com (2603:10b6:208:329::25)
 by MW6PR10MB7616.namprd10.prod.outlook.com (2603:10b6:303:249::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 04:27:48 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::27) by BLAPR03CA0080.outlook.office365.com
 (2603:10b6:208:329::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 04:27:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 04:27:45 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:27:45 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:27:45 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 22:27:45 -0600
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [172.24.233.77])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N4RfYn1704885;
	Thu, 22 Jan 2026 22:27:44 -0600
From: vishnu singh <v-singh1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [master][PATCH 1/2] packagegroup-arago-tisdk-connectivity: add zeroconf and avahi-autoipd
Date: Fri, 23 Jan 2026 09:57:40 +0530
Message-ID: <20260123042741.10313-2-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260123042741.10313-1-v-singh1@ti.com>
References: <20260123042741.10313-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|MW6PR10MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e457d7f-2057-4306-2873-08de5a37c232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wnppTZqkGrDp2cBL44YR8HSPhGfQk7O5WDde8xP8coSP6D7JNyKY7DYWEzqV?=
 =?us-ascii?Q?I9Kv3tyrL8HDWXq/Zn8m7Z5kFc/xloBBmSc36GKBbLhATK0oJybEzUusskTQ?=
 =?us-ascii?Q?/EX+FBWpFSJ6UenaXYaKGNvIr+/2nUIbx8PCZ8zq+DPQyCTgoJeTfHXeQIhm?=
 =?us-ascii?Q?aYP1bt/wMxzM3orNxm5DCzNJL/EPyiuyXoMbBI8lMcxIEUGEMMswTu2ebEaZ?=
 =?us-ascii?Q?20ENgsBZDAUFEHbUTny7csdq1cbPpIxDAgMPK58IG79/kd3MFfCv1TnX7VCt?=
 =?us-ascii?Q?SNG69AthFSheADxlcyf06po/FBo4nWKU0vKbNcJH7GsOPuIXCKtl4e1LpWSg?=
 =?us-ascii?Q?B/UcXyimsxVlzL1oyn/zjXVc3oPlAvwWYHvVxAQjP/bAWrMj5DfDynB1wJvv?=
 =?us-ascii?Q?LXIY5wa8DyoiiQMMyH3AoZzsyEUzIX4zW8/JIjvohA5v8ekM9TPKL/PG8w5R?=
 =?us-ascii?Q?H3Y324Uja6JT6Lz9/Mka0+JWwx0WImSiZ6zSGrL2IjCkTEAeRHFVZtaUzAQ/?=
 =?us-ascii?Q?VuDl7FtfENT7Vo1ZOuvhcMRBUJkxpQT5bbg3UV0HndxJ0y2abvf1EbnWQPKp?=
 =?us-ascii?Q?2YOYZ30xOL9j9WKpsZ41c7/ZTwHKjABsovPrp7RER6DBiFx37vBwzo3vFVCB?=
 =?us-ascii?Q?ne/SFoNs4RpGbI2pTQ4Kx82sxu4rTVpqrWrZci89SoC7dK7+biNHDHsClS+k?=
 =?us-ascii?Q?L/+90et2lfxX1n8udtLGKvESBLwRUs6OVA26QawBCxzXUSqAaW/VhkxaTkqA?=
 =?us-ascii?Q?/DWKQHFsQCSh+Vdxznb6BhvNWGOdUEGFUVUrp7Fmme2no2qx/6jtmqU1LYD7?=
 =?us-ascii?Q?gOPemML7/5x5pdRgCMSD5y6nEAZp2wnE0fbyJZe9cHHjJL2WESMSmJrOldq0?=
 =?us-ascii?Q?hGWGnB9n8lsgaTG78YpfDfaxy7DdeS/BnaTtw2FEkrmWyoKvcWivdISkL11f?=
 =?us-ascii?Q?ij0jGZTG+rpSjnIvb8C3ikGlsb2hFIxBE9ylIi6ceDOBXlZ6scS42mLAPXGj?=
 =?us-ascii?Q?L6oQdwsR3SbEM/sirW1zjyMNZ4rIFgouar3x2UUyyqhpKWYaAmfaI0bDnrW0?=
 =?us-ascii?Q?Tn/pXd7PRBqsDkqu0gCY+pqiNQvZsdOKORj+xtsD08AGGgTW4zb9k4xTHxVI?=
 =?us-ascii?Q?PmY0sfF2qYXz+2qd1BOG5w5DYM+yXX+vJnR8x6X+zqcsVa5Twgrq0E+u8cD0?=
 =?us-ascii?Q?PhxksPq+N10DMDC/eMxVYHsdDks6ChHBzsugCSgYmHCukjV/JKYWKsdmoFp+?=
 =?us-ascii?Q?MsBqHGYRtg8BlK/1KohgOA48OOSacQs+Q5NCFSk21/5wvt8DERICiZ8vUh6q?=
 =?us-ascii?Q?qo+XqHe+8ZtXYZA9PQ1V7bd2EtXokMLGtw6WZEUWjGcNPsbj5qH+wkmgLtCc?=
 =?us-ascii?Q?b28dbp10fF43HGOL0Cwa2h7Thd9DgoPQh25JsPaKzz50hXtUxDlzG0fCNN9l?=
 =?us-ascii?Q?uS2pAoZMZQ1dsao3BfzU7YJEHcqCm06XKVddjMRu5uFOy35sjkaJLgoV4c5E?=
 =?us-ascii?Q?7sEU7rpeJLZyzno1SidbWgIUaMClQf/X10zJz/Kxq14dWh7NjxrKN7jXbVfn?=
 =?us-ascii?Q?IWqGBn6JiPzNuAERRhnUXOP/NDtQR6AZbFgYzTok5iLG1TUdOvb85W0caZxV?=
 =?us-ascii?Q?3GOsOilQUNrk7/FEXuxbohQFQZzzWVDUEYfaiOhxhEprbzwWeil9Kp+HM+tn?=
 =?us-ascii?Q?1yi1Hg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 04:27:45.9724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e457d7f-2057-4306-2873-08de5a37c232
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7616
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 04:27:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17014

From: Vishnu Singh <v-singh1@ti.com>

Add zeroconf and avahi-autoipd to the connectivity packagegroup to enable
zero-configuration networking capabilities. This allows devices to automati=
cally
configure network interfaces without manual setup and supports service disc=
overy
on local networks.

Zeroconf provides automatic IP address assignment without DHCP servers, whi=
le
avahi-autoipd implements IPv4 Link-Local addressing (169.254.x.x) when DHCP=
 is
unavailable.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-tisdk-connectivity.bb
index 0a8d4493..ab299391 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
@@ -53,6 +53,10 @@ BT_TI =3D "\
     bt-enable \
     bt-fw \
 "
+ZEROCONF_TI =3D "\
+	zeroconf \
+	avahi-autoipd \
+"
=20
 CONNECTIVITY_RDEPENDS =3D " \
     htop \
@@ -68,6 +72,8 @@ CONNECTIVITY_RDEPENDS =3D " \
 CONNECTIVITY_RDEPENDS:append:ti33x =3D " ${BT_TI}"
 CONNECTIVITY_RDEPENDS:append:ti43x =3D " ${BT_TI}"
 CONNECTIVITY_RDEPENDS:append:am57xx =3D " ${BT_TI}"
+CONNECTIVITY_RDEPENDS:append:am62dxx =3D " ${ZEROCONF_TI}"
+
=20
 RDEPENDS:${PN} =3D "\
     ${CONNECTIVITY_RDEPENDS} \
--=20
2.50.1


