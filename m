Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE48BCE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 08:30:11 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3874.1763362208238464842
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 16 Nov 2025 22:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=RCaKWi/j;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.61.56, mailfrom: s-joshi@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQFxv58EwWO6RT30RU5ufs34GoP/C+EtbYvFZsxryDl5w0IBOi1Q62CbXaLsZa5iVUCYoxYokye+PIaa5JFGrRJQz4gkoS1nW/CNHnHpMKofjXVyUTYWmSYm2wET55wq0Nkrp4mqllFm67mjsqw0zDLlkzX6RK3zen0/qNcR4PrpkqXmv4iFJtzPULJcj3NWr08mqoIsNDS4Z22UpBEaSxWISnH3Ny31WiV0pUFuq/dc9fGeJy98HVvARYjsOXr9MMyMOPufK9XsL7RNQ/lCxR0XjUlNkSZNYtdotZc+Nss+e8jKPo7kMFXmAUwLbPrX9bo/scraHaZtz96ok63Avg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shNSkkrsNB8whMCWWjVNgQygE4PXtSKc8qtL5u1PEsQ=;
 b=ssjcMI+8W6j6ESzx3/NpIW/rz4iJu6byD9qBJJ6fFgqqGjxImo57mm92kPkUFpen7mBHyKcbNNOL0WLisqBcVYLmkROJjXfBGrsrvwUTLnwHm0LCRM1GZbaQ3My4jobqw/C+yDUSoYjAHS2THbHpOUcEsTbgG8IhbAL/gFFwMRtZq8krRygtD8ShLmwQOR3WFMDC6ZP5dSaLLZxUXPuAVs1UEb5hIRqmdhw2r7bFh0qh4zSSrnpwcPQx5DF2lw+x/H9IwTQYt8Mb81UjC9UxyBnw5LNR2zKC8h6THhoQoog9jRjye/PbrHeeCfp65k1+0l5dYm8+UrzEWM92qAFbWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shNSkkrsNB8whMCWWjVNgQygE4PXtSKc8qtL5u1PEsQ=;
 b=RCaKWi/jIS2v0t9QXQWWDMy/g2V9VnIVD0jwNJ0sBZ+QTwyVH1exgFURsWqYqfJz8KBkvCBehj7L6/O4FerB7VhwU/zCssQUFMUJQ+gruQik5l3YnW4uCBKvaGkaQt/XSzh+MzaU9wCRNus1bY/E9RDnxu0b0Ww7LJhKDNnMZX0=
Received: from BN9PR03CA0363.namprd03.prod.outlook.com (2603:10b6:408:f7::8)
 by BN0PR10MB4983.namprd10.prod.outlook.com (2603:10b6:408:121::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 06:34:28 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::32) by BN9PR03CA0363.outlook.office365.com
 (2603:10b6:408:f7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 06:34:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 06:34:28 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 00:34:27 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 00:34:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 00:34:27 -0600
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AH6YQtY2022801;
	Mon, 17 Nov 2025 00:34:26 -0600
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <kamlesh@ti.com>, <s-tripathi1@ti.com>, <k-malarvizhi@ti.com>
Subject: [meta-arago][scarthgap][PATCH] meta-arago-distro: Add libp11 library
Date: Mon, 17 Nov 2025 12:04:00 +0530
Message-ID: <20251117063400.3715944-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|BN0PR10MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d3c11c-1ed3-4f9c-cb9a-08de25a35bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JlFwxQKyFCouwfp796ZO05ToQKPuL7z75iPpMxen+SQWBGmmtKksv08anu5C?=
 =?us-ascii?Q?WogOgX5Aq5SevZ4kcW801XBnuOvF+MrP3K2CXdpYWQj+gGA/n64hHZ8eYzlW?=
 =?us-ascii?Q?pU3iNh6IvO4X1Y1aXGhYC1d+uFL3ZUpyaH1P9Emugst5nh00KrBPRnU2Amj9?=
 =?us-ascii?Q?TlxdAFIV2xC+HyQFB0LUudz9XORa5WGEr8jOJa6SHj15/2h2UIvn7bgIhzmD?=
 =?us-ascii?Q?Xc52Xi6zqPbNcb/tE9e277tkPRGjkcuqVvnEoqxIanD0WXVlVVqjTewAemQb?=
 =?us-ascii?Q?IijwZbexBjz8Om/leNcQozyGaMmdITu4qgr8y4uZOjrDNRGWxdrMTiYgXQWG?=
 =?us-ascii?Q?cgks1x/5lOxXxLCNzsGQt3KD6Ti6ZT8NMS/fCO2cU9aLBRKzNanXu3+VihhS?=
 =?us-ascii?Q?ZWIHSZeKLDwPYHIt29PILGHnlkkg1+PzL+6B5kHXBsOSl/3YasabYEmcLOJm?=
 =?us-ascii?Q?nrugbJZ5apI7DcrfifOHjbktFHqC8cuPvg+HHfne5RQ4zYKOMM4stcfD4dAJ?=
 =?us-ascii?Q?1t4Mk/d5fY4SAe4UW4rI03vzpUGy4rkhC5vkyaYgUypLQ/oSz5p5l7h3KaeW?=
 =?us-ascii?Q?n3jVFlnNjWdx5J4gM+fp0zVxZ8EH9UjMzvdF7jtERgOflySpvge4L+7gue6+?=
 =?us-ascii?Q?AJQDUveyrgPT+nVoEQ+i761uu5r6V9uu/kOd8AsZHVbSA2l08RNZQsYHq4zI?=
 =?us-ascii?Q?+jA1clvrcc0QCiGf25IWfek3JNHKr9i8QMRGWKZ8Ei9N28nGiELEc6TW3Uf8?=
 =?us-ascii?Q?kkRBwjVW++Rv/9BHHFOJyCbo8jtahxk3G8D2izpAX3U1wB5QTiCsC4lZNkXH?=
 =?us-ascii?Q?vZkhLtba4L4SQ5UtaC11lPz1IMqMEI21nCAo2X2e6q9OBT96Ygw7dI4qGSza?=
 =?us-ascii?Q?OJ5Hf0pxSPscrlYzmwuZnt9nuHfEvnBNp/KoGUR4XiXFhXCzAuA99Oe+WnhS?=
 =?us-ascii?Q?wycVeZVSZPRhM9tKI76MdwcX2x/tex7FmiEj10IBe3s0JoIny+JZXGdc7N+q?=
 =?us-ascii?Q?7otFBAzYQcXpkxwHL98BzKAv8sbysw33aBVthWUIj3dLdlVAu96jLtSPp+ir?=
 =?us-ascii?Q?RhzspZgpTz3IEFkIkekz2HBSmBaJG1DckvOVig/Kaw/qFC3BWiEH5zN+uiq/?=
 =?us-ascii?Q?4CwWHPURMuuPhhy3Zoh5dJVN86MrMYDGH0li7uXOcUfbI9Ber5JIaOlGxfh6?=
 =?us-ascii?Q?V3lcHp+76FXYpvEW5tHy5wx4PNDS/mWxf8WH1xUYWb8GzOOa/0nq/M4SxrBr?=
 =?us-ascii?Q?nLZjv/WtGBL/G5iAEY76YFXr8mebwC4yNVAxnIbBUr4/bx6fdt/edZGrA/Qf?=
 =?us-ascii?Q?IJ1f2ere4NeTOZnyYHv1BPqNVQDYRMx/qi4Bkv5WqEpQmX8ysdxQymUFM/x1?=
 =?us-ascii?Q?HtDQs9oVtUtc+wIYobJZU7VpYhPWQxHaZgmqqqEqh4rSu7DzU9G41MpmVWy2?=
 =?us-ascii?Q?onozMO0RXD5FxdwwCZrGGjuP3peH616EZHyof+5zArTor9wCcpUs9p3J/Tbv?=
 =?us-ascii?Q?Z+qpUQzt3Baf25zxcey03IfAqTjmWjOBWZQ2ULsqD+o0fOLZ10XdD70gQPn3?=
 =?us-ascii?Q?vCqSmkjcXC52iTEvLg8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 06:34:28.1171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d3c11c-1ed3-4f9c-cb9a-08de25a35bbe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4983
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Nov 2025 08:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16771

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


