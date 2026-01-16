Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F0ED4899A
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 12:15:46 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4783.1768565739785086263
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 04:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Ryjugdmt;
 spf=pass (domain: list.ti.com, ip: 52.101.85.1, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBCJpQ5nntbsFZvjHxA8Sz5/2Q6WsJAfpgOaQfiXqRaaBAN1gurp2Sb4xGObbr6XZrMW9kPeGvSKDIBLryZxLivpwTJBUWR2P+40ieu0z8bg/YhVpiGzI7QdBd+F+2tMjMvHwQdYhs7sB/z+RbZN2wNGncEANqUiNFbj4vBy4d8Y0mR9fAUL+cZ9CtW2CBxlJQx0FCfIZUz3OzKgkgo/c1actm8RpEg35+DYTHOVYqatG5qjZQ+ToaMlQ0tnyHQu9IFCfEymSMCpuZGHva5nKthZE3lTK1pd4Hi2iVh+xH5P9bzfRRKBFjvk8hRcqg3ObZOafUsZygQAfuTvF6oZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KB3AztxBj7lAUXpoC4QeZ9lhfERYaxalZNyo6HBEeH4=;
 b=wvKzLIaPJmC1PmKJgx1nigqh5z0WRc/AjtO1FG/WUY+m8L4y67BhJJgc1nHWiL5ZyiQbveoU3sPw5QwQCZJ4WJ4PrWFRxZPxwEqIG0zAtuGOIAmM9hcwLnMtp1OjOv/j7cn/Ksfbym+QYDf3wKxd8zUhvIfZFyWx13zuyYfp3IRx92jsn/G9ZDjbWrZMk2qd41njfVj4Lys/wIRKsBI5iJdfVYmSbcx6MWO0IGoU6VYXr6ployOSMrM7lHo7HiejywQnn6j0fj7BVYZ3m6QeoTysUUYKDfXNYLtTsurcbxmq46gC5C3apO1nje/KW7OxS1NOEdorUot1MOi/lu22kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KB3AztxBj7lAUXpoC4QeZ9lhfERYaxalZNyo6HBEeH4=;
 b=RyjugdmteJdbQL/6qq1fTUEGbQzsq5LPS6cFNZD081GpyuujrCWMzR65GiP711gElEzFmc6K0vpNtvSh2+mYwjacGN/0zblpeKPGgxEuomuNSpTB1egAKcbYidDtEJvufcym8f0i/ay5DQgTiQUPD9zssZU5Yuc+XphC7Q9DC2gB3p4mh1I6Bo3vtGD+9jGDQf38JHpubkKSpG4eEYDclhk0Hfqq5B8JE7m3LYRfOFbFV6zvBR9/k2YMcQje/QyF1BRRe7q6EkH5qRaeVjnLnu0poX+CmhLeUBhvmsTDgc9cSvo6KrCrmCRu4r51HU2RfuDN8orSMJRbkyquOojGjQ==
Received: from DM6PR07CA0038.namprd07.prod.outlook.com (2603:10b6:5:74::15) by
 PH0PR10MB5708.namprd10.prod.outlook.com (2603:10b6:510:146::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 12:15:37 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::85) by DM6PR07CA0038.outlook.office365.com
 (2603:10b6:5:74::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 12:15:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 12:15:36 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 06:15:36 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 06:15:35 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 06:15:35 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GCFZUm902179;
	Fri, 16 Jan 2026 06:15:35 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A76EC9ACF4; Fri, 16 Jan 2026 06:15:35 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-arago][master][PATCH 1/2] gstreamer1.0-plugins-good: Add QT6 PACKAGECONFIG support
Date: Fri, 16 Jan 2026 06:15:35 -0600
Message-ID: <20260116121535.4169099-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260116121044.2028660-1-j-sahu@ti.com>
References: <20260116121044.2028660-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|PH0PR10MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: dd98ce54-c200-45b4-9608-08de54f8f491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+/3E7yJKctpVYOE+5KTfnK+hozCZlVXFuGVnAKMBfeS2cxw5Lb9EyNU/FNzG?=
 =?us-ascii?Q?3Y4vk5mEEi5G9r2oAX4AMuAg2SJ7P6bbHopbgVhSnl2j+xZfXDrbMJ9LF9K6?=
 =?us-ascii?Q?atKhGxC7p1oY5h9X7EQMNs8i+W66eBekVxLgdSACq6y3271oDlhc+ywb5tnp?=
 =?us-ascii?Q?JjmHR6GTE/y1ZnyZv9OZ4qol9INc/zBbfYOaCxNiuZj7ZkKVsW7IPOW1o0Iz?=
 =?us-ascii?Q?uGOrJVMqwyue/O74x6OWo9kNduHF24meFqbvF44V+dRXm38MElnGjH/PtJnj?=
 =?us-ascii?Q?9iOAiPTWH0wMTy10Vq4fkil2isWiSi1NijbjKqLyDta5tMflg7JHRLiq7P+H?=
 =?us-ascii?Q?XgvjmvMjIIeOn+YenVsvZ6lEPIcxItnDVSsWwh4zwk51ipd4Hw3G/ElXKi5w?=
 =?us-ascii?Q?N+Wf8coP5IcqOU9x631+M7Wd5/dEt5kV1Vv/fLfxFIY1wxy/fdweEurr707J?=
 =?us-ascii?Q?CFcJaGuJEHp2T96VRdNQARMjaMiMu+7Dg3hDiDwC1m/DjtI+ER84EPwgWt3d?=
 =?us-ascii?Q?m72mpzt2wfhorr2R/FJEgAYg/DHxagbIh+kfBCvObmI7vbf+yb1l+g0+1oY6?=
 =?us-ascii?Q?2tDWjaOsfOpaex28iQ5DuH0sSPBOIxbOj0/jjZiREuoMsEta4JG/RxE7M9/T?=
 =?us-ascii?Q?C7oKQ3pU2YpGQwgsTQIzF0+jtDLlPHJF4zYZl+b7XvGH2Rq8AXNLmGTyqzRg?=
 =?us-ascii?Q?M+5Sj1ZNvL9bE02gqV+Jkvis2/sfZJkINLUuNJU0ZSuz/OLHjYnS/Ic+ZYqS?=
 =?us-ascii?Q?eAGl7xkTTZW7iwnZjQKKzllJOG4hF3925CQ1NkX2jPeJALL6PjO3yH/ZFpmB?=
 =?us-ascii?Q?gSs0BaaVGhWs9xb2hwypdEpQ6x5FBM74zrIDvrS9RdsyUZtcOLVK0f+BmZco?=
 =?us-ascii?Q?PB7eWk3dsqvAs1WHtJk1oo81mZJKPCJT7ZOOfj4Te470X5i047GHCuVNJyGw?=
 =?us-ascii?Q?IysjbhLd/sB51dutNC7Nm2mv80+NXYnoesrLL0xl2TvxWXr6+rSHeTObN7Jr?=
 =?us-ascii?Q?FDliZOyLh2N1ME3piSFLHVkr1nTvhPud3QjWCilTMw7eeSFX2UeiYy3UDCRG?=
 =?us-ascii?Q?ByCMnwrSQK5EbgsNpfQliS/VONv5/eDCPbW0TkU1Yg/4R77kI6Mlg02glIWv?=
 =?us-ascii?Q?QQ4Z0kxpjrkrUu0MvD2M+WKewrMzipDNlZuwzP27HP0t2xwT4F09nJvOPQ5/?=
 =?us-ascii?Q?gVzuEfhKP5lXGQIdYKzNTlsDlbFXwKMKu0wTjqkvKzncsoH0OnS24SzmZH23?=
 =?us-ascii?Q?FONrBRzlNmBCm39lavYqUxHWVj+v0STKfRt0eBobvaKegpouRoOq1AMWUEAu?=
 =?us-ascii?Q?SYIkED7uOIVJPUkZQS62JphNgPqXjVnCDFb1zrTnuobNEmSpagUfvKzovY8U?=
 =?us-ascii?Q?WVakjlJX036b+iE/uZxrGb7nSJjCNRvBsYKrUeuBcvxr6ju1Z6fxPTEU3yLZ?=
 =?us-ascii?Q?jivPh0lVFjtoyDzfFP8Njj+HL9TeJTsnl9wmBVHOwkXKtme9TfhPhZ7A4AKR?=
 =?us-ascii?Q?u70icOZJms1UzrjYlAW8b2uZV1x17U2YkPtJLOXL3q06NzdP3VfdQgFM867t?=
 =?us-ascii?Q?qGJLoOLXBB4AvdSytxAS7Rb8tm7JYgCRHBe9t1oYYz1PhxH0RXnJGFqG6XLr?=
 =?us-ascii?Q?vg/bvY9ya+u/bRzwEb44Iog53IAUHMWkZnzenn/bX50fgMYcia0XSpqx61pb?=
 =?us-ascii?Q?2U4d9Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 12:15:36.3940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd98ce54-c200-45b4-9608-08de54f8f491
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5708
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 12:15:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16965

meta-arago / na / 20260116121044.2028660-1-j-sahu

PRC Results: FAIL

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
- Patch Series: [meta-arago][master][PATCH 1/2] gstreamer1.0-plugins-good: =
Add QT6 PACKAGECONFIG support
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Fri, 16 Jan 2026 17:40:43 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: f97eb19b5402ae13be6814773e0c1f8d7=
faf900a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: packagegroup-arago-console: Fix package names for alsa-ut=
ils-*
- Commit SHA: be06bc570c51981bdb0b71de0eec0dda1b52d2f6

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/m=
eson_%.bbappend
   =20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstre=
amer/gstreamer1.0-plugins-good_1.26.%.bbappend
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




