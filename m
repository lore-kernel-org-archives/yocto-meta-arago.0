Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45FFD4696A
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 18:56:13 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19610.1769021769573573671
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 10:56:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DpmxZV9E;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.36, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/lyLhsZTX8DEk4Si9PlLaYr6Yg0TesPZecMH8nzGHAvRtDpWVk02kHuHv7RcyNcK6hb3tfebzdfQhOh7yOn7Aj/2TAuMJCEycI6Cbfkz8MA5LjX5UfCifFx5rQogoVJhIJJXNI7KHd5SAzJ5ajIZ5zReLaJpMkEN3sCNduCV60A80OiwYXKh82VB5KJL4gT4qXRqwRTC0NBU9jDkdNkc7YjlIR1OkHPc1c97Mg5F8g8BnNoSf6FxNL43c0EwvFjwuppW/Iv88en5Gi+f4RHQLZ35b4CzXw1I2t0SYME9WWSdGTPV1ddY6gAbu2H2b7JYrGEW3RvmuwsLSQTf9UPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkdF6bCl3xDvjooS3l9+IoqpobSHLIZYCv9L/3tiXNY=;
 b=dZSQ8fQ79O8dwYZzgY8nBY5RjKkaCRJaNNSKn51dkIqDGmuSyBQ9yxhzaPOmUDeVS/LDDJV5B7R6haRkn+bU0jTBdXBQEcpLeNRPO8dYWj5XddzE1DXaayvyWMLryk6EydqsVIsARDkHwcBKLkxdGASl9MpLs5+zo1U8VgV34bc7B+eyhH3LwH3FhcbIDFbH07LxQN7Das7d2ezseOfWa2p93FdiIZI6Q1OrEb41i9fHfZ1wyuUmox+oZbiylOeuEHacnqBMMfTIBQWlLJP+lGfNhvpLeuZEp/QFBW3o+5PINLPjxZhxnrHg5+fKlJkc1GI+/63ElfkIf5m/r5iDdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkdF6bCl3xDvjooS3l9+IoqpobSHLIZYCv9L/3tiXNY=;
 b=DpmxZV9ENMjaXr2kmHUm0gaKk+4OfLTrMuO+a6MkofZhnfMGXgz4Xc/ZIaNkqm/Dtp4EFBSXl1K5zlFLK0sHaW7InWb8u+YIkE0zpAdc3tN4A+4fzhigpPEEiJczFGjmyApx/tQfYfFa22boiZaJhs9LXKwrI9K7UlvbFYTPfI4=
Received: from SJ2PR07CA0002.namprd07.prod.outlook.com (2603:10b6:a03:505::25)
 by MW4PR10MB5812.namprd10.prod.outlook.com (2603:10b6:303:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 18:56:03 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::ba) by SJ2PR07CA0002.outlook.office365.com
 (2603:10b6:a03:505::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 18:56:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 18:56:02 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 12:56:01 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 12:56:01 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 12:56:01 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LIu04k3358457;
	Wed, 21 Jan 2026 12:56:01 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH v2 2/5] arago-image.inc: Do not set inode size on ext2.gz
Date: Wed, 21 Jan 2026 12:55:55 -0600
Message-ID: <20260121185558.1330658-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260121185558.1330658-1-afd@ti.com>
References: <20260121185558.1330658-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|MW4PR10MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: e41f668e-8df3-4cba-269c-08de591eb937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q4tY82XLUaRm7XNpqpDEV1Amo73QzGPr23vGuiTmXSzd3b2y60QZjdIYCWyj?=
 =?us-ascii?Q?Y8WUPLOVbHTmZQHI0CWKsrkCYM1n518V3EDghyxmdJIo+3T0HfMqt/Mzw37v?=
 =?us-ascii?Q?2W25WYmUocAHFiCgv4gYeMoDBMmwnY3XVBdRnxboZkqXjlCPhX307zD3LfqS?=
 =?us-ascii?Q?pkJsxVig8bNTn8Mu1YzNNGIcGzDscu+m1h7I6DewOMRsqwqt+8DJ+HhCcC1T?=
 =?us-ascii?Q?3+GMLu8hD3ktSMe3mxH5UObr1lUdeSnVi0DfgXDgZ7iK+2LEph/YUQXQXFZM?=
 =?us-ascii?Q?334TevrkPePy11Tza/2M9sUgr/DPgJfZPIlBOrwpAVyF3gyZFGZJZX5TEgyA?=
 =?us-ascii?Q?v6fL8YeUErvuaQIRZQDDKo3uSZqP7mkFzpjVVWhLJPlxX7txwO8+LDaPSjC0?=
 =?us-ascii?Q?MyiY9s5b/wXUvh/a6MACVpPf9lae7o/PAICNXbPQnmMYo2tYIUyEzimdeBDK?=
 =?us-ascii?Q?3w8Hvk6ql6jQjU9zug5NeWvpkbT8Ix3tTiXIwdTvsH2sQsM73M9GIBtH3Vgs?=
 =?us-ascii?Q?ipV/u57J/rEzEnN1ddmM7yKHn32H7jCY4ltLyP9VCh2td3xDkNfgZqQCpUE9?=
 =?us-ascii?Q?26YzTAAo1GyOObTtRgNHEhOjlGcL4WLyyqLhPAPHemO7etbACQGei+QgaR7Y?=
 =?us-ascii?Q?aUNRm5s+aUZceLx/fkoeBS624IbKstiVlJw1uRmpOzh/UvLrKiml1gjUF1TP?=
 =?us-ascii?Q?uVdsxyrV2FFTLhybqiwF/LSviHLphz/oGB4nt1/1dZ4rzVqvxtUY9z7pCtOw?=
 =?us-ascii?Q?dH6F6dQ3Avls9DQwzkJ/JqulfB7B2b2hs9NpHRzNKFXFuwL+ykM3LnwILkXu?=
 =?us-ascii?Q?YZCxEXZaGDTSTjcFYDtR1YrzfRuv7eIjgFtDFUWbH2HNAqiQOZu02CtcQatd?=
 =?us-ascii?Q?MJvo5dJ/kE1YqsEkIQkF7zpkChBJUQbLZg1T8MN0K+w9hJXYkuBISJufPhfM?=
 =?us-ascii?Q?X7HYxJysG8fLX99VdZKMvgEsSUppUdB1Rg5BEwjYwZ/4aRknZI0pXyQur/EO?=
 =?us-ascii?Q?6wme2JNNqH2CsmWEPH8VJp381SeiccrSYkkJ4M68S33wzEGDVXvl+OKk0hSw?=
 =?us-ascii?Q?pUzsJQQjRgXjUZETXD4qm0Y8PFgxLqYZREiJ+fTvFbpjQBthENmkB96J+g1U?=
 =?us-ascii?Q?s2f38pO0uOi6xNzNv7HUBmpdeiQmwXpu7OYW+mwuIuz/BFvDnroMyExDUicX?=
 =?us-ascii?Q?XEzU0F+zAMhWnBlY2AFWCMQjtAojZR1C1fyDEG1r4kOywOVXlzKd7FhcN0vV?=
 =?us-ascii?Q?t8mPJh9C/k+Gg9Jj77D3rr8w27HZiafRRPwys4t2VrReB1GcJ9KfnVvRjkSp?=
 =?us-ascii?Q?J/giIiWCAIK8bLimDzEx5AlcmjXc3rrQTLGuNHIAmfeCZ9cbahjcrYdoQApw?=
 =?us-ascii?Q?3vaVpfg3e3LYRDd0s9zHAWVS0mpyzo2mLgeLXYOKOwrMBywgZxMlU6RnOBzu?=
 =?us-ascii?Q?OnDJclVKBUCHaIvk4zgKS7M6uRiAqCX71ILXM1g7FMVzg6zlP4IE+pi5LBQa?=
 =?us-ascii?Q?NkCcmyeQ3Rts1h0sJMoTRwfJQMIxzLfLKH8fxdXmxk6in5cbCO5FxpklVPap?=
 =?us-ascii?Q?E3TQ+Eyy/iSHR4LM2TDGvkvv0VYawrvjVAI7eZVoJZUr/ZU3bBt8eUqidzX4?=
 =?us-ascii?Q?RKgpTSPjCOjYT/4mqPJBWS8P5ppan06OsctTDfge0i3OqcWmhWrWqKjB7Kn1?=
 =?us-ascii?Q?3Ljcqg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:56:02.3206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e41f668e-8df3-4cba-269c-08de591eb937
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5812
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jan 2026 18:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17001

This should have been set on "ext2" not "ext2.gz". It is also the default
now for "ext2" in oe-core anyway. Drop this line.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-a=
rago-distro/recipes-core/images/arago-image.inc
index 33dca89b..f4f74310 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -4,9 +4,6 @@ LICENSE =3D "MIT"
=20
 COMPATIBLE_MACHINE =3D "ti-soc"
=20
-# 4KB per 1 inode should be enough
-EXTRA_IMAGECMD:ext2.gz +=3D "-i 4096"
-
 IMAGE_INSTALL =3D " \
 	packagegroup-core-boot \
 	${CORE_IMAGE_EXTRA_INSTALL} \
--=20
2.39.2


