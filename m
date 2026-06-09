Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549D3CD8CB2
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 17:35:06 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1380.1781026498447065841
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 10:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=lPKPJvTE;
 spf=pass (domain: list.ti.com, ip: 52.101.57.27, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wh7BiFA8cr58Mj99z3WHUtei64vhp2iX7MzMGK4iipOnuBWem78zSi56PPRG5FSqRYvP3/kfA9QMCAcp3gxHWKDPi3su1bDwq91+KRZNzk4GhJETXq/FilojYVZQ+P8h8yrgHgtWxf7pbz6LDJDr898WWzGsEWr9J1biKDHmkNC273nQ6Cl+XVdcXzPM+iytDUdYfqZ661rVoU7nlBjWNE1PDHFKbgA+VYZJ4izZN72MYtslR2Rk0petP6tTaSkpx91csDNd3aRKGPCvST0+mVgiGvXN2vwynl8NRiFgtfQkkkqgSUSUt3vAK8H/VeKWFdBwznhEjB4js7b+XA7gcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZzAMUxsXJOn9nqaBRpWvUhO27hQe8rLKyycitr9nOw=;
 b=hxahncUu8rVZDZhWjwYs4ffvaEBFxVjuoX+icK6Y5TpHWwRYJ7P4ZtDpQhduBCBStVYgEHwM1Oy4XCKkZObYUAES1ZF5gTrpxThECEiCesG8zxRWY2hdwHCCkGfSBxsiUeo8reEgiuJT6MjJb5Bxqzb0i10dslXQph8KhkOxadLNjIYNCTDqx8huFv+7+rRBmC4cHX7CQ0VzYH09s6/I6lS3TAIonli+2Lg9gEg18TvZbk3bR2TpJSEh+Rax9Ktn0Ebppvo7LWQ8JDJu1Msf6jFxz+fNoq3SfzbV4pWz7PxucuVHcKSKzbE/2Qe8RobSbQu/vJXippL8lmub/POUFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZzAMUxsXJOn9nqaBRpWvUhO27hQe8rLKyycitr9nOw=;
 b=lPKPJvTE/DGwPMGBguviVmFJFvsdkLz16Uow9eZY6LAMmHTMhiIYdZJbEtXZbXAGBlcSXsTPceQyMQzvFgqfm+32VT/3ABK5I9DEMCVH7F61y0CjoP07b7aRwy8GRNnLlysBKhcqXhYdmdoh9zXAM5tUpLmSNyza39TWKOjFNPg9rCl4rmzKd9iA43wh5vO30o8CKkUlgIfb8TJovsaMt4twM6k/1mZftMymQce1IYF+UyzQG6LHFgPEX0PZS832bqq1INNs1jRg8qNNaDcxUv0+JLw9TLJAibzng6SjJTDvSAmlzbbRVyTBHLZ3c6Ku4DVNeSNd8PwpoDdMuhMhsg==
Received: from DM6PR02CA0146.namprd02.prod.outlook.com (2603:10b6:5:332::13)
 by CO1PR10MB4516.namprd10.prod.outlook.com (2603:10b6:303:6e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 17:34:52 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::16) by DM6PR02CA0146.outlook.office365.com
 (2603:10b6:5:332::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 17:34:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 17:34:52 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 12:34:51 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 12:34:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 12:34:51 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659HYoIh2115987;
	Tue, 9 Jun 2026 12:34:50 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E2E3E9ACF4; Tue,  9 Jun 2026 12:34:50 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master/wrynose][PATCH v2] meta-arago-distro: chromium: add force-h264-youtube extension
Date: Tue, 9 Jun 2026 12:34:50 -0500
Message-ID: <20260609173450.2012040-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260609171306.238854-1-t-lannynd@ti.com>
References: <20260609171306.238854-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|CO1PR10MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: 34db79aa-4dd2-4191-3dc5-08dec64d69b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	9vILbS91EvQt3xOK7lJSp06zC8joP+eGEwbPuZ0AS6qKyKfvJwJp5qGjYkybE1GEel4DGKFkdKor2Feh3jYjK+FvcStVJFO1VcMF9oM+Z3AySZ70FKThBBhwWg8QS3CPQVgY5Lmdd+fp57JYE8ksdnjwweC+Q2VfENcTo+Pvw3WYJDZZfAtvWjriQ0YNnZNAKCtkYM/b+rWoRMgdx4j32RJCmMyHH1nRokeL5oqiBkpr4Fe4dPG+hrp9RDqTsaXzA00Q1GxSCOAU11D+u90cHTIHbSnjQUat7Ya7xtbgEgkOdTfE37I6jhPkhxCzJzRPfQAKM3nKqxN8x/xTOcUOTapgsDZZZRYCXe72TUAzcLG5YRyQGvIhQAd3cj1LDbS50mo3mdq9JaKZWGU5l4TFxyYzoX6Xw0i/Q7T4CNmz6BWSrV6qgnC/qUlo6zA99PYiwZ05Re2xotKjSHcherEBrqyVDc2OoWOWm/c02GksqakjvCRx2l4Y9E8o2vYiiSGWawaAXgQtBf7fn3W+PpN/FkDMTSxV91YieR2yMkyC3T9EmM/pPs+dDlvO+qAfeeZkU13OOHuZHx7be1yk7/pzl69m+OBbEcm2OD1XyiCLZlUuTt/in8eDStSY1g3mLWGD074R6Ati8hRTGm5uQp1oRffNgmU2ivjgbDyfW+deTTCQUUFICsJoJUXOSn92Pq8O52QnvNn7SqM2LRDgQr9huJuNv7IBI0OPe7L7lPmQWGQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	u2OAUXhf0Ap8Yjir6E3htL/1v1kxRQ1GOcZtj0MF4Ih8F5ErBaVGdFJDaKFEBzYoVQblQYmGGOT0CWkpsRYTFH+DP6oBxPRAWXauMiWUjbK9LlVK8t7i2AH90mH/h3EhowlwgdVzhul5nY97XM9AB0DVxCGbsCLuLeFjvRilBatVwjqNIb96qD7bYT6yVXPAO08FsKzhEgVPSJpkZ7xLGc9QzbropM/kLxgScZXzFjYoLF2QMc5g+S8mGdyFqCIxXDJ9t7AArvVnDvQ53KsJRxVcNN8lIidZ7GFcA3SXW9actNbiGWeeREoX7Wb9eTLdEnffTB8lAVMon4K7YdSzYppBy+76/59Dw9fXuvbtOxw8DnrNgovCDJ8eOa2w3UzLw4jd38zokLOomhbH0/dkBw8Iz/2sMM0feaf5phfldKST8tIsxugWPLUFfqwgmYfm
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 17:34:52.0315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34db79aa-4dd2-4191-3dc5-08dec64d69b1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4516
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Jun 2026 17:35:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17558

meta-arago / na / 20260609171306.238854-1-t-lannynd

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
- Patch Series: [meta-arago][master/wrynose][PATCH v2] meta-arago-distro: c=
hromium: add force-h264-youtube extension
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Tue, 9 Jun 2026 12:13:06 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3a336f51c5b64b7ec7d14666edd42c976=
b8221b4

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: meta-arago: chromium: clean up and simplify V4L2 patch se=
ries
- Commit SHA: 30a611f56a4bd74d421e36ecddf705b956c01648

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH v2] meta-arago-distro: c=
hromium: add force-h264-youtube extension
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Tue, 9 Jun 2026 12:13:06 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3a336f51c5b64b7ec7d14666edd42c976=
b8221b4

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-next
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: meta-arago: chromium: clean up and simplify V4L2 patch se=
ries
- Commit SHA: 0e97f60a272300075fe2dcb4190873b19c32663c

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

wrynose
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

wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




