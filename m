Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D421F9934E
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 07:54:19 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14717.1776930856944351397
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 00:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Rv72YYd8;
 spf=pass (domain: ti.com, ip: 52.101.85.46, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8WKEnEu47ky1ryo/vyBQtCjdBQZyDgv/Vgvz0ZtgksgKQ/iXiwOTURakoYEx/rzfYMZypVbnhid1udLjmbldzE/Wpi6o8Y2jOZZf4R/mZ+ZPBR9earHVqDCuc5WibJR0ijUbYqTwmZkiDxc/caSixHGPJ4GFZ+Q1Ue3/wyg+zUQKCxHg/1xHF/EdiWoIc/ii38AhpVmeBqO4iAGqAIoK/DWsulHDYKT9sPYWUES1lZyd4XQAgg6WRktBN/X7eR0EbUmpI4z4R81Fc8Zf5KVwvg6GGyku0ejFbykg2cZHVA4ut6FpMY2RvZv3OL/ZelEcGTZ8S4SS3NH5q5NarlpLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcCfW562SUUSRCVU7Y9AdBrmGj/JqIiOjejH+KhOxEM=;
 b=GefzuueJokluS6qCaERub+PnmJ1suwQr5HuYTVFLPyUfxN9+DpDXAev5by0y0BOBVzNHHur5/WRSrkpxlRm5NA10OzzkM+H0uMnHx8p8imgK7TRkg77ODOipZUIwKFJt4xOuqXt+yXNHXY1/bmWkbWze+hGda6iiPWTSaKOXa+uHekfktDfRooX5KVNywgC82v/tqbOwS6T6OMAptTRDLAbZDIcZ7b5523iEz95JT1MtbcWdaRJQFph7tU1m4yDWR1yAjROpuqMu0TOJgzwI7PM/QGPqFyiCz1KzHA24kef2UfeiD6PQPOBrfX0i1/96q8Ga1xlZu+XybjHnkTb/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcCfW562SUUSRCVU7Y9AdBrmGj/JqIiOjejH+KhOxEM=;
 b=Rv72YYd8WkG6+RnPleNkWcXqN2uttx2zs9XHJIJDBRkvw2naiYQWLiOhN1T0wia9CvOi85mEII0L5AzQkReCRLlOiC5eSuXiIGFYJQiyOOppSygHQhxF8yG7oqdtvpfFO7bpo+Wq1w0KN1PdIrlSXgTC/Rx1U2a7LKUCkpO86bo=
Received: from SA0PR11CA0040.namprd11.prod.outlook.com (2603:10b6:806:d0::15)
 by IA1PR10MB6074.namprd10.prod.outlook.com (2603:10b6:208:3ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 07:54:14 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::4a) by SA0PR11CA0040.outlook.office365.com
 (2603:10b6:806:d0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Thu,
 23 Apr 2026 07:54:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Thu, 23 Apr 2026 07:54:13 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:54:13 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:54:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 02:54:12 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63N7sA8o3876629;
	Thu, 23 Apr 2026 02:54:11 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH 0/1] Fix TensorFlow Lite development file packaging issues
Date: Thu, 23 Apr 2026 13:24:07 +0530
Message-ID: <20260423075408.1886225-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|IA1PR10MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e3e2ae-649f-44ae-979e-08dea10d82cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	U6b66FlTN41dBMsVaZi8kBSvB9vFM5G2t/c+n2TCfIrAgNhnIXLZz9jCwGgB6j0N3oy7VavanbTU1bCLCF0RcK/S/CiG6+42E3tNuLrz9Tdp0ptqxawOU0PpMaf7ToN/gtWRI1XYvX3wAf9WUXwD9VlaxAbGxV6u68vmW0oBa5G4w10mbPQOvBs4qaghCbT8/2O1PWrOHE7Wq1sYAfcw33o3I5HIDvrKvJMWeGZNJyF8YtkMJIJCigHMFihAI4L0lv/mfqYqc0X/Xu5PBx7GWRorPpJUPUQ+fmwGrr5SidsMcjYiQjPmAfOshgemV6jPrmi2IUBPpe4GlbbX8DdkNTHJusldfzv7CsGr6khp23/qBrrgS8oswU5wtpYRG/RzJT+0VDHT8gT/j7o6FzO+TLUdqyuwtVp0R8Z+GXa/hOwQVM5v5zQTyvYfSuqxV9JC3+wvDmD4uRJegWoHiiu6jB/cFZpFbVmR+IYmWnFjZQdl7C7ilAKzMGCBlVT71Hap6yeExfyZgiBbQctJMbJQbcvi2QOvrKqWEVV3wVvxXwM/5bwl6b/1u3Ti/PRM5URWcOB9XNcdjwew9Kytad6lJRtRzIYiYQDlF+li/uUQYDDeJVYUScl1BSv83/TdlcfDkc69A3k0SEjASYSk5QtFKm0flm5QcBVWzf6FstBUnixctahk7Cjhz6IB5Xw+3NZTyn1VlxY8Lpvx6pQex8XBWQKeWDgVWX9iyLREeZBArb2DBKx81MvRc5rQ2Bt0YO6/iS3PQDP1uQR8+iDgarDRZw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RxGU8o22UzM5K5ZGIRPIS3ZoYMJq7J8TsiSjzuIDk/1sGLTQT6NTz9e6ywTl6ckEc62A6HZV0VaVjp0mCkWB7/4edBrDV6HR9xoPhXX4CLffwJBwEHzaG14C2yynv2ePlHSqjYGQzX5rwdu/PnN1txe1pmuS/zxtB87inwjb+h6NNKCvJtReXzH8TmnIndLq+sirwMZHH58s4YW51EZ8EM0bYdi+t1wUOkRidV2GHmlkYl8qrGlSA5PfmGNSM4lqk4zh0aTbNaG87JJgwlxOiQVlJ6K1xuS0uY/vOG6N0EzzJfIjaM/AcC4eo4CpCLR6OB4nmjnrOC9Te6vlkvapX4GqA9WRu8Q+pLizQ2eiyDiTQNBKCcXuvA29mc1W8PtRoah/b0wXd6StHTwK1rWMPBv5aq0tPAk+ej3fBTHCFHD4+pztkKiM50FoQHo55S8M
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 07:54:13.3695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e3e2ae-649f-44ae-979e-08dea10d82cd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6074
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Apr 2026 07:54:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17482

This patch series addresses packaging issues in the TensorFlow Lite recipe
that were causing missing headers in the final rootfs and QA warnings for
incorrectly packaged shared library symlinks.

The TensorFlow Lite recipe was installing development files (headers and
unversioned .so symlinks) during do_install but not properly assigning them
to the -dev package, resulting in:
1. Missing headers in images despite being built correctly
2. QA error [dev-so] due to .so symlinks in the runtime package
                                                                           =
                                                                           =
                                                            =20
This fix ensures proper development file packaging and resolves both issues=
.

Pratham Deshmukh (1):
  tensorflow-lite: Fix development file packaging for headers and
    symlinks

 .../tensorflow-lite/tensorflow-lite_2.20.0.bb                | 5 +++++
 1 file changed, 5 insertions(+)

--=20
2.34.1


