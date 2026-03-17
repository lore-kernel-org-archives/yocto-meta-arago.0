Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E0DFEDA0C
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 18:57:32 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84170.1773773849625445378
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 11:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=dmoSMTMc;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.60, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMTUi7a0gFAHs8tJeCTG6V9unhJej35zeB1ZNR5VFqqFst4yvLZQ9RZukEhFi884ep1xCOjy7l1EpuiqY3KBdue3gzwon2W/yNFqnNWUVPL6b/j0qn+OkHYMIVDNQgSQZv+2b24GJZ0GB0ViHPy+FkkzwwA75bQ39Uw+7plr84zksEOw8V5YL8IV1NW0GAHD2rnHJLSeAEbbCkxAoZOTYhmyYq+Dp49EE4dlvE2gpSEkJ1E/9vg6lf4m0mm1NoZHWh7L8In2s8nb9MQGSGAAI4+zp4dqy73HiYaQkKDH8tSrZRBDDHoKX3QttiH4X9fYnCNhwNc4TseKHzus0daSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4WT8PXGaQbtrBh6WMdaAZGGI3LBcVmHQZhkJpOdU0U=;
 b=kpRLjJ9ipHS3WKesieRw453/pIDKbWIE0Cf7lCbGQ9K8WngMguw7jjEgCwAYOTP9XW3QL2ULiM7FXEUv7qCbx+ZkP4sG7fMQQRkA4KbtfVXgTuautD3dhszMr+qTiKJvKOXkn8Fx6fxrmmmUrrpp8t8MmsbRMHEhUS8d96FjCQI4r3Hj6pFiYGXSvudAGQvbO5m7WhX8Zw/ciUxhxSABCZTSbwarZIsS+VD040b4GjL4MS2gXcIqI0TbwuOo77s0Ok2sCsU52i0Fbz9s2LGOCZHWnGY1P4UWTwnL+OjEEX5EnZvWrDAdgze1A8STxqNPwmxpag4vwD9S8Csgp4MUSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4WT8PXGaQbtrBh6WMdaAZGGI3LBcVmHQZhkJpOdU0U=;
 b=dmoSMTMcvWw6m+wyH5U7s4Dr6j04A89s8YdIAUzM0ukDDOdk35SpYLUxxJGefgj/fTM68T/lMYwuwpRtlsv//0hdgB4tdQTHo+Eq7NF0NTmQzJ3woc7HAOa98cf4ekKBO0wSy7aWdjw0tpW747UfQPcMNOiLjU7xeIUqMGwMkVw=
Received: from CH3P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::26)
 by CO1PR10MB4643.namprd10.prod.outlook.com (2603:10b6:303:9c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 18:57:27 +0000
Received: from DM2PEPF00003FC9.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::d6) by CH3P221CA0012.outlook.office365.com
 (2603:10b6:610:1e7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 18:57:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DM2PEPF00003FC9.mail.protection.outlook.com (10.167.23.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 18:57:25 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 13:57:24 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 13:57:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 13:57:24 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HIvOHl3199956;
	Tue, 17 Mar 2026 13:57:24 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] ti-test: Add libsdl2-tests to packagegroup
Date: Tue, 17 Mar 2026 13:57:24 -0500
Message-ID: <20260317185724.34717-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317185724.34717-1-a-christidis@ti.com>
References: <20260317185724.34717-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC9:EE_|CO1PR10MB4643:EE_
X-MS-Office365-Filtering-Correlation-Id: 84341414-e861-45d7-0187-08de84570741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0c0JZVcbR8cKJUu/dTGD+w9j9IvH0KfewibDLrOaCP2+gADpegf3jHpATfV0L9tKZU4M5mQBLvn7QBxdqt0C/Uk1GzHybmvNiQeUKxxWPl9V2PCAc92k2DQLQTL+njiohchXAyRbWrI03t/J4POPf9PWyFSv1oqyLBWW60/NGIZxJE6JiO+BPagY+fDDiEUKc7LhjWm0fI9kt9Y6NImxmtC587FkH0aK/YxK92nITOVq60pPPkYUYLUV5qrU4Bw/VHskQHo3LKB52LWAafXrMAWLNUlmzLKQ4vt672gC428Cpt8UH0C9KWVxjhOOrmJyRYTrY5frSTourVe1/CQXbRVzA8LXpWS+N0uqR0981e+0uGqZoM9lXppB2W4/LzBncgG/dw4H5wpqwFQ0VUIS/DhBJ4RqsEi1cuVyIQlvqMyuvtXL15e968FPRhdAvuQenm+7tKdOomZKlbRvvajn8ERKkL3L5CaYI7Brm3mSXK1yKLxtzNx1jXEYxjDfhqzTEtfLYxg44krLxCurwL+aMt36CL0dbpilPcfE5UkS9lk8epm9fTio4xB+pHn6XHpA1VvwKPAn9fCjlbi/70Bwb6a5Mdtx9ig99iqPe/iGjnXgpYSOKh/HWxbBwvuLm5sUeUqITNM0Bie8GsvKSGT+812nt6TG8nP8gLSKFuS77aAojuTZvQG0NfoQqOuufkMllqDPd7N6mbxzwBtNJnMIdW5DGHvpMRKR7PwjznsLmTXPbTjtzY28FBe+CiMe1Uqgb/mfRBMsddpitJfxXEd0mQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uAviTKyxLimWOVNTSzVmrGqIrPI845hb2ygoqH92CShP7EmsSxv3u0eL6oN5XljQPAoN9K874NWS1Kd3J44FnkOQRxDL/Gralp8Y5p3bCKb9Bc3HZXnILDr4cgnyIIb+gdNKPOXyscUbFT53mOel567UW0b0jq6RJWSvkzu3KWusl7edGya8+wv1gWQ7HrYKmeJdv8LbJRk25eO/II6O2lEK1TXvNPTRivxXgLrA+7EqWsRwqnV41cZ9b03K5WgylrkktSEY4MsfVQUnpMeZiEfuymmUsvaVImSTmdMBCkGp0ubvhOIIt4MF/kZIrb6/JBEDiyogtkLkvnYaGQwD+TFYU4xkQpZvy8PQO4wDgk4UaRAdZxI+a2DHEf6Diyd1iBAXIZ/e5ZiXri4FJn73C5wm4WV/8hv5SAaDuQfK+jVaJBbZ7IurcDewPzowMqta
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:57:25.0849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84341414-e861-45d7-0187-08de84570741
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4643
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 18:57:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17365

From: Antonios Christidis <a-christidis@ti.com>

Add libsdl2-tests to the ti-test packagegroup.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index b09ffcd9..df8f1323 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -69,6 +69,7 @@ TI_TEST_EXTRAS_OPENCL =3D " \
 "
=20
 TI_TEST_EXTRAS =3D " \
+    libsdl2-tests \
     python3-pillow \
     pytesseract \
     python3-numpy \
--=20
2.34.1


