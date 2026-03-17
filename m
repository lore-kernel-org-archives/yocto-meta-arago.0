Return-Path: <a-garg7@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BA5FD7070
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 10:17:21 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72772.1773742635793560810
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 03:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=GCl8xU/N;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.43, mailfrom: a-garg7@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1BNwn2atdmeel+ZXgE5EmplQbtV0D5igXX4KSDFc/UYjlwQP/vIbFKYnduKQ6JaoeGd1E/C81JbPZ7KgotbEuCxREmWvob1PZFIj9/SAB4mjROA9AeK7byUoChUyQyg4gsHFGCTpd9nS+HSGYEP91LeI5A38DGZ0VNdJn7Sz60H3FGAkY1/43fQEQwZLdKvTw4QF8wQhQs/wh2OQf1keKHGmL7ORnW/e2rXlju5BaUDryOsgJ5CeIMzx2YzF9bZ7NTp0ieiwKnRPQooe41RAHqjUr92APG7wjtYnnEeE591sFmZIRhbg5U6Nyp0sJhQ5BkFGGMV8E6/aA25n0G3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCDEIqhq9s9wub909vHyU/noniiwwcxnsyYDepm0B+0=;
 b=X/fLY2ptZQckxxD1asvznuqZEq8uVMnU2R0hbYc9DOmb71+b+iantQc4++XO/pJqtMSCnY6M40f3ZOOr9cHWpnG3WwJB5cQUkT53+ZkceTbw48oN010DRTYyfVTo+40ZngwtJKb2aH4BUTrNOiws7D0618tY165VP/k6FxPdEZ2FrTkzr6EP98L6ENNWKAC7pes9PpsZWX3BJY+jGwquvsdReqDiO5HaXKh80c6avL7L43YdMdmfBsR8ohgb/Z76WZ7PXKU/h+4ZLgeOWvULv0+IQiIBKeN04ZzecC2NocKw79SrJ8bMq2uIGGE9MLjkiGhUNrC2dQdhafRGYEAtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCDEIqhq9s9wub909vHyU/noniiwwcxnsyYDepm0B+0=;
 b=GCl8xU/NDGhXbODocnscfmbXR6GQHPmZZwB/eoj2zmW/BdZG4o63oWkPQGtlf7rDrdJD/seRs2I+axb4bx7kZZc18tiit7DgGKdOBhLiQ4lxnBI1gqr6gp/GaiBOvwnksbEa1eASmrcyugP/CPxCCOLuanRBkbLVygXNqws/Y58=
Received: from SJ0PR13CA0200.namprd13.prod.outlook.com (2603:10b6:a03:2c3::25)
 by BN0PR10MB5175.namprd10.prod.outlook.com (2603:10b6:408:115::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Tue, 17 Mar
 2026 10:17:13 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::49) by SJ0PR13CA0200.outlook.office365.com
 (2603:10b6:a03:2c3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 10:17:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 10:17:11 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 05:16:59 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 05:16:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 05:16:59 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.69.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HAGqY32517054;
	Tue, 17 Mar 2026 05:16:57 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <c-shilwant@ti.com>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>
Subject: [meta-arago][master][PATCH v2 2/2] kernel-selftest: Add the pci_endpoint selftest application
Date: Tue, 17 Mar 2026 15:46:51 +0530
Message-ID: <20260317101651.273730-3-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317101651.273730-1-a-garg7@ti.com>
References: <20260317101651.273730-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|BN0PR10MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f6ff85-8bb4-410a-b00f-08de840e5a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	BLZdL3SRAGho4E753lkoJ/aBbh/EeyC5BDwTyv0o6DnvuNGL2RIeCN6bRlAB9l1zQ2Y/LlgNYIdZ78CpF8LFgzMOUS2mhc8RbyD+a3qDinzpa41/wkmJ9/sF2y6uPHgLmZQnEnBv6KsFAhGxJ4q70GK93QgEGk+vx88upG1h04Cprvq/JZlwO/n4QfwMvKb+klpUx7a+ysb8Nsj4m1X9XbTsSCk+NHmeMaUm1cRFzNaAPGimAgO5Xj6ocUqslgrANgNcpkQ82oO1GQ/rGN7Uax0pEmmqmLMscrhe9Qj5Drl0Jl4GWJZIkXeQA6Knu/kw8l4/coYa7KMO5TVAxwtzfFecczYslquAeLbZGG5ykW1x7sXpRI2LgV7BGaD53tXXBJJZ3Cyn04EECCcYqLYn0bfT81y+YksN4SkFMU1fMvBKtM12BySDCBUg/WGu3sMWtufE51y3l4qqTRDkuQr9KTlPqVfhbXOQAchKSl5R817CFsCKFNzDCUrm4WYNaCKByjLo7xjKxfhGvxUGT/o7EBgSpyv9sCQm1RZmWT1AyEyjBgsBP61ru0r2BFjQmSM8L0Iv89CjVRKIrFsjOEr3BQ658HFg9q6upMRT27f4l0I1MCWVZ3zH2z2Wit9kM6NwEd6F+I4rp496OLH+UNieq/u3dEDkmntgXrv/Lh+J6cgWzZtwfwaFh1IoXF+OKK1bD1I7xrdFgFB2Uc2yZnjVb4yvjlGJPyxBbo+J/blgvnsCKPz4mkffklbd9assaViOU8b7lUpxXzsiOVb/w8CehA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SvoiOyLv5T9P3qJ7/3EDIV1Eyjrlzn1Q0yfjrueNXXhXwqMVPBlpjZxLNmx2DYup2GL0W9vLVJYNzG6tRbGHJ5zcevyv+uBp04WXIL/YbwBMW5ECltI+kKWC5kcSi8mM1jj2O3Z3rhbAlngd7ewzfca9bFpy8OPAsrxWwKA87AqR0K+AXEg+Omhu/3DT8Iz2oE7F69VJnMrvP8p1dWoFZtJH8LqjbXENE+Ex04eG/fF53wRRO4I15w2EHHgUXRXHdUbkjpFPLVLpSsxisnc27lOmr2tlXl1KwgRLQFWC02sd0V4lbTM7JDEg0h4B59+2E4sF8xFDUzk+YPqHG3CQ7iC6CZPFenNiDCCpa0LNKsTRYBh+oY8f1BxestZ1sA5bWp+ZgFYM9TTL1iwBXiFKqtWipbDyNbBOAKRSrtRA7mucTssn9dSXGfqH9UGx8FWP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:17:11.6380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f6ff85-8bb4-410a-b00f-08de840e5a9a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5175
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:17:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17360

The 'pci_endpoint' selftest application is used to test the PCIe endpoint
functionality on 6.18 kernel. Add this selftest to kernel-selftest-ti.inc

Signed-off-by: Aksh Garg <a-garg7@ti.com>
---

Changes from v1 to v2:
- Appended the 'pci_endpoint_test' just for 6.18 kernel, as this applicatio=
n
  is not present in previous LTS kernels.

v1: https://lists.yoctoproject.org/g/meta-arago/message/17291

 .../recipes-kernel/kernel-selftest/kernel-selftest-ti.inc     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest=
-ti.inc b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti=
.inc
index df5ff68ddc90..bae5b7ab47f6 100644
--- a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
+++ b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
@@ -46,4 +46,8 @@ TEST_LIST +=3D "\
     watchdog \
 "
=20
+TEST_LIST:append:bsp-ti-6_18 =3D " \
+    pci_endpoint \
+"
+
 INSANE_SKIP:${PN} +=3D "staticdev textrel"
--=20
2.34.1


