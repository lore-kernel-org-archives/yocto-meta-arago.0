Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE124C79FB6
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 00:59:28 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3456.1789001967435704823
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 17:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=eU0FmCSl;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=eFZQ+S0t;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689MA8023700241;
	Wed, 9 Sep 2026 19:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MUC5q8fG02h0YlfRVI+xOpuIg0mPOMRuMDRBBBxMh
	cM=; b=eU0FmCSlvlp221mFpWHUqjGh6din4JcTYmJ4E9838XQhPYMDVWtRwG9IZ
	oZH0JZ0kGkThIkVxeCyVgiljpRYh7/tnaCI42JmGzv05tGkWfJvC0SfOD4Mcr4AO
	wUHpuD3s+i3a0w9CAjsm3L93DMTB4Hr0eEeZ/9Ij/m1d8duGeNd2/8k79tEY2gmR
	k4Zrl/kgCDwIeSrGd50fUI6IF3fdZB3kwqSMyhcSEPBk+afzrVpbDfkp1K+oXHFc
	WDIQguukfwrTPBHB2wDOUqe0tglSKk8J/yw2Afmd8ijlU0trtnO53Th2znPzYKI8
	TqpVIwFsCW9cYKVVVPMpCwqBdWDwQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxg9xtu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 19:59:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrychFAt7MDpZd3mcepNuPh/A2tS04rMy3qV01ihY3DK7tn+ncP9fnEJ7ioKIdgGJkQ8n3t1EIMGmjE/hyczXkj/gtMPGwrAhqkOCL6DCLWyK+AOEkJtn/JHpu19F3gsvhjHWKRKH1n2uWTyaN8vDXwGz/T1DWrFFFHixbZwirPJhJnkbvPnft8n6yLJMmrhALwkHIAgcPv1DiJMShmDc0zHYHweB/tjH7UT5odeNNI2m66TTdU0YP/6+ei/6S8bTyAs/yZChOgNgLauNfhGmsF7kSD6NDJ1Il5rdn/DBw9F3UFQm9AYccAt3JCq79T2zk4/gWoJ5JDLxwtd3x6plw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUC5q8fG02h0YlfRVI+xOpuIg0mPOMRuMDRBBBxMhcM=;
 b=rwpTevFmq9IhVbRTMioFrbbDkmyOSMsVGNS2hYMh/NLgqMmCSh4N3wWkM6GgE4JW0gijhIDk+lmSQdDzp9g4GMt+2JMcx6i2Wz7PALI+4m92szVdmTGdLtYvat15wfWLwUDs7SzL4cRVnKV1WOjYcgAvPwmiiTboeLX4nR6QVpXMVkBXyOVDJF2HJe4xaTELMFACZjikExsisXJVQw0LAGqOEVa6CB6hJfWw2elrL9SWEsXlCmOc6Uq5DemXub9bdNYxMn2DLSQeyNo3unB/c+ZuYQmVGPpeJ6zCnF9K3BlEW7OuZoiDuuCkzEOz9SNvIuWrkp4bgif3EBhjLeDTWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUC5q8fG02h0YlfRVI+xOpuIg0mPOMRuMDRBBBxMhcM=;
 b=eFZQ+S0tRsZy0Mz10rRojpdLjK1HPKxJA3roftF2C3tzxd65HAzWFGWhlUNWoOmzQOtGCHNi1+IHjfAsU3KuNKyJP0PofZtAIimW68FEey1RbVUgS2qiY1rZB1WHT6OVfJTKXlf9uygZw7Uwuozz+RIWwUuXifB8jwmJ1TVKwWs=
Received: from CH5P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::27)
 by IA3PR10MB8275.namprd10.prod.outlook.com (2603:10b6:208:577::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 00:59:23 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::55) by CH5P221CA0002.outlook.office365.com
 (2603:10b6:610:1f2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 00:59:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 00:59:22 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:56 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 19:58:56 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A0wuKM1322178;
	Wed, 9 Sep 2026 19:58:56 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4T7w-0000000GNs0-2p5R;
	Wed, 09 Sep 2026 19:58:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/3] packagegroup-arago-crypto: Remove openssl engines
Date: Wed, 9 Sep 2026 19:58:55 -0500
Message-ID: <20260910005856.3904973-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910005856.3904973-1-reatmon@ti.com>
References: <20260910005856.3904973-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|IA3PR10MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d82f50-4b9a-4749-5039-08df0ed6c073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|13003099007|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	yewyQISl5279vzD8uzUzEvW03D0KiIVQYFTX8jgeJv3BTVrLI35n1Zlr0W3x6O0lJCUS6W/cufF8fl0tsANDOkyV8K83OPuqqE7+zo4yc3vYk3MCvJzfleIVVjTTooXv4kFju5yJ6JimmtDvwJuuBZisKEPl/GsGfgts0IOyCr0ZiWB0funkxmXl6lJwHt4Nd3mfUwAErceVwYlrJu7RgqWqyR+YSApGeNcgX8vICXOWZvuYSRgviUxxGJmoqI3kXja++RHGBfid+i/36dZSWpkXRhY9Ul91x3u1ChlJzvQH6uINwwFIJJCs8f/NJvsAMObI6IK+fyWqcLzQRA1CH71bdMrJh/mRHgQUfyUx/nKNl28uQZ7+M/QnrXSUqHPwMihb6uy6ikPrin7W/KScP68AbwYh0ZG5zJ2emkEdqfJD1PuKtzZy8YQ7qnDgxnV9DZv25G+lKy77eeLKHkK/rABtiQ2eEYxrp/C6VyHxxsSDz3uqH0GCV00h87g42EYb1OL5H/4q402WRhn+dzVCVpd5K6EYqJvpW4bhEwWEuiT9kDtMqoqZoKHYsxWSetNxDvLy88jnDbLkQevLARclA2MNAowyhOmBCCHmZuS4xK143dFL/A16MYJprWmG9qQ83/yzIDTXXUfdpgYbg75Fm2yr7JOknQLdQ86Fr5NjtLH/sTK8PThMsQZbl0ycxx67ABph0FLjKvJ5YWUfUc9jaw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(13003099007)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5PZBfGFZORXZSezxnpWV64WHUQ+XtnRMEA3LcWaGkGFqvzb6RsSGR/v950fPG5qgTN92dwudkjyPIT2aRTxy6SCc5gLmgM9pCHIVo8NMdADY++nt4JwyJwfVpIKXn3k+qaKbgVEp9VjlHx+sVtF362yVuCR6wFIxVvgrwfEUXjj3k0JfZO9oDe75fcmyT49xTiQSo3DUlwlKCKF7fxHL5L5rlEvmjasFQ4MXuB72qDp8GYM5ukKcdOdBDQXyDsKpCHFy6ybFsU/iwZy+IdXsvvAE+yx5A3kJncSLHjKaMkz8PmfR+/TaVsCEZBVF5qhqtiC7baOAATFmCipgdTlfxM6qIX8AXVfhdb8nM7EgTvS3gczK1+g62DNctTnesYLchc7d8+UA2M/ynxgFbyjB+JSf0PRpz0tp9GUJvojmqkEmEWlbP2X3v9+nOYCZRrTG
X-Exchange-RoutingPolicyChecked: 
	vGBRoeMrJ+cU9VeCEE6fOcjsBCUXCQEu1DLJgkYMZFKHVMWiD4lxV4SImTdRNq4viYuTlwdMWn9NM4j5HGrnKB0IoRlTQjaWeJ+kAg5qwwPBp36cx8Z+HTA1HBrQ2Ui3zOOzCSOMoMc6uip3uF6r7BC7UssB+i20iJEOdSJAr20i2lZrpyVALM7HNy+43eBa3365G9y12ZVB8oH8xa6Sa4eGWJqEDyYgwO1HtcloWBQ5h16ut35tTz5jDUMRO50cBbEvgT6gLceLe1aU87iqPHbN6za7TZ8XxrpKT0aNNMwCeyluRIFWpdXEyLqIRH4/opw3EddHYJ/RYf5f0xQ2IA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 00:59:22.3605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d82f50-4b9a-4749-5039-08df0ed6c073
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8275
X-Proofpoint-ORIG-GUID: l30jf4Vt6jEFwn5jfkqFTSycglH8nbWA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAwOSBTYWx0ZWRfX5O8xwhOhcT4v
 LX2q4QFTO0JWasyR/BkZKoox0VkrZFC5LASy9KEBuZtXW3qeXKB5ZObyf5zsvEgDc9tzqWnqMmC
 uXZalAIN+sxUDE9sXoNTtiP82MClByc=
X-Proofpoint-GUID: l30jf4Vt6jEFwn5jfkqFTSycglH8nbWA
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa200ed cx=c_pps
 a=/Dg/agRq+0IGp9KZEOxzXg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=_YMhNlhHGKM83nbTqFkA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAwOSBTYWx0ZWRfX11YgoJe8vv6J
 RFbjOz77vTbI98dtl5lnp37vLqNAQUhusr1ntlYzsZ/996t0eO0GN0HwYlhGsAOG8UW1aZakY7z
 IZAXAOMUbqeYOqE2s5Ldhce76fQs/Aiyuv6V9jwf3pRXQDF5e7UxUMnzmhghB+ruk28xFYuUhRl
 rVTPaHLthNwEHTqGAuSh7iP1UlZNK29NH55QNz66KgWoLP2hLBBK2S32lQoT8W4lBcRXvbSxBND
 CaXGCZVffQV/gkAbS5eJP0p1ntHBYmUq1hHZFU7VETKajV7VBQJ+KPo2S5TVC5c7emrPO8k9xpN
 BCNgb6T7wkzTpwGh6U+ugc1kYHMaeY21EbeMUmsOw054gVr1p0ibMNtc5MGJVaL5FZaXtVgUJAu
 Q7ROJLpBdjNT7IQjxUMV2Vt1eGsCSZaJT0CVYozWEh1hliSLXwV2nc6Lz8jEcEEF1S5PhXrB1Oo
 pW8uLYPZJRTu5zjGgyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100009
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 10 Sep 2026 00:59:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17657

With the move to OpenSSL 4.0 [1], OpenSSL no longer has engines, so we
need to remove them from the packagegroup.

[1] https://git.openembedded.org/openembedded-core/commit/?id=20bf704e5809e95036b998f0f45145cf7205b05b

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-crypto.bb      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto.bb
index a8c4e7f0..c94b1452 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto.bb
@@ -8,7 +8,6 @@ CRYPTO_SUPPORT = "\
     openssl \
     openssl-bin \
     openssl-conf \
-    openssl-engines \
     cryptodev-module \
     opensc \
 "
-- 
2.43.0


