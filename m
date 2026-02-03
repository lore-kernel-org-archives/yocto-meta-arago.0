Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FBCE8B385
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 23:27:12 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7355.1770161228518451004
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 15:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Ekaaqdgx;
 spf=pass (domain: list.ti.com, ip: 52.101.52.14, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1KBzO8ANYd/O7gMdNmR3X4sDn8/qGa0C9W4EBXfukl3Dd7yGI4yg+d3Rvf4z9j4rhKE2lP2794TSiA6BKXe2L2b/TowdEqxAyoOx+DUlv8ymbh6j2fvt5smxFHK3WPBk7c3MBbSrwPwYSG+hQdeyNAiGt+o4Cruflh+OaQ5a1cLBJhw2URViiJ5x/qGei+Extvi2j5Hhw3r23aSuLV4ke+05f6H8v32ucJqqoVtnsxpXDn7sHfP5Vji/qgOrv4DX9Nwmo7cnG18oi62QkGIqtM+KPNXPiYEkbzWdRv4wlWe9n93POaYKur5bjm2EhzVxZX3DH5X0tmkYVTqWBRLag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWfJ6BlQtouCyHjtouNYYaE/e0oXuTOuR4LEqq02AMA=;
 b=awLsia4LuCg3JOjrG/YV9jdHSkiFqe9ADtx3uC94SeEWes72Hbbr8k6icO1ZLPhP5PJN9TKAJ4yLxJaEu1n5Ym46hYzXdSK5XfH8A5YmZCDwCLOcOi4xpSvrElXOPdVwySkxYrO8ZSwafGOSMiIDI5CQMGd0n/KUol4toy0rNxHkWCYgmKKsGrAZJ3XPSCsRN+pXJcepvByZjt0Y6wLCKMRuWXFJFpCja80j/GXll9rjBGNPnDWwNEU5d7cB7O4Oi3IPjLPCRKIb7P6/uzmFNo5Os85txlQbxPxFpTIlxfQiyWM3dep1afNb9EG1a+jDRjaZ4BU03xDyM8VQE1OTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWfJ6BlQtouCyHjtouNYYaE/e0oXuTOuR4LEqq02AMA=;
 b=EkaaqdgxDWkvai6IzsgB6cMm4+vKwXMZHwHbTCfI7q8hUeJrrPOPmKh7wkEEVSOa+Ugt4CyGXxuNkmUWM83PLeG1oN5bE/VjKC99OoSco1tb2KHMV6ikorIiy901MnCh/ZhDGmVUnR6pe7fuVs1r0tpjHIiOZ2kM1m42GOLjblFd3i7o5qqeWIR1vEXNRiCLaay4jDlpjDJswKqj5Ic/HDPm0JRC/I8MTriY4CBXxVJgWsRycnC1vT62tW6Ey+vfC8REh1tOucbHP01qw4SWi24RGLJiO+EPODx7tnkLkHKgIXWFFMKyPQhO5z/jFEePosw0gSqsJTK8gg7Vs6CjpQ==
Received: from SJ0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:a03:331::33)
 by DM4PR10MB7508.namprd10.prod.outlook.com (2603:10b6:8:17d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Tue, 3 Feb
 2026 23:27:04 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::c1) by SJ0PR03CA0088.outlook.office365.com
 (2603:10b6:a03:331::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 23:26:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 23:26:58 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 17:26:57 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 17:26:57 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 17:26:57 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613NQv023041248;
	Tue, 3 Feb 2026 17:26:57 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 23D3E9ACF4; Tue,  3 Feb 2026 17:26:57 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] packagegroup-core-tools-profile: Add bbappend to control LTTNGTOOLS
Date: Tue, 3 Feb 2026 17:26:57 -0600
Message-ID: <20260203232657.348076-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260203230308.2211967-1-reatmon@ti.com>
References: <20260203230308.2211967-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|DM4PR10MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 08dbab00-b2c4-4bca-bd7b-08de637bb9d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b6zkWXph00NoqxFNjrZ9btJCpjjIzatUoYWysHUKr0JI/cqYwnb4PXVa9qym?=
 =?us-ascii?Q?hTFKmR6Omf4ipLGgIN/6JkWIOHtJRowOOGrrUyOVJLLS5oaUJc7zk8gBkjz+?=
 =?us-ascii?Q?Kq+qm9bvuZ0vTwR5/GL6hqaAQ2usa6PY/dk1nA3okMr6LM9rSSL3fru/uPl5?=
 =?us-ascii?Q?KEsjbExamEOraswsPl3FVWlET29PMjLHsdePwePNJG9a7mRy0AFFvRhj0lYe?=
 =?us-ascii?Q?TDU3kybbkLpuPNaKs72LVWvRo8pK3V5LyZgN8b/nnFSkq/teur1fuavujT8M?=
 =?us-ascii?Q?AAgrpDtApRqHQss1u8coX9lxIxuyFoZlhFrwkhSU/5PrJWLfg6zoMEIS20i8?=
 =?us-ascii?Q?ERZXIV35zDLB3rHgMPBmcphrf/d8E5/2m4Vn9mzGDaA7HWjeHBWFqVt1qdsn?=
 =?us-ascii?Q?9pyIEWm4qmztWxYhwFwPjlj6qcd9wLL9Yb0UcEK/coMBEfipUfzNPR3o/6KE?=
 =?us-ascii?Q?hnq8xZoMcWt9xfcy94J/5RrwiCw1geFHGDhl+gu/gZSc3b9dB7VuuSnypR12?=
 =?us-ascii?Q?+fFwUf/jr0qvXqm1nKwOr6HLmE3/NpPiwKZ6vBXuqVbV84wyHy0lUjtbTn4z?=
 =?us-ascii?Q?dF+slJeau2Ok6PCymkAQkTAFbH42mbKk7W20hARi2aOrX9rvXnDT81RQHFr+?=
 =?us-ascii?Q?U7nQ/7O4mfXkOxnLV+/lvHcwEN/YDNSzUWB0b1pkc+WzBKl8rfe19bPebBAr?=
 =?us-ascii?Q?VwAVMBH6dcM2iQQlJX9Q2NQAXEHFTJy5doSl6SNPJprxqJCty1yM00Thc7Ne?=
 =?us-ascii?Q?TfIJLl0jDYA3/UgUAiiw9j0qsV58z4OOZrHTTLXVm3guHkK4zhXpdVkIy4kP?=
 =?us-ascii?Q?DK7QO/mjJTlenOKc9y1yLyV9CV27yV444T7ku6I6G7t9NCezJgGB1GfJOVFs?=
 =?us-ascii?Q?l9O2sj6v3Pwh3/QKUDfBJ8Ld4OG7jzRxSuvmo/9U82vqocg9bKY084yLf6aX?=
 =?us-ascii?Q?xJZzllL9konEvJSEdUy1J4nJf6fcrUXHkvpbvZtqGz3gZYg0CVtzOrb4hDV/?=
 =?us-ascii?Q?MbKqio5NAiHKVWwKTzkCtxTRi325VGwhJbOT8WjH8M0lie4IaVi8JMdzXt2+?=
 =?us-ascii?Q?q4H+qY3GVbymhbMY/l2mydZXDbE+5zuPyF40MNvFPz0DN+PZYXNyYld3ubxb?=
 =?us-ascii?Q?KjDshvubtEGXu+Gcu7vaW8kVL/IuCKsiet6q0XDipy+1pGna86Pciw0A71fX?=
 =?us-ascii?Q?/a95TnFn/1Mz3A80tE2e32ub3+ZJRcKA0SF+8eioIKnWd4s8e5R7b6OouMd3?=
 =?us-ascii?Q?cFKndpgMndGWmMFbZVu7YsHllZd1ffQkdam3ENj5DueMQJJprkM7gvXBLJqJ?=
 =?us-ascii?Q?LvNtqQwocHXhEXNn3f7BrA048ddK4CUClgcmvRUoGNycaEqyz2tW9COWs0Cv?=
 =?us-ascii?Q?/O3Zqu3I5Umo/JODhYRshwv6Zp/s599Qbj80//Wl2prU/xkMbn1LifT/YSHC?=
 =?us-ascii?Q?eV9E7pRdLaZxbUblEa7CRgir463vXO4uu/tTvVvaviE3/t7F2OW6985HWg+o?=
 =?us-ascii?Q?jKX/TtR568Z2j9egJvpS19ZxZwncgxgLZ19erP8VdBiMMASUhHdYfHBCH2HS?=
 =?us-ascii?Q?H7FvWT2TFiff2fmC1h3weyy1uyD4ipKs6b+3IUc9+hUSj/7Ll1Pck+dIPTKI?=
 =?us-ascii?Q?R7+e1+R/Qr8w12hZnBcvBpvxtC2cAPVNTe7CnZ1mOH73nYUWBFcptmGCo2et?=
 =?us-ascii?Q?Z2oJaA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	p4zys9LJQM/U25zGFQWqhe0GPUrSNF63eOs0xn8Fhesb31Rh0ti/kEcnXvPfPjo9IWNgrYYYAdv0uNtS4HCFJnS5Nl19LAR04MRKW3/GmT2bdjX8viihWxsKkMndZOtg7ENE64q8V45VYpZjA8eYVn7V8W0T+TirUYZhAcwO5LVgKJNCShXL4CHlSW4lf4rIVb22P+V5SXGRK5GuZCrPe/Ro6HJk2qhVnVXOgkm9lmiXNPHp1R6uaKDjnaBk3rdNI5x2IYfzZZSHQMJXTFYeLv65kpNf5inM2FYJWITmICq6ACkIgYSaGLkYVilDz6CwrG/Vb5iWj0Tqe1q1zMgwWbTHfA3Rwwxqro0NZKSLWoiUBMpeuDKeOEy8zXVTlGCtYArNOYQd7rOQy7Z813P3qdQeqjwAzV8znH+gAdq8tUr5EKy1fHTP5E5cbFJ5f0rf
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:26:58.1454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08dbab00-b2c4-4bca-bd7b-08de637bb9d1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7508
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Feb 2026 23:27:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17076

meta-arago / na / 20260203230308.2211967-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] packagegroup-core-tools-profile=
: Add bbappend to control LTTNGTOOLS
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 3 Feb 2026 17:03:08 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 44393a409e53e32a72bf2441ab9b26a27=
b03fd8f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602021018
- Commit SHA: 9dcf888bbe0d83aa2353c65832c67cbedce028c0

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




