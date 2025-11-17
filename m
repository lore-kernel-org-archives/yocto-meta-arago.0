Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20F5CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 08:29:51 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5076.1763367533231348093
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 00:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JP3Ak3P3;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.62.65, mailfrom: s-joshi@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EgT8nkiawvB+URFjv4H7rmzFY1cvlgvF+ZRm/VfJdikQ72/Lzfpf3CbTOvred7wFXr2yV3xZLt2TWNwRvYs9LnKK5FnWHx20Ha20qRTSgsLvGRjX7QUA7h/soNFX6UQ3Axx50jX695HJBursCOVUFnYW6bJNDl2o37dlqd/M94I7FcgsKIOYODUFgBa6rtnnjApS0+GnlIhHDyodisGqG+TRrPaxPRrJATZJlmCs3uJfAnKUQf7noYKqsBDqlQDzlqDHd8NxVNTYc27b1iDuuRgw3vHgQ7VhlAIgPTwOdyukQzfBIS65MIpjKq/1l8YhGitsaOBN+Hn3Atdc4u5iGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shNSkkrsNB8whMCWWjVNgQygE4PXtSKc8qtL5u1PEsQ=;
 b=ldPvjfoYI9i6JRF8mJdo5SMxH91yv0SEtmDxEnwWcoDLobiASgdz1xHicMrJcfaMg1qmR+jHpfyVIIUhS0Z597sM6sRSylnPW+Xf8rdrmVh0FeYGeUhGBxu0mjPKNjfBf3UU+jA9ovAEv7sw2Ipb9JWr2opN0eqaRyJpJoLH8+GOIrodR4eNlGN9aHqpmIiTeIZ2bFHmamXeYnVXLweYQ3e5THOeQHjAwLh/MJJ26q7S4/MkibHSI6GuVZLeUIKAHS4PkWUWmnNjf+mnsXjVvOcHnjVwlB223FgoiEDdoaUL0rv7D6rC87RPE8K3SiRTI6qG+/zTm6koYWmzuUNIEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shNSkkrsNB8whMCWWjVNgQygE4PXtSKc8qtL5u1PEsQ=;
 b=JP3Ak3P3QlIGUKVj/QyP2RYs9ujLRfVNpWHha1L/GThjt8ixv77C4Siw/zFwzLi1w8/HyDd//alg5HGK3IAv8PlMVU+LPjbV1mR+ebAI2IH632GsZS6JzAFqO7l8G/0JoXlKlGBhnwYXnyLP5mAavyH1FWvukbVRvVZ6QryoTNs=
Received: from SN7PR04CA0061.namprd04.prod.outlook.com (2603:10b6:806:121::6)
 by PH0PR10MB5731.namprd10.prod.outlook.com (2603:10b6:510:149::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Mon, 17 Nov
 2025 08:18:50 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::52) by SN7PR04CA0061.outlook.office365.com
 (2603:10b6:806:121::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 08:18:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 17 Nov 2025 08:18:49 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:18:49 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:18:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 02:18:49 -0600
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AH8IlND2121342;
	Mon, 17 Nov 2025 02:18:48 -0600
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Shiva Tripathi <s-tripathi1@ti.com>,
	"Kamlesh Gudaseni" <kamlesh@ti.com>, Kavitha Malarvizhi
	<k-malarvizhi@ti.com>, "Suhaas Joshi" <s-joshi@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] meta-arago-distro: Add libp11 library
Date: Mon, 17 Nov 2025 13:48:33 +0530
Message-ID: <20251117081833.3718999-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|PH0PR10MB5731:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d09fed-0b73-493c-9214-08de25b1efd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?82CfRXy2Q89YDm3AyQXcag6Ntvu0DAarLGJbdHUROs87AjaAHZJdw41SM3Zr?=
 =?us-ascii?Q?MX1diCeBze0exfIw0TmnC8RtNuIrCLuhXfBSdBqO/KzS9Y3f05LK1/EztlYD?=
 =?us-ascii?Q?7aKdRO0knQ8zdtJvaQRnw2otOTebPbUUCwzs3T8MXjA9rxmxfJwOAhsQ+XIz?=
 =?us-ascii?Q?eDPmmZtXzMCJmqgiHu5HzrowZ58UJMZCtQLNTuJyfSPMi+CGn5mRyMdGEp5l?=
 =?us-ascii?Q?FLAYzzQpMMnPXexYz2OoyDvOq8bAXQX4A4qb5LvV4dMPveA4TkdAJkTciQvy?=
 =?us-ascii?Q?mqi2th3B0exCn6gmK2cp8nj0fE7w9hTJZOByEhI7D4ZaobKd3wLpjNXshzj8?=
 =?us-ascii?Q?ARhOT5/Ko0BUB1tunfsjwoZ3ohGkNoTxj6u6inZ0slweOdFmYDADEznxo4of?=
 =?us-ascii?Q?32sLpsBTOhpN12pxOsYRyxj/buJDfAaBvkkzOnH7rsE3S4aOHmZAMC0kd3EU?=
 =?us-ascii?Q?eK6cBcBVZ26e1o2h/doSobwcMCCZNUa1JVgvGaujpuNNWp2u2PkPI/mvRZ33?=
 =?us-ascii?Q?ceKPZGuCJEgBW8efPF4XyO7zqRzMI7zsprlHD7KvTQHkKJdC2WJBguDPB/EJ?=
 =?us-ascii?Q?oUIXi2KYAqyhppOpNnojOn++XIeSeNGONyxmqblHy8hrnqAR/TWHAA1Mjoda?=
 =?us-ascii?Q?xc6ESd6yjPDqnT86q+nbYygy/xhF8WTE261FTvHjDqVTwaO6AuljkaPq2qWS?=
 =?us-ascii?Q?DbG1q4E3N3cWS206NMWfC6HV8Tk25PLJ33rCMiJKmljuX4AiykdAbZrqVAk9?=
 =?us-ascii?Q?29sJ6ZYXEzc7ReuG2a7h5TpHc71m3d85WW8TS5PDyXHhHvcKdonzXXE3xH4b?=
 =?us-ascii?Q?t81Hc3NSbn40u/FRyhhIhkdbTYqdw0pIps8U8CaDPzj/08kBQZP7io5OsflS?=
 =?us-ascii?Q?vfczXx3wELE6yTgLerxPLWQKvvU6XK5X6FXaXBE4zFNSm86RDSUbii9SHmy+?=
 =?us-ascii?Q?QvqRCXfA0wVLlbe8UZ9sn1CH3ps4pIGaArzBbTQZ32jEBo16W4KqhsolQ9c9?=
 =?us-ascii?Q?TCtsQpP2Ge8Lk5JMPfRpXWXXtmDM6djEtv1XDIyyzw+x7bjKQcg3GQv8M9UV?=
 =?us-ascii?Q?gWVkolh7VdrtizaKzaKLySRja/Q+gAL9ur8oD7D7duNkHYyaDqmqzxZpt4+e?=
 =?us-ascii?Q?Z2085rvF7Fph6dDjEG99fOujIyKoPN1aHNMtDTskvEQvlq0I2MluuJSOCEJm?=
 =?us-ascii?Q?Yy5dd/83NoeMCS0HIfQCuF9w70hu30QumY5ZJ+41wuIkVcs3/TQjQCqs/PTD?=
 =?us-ascii?Q?fq2HdplLqyEExo0VPxY/AbOJbMFyUq4sqHD39Fe55cpD91mebNUUDafSVYik?=
 =?us-ascii?Q?+8VhrOxqBjp6HxNpu8gpk1Mi+hFuPEmOzZP1SnjdDZswh0+fkVecmGY25HIY?=
 =?us-ascii?Q?Z95ugYzilwVSAbC07k52pvXJQXrPLfa4QyGvCTWYBqzE9jgrCNfqLkjXALgJ?=
 =?us-ascii?Q?ybYDr2PT0I0m5wgVC5ngHBGjLEUILzcOU2MuAlfLvZ0736eDoh0uCUxGYaMq?=
 =?us-ascii?Q?Uwv8Vc3OnVuRrvkZkz2ogy65a+EYzOd3icP7n5Kti9Tud60gE5XkO1sSqnef?=
 =?us-ascii?Q?z/tdf4795ClN6rOdV5g=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 08:18:49.5788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d09fed-0b73-493c-9214-08de25b1efd8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5731
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Nov 2025 08:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16770

Add libp11 library to meta-arago-distro layer. This library provides the
pkcs11.so engine, which OpenSSL uses for its PKCS#11-related operations.

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-base.bb
index 5cb4e30c..f0f5b66c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
@@ -49,6 +49,7 @@ ARAGO_EXTRA =3D "\
     cifs-utils \
     phytool \
     lldpd \
+    libp11 \
 "
=20
 ARAGO_EXTRA:append:arago =3D "\
--=20
2.34.1


