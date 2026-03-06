Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C9CFCC079
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 21:11:49 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5023.1772831500982044169
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 13:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=d6N3xklD;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.50, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvlVMoi0jlkPxoXLQTiWvUsuWGhko9nOSV/JQqhUKFfVpRifqEVEKTPxXDF4VKCQIEoCQUcNyCcjw54RsmmA6yL1sgJ15wF29VpYVc5oeyQc6O/8yDKPVrE+lZtgNERnvPVTil+4+MWmsMEsWRdC8XM0HO/0aKxIMzDBDSOU4VrI4BI101FXxt8XRNtKh7Wep+qDH3d7CffCEseMsPKWV08gtwS9l7SIJCoTeXtXMB4xXhXmQRs4qzBtIUR1HLdpcSdYN4luuenPGAGZvQLDoysXq2iy1aHnvHm6K+EKAa2ZyRpDhgx3Ngyj0Io4LyLY0HTNdGP1NlQikzMiQgXRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsOSnXpz2s/PJzjnYPNcM7XRQ/l2HDjfA7GmBUrz5VI=;
 b=EunR+gv5saPy/HojmkntqsfR8Sfob9U10kIIWhVmhaG7koDevs6CtigT9uR5aqMHdcayNPKvFvNsTpZHDO6rfLLsn3gq71fwd5O35bbjColNgVKpg9LxBg03tTPBJKRa3SYVhPsNm6JDmfRR7U/oF3icY21dQZDa0eiuJr78n7Dz7yaORKa/+0wqIjjcqO89xQGr0WppMDXOVQV5IgE31EYapwDSBcTyR+mwgxgF4WPTLaNeWVUE/VyxDC8BV/eXmvL+Z526TCKEewFSc9ZR+NdYYqIJI7vbin95WP0qHC+WVIx/40fAK81+Oxb35KBGkgZ1Spx9By5UIYsAydExtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsOSnXpz2s/PJzjnYPNcM7XRQ/l2HDjfA7GmBUrz5VI=;
 b=d6N3xklDopreZoUUHIUUOpj7Ft9FwpVLotxY8/0GN1Aa+MYP+26dkRdLqQ9HfJS0yGbe1SYZraiZGxzHNTCWw2aRjCFy6ogRqzsABZ5DsniEbhhsnVQV5shVqST7+EOcSpBUJouZ79PoWSg5VhEioZmKtc1jYap2x9YcFh/OiVM=
Received: from CY5PR03CA0007.namprd03.prod.outlook.com (2603:10b6:930:8::27)
 by PH7PR10MB7850.namprd10.prod.outlook.com (2603:10b6:510:30c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 21:11:39 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:930:8:cafe::59) by CY5PR03CA0007.outlook.office365.com
 (2603:10b6:930:8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Fri,
 6 Mar 2026 21:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 21:11:37 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:11:21 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:11:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 15:11:21 -0600
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626LBLhc786230;
	Fri, 6 Mar 2026 15:11:21 -0600
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH] ti-test: Add request and websocket-client to packagegroup
Date: Fri, 6 Mar 2026 15:10:58 -0600
Message-ID: <20260306211058.881417-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|PH7PR10MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: d5035b95-10ac-452d-eb56-08de7bc4f471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|82310400026|36860700016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	rFn29+83j1VKS8Zudde1Bb9M1qawR9ASPSU+za9e6zfPdEpHj1SYV7TWlrthBPOJvoGIdKExuhRSP7E8wRB6DnwxD9ooIKKKzDBzHUjDCFxJmTozY7WlD305ZpaHpOxEfw+68ycdtvsKYimBVMVBuAeRvuCDhPnkSzFaql1XlLN438b3F3XfMUvMY0VSRO+KxrpAfJNcxzZrLZ1g8dJKhiC7ZSvbk99x6I8VIl1GVqWuHJNZaCiU9fwwf1bRBdoyC1QzX9nPb048/N6Gz8CmzeiJ5MyI+y2sPKBJipYQbzG9oBTuR6eQ8hQWfjvmQJFwfzfe8vlrDASjrqb6vHiRkAbgmAR4VTxjX9C91umNHKM1CltBHZ7FJdNtGW0zE9YtLwHA7BrGVjlDpeFaeYT5nVVwy8qinASNEiUwG+Ft3uF9i8xoK6kdYf8c+gPfUDZx8PIH8EWI7LYD/qmsIcxZ3oEUorsg6JeM2ykIEXtMLiQqrXitJIX92oyRMpZe1Ki3yQemymPIn2BloRzZi3GMaNjND2Kl2CcGe2jjaQO1cPsrLkiz2PWe+LAFB/d3WAGUDz9t4iW/IXaF3CVAajnIYQVIKOz14BSbICy6a/YAqf7rpUtoHpAn2hlpnmBdhtqdXkb8sSwYHWk+lF4uUjnwUyjcAIKA4q3lQOcG6bHLenJmJn+z6EEgWY/SS+esaDfzkCHjZYEC6pHnw76vReDwf6roVQyylpNTaQAeovbXGJTQV4RZpTQP/dm5K2khMHGoRt5liJB21Ozc1V47nE7BCg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BfUOGJazP3qWjyT7mkdTLeyhx4Jr6h8phsXie2vn1z/eUBgS+sI+CD1X6b2VawHZTZAAl3A8DQ3XSAF8L9HNMowOWs2YRATO5AHZZEjgnyy7zYFtlRQagCf7dqQJAWpfm5kgdu49WYRS520BABSxwYVtQw+YYGR6IEoXAms6rgn8ILrTbum5V8+07/tX+zg5QfeRlE6tWxxnYjITcM3YRlCsfFapsWGNNp0emsEvQgPbWCf2E0Qc0V9Jhg323EIuQuLxz5xEj6PioSVriKuhk+pJ/j/XtWkHpHDvpioXl9WPk5c3pANETnbQzD+WztqOGLu35Ib13qxVRRfU6N/VHGqEvQ3o9qxAFmoTJZbJDICzqpQCsDhzL4zfY7/63/cYuxGB2VZrJBu2zg4mbrNFepiI8uXhpsoRq6/Unesl37Mh7PvekA/LMWalWbdMYMrA
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 21:11:37.7290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5035b95-10ac-452d-eb56-08de7bc4f471
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7850
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Mar 2026 21:11:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17277

Add Python packages required for automated Chromium video decode testing.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index f2ae1aef..15472466 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -80,6 +80,8 @@ TI_TEST_EXTRAS =3D " \
     python3-pillow \
     pytesseract \
     python3-numpy \
+    python3-requests \
+    python3-websocket-client \
     wayland-utils \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${TI_TEST_EXTRAS_OP=
ENGL}', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', '${TI_TEST_EXTRAS_OP=
ENCL}', '', d)} \

