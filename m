Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FE9CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 14:50:34 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11067.1763391029012836245
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 06:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=lARlra8B;
 spf=pass (domain: list.ti.com, ip: 40.93.194.28, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUzT+SHjMQ6JbMqSDV4y4ZdLujQCCrRQZDNTc9IHiyVbR7B0Sqfcu+9UMyCWKwt5jWZPmyvjq0lgYq7n5E88p+Hmv2zeK/215FecjYk4IF4bD/4ROZcxKiMkMk7dWdVWeFTgDA2xXjBgqsQdiHFVsTO9h6vb3YbSOlofN4dlqoVbviceOM+EL6DJau/hzzFW2UnulBM6vtTZeEXkei9bz3dVatS6Vxw29swdO7WdgUs9Y9B28aynsYVrDcyFVeR4kPG9lhY9S1p075t2OHMhkZxda9yWHjVOXMn1qqS6C5rOTlD6IkSpSQMfxAwBExK53I/kVj4iV1vauqDXvkCZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRoOwX916BY1X+NKcWwztqRMl47lTyJN9D1LMe4YeeM=;
 b=ycTodDFJtfWHmkMH1EwSH4B8XrWVJLZHELdOd1A8MJPMvQZcJDcc0Xhm8BJ37gjn/3j7RjGYQxtP+W69b8jh0FtyMNOrmFyGH9rAdWymGtpZ9H0tmGYGv5DkSrj5cU965XebNXDW3NgdLiW7zZYQuASsnvqn+6MCtxntW2OcCRhelEIr1AHVPDW7Ie/rXZlPiJ0O9O495/A+bOFaifEDOd8xNH1BykXzPN1ZiQLXrHoNKoW12AL38SF7kJwnXdiFs1EKMbdRS4xxYLLP2JGA0kllS3biLlbphdv3KP46IYfD+1F5Lje1b7fRNznkIkH2kTWS09zK0YE4gIPkn1WyOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRoOwX916BY1X+NKcWwztqRMl47lTyJN9D1LMe4YeeM=;
 b=lARlra8Bx+GQ+ir9ohqREKgpI3RUBsoaqOY4rAplTK42wqBUDo36vnVNFkeH73LTQl+MX4zq8nU+CyGafKYvBa2nrL+sMVMVo85Y/Mc+Uatd05HTzlSCQvWm/hbRI4OR6yChecJhuZ2gPDM9j6JrtANL2vACcEquAxkQr48b7hxZPY/JFUmy1uc9jeUnH/QAPZ9Rz01nggkFmo71vC6IKl1QUgQvuWifSEJ06pK3LEVn8G2Nw9OPNnhsd3T7hH9kjLj1THdvhZP7cGN1oowMMVwtPMzuy2+cywTlB5mWLO4ouf7kiHIaeu7s6U2szs4W1ifrjQNBTtpDGq4s29ZInw==
Received: from SJ0PR03CA0062.namprd03.prod.outlook.com (2603:10b6:a03:331::7)
 by CY8PR10MB7122.namprd10.prod.outlook.com (2603:10b6:930:70::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Mon, 17 Nov
 2025 14:50:23 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::3e) by SJ0PR03CA0062.outlook.office365.com
 (2603:10b6:a03:331::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 14:50:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 14:50:22 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 08:50:21 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 08:50:21 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 08:50:21 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHEoLH23837302;
	Mon, 17 Nov 2025 08:50:21 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 2FB97D6F2B; Mon, 17 Nov 2025 08:50:21 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: sadik <s-sadik@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
	"Prudhvi Veeramchaneni" <prudhvi@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v2] meta-arago-test: Add CoreMark CPU benchmark
Date: Mon, 17 Nov 2025 08:50:21 -0600
Message-ID: <20251117145021.3840327-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251117144816.380601-1-s-sadik@ti.com>
References: <20251117144816.380601-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|CY8PR10MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 441e48f0-fd69-4e19-69fe-08de25e8a27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3W09gRXWxQ2dZBu23kYFo7Io1Fz6iZifLudMSz9B5/FnJrxxiEm9ldgP3D9j?=
 =?us-ascii?Q?RUtQWxBXoQMArk4sy+iVIs2Bh5QT9PBkzQtNFSCB8SmL4h2dOIgE/XHClMT/?=
 =?us-ascii?Q?lbhalKIDyqzHE0TlmPTHJlCF7a4y1vAnqjVKZlGjFCPzB19dfdKnwopIi7tl?=
 =?us-ascii?Q?oHPRmkM5OTkB+MxtDgfWs3ZhtT/3vtaVUNGur6BJ1xy1OfYA3ipWtYcOnT2U?=
 =?us-ascii?Q?LIiplls2J8vhyDAilUdKRPcl2ZPOekI/zdOEZyzp8Lcaqp7Uqzg/A82lmy5X?=
 =?us-ascii?Q?RRfgtYL7G1Y6CJOPVDhxfCDVkEdz2P67hiDvD2qxRE5GzL//e8Efy6gSBEHB?=
 =?us-ascii?Q?J4K2eqpcmIhOLMeqEAG4qN8HGGspBWF6R6zTZp3wC5i5mU9VoGeBRzJlWZSA?=
 =?us-ascii?Q?kUWXw1r8Txo/eUBodv+KF7F5QPyPfoaLzWtBGfnsUO0hYKGR/6f7F2RRFaat?=
 =?us-ascii?Q?wb+Oy8TjtsnyZEnXji2NSJIEuAUY/kG+479MdCnXbrMfNgmq/VaNUHiwb0IE?=
 =?us-ascii?Q?v9KfNGqCE8CuL6iszyrOIPxR/H5ncP8dVF3iug/13dVIbBufyrBfeB9Z4KHJ?=
 =?us-ascii?Q?MIuxQB6zBYATY5l402kj8DCB8aZi/154ZJG0H99latjGiUz13ZRGHuau0ber?=
 =?us-ascii?Q?mF1UfRD+5O6xUv1ftBx4RU9xIHh2QmYuvLr9h1vsSaMkk6QUJ9/HwPkXiXEv?=
 =?us-ascii?Q?5/sAzOnXYv/zy57D84wQDu9a7UBOfpws69n36DYW1kpFh85vXeLyem8sNJLU?=
 =?us-ascii?Q?xq6cJRrXnTVq2EpwxIL2IhmbN1O8kYSwmq2U4T0UpLcFmKptzaKoBz50Kwij?=
 =?us-ascii?Q?GuS8eLo4aPYbfnDq6MY/Wwm2t4POLJNkK01izjD3wC29cfGAOJgPjdcg33h6?=
 =?us-ascii?Q?VCMgNxAX+PvNCn3hghikriMOAF8kaTw1j4151rs+9A8WLwFF3HS6IHxGfOqY?=
 =?us-ascii?Q?qQw4etXCj65ozjSO0lNRSC3I9VubGyshCuAKioreNC7eBZkLu8LWWPO/OWPg?=
 =?us-ascii?Q?fL1NLC13ZlkS7rHV9c38ACHumclZecUrYACYKUZOG3LMS/+xp6vu1UMZb2Q+?=
 =?us-ascii?Q?3dCJ8p/8sBcGl4zKtdu6M1DZOp2k3diJgqENlTmCoWosheRJOsWNhHA7vvgO?=
 =?us-ascii?Q?LC4+q/Va0cNjU4ClBTMOh1FQzbT0DvUdCrtjv9GpC4Ellk+WyPtUdRvSsLEf?=
 =?us-ascii?Q?qZHI4zO6c6ylI6jiq6AM1GKFDHJB6iw8s9ljX3kOl+zrmlUqbrRQaCN6OzRu?=
 =?us-ascii?Q?tmbhNixn2CKEPji0xVRD4ZcroCf4rturnIpI6mbrw6jl9X2UzdspU3kO54Cm?=
 =?us-ascii?Q?N75gbApk1/514zCOFmGSkWOh5otHr6ZsQ9tFRwZxFCbLwuuPSRxQgJJJmn5T?=
 =?us-ascii?Q?mQIpUM+jnrO5yVXrUqHQkBQduvpU1mYEtpLO1YsMk7uMmFAc51uZO+EK7p94?=
 =?us-ascii?Q?0MRpCPAgVlFhQLH3RFbkMAhwm9xtHS/DMB1IWG1ng6BF23qFAAPiE76nuAZj?=
 =?us-ascii?Q?93Q2wPhCfSyHzwRA3sRiCF/RaW+2K+g3bxDln9JOUdWO+ec+FcQPTw7lhMDp?=
 =?us-ascii?Q?IVMqOMewmD404SfOaj8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 14:50:22.0766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 441e48f0-fd69-4e19-69fe-08de25e8a27f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7122
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Nov 2025 14:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16775

meta-arago / na / 20251117144816.380601-1-s-sadik

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
WARN - [meta-arago][scarthgap][PATCH v2] meta-arago-test: Add CoreMark CPU =
benchmark
    WARN: Commit message should not include directory path to recipe: meta-=
arago-test: Add CoreMark CPU benchmark.
              meta-arago-test: (COMMIT-MESSAGE-3)
        patch
   =20
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v2] meta-arago-test: Add Core=
Mark CPU benchmark
- Submitter: From: sadik <s-sadik@ti.com>
- Date: Date: Mon, 17 Nov 2025 20:18:16 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 25b9bf698d12cacdd112aa730bbbee095=
3aec2ac

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511140456
- Commit SHA: 0d3641074b98f79096d415483402e580318249f2

Patches
----------------------------------------
FAIL - [meta-arago][scarthgap][PATCH v2] meta-arago-test: Add CoreMark CPU =
benchmark
    error: cannot convert from yes to UTF-8
    fatal: could not parse patch




