Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E761CCCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 21:45:35 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10865.1762551926365867641
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 13:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=VTm1GjwU;
 spf=pass (domain: list.ti.com, ip: 52.101.62.41, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATu311nZ58yimYsjdMQYIb3iS34gtv5lNZpGP4bT9p2+GR9a7/OL2T6Q7pCRCCHTTaiDzu1oCMiD8Unr7+3+5++smoQ5E918fh7ioYLk1EFNxYtwtJgO2T72wNYcLESYnjqBUtGfkLs4v6oj191gMljYNrNQELjuq58rMmejZAVumENV/lr5y6578l0DZWLuLx/W1zUEG5zjzDeDZMwk2rmcAB+Z3HYXEiCNGyEXpPvOCXJNAd35h5N25AKSp42yT1J24qHikxjJGGqmcRbjBPNm7pwzmA9FxwvQWHW7TopuZq3sjDrV97QcmvAbuRp+fts0k09FUBFYivMcDoXN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwUkCxsOiB/PA5P+xjbAotx8E2bPJMWmd3/D9mjAu1w=;
 b=ax6Ac2KuFYDnQGctGMdBGHRKIdbUBLL4qcdM7JrUtOco4YKgtk8IFvRjKZCdZ5OswynICAvcx5wJTv0pq8daUGgWGYgg9TLY8VrMpOVaMFkc9x+kVXoA5jr/7cBbEMPPXfbrM821jFGT8hUQvlEKqnDc8xBGiQ/BAY8QWzFUj++4q2z6F0tfL5txU1FdIxGS+j6Bn2gBYj8ew22/8KHb2K+3sCi6ntTNJ7B1+hzuEXvJchxn0BOI4aKjKEYnD+CM2noyl3r20dxk4HeDdcOI/EBRuzd+s45e1kYElHVa0/xOYGYuaQdONWOvuVTaqt9PiQ61in2I4XxBKOY26qVjbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwUkCxsOiB/PA5P+xjbAotx8E2bPJMWmd3/D9mjAu1w=;
 b=VTm1GjwU2pv+46O8Y9DFcLcVcrxiws+Xz2Asxr/XDLN1MRZyuiAnznwsKgfOtJrEpKkSdlYhpdxR8cDAhuwcDd+ApEDyTJuJzvwWsAIb3njfGTcfYgmXRUw17EMeKZMd+N+84OkC2py6Cm0yu6u/nerrqIUWCvO6+7s/RI6DABSUH+XeOoD0n5y5THvPb9KcZj2I4CV0YPa4L/wfR83gcsi3OAMSfwGITCfuTKw3bmWL70ZvODn64k4h0iJYfNfrTLMfv2xp8xVdhiJ+LcrG5B5BU5Auwn2Bdk4Cm7PyNQIwShOq5yR12JmT7PGqMAWX+X209FmP0psuNuIxwT+HEg==
Received: from BY3PR04CA0015.namprd04.prod.outlook.com (2603:10b6:a03:217::20)
 by SA1PR10MB6470.namprd10.prod.outlook.com (2603:10b6:806:29f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 7 Nov
 2025 21:45:23 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::da) by BY3PR04CA0015.outlook.office365.com
 (2603:10b6:a03:217::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 21:45:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 21:45:22 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:45:18 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:45:18 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 15:45:18 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7LjIgI2452671;
	Fri, 7 Nov 2025 15:45:18 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7E9B39ACF4; Fri,  7 Nov 2025 15:45:18 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/5] tisdk-core-bundle: Make DTB filter work with DRA7xx HS EVM
Date: Fri, 7 Nov 2025 15:45:18 -0600
Message-ID: <20251107214518.1244699-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251107214128.1491466-1-afd@ti.com>
References: <20251107214128.1491466-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|SA1PR10MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb4ca81-698f-4b4b-f494-08de1e46f42c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lNyg7bIIPlAK69r0SnO5S4TpCy8+Mwl7uo1Xj2M25uvcstPM9L+XLad0Nemx?=
 =?us-ascii?Q?IxLeMQJ0V1opEfkbGwgadNcE3ySRu3Ov0TRcv9XvWs41xet+aimmttqsSwfy?=
 =?us-ascii?Q?e0fOIgRvUS1O6yra8ad7zom5+QydUDA2J38bs+hp/guvnaasrKvIcw+CyMhl?=
 =?us-ascii?Q?skYiYipp7QLNV602X0X40VsqRzrq6OHKGIqZaqlNDuS9SFZIhKC35wbCPqBS?=
 =?us-ascii?Q?drthV9Rlc6TJb7pVe57JKz+6lJczAHDNwu8lbZJaeR98K3YatuqWp6j4Gr6n?=
 =?us-ascii?Q?sy/ol2broFV/yI10NYZEePQ3F2xw8LMaWUmIlceW1db8Qdx7VKc93h+Qe+XN?=
 =?us-ascii?Q?a3KqgQjG6yZGBJdOOXjopf/wkStgCm8GpsMFVo6hAQRVpNX1FwwmAJI16t6w?=
 =?us-ascii?Q?4dSxpLHXazWfhzJvqynYZkqHldefa+r7vqqa1gApnFbZ6MRwrlHwXTaIP1ev?=
 =?us-ascii?Q?loByNC05ssvi1vD68XmaeRcoBCRt1RIA83PmlDnyj7vqS1QvNMhOhAelTPrY?=
 =?us-ascii?Q?2OkwUVnLgGWX2XCIC4iPTwkcIICJ/F66sqvCDQlvr0qEClBgJEuTVxEKewa5?=
 =?us-ascii?Q?Ap3WZHtWjMaz3n+CHZDaox61jGS/gbEELENHcXLxy/Tt7LDf+2b9qtZINzvz?=
 =?us-ascii?Q?7MqII6J+UR0GDIxyPeknXLiJbPOxvq6/HHBL4BWGtrd7GDd87ptFG7ElxU+L?=
 =?us-ascii?Q?BA/VZv+sIfV5QiuqEHFK2CvWt0BkztEyTFtd5cOIAXDDD2+uGGUbZBns5SAg?=
 =?us-ascii?Q?6ZKJQKHV05E0iXZgi2R18/ZCep7FRng1WW7igJxYlnpRVD5i71Fpf35CqIpV?=
 =?us-ascii?Q?9e53TJROyLvv9kSlD6knvFGasyiC3nwcQMnQihkCUIh+bOy2b2KPDM4aNZPi?=
 =?us-ascii?Q?YLiX1kB4oL062VrsFVfdL8wwYnehRTNtdwA2CW9qQzE7dgRv0CCqeWBf/ijG?=
 =?us-ascii?Q?0kEPOakjjoyipH4bjkhiZDEQWxZIDC8huv9OnAIRdyL+C7hMXlzYSBDOxkod?=
 =?us-ascii?Q?yC7erwUqTAsSQJivebj84a6hkSCDXDSR2B3rOtw1rFvUIXELPpKvxoa4b3On?=
 =?us-ascii?Q?mgcNO93+Ay6nfg3ym7A5ovZLxb2Ks0u2PrJRAAM7ODXyDRQSZzzaEgH9eFGz?=
 =?us-ascii?Q?3hDSpc1nwHVaY2ZxAGAFcb9+WM/APl/QAV/y3JgFSWM/ROuaekqPMVqSfGgu?=
 =?us-ascii?Q?/yX0CDeBqPxX4JiS2+K2jEKT+ct27dD82/OHkFZkvE+6QFDUKAWP+3Ix0OLX?=
 =?us-ascii?Q?+HwJhOcA/tZu1RFnO/axNVsKCFYuf/MNnCFo2RJliI738J1/K+XGWggOtRlW?=
 =?us-ascii?Q?73gd0rZ86l+t1rB+uTxsDxAaSfEfKzWxDGm+qIsCUxr6sphg0jQ2368rvSgj?=
 =?us-ascii?Q?pB/u6GlvolBcyw4NEs9MF4SppNNqup28GJjtth/UtmeKClbw3xI3x7XQIDrF?=
 =?us-ascii?Q?Di+EDQhqtrHV/F/cqw5dVrm8E+/n6cVGq2fndRzRBQuyiletQET4A+TVhbj4?=
 =?us-ascii?Q?Y1K83pfRDxDm+qdNtZKAdO89mD2hpX73verA+hLdAg4LSXXuqZFotqcyODD6?=
 =?us-ascii?Q?fzuwAlkHgbV5icg6FEo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 21:45:22.4964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb4ca81-698f-4b4b-f494-08de1e46f42c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6470
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Nov 2025 21:45:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16738

meta-arago / na / 20251107214128.1491466-1-afd

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
WARN - [meta-arago][master][PATCH 5/5] packagegroups: Substitute am57xx for=
 remaining dra7xx uses
    WARN: Commit message should not include directory path to recipe: packa=
gegroups: Substitute am57xx for remaining dra7xx uses.
              packagegroups: (COMMIT-MESSAGE-3)
        patch



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
- Patch Series: [meta-arago][master][PATCH 1/5] tisdk-core-bundle: Make DTB=
 filter work with DRA7xx HS EVM
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Fri, 7 Nov 2025 15:41:24 -0600
- Num Patches: 5
- Mailing List (public inbox) Commit SHA: 48a92afdaa8f0e497f8600b8496afae90=
ae1d6e5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: packagegroup-arago-tisdk-graphics*: Add DISTRO_FEATURE ch=
eck for some packages
- Commit SHA: 18d215b03c65ba448bf38dc3dd98efe8a17c25bf

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




