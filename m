Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C91CF6485
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 22:14:31 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19392.1763590463274003633
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 14:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=cLB0YtBG;
 spf=pass (domain: list.ti.com, ip: 52.101.53.29, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9/fU6uMIKj6v1YovywnzUUsLhb1VG9v2RQaj3BM85uG3EW+KmVxg3QYJZyQtHd6kLsoDiOxHR8ilnfrG6/uFlGuTEtqYMuv7k9cLcxePfr3zzRCmxD1fYjM7NFfDjy/r/89dgnfDNAZuQSIYRNMu2AbcTBcbdjKo/Vv/eiEUB8d/7s+pT3cxqKv+XFuANMMdh0R0hGnfDv1tQ03fYRnZG32XgM8VdWJYL3yfb99mjk10nJLQsB9vctB0bKiuBK5R+OgfyIXVt9etLJTAbAUeE+TEBZPy9y4evRIo0kzf26HNCbOi83ri7WOfwm4ndxUAOeotUHIMAhSPcvM5FG8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfpP+WQj8JG5+iFlawqRE6QIBAhLCFCf1ytlYULuWSA=;
 b=fBtUqYZPHYYef5NAJ0dSlNVE7N5RKTlISDo/Y3Qh/76Mw0KEKPFyANxuuwrNJckyzIcuLKEpC+BtZXrlNsVySx6QE/huavx6GN1o3QyPaKp7jJfYuhgpVRo+VM+3abtV1PwxCwMXTfL3DorBqqJXvn9yhhTbiG9FrgGDtsngkEK8q3vZShMkxIwv/12OjHvevNcXMuliXGPKyZMvHFy9hODYpGA3dvtQ/WOeTZ4FYB0SIDqTDNOtlE5cPxZuvaJ98uJ/HRSNI2ZydfJpOLwf2l9gZQodTaThAlsxQfU0Uxh/1Okep6TNF6g1M9SXfmSjQoiA70kUPj28JbFYAiTniA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfpP+WQj8JG5+iFlawqRE6QIBAhLCFCf1ytlYULuWSA=;
 b=cLB0YtBGOlbBcCvvbV2FG08CrnkXwFlhEnEaXTFTX6boGqe6VyI0X+ahgPFCf3SeagtIe4Imf/1voJqrLxHW1UTE+0wfgnBv6Bm6TzpwpCEDAKGRhl28flKPfu335gDjIDmN4ayhYH7826aLBjJEar6XDkgFRXy1OD9wmZwWuxMh27aQaxoJfm1qb+OE7z7/1qgy4haQrCTPGiri83RReByCI/RJ+2pOf5Xes4v0WfE6hOKKMk+FBevOX5oFan7JD4ZbJL7/jcnAfmXiHQcfxLwsBH99KsM+tqUK06RTzl0qyKaIfFAxAVvaf7zsONHNIJzLEg9ke36CTQciL3jGtA==
Received: from SJ0PR13CA0038.namprd13.prod.outlook.com (2603:10b6:a03:2c2::13)
 by DS7PR10MB7375.namprd10.prod.outlook.com (2603:10b6:8:d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 22:14:03 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::a7) by SJ0PR13CA0038.outlook.office365.com
 (2603:10b6:a03:2c2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 22:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 22:14:02 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 16:13:59 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 16:13:59 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 16:13:59 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJMDx0R2065837;
	Wed, 19 Nov 2025 16:13:59 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DA5DF9ACF4; Wed, 19 Nov 2025 16:13:58 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] nnshark: Set missing PV
Date: Wed, 19 Nov 2025 16:13:58 -0600
Message-ID: <20251119221358.2635175-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251119215228.185294-1-reatmon@ti.com>
References: <20251119215228.185294-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DS7PR10MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: c5fdd8a1-03b8-40aa-9b63-08de27b8f232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x1N82GANkDJTq03G7MjCuBL7+dv3qfFafsLAi6obF3OejZIep7Q0P9Ey1T0Q?=
 =?us-ascii?Q?aJ3huoPSlfIGELo9OdSgZd1U674BW2ZbqIIAnjg9fYZfsJmaZ1hCaHo2ywgH?=
 =?us-ascii?Q?hoLwjE5XemWgdzfJbFGzFQePMocjc6FitOBw4F5g0l2g5vu+0+08V9AHRmoZ?=
 =?us-ascii?Q?jCRmrRLVdZNJny0ci0eKYpNaUEHDuSWSUhd1v3RhEelyFYmXrNwmBLcmTxkA?=
 =?us-ascii?Q?pYFsgsZcKRR3V9ZwmUuC/6Px1GMp7QwiuvKgzRv7HvTwPHQSG9xIKRki8Lk0?=
 =?us-ascii?Q?q1l+Pw4NYzRZ7XMSM6uVJdX6ZF5OpZrcDUK7kOkCWtCOeyaEBKgr9FXQ7fKb?=
 =?us-ascii?Q?SihGWV/BeEzK7fEGgogCE74Mdwc5CXCrB3GSeBp/cFIusvm+P2v4H4kr/pww?=
 =?us-ascii?Q?B4qnH+yHQNyhS5jlBmWvfr28geIuT4NR5VLYMpVoWFHWi/erNo10FDG932xu?=
 =?us-ascii?Q?Cyg6W0L4AnWN16/V98KGHipy6wZTDQ8wzfAGR38GvlrUvTSh4bzfdhRhxIAD?=
 =?us-ascii?Q?8sFQGts4sMkVILWB2B41zbc7oKXtgDGsMkWn9XT2A7enb3gElnJTZkShwUKD?=
 =?us-ascii?Q?CGGUklS8rspPi3B/NfoMyOqJUjFxisevOxbD9LtWr9k5lkOZpg9Wt6IWl9OG?=
 =?us-ascii?Q?yilGBnrEx6kyqCeHEKZGXVTBDYXWl4xjcbrspqYCWSZnqUUEmrq0GDEB7ScN?=
 =?us-ascii?Q?9wfF3LJLQsi9ZrfjG9ym1NzvxcWfD5bMS54we7Rni+l3/eexl8SjydXA0V6z?=
 =?us-ascii?Q?sZIwoqO2E8S+OQelnWnrEuc3FcjtWevoLVX45yvWuW43UZsafVu9R4r7f/jc?=
 =?us-ascii?Q?8As+bYZ0cqnJbJ5NcSizhIc8S3Te2/c9fwZiISMHm88UCjec5KJwJl5f9pBV?=
 =?us-ascii?Q?82gVGvuoKbotRX2kBf9wb9sdIubCoqo+ZiZzX9NzF5/STWE8LYbxl7EGKWS4?=
 =?us-ascii?Q?rat/3ukvcFqR83OaOSKPcJ5obAmwGuOWxLTr3I3irtMpuKqSk9dSVrga7s2A?=
 =?us-ascii?Q?K+kb0MFd1X+FM+BJQt+9g7rhpfvWnf/DPI8pxq/JHbSVSApNCb6+vaPVqs/y?=
 =?us-ascii?Q?AHek+mAnuTF5NyVLe0MnsvSFxEBFtreFMjxhj+XZzKWTKlRW+xBpbp4YRt82?=
 =?us-ascii?Q?j8BpBfUb7G+NnQkM+dIXfmMz/XrsrshX1VZJHdakLLanV2cTyngfO/apige1?=
 =?us-ascii?Q?gJhLud+sJ3UrQ55y//MW3uPtIhLKJpMpJ0ymM/I4+P1EFD2NsLsBOG19N17h?=
 =?us-ascii?Q?7Dov3dOP932m1AsxvPCjNpdA9ZiHLAZrHKwK0GRCIOWDvdOnU0/GqujBmGpM?=
 =?us-ascii?Q?k+fkPS+O3yHjPNV3OrAotyDiiyS5CIQ5F66/zdD49mg6HVEffCsLW7McZrws?=
 =?us-ascii?Q?LXdCo6Ao9XkfqYbPba/nyzCgAnAyP3MZN66VOoqoLwaQpqghKaxsyk7cpBEo?=
 =?us-ascii?Q?NsT0ab8OAuvQdL7KZxk1kd0L5sw4d9vLQvN1Mhk4MsVfsJOruBl1R18xX92z?=
 =?us-ascii?Q?wPaNQyuMmts6lWlx2tWdUoMhi1x/N1gctmJDer8HpSNtUcHFLwnHfQFj60Ho?=
 =?us-ascii?Q?JS0P+9nhrfFYZhrWEfc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 22:14:02.3303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fdd8a1-03b8-40aa-9b63-08de27b8f232
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7375
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 22:14:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16812

meta-arago / na / 20251119215228.185294-1-reatmon

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] nnshark: Set missing PV
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 19 Nov 2025 15:52:28 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 028c4ca44a777e72909836163b30e4935=
b1075dd

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511190400
- Commit SHA: c273081b9e50cd3d742cbaae1e78a8439d6ff710

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



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




