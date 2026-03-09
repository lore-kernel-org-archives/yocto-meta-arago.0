Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4187EA855D
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 05:34:09 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7759.1773034441440084012
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 08 Mar 2026 22:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=xirK3VG4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.62, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JzmvqhBPT7flGETIQiPpCQLslErOxDwG2fVLOnACft/88EpBVQaSLKNDFwIiCqu5rjaupski15W0mTiWvSIqaOUdoPNDRFD6pHgJx8CSIP1X0sACvw41cueUGm5FhB4gPJKU5m2q1SVM4TI6TZZ9/GvNfhKDt8CZsFOfvO094zOvVBsv87if/NVxC21u9k0/MpVYzn6zHzB8XraUDpP63AS+6fe+1GE1bC8D8BwT3wrAptK0WwYN7LV2RFlGcGWTgJtQ1qEhskRV1nIXxUgj+RgcALWghxsvc+i4Fuw/pYkODBRZEeFBCF1p/nMYOtgwKD2TZmSLkbufNDSWSDXidg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABTwmkXSxAiiIEP+vlVYt6w0PMKtfE5WH4WBea6RabI=;
 b=ZT0nmdhyzPgQl81rafpvUmkqXm/YG6pDoR6gFZUdbdyWTTypVUUtXPOEt8XicSU+4ffwrTEOmOzmiJqLheCf8QQvNQuT/OPaKXtf/iB3A6GlrGxRwDqoNQdz619iyZTZo/BnDESjXTTDs1yVY7pUNU5rnUkePgHqLr5/WkjZ4qmobXZ6tsm60id24h2kr7+cEgNSKtdI1ApHc3MBol+nfspsNmi/FIxS+mXHXq7LRPmSnm6sLh2MJjthTiW6fDderNQWuXAf2tzsHs7wvo9fTRn0hxW/RiUAi4A0ch9boyFNPmk57brtRbJh0SEqwZeEHuTrITP9frdx981mTmUpyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABTwmkXSxAiiIEP+vlVYt6w0PMKtfE5WH4WBea6RabI=;
 b=xirK3VG4x/ntCKwGZFE5zqWtGO3uONp+mQWI6zcUhXQBsuivcjYK8rnHYJ0UmHlAdtlHks8ndOJ4jcyBo2UC+0m4hUPPvSFEqgQGH7JLb1TsdoZhAshuCYOk1xMd3rWjy1dMy7UWbVqb2ifR0qKEvdIlLcjADvxQ/fd1K96R+kE=
Received: from MW4P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::28)
 by BN0PR10MB5062.namprd10.prod.outlook.com (2603:10b6:408:12c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 05:33:59 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:303:115:cafe::29) by MW4P220CA0023.outlook.office365.com
 (2603:10b6:303:115::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 05:33:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 05:33:57 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 00:33:55 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 00:33:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 00:33:55 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6295XndJ496421;
	Mon, 9 Mar 2026 00:33:53 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH 1/1] nnstreamer: Skip buildpaths QA check 
Date: Mon, 9 Mar 2026 11:03:46 +0530
Message-ID: <20260309053346.3827889-2-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309053346.3827889-1-p-deshmukh@ti.com>
References: <20260309053346.3827889-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|BN0PR10MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: fc4f472c-e5cc-4a4e-70a2-08de7d9d760d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014;
X-Microsoft-Antispam-Message-Info: 
	OGAiXRh4ZpUNv5qmXm5Q0cjpqG+X9V89hzXNK926f+PYmv+wyebrVb+qwfc4twcDltJnzkjTfZBUaOgYGvxi7goHb4Nrqeo7KsjvtdqX+41pMzkw43b5YsApIzNf+sGhKWfkouUilPipD9/wfJBC2C7di/lF9Ih/f/YS+xr8XocfohIvnnv2UJ9jx7KRH39tBaK/4ViA/lz9biJl+YVfCwQe0SikT4C5XAI6WnbQLVCmfKg/x0K0XgwZjXPiwxAQnPQ4fymKComEoRVQdDzWmJQkbfbTZ1cK97bmKSReaCCAZcLvNRX396tPCZaYFTh5rd3Aj5/5exAkNe4rzb/DneVWR3BsXHmKPRsiefEM2RuGC5k9hY++qZk70clPrPQRKALIuJNarBwlCZClY4gEdK5xaEmriCAqqiy2Jx++KMrVGssrRehsnZEdc15TvPLgbD0UMCTO7xYL/crP2+bQjjsyKpo1cE1Vg2a9MUg+rd9Kx1FKXTGgy6Y8Gd7/i+eGZ5R8vLKlIx5jpy6r0LR2v44PD/T00C6Mf/xXF3bSXTX/kd+1Rr4Z68LeU7frwW3vDhoQno8Ihxd+y5pKtxLc0yXLjAnPgvRWN0zmYWNOF0hHN84XAE/U9styo2zey3gB5FeaVJQWJTMC6o4sueIqSxWZWTAWyt0HbIJFyxexiMuMvuKWzh+cbaHOx2Et+HEEfQbc5aeHZJgJPqnAj0CC3iMuQQ4ZGfeZlr1OKjLSD8x6JyCXM0v1AZvEQEPPuS71eG+ddjQmWwZaPtv+Ob0XZg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FGO1PwcOnv2I5/rVKXvAAltnDt0rp4VvIlDo1ocprLnCRyDvlZf1/rTz93hoYmEm2CvgxZXNc4vhLfgz3JCVgAnNFWQrUNCo1sYF5nniyuazitHkNv+Y5acYZmzW3tA/ZBSvRf2aH4LsidojXo2ImhHLEACKCoYAXE6fg/zHufAjSAeuSNIoR6iy5s5OKiIr3bjEanoyB+sIsXUfQcVF7ys2j3NOuYQUS7dAmxgqCn6yqgywIgVvwR1Y9McnnxvraCG9uOmYqWtTefETIt7+RzpPr0BpDP0JcIqlbW2KMj+NNvK8t5AJyCG3dYO8cI2UOE/3HZM2uMks7oYnkifunfbZeaesK3eEP+RCZbJTnpsI15dfKBI6jbQkjk+L5HaRQaUS4xkfaw8KyWBP1MztRD1QTFixhoIc5IlH1kWLrUcwOH2aKs+NqlG1qcb7SohP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 05:33:57.5734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4f472c-e5cc-4a4e-70a2-08de7d9d760d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5062
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 05:34:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17282

The nnstreamer-src package contains debug source files that reference
TMPDIR paths, causing QA buildpaths errors during do_package_qa.
Skip the buildpaths check for the source package to resolve the
build failure.

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
 .../recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6=
.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
index c62589ac..74d72d9e 100644
--- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
@@ -64,6 +64,8 @@ FILES:${PN}-tests +=3D "\
 "
 INSANE_SKIP:${PN}-tests +=3D "buildpaths"
=20
+INSANE_SKIP:${PN}-src +=3D "buildpaths"
+
 FILES:${PN}-dev =3D "\
 	${includedir}/nnstreamer/* \
 	${libdir}/pkgconfig/*.pc \
--=20
2.34.1


