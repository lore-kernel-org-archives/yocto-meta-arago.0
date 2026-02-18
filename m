Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307D6E9A04B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 05:57:49 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6349.1771394266443314252
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 21:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=uZlswNtf;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.50, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TN+BgB9wv1e7cpFmvA5vVOkh16Sg0uhCfHC5q5R3Q4ywRV5Cz0/agcutAQu3oPfXiQhVYieTgf3++T9v5B2fUETBV3NnqQLuAIILGQHY7fv9PQeTcMHaBi8niHBtTM72G4WkYNtWg1u6OlaYjEAaG7qUUXek8ae+qqs7zbgVmFa02WknuG9z9DRkPixlf2u9IRfAN6G+iit7BVJdi1bBRiwvIX7rm/8/2XslW0vxrFuOAQWalUPmNIJAHCp59bM5fUxxiVMJn+vgR2VnPmKaTi0SrgAUyLlMPBP7+amnRX+5MpfE6R/cX2X9AkM+hQXLQ3enhWRJ598OZHMujyfhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c63vV67VPqpvZSTkHM/unocsf3c5xc6kr1zEbf9x7uE=;
 b=fFgyVN59g/RUFFM1agbavX8CgQ6FQGCkEGMHaCnjjZpcUVWWI0wDQwq0gOIAf+c3gGK1pB8k1GAXujOKXJ7X89wvniIvVH74P5Gg878ZXAAKlb6gGGDmaCUR/VE3pEiqxT3U/qReI6TZvje/OzaQKmE66fsg7pgU1veKGm0dr8YcaEYMHYPiHz+s2v6X1yETughMVLcEvwcshYp4eseE/g+qPNvrY/r20QZa1A6rpWBGIbpKGI0Wj/VpWfb6LkE9GtDyF3fLC67BugdsRJVK2zWJ5qaOFHcWVH5i7NZbifhdHfwc+Py8JdOuViPxoHWM60q6ZKHHr1tQMTAR3SOjCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c63vV67VPqpvZSTkHM/unocsf3c5xc6kr1zEbf9x7uE=;
 b=uZlswNtflCBZCwMZN5NjI0rm+sImqCdImnSe+n2w4wxMTb0/3MG9SNHDGXUxIniIMhyIX0a4BKZTEnp/Q9jEIbJlg+7+694B+Yqel1HKGsbi+qJZWiQccddssod1lepvrk/URBof/OfUwaydv8kM9VJ5KHmkn0VpHY79VrYmnuA=
Received: from MN2PR02CA0018.namprd02.prod.outlook.com (2603:10b6:208:fc::31)
 by IA1PR10MB6121.namprd10.prod.outlook.com (2603:10b6:208:3ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 05:57:43 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:fc:cafe::1c) by MN2PR02CA0018.outlook.office365.com
 (2603:10b6:208:fc::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 05:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 05:57:42 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 23:57:39 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 23:57:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 23:57:39 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I5vbxR4084129;
	Tue, 17 Feb 2026 23:57:38 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <v-singh1@ti.com>,
	<y-hegde@ti.com>, <j-sahu@ti.com>, <khasim@ti.com>
Subject: [master][RFC PATCH v3 3/3] recipes-core: arago-default-image: Add pipewire audio stack support
Date: Wed, 18 Feb 2026 11:27:15 +0530
Message-ID: <20260218055715.219075-4-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218055715.219075-1-p-bhagat@ti.com>
References: <20260218055715.219075-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|IA1PR10MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e72d39-bc33-415d-26d8-08de6eb2a144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vqsaSGgE2F7n0dzssfIubBqHdVJd8cYhgpiEldY1C7NKa4xOMaHQ2KGZskx/?=
 =?us-ascii?Q?J2tz3Z1v5WkwAIDPkiVF/jFUBUPXwNxr/UTA/G+o5xaZcDi3fFD6bzIajBDz?=
 =?us-ascii?Q?tmhAvtAt1VnyljJubxTrsbISmbIPAPiNCn5KlUlGK2ebowXH80NuSJGB8YYq?=
 =?us-ascii?Q?vU8iH1i0Fpm0blbjWPrgkHURQiMy4icZy1/kid1lzfoicZ+x3uEMHtY6Sgl3?=
 =?us-ascii?Q?skp0N62WQVWBqIkFBcyJ2tqcAqMv2EpV8k1RrIEihP2o8XiBZ8OKKN08qf0T?=
 =?us-ascii?Q?qlEOW0p/BGI0ZTBU0EpCOevZfZNXJXJz+rcREOuFek9mA5vH8jM98KjF0mX6?=
 =?us-ascii?Q?LUrKc4nb0aFU9eRKlzonK3hllUSzh8wF+6hXG1tcofbQnYnspscWFFehfXUJ?=
 =?us-ascii?Q?/yT4MqMWiLrWz08hCrEgOqHRsAhQ/PXXTQudqeCkpRJgmQyoGDuBt/4B4Ziy?=
 =?us-ascii?Q?AX/Nt2uFp++OwJmlKm9Xiq5YaT7zwJFQRNNkKFQxXYIa6Pg64l0NKT9b/6FG?=
 =?us-ascii?Q?BzGC/uxJ8POJUxdEeb0Ow9uqj+2Zb8f7eJ+Lej5ojhWsYVKQhFU8pFqb7329?=
 =?us-ascii?Q?2IQcv9R2GEtrHeb0rSwLsoJVBWXxGMqx0iffaL+S2/T6Z+QdzczscBFVjtGs?=
 =?us-ascii?Q?/FYOAvcF+NhkKoHktsll/6/4wAX46ZWB9u2p4xsyc0ySG2MsoJQ1DXsvsIQO?=
 =?us-ascii?Q?Vc0Na0e3qZtRZzTqSkX0I1IAVvH9xFRyHUJrbDNIzYxJQ8EAvy8QyMmVhb5C?=
 =?us-ascii?Q?z5KUYHrLaZBCidYQIyka8Gf8sZOCsQ49c/xvecM0fRIslJiWX6Qgx87jTcg4?=
 =?us-ascii?Q?DLD0i1ogDJ+P6LUvJ1loLfAOv2zrmiFeigdTVKizmQUrri4q+aeuu9V7kZmw?=
 =?us-ascii?Q?OlqmH+eYTIWX75GNGxRNH7MoaiZrK+C1GyvR4mMdZ7yiiO1n+HYU18c+DRBk?=
 =?us-ascii?Q?nWw0TFks6E1fprAJ12vCBv5S4PpuZu24okgFH7NWaOMkMi36+D2LvlBR9bXu?=
 =?us-ascii?Q?CmCr36U0lac2CsN3w9zVrMDtHtlhO+0bf2wzW/U78WF6HnccqUNM6B16qs3B?=
 =?us-ascii?Q?HEcgimSFOKKMGdgJXcds6pa61GfzwKJvmz/sr6QP6uVm5g2Z4OzhSQiJ98zy?=
 =?us-ascii?Q?JU/MmIHJoRul7ZlJQJaBjbxunL2VwD9RHwd/CmJZTKKYqXejq+fHKVP6463J?=
 =?us-ascii?Q?QEP0uL8NI6DRtGm17wMJ7VNp4gfLkhnbrEqN3HcWabMqQqZLMQfTPgLPnjXC?=
 =?us-ascii?Q?krX9o8TMKKdKLalxj3EaIVI55scGzoh7x5CX3IWPQRM4IL3UnBNa+3ZyVXoY?=
 =?us-ascii?Q?VaRaIgtDf4ilVSux/0TyXt7P7qu9bASSJHypK6byDXSZ78F3SseNckQhJesT?=
 =?us-ascii?Q?Fi5FhPrw9VGXoEE0x/7SiDcx9+tV+3ANhXcHBjQwDbT/qLL8MSA5CIM3GSua?=
 =?us-ascii?Q?EbhZQwXTkXBBqYVAHZOVgVfV4F7TzzJ1BrKTD5ApcO8yAQ5bLnE2gmSqeFPe?=
 =?us-ascii?Q?/3OG2c5j8voyn59Hk4OTPcEcG98E+2hly92HPUKwLTpa1yyo8vwCf8tuCs7Z?=
 =?us-ascii?Q?5y5KdmVZ4ky6ZPr/5COiO34gKRfgCE90cAnC4x8LYusomw6EFJHpZt77cINm?=
 =?us-ascii?Q?otssU3Q+KZcxK4g9/dxOioaVOsloQr853VIHrfL2nXqVjLOqrRjLugLUuKmM?=
 =?us-ascii?Q?Rqh38g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pl5MZo4K2HIGv94kKuI7wKhl8l5N0vYA8ZnztvTsDZZJ3hHUieNU6M1OwQXkkWKX2/mF1fMxj+ROoP2cEgsIw/+12gClzOMtiGJISE2B74BiEpzOAUYJbOb9iJAaC5+5iY/MxQxjuVYaUArSKnvmyw5VCaqzbxqFflikYvmglOC1txSRSbF0FI6ysO7die3VPV0pZ2hcyC8zq5QLM4nPuPiEJsjz8KGURnvjLzxhrRxn7Evrk87a8bYOxBfjhlZOmTvsOgrEbO6k7OmJj4fge4kwkhEWg++qbCrtmYMCro0GD0cLaIWUHotmBs4Fd1ZCkDMUq7MLsJdFI3uPNq1hwpJSN8J0giMP6yxGNMsE0e49u7SSSMKkH93Bw+/OtfsnBuG9OSojrSyhu3aGnCqpfp30nM6y8qY00dXZ/TGsvhnpoMVtIlw+ymajVThSe2K0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 05:57:42.0825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e72d39-bc33-415d-26d8-08de6eb2a144
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6121
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Feb 2026 05:57:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17118

Add pipewire and wireplumber audio stack support for all am62* devices.
- Include pipewire core components and tools.
- Include wireplumber session manager.
- Add GStreamer pipewire plugin.
- Configure pipewire with proper modules and plugins.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../images/arago-default-image.bb             | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-default-image.bb b=
/meta-arago-distro/recipes-core/images/arago-default-image.bb
index e01f7c2f..c965cf16 100644
--- a/meta-arago-distro/recipes-core/images/arago-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
@@ -43,3 +43,26 @@ IMAGE_INSTALL +=3D "\
     ${DEVTOOLS} \
     docker \
 "
+
+PIPEWIRE =3D " \
+    gstreamer1.0-pipewire \
+    libpipewire \
+    pipewire \
+    pipewire-alsa \
+    pipewire-alsa-card-profile \
+    pipewire-modules-meta \
+    pipewire-pulse \
+    pipewire-spa-plugins-meta \
+    pipewire-spa-tools \
+    pipewire-tools \
+    speexdsp \
+    wireplumber \
+"
+
+IMAGE_INSTALL:append:am62dxx-evm =3D " ${PIPEWIRE}"
+IMAGE_INSTALL:append:am62xx-evm =3D " ${PIPEWIRE}"
+IMAGE_INSTALL:append:am62pxx-evm =3D " ${PIPEWIRE}"
+IMAGE_INSTALL:append:am62xx-lp-evm =3D " ${PIPEWIRE}"
+IMAGE_INSTALL:append:am62axx-evm =3D " ${PIPEWIRE}"
+IMAGE_INSTALL:append:am62xxsip-evm =3D " ${PIPEWIRE}"
+IMAGE_INSTALL:append:am62lxx-evm =3D " ${PIPEWIRE}"
--=20
2.34.1


