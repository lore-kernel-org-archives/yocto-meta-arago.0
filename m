Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5E4EF8FE4
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:34:44 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50052.1772732080560251320
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 09:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=KaELg6ba;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.17, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGQPPROL9uvaBpK/c3PdeiGOALbv7jp/43KGdcn6uVHpfRUxSkbIxhh5UJULK8CG6aOhKyEQwMpjvN/HwhkTaCoVOX90Qp0IAmrTN3Tr6x7On5Cb99LKMozS8ZDcETtZ7oPx5k1Qgp4ro2a32P33CdJZF4qkgy/XfqhEYA5mbKHq0lzbYJAgFmAV1vyBBjd0ewte0v5Ik3aI7I29CyanNAPrKvzijuk4g9npdzcltd49Ua0IOxeqLD70YqbvDiXBBEf6drkC7TXd4ElqD0cdw/p+l2UX12BhPvBincD2OCcPOU2i4WXLtN67P5n02+JfQoGlgZaLUxCypzzdwA8SpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jL7ylIxYUwCWWQf7eaoGYhMh35fmo2Rfwa72ee/xxSw=;
 b=tcVmSgOfRsi6mNsyQ+kQdEr6SETkW+vuXJ+HHQTcDb2OR+C9OOF/QfCvnQD22DOi3tVEK7pDLu4IHoNuha6IYyepdn6zNtt1avfgDZTBnw0BrHy8ejf1ljT8cpVzY3Kk5O2t1avY2qIHt+/zGNVaZZP3+Wp7dcEHVbFbmTWYcORp5kDEHrvh2qz9OT0aCaO1x3cTlz95Y3vu9hKZi05Hd4XhVffcx7h4lPFlPatc8HjeNkwvoh36cJ5M3h4wy50+Lfl2lq4vgCJABHe+o69g7C2IeQwPGhv3T6VUIqe9z8t0GGmDpZ6jyOGKVHGUulUbtHV//ovj6CdgTzOa/7JEmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jL7ylIxYUwCWWQf7eaoGYhMh35fmo2Rfwa72ee/xxSw=;
 b=KaELg6baSvQF4l2mKSPa2rgvQU49R4agmoZ0+ja0C5l0nsYGVTmA/f7pRw7gFKaXB2mUElq+p8rS7uNeK31uJPeKLoCE4VYgJ4lR2DLMQbT4KCeyQ3fFRKjZPG822TqGXKnWUD7jmV+wlw3vbc5BWmhKbx+ij9JM/JuljwEf9dw=
Received: from BN9P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::9)
 by SA1PR10MB6639.namprd10.prod.outlook.com (2603:10b6:806:2b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 17:34:37 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::72) by BN9P220CA0004.outlook.office365.com
 (2603:10b6:408:13e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 17:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 17:34:37 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:34:36 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:34:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 11:34:36 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625HYLRm2269842;
	Thu, 5 Mar 2026 11:34:33 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v2 4/4] nnstreamer: upgrade 2.4.4 -> 2.6.0
Date: Thu, 5 Mar 2026 23:04:19 +0530
Message-ID: <20260305173419.1735480-5-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305173419.1735480-1-p-deshmukh@ti.com>
References: <20260305173419.1735480-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|SA1PR10MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c25392-7dfd-4416-6eed-08de7add7925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|36860700016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	lk0XWTjNHtz7mZ9ORZv18WyR4Is12GpFmpmPtFtmh6nHX+FadY8jjphyxQMf5Xrihox5yuqQYYO7ULz8o3HIrrJdLpJHrDf2EvuwXhr61fp9Nyxryogm+hFXxe9iJpMToqhCLIEmmoACuX7NJCwAUQDiJ+yLixY/vbyoj3Twj789uwtlg7CyDq6pK4JPJC3j91aMeRdAlzRCzVUD4X4iewm7oBoP+ojPaAG6IejvQODxPcv2UKQeV60+GWNtbE8Aa27IValfMUjWWt1yVLJIXntEfliOIzGyQyN8bwBfNoR7hq28VC1PpxaAmFKAHLKRTRiKGMuhbstT0MPOFRxh8oN6n9ZUUEiiQs68asR1P7AWLXci/br7jw0VChxeuZ7VwmREV6ijeISeA17clyOZ9SkrmXcClhcQdaHaPlCHsRSwFqbSRKoAnUAZPOVwTXyw0LRTlMH1wtT+q3JZBRUHBXOU3Q+q4hN+4/rPe/gVzTgNuoYkOkSzcOxXveBxO/eD5JW6I0peLFs25BIDMsAyjeVP5rIg+QBf+v9rz064qs/bTjq3QPGJC6UqsnYZ/1jpdYQ4hDU1YEJYHrQF0baE+vPGE2qNiXeaKv1oFRcl1olW5GXdxKFarNNGjkU6md3xdPVpieqwwopEr0jxhSI9UPpJSyawzyJ4dYoclmYlPk8UZL02kw0lED0VE2cGkAsIEd5dJH7uvmxVu1oNMGfdPKtIUKqbuVnyLXx4JpkHnYgADtTQnc/SUMKBPcNICwWy7CeyvmO0uERtDCmduqTVXA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MN+yVmcyS3C7QjCDYFH1dIrdCwLcZzZybn8L7TkpP6JYAZSJYNw8tZsV4yySp3wacSSWrUYMmflF9X58D3zr87sSkyNj2EycRuUSb4KKZZDSod+g7cgRQegd2UwVaPlV7uRSBz0oyy8seTETbYEsPqryrzfY49y4MyDIZktCSf/YIj0GzhDMs8vQSvvJHGpeMR/raNCOV7+n59VYJBntBZ/esBaaUhe5ockcN50Chwnkl+eGUbUBsC+c5Hq+7qrUZGnCXMWr451VpCXITgMLsNIURJigoYtsE1WdJ0BvAfZaU48r1cBgnIjtWIDdYsC2DUnAwDGFkTq9B+hNTCQcpVGN2nKS42tqKMoTD8Q676SYUaR4ICmeC9obfAyytiQFoKnZiJhHeyFWibSBQwjUroaKioW6Yo84KxASpGO1asta+ImdPwvwmi7M1jSujzgM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:34:37.0796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c25392-7dfd-4416-6eed-08de7add7925
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6639
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 17:34:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17244

We are migrating nnstreamer from v2.4.4 to the
stable release v2.6.0.

Key Changes:
 - Updated version from v2.4.4 to v2.6.0

Reviewed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:
 v1 -> v2:=20
 - No Changes
=20
 .../nnstreamer/{nnstreamer_2.4.4.bb =3D> nnstreamer_2.6.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arago-extras/recipes-multimedia/nnstreamer/{nnstreamer_2.4.4.b=
b =3D> nnstreamer_2.6.0.bb} (97%)

diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4=
.4.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
similarity index 97%
rename from meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.=
4.bb
rename to meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.=
bb
index 3419e5a3..c62589ac 100644
--- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
@@ -4,7 +4,7 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25e5c1949624d71896127788f1ba59=
0"
=20
 SRC_URI =3D "git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;prot=
ocol=3Dhttps"
-SRCREV =3D "3b32573bc104b4708af44837466b8b6c73f94869"
+SRCREV =3D "b970e9eff6bfb4e915463842422fe14bb2e53f84"
=20
 # Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE =3D "(^$)"
--=20
2.34.1


