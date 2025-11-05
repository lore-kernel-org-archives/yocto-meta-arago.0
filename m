Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCBECCFA18
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 16:07:47 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13283.1762358860958107921
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 08:07:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=HKAcRu7w;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.71, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5RTBtzbDuPv2kNdv7DIrqo4TmcN/4cGG5x/tN7egcEJ0mPwsO2wq0VViFFWWPn2uVC8lx3+oX85yQ5x0YNsvPgBD6i3n0DjPBbykyktwcrTMi6GPNYncP2f1PRWVqn+PPLNKlfkKH/9mt96Y9SUvF8kN0wCJ4tH2Ufpu8wa5Rg9XBUumzrAK4UGad8GiFGZsP0d/CzVhCW5hlb1gL0+OjgAV/HQvT8yx8AV16eeUXbM06a8wJw6strt39TCLNrL/V3nq2qF5rY6H86BbelqKEfHe6JCir56reTwVUpB5qw7Meta2f0ovbKleJmJcNsGTPYzW9yiKxPUdN+tl2MFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcejUfL2efEl0cz/k4cE39yuW48a/O8musnD84hfMd4=;
 b=EfAWu/xlBmW/8xSdfrfASYUKvrp5TZGIwncAEg2Rojww0MPhPPM+GdwAlbeCXkxGHLXWv4tSjjcRsXUeYqMN0yycnzZqMKEGqQKbuwOK6qraHLIc+53A8DBTsis8ejJbfZKsRFILuSk7ETJ/4ksvvbOsKrGwsZKDBhEw9Bu05lKujbW9WsDTPDdHBg1WrSY3yRGTu5L2+nkmzItuXzdgmeXeWRY2NpjuOiGrOL1B8UhG9qY/DPkg0xl5jzMAbV0SGWoxwmu1v57wI7HxVBBHDnejN2iHa8bjyWV9o74wG0TBpfvXuYaEQE/drMLYOuskZGkFs88Ya8NK+bxSokGzvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcejUfL2efEl0cz/k4cE39yuW48a/O8musnD84hfMd4=;
 b=HKAcRu7wmejzhQTbgHxqd4s/48u3GmnR1nMIbG3q5tp9sQcx6xfEQ3ytcP9r0qdZfxKCBHnHAMxzve9o8PxusRNqvkVZkZXoiII4M/0+6APhXH42I8ofoCLdyLO0lxEfROiHZSmWOtgIRlhU9ggUS6CggXHgX8qDocqvzlk9OiI=
Received: from SN7PR04CA0100.namprd04.prod.outlook.com (2603:10b6:806:122::15)
 by BN0PR10MB4824.namprd10.prod.outlook.com (2603:10b6:408:12f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 16:07:38 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:122:cafe::3f) by SN7PR04CA0100.outlook.office365.com
 (2603:10b6:806:122::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Wed, 5
 Nov 2025 16:07:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 16:07:38 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 10:07:35 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 10:07:35 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 10:07:35 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5G7ZJU3930665;
	Wed, 5 Nov 2025 10:07:35 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vGg2p-0006Hp-86; Wed, 05 Nov 2025 10:07:35 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/3] offscreendemo: Add REQUIRED_DISTRO_FEATURES
Date: Wed, 5 Nov 2025 10:07:33 -0600
Message-ID: <20251105160735.24123-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|BN0PR10MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: faf39160-60a2-40bb-497c-08de1c8570dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bW5FjAhTyspe+8UZj607iqyrsuCqx3L2FfqLJ6x2O3bkoVwcaFWGMwZylcxf?=
 =?us-ascii?Q?ifyCNq7mPolTZRf+JoKL2kkBEXpybPEHbI/6DfcJaJ3OIufroWpT8TcTf7oS?=
 =?us-ascii?Q?cO6qCcnw0hSXqiebnpgerD1UQBXgHyLdHFeyTXD/7gMJaACxWf4yMp5Tr0Iq?=
 =?us-ascii?Q?gl7T6cbjQ/N7h9a+8Qi5F8WpfG+QwVSGnk6ea3sB6r5zwL9dGFTi5UTVf3Wl?=
 =?us-ascii?Q?EwmuKhT2Z8vHsbwrnj+wyiQpN2YgjK2zsXvpSAWRaxUk+pLzyJg7ZMwbtmt2?=
 =?us-ascii?Q?7dGg+cXkNyaaNI2Cx8sh4uhiCDInAT4wmaQh2pxrNZoLkEIUV+tcXqcLdlJH?=
 =?us-ascii?Q?3iKS1JW6pVRS+kUvPYp1qneDgUdXrRZf7Id26Zgs2IyLwSMDf0Ick6zLoZHw?=
 =?us-ascii?Q?ZMZ6eS+MSB/fIcqiUx9c5Qseqs5worVlFKZC9CXbZZZg8IC97KDKmiw0YPcT?=
 =?us-ascii?Q?fW+Wrw+Zt0X8reZumOzQpgt2MRluMPqxpP6W+9Il6c7vLl2HDxt7lH6BC6H+?=
 =?us-ascii?Q?NPNDySU6g+bFOxzDm5DeZElfabAnn0yPoI36IqVqVVfE+eDfLh7UcDoCXusp?=
 =?us-ascii?Q?kg+CklHmsgO6wJM2Jopg+7x8VxNUBkmoGw5hSStYSy0hnJkN3dwuMeiH6ebd?=
 =?us-ascii?Q?erT69d3VPF7ZeBMnnwwn3o7b4XpcuYqPbDkodX0qJG6KzN2/fxCUfLH+QvIZ?=
 =?us-ascii?Q?TI+shg4aj6XuCQDVKwhtUxJufjDYnsclhOkUnOWJPZs1BFu7g/kS3X+OgLzH?=
 =?us-ascii?Q?0OVkzKqrBeuAfRrMP2qI8VkJw0Hzh12MiR4J1GK3F//Q50lIc9ej0fAiGMuv?=
 =?us-ascii?Q?W0dsZxRh2FSiVQos36DwFRcGBpeaDTfplEQkPjTY/PjJcAksnti1uzvpCMZX?=
 =?us-ascii?Q?1W2BTyewkGGx821px8QCo+SyYJTjh3sU1NKPU2ydK0vHWGUPte2IJtIPeYUi?=
 =?us-ascii?Q?FTOrr+OEHFNAZfrC/35rMCJHmsZklasqthU41Ne2ZDQfF/qct1Fmec5BLxiC?=
 =?us-ascii?Q?E65g3lqfc9p1NFdzrCkECfUcYIGlFcKbEToH0VEM1g66wwCZO4F/Vit+oOwY?=
 =?us-ascii?Q?Fnsq9YryxoC36VL0FQGV5AU4YXfYO3+i2lYBsCxyOk3jc9KccEg774RbfLpT?=
 =?us-ascii?Q?oWWwJOcSYqfApLy4dWHWSMQXo7MC9couDc1sk4uljr9abWxKMzHcypcVRfdc?=
 =?us-ascii?Q?Ys6tb3Q3FcYs9/XV6I+sR0zR0rYLFdbfap3lMDMHvodquU5m6huYpJPiJBg0?=
 =?us-ascii?Q?Qg+Sj1BFGaArg1WwAUkC2Vv5qFZVpvmSI9VwBDh+I1D86I2e7MdXmqzAyXYO?=
 =?us-ascii?Q?vbvZNCmqBhE2hhE1P13/DWYwptGyd+QLPdog4VDMuDXsHo4Fun9BaIfWjIia?=
 =?us-ascii?Q?5rfPVfyHvfItEYnQV4pahZ3gvJbhTKAkXNlLmGoW6QlVFgi1tp4u3Vh3mMe5?=
 =?us-ascii?Q?qpAU0sgACn3wIDL7jsYIglfZAyzMQ8CKG536TiTWjYg2O7fOSENGpGCxHXdP?=
 =?us-ascii?Q?8AF1w+XBZd+/1q9m3USJ5JZbCYIttsoRImDYUbAP1BEsCq9pJGF3fRpBFdrD?=
 =?us-ascii?Q?LXEjXrkLUtkIgb49xbc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 16:07:38.2743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faf39160-60a2-40bb-497c-08de1c8570dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4824
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Nov 2025 16:07:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16722

Since this recipe depends on virtual/egl and virtual/libgles2 it
should be gated by a check for the "opengl" DISTRO_FEATURE.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
index f416b112..6dc0e526 100644
--- a/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
+++ b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
@@ -11,4 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
 
 DEPENDS += "virtual/egl virtual/libgles2"
 
-inherit pkgconfig meson
+inherit pkgconfig meson features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.17.1


