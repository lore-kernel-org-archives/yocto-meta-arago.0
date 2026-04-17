Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1CBF99C6A
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 21:20:17 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55573.1776460810073143937
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Apr 2026 14:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fbwovOm+;
 spf=pass (domain: ti.com, ip: 40.107.200.52, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iK7L+DeuXMCzwilH+EjZaV9eoFp2ieM5/UWQw3fn6nACkmrh5EfRjfYhrWzuaxjSBKdzUqZRpdCy7gED8YmOezOCOLTJcxfbnnfegjeCE3sO42uSQpXGEJYwW4JKJbyVNasGvNRYxdrL0RAPpBl3mq3FpGXX5EQSPpZf5pJu7yAwG/d95tNNzKTJ/eB/8A9k3TEBAL7tJxV1mpg0719EAMeTxIXoYzzNX5CBrhb4GI8W/ShZ26vTmwWA72CCUg3zhcZmxEt0GrkFdo+4m8HRX7NQ43XUn4p+c9NxRuIifZHbv0AgSLeN14GUUZD2Z8vNTexd0b4B4AQ2r0jM3hmFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRgzukChIJOJn1aSQEYVSc4K2JR+VF/TFdX9dtn4BWA=;
 b=bCyB7nzGBVE9Wu+5A9P5TFwSbIsajArTajtZ1WmQnJ3I2v9/Wl6/QHGJPe4aUyS2ZWV5UM67YrZQYspDVA2MxTiX3x8wFylZ/w/oyqciOXl6Nz9QD6wh8nla5SAKB8fN3mHUHeupg2Fog95sJBomyg764veOyoj51Lzx2g7rP1SEtHP9oigI++QcxHXQ4ZDJLvkAo5M7/zlNRubAa47u0yyTcrrRkZR3dmIBkPLrjmIEPaGyUhIXvpuHhuu+1UoPRUgTjam0hOXjsBkdal8wCFYLknmicWN9wwnZZHUMgK6UnphndmQS0eHSZZXmXmEQBifKfajGETM86gwEUYr3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRgzukChIJOJn1aSQEYVSc4K2JR+VF/TFdX9dtn4BWA=;
 b=fbwovOm+vIQaOczxRntYFnvGAUEsEDqHpG4zUmQQ7qtggOwhVaGP0ItVH5K0xxvbEFpBTYbcSGf7xA6XeHABcb8ZpUGjd1vfyf5XIjlzZymVaVcrX6ztQupmhngWyZIkfaxnIQYKdLOK4xiwyZIr/KH/dEJKSLKZdRymQmdmY/I=
Received: from CH2PR03CA0028.namprd03.prod.outlook.com (2603:10b6:610:59::38)
 by LV8PR10MB7845.namprd10.prod.outlook.com (2603:10b6:408:1e5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 21:19:04 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::c0) by CH2PR03CA0028.outlook.office365.com
 (2603:10b6:610:59::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 21:19:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 21:19:03 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 16:19:03 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 16:19:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Apr 2026 16:19:02 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63HLJ2YQ2640667;
	Fri, 17 Apr 2026 16:19:02 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wDqac-0000000Axby-3q7M;
	Fri, 17 Apr 2026 16:19:02 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] arago: Bump DISTRO_VERSION
Date: Fri, 17 Apr 2026 16:19:02 -0500
Message-ID: <20260417211902.2612419-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|LV8PR10MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a417d0-7574-4dbf-fdf4-08de9cc6f38d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	mmkQmif7hCbaglVJv9CvFaN26ToC8dedhYdFSS5M5yvgVq6SSvB79Va9GLfsNLvQ59jK3pR/TtpgS9f/SMx5eHH4YdHCb85R3t74J9eS0PYJ4kZ5SK5Lh7hzrKrA4rr0XnRmUYab/1Z8p965j1WiMYuUmWDAw1ODBGMHJwKm/5zC08/90QVLkjblkGATNE4InZoEgMG/7vGhpK8OW/Wsv3bch5u3T4MHTuLBZPkOgQZsvQuUlQU6xa96jmAr/Dyia3fLivD/riYyr+tB94tfQe1bb7DawhNLKVnDQHIOdD+QUaksIBjqkDnKJAr6U9E99gpls1sKm/EGAyrWIGAs3dC55UaXLdSh1PBGQY57ExonWR3BpA8tJ8sCgmXIBYx129T0TS8femoZxbu16egrD9bTvVz/qfXJ5otz0MK3tT2t3VUlr+EC8Q4nOdqCDJdgYoqpJWC/LCQwuc3QKIKKy4ijS1RrqX2QVXbn7mk0gjuZxaxtueBiIoxnHsiXTgyU/jcAvFQAUqa4O5GSYG65eeQ6y3nJ7d347COc3GFvRHbrr3RwO8W/RZvSvZXdybmoiGN4xHwAE8pbiAhzdheoPJY/3SXXRgI8xinsbw/CltZIFTnIqeGdDxBz+TwPDvlU8BDS1na71hKh5RVJxu3cXxplPsqga5KbxmnejAWM7js1rlGJbozImXHhyCmM/NsSW1dw904Y9ciNFKjIPDJYzYm25hLOKnMFuDKQCa5oFxo=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cOsSg3Jc/P02g9qfKY1bq2s/ldPEhp1w5pDUx6EHj9Y4/YRNfFCfsW2FUwTlf9y64Rlx6kLQa9/JoCyIoZHVT6cw4Mhs03q2683sPwKw3y5G9knq5L778x9XoVY0FErC9V/qifxciWiHUC1/Jk8nVom/bMHxsuYj8mb66M0aDlSA00ofhz1/07cCG40upFy/D+se/28dO2HQwx9kvcUOnHy8WM28Kuj+qi2WuQxTW+3TGcO/MAna7duxX5TN1tiXwPDlJQZ3iSKuWX0sHwnTs67ZLrBKtbzl0ddT40omtLJq4Fo5/yWvrnGPkpTyLAKl6dSw9U+5RIBJ/zMcLtDWeSbNrkHIi8/1w6LASruRUN/UYuITlKpmXX4vzbMhruH+MMgwpk4MTprAk9eycJgoZVjsrE83lozYBozx8L9qOx0USednG272pzFG4LiWILiM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 21:19:03.5832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a417d0-7574-4dbf-fdf4-08de9cc6f38d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7845
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Apr 2026 21:20:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17474

Time to bump the DISTRO_VERSION to 2026.04.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Move to <year>.<month> for the DISTRO_VERSION.

 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index 42019272..b119179e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,6 @@
 # Name and version of the distribution
 DISTRO_NAME =3D "Arago"
-DISTRO_VERSION =3D "2025.01"
+DISTRO_VERSION =3D "2026.04"
 DISTRO_FEED_URI ?=3D "http://lcpd.itg.ti.com"
 BUILD_VARIANT =3D "${@['prod','rt'][int(d.getVar('ARAGO_RT_ENABLE'))]}"
 TISDK_VERSION ?=3D "live"
--=20
2.43.0


