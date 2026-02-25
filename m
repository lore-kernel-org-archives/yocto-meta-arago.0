Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E920DFD45F5
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 21:17:45 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56213.1772054264169743041
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 13:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=H9ufDN2M;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.55, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ad0k+uU9fPaYvZw9kPetPC/wUubuux9jlTYX4mVbzcJ5qYGBcodcW7ZsGz6HcfgOU3jQH1jsVauyoELATJ/f2gM3bc5WcCd8VJ1zXjaCPZ4tfWVG+HbarTq2myUbI1V+9sTBBkbAKU9z5O4FebNp/n+Fb+GiosQU1ui5dQIV7xfTwxP1R9IVFhomiRDT+F5CcecXT4qq/x0YoW9P0sGNzk88fIgSFPxf7LZ29gYvEAND4TYKHSnta9p2RTa+PFfXgmhKMP64PKkFp5R71YnMPZsLs902p+MSvjSpYBdRb4uT64kllSBt015gXLLOxJTw4SsTQI3LJfTtcrsTQ/3WrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dizE9JmkQ1WFdlxLvM79zE06FK/jSIWAQcZhm7Ca9Y=;
 b=rp2oIbRyEcYDH2b8uuvT3AjAfMSOu++uRkNsaEFiHWMfRxQ+p6w8OU6bLh7vOy0ykin3ew6jffTaHaR36i/Yb5i5IFGtZ9JaednXJH650GNX4V9xl1XRBPk2oxdsbOySWAT2zascxJUgen8S2EoXQ5BRus/92SHs3wcEjRJctkGhbziq1Lqhz7blpRGvmc/lv4Ft0Wx+NTSlFDqtagvg8qZczbhY+vG9RQfgV+gqljXqoLN39kav5/vVqQpSCggqGic7zHz3x+I0X3QKV+22Zf8Wgbcyov4kFCp5jX7eOM/Y2JZOKUtQaL8tI+PVsult2A81NXS+vpyTjIxU1jvKnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dizE9JmkQ1WFdlxLvM79zE06FK/jSIWAQcZhm7Ca9Y=;
 b=H9ufDN2Mc98zW0wATPYCdxXB/8YQ9T+nC/GLM8d2jD6+V/Jw40NkgOCoiPGo3l3uptPGJw5njgVlUBus3oMsQr3s2H7ZSsXktZ9OXYhf9XhQCmiZTouX0IYOoUK9s66w6g7oLPMx95+CfEQ2uZhFwsWnyBLPsycMpWnBhP4JLE4=
Received: from SJ0PR13CA0112.namprd13.prod.outlook.com (2603:10b6:a03:2c5::27)
 by DS7PR10MB5926.namprd10.prod.outlook.com (2603:10b6:8:86::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 21:17:34 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::c4) by SJ0PR13CA0112.outlook.office365.com
 (2603:10b6:a03:2c5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0 via Frontend Transport; Wed,
 25 Feb 2026 21:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 21:17:32 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 15:17:32 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 15:17:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 15:17:32 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PLHWW7646845;
	Wed, 25 Feb 2026 15:17:32 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vvMGB-00000004Ax6-47rL;
	Wed, 25 Feb 2026 15:17:31 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] kernel-selftest: Add textrel to INSANE_SKIP
Date: Wed, 25 Feb 2026 15:17:31 -0600
Message-ID: <20260225211731.995405-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|DS7PR10MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: d763c070-0a95-4670-40ae-08de74b34a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|34070700014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	T9vJYed9OKDhQvVbZwWem7D1dlgf5VVDRYxh0aUxxgn4bSYyJU1GJlId2pv4st+7ve0AG9YK+KdMNdp0jZR12j7H+T99JMKsy+Fhy21NN1Ahmn1EElTTVYu/m551Kd+Ieg0UXPeZ2D2m3QRv0FyDCyVpxyDaHyUrI1xtZfKKAQkQiRKowJmnZM+DP+YbqrfLwYC+HBCyW/sb/jSAqdmY8HXvgnuseaB7OHD5qWGKhVmDSNLvjvW1B49iTZBoyPuJbcfnVTGugvsszu+RCIubllb/v8OM2/m1v842nxX5Nm9yrXh5//5HolR+JOFddI9lcd/iboG0hUqFvl2ivEt2uwNUW5Y+Pu5timLD//9LiAsKU6uRErCGpqlPTKuq+iLChfOtdgbdftc9NHGPO1A7KxiBnUnOo2R3VY5U/KK1BuEsjG4gzN51bOUUV4rV4wusBVmZ1uZ8zNvctie3qqjXaFVxKx3qWiIYJSboJfdkTVvw5Td5xAk7pwQYEYsy+q5aV/0aKr5guZmdlJBEuo1NWtRXNGDZgXIzf37/5NL6mUHkQp6K3NqNvXYVsXu0bxM07AvWxcAAMLYGyM5t0ztEDUfok8mQVSxfdO07N5Xjo0pP4ndbopRv6kVVThXXcQb8Kb3YEn9I6N6o0C9x9BoGNgi5qqzQ44q9pgZeY6zxlbZbTDtysS5VNlDYpKtOfAWpwQUx+LZFXP32HwjkXxPXyO2tGbykw1dldYvCOZwtlhl05WE5OihKwFLVqG37+6wlZ9XV1JqeTSOLh0oD/NWluV5CVh5IwqKYuMB49LZp07QZLYzdF5rF3ruU6lu3XPd/fvlVcSvKStmSWT1M1Lr0rg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(34070700014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jqnt92vz5bTxGiVStyubAwDmTWfZeRBvzOG6wz1NiiTzZH5tnVJRCt/hC3CrV7Dcxq+MZgIBq8CXki5lyJNMLhv0LA5VElM2e3md90jPB9AWvRZLIJbwIxjiJJAmeC8wtYSs43THJGJ5Tb7v0Wr4NQVsSzucvT/A0uvEGgeMVTOwx4ZZNTj5vAkAW2vZXchc27Vin47tJKjNSFQJIobU80VR3gDLGMRczA1UgwmhKJKyZVrG+hnrKFOLCCIM65XceqZMHsW51YEeUUo4oFOC2SXLgMs+gDyiTvG1GqegzvoqniwjX2KkzfAnwLPqmqqolF/f8teNrY7MOKinnQpWfJ9eSPLpB4RTTN4zfBOGyKYlHcVuPo5uJn0X++J2e/xAgMeclHy4NrNOBbNxvP5WfVEDfWnUKeMuDppQcNfloErkl+XML5AqEfiknnzkDNT8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 21:17:32.8424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d763c070-0a95-4670-40ae-08de74b34a6b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5926
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 21:17:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17152

For some reason kernel-selftest has started blowing up with QA errors
related to ELF relocations:

ERROR: QA Issue: kernel-selftest: ELF binary /usr/kernel-selftest/arm64/fak=
e_sigreturn_duplicated_fpsimd has relocations in .text [textrel]
...
ERROR: QA Issue: kernel-selftest: ELF binary /usr/kernel-selftest/arm64/za_=
no_regs has relocations in .text [textrel]

Simple solution is just to turn off the textrel QA check.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-kernel/kernel-selftest/kernel-selftest-ti.inc       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest=
-ti.inc b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti=
.inc
index e67cd860..df5ff68d 100644
--- a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
+++ b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
@@ -46,4 +46,4 @@ TEST_LIST +=3D "\
     watchdog \
 "
=20
-INSANE_SKIP:${PN} +=3D "staticdev"
+INSANE_SKIP:${PN} +=3D "staticdev textrel"
--=20
2.43.0


