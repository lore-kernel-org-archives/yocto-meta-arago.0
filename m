Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02503F31E41
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:39:07 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.133800.1775745541720487388
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 07:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=o0zl0iSp;
 spf=pass (domain: ti.com, ip: 52.101.43.19, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8yi0yBF9UlnwkVazl4d5+omIX/1WD9rjGDyfRxqMJbJgtohf2f1gtfZPNk/qShUi1Zlhnv4CXYDMgRoW3aHgOV4sEdw6BdMimSBkVwZsJvQ9tNFBXIkouPywLxXeGSdWJdIM6m69m8rm+kH+8PvotOa60APO6aclWbmSHlUJWzy0wRXz66XjLG+r46Am6B29Ri0jUy5uROpCM1ygBOi/SLFEsSr1dzUyiZTGxhbAG2+Xo6R6+etslZBbUVapKdtRNV7ydEi+RyF6P6r9tMeEyFjD7KY5IeE8fLVN+2T99K0z6rnajhHk9ujPrJr5/j1C71VQgnf/d8xCVNrzpezkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kq9nE0rJhKPwELJDqqKzkjlkkFx/rEWpClAdXjVW8vQ=;
 b=Z1DGbCfz3OW5oBbDiJNiso9Ckr6ss53vCtORlEWHNpyYFCwGeYv+85N3FBLwWg635hGHs/ZJFaOLJV7aP2QfT8aCfKu8OwUhDrn9eTtxvFjUgP3vzC/0gY7/kfSBGlYyvM+QcfssOjeg/1GudSTBE4q6Ue9D1yENh44m38UrqWhaliRGxS8Q4+LbqRDgYUWiK+nSr3Bm8F8R4xAA+wzGUhmo9vyB/BIvDgGS6qWjhyJgUNPYP11nVpD1OL8IVRMovm64hTZCp+tDbuC2kMzA/Zt/LDQc89S1rlXbzMiGnIbp2QSPtOIlKSU9DCx4ZT7SCPMFtWWZWkGvthhWw+bupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kq9nE0rJhKPwELJDqqKzkjlkkFx/rEWpClAdXjVW8vQ=;
 b=o0zl0iSp+PQCX3nYumDb6k9htqYuFVQ97Ep14K5Cykjj5ku+hUezYchO5/SxccUqtl2e6jDcIpa3/yFqGFNnn455+Mz9uoL1EbQLIiBeb7QgnLFPDAtqvPL5LvbFvEBVMCQiGmlkyFarTUoVHJrajvt7Q8foUUrZAJGdgI2jvXY=
Received: from SJ0PR03CA0386.namprd03.prod.outlook.com (2603:10b6:a03:3a1::31)
 by MW4PR10MB5677.namprd10.prod.outlook.com (2603:10b6:303:18e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 14:38:53 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::12) by SJ0PR03CA0386.outlook.office365.com
 (2603:10b6:a03:3a1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 14:38:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 14:38:52 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 09:38:40 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 09:38:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 09:38:39 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 639Ecdoe2741944;
	Thu, 9 Apr 2026 09:38:39 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wAqWl-00000005rfa-3CIT;
	Thu, 09 Apr 2026 09:38:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ltp-ddt: Backport kirk addition for ltp
Date: Thu, 9 Apr 2026 09:38:39 -0500
Message-ID: <20260409143839.1397939-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|MW4PR10MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b22640-04ae-42b8-b268-08de9645b860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	yG4ri3EVK2gesjhVG32gNxChtEH4Az8QACf86c6Zj6hM0cltkDH69BxW2x7h3/+kPfLaGDB4vgKiK0Mk2JyZ4g/MJjIPhcon1k5mA7gdYN2smZCV/aIIEIIqa96mtzwC6V2HTeSIObu21BsQLDg2nx/ETcLSIVnq2UPQjdP/FcIgk0XT+AQfzinw1TyK6FqW1IilikYoo/gJvLc2sJfSLRa8hf71LiAEyO2LatXKWyB0UPwBIwNBnWEydpK75/zo8ygOtCO+uHw3qUYMmF7ko/Njfg5nErXs9Hfyrr+xyBWAhuYkznnKTkP+GXrTMiQM2FQcyiXsLUKzXaH4F5UpASw3LkSYgQ/7lgR4jT2h/Ge/93VpkoTRN0RPJjoWLHyEn605jOMxF9Gu3C1KE1VekunEoas5aE/SaSz0bt7/ePe/6oXWPIuNL4sNG1K1+08kXPK1vDz2ekE/p5251SIA3yF6RGVkyXl3J+pM5R17s4VQWBd+voUx0q5k2h7Ok4oW62SMaoGw+YI641ZF4OgCy+tBD+KHDVw0Y1C3Cq34XAYCSsgl6cia70ymKb25HAPyGuvHnzE8UgbbEShIvwNIoHJIh2rIuGl8nUdyOaaE78aawPTjttzTs8hAZU62NktyBZGO4svJyQPbKirWe9Tpq50QG1OVKjRqAfQGhLQsmE4UasJ9303Mt6PRrLlmR+jdIN10I8O51lRg/wlqRbSeMAdpWKmb51vzNFBeRECaAHwRF4Ai/z5NS+zzxG1bvCHXMNYIdBvNk3OkW467Vd8saQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7I5g2Q09fSrzrSWg6s/s5/vL7OzXpnK2F9quFufunMw2Cq8+PY1hp9oU5F4ZvvgskvK2TUrk12O9ie7pGeFl82DC7XWE23mL0P7NQS5scf4mp0q27fdZtsLfK5PTsKz58UvfgW/oBWGlSc1BV4LotKMDoyN5lKC9yOylRwkKi+2KAn5c0TmpPNiFjRpSN7hEzKBk12bMYuoAMaZ/w1UFFSGqtRqBy+EXKckEYoh4qnJicb4cJTI01ZAjJD8BlxxR2LwA0GV8as4l5ehJWRVQMIkh3DRHTcjGkA7i7IMoXU7j8p0jRhhUlwmBQHnMBeDlR/858vHHDSxeH4um2lfWX5gx1WpZh5VyXvCAzh6F0+3A8BIgU6GYekmYVLyossIVoD2HL+Om3tRARaJea+3yqypYpYV8dXXt2bJtL+Jb4umwAU7D5oxmOCTF8LYqKedt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 14:38:52.2097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b22640-04ae-42b8-b268-08de9645b860
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Apr 2026 15:39:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17456

kirk support was added [1] to the upstream ltp package in preperation
for the move to kirk instead of runltp.  Backport the same change to our
copy of the rcipe.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3Dc1e5ed41337=
29212e6ce3e135a2e4d1d624de20b

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc b/me=
ta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
index 8786bb6d..4c19d870 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
@@ -105,6 +105,7 @@ RDEPENDS:${PN} =3D "\
     net-tools \
     perl \
     python3-core \
+    python3-kirk \
     procps \
     quota \
     unzip \
--=20
2.43.0


