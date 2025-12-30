Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D328EE4990
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 17:13:04 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68312.1767114778344888789
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Dec 2025 09:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Qq8zpBxA;
 spf=pass (domain: list.ti.com, ip: 40.93.198.43, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tt/bsFuSTqL4fRN6vvWvo8c5z94BGvMl7tgkj9bVH5oifyIubwuHF7v5IR+aHOo3Nn5N0YT3mtL5bivaBxuts+weNOFrv7ORBYugrBgtROVF2cCb6KbQ3T5CM6zXHnTbTBaGKGgWFfMv72zPBVSRNPkbgXolxoIrbp1SjH4C8I05AHBvhIx9T2L2LjzDYABifImKNjgvMPf09rcjG6uxtGQbJyCfm/7PaiHZ0nwOvkrL/ndLovTkghNWNEYfk5JuB9u4/zODq9jQWZHOwHlRw3rm0viZkU6+TSwAaxUrCkGfU4kX8j9g3X6MwdRJ/WxD8SmV4qzNUZL5sAiX2yyd6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PvyfTX3qfB7XmEcy1I5xBgc/bXzVfgPvQTHLAGJ2G0=;
 b=PPLjz5stj92hqzh3lBZ2IveTECEBaDz1KNOZvyAX2LIp65M8GccEdXJK5+3x2JBFJEt1yhZPLbiUG3zK9E3SVOtqBm95xV+Pz0T0jkXW4jkCEnzyllGHyJeiAm40nLonFZG5p3WBy1372j4V0LhdWxopgx8csgEs2GAsvQpBLWFmezpeo4IlK9MRoCmqnwziJKqtKmzCrMhQbiLDCt+VitpSfn/0vfv5pR1XQrtCoSeJ6lpLkZmIfaHCf7a/J7K5vwv2d8BtNUnm4PJYzrIw74Pv3zmnHUr9QEm5/KAxCU7xA/6H6pDEy2Sg2EAPDc424/kw6b27mTtOes7465f4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PvyfTX3qfB7XmEcy1I5xBgc/bXzVfgPvQTHLAGJ2G0=;
 b=Qq8zpBxAcBhurZfVWNhLGxLpaylw8h0qclJf2ooxdD2h3Y96YL0kYnwE17lYjaoL3y673NhCNePqc94CWzbP/Rdnm6vbvHBZSC3ZzQhp+UQALeAOMFKPpI88Wny4zz/RmJqlYyo9ot4Nspr8OZ0nC/dQRhRQrJbsQ+pVpL2jLJ4KDj5TjiV4jY2uxPYI6Pvvs1OV901t/WpeHyUcVI++PHxVc49/Z7LqOsoXhmmf/sDr+WvS/adj47dNurqknKf7rdeySvCKfFgnkMRjP4EHCSw2zubCn26BkAm9DchQVacKCfioTup1pZE7Lx1pyfmAqsn//twGKdO8vXvy2QnPvQ==
Received: from BY5PR13CA0011.namprd13.prod.outlook.com (2603:10b6:a03:180::24)
 by SA6PR10MB8111.namprd10.prod.outlook.com (2603:10b6:806:446::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 17:12:56 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::a5) by BY5PR13CA0011.outlook.office365.com
 (2603:10b6:a03:180::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 17:12:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 17:12:55 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 11:12:51 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 11:12:50 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 11:12:50 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BUHCoj3372988;
	Tue, 30 Dec 2025 11:12:50 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B67AB9ACF4; Tue, 30 Dec 2025 11:12:50 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/4] cifs-utils: Remove bbappend and patch
Date: Tue, 30 Dec 2025 11:12:50 -0600
Message-ID: <20251230171250.1463374-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251230165135.3505628-1-reatmon@ti.com>
References: <20251230165135.3505628-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|SA6PR10MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: fe36265b-c939-4537-5f11-08de47c6ac91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M+v2Ac0BytyV7aJFOycZj2yiEnu4zPvM5IlV8+uuhVKAkFJ5yIZ2pp0gzkVB?=
 =?us-ascii?Q?nIF8lo3fDIzcf+oeAA72R0F+hJH8hgc8dPB19BhRzS39owwzjpKqPdOkmMSj?=
 =?us-ascii?Q?JVhVTqDbaJmtV2GTQHAu8aI++5nH6wAscF/NyiEmvoMq9TtQuOs8RnBpAipb?=
 =?us-ascii?Q?TFWYuTkYADXMfe31oiBVGZpbzqvtHHxVM8ahcpdweAwLCMJ47tU+HtZv0RpY?=
 =?us-ascii?Q?C+FkBbzpEJsUnl/1SV2lQ1+xSCRswaq7EUnOTB72swluI/jUZqNDf4vdeHG9?=
 =?us-ascii?Q?hTtwCBGVHyF0BrBw2LcUqr4GtdnmTSCTJSXBVH7bV4AlszTl/QoCjeNy51fC?=
 =?us-ascii?Q?/Zoi03Xhv7hoCclFf6ne9na1SYZCp1Jdze2ZKgn778z430Nz6yt/oOz5pes4?=
 =?us-ascii?Q?BktwfVr91+b+HqVtsTX+zFee/HerLYiUsQAuF5m2xSTZPhUToKgzbkNJAO5y?=
 =?us-ascii?Q?73xe01StE3gljr4iAgq38gKQItXr7E1ErpJPpPzLiDmZko5z1ZnqY55eW/WG?=
 =?us-ascii?Q?O4boE4Q8XhRKVXdiCDJ+DmZxWAqjQBs/uV0Q9PblqrBCYqPyMssa3A91xUmh?=
 =?us-ascii?Q?SQDuxnlkV+V9mCjUT6DJOktlENQ0nxIxOqxLDbGJ8y6muKOv0ckSDTJjjimq?=
 =?us-ascii?Q?0gOBYf2f8jIKIxwOg2vFqPrn/Fywz5UjD47yqVUfqwhnY/BtDSrU/yDWauWE?=
 =?us-ascii?Q?sc+sVtIJaNrddL/RQY4sI2BcWxVRvSHYEOQrQrUligtYG0LRR0Ti4y96EAb0?=
 =?us-ascii?Q?WXc1HjMrqTAVqdr0Bh2GdY2s741PabJ5D/rMi34DUS/5Tej9Jdj9Czc+2EAJ?=
 =?us-ascii?Q?qUrhV+tNHT38C1ZQko3HjehVhayW2yTo14f/p59MW4dfocwCaHd0Ur3G+YHB?=
 =?us-ascii?Q?ToF3cZCgNf4Pp3/hN0Ig4K91kofBEIZtKQqjEzFq61gIcLJeE/9HGqDt/doN?=
 =?us-ascii?Q?QP48rPgfGIEowPZc9DE4xxAj4JaQh9nnJ+ApNjtKeSQqgyfy/NqmEKnT9WCC?=
 =?us-ascii?Q?u392KcLbACxh42V8rSRUHZRjbAeHaMM3yrQVb5/iNBsYNwZDoBU9xGjkGAFr?=
 =?us-ascii?Q?Rb99fxY6s23gYZyMYWAICZ0DjA90D1UOXOgrACjXQH2HuRdSZXCZwCnvGxnd?=
 =?us-ascii?Q?hHEOR4Olq8QwSryGuw7FeF4z44+JA4DcpkOWlRG+qklSxrPMbVu37gD0B5ql?=
 =?us-ascii?Q?EWIJuNgi4fraCaoFaBA7sTkLnoiOWgj+fZNPfNX+MxJJcFqBRGxgwGx1yBGO?=
 =?us-ascii?Q?s01q8Br8es1cQWa+pTv2B0eOWXKxf0y9wyyUmRVhn5T/r5+63r8iYbdnadl+?=
 =?us-ascii?Q?flWP2rpAs5+a8sqWYd04Du6R93MRMgIQRF70QP9X+68jPrQPDO3GtskQN+NB?=
 =?us-ascii?Q?p5AnibxcykeRAqhtRZbXs3jtAKtCeICSb82MTZhMWa4Cn1TJeUfaVxWVl5Xt?=
 =?us-ascii?Q?EUzE6C67zsbjBU/4coBdwwvnzzN4rqS1SYF1tsKYEm63ymEOB6UF71y/V2QS?=
 =?us-ascii?Q?e8BFwXurT5i/NnQQZwBC3Ex66dbZpwf3dbHwhnF/GjsYuSbnJvwddoN/BSJ9?=
 =?us-ascii?Q?YF1NwxyUk7bawpKHHeQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 17:12:55.6241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe36265b-c939-4537-5f11-08de47c6ac91
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8111
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Dec 2025 17:13:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16912

meta-arago / na / 20251230165135.3505628-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH 1/4] cifs-utils: Remove bbappend=
 and patch
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Daniel Parks <danielrparks@ti.com>
- Date: Date: Tue, 30 Dec 2025 10:51:29 -0600
-Date: Fri, 3 Jun 2022 15:34:59 -0500
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 15ce80ba633e011bb50db6f443fed9f23=
d271ff1

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512191404
- Commit SHA: c38be2eb3b16b176476f04572877129f82a0dff4

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




