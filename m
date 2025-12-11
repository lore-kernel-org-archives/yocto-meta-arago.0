Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0F0D43356
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 20:52:23 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.775.1765486339632397047
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 12:52:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SKteflxg;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.38, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIRwlqk04YLKGsPiIuB9XQF2NNPyIo3MFBC5yVONgmUz71d5nCNIiCdFgDamN+hpD5iQ3o/nhgI5B3zUDmi+7k+WOPlvzWs5YeOo/SrrZiTd2EQrXqZc13a/og4w2A/xuVFZQ+G02vNRTL1XNuThRpdY4NO1SmA2mpfm9hnWL+JkhYfmX7lrQS6QsjYYfQg6F39SOiNMpBRHI0iuPlOQqicStRjVYhSKqMm2u3nL6qkf1nXziLbtKvVejCIL0RyuKPVWbFtbnyey2TwAsJLbmedgeShV5boixhAR8PP1as9NicVRxrT5jcFnXojP2q3o8Hg8jWda11NvQQ75j27UnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APVlfPSe///HpJxQb3ZKESSN6Ns/E5rgGk5ABf8J3xI=;
 b=cVM2EMoFDVEUX1rHEm87HSArBrS1xQtv/wxSkuvwMO8Qo89nAuZYoZdgMSqDgj/if7N+UDIdsss0JawLmxJW77JTtxyCgPwWvVTI7Ng//VLLfyq0N0FkqQksrg3ydRMLUi0YuvzaGPsxb46irAb+IGV4g5eGrrVcKByOvn04OQC3XW7A9igWQd95PoEuBMkk94ltFASsxpome/WLvl2GKi0jeoRpOvoNcdvsKBQP9lvn5l/+L0BuLgMPdn9jJ7B1m5j9reE2MxQSEZewarpCDWVTfXwTYprk21Oat11cG4mhk39JXFRjIJBQH1zkKkTbbR9vUTq86lMnJpxY3Q3G9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APVlfPSe///HpJxQb3ZKESSN6Ns/E5rgGk5ABf8J3xI=;
 b=SKteflxgk0YE1RNu1IURsNowlx73eOJMwFpwYy3iUcD6QkF/uh2erXlE98mL7in1/V5cSFJkF+OJuPgVkXNYoab4ywoDNNSor9uyeE7o0WNSL8YqOEgimNsi2y49y/18JyNbvMjGmcwiUIY9ZXHFOO7Ji1qI8alWlDMVU/k5PrI=
Received: from PH5P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::15)
 by MN6PR10MB7492.namprd10.prod.outlook.com (2603:10b6:208:471::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 20:52:17 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:34b:cafe::d9) by PH5P222CA0011.outlook.office365.com
 (2603:10b6:510:34b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Thu,
 11 Dec 2025 20:52:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 11 Dec 2025 20:52:15 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:52:09 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:52:09 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 14:52:09 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBKq9Vi1093924;
	Thu, 11 Dec 2025 14:52:09 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vTndx-0000000HHXL-1CQo;
	Thu, 11 Dec 2025 14:52:09 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] branding-ltsprep: Move to ti-6_18
Date: Thu, 11 Dec 2025 14:52:09 -0600
Message-ID: <20251211205209.4118948-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|MN6PR10MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: 653220ee-dafe-41e9-e912-08de38f72aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GKSXlLa9uhok2Gl9XXD+wS5QOC960qG4OB+mgXnmxq4LpOD9RYP3KqDN8ITU?=
 =?us-ascii?Q?OiHbKprxxWDZ7KpA8DQdZxiqzpSLoKo20rLocMWq2eRaar/hjv57ALH5SrDe?=
 =?us-ascii?Q?fXDZcAy92eOkM9ZKCa2GnwGOLq9RL/dsdmSY580zQaiwSRhVoJ6D3KTQ+rNa?=
 =?us-ascii?Q?4J1toGJI8EyEoCfRHyGhGu9I25nQP04zoJFTTGaeREe84bRmCCrcrNpPzYvs?=
 =?us-ascii?Q?o3c4X5FNgukUeoAxOYb/snPUuVxGbKNc8fDpUQBhCrsXWZ9vRjtvdemBbfzo?=
 =?us-ascii?Q?GIc4TX7YwnSnEoVu0BEkbvEXLAcmz0sLL0tj1JCzx/njL5hxsRXWXQ7gkdMz?=
 =?us-ascii?Q?H2m9Lb9KxLzRN3Rd2lAufajH9Ce2zaEIUJyfq4DJr/9R/bOv1IjHVqtiw+S4?=
 =?us-ascii?Q?zswH6u1sWr1Aoz7FZE056ltu2e2z0azi0uD7nMHvng0Av0w0xUsdjFXUXc8P?=
 =?us-ascii?Q?AN3cfAxdPvUzkpqfEPuwVtVmuz3/sWd/fOuwNab4Pd47qGjElITDsI2JMqRx?=
 =?us-ascii?Q?EbGXu+ywUzil2VJyqj56xLyKxGqafJfYr4wLgLjXz23zzpoEso4xElZ+xUCS?=
 =?us-ascii?Q?jNXFciPj15J7J6jaKVGpYU5K3TE+urlr1jON0IH+V0fCnaomfgsAedGiKFF9?=
 =?us-ascii?Q?IauECs5DipHgOJdrvoZDAiCHazfzPQx2/agApj3eWu32WDvucafJu0lwcrjh?=
 =?us-ascii?Q?v096DmRfky7d3hcZWAqLefnL2BgBu7kYfvd8v7Xh+1blxKSkhjyJIy6Cda0/?=
 =?us-ascii?Q?v2ll9G/d7sU5KbRop+z/+vi2kXiju9cmZCShljlu4iMluFhg81UIKh3uDNud?=
 =?us-ascii?Q?bE4x3AmyLfZbuXatK9qiDqMIj/KKWuVdl5j7p5hh59IFbiiTxCMosEcEGOUc?=
 =?us-ascii?Q?Kt4CJ5pVoo4rXuvRqduwbCrplXcysF/B3ugw0GxFbNxAZtTBwPPYgHTzqfxx?=
 =?us-ascii?Q?pXm2fKOViJ4UC55EkRgw8SWy46meYmUn/hdlqbLMFzdoYOXTKBVuksoZ1AKE?=
 =?us-ascii?Q?Ghd3tB3ARq1PsCH2fAwYcOstDzlq8Y3ewDPQxA2CkchuyiGdmF/yRIad5G/9?=
 =?us-ascii?Q?3VAbfung81XxnshtnFPwMap6T8LVx7ftXY1qZstx+NQYiKfZtQhxPlleWShD?=
 =?us-ascii?Q?8DhCDrNbc/30/A6lhOdzyUuJup7i+WnXFk2ioj1kEp4LPbFhW2uk1VzxF/Wr?=
 =?us-ascii?Q?1URMAuCOOrhPQxiavycFbYIpWcD5BNrylX3mXYopPM5PNKa8onu5eApCk+zK?=
 =?us-ascii?Q?kHifimjf0DgoHL7zzdRDmr9oe8Rj1yWK4iou5UlWlskf8jcxbTlNblho3lU1?=
 =?us-ascii?Q?8dY7tbm8nk2EXyb13TA9ibCbmAqauGTZOXnB3dQQgj40ptXCm1luBjdsqjDt?=
 =?us-ascii?Q?Sw0nCfl5yBNqF+47CZ6T+ZMJcXtiUkNmbFCt2ttnolYpmsQmBDlAMNeqgUNw?=
 =?us-ascii?Q?hAoM0TJ/QR2zvZ1OHk4twzcvndf7mh5Xiz1swqE++i4IyPH/Rg63IJkmz4Wj?=
 =?us-ascii?Q?NNqcOv3x85OyuvmADiOz1hZL/THXTU2G95OGKpFzfLTaCbFP1DEqe0zWXA3U?=
 =?us-ascii?Q?VEfTIGMdviUJlSJxZdM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 20:52:15.7348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 653220ee-dafe-41e9-e912-08de38f72aba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7492
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Dec 2025 20:52:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16887

Change the BSP over to ti-6_18 for the next LTS.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/m=
eta-arago-distro/conf/distro/include/branding-ltsprep.inc
index 21e33662..c018d9fb 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -1 +1 @@
-TI_PREFERRED_BSP =3D "ti-6_12"
+TI_PREFERRED_BSP =3D "ti-6_18"
--=20
2.43.0


