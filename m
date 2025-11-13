Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8426CCD98FC
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:50:34 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5622.1763074225495559616
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 14:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=YDE4xaEz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.29, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzlPnP2HkeWK/ofbkUyljbC4IB7oDdrKJ+uA2gRMzTiAw3NMRvO84DrCNUH5gLlXHVBnYinvi7Q1ZMh6OrMemaeEB7WN2sLcxIukx+9vQbsg9Y1SfGOdEjQoRsL/rFQohfjqrJGbCewJEuzGiH22LLQTAnGg9agtxqf9nrnuqGPE+5KmfVPirasMiSLHiH4ScCZi29uWAk4nQAuK+nWhk4b/GfLD7RSY3C2ahdauvTGLlK/Bqm5mq3Jz9DnLNYVAyEyt42vG9HziuPXLZD3WtaN/cgot2Hr6UqrNNS+a0p723/sPK7TE9/GOOUA42rfE6i5YtQNpzsgBbtSwnha1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGCSXn/PZqgOU/2PCj6KupSYLdJtfcMaTDz1uSONyE4=;
 b=qAsWj+OmPUz9Gbx6awKa4DWPuW6q9vVYJTMmWGXMuSBKoHLk9tQa9c7WA3YfAoQxrqpZXY7la3kfZVEQSZAqHrcZ5WTohMndvXRrGc2kWB5pz/T11Jf1z2Ax9WVz4nF0ogJDaoOifqow7RT8jjlRFe6W7z5tWkP/K58n2MriJot2LfSWGW0/LQmNRe7pvP4odDP+99ukan8Z6fxxgrcMSOD95U5+gwaPbtPOWakxCogFr8KFqzsiQSjWl4PxscKfy4AE+tHuw1z2f8dEuvViD/moznICcWQsdRESO7Cg3TUFsqGAPeFNHvrsEJULASQ+kz5WRn32d+oUhY16ZFMh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGCSXn/PZqgOU/2PCj6KupSYLdJtfcMaTDz1uSONyE4=;
 b=YDE4xaEzs0UDszCDByd23CyyBytipNYUWtFqsX12Z8M0WjZaNUmtZs8+PZ6MriM8SGwLFx5mTxhBpM+Q7gFJWINEMmwEi+/BoCYWIwX69xOPSiG+cgjfLV7ie8YjC9GCF9trn54fOkRKHyISZjaboKMY6LjUtmTSz1zX7ZTbM+w=
Received: from DM6PR07CA0093.namprd07.prod.outlook.com (2603:10b6:5:337::26)
 by CHAPR10MB997723.namprd10.prod.outlook.com (2603:10b6:610:2f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 22:50:22 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:337:cafe::38) by DM6PR07CA0093.outlook.office365.com
 (2603:10b6:5:337::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 22:50:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 22:50:21 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 16:50:18 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADMoIj3976591;
	Thu, 13 Nov 2025 16:50:18 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vJg8w-000608-3y; Thu, 13 Nov 2025 16:50:18 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 06/10] layer.conf: Add missing meta-clang dependency
Date: Thu, 13 Nov 2025 16:50:13 -0600
Message-ID: <20251113225017.22994-6-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251113225017.22994-1-reatmon@ti.com>
References: <20251113225017.22994-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|CHAPR10MB997723:EE_
X-MS-Office365-Filtering-Correlation-Id: 2595c197-65c1-4ef8-061e-08de23070661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eW2863G5OVw6kVs3Gmp2zgz1ZrHK8gYSCkHQ1S4t/WQyAUf6Hz+qAgl+5Ul+?=
 =?us-ascii?Q?Mr7sodz2RUdX1o6sxmbX/RnEg6zUmAjJgRiUtNeL2KDvTfZUTaLC2EQl8Va/?=
 =?us-ascii?Q?De/rWUeH6HHCmSIavbuR913aqCTWOjU21haM+M83b0K97C5pSOwjxBLQlhFl?=
 =?us-ascii?Q?hx28T6hJVTKsvPKzCbQL0XTBwgrsErx154iR4oFbhpgvM/6IWjUeUKv7skOD?=
 =?us-ascii?Q?Duc8W8BDDuKoanMgr8FAIS0nZte8pc45/CWDSj6UevhQLWe8+51jJYwVyaV5?=
 =?us-ascii?Q?LmOmEg1vwoom9j9FPKMUxLNezr8HKAtk7CAih/swoqVZqSXu+8HCWaMJaKN1?=
 =?us-ascii?Q?gQ8NHcBvk4FCQMSA3r1Mi0KErxwZeTDbRwj9vHwpHgqjqYhrHtZbizy7MpFV?=
 =?us-ascii?Q?wgu1Ba04O8NKWVBfYIGVwzWVeHIKKsGPX97UL5fEfaKcFOCZMNuVbCOVq0id?=
 =?us-ascii?Q?dc47TW48aWK5Xn/lVAUnSxtg2mqZxAIKUlckV7I0ReV9BehUWDWBt+r1danP?=
 =?us-ascii?Q?LZ5N1zg06+HK6e6b/dMzm4ELy1ozrcvrW9Ju+S3in4MML5w0SwOSSlE4ZFAQ?=
 =?us-ascii?Q?MBTs4MVylGKXvl79u/3+TB6xHzlBC/enf5frrPs1hVVupBCw77nlb+lq9G6R?=
 =?us-ascii?Q?xzStOqfJdcyAgfCuD8FqoVOZZ8Aye9VPjx+6mLbH55CCvKjkKCvY1rZI6Nnc?=
 =?us-ascii?Q?GwCHJslnJVtN/sn7yrb/Dcpiom1ESv4wKkq2eRCBGUnx4LFYP8EF0d4uwYB4?=
 =?us-ascii?Q?m3VhS8yibmkgdJxfp3FkeSX/5mINAylQFBq9v5mIeyzVXdaquKHHV/BFbvdF?=
 =?us-ascii?Q?1QaM8bz1Rqmq2Oc9TuX+ClryDO6Wn8i6wcanzcZMiMo0OHWNjMbZldSRqgFJ?=
 =?us-ascii?Q?awMYL6k/rflx7/s9XUk/3I0DCZGTQAaYne6DPpbe66cfGb6/mgu2ZzdA/D/0?=
 =?us-ascii?Q?2WGPuWNQKxkVpSNo64y8WF5BgB9quJu81efpat4iDoZPn+v5smrvP6XoGodB?=
 =?us-ascii?Q?hIgSxa1fkR6VP/Nn7xiPFDwN3gXkG4fNbZobSOWjR+Kjov+6JD/Be7XV88to?=
 =?us-ascii?Q?8+BzyYJ+Xf+sbZADgaUs+kljlNT0Ry14F9p+OHw4RJiCqCQEFyIMJ0PAOOEi?=
 =?us-ascii?Q?MGAubWlieRz11h90MU2i4ZSWLRdPj56U/FmzHzqs2/AcZE9UnsVo1S9EQahw?=
 =?us-ascii?Q?IKRPjwkSAs09MDtdobZmr4kd//ckaaVgSPmDrEzp60r1h5b4iC1ZgGA8PF3r?=
 =?us-ascii?Q?0Hqa+piZJgdabLMgDI7lAqZGtinD3IpGuukULautSWUoYuiLWPoo2eAxvFU3?=
 =?us-ascii?Q?PxLVfSna32B0bGyZisSQYuGcsDX6ukUaj5U0KhTYbcbrTVz/Fs1DXqIMJ0PA?=
 =?us-ascii?Q?imyPK2IUv88Oh39sGUt8cmzQklpiL9JDN66D81I3JaFLXanRcnLZoGJA2kFd?=
 =?us-ascii?Q?e8sSXI75fap3e3/p6UC7AE0+ggrPyn3qzYiX14lSeoskgn3l1J6K6pOUg4fm?=
 =?us-ascii?Q?8d/5gOoGa51ItELYb50XWgaOTHn9jbCanrzwSmPBG2tBkeJ4VG4+oTVqUvFO?=
 =?us-ascii?Q?VkxZADnE5MAdnMEXxos=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:50:21.1022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2595c197-65c1-4ef8-061e-08de23070661
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR10MB997723
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Nov 2025 22:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16755

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.conf
index 0b0874fc..aa5ccb82 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -21,6 +21,7 @@ LAYERDEPENDS_meta-arago-test = " \
     networking-layer \
     filesystems-layer \
     meta-python \
+    clang-layer \
 "
 
 BBFILES_DYNAMIC += " \
-- 
2.17.1


