Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6463C5DF65
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 23:54:21 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10740.1771631657809427067
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Feb 2026 15:54:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=mGD0iosm;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.50, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBuJ/tx9nvjCIADeL4a7+3XmfiuTzSaBla4W6+IH0M9tBxziPJa9+Q/iml0r2b2XmKO9XMm1ARtcBbvnA/l9rROwGnclWdv2Sw+Ax597JLibnLJMO9Z7H61JrVSLm/K6NdiQcZQl44fYh8NCAMk5VAW/nQPFhx76GF4ySW5Ww8Tu6e+e5EBynJWOQGU1Mc/oBuaJDnYSJx26P1Mh8XHmaPE599vsgtM2fTRQTw1RqJ0jhqcnSx5mizrkJslhY6M9ETFAkpWjpgEQCui4wzT1bdbI3xeX+QFfK7Oha1PVV7xFwvtTPKx72L/xcwhN49kI7TGCI2dqjwDQsQZnfhE4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2lp/OqNgIvH9fU5iaZr8ZU4sNenHQwRHMRyMKC0+to=;
 b=HOiDCdT/ZGcrkGrDwdZC+5wedO1BC347Y+xcLYZ/kgy3qQVBVl77LW7ypqS++a7Zl90ipGVpbVu10SBA5mNLkhec5YwVoE0RSu128yt6QS4jL0I1fjrQQDIDdqtczYBXttv0pIPoDB2ouIzcqlwsIGF4LFIq5MjRFqeHhsA9mqlhuXULGeynFj4Q2vEt9wHSCpkkFQj2gLSb4cTzpQjE10lmDt+rj3GdxaAeul7vLaqIdSw6Bopa+Oj1S2yFJShPXe+Xy4aI+etKoka0YqfZoFYa3zqmpQ1xrWwJ5NHN3F7aL6zbtVTZReJ37oU0BFspn1z+jvr51f9pHEgIYlwYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2lp/OqNgIvH9fU5iaZr8ZU4sNenHQwRHMRyMKC0+to=;
 b=mGD0iosmca4vjTBmmWufjzi945GQaubVKuE69b3vPWrIz4XT5/FuaZddF3FOfhzf8uXoUq4pusfST0BCmXmSuCvvvCkGWmUGgg91/UgE6WW9g/pigp7/BbG3vUCbZwZnD56dEc+3+K62LKm6cVaCa4UQZupT8ZWLKZ8WXgCTyiQ=
Received: from SA1PR04CA0017.namprd04.prod.outlook.com (2603:10b6:806:2ce::22)
 by MN2PR10MB4398.namprd10.prod.outlook.com (2603:10b6:208:1dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 23:54:15 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::7f) by SA1PR04CA0017.outlook.office365.com
 (2603:10b6:806:2ce::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.17 via Frontend Transport; Fri,
 20 Feb 2026 23:54:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 23:54:14 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 17:54:14 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 17:54:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Feb 2026 17:54:14 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61KNsDuY487308;
	Fri, 20 Feb 2026 17:54:14 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [oe-layertool-setup][PATCH 2/3] kas: use repo-relative addressing
Date: Fri, 20 Feb 2026 17:54:06 -0600
Message-ID: <20260220235407.1064734-2-rs@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220235407.1064734-1-rs@ti.com>
References: <20260220235407.1064734-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|MN2PR10MB4398:EE_
X-MS-Office365-Filtering-Correlation-Id: 942fae5c-b2df-4173-9d06-08de70db5a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PsoQ1IzFS0XCwy0wBXUwqCT5ZZ5S8ouXC3RU53iImRD7yl2OssfnsS8cTwgm?=
 =?us-ascii?Q?ZHGV+pl40Loba6PiExb1K6CvYr4VY6CqLSgvP9JehWKjz/CV5Am5MJ4t1KsN?=
 =?us-ascii?Q?8oSEo7Hiu8ZBYAH58uhWmlftcw4fSI401h/J+FBEL/forYagHokZ4gtyp1Vw?=
 =?us-ascii?Q?r8uxfHZJ+HIxOkqEdYZOUnEGHPsuD/jyAwJ/v+jmluuoY3HGv/9ihrSJunBQ?=
 =?us-ascii?Q?gpolUYapby7TQIQSVLdrRRiHtLM1i1F2qLBUC0V3WrhcgS3a2JksWJMxlVcP?=
 =?us-ascii?Q?f6ugBuBQHQTPb8lNcK+HKcxKEUg1+zfkp3+NYJnUl+bzvjsf9tGb9YqwocmI?=
 =?us-ascii?Q?+tJ1kN7lqlz+Zj5GavDQ0GK9NoCvMhJf2pDeSxP4sdYGrHm6SZ5tMASXJqoV?=
 =?us-ascii?Q?Zjb9ElRBkxQhsi5NRgdq1niIbNTRv70BLPCkxEz/bhP+dzIVlCZKdRWLELWZ?=
 =?us-ascii?Q?pnM5K5L+gThIrjDucso4PgRo+gpQaOixqULimXBJGBO72KiNRHrpYG1TP6zm?=
 =?us-ascii?Q?PI3MSljhPJOb/22tl8yvKfPj3o558UMySRCD6DtW+VwGKyDnhhyZ5s8KO+hR?=
 =?us-ascii?Q?0h99eztefoKbZ9g92kGQgwsfXrkPLKFQwI5CykK0tIUQPj3via6H1B0N6CaI?=
 =?us-ascii?Q?rJF+POpJdZacai3UGDtuHHxMe0xg7jl7XN53xOAtID5cao5jhTTLIjWhC75T?=
 =?us-ascii?Q?uIhC7wLfZ/eIhZB0JYcUCjVNN2En1F+03RquvwtyOWiGtTEMNDlBYNYI7ycV?=
 =?us-ascii?Q?8YvIprfdZEkgNVw9Y4M2ySlI1JltzjTe1bGYwnXdmnyboBkJZcMxNpy18VbP?=
 =?us-ascii?Q?8okavIpYQYacKpN4uUcgUVo/BOLZGFuXXPOioiVRsDNb+QZi9OT+SALM+8Nj?=
 =?us-ascii?Q?jWc6IQNZmpc/3CR+sgqcMZRE030JFp6/J+Su5QBfIXEq9wLdsTVpyE3pdo8W?=
 =?us-ascii?Q?dlfF3itA4cdwuk1JusuteiQ1+tQ44oG+BBiz5oKRPqMO3aCxeQaZmSicKI/v?=
 =?us-ascii?Q?hC9l6EsYWv3ju+0h7937jGftR6IX98mb18JlWESVaaKp5MAcu6O7FSbQ6SCC?=
 =?us-ascii?Q?5BVEWTrriHtglhBiYHmnrksWExHb3YFMkpSdv8a2kzLq+JlLa5ASkgqPlJB2?=
 =?us-ascii?Q?s1fjkkMitopR6luXje8uRvumQQMwTlCgZZu5RX9LRYWcPzhtRJpglITMW2M0?=
 =?us-ascii?Q?L1AiyPEoRfiORG+dXyc7cekwvIKL1ZehrBIOGZp1JKHBloVzd8vtUpYac1V6?=
 =?us-ascii?Q?cQnC36y8EB9xoQ+kMBR5ks1v4tok413CGAjOA5HQQcmmxRyYMoBIZy5tYQ4/?=
 =?us-ascii?Q?Gff3FGKpFaZ1NnhjYfS2sswry4UdAL/O43nDpLBJIJNaeQ2oo0b1sOFlnVEY?=
 =?us-ascii?Q?WbgOmL3aBIgOuaKa9P4J0V5FuLV4bD8O4ghueFgLM3pIxMIXVrxCfkcud4c5?=
 =?us-ascii?Q?/j6z4C/d8ozj1khAqDiAWNrx6/KV10GkK2dcjp9UlnAjtSZnjSeuPPcq4HqN?=
 =?us-ascii?Q?qzDikfZSWbCIdZ41RwCjhITKBxnv/y0ryyedQ7KfFg7g/VfOlwnew45xKOq6?=
 =?us-ascii?Q?81ekWATuIANUU/uM6TdW8RBBDDE9UCaVW/ludWePxAC8VUBrtPAsP20dihKQ?=
 =?us-ascii?Q?xKQVydJyLHznls4l61rVaFd0HcZNQEKSOauFBy4nBhUREA2uQ+CFhlEuWjbW?=
 =?us-ascii?Q?Ubh08w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MM2C5hQT14KJFVbzSiBoL0r/+8/x8V8WKhjPio6SdOGICo/JEeeLLKDYYrKUDyD/i1IlaeXzeMxnND4MSE452lCjmVlnCUo0F+1ktw8KUuk4cOAc1V6f5ozdg+a6tZOQ2gqeDlwGEd33bnO3xT766U0W5Az9bWuZBveYnd4X+5dvuJCO6HRmeKe3hCDvmVLpdbyvv2V/tDkj+SHLfP7gpGXDctTIbfzTT1uoW5/vQU+8ctwp8sxRvf3MuR5zfdDMyjfZ2ykzcqKH1Yalai/Ot9TYhGDhRX0nlVNUilwd5IEvaQBQP6Xx07+ZnFOy0Nnhnf4OQYNuk9M/B+gMrKpsCDxWlYiijxkfuhXGKXFZTYpheph/QZsp+vSqDIzoIue7cXEGgbRbL6CqcjCZc/dKON2CGc5QO0NVIIDxOXc3naRCk6C7/gCvul+DotwHmxLh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 23:54:14.6226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 942fae5c-b2df-4173-9d06-08de70db5a38
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4398
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Feb 2026 23:54:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17126

From: Randolph Sapp <rs@ti.com>

Kas has a new warning when using file-relative addressing. They are now
pushing people to use repo-relative addressing for include paths.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 src/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/src/Makefile b/src/Makefile
index 069ef03..60e08e8 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -90,9 +90,7 @@ define xslt_kas_templates =3D
 endef
=20
 ../kas/%.yml: xslt/kas.xslt configs/%.xml
-	@loTemplatePrefix1=3D`realpath --relative-to configs/$*.xml .`; \
-	loTemplatePrefix2=3D`dirname $${loTemplatePrefix1}`; \
-	loTemplatePrefix=3D`dirname $${loTemplatePrefix2}`; \
+	@loTemplatePrefix=3D"kas"; \
 	$(xslt_kas)
=20
 ../kas/templates/%.yml: xslt/kas-templates.xslt templates/%.xml
--=20
2.53.0


