Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FD5F428CA
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 19:24:30 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3315.1776281061462460829
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 12:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=LGU65p9/;
 spf=pass (domain: ti.com, ip: 52.101.61.33, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foKNMFiU1i2n614YIxTHMudoO7ncPthlHxM2M9iV7pfAMHY4JGmOH/iraQBEX2lXJaTvrX5+CkE4CRxVNE/nJsdCU7g5PQVSitVavBKX3TDDTHtnvoadFvC74JHDbmWRqnxju0kpKqHZYQiX1SJj6/R8K/3UepUaOfXgm5htS4z95qCN2lMr3A1ZF4NN2MFCSMpgRzrY9XJS3itD5rZboMUZT5h4HEDCDmB+gDJxPG9Bx8BKsHkPpeCYg6xPvVGlAk6tUMnMZfsZUws/lxzIpEAt4UIW5m6ereq5rhs0uIvgzYAffRCmNdBg5LWEvbZpxioHNzzppxqZmZTKKp/P1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRDhbUd2rAbhSuGfZKjcK0G8xEQVC5qR0+UxlhopsBA=;
 b=IGFjrm10vVX5fs2gF+NFOyjjDN9o6JBW6X4QY/7dMoscbrPqR2AAuTiMROrgQaBJbNOFhy0sDho5HnSvK8u7cTev3T7Qb5VVd6aGnjecxTFhlbscS5QpzG4rIEedWXEL/ImqYIhyQyFFZty/O2FD6CwOEvzy3tymUwAITPadjC2D8cY3xI2BnbkgUqMjWXXjn9fJsKm8Pprt1FDY3G9siVvHOCUutTbPv4OKKwP4FP3CgCDAetG8q2KZU3H69ecAQRVS63J92CpfXiMNT2unJpAfnqeORuCn7hPzERJhxO3xRibsBvR1jb+MbzyXMOlviM/DLEqK6CLt/GY2YEQQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRDhbUd2rAbhSuGfZKjcK0G8xEQVC5qR0+UxlhopsBA=;
 b=LGU65p9/iL4ZAoKHKy0cWikNFoalZ9Lz331wykP8UPvInPt2z6CMqKc6I3dfr0MFT7SFQTqlqLkcJQV+ylkmYSslyg3mwqV4ZsaHHwEnPtbYLKVkPUzvWhzUrN2ZevlqJghydj4ErQjDoQ6/mIAmP/ZjKkXHvWu0Rs2BV8pthKc=
Received: from SJ0PR03CA0240.namprd03.prod.outlook.com (2603:10b6:a03:39f::35)
 by CO1PR10MB4516.namprd10.prod.outlook.com (2603:10b6:303:6e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 15 Apr
 2026 19:24:19 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::55) by SJ0PR03CA0240.outlook.office365.com
 (2603:10b6:a03:39f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 19:24:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 19:24:18 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 14:24:18 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 14:24:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 14:24:18 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63FJOIi52582497;
	Wed, 15 Apr 2026 14:24:18 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wD5qU-0000000H4EB-0fPZ;
	Wed, 15 Apr 2026 14:24:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ti-test: Add lldpd
Date: Wed, 15 Apr 2026 14:24:18 -0500
Message-ID: <20260415192418.4067820-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|CO1PR10MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: bfba7e41-1ae0-4907-be27-08de9b249733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	QKLUgJlWKnGLcn5lJYGxi/7QU5CJLCkc9tBKAmf/kT74IjIOyZg/tp29WArcRApsxSiC+B5bP1Dr6IEo/YdyvKnE2uWWenY0LmZ+zuQpPY//7rWvhcA8IxU4N/2RUHeV2+yKC0SISUK+ZTvXtQ784kD4CtcvXAtKFx1QY/XXicUN8OjuvpM9al59mpNV8OzbmTNeyJ9pPqyYhed200qO35DqfqzrWJjIP3x9VQVm1j5olpq1X8jUHcA0IdVuqIC4UX5y8DP95/GgCXFaraMnY+ubhR0nmBjvCmoO2lSx7PfA3cGrGbGHJNUbo+3oDWIXoDEYttV/tTQXJZoZFjJnw76CYbEzPAijR7Is1uzCL/2z6qEcOb6sV4C01pMf8OULBE8gVCSiEH5DrAK5tYRmjiCPfibKZdfD/huXt9tl4BTW2PXDLvS3Jhip3dRI596U5lwAOgR/jpqZKHQ1ofKS679q+2VHIKXFS6fzvqQHr6LGXyM6DvQOOd8/EWQxMrTMQrSRL/lSVUYNEGxu24FYm16Fl5zGYOWA5RljX7l9u19J2pBAu4RbncxuSdTuNKjGBNg0BzhvhKRf9pfEoS/K0fBxRgPrIWsv9p+/UR/YffDPLJV1L3If/wWU0CmJWdoSwSvcbFh+wxMcbX7P8jWGzgcpAP/NuRQpekfPLPafbu0prjeTmxLFTnieLFG3e8ECiOKMfkwMpq5cdxfu1nP+z7Jl+h3mNcotOG1Rg1igUQ5ySh9kwOe2eyNW2kSBxdYcL1EXekrgxoygSpKnuooF7g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WAhW/cf+kg8GkpI3xpWx5JgkSl2qWz2fqhtqH1PSIrxd9Fto0ENtFQxtWxVYjp91TiZ9BPYB880JDWA8vrgw0MnQMOvMVdehHehMzenuma1og6FYnhSehP2imakXGpaD1lVhhhIYkMIGeTM/uBeWB93iAvy6Oz9bvYkjnLBdh+ICGU2BYrvPiF+GXJHFcfw+YVQaY4qoCX9bqtNKgbSbjrlphJeBoyoaP5kHAz3badJduCjD3p3cSQt5cTRDn/Eu11nmabV4hqntqUOyh9+jIdR5pMJNGHe7pExTKdzYO0emHZLbl27aXxbc4L+RIIgVbHYdjVuXIV4JlJyR6nf4zrUghVIKnt+bdPeq22XuOHfBLEr+A4CCh3EQnfMGGsIOvZMRvXUZyj456GFhplrrJNIdKSqlDLsoNsTretL7fNILYBMrjA9ZPVWJS/TlsXKR
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 19:24:18.9695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfba7e41-1ae0-4907-be27-08de9b249733
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4516
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 15 Apr 2026 19:24:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17467

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index 8125c3fa..b76db623 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -111,6 +111,7 @@ TI_TEST_NETWORKING =3D "\
     iproute2-bridge \
     iproute2-devlink \
     iproute2-tc \
+    lldpd \
     mstpd \
     netperf \
     strongswan \
--=20
2.43.0


