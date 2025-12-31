Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B76EEB572
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 22:29:15 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.94859.1767220151822653189
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 31 Dec 2025 14:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=nVpMBosG;
 spf=pass (domain: list.ti.com, ip: 52.101.193.59, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSCbFmngIRfUBa4GJbbVimZIz+Kex/Uet+zJ4OxeI3/A1r+bjeZvLOrsATH1L/V2BT8lCeQPaqQFvjCoR4pfSf4pOWn6foFpwhFhhJ9EXRGqJLeNk8tPNpOQ54XSrjIYdpxkvRVw9RSv4pbB0c+rd1Spis9mMEW8lc8h+/RrgBiGwr897AGayMWT+wo5v+NgiDi5OA/kMmFk5ZXYew5S+LQSXR0UAkoxUL4VTII6DE3p8BIwq6IJgl4khrc8aCwzxGvypB+1qp+C1vuWsGoMsr49kMQ1x/NSMppuh0DP+GsGMTHfKQ2ws9YEtQ9j6qp/OqpqoPsocJRBA8zxDAazTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MkUrWK/3CnzCxDc+/8YNreVDDQPDkf3uXLTk759PiY=;
 b=bd+VAN2zN4WEdFRUAcm8fcXq4+eoCyOW+E/C8/IxeR3WvLgTzxHuViEB9dlfhbPlA9Tj9tBNMfdw1KhNOdiTB2Xrsg1xICacuampgI/nQR4Xl/53LLnxHFN4CIKt1kK/Xtg1P49il5qvA0+anTE/AClGtYLQcZcoh80ejhCd6d1osJP/aoHOWQZ1wVUfrGxTyW0mh304cx/mC/4JDoF7dsAoh2BOaMSDv1+OqHFVGRa280XXeH6KuUv8pNu0+tiqY8HvaipxqP0Lno35Sfiur2/RPrqWpI9AATuFTDANkZaz7t0iqdtPOg6elMbub6PWRE7d+5cVXKmkPSVLkNkaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MkUrWK/3CnzCxDc+/8YNreVDDQPDkf3uXLTk759PiY=;
 b=nVpMBosGaUBBQlQT0bRxoHos/3Z/bK9DrDH18qBambRRpLP0HQaek9xa8kY8a0EYH4Z3QvCikVUnkioQUSFEF2YLQdA3qwnLZPxlsmnZWsMl+Je7eSAsDwMt2JoZwW6VdYA6lEO1R3xxo0UrBNAMJzUZbtwD/jcGihH+KXGb3SA+pQ3AeP4UPtZ8v+swQi/f832n8bl+HegF9QuBkpk56Pg4niiPvuaZsZutLOjXHIgXy3/gEIbHm1qDddvCCUeeB1st36zvonqGibq47pzYdOyHxlP6XccPhFp+BseYjcSp3ZAzeHskQKEHmIBDAn83Cu2aT4PMTkYSlCNTLSWCiA==
Received: from BN0PR02CA0041.namprd02.prod.outlook.com (2603:10b6:408:e5::16)
 by SA1PR10MB6365.namprd10.prod.outlook.com (2603:10b6:806:255::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 22:29:07 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:e5:cafe::49) by BN0PR02CA0041.outlook.office365.com
 (2603:10b6:408:e5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 22:29:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.0 via Frontend Transport; Wed, 31 Dec 2025 22:29:06 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 16:29:04 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 16:29:04 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 31 Dec 2025 16:29:04 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BVMT3Z71517377;
	Wed, 31 Dec 2025 16:29:03 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AA26F2A54; Wed, 31 Dec 2025 16:29:03 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] libdrm: Remove upstreamed patch
Date: Wed, 31 Dec 2025 16:29:03 -0600
Message-ID: <20251231222903.1074469-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251231220728.3311872-1-reatmon@ti.com>
References: <20251231220728.3311872-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|SA1PR10MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be058ed-d96f-482e-23b6-08de48bc024f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z7GTwBGRPprfic9pxn69QpzyBSYyKx/U5i1jlzZD5PTlNp52PiB6PAuSfZfn?=
 =?us-ascii?Q?FM/qISA/tn4MViWmveg8fAV9MNzw2asQ8x61BhWzSdUwjUPHRAwY2AHcprBq?=
 =?us-ascii?Q?8hUAZtO7W/4mHc++e14TH++2WqwbJo/S6L+L3s2278Gj0HYtVKc5q+bCTAiu?=
 =?us-ascii?Q?xTWJvsuUKHoFdAg1WQMhl/W1tJuf7f8oO3PeaZGEuXsAq9T6bgvTBj6I20nG?=
 =?us-ascii?Q?h9SOpKQevkRKypOAL0UJlhFwVusTj9eCOHB0QmwVdKMM0LElHANzTJKUw9OD?=
 =?us-ascii?Q?R4UBu2R4CvUNlfhSuZIlJYMszGGf1Gk98/2/a2NXdtSR7s2qwmuVnVKjCHdh?=
 =?us-ascii?Q?ZpkkYWKi430nJbAcXpCYm8U6CdZNe3y9P66tsfvBMdmItgJG6sru6HWtyrWm?=
 =?us-ascii?Q?AJRW7NpUkY0Dr7A8EUDIjywToGVtjSLWrCME/j+eVrSEfZK34PB7fXUqTIqi?=
 =?us-ascii?Q?B4oR9SO1oXCBnmfTa1qoHS8Nthgx99CSRWt3km8WYztfCmuZna/LZ/oscXHd?=
 =?us-ascii?Q?aWYPjP+LfiSXNiMy7mpd0gIkRj8MIcFxlUQZ35pJcx0gNBZXnr3AS11rXeTB?=
 =?us-ascii?Q?8Ag2Rfp/lsxOT96wgldSAdlZ6BwdzERxWhvZPsfi/Y4G2Dy4yhPNcqJgoxpu?=
 =?us-ascii?Q?3f5NeeGc2/0MwYt/MXeSYs8ahV7eY7EUxj2zBHgXbM7askKjI2JO3q0HLWSP?=
 =?us-ascii?Q?kfSQa7OOCpJ44VyPF9sbFoTpxJbA1+27Ux4j2lk0w17Rn/Vmm6aigbczmMEU?=
 =?us-ascii?Q?8fK4K6vLlayiXtHHnYoXSM3CZVrVTcg2MhZetztdKc8TXCRFCtahUyqkLDI7?=
 =?us-ascii?Q?77Klv49/QPOPFhs+KUsmeDJ/FMtyRneJ/BG3lKIvz0P16+v9G6IczDftefo6?=
 =?us-ascii?Q?/LhY+8WXb8dx57qMtCuVkS7UkZK6Zy5s4zU0/LyVyhyDFjOQkMwlG4HSlyRL?=
 =?us-ascii?Q?MUZ1tbTdnK8SJt2b1XwUuJ3a+Bko45/knD8cDPmlIMHChmk3x709t6A6b7zi?=
 =?us-ascii?Q?UFT1F76iifVCMi8L26e4Wa2mOb0EQ1zwXXvKhQvQ1y/w65620dNu01UsTcxp?=
 =?us-ascii?Q?P25esCddogWktDcH7E7Q0/pgDV6OAxKWGDjLd7HgS0rCanmiqt+lo7z4vD6y?=
 =?us-ascii?Q?V00fBMK+8qfi+oKH10AMs5A0ozOufDQTkK6uqGpxRncF5Q1HGMDQwL+WX6R5?=
 =?us-ascii?Q?olBb6mThSqfSx1/vAaJ6Kq1ABamqji2NhnuJiXnhvyx67bgZSI1fiYyG8jtR?=
 =?us-ascii?Q?w//LysFjJWSZzIt8xrRbhVyltNKgn4Qk9FYti4kX8qNVybj5q/Mc8MNi9gew?=
 =?us-ascii?Q?Zuzu0ViqaRAGz8VUS4OV+vdnXpHGWs4lYYxNTbByI9HJlKJG/9+0jJpEgIJz?=
 =?us-ascii?Q?WCZW4IlpFxBOUCb0bd/aSfqphfm5D6SekzPrLVQfD2PtJpGGbG04+6pvHqzl?=
 =?us-ascii?Q?ka2b4fMycVjmiQcH3jhti6OL8WgNe1ox59O0f6fBK0JNKmgNUTd+2TXX1aqg?=
 =?us-ascii?Q?Tnk2i+tC8ebqz7DslP8G3C6DnLrK2/9UYkMXN2Rjm8pEogfq2Of+IEbzmli3?=
 =?us-ascii?Q?7GKTznquAegJtnWRmmA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 22:29:06.1918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be058ed-d96f-482e-23b6-08de48bc024f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6365
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 31 Dec 2025 22:29:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16914

meta-arago / na / 20251231220728.3311872-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] libdrm: Remove upstreamed patch
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Tomi Valkeinen <tomi.valkeinen@ti.com>
- Date: Date: Wed, 31 Dec 2025 16:07:28 -0600
-Date: Thu, 18 May 2017 12:18:28 +0300
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 970b649fd42e3874f1166b72d2e79cb5f=
a90e5a8

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: FIXME: tisdk-tiny-initramfs: Increase allowed size
- Commit SHA: fbe58818994872d4e449dca07cabad55eeb46ad1

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




