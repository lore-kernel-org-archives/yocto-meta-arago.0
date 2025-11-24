Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13F8CFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 14:57:48 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18527.1763996258575418474
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Nov 2025 06:57:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=xY9zN+c8;
 spf=pass (domain: list.ti.com, ip: 40.93.198.60, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9NzrqFmgmTQFZVGb5qEPpnSkse7su6rpRRNKZbRjDxShlydVWoi09j8wsMfxzBHnSKGouVsF6tgq2MiNDUP1Gkz0xl/WVNz3TKC5oYpkzdr6KXPehe7eqBJGt/fyHPCMDcoxtCFFuGtEDM/c5aoyFsuTTQ4r4e5fRStOMEnfG0dldUT/cuAzEpv9HB0AsU47c1gf+mXMHJjxm9P2fR/2KFYKQ+dUfuTopJldzOFqcXcOLCYiDP2DNbUTJoQfwlilunBbQaiRhBmRYWtiWeMXu+aHwOYGYFvzLBVOEy7gSNKaxYI19A5ArHNp0kASy2twcYedfRw+fdsb0EeSyhA4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDXrpsZ0QOtSCNVWoEv27Ubh9XtSaWfUz2nYKxStWOM=;
 b=s2/NeR/K+Kp0LUEMxi2zxd8U8d2uHFPepNBMyUdv4MwerFQIp42MHtHE9iEYZVdjZsMdMd2CHSk/yZuzPAl+h8XWuUrrqDJPktP76/xU63PDRKg9RNZEktOcFbygHvZrpFKFSppz1o1uyI8AY90v3Nw5QX0/cFjta36bMT7ZmkH6g4HQDInXpsbAl0XRIV7I1NWkliUYWv2usTyjdj+1cEdlCL+ieqNivrpXiCyDsvET3dH1M4a2DBiXDHml2zx2j32auQMe9UcjYvi3vb4kQ2MPXvMJWAPG5bqYpSdL+LvZFnV/Ner4x3ETWr3r0g9vSNiSueMZk9DH4suM9N/5hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDXrpsZ0QOtSCNVWoEv27Ubh9XtSaWfUz2nYKxStWOM=;
 b=xY9zN+c8BD8MgEv+UUFyZh700LURqCc9Ga6VC6+KLIl3Sa3igH/xKhyU6rca8lxHHrzQV1C04VvFtvxPKJVqWFf9zVblTYx88GWeFntTwcQ82GiwhpuFVXcBxpbiwT9mt/NQgG+U+D//cPDKTE/jqB3Zg/lkxqaHh4BwvkWokbIuj5pnBzx4AM6iCEdJBtbpas26UkThe1HIfLzmej09ZhOogh4pNk3vQw4RnfmDQQoal9qb16K+DjSmmIbqIHBO1Dwkm60UDIHIAOFoXvU96u6M4+UaRSrm+zBuup6tKMZbLlrk5T6iviuC7YNcOVErLMK7JYa/+OFVo03zT2psOw==
Received: from CH2PR20CA0021.namprd20.prod.outlook.com (2603:10b6:610:58::31)
 by SA3PR10MB7023.namprd10.prod.outlook.com (2603:10b6:806:313::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 14:57:35 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::5a) by CH2PR20CA0021.outlook.office365.com
 (2603:10b6:610:58::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 14:57:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 14:57:32 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 08:57:28 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 08:57:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 24 Nov 2025 08:57:28 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AOEvSl52086044;
	Mon, 24 Nov 2025 08:57:28 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4CCDF138B64; Mon, 24 Nov 2025 08:57:28 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: sadik <s-sadik@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
	"Prudhvi Veeramchaneni" <prudhvi@ti.com>
Subject: Re: [meta-arago][master][PATCH v2] coremark: add Coremark CPU benchmark
Date: Mon, 24 Nov 2025 08:57:28 -0600
Message-ID: <20251124145728.3140980-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251124143532.1964817-1-s-sadik@ti.com>
References: <20251124143532.1964817-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|SA3PR10MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d518da-69ee-4914-afa7-08de2b69cc04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vlKzDuIvuJyCIVMC6WJta5O59ZjLWaxu1IcUhURI5ySMMKNfagfcE96MeuSP?=
 =?us-ascii?Q?Sak1yHLhGobFYUJyxLfMkkjXCScskAmJJdTI+z1ZRL9taxmZzIdqurCvW7T0?=
 =?us-ascii?Q?0rvQehxl0/jkzTMbCrw4jbKNdXyjHMmkygSNhaEmOZdUKjSdCbvX7YW8H3ue?=
 =?us-ascii?Q?RGjvFiq4m7p13P3fhLAQexxGIiAtmz5Xfks+qpwq6iGP/suMIN652NQQccF4?=
 =?us-ascii?Q?PkWeid69gZuwZ7DAb9ddlmA1P3ZYLM/IFy28ngsjQWvMPybfkt+YkakmXfoS?=
 =?us-ascii?Q?cUXkldAdoDMvPtmU1Ym9eiQOQnlOe6Cb5sszoxAzYrZkUTrlpBVqauqi5g1D?=
 =?us-ascii?Q?oMLLnb/MmSGokpjUff+Du9LsNvHYAgVItgK3rvmGld9Hp9cikpKTG1KFEe6R?=
 =?us-ascii?Q?FqUBitaB9L2niPrhZQ6JVMB/4Sbgei/xI/2EIHeQO2x210UTo4a7Dv8wwJV0?=
 =?us-ascii?Q?IMGdEKZpXJSHGwICUOQpQq/1/QkrIBm6h3rRMRWiE2jxFCH79HRODMP8Y8N1?=
 =?us-ascii?Q?nYrrlKrJ9vgg6kSjgVQqS8KscYlW1yq7pCRxcxY5BfJsooozcJ7/rULoLJZn?=
 =?us-ascii?Q?vqm1VTc9qiDZXA7OEaVOSmuhB07MqnzHUFSCeqHqnNuOq8D0KpbFSpkvNCln?=
 =?us-ascii?Q?64gC6QIzVWK2vn9RFy5f0a1EYFwTVGvXnjLohVLgC6vC8Z1+kq4bpwiIynFu?=
 =?us-ascii?Q?7qMTTn/pwYxj9Tv3+VGCHIsG+JMRTsG6TZSfx3yqc0Gx+nR4UmtYsTglXU/T?=
 =?us-ascii?Q?VYBtOW9NTJc6G5jhA4aP0zENQ8I+0vpGHFnAaW8z+7F3SbIMXGKH4v0tzVva?=
 =?us-ascii?Q?sUQZzXTdK0jARgW2fYnZSz2e49tNAPzDABZI7aEFkF6TT3p1WZQlos0PNVEP?=
 =?us-ascii?Q?ktsJ5V6VLLfZq7XIJs6Som04VmesBbA7sufRFefzDvKOqc0Jd+h1FTSkrRr+?=
 =?us-ascii?Q?6yQGbt8xzIsfqfvisX3c4qYk1761t3AqVTut74M8ktWoukMW6RYohNUUeFot?=
 =?us-ascii?Q?Bsg9F9orXm0sAiiG4Z2bCJEXvkSD1dc8ssfTBgnYRWI0b1oJSpIBxqL/jiXv?=
 =?us-ascii?Q?UP8O9VslQwQw1JDVj2wRQGaV24q5h2+E58HjsW3V5qOAJXampwyINSJcGiCG?=
 =?us-ascii?Q?AUVQ3HcV31JsAvWd48/zHQL7UziCUhp+8AkcfMX+lI4SDvnLTp/MCxvOwUWT?=
 =?us-ascii?Q?S+AknhqwTEOQamZAC8VnNjz5Ky0yUsvBvb/r7xooo+tuUlATH3YN/LWaPT6O?=
 =?us-ascii?Q?mBHEpVub0eW7IyrCfJy9jRZBnU1f6L39MOLyf7z+gAi+DUBmR4X1hVpLm4/z?=
 =?us-ascii?Q?yq6NiB5B3g0Y52NEkyOOcsbYVNPWosA6b/OuZxsPnSUPKITiXUbDIqhc0GVa?=
 =?us-ascii?Q?cPzTZDB9CjwfaXH6ngBHuktUzjl7vBhygdA9WvD7F/dPF4RSdW39K7Yal0yu?=
 =?us-ascii?Q?wjO0fjWWCdFOuOhrEHPqlAkpmZuaxqYL06sFaI2CF71jkCzN6x1giPSL9MeC?=
 =?us-ascii?Q?0ToDDMIvD3mycrVqMOkTI6R8g4dS980ugLJsIHBvxrNj80xki18CxPhVUWhB?=
 =?us-ascii?Q?iWHnQdoX2K7AzckGrdc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 14:57:32.6814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d518da-69ee-4914-afa7-08de2b69cc04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7023
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Nov 2025 14:57:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16834

meta-arago / na / 20251124143532.1964817-1-s-sadik

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH v2] coremark: add Coremark CPU b=
enchmark
- Submitter: From: sadik <s-sadik@ti.com>
- Date: Date: Mon, 24 Nov 2025 20:05:32 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b6efe0f3472442475796c8d844307545f=
48c800c

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: nnshark: Set missing PV
- Commit SHA: dd71cd480cef2a081b1383e05fd290c01d04ad62

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




