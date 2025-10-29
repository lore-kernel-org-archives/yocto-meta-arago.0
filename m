Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE0CCCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:50:31 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.61])
 by mx.groups.io with SMTP id smtpd.web11.14254.1761771025883349063
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 13:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=AiKs3seR;
 spf=pass (domain: list.ti.com, ip: 40.107.208.61, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amsxPsN6RD/nAa7ExBHxX0Fm5GXCau6AAhiT+A3k6Q2furAX11yC6ptfLMjv98JxZFtNuSLyXG5cq6ETOuNTVGNUOhPKE2t0D7l3Q4TXsqKuwKbKcIdkdtXQzqWj20lZafHmQQbwGc2BTfqzWRbYGFmkxonDCJfJJfXSv7y0mJAATOgKrAXSR+9sEGRbyHsNL6Jo07OmwdJIdQ9qqhGTr9kUhGSvngwfqavYUQkRR/FsehF8mBVr2Q7z5AzTe4kXTfssb92/VF5Z+b+CywBNq5nW3lbdNnV+BlgChQhI2v2KDqYy3nnHnP9VQNYx/D8+6L0VvNuIJvGqmEstiVTEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUGJSS+/ymIIsDXLhiPKUgxJSGfUY0IZq5sqtzM59gc=;
 b=D4TPe5l3juHSl5cExwEgRRQFj+4QYOz6JAs/3J1Hu4vA34cnWkV8RM2jGnw12B+8WVx93AZ1mbkRhCxqgOyZbTKT9AbR80gzAEPDYzmMfHn6Y4/Bje4A31bUyRuZkBmxI5dOifa+FmImRatPfzEPbXAqPd7Xxaynrlwk5uj5X7Z2qVOsvcCS5lMy5B6CQfUXUrWdKU54d4vD7YGSbLsNidy5fYpWClIFs0KRZssYHMuhQ95i1R5txx1+CQiBfZRYvn121KxVhg76dp+z9o9DHRg8oIJJsavGVcNkP+IZlEXFY5AiARl30rG/Xl5rk0JuvCSDbdFA8KW2cgZPumwxBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUGJSS+/ymIIsDXLhiPKUgxJSGfUY0IZq5sqtzM59gc=;
 b=AiKs3seRna9TSaT2Dvlb099Fi3OlDtr364JqfLHo5VnxCC3Z3AZ+GBjgofeH/GCqaiHhyq0tUhQMoPzQTS5l71Mrl1k17fxLkKSPUTDtC/5Wfm7p1+IHwKv0EV2TY2M93HIugr/ozwT79Ncf86y/E72QqGTOrN7dda+wrmJD7LnClm3Yj94FliNFgHKijCOvERvw0+s51nuB4X110gd4Qi9/51tmJk6V8adZK0HEXB/8RGJOy3HnKnyXhmHvM+Qc9gFRvVwb5GY40QkZAqrlMQnDqfjmkaZ9GUSQ2mQYmX9sjh5rfc8AMUM03VbWheF1hDQcmGkZFWzqaFVXfApCiA==
Received: from DS7PR06CA0004.namprd06.prod.outlook.com (2603:10b6:8:2a::19) by
 DM4PR10MB6015.namprd10.prod.outlook.com (2603:10b6:8:ac::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.13; Wed, 29 Oct 2025 20:50:23 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::10) by DS7PR06CA0004.outlook.office365.com
 (2603:10b6:8:2a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 20:50:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 20:50:21 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 15:50:18 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 15:50:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 15:50:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TKoI57478067;
	Wed, 29 Oct 2025 15:50:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4318A13F532; Wed, 29 Oct 2025 15:50:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] meta-arago-extras: Add missing dependencies
Date: Wed, 29 Oct 2025 15:50:18 -0500
Message-ID: <20251029205018.1905752-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251029204535.1395-1-reatmon@ti.com>
References: <20251029204535.1395-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|DM4PR10MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: f1af63ce-5691-4d50-e3bc-08de172cc6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|34020700016|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Lby/bTo9mU0JDLw2qBRrtK+/l8lCpNBNWwdEpYo7fHu3+jBJesv0jBS4gbe5?=
 =?us-ascii?Q?HYAEaBIKWomcK8Wb2VNUu1bUiBBVBQxK1iJHQlK57LPfNDxMdyzlpmXt/Xak?=
 =?us-ascii?Q?Z18m6BnCz2AGK/25kzrpBhDBrzYq1HB9zdM+Rh7cez9g09ja3WVmtWImX/7E?=
 =?us-ascii?Q?VdVV8i0SjG359njIjwzp1iEXZDHefLIoboFcaeKpW0ojW8ECCLS7WaWtkFgk?=
 =?us-ascii?Q?rGaJptVzr1CTmTNLPnJm2P6X4x8ytN1RFqapf07mJ39bScVQhVoEwFtKImVg?=
 =?us-ascii?Q?xL5aZo62jewPxWYShAEVNd2XXkBVwnZxVJQZOVq1Yfh5PCe4tylqHJveR1eD?=
 =?us-ascii?Q?WbYPDCInO3zLAkTQWu/I8v1fdQdO9ld7z7m0D9fY0bvwdk2q6cI4AXLFDM+i?=
 =?us-ascii?Q?Ww7s2xo3S77zAYiT4ebGHnE+yXp32QQx6VQO6HUm82QSGg4To0byJEfE+QQp?=
 =?us-ascii?Q?R7zKGF2J2UvFfdExRw/D3f1pv4gRL9IHK6wcLR9DjMpl/4MXTLvMnOlPQtHF?=
 =?us-ascii?Q?EBe7YqOuoTcL3it5d6z91xDe7oIIYsT+ROwwVsNAFu7+CFb0tmrmDoe6J6Dd?=
 =?us-ascii?Q?gTfVlyXe8ULG6d/mvf5rrvG9gUM7O1AmZe7GvVcVZGb+MW2wxdKFzo1EKqSI?=
 =?us-ascii?Q?Fnt/f4X6aD0qmj2Dlik9CCXHtZTi5CNcK2TzKIojORbVv9z/beAQ7bbKgVYx?=
 =?us-ascii?Q?QOgzSXT7jH6aST3jvQJYpW4rJ6m/Gvarq/08BkMnDNtPZ+IquyL9uTGGR+O8?=
 =?us-ascii?Q?opcHxiKuB55pw28IXzXSJ+H71pJljH/AuRSfYwgvef3GlVEIb5cx4Ooju3QI?=
 =?us-ascii?Q?jqSknQ9TVxynh2Y5Smi+cc2r4odofL5+ZSW0XIlhxE3RdIxTp5qbysR9AQS5?=
 =?us-ascii?Q?29Nch9pSqM7zFBipXuX5QOFAa6U9Oia5EZNscoNw3FHMcCYDJyZrJBSWrWX9?=
 =?us-ascii?Q?Iq4VDTTiJMmaE+gPuLda9nHSIuiQxIXDn5da+ApbcuU8RCfXQCKJRIDaK9RR?=
 =?us-ascii?Q?eZ0lpIaRjjUyS39P3m8YtRKS53n46vRRkm5nszoAtBKcD6kNujM2EtNCiWSL?=
 =?us-ascii?Q?3GnBl0z3krER8rxc2O3Zk+rSrZu6FvsrbJ39J8K7rUifD3NSGTWz9sJK9yiC?=
 =?us-ascii?Q?Hwtu0qKl3H/wvXm4D6ttvTywPCnF2/ChBRusk3GF2R5EWdv8Voi4r6av3rMH?=
 =?us-ascii?Q?j+iVPrE75oRp99fAOUJH65gG2YkDl+FmNL3kmQPIuY5HzjTx/+tD/V+qKeeL?=
 =?us-ascii?Q?TbtUsZdqecIBcVJQ22po2+m2V3T3iTrHJjrFkSOWy/AoepRLnMfpxsETbEhR?=
 =?us-ascii?Q?0eiWiF3BEYkpBZHShBvgg/ZYR5YACe40gbB3+MGKBSgXouQ6Lo/cTb/AF8Ju?=
 =?us-ascii?Q?6nd/6nGGnejHQvHpcv4Kw3v/Os/bL+olukcjM5oD8/HYVdLNvxacdx5utQ0I?=
 =?us-ascii?Q?2uDWdOmDa+uAh+5V2aGjq+658b36fOa1gZyUJvc7oYtV2xFHecdXbGysok7s?=
 =?us-ascii?Q?gq3mC9rb9naNcnbt/eonBf/bm4c1uLYhVVyXyQTdq/3Z3zo08N0lzGY3/tkg?=
 =?us-ascii?Q?WRFgCDgr2CXo0bnUjnk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:50:21.3709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1af63ce-5691-4d50-e3bc-08de172cc6cb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6015
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Oct 2025 20:50:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16713

meta-arago / na / 20251029204535.1395-1-reatmon

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
WARN - [meta-arago][scarthgap][PATCH] meta-arago-extras: Add missing depend=
encies
    WARN: Commit message does not include file/recipe name: meta-arago-extr=
as: Add missing dependencies. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
arago-extras: Add missing dependencies.
              meta-arago-extras: (COMMIT-MESSAGE-3)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] meta-arago-extras: Add missi=
ng dependencies
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 29 Oct 2025 15:45:35 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2138eee94643c976a9d7715eab3b49c24=
2c1be2a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202510291355
- Commit SHA: 85c1d8ce7e74cfb9005d220b23b8e0e94f0d2187

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




