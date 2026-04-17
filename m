Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E6CF99C65
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 20:43:37 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55118.1776458609633717097
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Apr 2026 13:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=liDH2Wba;
 spf=pass (domain: ti.com, ip: 52.101.43.34, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ4uVk5gfGGvM2HSGtA//bJ5lKxZKsifApWaCN4yskHLqH+R4XW7YoJ0fGHIHRLS3/tx477uTBzBHqVX0vaI0n6zICG25egPj5LCdWrEoNPhVmO8dBxjmVHpsnYM9cbNgTHYaUqvTTa2FxYGeuJeIzDEb8qiyV03vUk/uR+AG0M+r6BdJ0UPez8SQfI3qkYAIeLcd2OaaM3xA5CPuWATRgT6dEPq4kd2N0+DqMZvw2iM17q1zR3S5NK566ZZA4lwqqXX/BzYoKL/bpyqpfFVZA2felB9i5vbIk3YdVyHeDCJKHYmDCVKPIDhwKhTyZF7TX4IbveVj78XneZXMV4gKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjnY990ydfdFGgkwbGoCR4iaH5VCVJXOI+MrruWWXjs=;
 b=Ec3xd3xRarlNSYDqqztXmWpeKNf+4cmDJ8qvUnBlPEfzm/WN6Q4ewNyYHgMDe5+a1tQpA7OT3dxR2zjOxlUekYpZcIlzmcQr1lLDqe6+hRNp+CTRQv5geitHYShjntNWqWZBlevXjHbSZQqLTfLY9d1u35qiQcS2SnkYiB2+ok7PPysI1oq2seNh5IV01XxJkgC8u/zrqY51+sEMqAclQoJp4h+EqlLhFub7iDsYftKgwc7QlG56mZ0u0hYJ0GRk6vNRVTcDGLhM/+D0kTZ2OQJDo/30pI5W7dNxE0oj/XkL5knaYRjkwKZkpYf/n5zf/2KlfZTKieBFypBiZYGtEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjnY990ydfdFGgkwbGoCR4iaH5VCVJXOI+MrruWWXjs=;
 b=liDH2Wba8p3sngg9MLggfnAiaxOID1UuUB0ZKc0qLqmB3IrCKBoYWe/YyKm4gn9x0VOsLVDdrdZrXhiF0Zb6DatI/FYCisq1gdXtyv8i8B6axRIQs5QrRqKPnn0fcJ8EsRIGluAtdppApfHnRLlYo2k4XL+OyoKQVpoACrOQxTA=
Received: from CH2PR16CA0007.namprd16.prod.outlook.com (2603:10b6:610:50::17)
 by PH3PPF553978BD2.namprd10.prod.outlook.com (2603:10b6:518:1::7a1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 17 Apr
 2026 20:43:24 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::cb) by CH2PR16CA0007.outlook.office365.com
 (2603:10b6:610:50::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 20:43:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 20:43:23 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 15:43:13 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 15:43:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Apr 2026 15:43:13 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63HKhCLu2596995;
	Fri, 17 Apr 2026 15:43:12 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wDq1w-0000000Ax81-424W;
	Fri, 17 Apr 2026 15:43:12 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] arago: Bump DISTRO_VERSION
Date: Fri, 17 Apr 2026 15:43:12 -0500
Message-ID: <20260417204312.2610561-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|PH3PPF553978BD2:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f555c3f-bdce-4afc-8c2c-08de9cc1f7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	5AYy0j/BUNavolizlV0WNRiMEgjJQJdk3LeDKgBr3LMwfOi29FmS1h3YKHcr7OtpjD8gP6U91t/wWF+zFOKAM/Li87TLA1wLLPQMvWYbdwaolFylUnV0FgSHXW021X1oC8Mh1dCkV7XVNV4gWoM5QqrVL34+W9pxeHNdU27GMLxSCwDrI+Rk3pjZk7ZYLJV5jM2UjHSgX6Rd7Bgweqbv3RWZqhMhdR7TPVt6p7Z6L3/+YM6ig1yxGIEU5PbueXDZ5sD7AgoO6xmYq/Tcz1d1rSw79slD8ho4sWCiR8POOgCz+87MKRu2t0fNQ9npWGgW8LzdkK2/VKWYNwqKRWmsQ760OqjYYgBkXb5ssR6I4xYK2u9JBJwmghZ/73B0Ro3YdFXOVMc4MG041fDgjPYTj7jKfH5pj1fxHpVuVqqiLKvKxQmBxUdrUXr3NQyQxP70xLxpgXVfGY1CnEBdcOePohIZq2xpjQFrsrnwDwi3mKIjP/PxWO4gg5bq41iPKmBo6oQsEQxzP30b4JU1jMIA68lP/3AmXg6fsvtY4y2dMgCFrtqePmnFAHBjnDr+UK0w1GaF09xnrjFzK1mo2NMTmNNmm8UUD43KwXI1lWJDNS4mn8rN/TiNb/SqYYl4AHIO6RLYS9rjBWxLgFjFWrO4UYkcSzqKCfqAyBLSeuDV9912Vw2rVkbc7H3I2UOdNf2KU6nch5bMDQPnTrGQW9ybSRzfIPCmn1MSGeozA//Prxo=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tvL1QAMbR70n7LAm9gUZnAkHH7A+a6E5yOKwSMQFAzoYv6/LUDx6mm+80WU9FRgRazV2Y3Rtzm6M/PkOmyvpw7W1YnF6t0+vmavLAqvmmUQzzroSc7k3UOYAN960Y4Hky08CwEPVD7Loqg+qPrnFgi0u5WuHEq1WdAlPa7PqTW0W4FZKjJyOZToh/oX1PnhlTNBUXbLNoX92no0UL85E+2/Q0yuN66nC6EZUJZsQVDLYchl0kjnTgBy5ys2zJKUn6V5EHq69b0NbonVclKH0FiVZu7qvOxFsaE3Av94lWWTlIylsVfvBR6FeryfW8sGWa4pTer8Fl747o+CP/iMmG6s87cOnY5yxqO3xCwWndbpUexjB0y2xAA0vQqbaYlxD39856X+S5tqEIM6KQu9uK8Q6AcVYcD+kIJIydfDZEoRbLRmk3SMVsXsTI6Zv07+8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 20:43:23.3888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f555c3f-bdce-4afc-8c2c-08de9cc1f7e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF553978BD2
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Apr 2026 20:43:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17472

Time to bump the DISTRO_VERSION to 2026.01.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index 42019272..02d8c954 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,6 @@
 # Name and version of the distribution
 DISTRO_NAME =3D "Arago"
-DISTRO_VERSION =3D "2025.01"
+DISTRO_VERSION =3D "2026.01"
 DISTRO_FEED_URI ?=3D "http://lcpd.itg.ti.com"
 BUILD_VARIANT =3D "${@['prod','rt'][int(d.getVar('ARAGO_RT_ENABLE'))]}"
 TISDK_VERSION ?=3D "live"
--=20
2.43.0


