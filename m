Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB261D6CFDB
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:04:15 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61923.1769148253710936293
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 22:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=cVwJhLem;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.46, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2AgzkJrFC8C3B85Tj3mPhqN6h4smEx9KBW8aMmItMVXPbQyPU/GYekkg/ASrpc8QI6LCp4BHrEm5zZxSlgYBWQpLbmiPAs3XSHp8DDtGYfJzcYlQIK29B4MnH2SSFWJTbw3INEltCqMjObN6cxQc7m7pYWa4FSANjf3vq7tkMKPPPYq+G+p5xZ56ztyMdZ+ZlGfyZHAMOQv1x+grXuvL29ECMHOGGd0qvEyVNDUttVUcOykF8Gm1PYSBVSrZjw0FoftKf1929g9tCJpz36GrHUO/TW5S28jprZA+CH96kkPTZ22NMLFeGoFnNUmXs5FjAHrWFWG+5cLMgG55jN7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKuFnltgsQTf+NxbPKhGlcVP8y0hko4rUEzfgQuMOoo=;
 b=D0/qGcNiDMU8Sa0ZjTaMZUQBvQiIcDz0Gj5TWc75LF+Z6guAY9W0itR1i2jzRt2BKHjD/71okx36ad+JtaJ/XyXEFJzK84lYoZd8UqTdA4kzXXxInDxgvXjWrLsa/f2efbLIn7mAvjPBdDkWp6WRG0VsAdPSE272jIL+AFiUZ9rLQI5qw9/W8eHfwvwZH562dvQHVoLrwcQVrUc+5UBNQsVjnBopcqLfxXU35LDRm3stA6+k9ZyFX3X4E31WR2VmwTnLz/5krYJBIwhvcjd8zONpWLgJBCONk2j0Zy0r9//tJD5okTQtB7pzuAvk3m+HZNcqZ88qlkG+vFvgy219xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKuFnltgsQTf+NxbPKhGlcVP8y0hko4rUEzfgQuMOoo=;
 b=cVwJhLemfkQ3x9dLqHE17PHCB87E07aZKuSa3VZN6mAywovSNBpygsDwia9roVJTkJ0F4/pQ1G+l6QRzSNiBvBz7yfxaJF+bGbiw9Oy7mS4enEVJUCogr0rxeNis8vuHCMZlwZGjsL4L6jvbpf/6pS9CqWZRAGhnzpG3Wu46dHo=
Received: from BYAPR01CA0048.prod.exchangelabs.com (2603:10b6:a03:94::25) by
 DS4PR10MB997622.namprd10.prod.outlook.com (2603:10b6:8:318::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 06:04:11 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:a03:94:cafe::45) by BYAPR01CA0048.outlook.office365.com
 (2603:10b6:a03:94::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 06:04:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 06:04:09 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 00:04:08 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 00:04:08 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 00:04:08 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N647xa1827280;
	Fri, 23 Jan 2026 00:04:08 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <afd@ti.com>,
	<devarsht@ti.com>
Subject: [scarthgap][RFC PATCH 3/3] tisdk-default-image: Add audio server support for am62dxx
Date: Fri, 23 Jan 2026 11:33:48 +0530
Message-ID: <20260123060348.2493115-4-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123060348.2493115-1-p-bhagat@ti.com>
References: <20260123060348.2493115-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|DS4PR10MB997622:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e975a48-5d01-4733-4615-08de5a453959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OPFCZoyH7VPvEVpr5pI07hrt8x4Agb74e5ObwSW+Osds6r2r5a0VLpGN5voj?=
 =?us-ascii?Q?fvBcm3gJvaEh2B3j54t3nzxVh/ZOdhJd6vxrUXHdgSV4PqHZ19brIavnmqrM?=
 =?us-ascii?Q?JT9nEHnS50wRhGdHhbXy7FLc4NW5j2shmKfqmfMO6CJLFgfSW2tN/QIomMDx?=
 =?us-ascii?Q?RXqcHcbov1piVq/E+3bdeRJMgwNQ4X82p9CwIZczs/6RIftuhf7FhJXq956C?=
 =?us-ascii?Q?FtBokIf6fyxv8kLhWnp8qikbk7BNKx9ootxeCiNpN7S4Fx6vHsjG27L4LKDm?=
 =?us-ascii?Q?MPwnKDKQ84MVKZTHV4ikHYS0vsg6aRyDdY7dhqek19n/r295+f1+ECsaQnga?=
 =?us-ascii?Q?OVwfejcHQNRoCkByvMALjqSrDe5D+HWCQ2DYGgaF3duHV4IW5C1rkUw6NkV0?=
 =?us-ascii?Q?cahi3DvioMiuo7aAC8t65lwxS1N2RBDX1cMsiKW+UgbuRyExM6bPjEjYf97l?=
 =?us-ascii?Q?FMcX/qVPF7zUYLhPdcu13XAGdfvIsGM070DE2oZYZoCMYcBH32uc1VJlLX9y?=
 =?us-ascii?Q?jwLGRtISZ5KgugWM3KENNw+og8LZVwRoGdAZP2WAAi2ml0VxDcupHQlK3jkH?=
 =?us-ascii?Q?/HADk7u0HiMjtTQWJTDFt7H22IvXojVyHNo4OHpFJFeaSVkI7iJS2Dt3vch2?=
 =?us-ascii?Q?pCZsqA0XQZQwxaNN1IY3nOH5QHzrGSi1z3uZNtArgKcNsPq26G9ZxJ/Y3Qte?=
 =?us-ascii?Q?ZUfYG6gYl/AMOJUCbFUKtEDU6+hv4iHu67A907OGqojBb9xh0obp8DABvSTT?=
 =?us-ascii?Q?v6B0HRQS2WqcUg8KqPJPGz4rk3Y54T3N3ZRL1MEHukgF+RJFFJOMclFvU439?=
 =?us-ascii?Q?pqQ2c4yaaxcMU3NXIGjFigt7M4mVPtZpEXOees7t+hJ5ko/LPxyA8koSxqlz?=
 =?us-ascii?Q?PulhO4Uyf2hHMRHRA7vnKLOw9K7E6E9wv23dAngBs2vSRt7qEK72IgTPQ6KV?=
 =?us-ascii?Q?pr1+Hb1xayVgGnW+M857WfkKPvNfEyR0TPoOB19WiY+9p7RtD+JkXJgEsnq/?=
 =?us-ascii?Q?h2tikwVLIjbvxtp4TZ63xKqhZ7BqNMzL/haFJkBymEmF4s8oH2QJCUSHSLHw?=
 =?us-ascii?Q?SBwsF9+egRbL814qWU9+bD5CfPhgva4kyx6gUcolNsdcimnkoPNsGHc1WsHf?=
 =?us-ascii?Q?tLgdKfmRNFgJwlggwzncDkMYdSFf1OR9xORwy3A6LmQ8w0NDiVzPGSjyXmqp?=
 =?us-ascii?Q?y8iixh+9npkxkCp/2P0z9kFlFkJfDOQC9bbUYCpDMy1oeqSAi29Ibvg46Vla?=
 =?us-ascii?Q?BAgR+JUrdntKkp7POymJAlBDOiZ6ZY6BHMxq+ph0T0us7fgSJYjZR+Et1Bky?=
 =?us-ascii?Q?RNKJ/4QoQx+sYjrFo2hAaGAq2KxbuT7jLOPG75vVKpUyotaX1LsjbiRZ4hFC?=
 =?us-ascii?Q?Bx7Q1tSjhqNCAZQ+6V/LALjZDWRbiWGikVztWiXAIaZ/rY0aRiph3XUm26BO?=
 =?us-ascii?Q?FJXrh2BXgJW+IoMSTcXsues6EseVOraPqSgOer8gtfBgD7ppkwGPqvpkLbOO?=
 =?us-ascii?Q?xQdIfSocczdbAHcZmE3SOlDtrKT1QTq4h6fJv9pzQl00OZrlHocf7++5M6fJ?=
 =?us-ascii?Q?YrA3wW3AmioKRRTFu3vuBeNQmHM/TEPQB8euc1YwTQPTSSDB/Gst94TRCx+j?=
 =?us-ascii?Q?nf76zKo17ZVRMU4eA70dtLhEMxw4GmPtDxpigXUaVd/fSo3/5YJDPMB043ob?=
 =?us-ascii?Q?qKEgkw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:04:09.3268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e975a48-5d01-4733-4615-08de5a453959
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997622
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 06:04:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17023

Add pipewire and wireplumber audio stack support for am62dxx:
- Include pipewire core components and tools
- Add ALSA and PulseAudio compatibility layers
- Include wireplumber session manager
- Add GStreamer pipewire plugin
- Configure pipewire with proper modules and plugins

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-core/images/tisdk-default-image.bb  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b=
/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 264d1b2d..d5db6fd4 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -47,3 +47,20 @@ IMAGE_INSTALL +=3D "\
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     docker \
 "
+
+IMAGE_INSTALL:append:am62dxx =3D " \
+    pipewire \
+    pipewire-tools \
+    pipewire-alsa \
+    pipewire-pulse \
+    wireplumber \
+    speexdsp \
+    libpipewire \
+    pipewire-spa-plugins-meta \
+    pipewire-spa-tools \
+    pipewire-modules-meta \
+    pipewire-alsa-card-profile \
+    gstreamer1.0-pipewire \
+"
+PACKAGECONFIG:append:am62dxx:pn-pipewire =3D " pipewire-jack pipewire-modu=
les pipewire-spa-plugins"
+PACKAGECONFIG:remove:am62dxx:pn-pipewire =3D " jack"
--=20
2.34.1


